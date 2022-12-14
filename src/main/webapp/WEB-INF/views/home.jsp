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


		<c:choose>
			<c:when test="${session_userid != null }"> 
				<div id="loginInfohome">
					${session_userid} 님 로그인 <br>
					<a href="logout">[로그아웃]</a>				
				</div>				
			</c:when>
			<c:otherwise>
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
								name="${_csrf.parameterName}" type="hidden"
								value="${_crsf.token}"></td>
						</tr>
					</table>
				</form>
			</c:otherwise>
		</c:choose>

	</div>
	<div id="zzz">
		<table id="tbl">
			<tbody>
				<tr>
					<td colspan=2 align=center>실시간검색어</td>
				</tr>
			</tbody>
		</table>
	</div>
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
			for (let i = 0; i < data.length; i++) {
				console.log(data[i][0] + "/" + data[i][1]);
				var innerHtml = "";
				innerHtml += '<tr>';
				innerHtml += '    <td>' + data[i][0] + '</td>';
				innerHtml += '    <td>' + data[i][1] + '</td>';
				innerHtml += '</tr>';
				$('#tbl > tbody').append(innerHtml);
			}
		},
		error : function(xhr) {
			console.log('실패 - ', xhr);
		}
	});

	$.ajax({
		type : "GET",
		url : "http://openapi.seoul.go.kr:8088/6d4d776b466c656533356a4b4b5872/json/RealtimeCityAir/1/99",
		data : {},
		success : function(response) {
			//console.log(typeof (response));
			let mise_list = response["RealtimeCityAir"]["row"];
			//console.log(response["RealtimeCityAir"]["row"]);
			for (let i = 0; i < mise_list.length; i++) {
				let mise = mise_list[i];
				let gu_name = mise["MSRSTE_NM"];
				let gu_mise = mise["IDEX_MVL"];
				console.log(gu_name, gu_mise);
						//	var innerHtml = "";
						//	innerHtml += '<tr>';
						//	innerHtml += '    <td>' + gu_name + '</td>';
						//	innerHtml += '    <td>' + gu_mise + '</td>';
						//	innerHtml += '</tr>';
						//	$('#tbl > tbody').append(innerHtml);
			}
		}
	});
</script>
</html>