<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" href="css/mail.css" type="text/css" media="screen" />
</head>

<body>
	<div align="center">
	<H2>대상자 추천 오류</H2>
	<HR>
	<table>
		<tr>
			<td>
				홍보 대상자 추천 목록 처리중 에러가 발생 했습니다.<BR>
				관리자에게 문의해 주세요..<BR>
				빠른시일내 복구하겠습니다.<BR>
				<HR>
				에러내용 : <%= exception%>
				<HR>
			</td>
		</tr>
	</table>
	<br>
	<input type="button" value="되돌아가기" onclick="history.back();"> <input type="button" value="닫기" onclick="self.close();">
	</div>
</body>
</html>