<?php
include 'components/connect.php';
session_start();
if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};


function validateInput($input) {
   return trim($input);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Comenzi</title>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   <link rel="stylesheet" href="css/style.css">
</head>
<body>

<?php include 'components/user_header.php'; ?>
<section class="orders">
   <h1 class="heading">Comenzi</h1>
   <div class="box-container">
   <?php
      if(empty(validateInput($user_id))){
         echo '<p class="empty">Vă rugăm să vă autentificați pentru a vedea produsele!</p>';
      }else{
         $select_orders = $conn->prepare("SELECT * FROM `orders` WHERE user_id = ?");
         $select_orders->execute([validateInput($user_id)]);
         if($select_orders->rowCount() > 0){
            while($fetch_orders = $select_orders->fetch(PDO::FETCH_ASSOC)){
   ?>
   <div class="box">
      <p>Data: <span><?= validateInput($fetch_orders['placed_on']); ?></span></p>
      <p>Nume: <span><?= validateInput($fetch_orders['name']); ?></span></p>
      <p>Email: <span><?= validateInput($fetch_orders['email']); ?></span></p>
      <p>Telefon: <span><?= validateInput($fetch_orders['number']); ?></span></p>
      <p>Adresa: <span><?= validateInput($fetch_orders['address']); ?></span></p>
      <p>Metoda de plată: <span><?= validateInput($fetch_orders['method']); ?></span></p>
      <p>Comanda ta: <span><?= validateInput($fetch_orders['total_products']); ?></span></p>
      <p>Pretul total: <span>RON <?= validateInput($fetch_orders['total_price']); ?></span></p>
      <p>Status plata: <span style="color:<?php if(validateInput($fetch_orders['payment_status']) == 'pending'){ echo 'red'; }else{ echo 'green'; }; ?>"><?= validateInput($fetch_orders['payment_status']); ?></span></p>
   </div>
   <?php
      }
      }else{
         echo '<p class="empty">Nu este plasată nicio comandă!</p>';
      }
      }
   ?>
   </div>
</section>
<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>
</body>
</html>
