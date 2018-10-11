<?php

	include ('../config/database.php');
	include '../config/funciones.php';

	$errors = array();

	if (!empty($_POST)) {
		# code...
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>Registrar Usuario</title>
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




<?php

echo 'Te amo';
?>