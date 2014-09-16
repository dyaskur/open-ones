<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- <script type="text/javascript" src="resources/js/validateFunction.js"></script> -->
<!--    Leave -->
<div id="make-leave">
  <form:form id="createLeave" class="horizontal" enctype="multipart/form-data" action="saveRequest" modelAttribute="model" method="POST">
    <input id="requestTypeCd" name="requestTypeCd" type="hidden" value="Leave"/>
    <form:hidden path="requestId"/>
        <div>
          <label for="title" class="col_2">Tiêu đề</label>
          <form:input path="title" id="title" type="text" required="required" class="col_8"/>
        </div>
        <div>
            <label for="content" class="col_2">Lý do</label>
            <form:textarea path="content" id="content" style="display:inline; position: relative; top:6px; left:10px;" cols="100" name="leaveContent" rows="15" placeholder="Mô tả chi tiết lý do và sắp xếp công việc đảm bảo không ảnh hưởng"></form:textarea>
        </div>
        <div>
          <input name="leaveCreate" type="hidden" class="col_8" value="${pageContext.request.userPrincipal.name}"/>
        </div>	
        <div>
		 	<label for="managerAccount" class="col_2">Quản lý</label>
		 	<form:select path="managerAccount" class="col_3"  title="Người sẽ nhận đơn và duyệt nghỉ phép">
         		<option value="0">-- Chọn --</option>
         		<c:forEach var="user" items="${listUser}">
                  <c:choose>
                    <c:when test="${managerAccount == user.username}">
                        <option value="${user.username}" selected="selected">${user.username}</option>
                    </c:when>
                    <c:otherwise>
                      <c:if test="${user.username != pageContext.request.userPrincipal.name}">
                        <option value="${user.username}">${user.username}</option>
                      </c:if>
                    </c:otherwise>
                  </c:choose>
         			
         		</c:forEach>
	  		</form:select>        
		</div>
        <div>
            <label for="startDate" class="col_2">Ngày bắt đầu</label>
            <form:input path="startDate" id="request_startdate_leave" class="col_2"/>
        </div>
        <div>
            <label for="endDate" class="col_2">Ngày kết thúc</label>
            <form:input path="endDate" id="request_enddate_leave" class="col_2"/>
        </div>
        <div>
            <label for="listLabel" class="col_2">Nhãn</label>
            <form:input path="listLabel" type="text" class="col_8"/>
        </div>
        <div>
          <label for="attachment1" class="col_2">Đính kèm</label>
          <input name="attachments[0]" type="file" class="col_8"/>
        </div>
      	<div>
      		<input type="submit" value="Save" class="button"/>
         <input type="reset" value="Reset" class="button" />
      	</div>
  </form:form>
</div>