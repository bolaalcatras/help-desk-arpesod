<div class="modal fade bd-example-modal-lg"
    id="modalnuevousuario"
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
            <form method="post" id="usuario_form">
                <div class="modal-body">

                    <input type="hidden" id="usu_id" name="usu_id">
                    <div class="form-group">
                        <label class="form-label semibold" for="usu_nom">Nombres</label>
                        <input type="text" class="form-control" id="usu_nom" name="usu_nom" placeholder="Ingrese nombre" required>
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label class="form-label semibold" for="usu_ape">Apellidos</label>
                        <input type="text" class="form-control" id="usu_ape" name="usu_ape" placeholder="Ingrese apellido" required>
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label class="form-label semibold" for="usu_nom">Correo</label>
                        <input type="email" class="form-control" id="usu_correo" name="usu_correo" placeholder="test@gmail.com" required>
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label class="form-label semibold" for="usu_pass">Contraseña</label>
                        <input type="password" class="form-control" id="usu_pass" name="usu_pass" placeholder="">
                        <div></div>
                    </div>
                    <div class="form-group">
                        <label class="form-label semibold" for="emp_id">Empresa</label>
                        <select class="select2" id="emp_id" multiple name="emp_id[]" placeholder="Seleccione una subcategoria">
                            <option value="">Todas</option>
                        </select>
                    </div>                      <div class="form-group">
                        <label for="form-label" for="rol_id">Rol</label>
                        <select class="select2" id="rol_id" name="rol_id" required>
                            <option value="1">Usuario</option>
                            <option value="2">Soporte</option>
                            <option value="3">Admin</option>
                        </select>
                    </div>
                    <div class="form-group" id="dp_id_group">
                        <label class="form-label semibold" for="dp_id">Nombre departamento</label>
                        <select class="select2" id="dp_id" name="dp_id" placeholder="Seleccione un departamento">
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-rounded btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" name="action" id="#" value="add" class="btn btn-rounded btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>