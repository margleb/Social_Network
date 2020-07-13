<?php

class Dump {
	public static function vardump($var) {
		echo '<pre>';
		var_dump($var);
		echo '</pre>';
	}
}