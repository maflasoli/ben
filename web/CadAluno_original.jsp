<%-- 
    Document   : CadAluno
    Created on : 21/08/2020, 20:46:21
    Author     : MarcosMG
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>.::Cadastro de Alunos::.NOME DE USUÁRIO E/OU ESCOLA</title>
        <meta charset="UTF-8">

        <style type="text/css">
            body{
                margin: 0;
                padding: 0;

            }
            #cadastro{
                width: 700px;
                height: 530px;
                border: 2px solid #000;
                border-radius: 50px 0px 50px 0px;
                color: #fff;
                background-color: rgba(0,0,5,0.3);
                /*                background: transparent;*/
                top: 50%;
                left: 50%;
                position: absolute;
                transform: translate(-50%, -50%);
                box-sizing: border-box;
                padding: 68px 28px;
            }
            .form-control{
                margin-bottom: 5px;
            }
        </style>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <%
            String usuario = (String) session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("index.jsp");
            } else {
                out.print("Bem vindo " + usuario + "<\br>");
            }
        %>

        <form id="formulario" action="cadaluno" method="POST">
            <div class="container" id="cadastro">
                <div class="row">
                    <div class="col">
                        <input type="text" name="txtRmAluno" class="form-control" placeholder="R.M.">
                        <input type="text" name="txtNomeAluno" class="form-control" placeholder="Nome">
                        <input type="text" name="txtEndAluno" class="form-control" placeholder="Endereço">
                        <!--SÓ PARA GUARDAR O VALOR DA FOTO BASE64-->
                        <input type="hidden" name="foto" id="foto" value=""/><br><br>
                    </div>
                    <div class="col">
                        <img width="250" height="200" id="fotosemimagem" src="imagens/semimagem.png" alt="..." class="img-thumbnail">

                        <div id="fotografia"  style="display:none">
                            <div id="minhaCamera"></div>
                            <!-- INCLUIR A BIBLIOTECA RESPONSÁVEL PELA FOTOGRAFIA -->
                            <script type="text/javascript" src="js/webcam.min.js"></script>

                            <!-- CONFIGURAR ALGUMAS PROPRIEDADES E ANEXAR A CAMERA -->
                            <script language="JavaScript">
                                Webcam.set({
                                    // TAMANHO VISTO AO VIVO
                                    width: 320,
                                    height: 240,
                                    // TAMANHO DO DISPOSITIVO DE CAPTURA
                                    dest_width: 640,
                                    dest_height: 480,
                                    // TAMANHO CORTE FINAL
                                    crop_width: 480,
                                    crop_height: 480,
                                    // FORMATO E QUALIDADE DA IMAGEM
                                    image_format: 'jpeg',
                                    jpeg_quality: 90,
                                    // GIRAR HORIZONTALMENTE (ESPELHO)
                                    flip_horiz: true
                                });
                                Webcam.attach('#minhaCamera');
                            </script>
                            <!-- A button for taking snaps -->

                            <div id="botaoPreFoto">
                                <!-- ESTE BOTÃO É EXIBIDO ANTES DE EFETUAR A FOTO -->
                                <button type="button" id="btn_visualiza" class="btn btn-outline-light" onClick="visualizaFoto()">Capturar Imagem</button>
                                <button type="button" id="btn_cancela" class="btn btn-outline-light" onClick="cancelaFoto()">Cancelar Foto</button>
                            </div>
                            <div id="botaoTiraFoto" style="display:none">
                                <!-- These buttons are shown after a snapshot is taken -->
                                <button type="button" id="btn_cancelafoto" class="btn btn-outline-light" onClick="cancelaVisualizar()">Cancelar</button>
                                <button type="button" id="btn_salvafoto" class="btn btn-outline-light" onClick="salvaFoto()">Gravar</button>
                            </div>
                        </div>
                        <button type="button" id="btn_tirafoto" class="btn btn-outline-light" onClick="tiraFoto()">Tirar foto</button>
                    </div>
                </div>
                <br>
                <br>
                <button type="submit" id="btn_cadastrar" class="btn btn-success">Cadastrar</button>
            </div>
        </form>

        <div id="results" style="display:none">
             Your captured image will appear here... 
        </div>
         Code to handle taking the snapshot and displaying it locally 
        <script language="JavaScript">
            // preload shutter audio clip
//            var shutter = new Audio();
//            shutter.autoplay = false;
//            shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg' : 'shutter.mp3';

            function tiraFoto() {
                //console.log("FUNCIONANDO");
                document.getElementById('btn_tirafoto').style.display = 'none';
                document.getElementById('fotosemimagem').style.display = 'none';
                document.getElementById('fotografia').style.display = '';
            }
            function cancelaFoto() {
                document.getElementById('btn_tirafoto').style.display = '';
                document.getElementById('fotosemimagem').style.display = '';
                document.getElementById('fotografia').style.display = 'none';
            }

            function visualizaFoto() {
//                // play sound effect
//                try {
//                    shutter.currentTime = 0;
//                } catch (e) {
//                    ;
//                } // fails in IE
//                shutter.play();

                // freeze camera so user can preview current frame
                Webcam.freeze();

                //document.getElementById("foto").value=data_uri;

                // swap button sets
                document.getElementById('botaoPreFoto').style.display = 'none';
                document.getElementById('botaoTiraFoto').style.display = '';
            }
            function cancelaVisualizar() {
                // cancel preview freeze and return to live camera view
                Webcam.unfreeze();
                // swap buttons back to first set
                document.getElementById('botaoPreFoto').style.display = '';
                document.getElementById('botaoTiraFoto').style.display = 'none';
            }
            function salvaFoto() {
                // actually snap photo (from preview freeze) and display it
                Webcam.snap(function (data_uri) {
                    document.getElementById("foto").value = data_uri;
                    document.getElementById('fotosemimagem').style.display = '';

                    Webcam.reset();
                });
            }
        </script>
    </body>
</html>
