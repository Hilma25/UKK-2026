
<?php
// edit_pelanggaran_kategori.php

include 'includes/cek_session.php';
include 'config/koneksi.php';

$id = $_GET['id'];

$sql = "SELECT * FROM t_pelanggaran_kategori WHERE id = '$id'";
$hasil = mysqli_query($koneksi, $sql);
$data = mysqli_fetch_assoc($hasil);

if (!$data) {
    die("Data kategori pelanggaran tidak ditemukan.");
}
?>

<!DOCTYPE html>
<html>

<head>

     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

      <title>Edit Kategori Pelanggaran</title>

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

             <h1>Edit Pelanggaran Kategori</h1>

            <div class="mb-3">
                <a href="dashboard.php" class="btn btn-secondary mb-3">
                    Kembali ke Dashboard
                </a>
            </div>

    <form action="proses_edit_pelanggaran_kategori.php" method="POST">

        <input type="hidden" name="id"
               value="<?php echo $data['id']; ?>">

        <table>

            <tr>
                <td>Nama Kategori</td>
                <td>:</td>
                <td>
                    <input type="text" name="nama"
                           value="<?php echo htmlspecialchars($data['nama']); ?>"
                           required>
                </td>
            </tr>

            <tr>
                <td>Deskripsi</td>
                <td>:</td>
                <td>
                    <textarea name="deskripsi" rows="4" cols="30"><?php
                        echo htmlspecialchars($data['deskripsi'] ?? '');
                    ?></textarea>
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
        <a href="kelola_pelanggaran_kategori.php">
            Kembali ke Kelola Kategori Pelanggaran
        </a>
    </p>

</body>
</html>

