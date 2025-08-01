var tabla;

function init() {
    $("#cat_form").on("submit", function(e){
        guardaryeditar(e);
    })
}

function guardaryeditar(e){
    e.preventDefault();
    var formData = new FormData($("#cat_form")[0])
    $.ajax({
        url: "../../controller/categoria.php?op=guardaryeditar",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(datos){
            $("#cat_form")[0].reset();
            $("#modalnuevacategoria").modal('hide');
            $('#cat_id').val('').trigger('change');
            $('#cat_nom').html('');
            $('#dp_ids').val(null).trigger('change');
            $('#emp_ids').val(null).trigger('change');
            $("#cat_data").DataTable().ajax.reload();
            swal({
                title: "Guardado!",
                text: "Se ha guardado correctamente el nuevo registro.",
                type: "success",
                confirmButtonClass: "btn-success"
            });          
        }
    })
}


$(document).ready(function () {

    tabla = $('#cat_data').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        "searching": true,
        lengthChange: false,
        colReorder: true,
        "buttons": [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
            'pdfHtml5',
        ],
        "ajax": {
            url: '../../controller/categoria.php?op=listar',
            type: 'post',
            dataType: 'json',
            error: function (e) {
                console.log(e.responseText);
            }
        },
        "bDestroy": true,
        "responsive": true,
        "bInfo": true,
        "iDisplayLength": 10,
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

    $.post("../../controller/departamento.php?op=combo", function (data) {
        $('#dp_ids').html(data);
    });

    $.post("../../controller/empresa.php?op=combo", function (data) {
        $('#emp_ids').html(data);
    });

})

function editar(cat_id) {
    $("#mdltitulo").html('Editar registro');

    $.post("../../controller/categoria.php?op=mostrar", {cat_id:cat_id}, function(data) {
        data = JSON.parse(data);
        $('#cat_id').val(data.categoria.cat_id);
        $('#cat_nom').val(data.categoria.cat_nom);
        // Se asigna el array de IDs a los combos de selección múltiple
        $('#dp_ids').val(data.departamentos).trigger('change');
        $('#emp_ids').val(data.empresas).trigger('change');

    });    

    $("#modalnuevacategoria").modal("show");
}
function eliminar(cat_id) {
    swal({
        title: "¿Estas que quieres eliminar esta categoria?",
        text: "Una vez eliminado no podrás volver a recuperarlo",
        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Si, eliminar!",
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: false,
        closeOnCancel: false
    },
    function(isConfirm) {
        if (isConfirm) {
            $.post("../../controller/categoria.php?op=eliminar", {cat_id:cat_id}, function(data) {
                $('#cat_data').DataTable().ajax.reload(); 
                swal({
                    title: "Eliminado!",
                    text: "categoria eliminada correctamente",
                    type: "success",
                    confirmButtonClass: "btn-success"
                }); 
            });
        } else {
            swal({
                title: "Cancelado",
                text: "La categoria no fue eliminada",
                type: "error",
                confirmButtonClass: "btn-danger"
                
            });
        }
    });
}

$(document).on("click", "#btnnuevacategoria", function(){
    $("#mdltitulo").html('Nuevo registro');
    $("#cat_form")[0].reset();
    $("#modalnuevacategoria").modal("show");
})

$('#modalnuevacategoria').on('hidden.bs.modal', function() {
    $("#cat_form")[0].reset();
    $('#cat_id').val('').trigger('change');
    $('#cat_nom').html('');
    $('#dp_ids').val(null).trigger('change');
    $('#emp_ids').val(null).trigger('change');
});

init();