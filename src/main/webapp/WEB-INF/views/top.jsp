<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/main.css">
</head>
<style>
   nav{
        width:1024px;
        height:30px;
        background-color: bisque;
        display: inline-block;
      /*  border: 5px solid;*/
       	padding: 0px 0px 0px 0px ;
        Box-sizing:border-box;
    }
    nav > ul {
    	/*border: 5px solid;*/
    	margin-top: 2px;
        list-style:none;
    }
    nav > ul > li{
        display: inline-block;
    }
    nav > ul > li > a{
        text-decoration-line: none;
    }
    nav > ul > li > a:hover{
        text-decoration-line: none;
        background-color: cadetblue;
    }
    nav > ul > li > a:visit{
        text-decoration-line: none;
        background-color: cadetblue;
    }

</style>
<body>
	<div id="titleDV">Kim Teacher HomePage</div>
	<div id="logininfo">
		<!--<sec:authorize access="isAnonymous()">			
				<a href='<c:url value="loginPage"/>'>LOGIN</a> 로그인 해주세요.			
		</sec:authorize>-->

		<!--
		<c:if test="${session_userid != null }">
			Login user : ${session_userid} 님 로그인 
			<a href="logout">[로그아웃]</a>
		</c:if>
  -->
		<c:choose>
			<c:when test="${session_userid != null }"> 
				Login user : ${session_userid} 님 로그인 
				<a href="logout">[로그아웃]</a>
			</c:when>
			<c:otherwise> [로그인하세요] </c:otherwise>
		</c:choose>
	</div>

	<header> 스프링게시판1</header>

	<nav>
		<ul>
			<li><a href="/cafe/">[home]</a></li>
			<li><a href="wrForm">[Write]</a></li>
			<li><a href="bbsList">[BBSList]</a></li>
		</ul>
	</nav>


</body>
</html>
