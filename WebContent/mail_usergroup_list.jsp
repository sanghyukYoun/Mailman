<!--
 * 파일설명 : 구매고객분류 목록 조회(구매고객의 나이별, 성별, 지역별 분류 조회)
 * 작성일   : 2019-10-25
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="mail_error.jsp"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매고객분류</title>
<script type="text/javascript" src="jquery-1.9.1.js"></script>
<link rel="stylesheet" href="css/mail.css" type="text/css" media="screen" />
<script type="text/javascript">
	// 체크박스 전체선택
	$(document).ready(function() {
		$("#checkall").click(function() {
			$("input[type=checkbox]").prop("checked", true);
			fnSelect();
		})
	})

	// 체크박스 전체해지
	$(document).ready(function() {
		$("#uncheckall").click(function() {
			$("input[type=checkbox]").prop("checked", false);
			fnSelect();
		})
	})

	// 체크박스 선택시 이메일수신자목록 가져오기
	function fnSelect() {
		var cnt = 0;
		var age = document.getElementsByName("age");
		var gender = document.getElementsByName("gender");
		var address = document.getElementsByName("address");
		for (var i = 0; i < age.length; i++) {
			if (age[i].checked)
				cnt += 1;
		}
		for (var i = 0; i < gender.length; i++) {
			if (gender[i].checked)
				cnt += 1;
		}
		for (var i = 0; i < address.length; i++) {
			if (address[i].checked)
				cnt += 1;
		}
		if (cnt == 0) {
			$('#toAddr').val("");
			return;
		}

		$.ajax({
			url : "./mail_usergroup_select.jsp",
			type : "POST",
			cache : false,
			dataType : "json",
			data : $('#form1').serialize(),
			success : function(data) {
				var email = data.emailList;
				email = email.substring(0, email.length - 1);
				$('#toAddr').val(email);
			},

			error : function(request, status, error) {
				var msg = "ERROR : " + request.status + "내용 : "
						+ request.responseText + error;
				alert(msg);
			}
		});
	}

	// 이메일주소추가
	function fnSelectEmail() {
		opener.document.getElementById("toAddr").value = $('#toAddr').val();
	}
</script>
</head>

<%
	// 선택한 유사상품 itemid 가져오기
	String checkItemId = request.getParameter("checkItemId");
	System.out.println("checkItemId = " + checkItemId + "<br>");

	// 구매고객패턴정보 저장 변수
	ArrayList<String> ageList = new ArrayList<String>();
	ArrayList<String> ageCntList = new ArrayList<String>();
	ArrayList<String> genderList = new ArrayList<String>();
	ArrayList<String> genderCntList = new ArrayList<String>();
	ArrayList<String> addressList = new ArrayList<String>();
	ArrayList<String> addressCntList = new ArrayList<String>();

	try {
		// DB연결정보
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1/jspdb?useSSL=true&verifyServerCertificate=false&serverTimezone=UTC";

		// DB연결
		Class.forName(jdbc_driver);
		Connection conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");

		// 쿼리 실행
		// 나이별
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT TIMESTAMPDIFF(YEAR, b.birth, NOW()) DIV 10 * 10 as age, count(*) as agecnt ");
		sql.append(
				"FROM (SELECT distinct(userid) FROM buyitem WHERE itemid = ?) a JOIN user b ON a.userid = b.userid ");
		sql.append("GROUP BY TIMESTAMPDIFF(YEAR, b.birth, NOW()) DIV 10 ORDER BY agecnt DESC");
		System.out.println("sql1 = " + sql.toString() + "<br><br>");

		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, checkItemId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ageList.add(rs.getString("age"));
			ageCntList.add(rs.getString("agecnt"));
		}

		// 성별
		sql.delete(0, sql.length());
		sql.append("SELECT b.gender, count(*) as gendercnt ");
		sql.append(
				"FROM (SELECT distinct(userid) FROM buyitem WHERE itemid = ?) a JOIN user b ON a.userid = b.userid ");
		sql.append("GROUP BY b.gender ORDER BY gendercnt DESC");
		System.out.println("sql2 = " + sql.toString() + "<br><br>");

		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, checkItemId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			genderList.add(rs.getString("gender"));
			genderCntList.add(rs.getString("gendercnt"));
		}

		// 지역별
		sql.delete(0, sql.length());
		sql.append(
				"SELECT b.address, count(*) as addresscnt FROM (SELECT distinct(userid) FROM buyitem WHERE itemid = ?) a ");
		sql.append("JOIN user b ON a.userid = b.userid GROUP BY b.address ORDER BY addresscnt DESC");
		System.out.println("sql3 = " + sql.toString());

		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setString(1, checkItemId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			addressList.add(rs.getString("address"));
			addressCntList.add(rs.getString("addresscnt"));
		}

		// DB연결닫기
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

		    <li style="border:1px solid #848484; background-color: #424242;"><p>홍보 대상자 추출</p></li>

	    </ul>

	</div>

