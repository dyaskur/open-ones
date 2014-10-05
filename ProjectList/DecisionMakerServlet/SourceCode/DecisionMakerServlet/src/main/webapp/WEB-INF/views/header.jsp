﻿<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<c:set var="DATE_FORMAT" scope="application"><s:message code="DATE_FORMAT"/></c:set>

<!-- Menu Horizontal -->
<c:if test="${request.createdbyUsername == pageContext.request.userPrincipal.name}">

<script type="text/javascript">
$(document).ready(function () {
	$.ajax({
	    url: "response.request.count",
	    dataType: 'json',
	    type: 'GET',
	    success: function (res) {
	    	if (res.countResponseRequest > 0) {
	    		$("#countResponse").html("<a class='button blue small' href='listSendRequest' >" + res.countResponseRequest + " New Response </a>");
	    	}
	    	else {
	    		$("#countResponse").html();
	    	}
	    },
	    fail: function() {
	    	alert("FAIL");
	    }
    });
	
	$.ajax({
	    url: "request.count",
	    dataType: 'json',
	    type: 'GET',
	    success: function (res) {
	    	if (res.countRequest > 0) {
	    		$("#countRequest").html("<a class='button red small' href='listReceiveRequest' >" + res.countRequest + " New Request </a>");
	    	}
	    	else {
	    		$("#countRequest").html("");
	    	}
	    },
	    fail: function() {
	    	alert("FAIL");
	    }
    });
	
	setInterval(function(){ 
		$.ajax({
		    url: "response.request.count",
		    dataType: 'json',
		    type: 'GET',
		    success: function (res) {
		    	if (res.countResponseRequest > 0) {
		    		$("#countResponse").html("<a class='button blue small' href='listSendRequest' >" + res.countResponseRequest + " New Response </a>");
		    	}
		    	else {
		    		$("#countResponse").html();
		    	}
		    },
		    fail: function() {
		    	alert("FAIL");
		    }
	    });
	}, 90000);
	
	setInterval(function(){ 
		$.ajax({
		    url: "response.request.count",
		    dataType: 'json',
		    type: 'GET',
		    success: function (res) {
		    	if (res.countResponseRequest > 0) {
		    		$("#countResponse").html("<a class='button blue small' href='listSendRequest' >" + res.countResponseRequest + " New Response </a>");
		    	}
		    	else {
		    		$("#countResponse").html();
		    	}
		    },
		    fail: function() {
		    	alert("FAIL");
		    }
	    });
	}, 90000);
});
</script>

</c:if>
<ul class="menu">
	<c:choose>
		<c:when test="${current == 'home'}">
			<li class="current"><a href="home"><i class="icon-home"></i>Trang chủ</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="home"><i class="icon-home"></i>Trang chủ</a></li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${current == 'listAnnouncement'}">
			<li class="current"><a href="listAnnouncement"><i class="icon-bullhorn"></i>Thông báo</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="listAnnouncement"><i class="icon-bullhorn"></i>Thông báo</a></li>
		</c:otherwise>
	</c:choose>
  	<c:choose>
		<c:when test="${current == 'listRule'}">
			<li class="current"><a href="listRule"><i class="icon-legal"></i>Quy định</a></li>
		</c:when>
		<c:otherwise>
			<li><a href="listRule"><i class="icon-legal"></i>Quy định</a></li>
		</c:otherwise>
	</c:choose>
	<li><a href="#"><i class="icon-eye-open"></i>Công việc</a>
	  	<ul>
	      <li><a href="createRequest?model.request.requesttypeCd=Task"><i class="icon-magic"></i>Tạo việc mới</a></li>
	      <li><a href="searchRequest?requestTypeCd=Task"><i class="icon-search"></i>Tìm công việc</a></li>
	      <li class="divider"><a href="searchMyOpenRequest"><i class="icon-beer"></i>Việc đang làm của tôi</a></li>
	  	</ul>
      </li>
	<li><a href=""  onclick="return false"><i class="icon-magic"></i>Quản lý yêu cầu</a>
		<ul>
			<li><a href="createRequest" ><i class="icon-edit"></i>Tạo mới yêu cầu</a>
			<li><a href="searchRequest" ><i class="icon-search"></i>Tìm kiếm yêu cầu</a>
				<li>
					<a href=""  onclick="return false"><i class="icon-edit"></i>Danh sách yêu cầu</a>
					<ul>
						<li class="left"><a href="listSendRequest"><i class="icon-envelope"></i>Yêu cầu của bạn</a></li>
						<li class="left"><a href="listReceiveRequest"><i class="icon-envelope-alt"></i>Yêu cầu được nhận</a></li>
					</ul>
				</li>
		</ul>
	</li>
	<li style="display: inline-block;" id="countRequest"></li>
	  <li style="display: inline-block; margin-left:10px;" id="countResponse"></li>
	  <li class="right" style="display: inline-block;"><a href="#"><i class="icon-user"></i>${pageContext.request.userPrincipal.name}</a>
	    <ul>
	      <li class="left"><a href="j_spring_security_logout"><i class="icon-coffee"></i>Thoát</a></li>
	    </ul>
	  </li>
	  <sec:authorize access="hasRole('ROLE_MANAGER')">
	  
	    <li class="right" style="display: inline-block;"><a href=""><i class="icon-cog"></i>Quản trị</a>
	    <ul>
	      <li class="left"><a href="listLeaveRequest"><i class="icon-desktop"></i>Quản lý đơn nghỉ phép</a></li>
	    </ul>
	  </li>
	  </sec:authorize>
	  <%-- For Admin.START --%>
	  <sec:authorize access="hasRole('ROLE_ADMIN')">
	  
	    <li class="right" style="display: inline-block;"><a href=""><i class="icon-cog"></i>Cấu hình</a>
	    <ul>
	      <li class="left"><a href="master.department"><i class="icon-sitemap"></i>Phòng ban</a></li>
	      <li class="left"><a href="master.template"><i class="icon-bookmark-empty"></i>Biểu mẫu</a></li>
	      <li class="left"><a href="listLeaveRequest"><i class="icon-desktop"></i>Quản lý đơn nghỉ phép</a></li>
	    </ul>
	  </li>
	  </sec:authorize>
  <%-- For Admin.END --%>
</ul>

<!-- End #header -->