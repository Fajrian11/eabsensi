<?php
    include "../../../../koneksi.php";

    $id_jabatan = $_GET['id_jabatan'];

    $q = mysqli_query($koneksi, "DELETE FROM jabatan where id_jabatan=$id_jabatan");

    header("Location: ../../../views/data_jabatan.php");
?>