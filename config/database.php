<?php

$server = 'localhost';
$bd = 'prueba';
$usr='root';
$pwd ='1450pepe';

$con = new mysqli($server,$usr,$pwd,$bd);

if ($con -> connect_error) {
	die('Error en la connexiôn'.$con->connect_error);
}


//printf("Conexion exitosa!!: %s\n", $con->server_info);




?>