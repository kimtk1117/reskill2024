<%@page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<%
String url = "jdbc:postgresql://172.30.0.7/testdb";
String user = "scott";
String pwd = "1111";
Class.forName("org.postgresql.Driver");
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
try
{
 con = DriverManager.getConnection(url, user, pwd);
 stmt = con.createStatement();
 String query = "select * from address";
 rs = stmt.executeQuery(query);
 while (rs.next())
 {
 out.println(rs.getString("ID") + ". " + rs.getString("name") + "<br>");
 } 
 rs.close();
 stmt.close();
 con.close();
}
catch(SQLException ex)
{
 out.println("err: " + ex.toString());
}
%>

