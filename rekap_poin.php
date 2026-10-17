<?php
// ============================================
// 1. KONEKSI DAN SESSION
// ============================================

include 'includes/cek_session.php';
include 'config/koneksi.php';

// ============================================
// 2. MENGAMBIL INPUT PENCARIAN DAN FILTER
// ============================================

$cari = isset($_GET['cari']) ? trim($_GET['cari']) : '';
$kelas_filter = isset($_GET['kelas']) ? trim($_GET['kelas']) : '';

$cari_sql = mysqli_real_escape_string($koneksi, $cari);
$kelas_sql = mysqli_real_escape_string($koneksi, $kelas_filter);

// ============================================
// 3. MENGAMBIL DATA KELAS UNTUK FILTER
// ============================================

$query_kelas = mysqli_query(
    $koneksi,
    "SELECT id, nama
     FROM t_kelas
     ORDER BY nama ASC"
);

if (!$query_kelas) {
    die("Gagal mengambil data kelas: " . mysqli_error($koneksi));
}

// Simpan daftar kelas agar bisa digunakan pada form
$data_kelas = [];

while ($kelas = mysqli_fetch_assoc($query_kelas)) {
    $data_kelas[] = $kelas;
}

// ============================================
// 4. QUERY REKAP POIN SISWA
// ============================================

// Menghitung total poin dan jumlah pelanggaran
// berdasarkan siswa_id dari tabel pelanggaran
$sql = "SELECT
            s.id AS siswa_id,
            s.nis,
            s.nama AS nama_siswa,
            COALESCE(k.nama, '-') AS nama_kelas,
            COALESCE(p.total_poin, 0) AS total_poin,
            COALESCE(p.jumlah_pelanggaran, 0) AS jumlah_pelanggaran

        FROM t_siswa s

        LEFT JOIN (
            SELECT
                siswa_id,
                SUM(poin) AS total_poin,
                COUNT(*) AS jumlah_pelanggaran
            FROM t_pelanggaran_siswa
            GROUP BY siswa_id
        ) p ON p.siswa_id = s.id

        LEFT JOIN (
            SELECT
                siswa_id,
                MAX(kelas_id) AS kelas_id
            FROM t_kelas_siswa
            WHERE status_aktif = 1
            GROUP BY siswa_id
        ) ks ON ks.siswa_id = s.id

        LEFT JOIN t_kelas k ON k.id = ks.kelas_id

        WHERE 1=1";

// ============================================
// 5. PENCARIAN SISWA
// ============================================

if ($cari != '') {
    $sql .= " AND (
        s.nama LIKE '%$cari_sql%'
        OR s.nis LIKE '%$cari_sql%'
    )";
}

// ============================================
// 6. FILTER KELAS
// ============================================

if ($kelas_filter != '') {
    $sql .= " AND k.id = '$kelas_sql'";
}

// ============================================
// 7. URUTAN POIN TERTINGGI
// ============================================

$sql .= " ORDER BY total_poin DESC, s.nama ASC";

// Jalankan query rekap
$query_rekap = mysqli_query($koneksi, $sql);

if (!$query_rekap) {
    die("Gagal mengambil rekap poin: " . mysqli_error($koneksi));
}

// ============================================
// 8. MENGHITUNG RINGKASAN
// ============================================

$data_rekap = [];
$total_poin_semua = 0;
$total_catatan = 0;

while ($data = mysqli_fetch_assoc($query_rekap)) {
    $data_rekap[] = $data;

    $total_poin_semua += (int) $data['total_poin'];
    $total_catatan += (int) $data['jumlah_pelanggaran'];
}

$jumlah_siswa = count($data_rekap);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Rekap Poin Pelanggaran Siswa</title>

    <!-- Bootstrap 5 -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
    >

    <style>
        body {
            background: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .container-fluid {
            padding: 25px;
        }

        .judul {
            color: #1e3a8a;
            font-weight: bold;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.07);
        }

        .angka {
            font-size: 28px;
            font-weight: bold;
            color: #1e3a8a;
        }

        .table thead th {
            background: #1e3a8a;
            color: white;
            white-space: nowrap;
        }

        .table td {
            vertical-align: middle;
        }

        .btn-dashboard {
            background: #1e3a8a;
            color: white;
        }

        .btn-dashboard:hover {
            background: #172554;
            color: white;
        }

        @media print {
            body {
                background: white;
            }

            .no-print {
                display: none !important;
            }

            .container-fluid {
                padding: 0;
            }

            .card {
                box-shadow: none;
                border: 1px solid #ddd;
            }

            .table {
                font-size: 11px;
            }

            .table thead th {
                background: #ddd !important;
                color: black !important;
                print-color-adjust: exact;
            }
        }
    </style>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<div class="container-fluid">
    <div class="row">
        <?php
            include "layout/sidebar.php";
        ?>
        <!-- KONTEN -->
        <main class="col-md-9 col-lg-10 p-4">
