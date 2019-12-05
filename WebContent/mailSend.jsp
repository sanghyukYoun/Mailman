﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Mail Send</title>
<link rel="stylesheet" href="css/mail2.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=cp%>/mail/data/mail.js"></script>
</head>
<script type="text/javascript">


	function mailSend() {
		document.myForm.submit();
	}
	
	// 메일수신자선택 팝업창 오픈
    function openMailList()
    {
        window.name = "parentForm";
        openWin = window.open("mail_list.jsp", "childForm", "width=1150, height=700, resizable = no, scrollbars = no");    
    }	
</script>
<body onload="document.myForm.sendName.focus();">

<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="HP/HP_main.jsp"><img src="images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>

<br><br><br><br><br><br>
	<form action="MailSend_ok.jsp" name="myForm" method="post" enctype="multipart/form-data">
		<table width="600" border="1" cellpadding="3" cellspacing="0" align="center" bordercolor="BDBDBD">
			<tr bgcolor="#999999">
				<td colspan="2" height="3" bgcolor="#D8D8D8"><font color="white">새 메일</font></td>
			</tr>
			<tr>
				<td colspan="2" height="1"><input type="button" value="메일 수신 대상자 추천" class="btn2" bgcolor="#332f2f" color="#ffffff" onClick="openMailList();" /></td>
			</tr>
			<tr>
				<td colspan="2" height="1"><input type="text" value="보내는 사람 이름" onfocus="this.value=''" color="#332f2f" name="sendarName" size="75" maxlength="50" style="border-style: none; color: #BDBDBD;" class="boxTF"></td>
			</tr>
			<tr>
				<td colspan="2" height="1"><input type="text" value="보내는 사람 이메일" onfocus="this.value=''" color="#332f2f" name="senderEmail" size="75" maxlength="50" style="border-style: none; color: #BDBDBD;" class="boxTF"></td>
			</tr>
			<tr>
				<td colspan="2" height="1"><input type="text" value="받는 사람 이메일" onfocus="this.value=''" color="#332f2f" name="toAddr" id="toAddr" size="75" maxlength="1000" style="border-style: none; color: #BDBDBD;" class="boxTF">
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#ffffff"><input type="text" value="제목" onfocus="this.value=''" color="#332f2f" name="subject" size="85" maxlength="100" style="border-style: none; color: #BDBDBD;" class="boxTF"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="ffffff" color="#BDBDBD"><textarea rows="20" cols="62" name="content" style="border-style: none; width: 662px" class="boxTA"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="#ffffff" color="#BDBDBD"><font color="#848484">&nbsp;첨부파일</font>&nbsp;&nbsp;
					<input type="file" name="fileName" maxlength="100" size="50" class="boxTF" /style="padding-right: 170px;" />
					<input type="button" value="전송하기" class="btn2" bgcolor="#BDBDBD" color="#ffffff" onclick="mailSend();" /> 
					<input type="reset" value="수정하기" class="btn2" bgcolor="#BDBDBD" onclick="document.myForm.senderName.focus();" />
				</td>
			</tr>
		</table>

	</form>
	<br><br><br>
<footer>


  <div class="container footer-container">

	<p class="footer-copyright">

		easymail.com

		</p>

	</div>


</footer>
</body>
</html>