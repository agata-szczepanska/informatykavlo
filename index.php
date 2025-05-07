<?php
$host = '127.0.0.1';
$db = 'dbs255';
$user = 's255';
$pass = 'aLt6see8metr';
$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <title>Restauracja Artystyczna</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@400;600&display=swap');
        body {
            font-family: 'Quicksand', sans-serif;
        }
    </style>
</head>
<body class="bg-gradient-to-br from-pink-100 via-blue-100 to-green-100 min-h-screen text-gray-800">

<!-- Zakładki -->
<nav class="flex flex-wrap justify-center gap-4 p-6">
    <?php
    $tabs = [
        'home' => ['Strona Główna', 'bg-pink-200'],
        'menu' => ['Menu', 'bg-blue-200'],
        'klienci' => ['Klienci', 'bg-green-200'],
        'zamowienia' => ['Zamówienia', 'bg-yellow-200'],
        'zestawienie' => ['Zestawienie', 'bg-purple-200'],
        'najlepszy' => ['Najlepszy Klient', 'bg-orange-200'],
    ];
    $current = $_GET['page'] ?? 'home';
    foreach ($tabs as $key => [$label, $color]) {
        $isActive = $key === $current ? 'ring-4 ring-white scale-105' : 'opacity-80 hover:opacity-100';
        echo "<a href='?page=$key' class='transition transform duration-200 text-lg font-semibold text-gray-900 $color px-5 py-3 rounded-[30px_10px_30px_10px] shadow-md $isActive'>$label</a>";
    }
    ?>
</nav>

<!-- Treść -->
<section class="container mx-auto px-4 py-8">
<?php

$page = $_GET['page'] ?? 'home';

if ($page == 'home') {
    echo "<h2 class='text-4xl font-bold mb-6 text-center text-pink-700'>Witamy w Restauracji Artystycznej!</h2>
          <p class='text-xl text-center max-w-xl mx-auto'>Miejsce, gdzie smak łączy się ze sztuką. Spróbuj naszych fantazyjnych potraw w wyjątkowym wnętrzu.</p>";
}

elseif ($page == 'menu') {
    echo "<h2 class='text-3xl font-semibold mb-6 text-blue-700 text-center'>Nasze Menu</h2>";
    $res = $conn->query("SELECT * FROM rest_menu");
    echo "<div class='grid sm:grid-cols-2 lg:grid-cols-3 gap-8'>";
    while ($row = $res->fetch_assoc()) {
        echo "
        <div class='bg-white rounded-[2rem] shadow-xl p-4 transform hover:scale-105 transition'>
            <img src='images/{$row['id_pozycji']}.jpg' alt='{$row['nazwa_pozycji']}' class='w-full h-40 object-cover rounded-xl mb-3'>
            <h3 class='text-xl text-blue-800 font-semibold'>{$row['nazwa_pozycji']}</h3>
            <p class='text-sm text-gray-500'>Kategoria: {$row['kategoria']}</p>
            <p class='text-lg text-blue-600 font-bold mt-2'>{$row['cena']} zł</p>
        </div>";
    }
    echo "</div>";
}

elseif ($page == 'klienci') {
    echo "<h2 class='text-3xl text-green-700 font-semibold mb-6 text-center'>Nasi Klienci</h2>";
    $res = $conn->query("SELECT * FROM rest_klienci");
    echo "<div class='overflow-x-auto'><table class='w-full bg-white rounded-xl shadow-md'>
          <thead><tr class='bg-green-100 text-left'>
          <th class='p-3'>ID</th><th>Imię</th><th>Nazwisko</th><th>Telefon</th></tr></thead><tbody>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='border-t hover:bg-green-50'>
              <td class='p-3'>{$row['id_klienta']}</td>
              <td>{$row['imie']}</td>
              <td>{$row['nazwisko']}</td>
              <td>{$row['numer_tel']}</td>
              </tr>";
    }
    echo "</tbody></table></div>";
}

elseif ($page == 'zamowienia') {
    echo "<h2 class='text-3xl text-yellow-700 font-semibold mb-6 text-center'>Zamówienia</h2>";
    $res = $conn->query("SELECT k.imie, k.nazwisko, z.data_zamowienia, m.nazwa_pozycji, z.ilosc, m.cena FROM rest_zamowienia z
                         JOIN rest_klienci k ON z.id_klienta = k.id_klienta
                         JOIN rest_menu m ON z.id_pozycji = m.id_pozycji");
    echo "<div class='overflow-x-auto'><table class='w-full bg-white rounded-xl shadow-md'>
          <thead><tr class='bg-yellow-100 text-left'>
          <th class='p-3'>LP</th><th>Imię</th><th>Nazwisko</th><th>Data</th><th>Pozycja</th><th>Ilość</th><th>Cena</th></tr></thead><tbody>";
    $lp = 1;
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='border-t hover:bg-yellow-50'><td class='p-3'>$lp</td><td>{$row['imie']}</td><td>{$row['nazwisko']}</td><td>{$row['data_zamowienia']}</td><td>{$row['nazwa_pozycji']}</td><td>{$row['ilosc']}</td><td>{$row['cena']}</td></tr>";
        $lp++;
    }
    echo "</tbody></table></div>";
}

elseif ($page == 'zestawienie') {
    echo "<h2 class='text-3xl text-purple-700 font-semibold mb-6 text-center'>Zestawienie Pozycji</h2>";
    $res = $conn->query("SELECT m.nazwa_pozycji, SUM(z.ilosc) AS laczna_ilosc FROM rest_zamowienia z
                         JOIN rest_menu m ON z.id_pozycji = m.id_pozycji
                         GROUP BY z.id_pozycji ORDER BY laczna_ilosc DESC");
    echo "<table class='w-full bg-white rounded-xl shadow-md'>
          <thead><tr class='bg-purple-100 text-left'>
          <th class='p-3'>LP</th><th>Pozycja</th><th>Łączna Ilość</th></tr></thead><tbody>";
    $lp = 1;
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='border-t hover:bg-purple-50'><td class='p-3'>$lp</td><td>{$row['nazwa_pozycji']}</td><td>{$row['laczna_ilosc']}</td></tr>";
        $lp++;
    }
    echo "</tbody></table>";
}

elseif ($page == 'najlepszy') {
    echo "<h2 class='text-3xl text-orange-700 font-semibold mb-6 text-center'>Najlepszy Klient</h2>";
    $res = $conn->query("SELECT k.imie, k.nazwisko, SUM(z.ilosc * m.cena) AS suma
                         FROM rest_zamowienia z
                         JOIN rest_klienci k ON z.id_klienta = k.id_klienta
                         JOIN rest_menu m ON z.id_pozycji = m.id_pozycji
                         GROUP BY z.id_klienta ORDER BY suma DESC LIMIT 1");
    if ($row = $res->fetch_assoc()) {
        $kwota = number_format($row['suma'], 1, '.', '');
echo "<p class='text-xl text-center'>🥇 <strong>{$row['imie']} {$row['nazwisko']}</strong> wydał łącznie <strong>{$kwota} zł</strong></p>";

    } else {
        echo "<p class='text-center'>Brak danych.</p>";
    }
}
?>
</section>

</body>
</html>
