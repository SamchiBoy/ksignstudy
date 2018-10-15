<%@ include file="/WEB-INF/views/include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>


<div class='box-body'>

	<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType=null?'selected':''}"/>>---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't' ? 'selected':''}"/>>Title
		</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c' ? 'selected':''}"/>>Contents
		</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w' ? 'selected':''}"/>>Writer
		</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc' ? 'selected':''}"/>>Title
			OR Contents</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw' ? 'selected':''}"/>>Contents
			OR Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw' ? 'selected':''}"/>>Title
			OR Contents OR Writer</option>
	</select> <input type="text" name='keyword' id="keywordInput"
		value='${cri.keyword}'>
	<button id='searchBtn'>Search</button>
	<button id='newBtn'>New Board</button>

</div>

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
				<td><a
					href="/sboard/readPage?{pageMaker.makeSearch(pagemaker.cri.page)}&bno=${boardVO.bno}">${boardVO.title}</a></td>
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
			<li><a href="list${pageMaker.makeQuery(pageMaker.startPage-1) }">&laquo;</a>
			</li>
		</c:if>

		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}"
			var="idx">
			<li <c:out value="${pageMaker.cri.page==idx?'class =active':''}"/>>
				<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next && pageMaker.endPage> 0 }">
			<li><a href="list${pageMaker.makeQuery(pageMaker.endPage+1)}">&raquo;</a></li>
		</c:if>
	</ul>


</div>

<script>

$(document).ready(
		function(){
			$('#searchBtn').on("click",
			function(event){
				self.location="list"+'${pageMaker.makeQuery(1)}'
				+"&searchType="
				+$("select option:selected").val()
				+"$keyword="+encodeURIComponent($('#keywordInput').val());
				
			});
			$('#newBtn').on("click",function(evt){
				self.location="register";
			});
		});
</script>



</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>