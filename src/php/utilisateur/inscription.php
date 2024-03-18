<?php
include'../utilisateur/utilisateur.php';

$utilisateurs = new utilisateur(array(
    'nom' => $_POST['nom'],
    'prenom' => $_POST['prenom'],
    'email' => $_POST['email'],
    'mdp' => $_POST['mdp'],
    'age' => $_POST['age'],
    'ville' => $_POST['ville']
));
$utilisateurs->inscription();