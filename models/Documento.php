<?php

    class Documento extends Conectar{

        public function insert_documento($tick_id, $doc_nom) {
            $conectar = parent::conexion();
            $sql = "INSERT INTO td_documento (doc_id, tick_id, doc_nom, fech_crea, est) VALUES (NULL, ?, ?, NOW(), '1')";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $tick_id);
            $sql->bindValue(2, $doc_nom);
            $sql->execute();
        }

        public function get_documento_x_ticket($tick_id) {
            $conectar = parent::conexion();
            $sql = "SELECT * FROM td_documento WHERE tick_id = ? AND est = '1'";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $tick_id);
            $sql->execute();
            return $sql->fetchAll(PDO::FETCH_ASSOC);
        }

        public function insert_documento_detalle($tickd_id, $det_nom) {
            $conectar = parent::conexion();
            $sql = "INSERT INTO td_documento_detalle (det_id, tickd_id, det_nom, fech_crea, est) VALUES (NULL, ?, ?, NOW(), '1')";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $tickd_id);
            $sql->bindValue(2, $det_nom);
            $sql->execute();
        }

        public function get_documento_detalle_x_ticket($tickd_id) {
            $conectar = parent::conexion();
            $sql = "SELECT * FROM td_documento_detalle WHERE tickd_id = ? AND est = '1'";
            $sql = $conectar->prepare($sql);
            $sql->bindValue(1, $tickd_id);
            $sql->execute();
            return $sql->fetchAll(PDO::FETCH_ASSOC);
        }

    }

?>