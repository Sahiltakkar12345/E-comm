<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.*, org.hibernate.cfg.*" %>
<%@page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
        }
        h1 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        p {
            font-size: 16px;
            color: #555;
            text-align: center;
        }
</style>
</head>
<body>
<%
SessionFactory sf=new Configuration().configure().buildSessionFactory();
Session s=sf.openSession();
Transaction t=s.beginTransaction();
Order p=new Order();
int pid=Integer.parseInt(request.getParameter("id"));
p.setId(pid);
s.delete(p);
t.commit();

%>
</body>
</html>