<?php
include "../../../../koneksi.php";
//ambil data 
$id_shift = $_GET['id_shift'];

$q = mysqli_query($koneksi,"select * from shift where id_shift=$id_shift");

while ($row = mysqli_fetch_array($q)){
    $nama_shift = $row['nama_shift'];
}
?>

<h1 style=text-align:center>FORM EDIT SHIFT</h1>

<form action="edit.php" method="post">
    <table>
        <tr>
            <td><input type="hidden" name="id_shift"  value=<?php echo $id_shift; ?>></td>
        </tr>
        <tr>
            <td>Nama shift :</td>
            <td><input type="text" name="nama_shift" value=<?php echo $nama_shift; ?>></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Edit" name="update"></td>
        </tr>
    </table>
    <a href="list.php">LIHAT DATA SHIFT</a>
</form>

<?php 
include "../../../../koneksi.php";
    if(isset($_POST['update'])){
        $id_shift             = $_POST['id_shift'];
        $nama_shift    = $_POST['nama_shift'];

        $q = mysqli_query($koneksi,"UPDATE shift SET id_shift='$id_shift',
            nama_shift='$nama_shift'
            WHERE id_shift=$id_shift");

        header("Location: ../../../views/data_shift.php");
    }
?>


