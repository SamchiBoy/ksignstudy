<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form role="form" method="post">

		<div class="box-body">

			<div class="form-group">
				<label for="exampleInputEmail1">BNO</label> <input type="text"
					name="bno" class="form-control" value="${boardVO.bno}"
					readonly="readonly">

			</div>
			<div class="form-group">
				<label for="exampleInputEmail1">Title</label> <input type="text"
					name="title" class="form-control" value="${boardVO.title}">
			</div>

			<div class="form-group">
				<label for="exampleInputPassword1">Contents</label>
				<textarea class="form-control" name="contents" rows="3">${boardVO.contents}</textarea>
			</div>

			<div class="form-group">
				<label for="exampleInputEmail1">userId</label> <input type="text"
					name="userId" class="form-control"
					value="${boardVO.userId}" readonly="readonly">
			</div>
		</div>
	</form>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">SAVE</button>
		<button type="submit" class="btn btn-warning">CANCEL</button>
	</div>

	<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-warning").on("click",function() {
			history.back();
		});
		
		$(".btn-primary").on("click", function() {
			
			formObj.submit();
		});
	});
	</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>