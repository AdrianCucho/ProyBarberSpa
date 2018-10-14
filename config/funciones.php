<?php

function isNullLogin($usuario, $password){
			if(strlen(trim($usuario)) < 1 || strlen(trim($password)) < 1)
			{
				return true;
			}
			else
			{
				return false;
			}		
}

	function login($usuario, $password)
	{
		global $con;
		
		$stmt = $con->prepare("SELECT idusuario, idrol, password FROM usuario WHERE idusuario = ? || correo = ? and password = ?LIMIT 1 ");
		$stmt->bind_param("sss", $usuario, $usuario,$password);
		$stmt->execute();
		$stmt->store_result();
		$rows = $stmt->num_rows;
		
		if($rows > 0) {
			
			if(isActivo($usuario)){
				
				$stmt->bind_result($idusuario, $idrol, $contraseña);
				$stmt->fetch();

				if($contraseña == $password){

				lastSession($idusuario);
					$_SESSION['idusuario'] = $idusuario;
					$_SESSION['idrol'] = $idrol;

					if ($idrol == 'R'){ 
						header("location: view/principal.php");
					}else if($idrol == 'V'){ 
						header("location: view/principalVentas.php");
					}else if($idrol == 'A'){ 
						header("location: view/principalAdministrador.php");
					}else{
						header("location: view/principalRecepcion.php");
					}

				}else{
					$errors = "La contraseña es incorrecta";
				}		
				$errors ="Usuario no se encuentra activo";	
			}
			$errors="Usuario o incorrecto";
		}
		return $errors;
	}


	function lastSession($id){
		global $con;

		$stmt = $con->prepare("update usuario set fechaultimosesion = now() where idusuario =?");
		$stmt->bind_param('s',$id);
		$stmt->execute();
		$stmt->close();

	}

	function isActivo($id){
		global $con;

		$stmt = $con->prepare("select isactivo from usuario where idusuario = ? ");
		$stmt->bin_param('s',$id);
		$stmt->execute();
		$stmt->bind_result($activacion);
		$stmt->fetch();

		if ($activacion == 1) {
			return true;
		}else{
			return false;
		}
	}

?>