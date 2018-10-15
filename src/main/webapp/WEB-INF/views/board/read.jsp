
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<form role="form" method="post">
		<input type="hidden" name="bno" value="${boardVO.bno}">
	</form>

	<div class="box-body">

		<div class="form-group">
			<label for="exampleInputEmail1">Title</label> <input type="text"
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
	<div class="box-footer" style="background-color:#ecf0f5">

		<div class="row">
		<div class="col-sm-1"></div>
			<div class="btn-gruop" >
				<!-- <a href="/board/modify?bno=${boardVO.bno}">MODIFY(href OK)</a>-->
				<button type="button" onClick="javascript:change('mod2')" class="btn btn-info">MODIFY(Button
					OK)</button>
				<button type="button" onClick="javascript:change('remove')" class="btn btn-danger">REMOVE(button
					OK)</button>
					
				<!-- <a href="/board/remove?bno=${boardVO.bno}">REMOVE(href OK)</a> -->
				<button type="button" onClick="javascript:change('listPage')" class="btn btn-info">LIST PAGE</button>
				
			</div>
			
		</div>
<!-- 
		made by KHK
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="btn-group">
				<button type="button" onClick="javascript:move('mod')"
					class="btn btn-info">MODIFY(Script OK)</button>
				<button type="button" onClick="javascript:move('remove')"
					class="btn btn-info">remove</button>
				<button type="button" onClick="javascript:move('list')"
					class="btn btn-info">listAll</button>
			</div>
		</div> -->
 
	</div>

	<script type="text/javascript">
		var bno = '${boardVO.bno}';

		var listPage = '/board/listPage';
		var remove = '/board/remove?bno=' + bno;
		var modify = '/board/modify?bno=' + bno;

		function change(target2) {
			var u2 = '';

			if (target2 == 'mod2') {
				u2 = modify;
				$("input[name='title']").removeAttr("readOnly");
				$("textarea[name='contents']").removeAttr("readOnly");
				return;
			} else if (target2 == 'remove') {
				u2 = remove;
			} else if (target2 == 'listPage') {
				u2 = listPage;
			}

			document.location.href = u2;
		}

		
		/* 
		  function move(target) {
			var u = '';
			if (target == 'mod') {
				u = modify;
				$("input[name='title']").removeAttr("readOnly");
				$("textarea[name='contents']").removeAttr("readOnly");

				return;
			} else if (target == 'remove') {
				u = remove;
			} else if (target == 'list') {
				u = listAll;
			} else {
				u = listAll;
			}

			document.location.href = u;
		}   */

		function modify() {
			document.location.href = "/board/modify?bno=${boardVO.bno}";
		}
	</script>



<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>