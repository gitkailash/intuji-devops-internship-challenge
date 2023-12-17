<?php
	// Include Composer's autoloader to automatically load the required classes.
	require_once __DIR__ . '/../vendor/autoload.php';
	
	// Import the Hello class from the Silarhi namespace.
	use Silarhi\Hello;
	
	// Create an instance of the Hello class.
	$hello = new Hello();
	
	// Display the "Hello World" message using the display method of the Hello class.
	echo $hello->display() . "\n";
?>
