<%-- 
    Document   : ben
    Created on : 20/08/2020, 14:50:53
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><<B.E.N.>></title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String usuario = (String) session.getAttribute("usuario");
            if(usuario==null){
                response.sendRedirect("index.jsp");
            }else{
                out.print("Bem vindo " + usuario +"<\br>");
            }
        %>
        <h1>PASSOU - 1</h1>
        <a href="sair.jsp"> Voltar <\a>
    </body>
</html>
