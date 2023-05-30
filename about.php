<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};
?>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Despre noi</title>
   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <!--conectare cu fisierul CSS-->
   <link rel="stylesheet" href="css/style.css">
</head>
<body>
<?php include 'components/user_header.php'; ?>
<section class="about">
   <div class="row">
      <div class="image">
         <img src="images/imagine.jpg" alt="">
      </div>
      <div class="content">
         <h3>De ce sa ne alegi pe noi?</h3>
         <p>All for Pet Shop are o gama larga de produse, inclusiv cele mai recente inovatii si branduri populare, permitand clientilor sa-si comande produsele de la domiciliu sau de oriunde se afla, la orice ora din zi si din noapte</p>
         <a href="contact.php" class="btn">Contacteaza-ne!</a>
      </div>
   </div>
</section>
<?php include 'components/footer.php'; ?>
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>