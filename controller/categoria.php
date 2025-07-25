<?php
require_once('../config/conexion.php');
require_once('../models/Categoria.php');
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
$categoria = new Categoria();

switch ($_GET["op"]) {

    

    case "getcombo":
        
        $datos = $categoria->get_categoriatodo();
        if(is_array($datos) and count($datos) > 0){
            $html = "";
            foreach($datos as $row){
                 $html.= "<option value='".$row["cat_id"]."'>".$row["cat_nom"]."</option>";
            }
            echo $html;
        }

        break;

    case "combo":
        
        $datos = $categoria->get_categoria($_POST['dp_id'],$_POST['emp_id']);
        if(is_array($datos) and count($datos) > 0){
            $html = "";
            foreach($datos as $row){
                 $html.= "<option value='".$row["cat_id"]."'>".$row["cat_nom"]."</option>";
            }
            echo $html;
        }

        break;

     
        case "guardaryeditar":

            if(empty($_POST['cat_id'])){
                $categoria->insert_categoria($_POST['cat_nom'],$_POST['dp_id'],$_POST['emp_id']);
            }else{
                $categoria->update_categoria($_POST['cat_id'],$_POST['cat_nom'],$_POST['dp_id'],$_POST['emp_id']);
            }  
    
            break; 
    
        case "listar":
            $datos = $categoria->get_categoriatodo();
            $data = array();
            foreach ($datos as $row) {
                $sub_array = array();
                $sub_array[] = $row["cat_nom"];
                $sub_array[] = $row["emp_nom"];
                $sub_array[] = $row["dp_nom"];
                $sub_array[] = '<button type="button" onClick="editar(' . $row['cat_id'] . ');" id="' . $row['cat_id'] . '" class="btn btn-inline btn-waring btn-sm ladda-button"><i class="fa fa-edit"></i></button>';
                $sub_array[] = '<button type="button" onClick="eliminar(' . $row['cat_id'] . ');" id="' . $row['cat_id'] . '" class="btn btn-inline btn-danger btn-sm ladda-button"><i class="fa fa-trash"></i></button>';
                $data[] = $sub_array;
            }
            $result = array(
                "sEcho" => 1,
                "iTotalRecords" => count($data),
                "iTotalDisplayRecords" => count($data),
                "aaData" => $data
            );
            echo json_encode($result);
            break;    
    
        case "eliminar":
            $categoria->delete_categoria($_POST["cat_id"]);
    
            break;
    
        case "mostrar":
            $datos = $categoria->get_categoria_x_id($_POST['cat_id']);
            if(is_array($datos) and count($datos) >0){
                foreach ($datos as $row) {
                    $output['cat_id'] = $row['cat_id'];
                    $output['cat_nom'] = $row['cat_nom'];
                    $output['dp_id'] = $row['dp_id'];
                    $output['emp_id'] = $row['emp_id'];
                }
                echo json_encode($output);
            }    
}
?>