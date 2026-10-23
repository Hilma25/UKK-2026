
<?php
session_start();

include 'config/koneksi.php';

// Memeriksa apakah pengguna sudah login
if (!isset($_SESSION['login']) || $_SESSION['login'] !== true) {
    header("Location: login.php");
    exit;
}

// Mengambil role dan ID pengguna
$role = $_SESSION['role'] ?? '';
$id_user = (int) ($_SESSION['id_user'] ?? 0);

// Hanya admin dan guru yang boleh melanjutkan
if ($role != 'admin' && $role != 'guru') {
    echo "<script>
        alert('Anda tidak memiliki akses ke halaman laporan!');
        window.location.href = 'dashboard.php';
    </script>";
    exit;
}

$is_walikelas = false;
$id_guru = 0;

// Memeriksa apakah guru merupakan wali kelas
if ($role == 'guru') {

    $query_guru = mysqli_prepare(
        $koneksi,
        "SELECT id FROM t_guru WHERE user_id = ? LIMIT 1"
    );

    mysqli_stmt_bind_param($query_guru, "i", $id_user);
    mysqli_stmt_execute($query_guru);

    $hasil_guru = mysqli_stmt_get_result($query_guru);
    $data_guru = mysqli_fetch_assoc($hasil_guru);

    if ($data_guru) {
        $id_guru = (int) $data_guru['id'];

        // Memeriksa penugasan wali kelas yang aktif
        $query_wali = mysqli_prepare(
            $koneksi,
            "SELECT id
             FROM t_wali_kelas
             WHERE guru_id = ?
             AND status_aktif = 1
             LIMIT 1"
        );

        mysqli_stmt_bind_param($query_wali, "i", $id_guru);
        mysqli_stmt_execute($query_wali);

        $hasil_wali = mysqli_stmt_get_result($query_wali);

        if (mysqli_num_rows($hasil_wali) > 0) {
            $is_walikelas = true;
        }
    }

    // Guru biasa tidak boleh membuka laporan
    if (!$is_walikelas) {
        echo "<script>
            alert('Halaman laporan hanya dapat diakses oleh wali kelas!');
            window.location.href = 'dashboard.php';
        </script>";
        exit;
    }
}

// Mengambil data laporan sesuai hak akses
if ($role == 'admin') {

    // Admin melihat semua laporan
    $sql = "SELECT *
            FROM t_pelanggaran_siswa
            ORDER BY tanggal DESC, id DESC";

    $query = mysqli_query($koneksi, $sql);

} else {

    // Wali kelas hanya melihat laporan siswa di kelasnya
    $sql = "SELECT DISTINCT p.*
            FROM t_pelanggaran_siswa p
            INNER JOIN t_kelas_siswa ks
                ON ks.siswa_id = p.siswa_id
            INNER JOIN t_wali_kelas wk
                ON wk.kelas_id = ks.kelas_id
                AND wk.tahun_ajaran_id = ks.tahun_ajaran_id
            WHERE wk.guru_id = ?
                AND wk.status_aktif = 1
                AND ks.status_aktif = 1
            ORDER BY p.tanggal DESC, p.id DESC";

    $query = mysqli_prepare($koneksi, $sql);

    mysqli_stmt_bind_param($query, "i", $id_guru);
    mysqli_stmt_execute($query);

    $query = mysqli_stmt_get_result($query);
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Laporan Pelanggaran</title>

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link href="https://cdn.datatables.net/2.3.4/css/dataTables.bootstrap5.min.css"
          rel="stylesheet">
</head>

<body>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
<div class="container-fluid">
    <div class="row">

        <?php include "layout/sidebar.php"; ?>

        <!-- KONTEN UTAMA -->
        <main class="col-md-9 col-lg-10 p-4">

            <h2>Laporan Pelanggaran Siswa</h2>
            <p>Daftar laporan pelanggaran yang dilakukan siswa.</p>

            <!-- Tombol navigasi dan laporan -->
            <a href="dashboard.php" class="btn btn-secondary mb-3">
                Kembali ke Dashboard
            </a>

            <a href="cetak_laporan.php"
               target="_blank"
               class="btn btn-primary mb-3">
                Cetak Laporan
            </a>

            <a href="export_laporan.php"
               class="btn btn-success mb-3">
                Export Excel
            </a>

            <!-- Tabel laporan -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white py-3">
                    <h5 class="mb-0">Data Laporan</h5>
                </div>

                <div class="card-body">
                    <div class="table-responsive">

                        <table class="table table-bordered table-striped table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Nama Siswa</th>
                                    <th>Kelas</th>
                                    <th>Pelanggaran</th>
                                    <th>Tanggal</th>
                                    <th>Poin</th>
                                    <th>Tindakan</th>
                                    <th>Status</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php
                                $no = 1;

                                if ($query && mysqli_num_rows($query) > 0) {
                                    while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <tr>
                                        <td><?= $no++; ?></td>

                                        <td>
                                            <?= htmlspecialchars($row['nama_siswa'] ?? '-'); ?>
                                        </td>

                                        <td>
                                            <?= htmlspecialchars($row['nama_kelas'] ?? '-'); ?>
                                        </td>

                                        <td>
                                            <?= htmlspecialchars($row['nama_pelanggaran'] ?? '-'); ?>
                                        </td>

                                        <td>
                                            <?php
                                            if (!empty($row['tanggal'])) {
                                                echo date(
                                                    'd-m-Y',
                                                    strtotime($row['tanggal'])
                                                );
                                            } else {
                                                echo '-';
                                            }
                                            ?>
                                        </td>

                                        <td>
                                            <span class="badge bg-danger">
                                                <?= (int) ($row['poin'] ?? 0); ?>
                                            ?>
                                            </span>
                                        </td>

                                        <td>
                                            <?= htmlspecialchars($row['tindakan'] ?? '-'); ?>
                                        </td>

                                        <td>
                                            <?php
                                            $status = $row['status'] ?? '-';

                                            if ($status == 'Selesai') {
                                                echo '<span class="badge bg-success">Selesai</span>';
                                            } elseif ($status == 'Proses') {
                                                echo '<span class="badge bg-warning text-dark">Proses</span>';
                                            } else {
                                                echo '<span class="badge bg-secondary">'
                                                    . htmlspecialchars($status)
                                                    . '</span>';
                                            }
                                            ?>
                                        </td>
                                    </tr>
                                <?php
                                    }
                                } else {
                                ?>
                                    <tr>
                                        <td colspan="8" class="text-center text-secondary py-4">
                                            Belum ada data laporan pelanggaran.
                                        </td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>