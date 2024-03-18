<?php

class utilisateur{
    private $id;
    private $nom;
    private $prenom;
    private $email;
    private $mdp;

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
        public function getEmail(){
            return $this->email;
        }
        public function setEmail($email){
            $this->email = $email;
        }
        public function getMdp(){
            return $this->mdp;
        }
        public function setMdp($mdp){
            $this->mdp = $mdp;
        }

        //méthode pour se connecter
        public function connexion(){

            $bdd = new PDO('mysql:host=localhost;dbname=projet_vol;charset=utf8', 'root', '');
            $req = $bdd->query('SELECT * FROM utilisateur WHERE email = :email  AND mdp = :mdp ');
            $req->execute(array(
                'email' => $this->email,
                'mdp' => $this->mdp,
            ));
            $resultat = $req->fetch();

        }
        //méthode pour s'inscrire
        public function inscription(){
            $bdd = new PDO('mysql:host=localhost;dbname=projet_vol;charset=utf8', 'root', '');
            
            $req = $bdd->prepare('INSERT INTO utilisateur(nom, prenom, age, ville, email, mdp) VALUES(:nom, :prenom, :age, :ville, :email, :mdp)');
            $req->execute(array(
                'nom' => $this->nom,
                'prenom' => $this->prenom,
                'age' => $this->age,
                'ville' => $this->ville,
                'email' => $this->email,
                'mdp' => $this->mdp,
            ));
            $res = $req->fetch();
        }
}
