<?php

$server = '192.168.0.31';
$bd = 'prueba';
$usr='root';
$pwd ='1450pepe';

$con = new mysqli($server,$usr,$pwd,$bd);

if ($con -> connect_error) {
	die('Error en la connexiôn'.$con->connect_error);
}


printf("Conexion exitosa!!: %s\n", $con->server_info);




?>