<?php 
require 'config/config.php'; 
include("includes/classes/User.php");
include("includes/classes/Message.php");
include("includes/classes/Post.php");
include("includes/classes/Notification.php");

if(isset($_SESSION['username'])) {
	$userLoggedIn = $_SESSION['username'];
	$user_detail_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
	$user = mysqli_fetch_array($user_detail_query);
} else {
	header("Location: register.php");
} ?>
<html>
<head>
	<title>Welcome to Swirlfeed</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.js"></script>
	<script src="assets/js/bootbox.min.js"></script>
	<script src="assets/js/demo.js"></script>
	<script src="assets/js/jquery.Jcrop.js"></script>
	<script src="assets/js/jcrop_bits.js"></script>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="assets/css/jquery.Jcrop.css">
</head>
<body>

<div class="top_bar">
	<div class="logo">
		<a href="index.php">Swirlfeed!</a>
	</div>

    <div class="search">
        <form action="search.php" method="GET" name="search_form">
            <input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn; ?>')" name="q" placeholder="Search..." autocomplete="off" id="search_text_input">
            <div class="button_holder">
                <img src="assets/images/icons/magnifying_glass.png" alt="">
            </div>
        </form>
        <div class="search_results"></div>
        <div class="search_results_footer_empty"></div>
    </div>

	<nav>
		<?php 
			//Unread messages
			$messages = new Message($con, $userLoggedIn);
			$num_messages = $messages->getUnreadNumber();

			//Unread notifications
			$notifications = new Notification($con, $userLoggedIn);
			$num_notifications = $notifications->getUnreadNumber();

            //Friend requests
            $user_obj = new User($con, $userLoggedIn);
            $num_requests = $user_obj->getNumberOfFriendRequests();
            //Get full friends array by username
            $friends_array = $user_obj->getFrendArrayByUsername();
		?>
		<a href="<?php echo $userLoggedIn ?>"><?php echo $user['first_name']; ?></i></a>
		<a href="#"><i class="fa fa-home fa-lg"></i></a>
		<a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn ?>', 'message');">
			<i class="fa fa-envelope fa-lg"></i>
			<?php
			if($num_messages > 0)
			echo '<span class="notification_badge" id="unread_message">'.$num_messages.'</span>';
			?>
		</a>
		<a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn ?>', 'notification');">
			<i class="fa fa-bell-o fa-lg"></i>
			<?php
				if($num_notifications > 0)
				echo '<span class="notification_badge" id="unread_notification">'.$num_notifications.'</span>';
			?>
		</a>
		<a href="request.php"><i class="fa fa-users fa-lg"></i>
            <?php
            if($num_requests > 0)
                echo '<span class="notification_badge" id="unread_requests">'.$num_requests.'</span>';
            ?>
        </a>
		<a href="#"><i class="fa fa-cog fa-lg"></i></a>
		<a href="includes/handlers/logout.php"><i class="fa fa-sign-out fa-lg"></i></a>
	</nav>
	<div class="dropdown_data_window" style="height:0px; border:none;"></div>
	<input type="hidden" id="dropdown_data_type" value="">
</div>


<script>
			var userLoggedIn = '<?php echo $userLoggedIn; ?>';
			$(document).ready(function() {
				// при прокрутки 
				$('.dropdown_data_window').scroll(function() {
					var inner_height = $('.dropdown_data_window').innerHeight(); // Высота контейнера
					var scroll_top = $('.dropdown_data_window').scrollTop(); // Значение отступа прокрутки сверху
					var page = $('.dropdown_data_window').find('.nextPageDropdownData').val(); // значение скрытого поля input следующей страницы
					var noMoreData = $('.dropdown_data_window').find('.noMoreDropdownData').val();
					if((scroll_top + inner_height >= $('.dropdown_data_window')[0].scrollHeight) && noMoreData == 'false') {
						var pageName; // Holds name of page to send ajax request to
						var type = $('#dropdown_data_type').val();

						if(type == 'notification') 
							pageName = 'ajax_load_notifications.php';
						else if(type == 'message')
							pageName = "ajax_load_messages.php";

							var ajaxReq = $.ajax({
								url: "includes/handlers/" + pageName,
								type: "POST",
								data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
								cashe:false,
								success: function(response) {

									$('.dropdown_data_window').find('.nextPageDropdownData').remove(); // Remove current .nextpage;
									$('.dropdown_data_window').find('.noMoreDropdownData').remove(); // Remove current .nextpage;
									$('.dropdown_data_window').append(response);
								}
							});	
					} // end if
					 return false;
				});
			});

	</script>

<div class="wrapper">