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
	int a = 1;
	int b = 2;
	int c = a + b;
	out.print("c=" + c);
%>
<br>
<%
	String d = "LX";
	String e = "입니다.";
	String f = d + e;
	out.print("f =  "+f);
%>
</body>
</html>