<?php
include 'bdd/projet_vol.sql';
include'../utilisateur/utilisateur.php';
$utilisateur = new utilisateur($_POST);
$utilisateur->connexion();