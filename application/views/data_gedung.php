
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>E-ABSENSI | Data Gedung</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Main Sidebar Container -->
  <div id="sidebar"></div>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Data Gedung</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="../../../eabsensi/">Home</a></li>
              <li class="breadcrumb-item active">Data Gedung</li>
              <li class="breadcrumb-item"><a href="../login/logout.php">Logout</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modal-tambah">
                    Tambah Data
                  </button>
                </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="tbl_gedung" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>No</th>
                    <th>Nama Gedung</th>
                    <th>Alamat</th>
                  </tr>
                  </thead>
                  <tbody>
                  <?php 
                      include "../../koneksi.php";

                      $q = mysqli_query($koneksi,"select * from gedung");
                      $no = 1;
                      while($row = mysqli_fetch_array($q)){
                        echo "<tr>";
                        echo     "<td>".$no++."</td>";
                        echo     "<td>".$row['nama_gedung']."</td>";
                        echo     "<td>".$row['alamat']."</td>";
                        echo     "<td><a href='../backend/master/gedung/edit.php?id_gedung=$row[id_gedung]' type='button' class='btn btn-block btn-primary'>Edit</a></td>";
                        echo     "<td><a href='../backend/master/gedung/delete.php?id_gedung=$row[id_gedung]' type='button' class='btn btn-block btn-danger'>Hapus</a></td>";
                        echo "</tr>";
                        }
                        
                  ?>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>No</th>
                    <th>Nama Gedung</th>
                    <th>Alamat</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Modal -->
<div class="modal fade" id="modal-tambah" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">FORM TAMBAH GEDUNG</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form action="" method="post" enctype="multipart/form-data">
        <div class="modal-body">
            <div class="form-group">
              <label class="control-label" for="nama_gedung">Nama Gedung</label>
              <input type="text" name="nama_gedung" class="form-control" id="nama_gedung" required>
            </div>
          <div class="form-group">
            <label class="control-label" for="alamat">Alamat</label>
            <input type="text" name="alamat" class="form-control" id="alamat" required>
          </div>
          <div class="modal-footer">
            <button type="reset" class="btn btn-secondary">Reset</button>
            <input type="submit" class="btn btn-primary" name="tambah" value="Simpan">
          </div>
        </div>
      </form>
      <?php 
        include "../../koneksi.php";

        if(isset($_POST['tambah'])){
            mysqli_query($koneksi,"insert into gedung set
            nama_gedung = '$_POST[nama_gedung]',
            alamat = '$_POST[alamat]'
            ");

            echo '<script type ="text/JavaScript">';  
            echo 'alert("Simpan data Berhasil")';  
            echo '</script>';  

        }
      ?>
      
    </div>
  </div>
</div>
<!-- end modal -->

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<!-- Page specific script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>
  $(function () {
    $( "#sidebar" ).load( "../../sidebar.php" );
    $('#tbl_gedung').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });
  });
</script>
</body>
</html>


