try{

    fetch("/ForoDeDiscucion/src/controllers/solicitud.php")
        .then(response => response.json())
        .then(data => {
            const publicacionesDiv = document.getElementById("solicitudes");
            let errorEsp = document.getElementById("errorCampos");
            // Limpiar contenido previo
    
            if(data[0]["estado"] == true){            
            publicacionesDiv.innerHTML = '';
            console.log(data) // Se debe eliminar cuando todo funcione al 100 solo es para ver la data que se carga
    
            const rutaBase = "/ForoDeDiscucion/uploads/";
    
            let imagenHtml = ``;
            
            data[1].forEach(element => {
                console.log(element); // Se debe eliminar cuando todo funcione al 100 solo sirve para ver las iteraciones del bucle sobre la data

                const publicacionHtml = `
                    <div id="solicitud">
                        <img id="imagen" src="${(rutaBase + element["direccion"])}" alt="imagen-usuario">
                        <p id="usuario-nombre">${(element["nombre"])}</p>
                        <input type="submit" value="Aceptar" class="botones" id="aceptar">
                        <input type="submit" value="Rechazar" class="botones" id="rechazar">                    
                        
                    </div>
                `;
                // <div id="notificacion">
                //         <img id="imagen" src"${(element["imagen"])}" alt="imagenes_notificaciones">
                //         <p id="usuario-nombre">${(element["texto"])}</p>
                //         <p id="fecha">${(element["fecha"])}<p>
                //     </div>

            // <>
            publicacionesDiv.innerHTML += publicacionHtml;
            });

        }else{
            errorEsp.textContent = data[0]["mensaje"];
            console.log("Succes", data.estado, "::::", data, "Esto es JS"); // Esta impresion sirve para ver la data que recibe el cliente               
        }


        })
        .catch(error => console.log(error));
        // .catch(error => console.log('Error al cargar las publicaciones:',  JSON.stringify(error)));
    }catch(err){
        console.log("Error en el try principla" + err);
        let errorEsp = document.getElementById("errorCampos");
        // errorEsp.textContent = DevolverRespuesta(err);
    }

