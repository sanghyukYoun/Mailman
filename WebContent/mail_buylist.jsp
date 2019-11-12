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
<title>상품 구매 목록 조회</title>
<link rel="stylesheet" href="mail.css" type="text/css" media="screen" />
<script type="text/javascript">
	
</script>
</head>

<%
	//선택한 홍보상품 정보 가져오기
	String checkedlist = request.getParameter("checkedlist");
	System.out.println("checkedlist = " + checkedlist);

	String[] checkedArrray = checkedlist.split(",");
	for (int i = 0; i < checkedArrray.length; i++) {
		System.out.println(checkedArrray[i]);
	}

	String itemid = checkedArrray[0];
	String price = checkedArrray[1];
	String makedate = checkedArrray[2];

	ArrayList<MailDTO> mailList = new ArrayList<MailDTO>();
	
	//action구분 등 파라메터
	String action = request.getParameter("action");

	ArrayList<BuyitemDTO> buyitemList = new ArrayList<BuyitemDTO>();

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

		String sql = "select id, userid, itemid, amount, price, buydate from buyitem where id = ?";

		pstmt = conn.prepareStatement(sql);

		//SQL문 실행
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {

			// DO 객체 생성
			BuyitemDTO buyitemDTO = new BuyitemDTO();

			// DB Select결과를 DO 객체에 저장
			buyitemDTO.setId(rs.getInt("id"));
			buyitemDTO.setUserid(rs.getString("userid"));
			buyitemDTO.setItemid(rs.getString("itemid"));
			buyitemDTO.setAmount(rs.getString("amount"));
			buyitemDTO.setPrice(rs.getString("price"));
			buyitemDTO.setBuydate(rs.getString("buydate"));

			buyitemList.add(buyitemDTO);
		}

		// 사용한 자원의 반납.
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%>


<body>
	<div align=center>
		<H2>상품 구매내역 조회</H2>
		<HR>
			<table border=1>
				<tr>
					<td colspan=6 align=right><input type="submit" style="width: 75pt; height: 20pt" value="유사상품 조회"></td>
				</tr>
				<tr>
					<th>ID</th>
					<th>사용자ID</th>
					<th>상품ID</th>
					<th>수량</th>
					<th>구매가격</th>
					<th>구매일자</th>
				</tr>
				<%
					if (buyitemList != null) {
						for (BuyitemDTO buyitemDTO : (ArrayList<BuyitemDTO>) buyitemList) {
				%>
				<tr>
					<td><%=buyitemDTO.getId()%></td>
					<td><%=buyitemDTO.getUserid()%></td>
					<td><%=buyitemDTO.getItemid()%></td>
					<td><%=buyitemDTO.getAmount()%></td>
					<td><%=buyitemDTO.getPrice()%></td>
					<td><%=buyitemDTO.getBuydate()%></td>
				</tr>
				<%
					}
					}
				%>
			</table>
	</div>

</body>
</html>