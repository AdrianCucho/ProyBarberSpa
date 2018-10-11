

<!DOCTYPE html>
<html id="body">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>LOGIN</title>
	<link rel="stylesheet" type="text/css" href="css/varios.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body >
	
	<div id="block1">
	</div>

	<div id="block2">
		<form id="blockform" action="<?php $_SERVER['PHP_SELF']; ?>" method="POST">
			<div class="titulo"><em>LOGIN</em></div>
			<div id="cuerpo">
				<label class="usuario">Usuario</label>
				<input class ="user" type="text" name="user" autofocus="true">
				<label class="clave">Contraseña</label>
				<input class ="password" type="password" name="password">

				<input class="submit" type="submit" name="enviar" value="INGRESAR" >
				<a href="view/principal.php">falso</a>
				<a href="#">¿Olvido su Contraseña?</a>
			</div>
		</form>
	</div>

</body>
</html>