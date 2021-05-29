<?php 

include_once("conexao.php");

$username = $_GET['username'];
$senha = $_GET['senha'];

$dados = array();

$query = $pdo->query("SELECT * FROM USUARIO WHERE username = '$username' and senha = '$senha'");
$res = $query->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++){
    foreach ($res[$i] as $key => $value){}
        
    $dados = $res;
}

echo ($res) ?
json_encode(array("code" => 0, "result"=>$dados)) : 
json_encode(array("code" => 0, "result"=>"Dados não encontrados!"))


?>