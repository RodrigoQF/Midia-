<?php 

include_once("conexao.php");


$titulo = $_POST['titulo'];
$diretor = $_POST['diretor'];
$elenco_principal = $_POST['elenco_principal'];
$pais = $_POST['pais'];
$ano_lancamento = $_POST['ano_lancamento'];
$imagem = $_POST['imagem'];



if($titulo == '' or $diretor == '' or $elenco_principal == '' or $pais == '' or $ano_lancamento == ''){
	echo(json_encode(array("message"=>'Preencha os Dados')));
	exit();
}


if($titulo == @$titulo_recup){
    echo(json_encode(array("message"=>'Filme ja cadastrado')));
    exit();
}




$res = $pdo->prepare("INSERT into filme (titulo, diretor, elenco_principal, pais, ano_lancamento, imagem) values (:titulo, :diretor, :elenco_principal, :pais, :ano_lancamento, :imagem)");

    $res->bindValue(":titulo", $titulo);
    $res->bindValue(":diretor", $diretor);
    $res->bindValue(":elenco_principal", $elenco_principal);
    $res->bindValue(":pais", $pais);
    $res->bindValue(":ano_lancamento", $ano_lancamento);
    $res->bindValue(":imagem", $imagem);

    $res->execute();


 if($res){
 	echo(json_encode(array("code" => 1, "message"=>'Inserido com Sucesso')));
 }
else{
  echo(json_encode(array("code" => 1, "message"=>'Nao inserido')));  
}
 

?>