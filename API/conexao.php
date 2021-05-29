<?php

$host = "localhost";
$username = "279477";
$password = "BigRod2001";
$name = "279477";

try{
    $pdo = new PDO ("mysql:dbname=$name;host=$host;charset=utf8", "$username", "$password");

}
    catch (Exception $e) {
        echo "Erro ao conectar com o banco de dados".$e;
    }

 ?>