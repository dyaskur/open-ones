<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script>
$(function() {
	$("#addComment").click(function(){
		
	});
});
</script>
<ul class="button-bar" style="position: relative; left: 3%;">
	<li><a href=""><i class="icon-edit"></i> Sửa</a></li>
	<li><a href=""><i class="icon-comment"></i> Comment</a></li>
	<li><a href=""><i class="icon-pushpin"></i> Giao việc</a></li>
	<li><a href=""><i class="icon-tasks"></i>Thực hiện</a></li>
	<li><a href=""><i class="icon-check"></i>Kết thúc</a></li>
</ul>
<form action="saveComment">
	<input type="hidden" name="requestId" value=${requestId}>
	<div style="position:relative; top:10px;">
		<label for="content" class="col_2 left">Comment:</label>
		<br>
		<textarea name="comment.content" id="content" style="display:inline; position: relative; top:6px; left:10px;" cols="100" rows="15" placeholder=""></textarea>
	</div>
	<div style="position:relative; top:40px; left: 3%">
		<input type="submit" value="Add">
<!-- 		<a class="button" id="addComment">Add</a> -->
		<a class="button" href="browseRequest.html?id=${requestId}">Cancel </a>
	</div>
</form>