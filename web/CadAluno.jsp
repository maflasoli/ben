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
            body{
                justify-content: center;
                display: flex;

            }
            #cadastro{
                margin: 20px;
                background-color: gray;
                border-radius: 20px;
                justify-content: center;
                width: 50vw;
                height: 50vh;
                align-items: center;
                flex-direction: row;
                display: flex;
            }
            .form-control{
                margin:20px;
            }
            #formulario{
                margin: 10px;
                margin: 0 auto;
                text-align: center;
            }
            .btn{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <form id="formulario">
            <div class="container" id="cadastro">

                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="R.M.">
                        <input type="text" class="form-control" placeholder="Nome">
                        <input type="text" class="form-control" placeholder="Endereço">
                    </div>
                    <div class="col">
                        <img width="250" height="200" src="imagens/semimagem.png" alt="..." class="img-thumbnail" >
                        <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#modalFoto">Tirar foto</button>
                    </div>
                </div>
            </div>
        </form>

        <!-- MODAL FOTO DO ALUNO -->

        <div class="modal fade" id="modalFoto" tabindex="-1" role="dialog" aria-labelledby="modalFotoLabel" data-backdrop="static" data-keyboard="false" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalFotoLabel">Foto do Aluno</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        ...
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary">Salvar mudanças</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- FIM - MODAL FOTO DO ALUNO -->

        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.js" type="text/javascript"></script>
        <script src="js/webcam.min.js" type="text/javascript"></script>
    </body>
</html>
