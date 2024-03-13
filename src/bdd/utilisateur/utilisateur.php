<?php

class Utilisateur{
    private $id;
    private $nom;
    private $prenom;
    private $age;
    private $ville;

    public function __construct(array $donnees){
        $this->hydrate($donnees);
        }
        public function hydrate(array $donnees){
        foreach ($donnees as $key => $value){
        $method = 'set'.ucfirst($key);
        if (method_exists($this, $method)){
        $this->$method($value);
        }
        }
        }

   
        public function getNom(){
            return $this->nom;
        }
        public function setNom($nom){
            $this->nom = $nom;
        }
        public function getPrenom(){
            return $this->prenom;
        }
        public function setPrenom($prenom){
            $this->prenom = $prenom;
        }
        public function getAge(){
            return $this->age;
        }
        public function setAge($age){
            $this->age = $age;
        }
        public function getVille(){
            return $this->ville;
        }
        public function setVille($ville){
            $this->ville = $ville;
        }
        public function connexion(){

            $bdd = new PDO('mysql:host=localhost;dbname=projet_vol;charset=utf8', 'root', '');
          
        }
}