<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<table class="table table-boardered">
	<tr>
		<th class="col-sm-1">BNO</th>
		<th class="col-sm-2">TITLE</th>
		<th class="col-sm-4">CONTENTS</th>
		<th class="col-sm-1">WRITER</th>
		<th class="col-sm-1">SITENUMBER</th>
		<th class="col-sm-3">SITELINK</th>


		<c:forEach items="${list}" var="boardVO">
			
			<tr>
				<td>${boardVO.bno}</td>
				<td><a href="/board/readPage?bno=${boardVO.bno}&page=${criteria.page}&perPageNum=${criteria.perPageNum}">${boardVO.title}</a></td>
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

<div class="text-center">
	<ul class="pagination">

		<c:if test="${pageMaker.prev }">
			<li><a
				href="listPage${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a>
			</li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}"
			var="idx">
			<li <c:out value="${pageMaker.cri.page==idx?'class =active':''}"/>>
				<a href="listPage${pageMaker.makeQuery(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage> 0 }">
			<li><a
				href="listPage${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
		</c:if>
	</ul>

	<%-- <c:forEach items="${list}" var="boardVO">
		<tr>
			<td>${boardVO.bno}</td>
			<td><a href="/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVO.bno }">${boardVO.title }</a></td>
			<td>${boardVO.userId }</td>
		</tr>
	</c:forEach> --%>
</div>



</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>