<div class="modal fade bd-example-modal-lg"
    id="modalnuevasubcategoria"
    tabindex="-1"
    role="dialog"
    aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                    <i class="font-icon-close-2"></i>
                </button>
                <h4 class="modal-title" id="mdltitulo"></h4>
            </div>
            <form method="post" id="cats_form">
                <div class="modal-body">

                    <input type="hidden" id="cats_id" name="cats_id">
                    <fieldset class="form-group">
                        <label class="form-label semibold" for="cat_id">Categoria</label>
                        <select class="form-control" id="cat_id" name="cat_id" placeholder="Seleccione una categoria" required>
                        </select>
                    </fieldset>
                    <div>
                        <div class="form-group">
                            <label class="form-label semibold" for="cats_nom">Nombre</label>
                            <input type="text" class="form-control" id="cats_nom" name="cats_nom" placeholder="Ingrese un nombre" required>
                            <div></div>
                        </div>
                    </div>
                    <fieldset class="form-group">
                        <label class="form-label semibold" for="pd_id">Prioridad</label>
                        <select class="form-control" id="pd_id" name="pd_id" placeholder="Seleccione una prioridad" required>
                        </select>
                    </fieldset>
                    <fieldset class="form-group semibold">
                        <label class="form-label" for="cats_descrip">Descripcion</label>
                        <div class="summernote-theme-1">
                            <textarea id="cats_descrip" name="cats_descrip" class="summernote" name="name"></textarea>
                        </div>
                    </fieldset>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" name="action" id="#" value="add" class="btn btn-rounded btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade"
    id="modalCargueMasivo"
    tabindex="-1"
    role="dialog"
    aria-labelledby="cargueMasivoLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <form action="../../cargues/carguesubcategorias.php" method="post" enctype="multipart/form-data">
            <input type="hidden" name="sheet_name" value="Subcategorias">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="modal-close" data-dismiss="modal" aria-label="Close">
                        <i class="font-icon-close-2"></i>
                    </button>
                    <h4 class="modal-title" id="cargueMasivoLabel">Cargue Masivo de Subategorías</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="form-label" for="archivo_subcategorias">Seleccionar Archivo Excel</label>
                        <p class="form-text text-muted">El archivo debe tener las columnas: NOMBRE_SUBCATEGORIA, CATEGORIA_PADRE, PRIORIDAD, DESCRIPCION</p>
                        <input type="file" name="archivo_subcategorias" id="archivo_subcategorias" class="form-control" accept=".xlsx, .xls" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-rounded btn-primary">Subir Archivo</button>
                </div>
            </div>
        </form>
    </div>
</div>