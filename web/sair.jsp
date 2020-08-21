<%-- 
    Document   : sair
    Created on : 20/08/2020, 21:44:05
    Author     : MarcosMG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>