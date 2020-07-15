<?php
include("../../config/config.php");
include("../classes/user.php");
include("../classes/Post.php");

$limit = 10; // number of posts to be loaded call
$posts = new Post($con, $_REQUEST['userLoggedIn']);
$posts->loadProfilePosts($_REQUEST, $limit);