<?php
include 'components/connect.php';
session_start();

$user_id = '';
if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}

function sanitizeInput($input) {
   return trim(filter_var($input, FILTER_SANITIZE_STRING));
}

if(isset($_POST['send'])){
   $name = sanitizeInput($_POST['name']);
   $email = sanitizeInput($_POST['email']);
   $number = sanitizeInput($_POST['number']);
   $msg = sanitizeInput($_POST['msg']);

   $select_message = $conn->prepare("SELECT * FROM `messages` WHERE name = ? AND email = ? AND number = ? AND message = ?");
   $select_message->execute([$name, $email, $number, $msg]);

   if($select_message->rowCount() > 0){
      $message[] = 'Mesaj deja trimis!';
   }else{
      $insert_message = $conn->prepare("INSERT INTO `messages`(user_id, name, email, number, message) VALUES(?,?,?,?,?)");
      $insert_message->execute([$user_id, $name, $email, $number, $msg]);
      $message[] = 'Mesajul a fost trimis cu succes!';
   }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Contact</title>
   
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="contact">
   <form action="" method="post">
      <h3>Contactează-ne!</h3>
      <input type="text" name="name" placeholder="Nume" required maxlength="20" class="box">
      <input type="email" name="email" placeholder="Email" required maxlength="50" class="box">
      <input type="number" name="number" min="0" max="9999999999" placeholder="Număr de telefon" required onkeypress="if(this.value.length == 10) return false;" class="box">
      <textarea name="msg" class="box" placeholder="Scrie un mesaj" cols="30" rows="10"></textarea>
      <input type="submit" value="Trimite un mesaj" name="send" class="btn">
   </form>

</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>
