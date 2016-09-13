<?php

if(isset($_POST["pcName"]) && 
	isset($_POST["ip"]) && 
	isset($_POST["userName"]) && 
	isset($_POST["defaultPrinter"]) && 
	isset($_POST["availablePrinters"])
	){}else{
	echo "One or more variables are not set";
	//exit;
}

$pcName = $_POST["pcName"];
$ip = $_POST["ip"];
$userName=$_POST["userName"];
$defaultPrinter = $_POST["defaultPrinter"];
$availablePrinters = $_POST["availablePrinters"];


//$con = mysqli_connect("localhost","root","947037f5555a4e19a5ad6809b9489b37","printerqueuehistory");
$con = mysqli_connect("localhost","root","","inkalert");

// Check connection
if (mysqli_connect_errno())
  {
  	
  	
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  
  }else{
  	$query = "INSERT INTO `inkalert`.`novedades` 
  			(`computer`, `ip`,  `userName`, `defaultPrinter`, `availablePrinters`) VALUES 
  			('". $pcName ."','". $ip ."', '". $userName ."', '". $defaultPrinter ."', '". $availablePrinters ."');
  			";
  	echo $query;
  	mysqli_query($con,$query);
  	
  	mysqli_close($con);
  	
  }
?>