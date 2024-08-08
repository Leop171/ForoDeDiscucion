<?php
session_start();

if(!isset($_SESSION["codigoUsuario"])){
    header("Location: registro.html");
    exit();
}
else{
    include __DIR__. '/../php/config.php';
    include __DIR__. "/../php/mysql.php";
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="\ForoDeDiscucion\estilos\estilos-perfil.css">
    <title>Perfil</title>
</head>
<body>
    <div class="espacio-personal">
        <div class="foto-usuario">
            <img src="" alt="Foto de Perfil">
        </div>
        <input type="file" name="actulizarFoto" class="foto-actualizar" id="actulizarFoto">

        </div>
        <div class="informacion-personal">
            <p id="usuario-nombre"><?php echo htmlspecialchars($usuarioNombre) ?></p>
            <p id="usuario-correo"><?php echo htmlspecialchars($usuarioCorreo) ?></p>
            <p id="usuario-descripcion"><?php  echo htmlspecialchars($usuarioDescripcion) ?></p>
            <p id="usuario-fecha"><p>Se unio: <?php echo htmlspecialchars($usuarioFecha)?></p>
            <p><?php echo $_SESSION["codigoUsuario"]; ?></p>
        </div>

    </div>    

    <nav>
        <a href="\ForoDeDiscucion\maquetado\iniciar-sesion.html">Iniciar sesion</a>
        <a href="\ForoDeDiscucion\maquetado\registro.html">Registrarse</a>
        <a href="\ForoDeDiscucion\maquetado\perfil.html">Perfil</a>
        <a href="\ForoDeDiscucion\maquetado\inicio.php">Inicio</a>
    </nav>

</body>
</html>