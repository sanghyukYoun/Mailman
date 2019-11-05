
<%
	//  파일설명 : 구매고객분류에 맞는 이메일 수신자 조회
	//  작성일   : 2019-10-27
%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page errorPage="mail_error.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.net.URLEncoder"%>

<%
	// 구매고객분류 화면에서 선택한 itemid, 성별, 나이, 지역 정보 가져오기
	String checkItemId = request.getParameter("checkItemId");
	String[] selAge = request.getParameterValues("age");
	String[] selGender = request.getParameterValues("gender");
	String[] selAddress = request.getParameterValues("address");
	System.out.println("checkItemId = " + checkItemId + "<br>");

	// 쿼리 where 조건절 구성
	String age = "";
	String gender = "";
	String address = "";

	if (selAge != null) {
		for (String val : selAge) {
			age = age + val + ",";
		}
		age = age.substring(0, age.length() - 1);
		System.out.println(age + "<br>");
	}

	if (selGender != null) {
		for (String val : selGender) {
			gender = gender + val + ",";
		}
		gender = gender.substring(0, gender.length() - 1);
		System.out.println(gender + "<br>");
	}

	if (selAddress != null) {
		for (String val : selAddress) {
			address = address + "\"" + val + "\"" + ",";
		}
		address = address.substring(0, address.length() - 1);
		System.out.println(address + "<br>");
	}

	try {
		// DB연결정보
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";

		// DB연결
		Class.forName(jdbc_driver);
		Connection conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");

		// 쿼리구성
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT A.username, A.email FROM (");
		sql.append("SELECT username, email FROM buyitem a JOIN user b ON a.userid = b.userid WHERE a.itemid = "
				+ checkItemId + "");
		if (!age.equals(""))
			sql.append(" AND TIMESTAMPDIFF(YEAR, birth, NOW()) DIV 10 * 10 IN (" + age + ")");

		if (!gender.equals(""))
			sql.append(" AND gender IN (" + gender + ")");

		if (!address.equals(""))
			sql.append(" AND address IN (" + address + ")");
		sql.append(") A GROUP BY A.username, A.email");
		System.out.println(sql.toString() + "<br>");

		// 쿼리실행 및 결과구성
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		ResultSet rs = pstmt.executeQuery();
		
		String emailList = ""; //메일 수신자 정보
		while (rs.next()) {
			emailList = emailList + rs.getString("username") + "<" + rs.getString("email") + ">,";
		}

		// DB연결닫기
		pstmt.close();
		conn.close();

		// 이메일정보 전달
		JSONObject json = new JSONObject();
		json.put("emailList", emailList);
		out.println(json.toJSONString());
	} catch (Exception e) {
		System.out.println(e);
	}
%>