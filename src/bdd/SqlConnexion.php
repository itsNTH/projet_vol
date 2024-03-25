
<?php

class SqlConnexion{
    private $host = "localhost";
    
    private $username = "root";
    private $password = "";
    private $database = "projet_vol";


    public function connexion() {

        $pdo = new PDO('mysql:host='.$this->host.';dbname='.$this->database.';',$this->username, $this->password);


        

        return $pdo;
    }
}






