<?php
    include "../../../../koneksi.php";

    $id = $_GET['id_shift'];

    $q = mysqli_query($koneksi, "DELETE FROM shift where id_shift=$id");

    header("Location: ../../../views/data_shift.php");
?>