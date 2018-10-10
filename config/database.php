<?php

$server = 'localhost';
$bd = 'SYS_PRUEBA1';
$usr='root';
$pwd ='1450pepe';

$con = new mysqli($server,$usr,$pwd,$bd);

if ($con -> connect_error) {
	die('Error en la connexiôn'.$con->connect_error);
	exit();
}


//printf("Conexion exitosa!!: %s\n", $con->server_info);




?>