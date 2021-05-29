<?php 

include_once("conexao.php");


$titulo = $_POST['titulo'];
$comentario = $_POST['comentario'];
$avaliacao = $_POST['avaliacao'];


if($titulo == '' or $comentario == '' or $avaliacao == '' ){
	echo(json_encode(array("message"=>'Preencha os Dados')));
	exit();
}




$res = $pdo->prepare("INSERT into comentarios (titulo, comentario, avaliacao) values (:titulo, :comentario, :avaliacao,)");

    $res->bindValue(":titulo", $titulo);
    $res->bindValue(":comentario", $comentario);
    $res->bindValue(":avaliacao", $avaliacao);

    $res->execute();


 if($res){
 	echo(json_encode(array("message"=>'Inserido com Sucesso')));
 }
else{
  echo(json_encode(array("message"=>'Nao inserido')));  
}
 

?>