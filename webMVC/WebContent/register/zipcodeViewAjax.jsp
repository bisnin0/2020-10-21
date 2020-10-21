 <!-- ${zipList}에있는 vo하나를 꺼내서 var=vo에 담는 작업을 반복하는것. -->
 <!-- getter setter안써도 jsp에서는 변수명만써주면 자동으로 해준다. 단, vo에 getter setter는 있어야한다.-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="vo" items="${zipList }">
	<li>${vo.zipcode } ${vo.sido } ${vo.sigungu } ${vo.um } ${vo.doro } ${vo.b_num1 }-${vo.b_num2 } (${vo.dong }, ${vo.building })</li>

</c:forEach>