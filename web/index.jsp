<%-- 
    Document   : index
    Created on : 04 29, 16, 10:32:59 PM
    Author     : LENOVO
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        
        <%!
            public class Actor{
                String URL = "jdbc:mysql://localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "root";

                Connection connection = null;
                PreparedStatement insertActors = null;
                ResultSet resultSet = null;

                public Actor(){
                
                    try{
                        
                            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                            
                            insertActors = connection.prepareStatement(
                                 "INSERT INTO actor (first_name, last_name, last_update"
                                 + " VALUES (?, ?, ?)");
                       }
                    catch(Exception e){
                            e.printStackTrace();     
                     }
                }
                
                    public int setActors (String first, String last, Timestamp timeStamp){
                            
                            int result = 0;
                                
                            try{
                                    insertActors.setString(1,first);
                                    insertActors.setString(2,last);
                                    insertActors.setTimestamp(3,timeStamp);
                                    result = insertActors.executeUpdate();
                                }
                            catch(SQLException e){
                                    e.printStackTrace();
                                }
                                return result;
                        }
                
            }
        %>
        <%
                                    int result = 0;
                                    
                                   String firstName = new String();
                                   String lastName = new String();
                                   
                                   if(request.getParameter("first")!=null){
                                       firstName = request.getParameter("last");
                                   }
                                   
                                   Date date = new Date();
                                   Timestamp timeStamp = new Timestamp(date.getTime());
                                   
                                   Actor actor = new Actor();
                                   result = actor.setActors(firstName, lastName, timeStamp);
        %>
        <h1>Sign Up</h1>
        <form name="form1" action="index.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>First Name:</td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name:</td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="submit" value="submit" name="Submit" />
            <input type="reset" value="clear" name="Clear" />
        </form>
    </body>
</html>
