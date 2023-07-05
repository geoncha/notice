<%@page import="customer.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	구현 완료
request.setCharacterEncoding("utf-8");

String seq = request.getParameter("c");

System.out.println(seq); //	ok

NoticeDao dao = new NoticeDao();
dao.delete(seq);
response.sendRedirect("notice.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>