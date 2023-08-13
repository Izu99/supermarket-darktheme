<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="cn.techtutorial.connection.DbCon" %>
<%@ page import="cn.techtutorial.dao.ProductDao" %>
<%@ page import="cn.techtutorial.model.*" %>
<%@ page import="java.util.*" %>

<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); // Use the new driver class
    String userName = "root";
    String password = "root";
    String url = "jdbc:mysql://localhost:3306/ecommerce_cart";
    Connection con = DriverManager.getConnection(url, userName, password);
    
    // Assuming email is already in the table, replace it with your actual email
    String email = "user@example.com"; // Replace with the actual email
    
    // Create a PreparedStatement to get the name for the given email
    String sql = "SELECT name FROM ecommerce_cart.users WHERE email=?";
    PreparedStatement preparedStatement = con.prepareStatement(sql);
    preparedStatement.setString(1, email);
    
    ResultSet rs = preparedStatement.executeQuery();

    while (rs.next()) {
        String name = rs.getString("name");
        // Do something with the retrieved name, e.g., display it on the page
%>
        <p>Name: <%= name %></p>
<%
    }
    
    rs.close();
    preparedStatement.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-dark border-right" id="sidebar-wrapper" style="width: 300px; height: 100vh;">
        <div class="sidebar-heading text-white text-center mx-2 fs-2"><p class="fs-1 mx-2">E-Market</p></div>
        <div class="list-group bg-dark slist-group-flush">
            <a href="index.jsp" class="list-group-item list-group-item-action bg-dark text-light">Home</a>
            <% if (auth != null) { %>
            <a href="adminProductView.jsp" class="list-group-item list-group-item-action bg-dark text-light">Product View</a>
            <a href="adminUsersView.jsp" class="list-group-item list-group-item-action bg-dark text-light">User View</a>
            <a href="adminOrderView.jsp" class="list-group-item list-group-item-action bg-dark text-light">Order View</a>
            <a href="log-out" class="list-group-item list-group-item-action bg-dark text-light">Logout</a>
            <% } else { %>
            <a href="login.jsp" class="list-group-item list-gsroup-item-action bg-dark text-light">Login</a>
            <% } %>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->