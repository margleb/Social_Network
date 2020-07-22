<?php
include("includes/header.php");

if(isset($_POST['cancel'])) {
    header("Location: settings.php");
}

if(isset($_POST['close_account'])) {
    $closed_query = mysqli_query($con, "UPDATE users SET user_closed='yes' WHERE username='$userLoggedIn'");
    session_destroy();
    header("Location: register.php");
}

?>

<div class="main_column column">
    <h4>Close Account</h4>
    Are your sure you want to close your account?<br><br>
    Closing you account wil hide your proifile and all your activity from other users.<br><br>
    You can re-open your account at any time by simply loggin in.<br><br>

    <form action="close_account.php" method="POST">
        <input type="submit" name="close_account" id="close_account" value="YES! Close It" class="danger settings_submit">
        <input type="submit" name="cancel" id="update_details" value="No way!" class="info settings_submit">
    </form>
</div>
