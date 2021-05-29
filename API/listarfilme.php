<?php 

include_once("conexao.php");


$sql  = "SELECT * FROM filme";
$stmt = DB::prepare($sql);
$stmt->execute();



$dados = array();
$res = $stmt->fetchAll();


for ($i=0; $i < count($res); $i++) { 

      foreach ($res[$i] as $key => $value) {}

          $dados = $res;

}

echo ($res) ?
json_encode(array("code" => 1, "result"=>$dados)) : 
json_encode(array("code" => 0, "result"=>"Dados não encontrados!")) 

 ?>