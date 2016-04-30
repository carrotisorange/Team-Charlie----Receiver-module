<%-- 
    Document   : sucess
    Created on : 04 29, 16, 10:57:52 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Sucess, you can log in!</h1>
        
        <%
           String fName = request.getParameter("fName");
           String lName = request.getParameter("lName");
           String gen = request.getParameter("gen");
           String eAdress = request.getParameter("eAdress");
           String bDate = request.getParameter("bDate");
        %>
        <table border="1">
            <tbody>
                <tr>
                    <td>First Name:</td>
                    <td><%= fName %></td>
                </tr>
                <tr>
                    <td>Last Name:</td>
                    <td><%= lName %></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><%= gen %></td>
                </tr>
                <tr>
                    <td>Email Address</td>
                    <td><%= eAdress %></td>
                </tr>
                <tr>
                    <td>Birth Date:</td>
                    <td><%=bDate%></td>
                </tr>
            </tbody>
        </table>

        
    </body>
</html>
