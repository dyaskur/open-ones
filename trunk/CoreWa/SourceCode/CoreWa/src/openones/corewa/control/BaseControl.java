/*
 * BaseControl.java 0.1 June 30, 2010
 * 
 * Copyright (c) 2010, LunarCal4U
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package openones.corewa.control;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import openones.corewa.form.BaseForm;
import rocky.common.BeanUtil;

public class BaseControl {
    final static Logger LOG = Logger.getLogger("BaseControl");

    
    public void procInit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LOG.log(Level.INFO, "procInit.START");
        LOG.log(Level.INFO, "procInit.END");
    }
    

    /**
     * Get data from web request to form bean.
     * @param req
     * @param clazz
     * @return
     */
    protected BaseForm getData(HttpServletRequest req, Class clazz) {
        LOG.fine("getData.START");
        Object bean = null;
        
        try {
           bean = clazz.newInstance();
           // 1. Get all method setters
           Map<String, Method> beanSetterMap = BeanUtil.getWriteMethodMap(bean);
           
           // Scan all property
           Object value;
           Method method;
           for (String propName : beanSetterMap.keySet()) {
               // get value from the request basing property
               value = req.getParameter(propName);
               if (value == null) {
                   value = req.getAttribute(propName);
               }
                if (value != null) {
                    method = beanSetterMap.get(propName);
                    // Call method setter of property
                    LOG.fine("Set " + propName + "=" + value);
                    method.invoke(bean, value);
                }
           }
        } catch (Exception ex) {
            LOG.log(Level.FINE, "Get data form web request to form bean", ex);
        }
        LOG.fine("getData.END");
        
        return (BaseForm) bean;
    }
    
}