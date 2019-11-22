<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page errorPage="board_error.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>


	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>이지메일 문의하기</title>
	<link rel="stylesheet" href="../css/mail3.css" type="text/css" media="screen" />

	<script type="text/javascript">

	function editcheck(id) {
		

		document.form1.action.value="edit";
		document.form1.id.value=id;
		document.form1.submit();

		
	}
	
function listcheck() {
		

		document.form1.action.value="list";
		document.form1.submit();

		
	}
function deletecheck() {
	result = confirm("정말로 삭제하시겠습니까 ?");

	if(result == true){
		

		document.form1.action.value="delete";
		document.form1.submit();
	}
	else
		return;
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

	<form name="form1" method="post" action="../board/BoardController">
	
	<div align="center">
	<H2>문의하기</H2><br>
	

	<div class="h">
		
		<input type="hidden" name="action" value=${action}>
		<input type="hidden" name="id" value=${boardDTO.id}>
		
		<div class="bodytext_area box_inner">			
			<ul class="bbsview_list">
				<li class="bbs_title">제목 :${boardDTO.title}</li>
				<li class="bbs_hit">작성자:${boardDTO.user}</li>
				<li class="bbs_date">날짜:${boardDTO.date}</li>
				<li class="bbs_content">
					<div class="editer_content">
						${boardDTO.content}
					</div>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="page">
					<input type="button" id="insert" class="fun-btn" value="수정" onClick="editcheck(${boardDTO.id})">　　
					<input type="button" id="update" class="fun-btn" value="삭제" onClick="deletecheck()">　　
					<input type="button" id="delete" class="fun-btn" value="목록" onClick="listcheck()">
</div>
	</form>
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