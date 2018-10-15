<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form role="form" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno}">
	</form>

	<div class="box-body">
		
		<div class="form-group">
			<label for="exampleInputEmail1">Title</label>
			<input type="text"
				name="title" class="form-control" value="${boardVO.title}"
				readonly="readonly">
			
		</div>

		<div class="form-group">
			<label for="exampleInputPassword1">Contents</label>
			<textarea class="form-control" name="contents" rows="3"
				readonly="readonly">${boardVO.contents}</textarea>
		</div>

		<div class="form-group">
			<label for="exampleInputEmail1">Writer</label> <input type="text"
				name="writer" class="form-control" value="${boardVO.userId}"
				readonly="readonly">
		</div>
		
	</div>

	<!-- /.box-body -->
	<div class="box-footer">
		<form method="GET" action="/board/modify">
			<input type=hidden name="bno" value="${boardVO.bno}">
			<button type="button" onClick="javascript:modify()"
				class="btn btn-warning">MODIFY(Script OK)</button>
			<!-- <a href="/board/modify?bno=${boardVO.bno}">MODIFY(href OK)</a>--> <!-- herf can -->
			<button type="submit" class="btn btn-warning">MODIFY(Button
				OK)</button>
		</form>

		<form role="form" action="/board/remove">
			<input type="hidden" name="bno" value="${boardVO.bno}">
			<button type="submit" class="btn btn-danger">REMOVE(button OK)</button>
			
			<!-- <a href="/board/remove?bno=${boardVO.bno}">REMOVE(href OK)</a> --><!-- herf can -->

		</form>
		
		<form role="form" action="/board/listAll">
			<button type="submit" class="btn btn-primary">LIST ALL</button>
		</form>
		
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="btn-group">
		          <button type="button" onClick="javascript:move('mod')" class="btn btn-info">MODIFY(Script OK)</button>
                     <button type="button" onClick="javascript:move('remove')" class="btn btn-info">remove</button>
                     <button type="button" onClick="javascript:move('list')" class="btn btn-info">listall</button>
            </div>
		</div>

	</div>

	<script type="text/javascript">
		var bno = '${boardVO.bno}';
		
		var listAll = '/board/listAll';
		var remove = '/board/remove?bno=' + bno;
		var modify = '/board/modify?bno=' + bno;
		
		function move(target) {
			var u = '';
			if(target == 'mod') {
				u = modify;
				$("input[name='title']").removeAttr("readOnly");
				$("textarea[name='contents']").removeAttr("readOnly");
				return;
			} else if(target == 'remove') {
				u = remove;
			} else if(target == 'list') {
				u = listAll;
			} else {
				u = listAll;
			}
			
			document.location.href = u;
		}
		
		function modify() {
			document.location.href = "/board/modify?bno=${boardVO.bno}";
		}
	</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>