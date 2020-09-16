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

        <form id="formulario" action="cadaluno" method="POST">
            <div class="container" id="cadastro">
                <div class="row">
                    <div class="col">
                        <input type="text" name="txtRmAluno" class="form-control" placeholder="R.M.">
                        <input type="text" name="txtNomeAluno" class="form-control" placeholder="Nome">
                        <input type="text" name="txtEndAluno" class="form-control" placeholder="Endereço">
                        <!--SÓ PARA GUARDAR O VALOR DA FOTO BASE64-->
                        <input type="hidden" name="foto" id="foto" value=""/><br><br>

                        <div class="area">
                            <video autoplay="true" id="webCamera">
                            </video>
                            <form target="POST">
                                <textarea  type="text" id="base_img" name="base_img"></textarea>
                                <button type="button" onclick="takeSnapShot()">Tirar foto e salvar</button>
                            </form>
                            <img id="imagemConvertida"/>
                            <p id="caminhoImagem" class="caminho-imagem"><a href="" target="_blank"></a></p>
                            <!--Scripts-->
                        </div>
                    </div>
                    <div class="col">
                        <img width="250" height="200" id="fotosemimagem" src="imagens/semimagem.png" alt="..." class="img-thumbnail">


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

        function loadCamera() {
            //Captura elemento de vÃ­deo
            var video = document.querySelector("#webCamera");
            //As opÃ§Ãµes abaixo sÃ£o necessÃ¡rias para o funcionamento correto no iOS
            video.setAttribute('autoplay', '');
            video.setAttribute('muted', '');
            video.setAttribute('playsinline', '');
            //--

            //Verifica se o navegador pode capturar mÃ­dia
            if (navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia({audio: false, video: {facingMode: 'user'}})
                        .then(function (stream) {
                            //Definir o elemento vÃ­de a carregar o capturado pela webcam
                            video.srcObject = stream;
                        })
                        .catch(function (error) {
                            alert("Oooopps... Falhou :'(");
                        });
            }
        }
        function takeSnapShot() {
            //Captura elemento de vÃ­deo
            var video = document.querySelector("#webCamera");

            //Criando um canvas que vai guardar a imagem temporariamente
            var canvas = document.createElement('canvas');
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            var ctx = canvas.getContext('2d');

            //Desnehando e convertendo as minensÃµes
            ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

            //Criando o JPG
            var dataURI = canvas.toDataURL('image/jpeg'); //O resultado Ã© um BASE64 de uma imagem.
            document.querySelector("#base_img").value = dataURI;

            sendSnapShot(dataURI); //Gerar Imagem e Salvar Caminho no Banco
        }

        function sendSnapShot(base64) {
            var request = new XMLHttpRequest();
            request.open('POST', 'save_photos.php', true);
            request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            request.onload = function () {
                console.log(request);
                if (request.status >= 200 && request.status < 400) {
                    //Colocar o caminho da imagem no SRC
                    var data = JSON.parse(request.responseText);

                    //verificar se houve erro
                    if (data.error) {
                        alert(data.error);
                        return false;
                    }

                    //Mostrar informaÃ§Ãµes
                    document.querySelector("#imagemConvertida").setAttribute("src", data.img);
                    document.querySelector("#caminhoImagem a").setAttribute("href", data.img);
                    document.querySelector("#caminhoImagem a").innerHTML = data.img.split("/")[1];
                } else {
                    alert("Erro ao salvar. Tipo:" + request.status);
                }
            };

            request.onerror = function () {
                alert("Erro ao salvar. Back-End inacessÃ­vel.");
            };

            request.send("base_img=" + base64); // Enviar dados
        }
        loadcamera();

//
//        function tiraFoto() {
//            //console.log("FUNCIONANDO");
//            document.getElementById('btn_tirafoto').style.display = 'none';
//            document.getElementById('fotosemimagem').style.display = 'none';
//            document.getElementById('fotografia').style.display = '';
//        }
//        function cancelaFoto() {
//            document.getElementById('btn_tirafoto').style.display = '';
//            document.getElementById('fotosemimagem').style.display = '';
//            document.getElementById('fotografia').style.display = 'none';
//        }
//
//        function visualizaFoto() {
//            Webcam.freeze();
//
//            // swap button sets
//            document.getElementById('botaoPreFoto').style.display = 'none';
//            document.getElementById('botaoTiraFoto').style.display = '';
//        }
//        function cancelaVisualizar() {
//            // cancel preview freeze and return to live camera view
//            Webcam.unfreeze();
//            // swap buttons back to first set
//            document.getElementById('botaoPreFoto').style.display = '';
//            document.getElementById('botaoTiraFoto').style.display = 'none';
//        }
//        function salvaFoto() {
//            // actually snap photo (from preview freeze) and display it
//            Webcam.snap(function (data_uri) {
//                document.getElementById("foto").value = data_uri;
//                document.getElementById('fotosemimagem').style.display = '';
//
//                Webcam.reset();
//            });
//        }
    </script>
</body>
</html>
