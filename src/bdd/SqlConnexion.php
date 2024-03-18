
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
        $conn = new mysqli($this->host, $this->username, $this->password, $this->database);

        if ($conn->connect_error) {
            die("Connexion à échoué: " . $conn->connect_error);
        }

        return $conn;
    }
}





