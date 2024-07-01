<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String message = "";

    if (username != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://3.228.19.124:3306/loginapp?serverTimezone=UTC", "db_user", "Sujatha@3005");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM login WHERE Username=? AND Password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                message = "Login Successfully";
                response.sendRedirect("dashboard.jsp");
                return; // Ensure no further code is executed after redirect
            } else {
                message = "Invalid username or password.";
                response.sendRedirect("index.jsp?message="+message);
            }
            con.close();
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    }
%>
