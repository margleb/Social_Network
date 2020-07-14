<?php include("includes/header.php");?>
<?php include("includes/classes/User.php");?>
<?php include("includes/classes/Post.php");?>


<?php
if(isset($_POST['post'])) {
	$post = new Post($con, $userLoggedIn);
	$post->submitPost($_POST['post_text'], 'none');
	header('Location: index.php'); // позвляет избежать повторной отправки через форму при обновлении
}
?>


<div class="user_details column">
			<a href="<?php echo $userLoggedIn; ?>"><img src="<?php echo $user['profile_pic']; ?>"></a>
	<div class="user_details_left_right">
		<a href="<?php echo $userLoggedIn; ?>"><?php echo $user['first_name'] . " " . $user['last_name']; ?></a>
		<br>
		<?php echo "Posts: " . $user['num_post'] . "<br>"; ?>
		<?php echo "Likes: " . $user['num_likes']; ?>
	</div>
</div>
	<div class="main_column column">
		<form class="post_form" action="index.php" method="POST">
			<textarea name="post_text" placeholder="Got something to say?"></textarea>
			<input type="submit" name="post" id="post_button" value="Post"><br>
			<hr>
		</form>
		<div class="posts_area"></div>
		<img id="loading" src="assets/images/icons/loading.gif">
	</div>
		<script>
			var userLoggedIn = '<?php echo $userLoggedIn; ?>';
			$(document).ready(function() {
				$('#loading').show();
				// Original ajax request fot loading first posts
				$.ajax({
					url: "includes/handlers/ajax_load_posts.php",
					type: "POST",
					data: "page=1&userLoggedIn=" + userLoggedIn,
					cashe:false,
					success: function(data) {
						$('#loading').hide();
						$('.posts_area').html(data);
					}
				});
				$(window).scroll(function() {
					var height = $('.posts_area').height(); // Div containing posts
					var scroll_top = $(this).scrollTop();
					var page = $('.posts_area').find('.nextPage').val();
					var noMorePosts = $('.posts_area').find('.noMorePosts').val();
					if((document.body.scrollHeight == document.body.scrollTop + window.innerHeight) && noMorePosts == 'false') {
						$('#loading').show();
							var ajaxReq = $.ajax({
								url: "includes/handlers/ajax_load_posts.php",
								type: "POST",
								data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
								cashe:false,
								success: function(response) {

									$('.posts_area').find('.nextPage').remove(); // Remove current .nextpage;
									$('.posts_area').find('.noMorePosts').remove(); // Remove current .nextpage;

									$('#loading').hide();
									$('.posts_area').append(response);
								}
							});	
					} // end if
					 return false;
				});
			});

		</script>
</div>
</body>
</html>