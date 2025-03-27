<?php
$host = 'localhost';
$dbname = 'bdd_partiel';
$username = 'root';
$password = 'root';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
} catch(PDOException $e) {
    die("Erreur de connexion : " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Top Mangas</title> 
</head>
<body>
<h1>Top Manga :</h1>
<ul>
    <?php
        $query = $pdo->query("SELECT Titre, Annee_Publication FROM Manga ORDER BY Annee_Publication ASC");
        while ($manga = $query->fetch(PDO::FETCH_ASSOC)) {
            echo "<li> <a href='#'>" . htmlspecialchars($manga['Titre']) . "</a> <p>" . htmlspecialchars($manga['Annee_Publication']) . "</p></li>";
        }
    ?>
</ul>
</body>
</html>