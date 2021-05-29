<?php 

include_once("conexao.php");

$username = $_GET['username'];
$senha = $_GET['senha'];

$query = $pdo->query("SELECT * FROM USUARIO WHERE username = '$username' and senha = '$senha'");

$stmt = $pdo->prepare($sql);
$stmt->execute();

$dados = array();
$res = $stmt->fetchAll(PDO::FETCH_ASSOC);

for ($i=0; $i < count($res); $i++){
    foreach ($res[$i] as $key => $value){}
        
    $dados = $res;
}

echo ($res) ?
json_encode(array("code" => 0, "result"=>$dados)) : 
json_encode(array("code" => 0, "result"=>"Dados nÃ£o encontrados!"))


?>