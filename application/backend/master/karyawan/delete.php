<?php
    include "../../../../koneksi.php";

    $id = $_GET['id'];

    $q = mysqli_query($koneksi, "DELETE FROM karyawan where id=$id");

    header("Location: ../../../views/data_karyawan.php");
?>