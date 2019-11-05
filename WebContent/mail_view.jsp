<!--
 * 파일설명 : 유사상품목록 조회
 * 작성일   : 2019-10-25
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 오류 페이지 정의  -->
<%@ page errorPage="mail_error.jsp"%>

<!-- 자바 클래스 Import  -->
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedReader"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유사상품목록</title>
<link rel="stylesheet" href="mail.css" type="text/css" media="screen" />
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

	try {
		// DB연결정보
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";

		// DB연결
		Class.forName(jdbc_driver);
		Connection conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");

		// 쿼리구성
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT id, itemid, itemname, price, nation, makedate FROM item  WHERE itemid = ?");
		sql.append(
				"AND date(makedate) BETWEEN date(subdate(date(?), INTERVAL 2 month)) AND date(ADDDATE(DATE(?), INTERVAL 2 month))");
		sql.append("AND price BETWEEN ?-100000 AND ?+100000	");

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, itemid);
		pstmt.setString(2, makedate);
		pstmt.setString(3, makedate);
		pstmt.setString(4, price);
		pstmt.setString(5, price);

		// 쿼리실행
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
		
		// DB연결닫기
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		System.out.println(e);
	}
%>

<body>
	<div align=center>
		<H2>유사상품목록</H2><br>
		<H3>유사상품 기준 : 제조일자 +-2달, 상품분류코드 일치, 가격+-10만원</H3>
		<HR>
		<form action="mail_usergroup_list.jsp">
			<table border=1>
				<tr>
					<td colspan=7 align=right><input type="submit" style="width: 90pt; height: 20pt" value="구매고객조회"></td>
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
					<td><input type="radio" name="checkItemId" value="<%=mailDTO.getId()%>"></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<br> <input type="button" value="되돌아가기" onclick="history.back();"> <input type="button" value="닫기" onclick="self.close();">
		</form>
	</div>
</body>
</html>