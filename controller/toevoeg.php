<?php
$currentDate = date('Y-m-d');
?>

<form action="../index.php" method="post">
    <label for="ID">ID:</label><br>
    <input type="text" id="ID" name="ID"><br>
    <label for="Datum">Datum:</label><br>
    <input type="text" id="Datum" name="Datum" value="<?php echo $currentDate; ?>" readonly><br>
    <label for="AutoId">AutoId:</label><br>
    <input type="text" id="AutoId" name="AutoId"><br>
    <label for="Mankement">Mankement:</label><br>
    <input type="text" id="Mankement" name="Mankement"><br><br>
    <input type="submit" name="submit" value="Voer in">

    <?php
    if (isset($_POST['submit'])) {
        $ID = $_POST['ID'];
        $Datum = $_POST['Datum'];
        $AutoId = $_POST['AutoId'];
        $Mankement = $_POST['Mankement'];

        if (strlen($Mankement) > 50) {
            echo "Het nieuwe mankement is meer dan 50 tekens lang en is niet toegevoegd, probeer het opnieuw";
        } else {

            try {
                $pdo = new PDO('mysql:host=localhost;dbname=mvc-oop-pdo-toets-userstory', 'root', '');
                $query = "INSERT INTO mankement (ID, Datum, AutoId, Mankement) VALUES (:ID, :Datum, :AutoId, :Mankement)";
                $stmt = $pdo->prepare($query);
                $stmt->execute(array(':ID' => $ID, ':Datum' => $Datum, ':AutoId' => $AutoId, ':Mankement' => $Mankement));

                $_SESSION['message'] = 'error';
                header('Location: index.php');
                echo "Het nieuwe mankement is toegevoegd";
                exit;
            } catch (PDOException $e) {
                die("Error!: " . $e->getMessage());
            }
        }
    }
    ?>

</form>