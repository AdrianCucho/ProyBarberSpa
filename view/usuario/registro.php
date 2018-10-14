<?php
	$root = $_SERVER['DOCUMENT_ROOT'];

	require_once $root.'/ProyBarberSpa/config/database.php';
	require_once $_SERVER["DOCUMENT_ROOT"]."/ProyBarberSpa/config/funciones.php";

	$errors = array();

	if (!empty($_POST)) {
		$usuario = mysqli->real_escape_string($_POST['usuario'])
		$password = mysqli->real_escape_string($_POST['password'])
		$correo = mysqli->real_escape_string($_POST['correo'])
		$nombre = mysqli->real_escape_string($_POST['nombre'])
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Registrar Usuario</title>
	<link rel="stylesheet" type="text/css" href="css/varios.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="../css/principal.css">
</head>

<body>

	<form id="formu-registro" action="<?php $_SERVER['PHP_SELF'] ?>" method="POST">
		<table>
			<tr><td>usuario</td><td><input type="text" name="usuario"/></td></tr>
			<tr><td>password</td><td><input type="password" name="password" /></td></tr>
			<tr><td>correo</td><td><input type="text" name="correo"/></td></tr>
			<tr><td>nombre</td><td><input type="text" name="nombre"/></td></tr>
			<tr><td rowspan="2"><input type="submit" name="boton" value="registrar"></td></tr>
			
		</table>		
		
	</form>

</body>
</html>



