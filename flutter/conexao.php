<?php

$banco = 'midia+';
$host = 'localhost';
$usuario = 'root';
$senha = '';

putenv("TZ=America/Sao_Paulo");

try{
    $pdo = new PDO ("mysql:dbname=$banco;host=$host;charset=utf8", "$usuario", "$senha");
    
    
} catch (Exception $e){
    echo "Erro ao conectar com bd".$e;
    
}

?>
