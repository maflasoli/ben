<%-- 
    Document   : CadAluno
    Created on : 21/08/2020, 20:46:21
    Author     : MarcosMG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            #cadastro{
                margin: 20px;
            }
        </style>
    </head>
    <body>
        <form>
            <div class="container" id="cadastro">

                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="R.M.">
                        <input type="text" class="form-control" placeholder="Nome">
                        <input type="text" class="form-control" placeholder="Endereço">
                    </div>
                    <div class="col">
                        <img width="200" height="200" src="imagens/semimagem.png" alt="..." class="img-thumbnail" >
                    </div>
                </div>
            </div>
        </form>
        <script src="js/bootstrap.js" type="text/javascript"></script>

    </body>
</html>
