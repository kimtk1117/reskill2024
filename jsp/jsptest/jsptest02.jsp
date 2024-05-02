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
	out.print("<br>");
	String d = "LX";
	String e = "입니다.";
	String f = d + e;
	out.print("f =  "+f);
	
	int index=1;
	while(index <= 6)
	{
		out.print("<h"+index+">"+"h"+index+"</h"+index+">"+"\n");
		index++;
	}
	

	//url로 넘어온 파라미터 중 category의 값을 strcategory에 적는다.
	String strCategory = request.getParameter("category");
	
	//category의 값을 출력
	out.print("category = " + strCategory);
	
	//url로 넘어온 파라미터 중 category의 값을 strcategory에 적는다.
	String user = request.getParameter("userID");
	String pwd = request.getParameter("passwd");

	//로그인 처리 (로그인은 실제로 이렇게 만들어서 처리하는 개념임)
	String sql = "select * from member where userid=" + user + "and password =" + pwd; 
%>
</body>
</html>