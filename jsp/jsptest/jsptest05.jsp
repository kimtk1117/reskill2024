<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	        
	String S = request.getParameter("search"); //request.getParameter 외워야함.
	out.print("search 값은 " + S);
	
	// 접속할 주소
	String url = "jdbc:postgresql://172.30.0.7/testdb";

	// DBMS의 사용자 이름
	String user = "scott";
	
	// 위 사용자 이름에 대한 비밀번호.
	String pwd = "1111";
	
	// 연결을 위한 변수 
	Connection con = null;
	
	// 쿼리를 실행하는 Statement 변수
	Statement stmt = null;
	
	// 결과를 받아올 변수
	ResultSet rs = null;
	
	// 시도한다. 이 try {} 안에서 실행을 시도하다가 문제가 생기면 catch {} 로 간다.
	try
	{
		// postgresql JDBC를 읽어들인다.
		Class.forName("org.postgresql.Driver");
		
		// DBMS와 연결한다. url: 접속할 서버. user: DBMS 사용자 계정, pwd: user의 비밀번호
		con = DriverManager.getConnection(url, user, pwd);
        
		// DBMS에 쿼리할 준비를 한다.
		stmt = con.createStatement();

		// 실행할 쿼리문
		String query1 = "select * from books where name = " + "'" + S + "'";// 이름이 S인 것을 검색한다. 앞뒤로 '를 추가 하여 'S'로 출력되게끔 하여 오류방지.
		String query2 = "select * from books where name like " + "'%" + S + "%'";
		out.print("<br><br>");
		out.print("query1 =" + query1); // 쿼리 뒤의 쿼리의 변수값을 출력하는 코드. 실제 개발자들은 실행결과의 확인을 위해 사용.
		out.print("<br><br>");
		out.print("query2 =" + query2);
		
		
        
		// 쿼리를 실행한 결과를 rs로 받는다.
		rs = stmt.executeQuery(query2);
		
		out.print("<br><br><br>");

		// rs에 다음 자료가 있을 때까지 실행한다.
		while (rs.next())
		{
			// DBMS에서 가져온 결과를 보여준다.
			out.print(rs.getString("ID") + ". " + rs.getString("name"));
			out.print("<br>");
		}                               

		// 다 사용했으면 결과를 닫는다.
		rs.close(); //rs.close()로 메모리 OS에 반납하는 역할이므로 꼭 해줘야함.

		// 쿼리를 위한 Statement를 닫는다.
		stmt.close();

		// 연결을 닫는다.
		con.close();
	}		
	catch(Exception ex)		// 위 try{} 에서 문제가 발생하면 이 안으로 들어온다.
	{
		// 에러 내용을 보여준다.
		out.print("err: " + ex.toString());
	}
%>
</body>
</html>