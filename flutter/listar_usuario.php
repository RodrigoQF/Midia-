<?php 
include "conexao.php";


    $nome_completo = mysqli_real_escape_string($connect, $_POST['nome_completo']);
    $username = mysqli_real_escape_string($connect, $_POST['username']);
    $senha = mysqli_real_escape_string($connect, $_POST['senha']);
    $data_nascimento = mysqli_real_escape_string($connect, $_POST['data_nascimento']);
    $cidade = mysqli_real_escape_string($connect, $_POST['cidade']);
    $estado = mysqli_real_escape_string($connect, $_POST['estado']);
  
 
        $query = "INSERT INTO usuario (nome_completo, username,senha,data_nascimento,cidade,estado)
  			  VALUES('$nome_completo', '$username','$senha','$data_nascimento','$cidade','$estado')";
    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "user added successfully";
    }
    
    


    
    
    ?>

