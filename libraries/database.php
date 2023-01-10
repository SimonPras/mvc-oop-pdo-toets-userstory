<?php
$host = 'localhost';
$dbname = 'mvc-oop-pdo-toets-userstory';
$username = 'root';
$password = '';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}

$type = 'lekke band';
$location = 'achterwiel';
$description = 'band is lek aan de zijkant';

$sql = "INSERT INTO mankement (type, location, description) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);
$stmt->execute([$type, $location, $description]);

echo "New record created successfully";

$conn = null;
