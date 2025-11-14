<?php
class Database {
    private static $instance = null;
    private $pdo;

    private function __construct(){
        $host = '127.0.0.1';
        $db   = 'aplasta_topos';
        $user = 'root';
        $pass = '';
        $charset = 'utf8mb4';

        $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
        $opt = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ];

        $this->pdo = new PDO($dsn, $user, $pass, $opt);

        // Sincronizar la zona horaria de MySQL con Bogotá (UTC-5)
        $this->pdo->exec("SET time_zone = '+05:00'");
    }

    public static function getInstance(){
        if (!self::$instance) self::$instance = new Database();
        return self::$instance;
    }

    public function getPdo(){
        return $this->pdo;
    }
}
