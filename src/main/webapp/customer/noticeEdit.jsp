<%@page import="customer.vo.Notice"%>
<%@page import="customer.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String seq = request.getParameter("c");
NoticeDao dao = new NoticeDao();
Notice notice = dao.getOneNotice(seq);

System.out.println(notice.getTitle());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="noticeEditProc.jsp" method="post">
		제목 : <input type="text" name="title" value="<%=notice.getTitle()%>" />
		<br /> 첨부파일 : <input type="file" name="txtfile" /> <br /> 내용 :
		<textarea name="content" id="txtcontent" class="txtcontent"><%=notice.getContent()%></textarea>
		<br /> <input type="submit" value="update" /> <input type="button"
			value="cancel" class="cancel" />
		<input type="hidden" name="c" value="<%=seq %>" />
	</form>
</body>
</html>