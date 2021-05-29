<?php 

include_once("conexao.php");


$titulo = $_POST['titulo'];
$autor = $_POST['autor'];
$editora = $_POST['editora'];
$pais = $_POST['pais'];
$ano_lancamento = $_POST['ano_lancamento'];
$imagem = $_POST['imagem'];



if($titulo == '' or $autor == '' or $editora == '' or $pais == '' or $ano_lancamento == '' or $imagem == ''){
	echo(json_encode(array("message"=>'Preencha os Dados')));
	exit();
}


if($titulo == @$titulo_recup){
    echo(json_encode(array("message"=>'Livro ja cadastrado')));
    exit();
}




$res = $pdo->prepare("INSERT into livro (titulo, autor, editora, pais, ano_lancamento, imagem) values (:titulo, :autor, :editora, :pais, :ano_lancamento, :imagem)");

    $res->bindValue(":titulo", $titulo);
    $res->bindValue(":autor", $autor);
    $res->bindValue(":editora", $editora);
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