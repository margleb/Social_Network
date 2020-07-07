<?php

session_start();

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
$error_array = array(); //Holds error message

if(isset($_POST['register_button'])) {

	// Registration form values

	// First name
	$fname = strip_tags($_POST['reg_fname']);  // Удаляет теги HTML
	$fname = str_replace(' ', '', $fname); // Удаляет пробелы
	$fname = ucfirst(strtolower($fname)); // Первая заглавная буква
	$_SESSION['reg_fname'] = $fname; // Cохраняем в сессию переменную

	// Last name
	$lname = strip_tags($_POST['reg_lname']);  // Удаляет теги HTML
	$lname = str_replace(' ', '', $lname); // Удаляет пробелы
	$lname = ucfirst(strtolower($lname)); // Первая заглавная буква
	$_SESSION['reg_lname'] = $lname; // Cохраняем в сессию переменную

	// Email
	$em = strip_tags($_POST['reg_email']);  // Удаляет теги HTML
	$em = str_replace(' ', '', $em); // Удаляет пробелы
	$em = ucfirst(strtolower($em)); // Первая заглавная буква
	$_SESSION['reg_email'] = $em; // Cохраняем в сессию переменную

	// Email 2
	$em2 = strip_tags($_POST['reg_email2']);  // Удаляет теги HTML
	$em2 = str_replace(' ', '', $em2); // Удаляет пробелы
	$em2 = ucfirst(strtolower($em2)); // Первая заглавная буква
	$_SESSION['reg_email2'] = $em2; // Cохраняем в сессию переменную

	// Password
	$password = strip_tags($_POST['reg_password']);  // Удаляет теги HTML
	$password2 = strip_tags($_POST['reg_password2']);  // Удаляет теги HTML
	// Дата
	$date = date("Y-m-d"); // Current date

	if($em == $em2) {
		// Check if email is in valid format
		// Фильтрует переменную с помощью определенного фильтра
		if(filter_var($em, FILTER_VALIDATE_EMAIL)) {
				// Check if email already exists
				$e_check = mysqli_query($con, "SELECT email FROM users WHERE email='$em'");
				// Count the number of rows returned
				$num_rows = mysqli_num_rows($e_check);

				if($num_rows > 0) {
					array_push($error_array, "Email already in use<br>");
				}

		} else {
			array_push($error_array, "Invalid email format<br>");
		}
	} else {
		array_push($error_array, "Email don't match<br>");
	}

	if(strlen($fname) > 25 || strlen($fname) < 2) {
		array_push($error_array, "Your first name must be between 2 and 25 characters<br>");
	}

	if(strlen($lname) > 25 || strlen($lname) < 2) {
		array_push($error_array, "Your last name must be between 2 and 25 characters<br>");
	}

	if($password != $password2) {
		array_push($error_array, "Your passwords do not match<br>");
	}
	else {
		if(preg_match('/[^A-Za-z0-9]/', $password)) {
			array_push($error_array, "Your password can only contain english characters or numbers<br>");
		}
	}

	if(strlen($password > 30 || strlen($password) < 5)) {
		array_push($error_array, "Your password must be betwen 5 and 30 characters<br>");
	}

	if(empty($error_array)) {
		$password = md5($password); // Encrypt password before sending to database
		// Generate username by concatinating first name and last name
		$username = strtolower($fname . "_".$lname);
		$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");
		$i = 0
		// if username exists add number to username
		while(mysqli_num_rows($check_username_query) != 0) {
			$i++; //Add 1 to i
			$username = $username."_".$i;
			$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");
		}
	}
}

?>

<!DOCTYPE html>
<html>
<head>
	<title>Welcome to Swirlfeed!</title>
</head>
<body>
	<form action="register.php" method="POST">
		<input type="text" name="reg_fname" placeholder="First Name" value="<?php if(isset($_SESSION['reg_fname'])) { echo $_SESSION['reg_fname']; } ?>" required>
		<br>
		<?php if(in_array("Your first name must be between 2 and 25 characters<br>", $error_array)) echo "Your first name must be between 2 and 25 characters<br>"; ?>

		<input type="text" name="reg_lname" placeholder="Last Name" value="<?php if(isset($_SESSION['reg_lname'])) { echo $_SESSION['reg_lname']; } ?>" required>
		<br>
		<?php if(in_array("Your last name must be between 2 and 25 characters<br>", $error_array)) echo "Your last name must be between 2 and 25 characters<br>"; ?>


		<input type="email" name="reg_email" placeholder="Email" value="<?php if(isset($_SESSION['reg_email'])) { echo $_SESSION['reg_email']; } ?>" required>
		<br>

		<input type="email" name="reg_email2" placeholder="Confirm Email" value="<?php if(isset($_SESSION['reg_email2'])) { echo $_SESSION['reg_email2']; } ?>" required>
		<br>
		<?php if(in_array("Email already in use<br>", $error_array)) echo "Email already in use<br>";
		else if(in_array("Invalid email format<br>", $error_array)) echo "Invalid email format<br>";
		else if(in_array("Email don't match<br>", $error_array)) echo "Email don't match<br>"; ?>

	
		<input type="password" name="reg_password" placeholder="Password" required>
		<br>
		<input type="password" name="reg_password2" placeholder="Confirm Password"required>
		<br>
		<?php if(in_array("Your passwords do not match<br>", $error_array)) echo "Your passwords do not match<br>";
		else if(in_array("Your password can only contain english characters or numbers<br>", $error_array)) echo "Your password can only contain english characters or numbers<br>";
		else if(in_array("Your password must be betwen 5 and 30 characters<br>", $error_array)) echo "Your password must be betwen 5 and 30 characters<br>"; ?>

		<input type="submit" name="register_button" value="Register">
	</form>
</body>
</html>