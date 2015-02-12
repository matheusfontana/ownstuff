<?php
/*
* Função que quebra uma string grande(Possivelmente gigante) em duas. Útil para separar frases ou nomes 
* longos para geração de documentos PDF, por exemplo.
*/
function separaStringPorTamanhoMaximoMaisDelimitador($string, $tamanhoMax, $delimitador){
	if (strlen($string) <= $tamanhoMax){
		return array($string);
	}//if (strlen($string) < $tamanhoMax){
	
	$varAux = "";
	$resultado = "";
	$arrStringSeparada = explode($delimitador, $string);

	for($i=0;$i<count($arrStringSeparada);$i++){
		if ((strlen($arrStringSeparada[$i]) + strlen($varAux)) > $tamanhoMax){
			$resultado[] = $varAux;
			$varAux = "";		
		}
		
		if(empty($varAux)){
			$varAux = $arrStringSeparada[$i]." ";
		}else{
			$varAux .= $arrStringSeparada[$i]." ";
		}
	}
	
	$resultado[] = $varAux;
	return $resultado;
}

$string = "BOAS PRÁTICAS EM MANIPULAÇÃO DE ALIMENTOS EM SERVIÇOS DE ALIMENTAÇÃO";
$string = "Programa de Formação Continuada em Gerenciamento de Projetos (In Company com o Hospital Divina Provi";
$string = "Break My Fall! I found what was missing inside you!";

$tamanhoMax = 60;
$delimitador = " ";
$badoo = separaStringPorTamanhoMaximoMaisDelimitador($string, $tamanhoMax, $delimitador);

echo "<pre>";
var_dump($badoo);
echo "</pre>";

?>
