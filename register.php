<?php
$con = mysqli_connect("localhost", "root", "", "social");


if(mysqli_connect_errno()) {
	echo "Failed to connect: " . mysqli_connect_errno();
}


//Declaring variables to prevent errors
$fname = ""; // First name
$lname = ""; // Last name
$em = ""; // email
$em2 = ""; // email2
$password = ""; // password
$password2 = ""; // password 2
$date = ""; //Sign up date
$error_array = ""; //Holds error message

if(isset($_POST['register_button'])) {

	// Registration form values

	// First name
	$fname = stript_tags($_POST['reg_fname']);  // Удаляет теги HTML
	$fname = str_replace(' ', '', $fname); // Удаляет пробелы
	$fname = ucfirst(strtolower($fname)); // Первая заглавная буква
	// Last name
	$fname = stript_tags($_POST['reg_lname']);  // Удаляет теги HTML
	$fname = str_replace(' ', '', $fname); // Удаляет пробелы
	$fname = ucfirst(strtolower($fname)); // Первая заглавная буква
	// Email
	$em = stript_tags($_POST['reg_email']);  // Удаляет теги HTML
	$em = str_replace(' ', '', $em); // Удаляет пробелы
	$em = ucfirst(strtolower($em)); // Первая заглавная буква
	// Email 2
	$em2 = stript_tags($_POST['reg_email2']);  // Удаляет теги HTML
	$em2 = str_replace(' ', '', $em2); // Удаляет пробелы
	$em2 = ucfirst(strtolower($em2)); // Первая заглавная буква
	// Password
	$password = stript_tags($_POST['reg_password']);  // Удаляет теги HTML
	$password2 = stript_tags($_POST['reg_password2']);  // Удаляет теги HTML
	// Дата
	$date = date("Y-m-d"); // Current date
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Swirlfeed!</title>
</head>
<body>
	<form action="register.php" method="POST">
		<input type="text" name="reg_fname" placeholder="First Name" required>
		<br>
		<input type="text" name="reg_lname" placeholder="Last Name" required>
		<br>
		<input type="email" name="reg_email" placeholder="Email" required>
		<br>
		<input type="email" name="reg_email2" placeholder="Confirm Email"required>
		<br>
		<input type="password" name="reg_password" placeholder="Password" required>
		<br>
		<input type="password" name="reg_password2" placeholder="Confirm Password"required>
		<br>
		<input type="submit" name="register_button" value="Register">
	</form>
</body>
</html>