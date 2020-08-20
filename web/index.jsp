<%-- 
    Document   : index
    Created on : 20/08/2020, 14:28:16
    Author     : Administrador
--%>

<%@ page language="Java" import="BD.conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estiloindex.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div>TODO write content</div>


        <div class="container small" id="login" style="display:none">
            <div class="row justify-content-center" >
                <div class="col-md-4 formulario">
                    <form action="index.jsp">
                        <div class="form-group text-center">
                            <h1 class="text-light">Inicia Sessão de usuário</h1>>                            
                        </div>
                        <div class="form-group mx-sm-4">
                            <input type="text" name="Usuario" class="form-control" placeholder="Usuário">
                        </div>
                        <div class="form-group mx-sm-4">
                            <input type="password" name="SenhaUsuario" class="form-control" placeholder="Senha">                            
                        </div>
                        <div class="form-group mx-sm-4">
                            <input type="submit" class="btn btn-block entrar" value="Entrar">
                        </div>
                        <a href="#" onclick="fechar_logar()">Fechar Logar</a>
                    </form>
                    <%
                        conexao con = new conexao();
                        String usuario = request.getParameter("Usuario");
                        String senha = request.getParameter("SenhaUsuario");

                        boolean acesso = con.validaUsuario(usuario, senha);

                        if (acesso && usuario != null && senha != null && !usuario.isEmpty() && !senha.isEmpty()) {
                            session.setAttribute("usuario", usuario);
                            response.sendRedirect("ben.jsp");
                        }
                    %>
                </div>
            </div>
        </div>

        <a href="#" onclick="logar()">Logar</a>

        <script src="js/funcoesindex.js" type="text/javascript"></script>
        <script src="js/jquery-3.5.1.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
