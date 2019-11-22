<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page errorPage="board_error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>


<html>

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>이지메일 문의하기</title>

	<link rel="stylesheet" href="../css/mail3.css" type="text/css" media="screen" />

	<script type="text/javascript">
		function retrivalcheck() {
			

			document.form1.action.value="list";
			document.form1.submit();
	
			
		}
	
		function readcheck(id) {
		

			document.form1.action.value="read";
			document.form1.id.value=id;
			document.form1.submit();
	
			
		}
		
		function add() {
			

			document.form1.action.value="add";
			document.form1.submit();
	
			
		}
	</script>

</head>


<body>
<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="../HP/HP_main.jsp"><img src="../images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>

	<div align=center>
	<H2>문의하기</H2><br>
	<div class="h">

	<form name="form1" method="post" action="BoardController">
		<input type="hidden" name="action" value="list">
		<input type="hidden" name="id" value=0>
	
		<table class="bbsListTbl">
		
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
						<c:forEach var="i" items="${boardList}">
						<tr>
							<td class="tit_notice"><a href="javascript:readcheck(${i.id})">${i.id}</td>
							<td class="tit_notice">${i.title}</a></td>
							<td class="tit_notice">${i.user}</td>
							<td class="tit_notice">${i.date}</td>
						</tr>
						</c:forEach>
			<tr>
				<td colspan=4 align=right>
				<a href="javascript:retrivalcheck()"><button class="fun-btn" type="button" >조회</button></a>
				<a href="javascript:add()"><button class="fun-btn" type="button" >글작성</button></a>
				</td>
			</tr>
			</table>
		</form>
	</div>
	<div class="he">
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