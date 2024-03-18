
<?php
class SqlConnexion{
    private $host = "localhost";
    
    private $username = "root";
    private $password = "";
    private $database = "projet_vol";

    public function __construct($host, $username, $password, $database) {
        $this->host = $host;
        $this->username = $username;
        $this->password = $password;
        $this->database = $database;
    }

    public function connexion() {
        $conn = new PDO();

        

        return $conn;
    }
}





