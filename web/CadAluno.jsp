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

        </style>

        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

    </head>
    <body>
        <div>Cadastro de aluno</div>

        <form id="formulario" action="cadaluno" method="POST">
            <div class="container" id="cadastro">
                <div class="row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="R.M.">
                        <input type="text" class="form-control" placeholder="Nome">
                        <input type="text" class="form-control" placeholder="Endereço">
                    </div>
                    <div class="col">
                        <img width="250" height="200" src="imagens/semimagem.png" alt="..." class="img-thumbnail" >
                        
                        <div id="fotografia" style="display:none">
                            <div id="my_camera"></div>
                            <!-- First, include the Webcam.js JavaScript Library -->
                            <script type="text/javascript" src="js/webcam.min.js"></script>
                            <!-- Configure a few settings and attach camera -->
                            <script language="JavaScript">
                                Webcam.set({
                                    // live preview size
                                    width: 320,
                                    height: 240,
                                    // device capture size
                                    dest_width: 640,
                                    dest_height: 480,
                                    // final cropped size
                                    crop_width: 480,
                                    crop_height: 480,
                                    // format and quality
                                    image_format: 'jpeg',
                                    jpeg_quality: 90,
                                    // flip horizontal (mirror mode)
                                    flip_horiz: true
                                });
                                Webcam.attach('#my_camera');
                            </script>
                            <!-- A button for taking snaps -->

                            <div id="pre_take_buttons">
                                <!-- This button is shown before the user takes a snapshot -->
                                <input type=button value="Take Snapshot" onClick="preview_snapshot()">
                            </div>
                            <div id="post_take_buttons" style="display:none">
                                <!-- These buttons are shown after a snapshot is taken -->
                                <input type=button value="&lt; Take Another" onClick="cancel_preview()">
                                <input type=button value="Save Photo &gt;" onClick="save_photo()" style="font-weight:bold;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>


        <!--SÓ PARA GUARDAR O VALOR DA FOTO BASE64-->
        <input type="hidden" name="foto" id="foto" value=""/><br><br>

<!--
        <div id="my_photo_booth">
                        <div id="my_camera"></div>
                         First, include the Webcam.js JavaScript Library 
                        <script type="text/javascript" src="js/webcam.min.js"></script>
                         Configure a few settings and attach camera 
                        <script language="JavaScript">
                            Webcam.set({
                                // live preview size
                                width: 320,
                                height: 240,
                                // device capture size
                                dest_width: 640,
                                dest_height: 480,
                                // final cropped size
                                crop_width: 480,
                                crop_height: 480,
                                // format and quality
                                image_format: 'jpeg',
                                jpeg_quality: 90,
                                // flip horizontal (mirror mode)
                                flip_horiz: true
                            });
                            Webcam.attach('#my_camera');
                        </script>
                         A button for taking snaps 
            
                        <div id="pre_take_buttons">
                             This button is shown before the user takes a snapshot 
                            <input type=button value="Take Snapshot" onClick="preview_snapshot()">
                        </div>
                        <div id="post_take_buttons" style="display:none">
                             These buttons are shown after a snapshot is taken 
                            <input type=button value="&lt; Take Another" onClick="cancel_preview()">
                            <input type=button value="Save Photo &gt;" onClick="save_photo()" style="font-weight:bold;">
                        </div>

        </div>-->

        <div id="results" style="display:none">
            <!-- Your captured image will appear here... -->
        </div>
        <!-- Code to handle taking the snapshot and displaying it locally -->
        <script language="JavaScript">
            // preload shutter audio clip
            var shutter = new Audio();
            shutter.autoplay = false;
            shutter.src = navigator.userAgent.match(/Firefox/) ? 'shutter.ogg' : 'shutter.mp3';

            function preview_snapshot() {
                // play sound effect
                try {
                    shutter.currentTime = 0;
                } catch (e) {
                    ;
                } // fails in IE
                shutter.play();

                // freeze camera so user can preview current frame
                Webcam.freeze();

                //document.getElementById("foto").value=data_uri;

                // swap button sets
                document.getElementById('pre_take_buttons').style.display = 'none';
                document.getElementById('post_take_buttons').style.display = '';
            }

            function cancel_preview() {
                // cancel preview freeze and return to live camera view
                Webcam.unfreeze();

                // swap buttons back to first set
                document.getElementById('pre_take_buttons').style.display = '';
                document.getElementById('post_take_buttons').style.display = 'none';
            }
            function save_photo() {
                // actually snap photo (from preview freeze) and display it
                Webcam.snap(function (data_uri) {
                    // display results in page
                    document.getElementById('results').innerHTML = '<h2>Here is your large, cropped image:</h2>' +
                            '<img src="' + data_uri + '"/><br/></br>' +
                            '<a href="' + data_uri + '" target="_blank">Open image in new window...</a>';
                    // shut down camera, stop capturing
                    document.getElementById("foto").value = data_uri;

                    Webcam.reset();
                    // show results, hide photo booth
                    document.getElementById('results').style.display = '';
                    document.getElementById('my_photo_booth').style.display = 'none';
                });
            }
        </script>
        <br>
        <input type="submit" value="Cadastrar" name="btnCadAluno" />


</body>
</html>
