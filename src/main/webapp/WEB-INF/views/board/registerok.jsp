
<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<script>
		var result = '${msg}';
		if (result == 'SUCCESS') {
			alert("regist OK~.");
		}
	</script>
</body>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</html>