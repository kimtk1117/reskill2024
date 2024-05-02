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
	
	//url로 넘어온 파라미터 중 category의 값을 strcategory에 적는다.
	String strCategory = request.getParameter("category");
	
	//category의 값을 출력
	out.print("URL의 파라미터로 받은값, category = " + strCategory);
	
%>
</body>
</html>