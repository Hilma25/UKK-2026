
<?php
// kelola_siswa.php
include 'includes/cek_session.php';
include 'config/koneksi.php';

$sql = "SELECT * FROM t_siswa ORDER BY nama ASC";
$hasil = mysqli_query($koneksi, $sql);
?>

<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Kelola Siswa</title>

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

            <h2>Kelola Siswa</h2>
            <p>Selamat datang di halaman Siswa.</p>

            <div class="mb-3">
                <a href="dashboard.php" class="btn btn-secondary">
                    Kembali ke Dashboard
                </a>

                <a href="tambah_siswa.php" class="btn btn-primary">
                    Tambah Siswa
                </a>
            </div>

            <!-- TABEL DATA SISWA -->
            <div class="table-responsive">

                <table id="tabelSiswa"
                       class="table table-striped table-bordered table-hover">

                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>NIS</th>
                            <th>NISN</th>
                            <th>Nama Siswa</th>
                            <th>Jenis Kelamin</th>
                            <th>Tanggal Lahir</th>
                            <th>Alamat</th>
                            <th>Status Aktif</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>

                    <tbody>

                    <?php while ($row = mysqli_fetch_assoc($hasil)) { ?>

                        <tr>
                            <td>
                                <?php echo htmlspecialchars($row['id']); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($row['nis']); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($row['nisn']); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($row['nama']); ?>
                            </td>

                            <td>
                                <?php
                                if ($row['jenis_kelamin'] == 'L') {
                                    echo "Laki-laki";
                                } elseif ($row['jenis_kelamin'] == 'P') {
                                    echo "Perempuan";
                                } else {
                                    echo "-";
                                }
                                ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($row['tanggal_lahir'] ?? ''); ?>
                            </td>

                            <td>
                                <?php echo htmlspecialchars($row['alamat'] ?? ''); ?>
                            </td>

                            <td>
                                <?php
                                if ($row['status_aktif'] == 1) {
                                    echo "Aktif";
                                } else {
                                    echo "Tidak Aktif";
                                }
                                ?>
                            </td>

                            <td>
                                <a href="edit_siswa.php?id=<?php echo urlencode($row['id']); ?>"
                                   class="btn btn-warning btn-sm">
                                    Edit
                                </a>

                                <a href="hapus_siswa.php?id=<?php echo urlencode($row['id']); ?>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Yakin ingin menghapus data siswa ini?');">
                                    Hapus
                                </a>
                            </td>
                        </tr>

                    <?php } ?>

                    </tbody>

                </table>

            </div>

        </main>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- DataTables -->
<script src="https://cdn.datatables.net/2.3.4/js/dataTables.min.js"></script>
<script src="https://cdn.datatables.net/2.3.4/js/dataTables.bootstrap5.min.js"></script>

<!-- Mengaktifkan DataTables -->
<script>
$(document).ready(function () {

    $('#tabelSiswa').DataTable({

        language: {
            search: "Cari:",
            lengthMenu: "Tampilkan _MENU_ data",
            info: "Menampilkan _START_ sampai _END_ dari _TOTAL_ data",
            infoEmpty: "Tidak ada data siswa",
            zeroRecords: "Data siswa tidak ditemukan",
            emptyTable: "Belum ada data siswa",

            paginate: {
                first: "Pertama",
                last: "Terakhir",
                next: "Berikutnya",
                previous: "Sebelumnya"
            }
        },

        pageLength: 10,

        lengthMenu: [5, 10, 25, 50, 100],

        order: [[3, 'asc']]
    });

});
</script>

</body>
</html>
