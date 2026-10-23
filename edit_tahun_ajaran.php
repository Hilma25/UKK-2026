
<?php
// edit_tahun_ajaran.php
include 'includes/cek_session.php';
include 'config/koneksi.php';

$id = $_GET['id'];

$sql = "SELECT * FROM t_tahun_ajaran WHERE id = '$id'";
$hasil = mysqli_query($koneksi, $sql);
$data = mysqli_fetch_assoc($hasil);
?>

<!DOCTYPE html>
<html>

<head>

     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Tahun Ajaran</title>

     <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- DataTables Bootstrap 5 -->
    <link href="https://cdn.datatables.net/2.3.4/css/dataTables.bootstrap5.min.css"
          rel="stylesheet">
</head>

<body>

      <div class="container-fluid">
    <div class="row">

        <?php include 'layout/sidebar.php'; ?>

        <!-- KONTEN -->
        <main class="col-md-9 col-lg-10 p-4">

             <h1>Edit Tahun Ajaran</h1>

            <div class="mb-3">
                <a href="dashboard.php" class="btn btn-secondary mb-3">
                    Kembali ke Dashboard
                </a>
            </div>

    <form action="proses_edit_tahun_ajaran.php" method="POST">

        <input type="hidden" name="id"
               value="<?php echo $data['id']; ?>">

        <table>

            <tr>
                <td>Nama Tahun Ajaran</td>
                <td>:</td>
                <td>
                    <input type="text" name="nama"
                           value="<?php echo $data['nama']; ?>"
                           required>
                </td>
            </tr>

            <tr>
                <td>Tanggal Mulai</td>
                <td>:</td>
                <td>
                    <input type="date" name="tanggal_mulai"
                           value="<?php echo $data['tanggal_mulai']; ?>"
                           required>
                </td>
            </tr>

            <tr>
                <td>Tanggal Selesai</td>
                <td>:</td>
                <td>
                    <input type="date" name="tanggal_selesai"
                           value="<?php echo $data['tanggal_selesai']; ?>"
                           required>
                </td>
            </tr>

            <tr>
                <td>Status Aktif</td>
                <td>:</td>
                <td>
                    <select name="status_aktif" required>

                        <option value="1"
                            <?php
                            if ($data['status_aktif'] == 1) {
                                echo 'selected';
                            }
                            ?>>
                            Aktif
                        </option>

                        <option value="0"
                            <?php
                            if ($data['status_aktif'] == 0) {
                                echo 'selected';
                            }
                            ?>>
                            Tidak Aktif
                        </option>

                    </select>
                </td>
            </tr>

            <tr>
                <td colspan="3">
                    <input type="submit" value="Update">
                </td>
            </tr>

        </table>

    </form>

    <p>
        <a href="kelola_tahun_ajaran.php">
            Kembali ke Kelola Tahun Ajaran
        </a>
    </p>

</body>
</html>

