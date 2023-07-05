<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>notice.jsp</h3>
	<%
	String sql = "select seq,title,writer,content,regdate,hit from notices order by to_number(seq) desc";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pw = "123456";
	Connection con = DriverManager.getConnection(url, user, pw);
	//실행
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	%>
	<table width="500" border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%
		//db에 입력되어있는 행의갯수와 동일하게 표현
		while (rs.next()) {
		%>
		<!-- ifTest.jsp?name=&color=blue -->
		<tr>
			<td><%=rs.getString("seq")%></td>
			<td><a href="noticeDetail.jsp?c=<%=rs.getString("seq")%>"><%=rs.getString("title")%></a></td>
			<td><%=rs.getString("writer")%></td>
			<td><%=rs.getDate("regdate")%></td>
			<td><%=rs.getInt("hit")%></td>
		</tr>

		<%
		}
		%>
	</table>
	<a href="noticeReg.jsp">글쓰기</a>
</body>
</html>