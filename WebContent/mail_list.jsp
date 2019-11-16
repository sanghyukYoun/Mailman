<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 오류 페이지 정의  -->
<%@ page errorPage="mail_error.jsp"%>

<!-- 자바 클래스 Import  -->
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홍보 대상자 추천</title>
<link rel="stylesheet" href="mail.css" type="text/css" media="screen" />
<script type="text/javascript">
	
</script>
</head>

<%
	//action구분 등 파라메터
	String action = request.getParameter("action");

	ArrayList<MailDTO> mailList = new ArrayList<MailDTO>();

	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	//데이터베이스 연결관련정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";

	try {
		// JDBC 드라이버 로드
		Class.forName(jdbc_driver);
		// 데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");

		String sql = "select id, itemid, itemname, price, nation, makedate from item";

		pstmt = conn.prepareStatement(sql);

		//SQL문 실행
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			// DO 객체 생성
			MailDTO mailDTO = new MailDTO();

			// DB Select결과를 DO 객체에 저장
			mailDTO.setId(rs.getInt("id"));
			mailDTO.setItemid(rs.getInt("itemid"));
			mailDTO.setItemname(rs.getString("itemname"));
			mailDTO.setPrice(rs.getString("price"));
			mailDTO.setNation(rs.getString("nation"));
			mailDTO.setMakedate(rs.getString("makedate"));

			mailList.add(mailDTO);
		}

		// 사용한 자원의 반납.
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%>


<body>

<nav>

	<div class="container nav-container">

	   	<ul class="navbar">

		    <li style="border:1px solid #BDBDBD; background-color: #2E64FE;"><p>홍보 대상자 추출</p></li>

	    </ul>

	</div>

</nav>
<nav>

	<div class="container nav-container">

	   	<ul class="navbar">

		    <li style="border:1px solid #BDBDBD; background-color: #2E64FE;"><p>홍보 상품 선택</p></li>

			<li style="border:1px solid #BDBDBD; background-color: #00BFFF;""><p>유사상품목록</p></li>

		    <li style="border:1px solid #BDBDBD; background-color: #00BFFF;""><p>구매고객분류</p></li>

	    </ul>

	</div>

</nav>
	<div align=center>
		<HR>
		<form action="mail_view.jsp">
			<table border=1>
				<tr>
					<td colspan=7 align=right><input type="submit" style="width: 75pt; height: 20pt" value="유사상품 조회"></td>
				</tr>
				<tr>
					<th>ID</th>
					<th>상품코드</th>
					<th>이름</th>
					<th>가격</th>
					<th>제조국가</th>
					<th>제조일자</th>
					<th>홍보여부(1개만 선택 가능)</th>
				</tr>
				<%
					if (mailList != null) {
						for (MailDTO mailDTO : (ArrayList<MailDTO>) mailList) {
				%>
				<tr>
					<td><%=mailDTO.getId()%></td>
					<td><%=mailDTO.getItemid()%></td>
					<td><%=mailDTO.getItemname()%></td>
					<td><%=mailDTO.getPrice()%></td>
					<td><%=mailDTO.getNation()%></td>
					<td><%=mailDTO.getMakedate()%></td>
					<td><input type="radio" name="checkedlist" value="<%=mailDTO.getItemid()%>,<%=mailDTO.getPrice()%>,<%=mailDTO.getMakedate()%>"></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</form>
	</div>

</body>
</html>