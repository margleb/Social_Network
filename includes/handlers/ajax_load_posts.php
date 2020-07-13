<?php
include("../../config/config.php");
include("../classes/user.php");
include("../classes/Post.php");
include("../classes/Dump.php");

$limit = 10; // number of posts to be loaded call
$posts = new Post($con, $_REQUEST['userLoggedIn']);
$posts->loadPostsFriends($_REQUEST, $limit);