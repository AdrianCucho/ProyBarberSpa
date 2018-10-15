<?php

$entero =1;
$cadena ="Hola";
$istrue = true;
$arraycolores = $arrayName = array('Azul','Negro');
$float=1.20;

echo $entero . $cadena . $arraycolores[1] . $float;

function varialesGlobales(){
  $local = "Soy la variable local";
echo $GLOBALS["global"];
echo $local;
}

$entero = (int);

$global="Soay la variable global";

varialesGlobales();

/*variable super globales
$_SERVER -->Informacion del entorno del servidor y de ejecucion.
$_GET --> Variables HTTP GET
$_POST --> Variables POST de http.
$_FILES __> variables de subida de ficheros HTTP.
$_REQUEST --> variablkes HTTP request.
$_SESSION --> variablke de session
$_ENV --> variable de entorno
$_COOKIE --> cookies HTTP.

*/
 ?>
