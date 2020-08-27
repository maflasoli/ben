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

                        <!--CONTAINER PARA TIRAR A FOTO-->
                        <input type="hidden" name="foto" id="foto" value=""/><br><br>
                        <div id="cameraFotografica">
                            <div id="minha_camera"></div>
                            <!-- CONFIGURANDO ATRIBUTOS DA CAMERA -->
                            <script language="JavaScript">
                                Webcam.set({
                                    // TAMANHO DA VISUALIZAÇÃO AO VIVO
                                    width: 320,
                                    height: 240,
                                    // TAMANHO DA CAPTURA DO DISPOSITIVO
                                    dest_width: 640,
                                    dest_height: 480,
                                    // TAMANHO FINAL RECORTADO
                                    crop_width: 480,
                                    crop_height: 480,
                                    // FORMATO E QUALIDADE
                                    image_format: 'jpeg',
                                    jpeg_quality: 90,
                                    // VIRAR NA HORIZONTAL (MODO ESPELHO)
                                    flip_horiz: true
                                });
                                Webcam.attach('#minha_camera');
                            </script>
                            <!-- A button for taking snaps -->

                            <div id="botao_prefoto">
                                <!-- ESTE BOTÃO É MOSTRADO ANTES DO USUÁRIO TIRAR UMA INSTANTANEA -->
                                <input type=button value="Tirar Foto" onClick="visualizarFoto()">
                            </div>
                            <div id="posBotoes" style="display:none">
                                <!-- ESTES BOTÕES SÃO MOSTRADOS DEPOIS DE VISUALIZAR A FOTO-->
                                <input type=button value="Tirar outra" onClick="cancelaFoto()">
                                <input type=button value="Salvar foto" onClick="salvarFoto()" style="font-weight:bold;">
                            </div>

                        </div>

                        <div id="resultado" style="display:none">
                            <!-- Your captured image will appear here... -->
                        </div>
                        <!-- CÓDIGO PARA FAZER O INSTANTANEO E EXIBI-LO LOCALMENTE -->
                        <script language="JavaScript">
//                            // preload shutter audio clip
//                            var shutter = new Audio();
//                            shutter.autoplay = false;
//                            shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg' : 'shutter.mp3';

                            function visualizarFoto() {
//                                // play sound effect
//                                try {
//                                    shutter.currentTime = 0;
//                                } catch (e) {
//                                    ;
//                                } // fails in IE
//                                shutter.play();

                                // CONGELA A IMAGEM PARA QUE O USUÁRIO VISUALIZE
                                Webcam.freeze();

                                // CONJUNTO DE BOTÕES DE TROCA
                                document.getElementById('botao_prefoto').style.display = 'none';
                                document.getElementById('posBotoes').style.display = '';
                            }

                            function cancelaFoto() {
                                // DESCONGELA A IMAGEM E VOLTA PARA A IMAGEM AO VIVO
                                Webcam.unfreeze();

                                // swap buttons back to first set
                                document.getElementById('botao_prefoto').style.display = '';
                                document.getElementById('posBotoes').style.display = 'none';
                            }
                            function salvarFoto() {
                                // actually snap photo (from preview freeze) and display it
                                Webcam.snap(function (data_uri) {
//                                    // display results in page
//                                    document.getElementById('results').innerHTML = '<h2>Here is your large, cropped image:</h2>' +
//                                            '<img src="' + data_uri + '"/><br/></br>' +
//                                            '<a href="' + data_uri + '" target="_blank">Open image in new window...</a>';
//                                    // shut down camera, stop capturing
                                    document.getElementById("foto").value = data_uri;

                                    Webcam.reset();
                                    // MOSTRAR RESULTADOS, OCULTAR CAMERAFOTOGRAFICA
                                    //document.getElementById('results').style.display = '';
                                    document.getElementById('cameraFotografica').style.display = 'none';
                                });
                            }
                        </script>

                        <!--FECHAR CONTAINER TIRAR A FOTO-->

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
