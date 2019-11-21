<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이지메일</title>
<link rel="stylesheet" href="../css/mail3.css" type="text/css" media="screen" />
<script type="text/javascript" src="<%=cp%>/mail/data/mail.js"></script>
</head>
<script type="text/javascript">


function openmailSend()
    {
	confirm('인증이 필요합니다.');
	location.href='js용.html';   
    }	
    </script>
<body>


<!-- ========== 헤더  ========== -->

<header>

	<div class="container header-container">
	
		<div>

			<h1 class="header-logo"><a href="HP_main.jsp"><img src="../images/logo.jpg"></a></h1>

 		</div>

	</div>
	
</header>

	


<!-- ========== 메인 ========== -->

<section class="main">

	<div class="container">

		<main>

			<p class="home-mainc">손쉬운 대량메일 발송<br>

				<span class="home-color1">모든것을 한방에</span><strong> 이지메일</strong>.
				
			</p>


			<ul class="home-course">

				<li>

					<a href="#"><figure><img src="../images/매물.jpg">

					<figcaption>신제품 홍보</figcaption>

					</figure></a>

				</li>

				<li>

					<a href="#"><figure><img src="../images/인터넷강의.jpg">

					<figcaption>웹메일</figcaption>

					</figure></a>

				</li>

				<li>

					<a href="#"><figure><img src="../images/문의.jpg">

					<figcaption>대상 추출</figcaption>

					</figure></a>

				</li>

			</ul>
			
			<!-- ========== 소개화면 ========== -->

<div class="home-keyvisual">	

	<img src="../images/mainc.jpg" class="img-responsive">

</div>

			
		<!-- 공지사항  -->
			
			
            <h2 class="home-h2"> </h2>

			<div class="gongjee">
<a href="../board/board_list.jsp"><img src="../images/board.PNG"></a>
				</div>
				</main>

			


		

	</div>
	
</section>
	<div class="page">
	
			<a href="javascript:openmailSend()"><button class="fun-btn" type="button" >메일시스템 이용하기</button></a>

</div>

<!-- ========== 푸터 ========== -->

<footer>


  <div class="container footer-container">

	<p class="footer-copyright">

		easymail.com

		</p>

	</div>


</footer>

</body>

</html>