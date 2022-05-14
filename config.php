<?php

require 'environment.php';

$config = array();

if(ENVIRONMENT == 'development'){
	define("BASE_URL", "http://localhost/projects/rafael/");
	$config['dbname'] = 'sistema';
	$config['host'] = 'localhost';
	$config['dbuser'] = 'admin';
	$config['dbpass'] = 'admin';

}else{
	define("BASE_URL", "http://sistema.borgesautocenter.com.br/");
	$config['dbname'] = 'sistema';
	$config['host'] = 'localhost';
	$config['dbuser'] = 'admin';
	$config['dbpass'] = 'admin';

}

global $db;
try{
	$db = new PDO("mysql:dbname=".$config['dbname'].";host=".$config['host'], $config['dbuser'], $config['dbpass']);

}catch(PDOException $e) {
	echo "ERRO: ".$e->getMessage();
	exit;
}
