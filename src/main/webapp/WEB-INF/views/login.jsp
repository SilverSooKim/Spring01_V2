<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="loginDV">
		<form id="loginFrm" action="login" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" id="id" name="id"/></td>
				</tr>
				<tr>
					<td>PASS</td>
					<td><input type="passowrd" id="pass" name="pass"/></td>
				</tr>
				<tr>
					<td colspan=2><input type="submit" value="로그인"/> <input
						type="button" value="신규가입1">
						<input name="${_csrf.parameterName}" type="hidden" value="${_crsf.token}"></td>

				</tr>

			</table>
		</form>
	</div>
</body>
</html>