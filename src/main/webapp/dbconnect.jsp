<%@ page import="java.sql.*" %>
<%
    Connection con = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/HostelWebApp","root", "");
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>