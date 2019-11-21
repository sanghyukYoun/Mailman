<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>이지메일 문의하기</title>
	<link rel="stylesheet" href="../css/mail3.css" type="text/css" media="screen" />
</head>

<body>

<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="../HP/HP_main.jsp"><img src="../images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>
	<div align="center">
	<H2>게시판 오류</H2>
	<HR>
	<table>
		<tr>
			<td>
				게시판 처리중 에러가 발생 했습니다.<BR>
				관리자에게 문의해 주세요..<BR>
				빠른시일내 복구하겠습니다.<BR>
				<HR>
				에러내용 : <%= exception%>
				<HR>
			</td>
		</tr>
	</table>
	</div>
	<footer>


  <div class="container footer-container">

	<p class="footer-copyright">

		easymail.com

		</p>

	</div>


</footer>
</body>
</html>