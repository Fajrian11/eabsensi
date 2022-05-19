<?php
include "../../../../koneksi.php";
//ambil data registrasi
$id_gedung = $_GET['id_gedung'];

$q = mysqli_query($koneksi,"select * from gedung where id_gedung=$id_gedung");

while ($row = mysqli_fetch_array($q)){
    $nama_gedung = $row['nama_gedung'];
    $alamat = $row['alamat'];
}
?>

<h1 style=text-align:center>FORM EDIT GEDUNG</h1>

<form action="edit.php" method="post">
    <table>
        <tr>
            <td><input type="hidden" name="id_gedung"  value=<?php echo $id_gedung; ?>></td>
        </tr>
        <tr>
            <td>Nama Gedung : </td>
            <td><input type="text" name="nama_gedung" value=<?php echo $nama_gedung ?>></td>
        </tr>
        <tr>
            <td>Alamat :</td>
            <td><input type="text" name="alamat" value=<?php echo $alamat; ?>></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit" name="update"></td>
        </tr>
    </table>
    <a href="list.php">LIHAT DATA GEDUNG</a>
</form>

<?php 
include "../../../../koneksi.php";
    if(isset($_POST['update'])){
        $id_gedung             = $_POST['id_gedung'];
        $nama_gedung  = $_POST['nama_gedung'];
        $alamat    = $_POST['alamat'];

        $q = mysqli_query($koneksi,"UPDATE gedung SET id_gedung='$id_gedung',
            nama_gedung='$nama_gedung',
            alamat='$alamat'
            WHERE id_gedung=$id_gedung");

        header("Location: ../../../views/data_gedung.php");
    }
?>


