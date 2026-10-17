<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Sistem Sekolah</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="min-vh-100">

    <!-- Background halaman -->
    <div class="container-fluid min-vh-100 d-flex justify-content-center align-items-center"
         style="background-color: #529FAE;">

        <!-- Kotak login -->
        <div class="card border-0 rounded-3 shadow-sm"
             style="width: 268px;">

            <div class="card-body px-4 pt-4 pb-5">

                <!-- Logo timbangan -->
                <div class="text-center mb-2">
                    <img src="img/timbangan.png"
                         alt="Logo Timbangan Hukum"
                         class="img-fluid"
                         style="width: 100px; height: 80px; object-fit: contain;">
                </div>

                <!-- Form login -->
                <form action="proses_login.php" method="POST">

                    <!-- Username -->
                    <div class="mb-1">
                        <label for="email" class="form-label mb-1 small">
                            Username
                        </label>

                        <input type="text"
                               class="form-control rounded-3 border-0 bg-body-secondary"
                               id="email"
                               name="email"
                               placeholder="Username"
                               autocomplete="username"
                               required>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label for="password" class="form-label mb-1 small">
                            Password
                        </label>

                        <input type="password"
                               class="form-control rounded-3 border-0 bg-body-secondary"
                               id="password"
                               name="password"
                               placeholder="Password"
                               autocomplete="current-password"
                               required>
                    </div>

                    <!-- Tombol login -->
                    <button type="submit"
                            name="login"
                            class="btn btn-lg w-100 rounded-3 text-white shadow-sm"
                            style="background-color: #397D91;">
                        LOGIN
                    </button>

                </form>

            </div>
        </div>

    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>