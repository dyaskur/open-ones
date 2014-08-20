<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<script type="text/javascript" src="resources/ckeditor-3.6.6.1/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/createRequest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/chosen/chosen.min.css" />
<link type="text/css" href="resources/jquery-ui/1.9.2/themes/base/jquery.ui.datepicker.css" rel="stylesheet">
<script type="text/javascript" src="resources/jquery/1.9.1/jquery-1.9.1.js"></script>
<script type="text/javascript" src="resources/jquery-ui/1.9.2/ui/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="resources/js/validateFunction.js"></script>
<script>
	$(function() {

	});

  $(function() {
      $("#request.startdate").datepicker({dateFormat: 'dd-mm-yy'});
      $("#request.enddate").datepicker({dateFormat: 'dd-mm-yy'});
  });
	  
</script>
  <div>
  <label for="request.requesttypeCd" class="col_2">Loại yêu cầu</label>
  
<%--        <form:select path="request.requesttypeCd"  id="reqType" class="col_3" name="reqType" onchange="displayDetailedRequest('createRule');"> --%>
      <select id="reqType" class="col_3" name="reqType">
         <option value="0">-- Lựa chọn --</option>
         <c:forEach var="reqType" items="${lstReqTypes}">
           <c:choose>
             <c:when test='${reqType.cd == model.request.requesttypeCd}'>
               <option value="${reqType.cd}" selected="selected">${reqType.name}</option>
             </c:when>
             <c:otherwise>
               <option value="${reqType.cd}">${reqType.name}</option>
             </c:otherwise>
           </c:choose>
         </c:forEach>
      </select>
</div>      
	<!-- 	Announcement -->
	   <jsp:include page="_createAnnouncement.jsp"></jsp:include>
	<!--    Rule -->
	    <jsp:include page="_createRule.jsp"></jsp:include>
	<!-- 	Task -->
	    <jsp:include page="_createTask.jsp"></jsp:include>  
	<!--    Leave -->
	    <jsp:include page="_createLeave.jsp"></jsp:include>