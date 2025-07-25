<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // Check if user is logged in
    if (session.getAttribute("user") != null) {
        response.sendRedirect("dashboard.jsp");
    } else {
        response.sendRedirect("login.jsp");
    }
%>

</body>
</html>