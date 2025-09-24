<?php
include "config.php";
include "Form.php";

$form = new Form("tambah_produk.php");

// Ambil data mobil dari tabel model untuk dropdown
$models = [];
$sql = "SELECT id_mobil, model FROM model";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $models[$row['id_mobil']] = $row['model'];
    }
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_mobil = $_POST['id_mobil'];
    $nama = $_POST['nama'];
    $stock = $_POST['stock'];
    $grade = $_POST['grade'];
    $harga = $_POST['harga'];
    $deskripsi = $_POST['deskripsi'];

    $sql = "INSERT INTO sparepart (id_mobil, nama, stock, grade, harga, deskripsi) 
            VALUES ('$id_mobil', '$nama', '$stock', '$grade', '$harga', '$deskripsi')";

    if ($conn->query($sql) === TRUE) {
    echo "<div class='alert alert-success text-center fw-bold'>Sparepart berhasil ditambahkan!</div>";
} else {
    echo "<div class='alert alert-danger text-center fw-bold'>Error: " . $conn->error . "</div>";
}
}
?>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <title>Tambah Sparepart - Toko Onderdil</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #eceff1, #f8f9fa);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background: linear-gradient(45deg, #c62828, #a61c1c);
            color: white;
            border-radius: 20px 20px 0 0;
            text-align: center;
            padding: 20px;
        }

        .card-header h2 {
            font-weight: 700;
            margin: 0;
        }

        label {
            font-weight: 600;
            margin-bottom: 6px;
            color: #37474f;
        }

        .form-control,
        .form-select {
            border-radius: 10px;
            padding: 12px;
        }

        .form-check-label {
            font-weight: normal;
        }

        .btn-primary {
            background: #c62828;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            transition: 0.3s;
            padding: 12px 20px;
        }

        .btn-primary:hover {
            background: #a61c1c;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(166, 28, 28, 0.4);
        }

        .form-text {
            color: #607d8b;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="card mt-5">
            <div class="card-header">
                <h2>Tambah Data Sparepart</h2>
                <p class="mb-0">Isi form di bawah untuk menambahkan sparepart baru</p>
            </div>
            <div class="card-body p-4">
                <?php
                echo $form->start();
                echo $form->select("id_mobil", "Pilih Mobil", $models);
                echo $form->inputText("nama", "Nama Sparepart", "Contoh: Kampas Rem");
                echo $form->inputText("stock", "Stock", "Jumlah stok tersedia");
                echo $form->inputText("harga", "Harga", "Masukkan harga dalam Rupiah");
                echo $form->inputRadio("grade", "Grade Sparepart", ["A" => "Grade A", "B" => "Grade B", "C" => "Grade C"]);
                echo $form->textarea("deskripsi", "Deskripsi Sparepart", "Tulis deskripsi lengkap sparepart");
                echo '<div class="text-center mt-4">';
                echo $form->submit("Simpan Produk");
                echo '</div>';
                echo $form->end();
                ?>
            </div>
        </div>
    </div>
</body>

</html>
