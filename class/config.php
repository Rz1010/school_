<?php
class dbConfig {
    protected $serverName;
    protected $userName;
    protected $password;
    protected $dbName;
    function dbConfig() {
        $this -> serverName = 'localhost';
        $this -> userName = 'rz';
        $this -> password = 'Hellfire000@';
        $this -> dbName = 'webdamn_demos';
    }
}
?>