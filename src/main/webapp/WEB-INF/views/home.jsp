<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>
	<section>dff</section>
	<div id="loginDV">
		<form id="loginFrm" action="login" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="id" name="id" /></td>
				</tr>
				<tr>
					<td>PASS</td>
					<td><input type="passowrd" id="pass" name="pass" /></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="로그인" /> <input
						type="button" value="신규가입"> <input
						name="${_csrf.parameterName}" type="hidden" value="${_crsf.token}"></td>

				</tr>

			</table>
		</form>
	</div>
	<div id="zzz">dd</div>
</body>
<script type="text/javascript">
var getData;
	$.ajax({
		type : 'GET',
		url : "top10/js",
		dataType : "json",
		success : function(data) {
			console.log('성공 - ', data);
			getData = data;			
			for(let i=0; i<data.length; i++){
				console.log(data[i][0]+"/"+data[i][1]);
			}
		},
		error : function(xhr) {
			console.log('실패 - ', xhr);
		}
	})
</script>
</html>