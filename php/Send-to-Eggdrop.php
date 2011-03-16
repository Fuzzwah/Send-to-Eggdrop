<?php

$send2bot['botip'] = ""; // your bot's ip
$send2bot['botport'] = "17343"; // the port which you configured in the tcl
$send2bot['pass'] = ""; // the password which you configured in the tcl and will be prompted for when using the chrome extension

function sendtobot($text) {
	global $send2bot;
        
	if ( $text == '') {
		return;
    }
	$fp = fsockopen($send2bot['botip'], $send2bot['botport'], $errno, $errstr, 30);

	if ($fp) {
		fputs($fp, md5($send2bot['pass']) ." ".stripslashes($text)."\n");
		usleep(2000);
		fclose($fp);
	}
}
if ($_POST['pass']==$send2bot['pass']) {
	$text = $_POST['user']." wants to pimp: ".$_POST['url'];
	sendtobot($text);
	$text = "URL title: ".$_POST['title'];
	sendtobot($text);
}
?>