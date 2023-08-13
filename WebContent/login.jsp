<%@page import="cn.techtutorial.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/includes/head.jsp"%>
    <title>Supermarket</title>
</head>
<body class="bg-dark">
    

    <div class="container bg-dark">
        <div class="card border border-info-subtle w-50 mx-auto bg-dark text-light my-5">
            <div class="card-header text-center">User Login</div>
            <div class="card-body">
                <form action="user-login" method="post">
                    <div class="form-group">
                        <label for="login-email">Email address</label>
                        <input type="email" id="login-email" name="login-email" class="form-control" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="login-password" class="form-control" placeholder="Password">
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Login</button>
                    </div>
                    <div class="text-center">
                        <label>Don't have an account yet?</label>
                        <a href="register.jsp" class="btn btn-warning ms-2">Register</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
