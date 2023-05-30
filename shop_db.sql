-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 07:40 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(2, 'andreea', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(14, 1, 11, 'Savic Castron Delice- pentru Pisici', 14, 1, 'castron-1.png'),
(15, 1, 18, 'Ferplast Adapator Drinki pentru Hamsteri', 20, 1, 'apa-1.jpg'),
(16, 3, 20, 'Hrana pentru pesti', 140, 1, 'hrana-1.jpg'),
(17, 3, 13, 'Versele-Laga Prestige Hrană papagali 4 kg', 50, 2, 'versele-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `name`, `email`, `number`, `message`) VALUES
(3, 1, 'andreea', 'andreeabornea2507@gmail.com', '0770000000', 'Bine.');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(1, 1, 'Dragos', '0000000', 'dragospopescu74@yahoo.ro', 'cash on delivery', 'flat no. 17, Strada sibiului, Sibiu, , Romania - 1234', 'Briantos Adult Miel & orez (135 x 1) - Wolf of Wilderness Hrană uscată pentru câini (20 x 2) - Leonardo Plic Carne 85 g (9 x 10) - ', 265, '2023-05-16', 'completed'),
(3, 1, 'Dragos', '0000000', 'dragospopescu74@yahoo.ro', 'cash on delivery', '1, Strada sibiului, Sibiu, , Romania - 1234', 'Royal Canin Plic Caini Yorkshire 85 g (8 x 1) - Belcando Plic Miel/Cartofi/Merisoare- pentru Caini (15 x 1) - Coa Hranitor Interactiv Caini Green (200 x 1) - ', 223, '2023-05-23', 'pending'),
(4, 1, 'andreea', '0770000000', 'andreeabornea2507@gmail.com', 'cash on delivery', '46, Nicolae Iorga, Sibiu, , Romania - 00000', 'Penelope Ansamblu de joacă- pentru Pisici (335 x 1) - Trixie natura Căsuță suspendată pentru hrănire papagali (205 x 2) - ', 745, '2023-05-27', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` varchar(500) NOT NULL,
  `price` int(10) NOT NULL,
  `image_01` varchar(100) NOT NULL,
  `image_02` varchar(100) NOT NULL,
  `image_03` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `details`, `price`, `image_01`, `image_02`, `image_03`) VALUES
(1, 'Briantos Adult Miel & orez pentru Caini', 'Briantos este o hrană uscată completă și consistentă - cu miel ușor digerabil și orez pentru câini adulți cu nivel normal de activitate. Cu toți nutrienții, produsă în Germania.', 135, 'briantos-1.jpg', 'briantos-2.jpg', 'briantos-3.jpg'),
(2, 'Wolf of Wilderness Hrană uscată pentru câini', 'Hrana uscată Wolf of the Wilderness asigură un aport echilibrat de substanțe nutritive ajustat cerințelor nutriționale ale câinilor, conform dietei naturale a lupilor.', 20, 'wolf-1.jpg', 'wold-2.jpg', 'wolf-3.jpg'),
(3, 'Belcando Plic Miel/Cartofi/Merisoare- pentru Caini', 'Rețete excelente în porții individuale practice. Carnea suculentă îmbogățită cu ingrediente rafinate este preparată cu atenție în porții individuale.\r\nUleiul de șofrănel (Carthamus tinctorius) presat la rece furnizează acizi grași polinesaturați esențiali. Extrem de gustoasă și ușor digerabilă, BELCANDO Finest Selection este ideală pentru câinii sensibili sau pretențioși.', 15, 'belcando-1.jpg', 'belcando-2.jpg', 'belcando-3.jpg'),
(4, 'Royal Canin Plic Caini Yorkshire 85 g', 'Hrană umedă, special creată pentru câinii adulți din rasa Yorkshire Terrier, cu vârsta de peste 10 luni.\r\n\r\nAsigură o digestie optimă și o absorbție corectă a nutrimentelor, contribuind astfel la diminuarea cantității și mirosului materiilor fecale.', 8, 'yorkshire-1.jpg', 'yorkshire-2.jpg', 'yorkshire-3.jpg'),
(5, 'Coa Hranitor Interactiv Caini Green', 'Hranitor special conceput pentru a transforma ora mesei intr-un joc provocator.\r\n\r\nAccentul principal se bazeaza pe stimularea fizica si mentala a catelusilor, reducerea riscului de inecare cu hrana precum si a riscului de balonare in cazul cateilor “porcusori”.', 200, 'hranitor-1.jpg', 'hranitor-2.jpg', 'hranitor-3.jpg'),
(6, 'Dingo Colier Plastic Caini 25 cm', 'Colier pentru caini, pentru prevenirea agravarii ranilor prin scarpinare sau lingere.\r\nSe fixeaza usor pe gatul cainelui, astfel cainele nu va mai putea sa se scarpine sau sa isi linga ranile pe timpul tratamentului si vindecarii.\r\nFabricat din material plastic foarte usor, confortabil de purtat.', 60, 'colier-1.jpg', 'colier-2.jpg', 'colier-3.jpg'),
(7, 'Nutraline Pisici de Casa', 'Hrană completă pentru pisici Nutraline Cat Indoor Hrană completă pentru pisici adulte cu activitate redusă și vârsta peste un an.', 125, 'Nutraline-1.jpg', 'Nutraline-2.jpg', 'Nutraline-3.png'),
(8, 'Royal Canin Felin Pisici sub 1 an- 10kg', 'Creșterea este o etapă esențială în viața pisoiului dumneavoastră – este o perioadă de mari schimbări, descoperiri semnificative și noi experiențe.\r\n\r\nÎn această perioadă, este important să vă asigurați că pisoiul primește aportul optim de nutrienți pentru a-i susține creșterea și dezvoltarea sănătoasă.', 418, 'royal-1.jpg', 'royal-2.jpg', 'royal-3.jpg'),
(9, 'Leonardo Plic de Pisici 85 g', 'Hrana umeda cu carne suculenta imbogatita cu ingrediente rafinate, pregatita cu atentie in portii individuale.\r\n\r\nUleiul de somon furnizeaza acizi grasi polinesaturati.', 9, 'plic-1.jpg', 'plic-2.jpg', 'plic-3.jpg'),
(10, 'Leonardo Conserva Pasare pentru Pisici', 'Este o hrana umeda delicioasa pentru pisici, din ingrediente de calitate superioara.', 15, 'conversa-1.jpg', 'conserva-2.jpg', 'conserva-3.png'),
(11, 'Savic Castron Delice- pentru Pisici', 'Delice este un bol modern, premium, pentru mâncare sau apă, din plastic.', 14, 'castron-1.png', 'castron-2.png', 'castron-3.png'),
(12, 'Penelope Ansamblu de joacă- pentru Pisici', 'Ansamblu cu tunel şi multe locuri de întins şi dormit pe toate nivelurile, 5 stâlpi de sisal Ø 8 cm ideal pentru pisoiași, pisici de talie mare şi pisici senioare', 335, 'joaca-1.jpg', 'joaca-2.jpg', 'joaca-3.jpg'),
(13, 'Versele-Laga Prestige Hrană papagali 4 kg', 'Versele-Laga, numele reprezentativ pentru o hrană de înaltă calitate pentru păsări. Amestecul clasic de semințe asigură o dietă echilibrată cu toate vitaminele esențiale', 50, 'versele-1.jpg', 'versele-2.jpg', 'versele-3.jpg'),
(14, 'Prestige Loro Parque Hrană papagali africani 1 kg', 'African Parrot Loro Parque Mix este un amestec de semințe îmbogățit cu extra nutrienți, special concepută pentru nevoile nutriționale ale papagalilor africani.', 35, 'prestige-1.jpg', 'prestige-2.jpg', 'prestige-3.jpg'),
(15, 'Trixie natura Căsuță suspendată pentru hrănire papagali', 'Îngrijirea păsărilor sălbatice ajunge să fie tot mai importantă pe măsură ce oferta de hrană devine din ce în ce mai puțină.', 205, 'colivie-1.jpg', 'colivie-2.jpg', 'colivie-3.jpg'),
(16, 'Custi pentru hamsteri', 'Cuşcă pentru hamsteri, complet utilată.\r\nInclude: căsuţă plastic, roată plastic, hrănitor plastic, adapător plastic, platformă scară din grilaj metalic.', 120, 'custi-1.jpg', 'custi-2.jpg', 'custi-3.jpg'),
(17, 'Recompense pentru hamsteri', 'Jucării pentru ros, fabricate din amidon de porumb nemodificat genetic.', 15, 'bete-1.jpg', 'bete-2.jpg', 'bete-3.jpg'),
(18, 'Ferplast Adapator Drinki pentru Hamsteri', 'Adăpător pentru rozătoare.\r\nPrevăzut cu suport din plastic care permite montarea adăpătorului pe gratiile cuştii .', 20, 'apa-1.jpg', 'apa-2.jpg', 'apa-3.jpg'),
(19, 'Acvariu tip bol Tetra Cascade pentru pesti', 'Acvariu cu design modern, elegant, cu efect calmant și relaxant, ideal pentru casă și birou.', 290, 'acvariu-1.jpg', 'acvariu-2.jpg', 'acvariu-3.jpg'),
(20, 'Hrana pentru pesti', 'Hrană pentru toate anotimpurile, pentru crapi koi și pentru alți pești de iaz. Hrană completă cu raport corect de proteine și grăsimi', 140, 'hrana-1.jpg', 'hrana-2.jpg', 'hrana-3.jpg'),
(21, 'Plante acvariu pesti', 'Planta acvatica facuta din fibre naturale de culoare verde.', 11, 'plante-q.jpg', 'plante-2.jpg', 'plante-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Dragos', 'dragospopescu74@yahoo.ro', '21bb6b0ee070b02dc6caf569cd19b6118e72c8b2'),
(2, 'andreea', 'andreeabornea2507@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220'),
(3, 'Elena', 'elena@yahoo.ro', '8cb2237d0679ca88db6464eac60da96345513964');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(2, 1, 2, 'Wolf of Wilderness Hrană uscată pentru câini', 20, 'wolf-1.jpg'),
(3, 1, 1, 'Briantos Adult Miel & orez pentru Caini', 135, 'briantos-1.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pid` (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
