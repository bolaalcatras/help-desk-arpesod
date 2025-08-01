function init() {

}
boxdetalleticket
$(document).ready(function () {

    var rol_id = $("#rol_idx").val();

    var tick_id = getUrlParameter('ID');

    listarDetalle(tick_id);

    $('#tickd_descrip').summernote({
        height: 200,
        lang: "es-ES",
        callbacks: {
            onImageUpload: function (image) {
                console.log("Image detect...");
                myimagetreat(image[0]);
            },
            onPaste: function (e) {
                console.log("Text detect...");
            }
        },
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
    });

    $('#tickd_descripusu').summernote({
        height: 200,
        lang: 'es-ES',
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
    });

    $('#tickd_descripusu').summernote('disable');

    tabla = $('#documentos_data').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        "searching": false,
        "info": false,
        lengthChange: false,
        colReorder: true,
        "buttons": [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5',
        ],
        "ajax": {
            url: '../../controller/documento.php?op=listar',
            type: 'post',
            data: { tick_id: tick_id },
            dataType: 'json',
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 3,
        "autoWidth": false,
        "language": {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Mostrar _MENU_ registros",
            "sZeroRecords": "No se encontraron resultados",
            "sEmptyTable": "Ningún dato disponible en esta tabla",
            "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    }).DataTable();

    getRespuestasRapidas();

});

function getRespuestasRapidas() {

    $.post("../../controller/respuestarapida.php?op=combo", function (data) {
        $('#fast_answer_id').html('<option value="">Seleccionar</option>' + data);

    });

}

function getDestinatarios(cats_id) {

    var dp_idx = $('#dp_idx').val();

    $("#answer_id").off('change').on('change', function () {
        answer_id = $(this).val();

        if (answer_id == 0) {
            $('#dest_id').html('<option value="">Seleccionar</option>');
            $('#tickd_descrip').summernote('code', '');
        } else {

            $.post("../../controller/destinatarioticket.php?op=combo", { answer_id: answer_id, dp_id: dp_idx, cats_id: cats_id }, function (data) {
                $('#dest_id').html('<option value="">Seleccionar</option>' + data);
            });

            $("#dest_id").off('change').on('change', function () {
                dest_id = $(this).val();

                if (dest_id == 0) {
                    $('#tickd_descrip').summernote('code', '');
                } else {
                    $.post("../../controller/respuestarapida.php?op=mostrar", { answer_id: answer_id }, function (data) {
                        data = JSON.parse(data);
                        respuesta = data.answer_nom
                        $.post("../../controller/destinatarioticket.php?op=mostrar", { dest_id: dest_id }, function (data) {


                            data = JSON.parse(data);
                            $('#tickd_descrip').summernote('code', `${respuesta} se envio el ticekt a ${data.nombre_usuario}`);
                        });
                    });
                }
            })


        }


    });

}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
}

$(document).on('click', '#btnenviar', function () {
    if ($('#tickd_descrip').summernote('isEmpty')) {
        swal("Atención", "Debe ingresar una respuesta", "warning");
        return false;
    }

    var tick_id = getUrlParameter('ID');
    var usu_id = $('#user_idx').val();
    var tickd_descrip = $('#tickd_descrip').val();

    var formData = new FormData($('#detalle_form')[0])

    formData.append("tick_id", tick_id);
    formData.append("usu_id", usu_id);
    formData.append("tickd_descrip", tickd_descrip);

     // --- MODIFICADO: Lógica para enviar los datos del flujo ---
    if ($('#checkbox_avanzar_flujo').is(':checked')) {
        var siguiente_paso_info = $('#panel_checkbox_flujo').data('siguiente-paso-id');
        formData.append("siguiente_paso_id", siguiente_paso_info.paso_id);

        // Verificamos si el paso requiere selección manual
        if (siguiente_paso_info.requiere_seleccion_manual == 1) {
            var nuevo_asignado_id = $('#nuevo_asignado_id').val();
            if (!nuevo_asignado_id) {
                swal("Atención", "Debe seleccionar un agente para el siguiente paso.", "warning");
                return false;
            }
            // Si la selección es manual, enviamos el ID del usuario seleccionado
            formData.append("nuevo_asignado_id", nuevo_asignado_id);
        }
        // Si no es manual, no se envía 'nuevo_asignado_id' y el backend lo asignará automáticamente.
    }

    var totalFile = $('#fileElem').val().length;
    for (var i = 0; i < totalFile; i++) {
        formData.append('files[]', $('#fileElem')[0].files[i]);
    }

    $.ajax({
        url: "../../controller/ticket.php?op=insertdetalle",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function (data) {
            console.log(data);
            var resultado = JSON.parse(data);

            listarDetalle(tick_id);

            swal("Correcto", "Respuesta enviada correctamente", "success");

            // Limpiar el formulario 
            $('#tickd_descrip').summernote('reset');
            $('#fileElem').val('');
        }
    })




});

$(document).on('click', '#btn_registrar_evento', function () {
    var tick_id = getUrlParameter('ID');
    var answer_id = $('#fast_answer_id').val();
    var usu_id = $('#user_idx').val();

    // Validamos que se haya seleccionado una opción
    if (!answer_id) {
        swal("Atención", "Por favor, seleccione una respuesta rápida para registrar.", "warning");
        return;
    }

    // Pedimos confirmación al usuario
    swal({
        title: "¿Estás seguro?",
        text: "Se registrará este evento en el historial del ticket y se marcará el ticket con este estado.",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-primary",
        confirmButtonText: "Sí, registrar ahora",
        cancelButtonText: "Cancelar",
        closeOnConfirm: false
    }, function(isConfirm) {
        if (isConfirm) {
            $.post("../../controller/ticket.php?op=registrar_error", { tick_id: tick_id, answer_id: answer_id, usu_id: usu_id })
                .done(function() {
                    swal("¡Registrado!", "El evento ha sido añadido al historial del ticket.", "success");
                    // Recargamos el historial para ver el nuevo registro al instante
                    listarDetalle(tick_id);
                    // Reseteamos el combo
                    $('#fast_answer_id').val('');
                })
                .fail(function() {
                    swal("Error", "No se pudo registrar el evento.", "error");
                });
        }
    });
});


$(document).on('click', '#btncerrarticket', function () {
    swal({
        title: "¿Estas seguro que quieres cerrar el ticket?",
        text: "Una vez cerrado no podrás volver a abrirlo",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Si, cerrar ticket!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: false
    },
        function (isConfirm) {
            if (isConfirm) {
                var tick_id = getUrlParameter('ID');
                var usu_id = $('#user_idx').val();
                updateTicket(tick_id, usu_id);

                setTimeout(function () {
                    $.post("../../controller/email.php?op=ticket_cerrado", { tick_id: tick_id }, function (resp) {
                    }).fail(function (err) {
                        console.error("Error al enviar el correo:", err.responseText);
                    });
                }, 0);

            } else {
                swal({
                    title: "Cancelado",
                    text: "El ticket sigue abierto.",
                    type: "error",
                    confirmButtonClass: "btn-danger"

                });
            }
        });

});


$(document).on("click", "#btn_aprobar_flujo", function () {
    swal({
        title: "¿Estás seguro de aprobar este ticket?",
        text: "Una vez aprobado, el ticket avanzará al siguiente paso del flujo y será reasignado automáticamente.",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-success",
        confirmButtonText: "Sí, ¡Aprobar ahora!",
        cancelButtonText: "No, cancelar",
        closeOnConfirm: false
    },
        function (isConfirm) {
            if (isConfirm) {
                var tick_id = getUrlParameter('ID');
                // Se envía la petición al controlador de tickets
                $.post("../../controller/ticket.php?op=aprobar_ticket_jefe", { tick_id: tick_id }, function (data) {
                    swal({
                        title: "¡Aprobado!",
                        text: "El ticket ha sido reasignado y el flujo continúa.",
                        type: "success",
                        confirmButtonClass: "btn-success"
                    });

                    // Recargamos la página después de un momento para ver los cambios.
                    // El ticket ahora tendrá otro asignado y el botón de aprobar ya no será visible.
                    setTimeout(function () {
                        location.reload();
                    }, 1800);

                }).fail(function (jqXHR) {
                    // Si el backend devuelve un error, lo mostramos
                    swal("Error", "No se pudo completar la aprobación. Detalle: " + jqXHR.responseText, "error");
                });
            }
        });
});


function updateTicket(tick_id, usu_id) {
    $.post("../../controller/ticket.php?op=update", { tick_id: tick_id, usu_id: usu_id }, function (data) {
        swal({
            title: "Cerrado!",
            text: "El ticket ha sido cerrado correctamente.",
            type: "success",
            confirmButtonClass: "btn-success"
        }, function () {
            listarDetalle(tick_id);
        }
        );
    });

}


function listarDetalle(tick_id) {

    $.post("../../controller/ticket.php?op=listardetalle", { tick_id: tick_id }, function (data) {
        $('#lbldetalle').html(data);

    });

    $.post("../../controller/ticket.php?op=mostrar", { tick_id: tick_id }, function (data) {
        data = JSON.parse(data);
        console.log(data.tick_estado_texto);

        $('#lbltickestado').html(data.tick_estado);
        $('#lblprioridad').html(data.pd_nom);
        $('#lblnomusuario').html(data.usu_nom + ' ' + data.usu_ape);
        $('#lblestado_tiempo').html(data.estado_tiempo);
        $('#lblfechacrea').html(data.fech_crea);
        $('#lblticketid').html("Detalle del tikect #" + data.tick_id);
        $('#cat_id').val(data.cat_nom);
        $('#cats_id').val(data.cats_nom);
        $('#emp_id').val(data.emp_nom);
        $('#dp_id').val(data.dp_nom);
        $('#tick_titulo').val(data.tick_titulo);
        $('#tickd_descripusu').summernote('code', data.tick_descrip);

        var usu_id = $('#user_idx').val();
        if (usu_id != data.usu_asig) {
            $("#btncerrarticket").addClass('hidden');
        };

        $('#panel_aprobacion_jefe').hide();

        if ((data.paso_actual_id === null || data.paso_actual_id == 0) && data.tick_estado_texto === 'Abierto' && data.usu_asig == usu_id) {
            // Si todas las condiciones se cumplen, muestra el panel
            $('#panel_aprobacion_jefe').show();
            // $('#boxdetalleticket').hide(); 
        } else {
            $('#boxdetalleticket').show();
            if (data.tick_estado_texto == 'Cerrado') {
                $('#boxdetalleticket').hide();
            };
        }


    });

    $.post("../../controller/ticket.php?op=mostrar", { tick_id: tick_id }, function (data) {
        data = JSON.parse(data);
        var usu_asigx = $('#user_idx').val();
        console.log(usu_asigx);
        
        console.log(data);
        // ... tu código para llenar el resto de la vista ...

        // Lógica para construir la línea de tiempo
        if (data.timeline_steps && data.timeline_steps.length > 0) {
            $('#panel_linea_tiempo').show();
            var timeline_html = '';

            data.timeline_steps.forEach(function (paso) {
                var status_class = '';
                if (paso.estado === 'Completado') {
                    status_class = 'timeline-step-completed';
                } else if (paso.estado === 'Actual') {
                    status_class = 'timeline-step-active';
                } else { // Pendiente
                    status_class = 'timeline-step-pending';
                }

                timeline_html += '<li class="' + status_class + '">';
                timeline_html += '  <div class="step-name">' + paso.paso_nombre + '</div>';
                timeline_html += '</li>';
            });

            $('#timeline_flujo').html(timeline_html);
        } else {
            $('#panel_linea_tiempo').hide();
        }

        $('#panel_checkbox_flujo').hide(); // Ocultamos por defecto

        if (data.siguiente_paso) {
            // Si el servidor nos dice que hay un siguiente paso, mostramos el checkbox
            $('#panel_checkbox_flujo').show();
            // Y guardamos el ID del siguiente paso para usarlo después
            $('#panel_checkbox_flujo').data('siguiente-paso-id', data.siguiente_paso);
        }

        if (data.siguiente_paso || data.paso_actual_info == null) {
            // SI hay un siguiente paso, el flujo NO ha terminado.
            // Deshabilitamos el botón de cerrar.
            $('#btncerrarticket').prop('disabled', true);
        } else {
            // SI NO hay un siguiente paso (o el ticket no está en un flujo),
            // el botón debe estar habilitado.
            $('#btncerrarticket').prop('disabled', false);
        }
        // Ocultamos el panel por defecto en cada recarga
        $('#panel_guia_paso').hide();
    
        // Verificamos si el ticket está en un paso activo de un flujo
        if (data.paso_actual_info) {
            var pasoInfo = data.paso_actual_info;
    
            // Mostramos y llenamos el panel de guía
            $('#panel_guia_paso').show();
            $('#guia_paso_nombre').text('Paso Actual: ' + pasoInfo.paso_nombre);
            $('#guia_paso_tiempo').text(pasoInfo.paso_tiempo_habil);
    
            // Llenamos el editor Summernote con la descripción del paso
            // Si la descripción está vacía, no ponemos nada.
            if (pasoInfo.paso_descripcion) {
                console.log(pasoInfo.paso_descripcion);
                
                $('#tickd_descrip').summernote('code', pasoInfo.paso_descripcion);
            }
        }
    });
}

// --- NUEVO: Evento que se activa al marcar/desmarcar el checkbox de avanzar flujo ---
$(document).on('change', '#checkbox_avanzar_flujo', function() {
    console.clear(); // Limpiamos la consola para ver mejor
    console.log("--- INICIANDO DEPURACIÓN DE AVANCE DE FLUJO ---");
    console.log("Checkbox clickeado. Nuevo estado:", $(this).is(':checked') ? "Marcado" : "Desmarcado");

    // Obtenemos la información completa del siguiente paso que guardamos en el panel
    var siguiente_paso = $('#panel_checkbox_flujo').data('siguiente-paso-id');
    console.log("1. Datos del siguiente paso encontrados en el panel:", siguiente_paso);

    if ($(this).is(':checked')) {
        // Verificamos si los datos del siguiente paso existen
        if (siguiente_paso) {
            console.log("2. Verificando la regla 'requiere_seleccion_manual'. Valor:", siguiente_paso.requiere_seleccion_manual);
            
            // Preguntamos si este paso requiere selección manual (usando el "interruptor" de la BD)
            if (siguiente_paso.requiere_seleccion_manual == 1) {
                console.log("3. DECISIÓN: El paso REQUIERE selección manual. Pidiendo lista de usuarios...");
                // Si SÍ, pedimos la lista de usuarios y mostramos el combo
                $.post("../../controller/ticket.php?op=get_usuarios_por_paso", { paso_id: siguiente_paso.paso_id }, function(data) {
                    $('#nuevo_asignado_id').html(data).trigger('change');
                    $('#panel_siguiente_asignado').show();
                    console.log("4. Combo de usuarios cargado y mostrado.");
                });
            } else {
                console.log("3. DECISIÓN: El paso es AUTOMÁTICO. No se muestra el combo de selección.");
            }
        } else {
            console.error("Error: No se encontraron los datos del siguiente paso en el panel. Revisa la función listarDetalle.");
        }
    } else {
        // Si se desmarca, siempre ocultamos el combo
        $('#panel_siguiente_asignado').hide();
        console.log("Checkbox desmarcado. Panel de selección oculto.");
    }
    console.log("--- FIN DEPURACIÓN ---");
});

init();