<?php
include'../utilisateur/utilisateur.php';
$utilisateur = new utilisateur(array(
    'email' => $_POST['email'],
    'mdp' => $_POST['mdp']
));
$utilisateur->connexion();