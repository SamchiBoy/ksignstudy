<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table class="table table-boardered">
	<tr>
		<th>BNO</th>
		<th>TITLE</th>
		<th>CONTENTS</th>
		<th>WRITER</th>
		<th>SITENUMBER</th>
		<th>SITELINK</th>


		<c:forEach items="${list}" var="boardVO">
			<!-- ${boardVO} -->
			<tr>
				<td>${boardVO.bno}</td>
				<td><a href="/board/read?bno=${boardVO.bno}">${boardVO.title}</a></td>
				<td>${boardVO.contents}</td>
				<td>${boardVO.userId}</td>
				<td>${boardVO.siteNumber}</td>
				<td>${boardVO.siteLink}</td>

			</tr>
		</c:forEach>
</table>


<form action="/board/register">
	<div class="box-body">
		<button type="submit" class="btn btn-primary">registerPAGE</button>
	</div>
</form>


</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>