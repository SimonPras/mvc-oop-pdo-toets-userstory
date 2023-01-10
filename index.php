<H1>overzicht mankementen</H1>
<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=mvc-oop-pdo-toets-userstory', 'root', '');
    $query = "SELECT * FROM mankement ORDER BY Datum DESC";
    $stmt = $pdo->prepare($query);
    $stmt->execute();
    $mankementen = $stmt->fetchAll();

    echo '<table border="1">';
    echo '<tr>';
    echo '<th>Id</th>';
    echo '<th>Datum</th>';
    echo '<th>AutoId</th>';
    echo '<th>Mankement</th>';
    echo '</tr>';
    foreach ($mankementen as $mankement) {
        echo '<tr>';
        echo '<td>' . $mankement['Id'] . '</td>';
        echo '<td>' . $mankement['Datum'] . '</td>';
        echo '<td>' . $mankement['AutoId'] . '</td>';
        echo '<td>' . $mankement['Mankement'] . '</td>';
        echo '</tr>';
    }
    echo '</table>';
} catch (PDOException $e) {
    die("Error!: " . $e->getMessage());
}


echo '<button onclick="window.location.href=\'controller/toevoeg.php\'">Mankement toevoegen</button>';
