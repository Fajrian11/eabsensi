<?php
include "../../../../koneksi.php";
//ambil data registrasi
$id = $_GET['id'];

$q = mysqli_query($koneksi,"select * from karyawan where id=$id");

while ($row = mysqli_fetch_array($q)){
    $kd_karyawan = $row['kd_karyawan'];
    $nama_karyawan = $row['nama_karyawan'];
    $jabatan = $row['jabatan'];
    $id_shift = $row['id_shift'];
    $id_gedung = $row['id_gedung'];
}
?>

<h1 style=text-align:center>FORM EDIT REGISTRASI</h1>

<form action="edit.php" method="post">
    <table>
        <tr>
            <td><input type="hidden" name="id"  value=<?php echo $id; ?>></td>
        </tr>
        <tr>
            <td>Kode Karyawan :</td>
            <td><input type="text" name="kd_karyawan" value=<?php echo $kd_karyawan; ?>></td>
        </tr>
        <tr>
            <td>Nama Karyawan : </td>
            <td><input type="text" name="nama_karyawan" value=<?php echo $nama_karyawan ?>></td>
        </tr>
        <tr>
            <td>Jabatan : </td>
            <td><input type="text" name="jabatan" value=<?php echo $jabatan ?>></td>
        </tr>
        <tr>
            <td>Shift: </td>
            <td><input type="text" name="id_shift" value=<?php echo $id_shift ?>></td>
        </tr>
        <tr>
            <td>Gedung: </td>
            <td><input type="text" name="id_gedung" value=<?php echo $id_gedung ?>></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit" name="update"></td>
        </tr>
    </table>
    <a href="list.php">LIHAT DATA KARYAWAN</a>
</form>

<?php 
include "../../../../koneksi.php";
    if(isset($_POST['update'])){
        $id             = $_POST['id'];
        $kd_karyawan    = $_POST['kd_karyawan'];
        $nama_karyawan  = $_POST['nama_karyawan'];
        $jabatan        = $_POST['jabatan'];
        $id_shift       = $_POST['id_shift'];
        $id_gedung      = $_POST['id_gedung'];

        $q = mysqli_query($koneksi,"UPDATE karyawan SET id='$id',
            kd_karyawan='$kd_karyawan',
            nama_karyawan='$nama_karyawan',
            jabatan='$jabatan',
            id_shift='$id_shift',
            id_gedung='$id_gedung'
            WHERE id=$id");

        header("Location: ../../../views/data_karyawan.php");
    }
?>


