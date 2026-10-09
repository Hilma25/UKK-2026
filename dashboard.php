<?php
//dasboard.php
include 'includes/cek_session.php';
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Dashboard - Pelanggaran Siswa </title>
    </head>
    <body>
        <h1>Selamat Datang, <?php echo $_SESSION['name']; ?></h1>
        <p>Anda Login sebagai: <?php echo $_SESSION['role']; ?></p>

        <ul>
            <?php if ($_SESSION['role'] == 'admin') { ?>
               <li><a href="kelola_guru.php">Kelola Guru</a></li>
               <li><a href="kelola_siswa.php">Kelola Siswa</a></li>
               <li><a href="kelola_kelas.php">Kelola Kelas</a></li>
               <li><a href="kelola_tahun_ajaran.php">Kelola Tahun Ajaran</a></li>
                <li><a href="kelola_wali_kelas.php">Kelola Wali Kelas</a></li>
               <li><a href="kelola_pelanggaran_kategori.php">Kelola Pelanggaran Kategori</a></li>
               <li><a href="penempatan_siswa.php">Penempatan Siswa</a></li>
            <?php } ?>

            <?php if ($_SESSION['role'] == 'guru') { ?>
               <li><a href="catat_pelanggaran.php">Catat Pelanggaran</a></li>
               <li><a href="tindakan.php">Tindakan</a></li>
               <li><a href="laporan.php">Laporan</a></li>
               <li><a href="riwayat.php">Riwayat</a></li>
               <li><a href="rekap_poin.php">Rekap Poin</a></li>
            <?php } ?>
        
        <a href="logout.php">Logout</a>
    </body>
</html>