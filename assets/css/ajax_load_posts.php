<?php
include("../../config.php");
include("../classes/user.php");
include("../classes/Post.php");


$limit = 10 // number of posts to be loaded call
$posts = new Post($con, $_REQUEST['userLoggedIn']); // $_REQUERS переменные http запроса
$posts->loadPostsFriends();