<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<form role="form" method="post" action="registerok">
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputTitle1">TITLE</label> <input type="text"
					name="title" class="form-control" placeholder="Enter title">
			</div>
			<div class="form-group">
				<label for="exampleInputContents1">CONTENTS</label>
				<textarea class="form-control" name="contents" rows="3"
					placeholder="Enter contents"></textarea>
			</div>
			<div class="form-group">
				<label for="exampleInputUserId1">USERID</label> <input type="text"
					name='userId' class="form-control" placeholder="Enter userId">
			</div>
			<div class="form-group">
				<label for="exampleInputsiteNumber1">SITENUMBER</label> <input
					type="text" name='siteNumber' class="form-control"
					placeholder="Enter siteNumber">
			</div>
			<!-- <div class="form-group">
				<label for="exampleInputbno1">BNO</label> <input type="text"
					name="bno" class="form-control" placeholder="Enter bno" readonly="readonly">
			</div> -->
			<!-- /.box-body -->
			<button type="submit" class="btnbtn-primary" name="btn">Regist</button>

		</div>
	</form>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>
