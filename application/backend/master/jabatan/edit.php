<?php
include "../../../../koneksi.php";
//ambil data 
$id_jabatan = $_GET['id_jabatan'];

$q = mysqli_query($koneksi,"select * from jabatan where id_jabatan=$id_jabatan");

while ($row = mysqli_fetch_array($q)){
    $nama_jabatan = $row['nama_jabatan'];
}
?>

<h1 style=text-align:center>FORM EDIT JABATAN</h1>

<form action="edit.php" method="post">
    <table>
        <tr>
            <td><input type="hidden" name="id_jabatan"  value=<?php echo $id_jabatan; ?>></td>
        </tr>
        <tr>
            <td>Nama Jabatan :</td>
            <td><input type="text" name="nama_jabatan" value=<?php echo $nama_jabatan; ?>></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit" name="update"></td>
        </tr>
    </table>
    <a href="list.php">LIHAT DATA JABATAN</a>
</form>

<?php 
include "../../../../koneksi.php";
    if(isset($_POST['update'])){
        $id_jabatan             = $_POST['id_jabatan'];
        $nama_jabatan    = $_POST['nama_jabatan'];

        $q = mysqli_query($koneksi,"UPDATE jabatan SET id_jabatan='$id_jabatan',
            nama_jabatan='$nama_jabatan'
            WHERE id_jabatan=$id_jabatan");

        header("Location: ../../../views/data_jabatan.php");
    }
?>


