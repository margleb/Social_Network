<?php require 'config/config.php'; 
if(isset($_SESSION['username'])) {
	$userLoggedIn = $_SESSION['username'];
	$user_detail_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
	$user = mysqli_fetch_array($user_detail_query);
} else {
	header("Location: register.php");
} ?>

<!DOCTYPE html>
<html>
<head>
	<title>Wekcome to Swirlfeed</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>

<div class="top_bar">
	<div class="logo">
		<a href="index.php">Swirlfeed!</a>
	</div>
	<nav>
		<a href="#"><?php echo $user['first_name']; ?></i></a>
		<a href="#"><i class="fa fa-home fa-lg"></i></a>
		<a href="#"><i class="fa fa-envelope fa-lg"></i></a>
		<a href="#"><i class="fa fa-bell-o fa-lg"></i></a>
		<a href="#"><i class="fa fa-users fa-lg"></i></a>
		<a href="#"><i class="fa fa-cog fa-lg"></i></a>
	</nav>
</div>