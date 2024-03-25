<?php
include('Utilisateur.php');
include('../../bdd/SqlConnexion.php');



$filepath = 'Utilisateur.php';
if (file_exists($filepath)) {
    echo" le fichier existe bien a: $filepath";
} else {
    echo "le fichier n'existe pas: $filepath";
}




$utilisateur = new Utilisateur($_POST);
$utilisateur->connexion();