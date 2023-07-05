<%@page import="customer.vo.Notice"%>
<%@page import="customer.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//	구현 완료
request.setCharacterEncoding("utf-8");

String seq = request.getParameter("c");
NoticeDao dao = new NoticeDao();
Notice notice = dao.getOneNotice(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border-collapse: collapse;
	border: 1px solid black;
	width: 800px;
}

td {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<h1>noticeDetail.jsp</h1>
	<hr />
	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<tr>
			<td><%=seq%></td>
			<td><a href="noticeDetail.jsp?c=<%=seq%>"><%=notice.getTitle()%></a></td>
			<td><%=notice.getWriter()%></td>
			<td><%=notice.getRegdate()%></td>
			<td><%=notice.getHit()%></td>
		</tr>
		<tr>
			<td colspan="5">내용</td>
		</tr>
		<tr>
			<td colspan="5"><%=notice.getContent() %></td>
		</tr>
	</table>
	<a href="noticeEdit.jsp?c=<%=seq%>">수정하기</a>
	<a href="noticeDelProc.jsp?c=<%=seq%>">삭제하기</a>
</body>
</html>