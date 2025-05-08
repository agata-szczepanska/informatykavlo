<?php
// Polaczenie z baza danych
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
    <title>Okręty świata</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: grid;
            grid-template-areas: 
                "header header"
                "menu content"
                "footer footer";
            grid-template-rows: auto 1fr auto;
            grid-template-columns: 200px 1fr;
            height: 100vh;
        }

        header {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 1rem;
        }

                footer {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 1rem;
        }

        nav {
            grid-area: menu;
            background-color: #f4f4f4;
            padding: 1rem;
        }

        nav a {
            display: block;
            margin: 0.5rem 0;
            color: #003366;
            text-decoration: none;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        main {
            grid-area: content;
            padding: 1rem;
            overflow-y: auto;
        }

        .tab-content {
            display: none;
        }

        .tab-content.active {
            display: block;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 8px;
            text-align: left;
        }

        h2 {
            color: #003366;
        }
    </style>
    <script>
        function showTab(tabId) {
            const tabs = document.querySelectorAll('.tab-content');
            tabs.forEach(tab => tab.classList.remove('active'));
            document.getElementById(tabId).classList.add('active');
        }

        window.onload = function () {
            showTab('home'); // Default tab
        };
    </script>

        <header>
        <h1></h1>
    </header>
</head>
<body>
    <header>
        <h1>Okręty świata</h1>
    </header>






    <nav>
    <a href="?page=home">Strona Główna</a>
    <a href="?page=list">Lista okrętów</a>
    <a href="?page=task1">Zadanie 1</a>
    <a href="?page=task2">Zadanie 2</a>

</nav>

    <section>
        <?php
        $page = $_GET['page'] ?? 'home';

if ($page == 'home') {
    echo "<h2>Witamy na pokładzie!
</h2><p>
Nasza strona poświęcona jest najwspanialszym okrętom świata – zarówno historycznym jednostkom, które zapisały się na kartach historii, jak i nowoczesnym cudom inżynierii morskiej.</p>";
}

elseif ($page == 'list') {
echo "<h2>Zestawienie</h2>";
    $res = $conn->query("SELECT o.id_okretu, o.nazwa, o.typ, o.rok_zwodzenia, k.klasa, k.kraj FROM okrety o
                         JOIN klasy_okretow k ON o.typ = k.typ
                         ORDER By id_okretu ASC");
    echo "<table><tr><th>ID okrętu</th><th>Nazwa okrętu</th><th>Typ</th><th>Rok zwodowania</th><th>Klasa</th><th>Kraj</th></tr>";

    while ($row = $res->fetch_assoc()) {
        echo "<tr><td>{$row['id_okretu']}</td><td>{$row['nazwa']}</td><td>{$row['typ']}</td><td>{$row['rok_zwodzenia']}</td><td>{$row['klasa']}</td><td>{$row['kraj']}</td></tr>";

    }
    echo "</table>";
}



elseif ($page == 'task1') {
    echo "<h2>Zadanie 1</h2>";
    $res = $conn->query("SELECT typ, MIN(rok_zwodzenia) AS rok_zwodzenia FROM okrety WHERE rok_zwodzenia > 1920 GROUP BY typ;");
    echo "<table><tr><th>Typ</th><th>Rok zwodowania po raz pierwszy</th>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr><td>{$row['typ']}</td><td>{$row['rok_zwodzenia']}</td>";
    }
    echo "</table>";
}

elseif ($page == 'task2') {
    echo "<h2>Zadanie 2</h2>";
    $res = $conn->query("SELECT k.typ, k.kraj, COUNT(o.id_okretu) AS liczba_okretow FROM klasy_okretow k 
    INNER JOIN okrety o ON k.typ = o.typ 
    GROUP BY k.typ, k.kraj 
    ORDER BY liczba_okretow DESC;");
    echo "<table><tr><th>Typ</th><th>Kraj</th><th>Liczba okrętów</th>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr><td>{$row['typ']}</td><td>{$row['kraj']}</td><td>{$row['liczba_okretow']}</td>";

    }
    echo "</table>";
}



    ?>

</section>

</body>
<footer><p>&copy; 2025 Moja Strona</p></footer>
</html>