<div class="container-fluid">

    <!-- JUDUL HALAMAN -->
    <div class="d-flex justify-content-between align-items-center flex-wrap gap-2 mb-4">

        <div>
            <h3 class="judul">Rekap Poin Pelanggaran Siswa</h3>
            <p class="text-muted mb-0">
                Ringkasan jumlah pelanggaran dan poin setiap siswa.
            </p>
        </div>

        <div class="d-flex gap-2 no-print">
            <a href="dashboard.php" class="btn btn-dashboard">
                Kembali ke Dashboard
            </a>

            <button onclick="window.print()" class="btn btn-success">
                Cetak Rekap
            </button>
        </div>

    </div>

    <!-- RINGKASAN -->
    <div class="row g-3 mb-4">

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <p class="text-muted mb-1">Jumlah Siswa</p>
                    <div class="angka">
                        <?= $jumlah_siswa; ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <p class="text-muted mb-1">Total Poin</p>
                    <div class="angka">
                        <?= $total_poin_semua; ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <p class="text-muted mb-1">Jumlah Catatan Pelanggaran</p>
                    <div class="angka">
                        <?= $total_catatan; ?>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- PENCARIAN DAN FILTER -->
    <div class="card mb-4 no-print">
        <div class="card-body">

            <form method="GET" action="rekap_poin.php">

                <div class="row g-3">

                    <div class="col-md-5">
                        <label class="form-label">Cari Siswa</label>

                        <input
                            type="text"
                            name="cari"
                            class="form-control"
                            placeholder="Masukkan nama atau NIS siswa"
                            value="<?= htmlspecialchars($cari); ?>"
                        >
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">Filter Kelas</label>

                        <select name="kelas" class="form-select">
                            <option value="">Semua Kelas</option>

                            <?php foreach ($data_kelas as $kelas) : ?>
                                <option
                                    value="<?= (int) $kelas['id']; ?>"
                                    <?= $kelas_filter == $kelas['id'] ? 'selected' : ''; ?>
                                >
                                    <?= htmlspecialchars($kelas['nama']); ?>
                                </option>
                            <?php endforeach; ?>

                        </select>
                    </div>

                    <div class="col-md-3 d-flex align-items-end gap-2">

                        <button type="submit" class="btn btn-primary">
                            Cari
                        </button>

                        <a href="rekap_poin.php" class="btn btn-secondary">
                            Reset
                        </a>

                    </div>

                </div>

            </form>

        </div>
    </div>

    <!-- TABEL REKAP -->
    <div class="card">

        <div class="card-body">

            <div class="table-responsive">

                <table class="table table-bordered table-hover">

                    <thead>
                        <tr>
                            <th>No</th>
                            <th>NIS</th>
                            <th>Nama Siswa</th>
                            <th>Kelas</th>
                            <th>Jumlah Pelanggaran</th>
                            <th>Total Poin</th>
                        </tr>
                    </thead>

                    <tbody>

                    <?php if ($jumlah_siswa > 0) : ?>

                        <?php $no = 1; ?>

                        <?php foreach ($data_rekap as $data) : ?>

                            <tr>

                                <td><?= $no++; ?></td>

                                <td>
                                    <?= htmlspecialchars($data['nis'] ?? '-'); ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($data['nama_siswa']); ?>
                                </td>

                                <td>
                                    <?= htmlspecialchars($data['nama_kelas']); ?>
                                </td>

                                <td class="text-center">
                                    <?= (int) $data['jumlah_pelanggaran']; ?>
                                </td>

                                <td class="text-center">
                                    <span class="badge bg-warning text-dark">
                                        <?= (int) $data['total_poin']; ?> poin
                                    </span>
                                </td>

                            </tr>

                        <?php endforeach; ?>

                    <?php else : ?>

                        <tr>
                            <td colspan="6" class="text-center text-muted py-4">
                                Data rekap poin siswa tidak ditemukan.
                            </td>
                        </tr>

                    <?php endif; ?>

                    </tbody>

                </table>

            </div>

            <p class="text-muted mb-0">
                Total poin dihitung otomatis berdasarkan catatan
                pada tabel t_pelanggaran_siswa.
            </p>

        </div>

    </div>

</div>

</body>
</html>