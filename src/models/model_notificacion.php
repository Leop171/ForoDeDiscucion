<?php
include_once($_SERVER["DOCUMENT_ROOT"]. "/ForoDeDiscucion/rutas.php");
include_once(UTILS. "config.php");
include_once(UTILS. "respuesta_modelo.php");
// include_once(UTILS. "session.php");

/*
Crear la funcion
Iniciar el try-catch
Crear la conexion
Llamar al proceso
Blindar los parametros
Ejecutar el proceso
Cerar la ejecucion
Codigo catch
*/

// var_dump(SeleccionarNotificacion(16));

function SeleccionarNotificacion($codigo){
    try{
        $conexion = Conexion();

        $notificacionSeleccion = $conexion ->prepare("CALL spSelectNotificacion(:codigo)");
        $notificacionSeleccion ->bindParam(":codigo", $codigo);
        $notificacionSeleccion ->execute();
        $resultado = $notificacionSeleccion ->fetchAll(PDO::FETCH_ASSOC);
        $notificacionSeleccion ->closeCursor();

        // EL MODELO SOLO RETORNA EL RESULTADO DE LA CONSULTAD, EN CASO DE ERROR DEBE LANZAR UNO GENERICO
        // return $resultado;
        // echo json_encode($resultado); // ESTO SI FUNCIONA
        return $resultado; // ESTO SI FUNCIONA
        
    }catch(PDOException $Error){
        echo $Error ->getMessage(); // Si el modelo lanza error es por que no fue controlado en el servidor, imprimir error generico
        // var_dump(DevolverEstado("5000"));
    }
}


function InsertarNotificaion($codigoReceptor, $codigoEmisor, $texto, $tipo, $direccion, $imagen){
    try{
        $conexion = Conexion();

        $notificacionInsertar = $conexion ->prepare("CALL spInsertNotificacion(:codigoReceptor, :codigoEmisor, :texto, :tipo, :direccion, :imagen)");
        $notificacionInsertar ->bindParam(":codigoReceptor", $codigoReceptor);
        $notificacionInsertar ->bindParam(":codigoEmisor", $codigoEmisor);
        $notificacionInsertar ->bindParam(":texto", $texto);
        $notificacionInsertar ->bindParam(":tipo", $tipo);
        $notificacionInsertar ->bindParam(":direccion", $direccion);
        $notificacionInsertar ->bindParam(":imagen", $imagen);
        $notificacionInsertar ->execute();
        $notificacionInsertar ->closeCursor();

    }catch(PDOException $Error){
        echo $Error ->getMessage();

    }
}

// <>

?>