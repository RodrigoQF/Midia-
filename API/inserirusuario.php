<?php 

include_once("conexao.php");


$nome_completo = $_POST['nome_completo'];
$username = $_POST['username'];
$senha = $_POST['senha'];
$data_nascimento = $_POST['data_nascimento'];
$cidade = $_POST['cidade'];
$estado = $_POST['estado'];


if($nome_completo == '' or $username == '' or $senha == '' or $data_nascimento == '' or $cidade == '' or $estado == ''){
	echo(json_encode(array("message"=>'Preencha os Dados')));
	exit();
}


if($nome_completo == @$nome_completo_recup){
    echo(json_encode(array("message"=>'Nome ja cadastrado')));
    exit();
}

if($username == @$username_recup){
    echo(json_encode(array("message"=>'Username ja Cadastrado')));
    exit();
}


$res = $pdo->prepare("INSERT into usuario (nome_completo, username, senha, data_nascimento, cidade, estado) values (:nome_completo, :username, :senha, :data_nascimento, :cidade, :estado)");

    $res->bindValue(":nome_completo", $nome_completo);
    $res->bindValue(":username", $username);
    $res->bindValue(":senha", $senha);
    $res->bindValue(":data_nascimento", $data_nascimento);
    $res->bindValue(":cidade", $cidade);
    $res->bindValue(":estado", $estado);

    $res->execute();


 if($res){
 	echo(json_encode(array("message"=>'Inserido com Sucesso')));
 }
else{
  echo(json_encode(array("message"=>'Nao inserido')));  
}
 

?>