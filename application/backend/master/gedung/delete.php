<?php
    include "../../../../koneksi.php";

    $id_gedung = $_GET['id_gedung'];

    $q = mysqli_query($koneksi, "DELETE FROM gedung where id_gedung=$id_gedung");

    header("Location: ../../../views/data_gedung.php");
?>