</nav>
<nav>

	<div class="container nav-container">

	   	<ul class="navbar">

		    <li style="border:1px solid #848484;"><p>홍보 상품 선택</p></li>

			<li style="border:1px solid #848484;"><p>유사상품목록</p></li>

		    <li style="border:1px solid #848484; background-color: #424242;"><p>구매고객분류</p></li>

	    </ul>

	</div>

</nav>
	<form action="mail_usergroup_select.jsp" id="form1" name="form1" method="post">
		<input type="hidden" name="checkItemId" value="<%=checkItemId%>">
		<div align=center>
			<H2>구매고객분류</H2>
			<HR>
			<%
				if (ageList.size() == 0 && genderList.size() == 0 && addressList.size() == 0) {
			%>
			구매이력이 없습니다.
			<%
				} else {
			%>

			<table border=1>
				<tr>
					<td colspan=2 align=right><input type="button" id="checkall" name="checkall" style="width: 90pt; height: 20pt" value="전체선택"> <input type="button" id="uncheckall" name="uncheckall" style="width: 90pt; height: 20pt" value="전체해지"></td>
				</tr>
				<tr>
					<th>분류</th>
					<th>내용</th>
				</tr>
				<tr>
					<td>나이별</td>
					<td style="text-align: left;">
						<%
							if (ageList != null) {
									for (int i = 0; i < ageList.size(); i++) {
										out.println("<input type=\"checkbox\" name=\"age\" value=\"" + ageList.get(i)
												+ "\" onclick=\"fnSelect();\">" + ageList.get(i) + "대");
										out.println("(" + ageCntList.get(i) + "명)");
									}
								}
						%>
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td style="text-align: left;">
						<%
							if (genderList != null) {
									for (int i = 0; i < genderList.size(); i++) {
										out.println("<input type=\"checkbox\" name=\"gender\" value=\"" + genderList.get(i)
												+ "\" onclick=\"fnSelect();\">");

										if (genderList.get(i).equals("1"))
											out.println("남");
										else
											out.println("여");
										out.println("(" + genderCntList.get(i) + "명)");
									}
								}
						%>
					</td>
				</tr>
				<tr>
					<td>지역별</td>
					<td style="text-align: left;">
						<%
							if (addressList != null) {
									for (int i = 0; i < addressList.size(); i++) {
										out.println("<input type=\"checkbox\" name=\"address\" value=\"" + addressList.get(i)
												+ "\" onclick=\"fnSelect();\">" + addressList.get(i));
										out.println("(" + addressCntList.get(i) + "명)");
									}
								}
						%>
					</td>
				</tr>
				<tr>
					<td>수신자목록</td>
					<td style="text-align: left;"><textarea cols="100" rows="5" id="toAddr" name="toAddr"></textarea></td>
				</tr>
			</table>
			<%
				}
			%>
			<br> <br> <input type="button" value="되돌아가기" onclick="history.back();"> <input type="button" value="이메일추가" onclick="fnSelectEmail();"> <input type="button" value="닫기" onclick="window.close();">
		</div>
	</form>
</body>

</html>