-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2022 at 02:08 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--
CREATE DATABASE IF NOT EXISTS `e_commerce` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `e_commerce`;

-- --------------------------------------------------------

--
-- Table structure for table `ban_date`
--

CREATE TABLE `ban_date` (
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ban_date`
--

INSERT INTO `ban_date` (`from_date`, `to_date`, `fk_user`, `id`) VALUES
('2022-08-09', '2022-08-13', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `fk_user`, `fk_order`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `order_date` date DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_payment` int(11) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `order_date`, `total_amount`, `fk_user`, `fk_payment`, `fk_address`, `fk_order`) VALUES
(1, '2022-02-15', 500, 2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `quantity`, `fk_product`) VALUES
(1, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `type`) VALUES
(1, 'Paypal');

-- --------------------------------------------------------

--
-- Table structure for table `producer`
--

CREATE TABLE `producer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `producer`
--

INSERT INTO `producer` (`id`, `name`, `address`, `email`, `tel`, `latitude`, `longitude`) VALUES
(1, 'Technology GmbH', 'Technical Street 30., Vienna', 'tech@gmail.com', 623559853, '48.210033', '16.363449'),
(2, 'BestSecret', 'Style street 20., New York', 'bestsecret@hotmail.com', 639982123, '40.730610', '-73.935242'),
(3, 'DreamKitchen Corporation', 'Wood Street 40., Barcelona', 'dreamkitchen@gmail.com', 2147483647, '41.390205', '2.154007'),
(4, 'Accessories GmbH', 'Peaky Street 20., Belgrade', 'access@gmail.com', 2147483647, '44.787197', '20.457273');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  `describtion` text DEFAULT NULL,
  `discount` float(3,2) DEFAULT NULL,
  `display` tinyint(1) NOT NULL,
  `fk_producer` int(11) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `describtion`, `discount`, `display`, `fk_producer`, `picture`, `categorie`, `stock`) VALUES
(1, 'S.Oliver Women\'s Earrings Rhodium-Plated 925 Sterling Silver with Gold with White Zirconia 40 mm', '150.00', 'Elegant women\'s earrings in a drop design from the brand s.Oliver. Length: approx. 40 mm. Width: approx. 11 mm.\r\nEarrings made of shiny 925 sterling silver and decorated with 88 sparkling zirconia (synthetic). Pure white\r\nA high-quality rhodium coating protects this piece of jewellery from tarnishing and promises to stay beautiful for a long time.\r\nA great gift idea for your loved one, e.g. for Christmas, birthdays, anniversaries or Valentine\'s Day\r\nThe real jewellery, with its own handwriting and clear lines, is the ideal complement to everyday fashion: many possible combinations, stylish and genuine. s.Oliver Jewel combines high wearing comfort with exceptional quality and attention to detail.\r\n', 1.00, 1, 4, 'ac1.jpg', 'Accessories', 20),
(2, 'Jocose Moose Women\'s Handbag, Shopper, Large Elegant Bag for Office, School, Shopping or as a Gift, ', '35.90', 'High-quality material: This single handbag for women is made of high-quality and waterproof faux leather.\r\nDimensions: Women’s handbag: 34 x 15 x 29 cm. Purse: 19 x 9.5 x 1 cm.\r\nLarge capacity: The handbag has 6 pockets (2 main compartments, 2 inner zip pockets, 1 mobile phone pocket and 1 certificate compartment). The purse has many compartments (11 card slots, 1 ID pocket and 1 long zip pocket for cash and mobile phone).\r\nPractical use: You can use it as a large tote bag or shoulder bag to carry your belongings when you go out and you can use the purse to carry money and cards.\r\nSimple design: These handbags for women were designed by a famous designer. The simple, fashionable and lightweight design makes the handbag extremely popular.', 3.00, 1, 4, 'ac2.jpg', 'Accessories', 50),
(3, 'FUJEAK Men\'s Walking Shoes', '25.60', 'FUJEAK Men\'s Walking Shoes, Trainers, Gym, Sports Shoes, Running, Tennis Shoes, Leisure, Road Running Shoes, Fashionable, Lightweight, Breathable, Slip-On Shoes\r\n\r\nSize chart:\r\nPlease refer to the size chart before purchasing.\r\nUK 4 = foot length 241 mm - 245 mm.\r\nUK 5 = foot length 246 mm - 250 mm.\r\nUK 6 = foot length 251 mm - 255 mm.\r\nUK 7 = foot length 256 mm - 260 mm.\r\nUK 8 = foot length 261 - 265 mm.\r\nUK 9 = foot length 266 mm - 270 mm.\r\nUK 10 = foot length 271 - 275 mm.\r\nUK 11 = foot length 276 mm - 280 mm.\r\n\r\nFUJEAK men\'s walking shoes features:\r\nBreathable, sweat-absorbent, durable, odourless, durable and comfortable. Opening type: Lace-up. Soft cloud foam insole + non-slip outsole for good wearing experience.\r\n', NULL, 1, 4, 'ac3.jpg', 'Accessories', 20),
(4, '14k Tricolour Textured and Shiny Love Knot Stud Earrings 10mm', '0.00', 'Prices for items sold by Amazon include VAT. Depending on your delivery address, VAT may vary at Checkout. For other items, please see details.\r\nThese earrings are made of real 14K gold and stamped with the corresponding 14K metal stamp\r\nThese stud earrings have a highly polished surface that gives the earrings a shiny look.\r\nThe earrings have a sliding clasp and are easy to wear.\r\nThese earrings are perfect for everyday use.\r\nEarrings weight: 1.6 g', NULL, 1, 4, 'ac4.jpg', 'Accessories', 25),
(5, 'LAVUMO Women\'s Silver Rose Gold Chain Necklace Women\'s Jewellery Gifts for Women Girlfriend Wife Mum', '0.00', 'Sterling silver women\'s necklace: both pendant and chain are made of 925 sterling silver. Outer coating is white gold plated, rose gold plated or 14k gold plated. It is hypoallergenic, safe for the skin.\r\nEternity halo pendant necklace: the halo pendant is made of a large gemstone that is made of small stones, simple and atmospheric state. The eternity design makes the pendant extraordinarily unique.\r\nSmall gifts for women: beautiful gifts for women for birthday, Christmas, Valentine\'s Day, Mother\'s Day, for your wife, girlfriend, boyfriend, mum.\r\nCubic Zirconia synthetic gemstone: zrkonia is a synthetic gemstone, an excellent alternative to diamonds and like diamonds. We choose the excellent cubic zirconia. It will become beautiful and affordable.', NULL, 1, 4, 'ac5.jpg', 'Accessories', 80),
(6, 'Ushiny Wedding Jewellery Set Silver Tone Bridal Crystal Necklace Earrings Set for Women Girls', '0.00', 'Wedding jewelry sets are made of high quality materials, bright faux pearl and lead free alloy, clear crystal, handmade by skilled jewelry workers.\r\nCrystal Bridal Necklace Circumference 51cm Suitable for most women and girls. It will give you a charming look and you will receive more compliments.\r\nCrystal bridal jewelry sets at affordable prices with fine jewelry look. Easy to match any wedding dress. Each wedding jewellery set has a fabulous design and solid construction. Classic and elegant jewellery always keeps up with fashion, making it a timeless accessory for any jewellery collection.\r\nGreat gift for your best friend, bride, bridesmaid, ladies, mother, daughter, wife, friends and girlfriend for wedding, prom, photo props, holiday, beach or other anniversary celebrations.', NULL, 1, 4, 'ac6.jpg', 'Accessories', 50),
(7, 'BOSS RN 3P CO Men’s T-Shirts Made from Cotton', '15.00', 'High-quality workmanship,\r\nCollar Style: Crew Neck,\r\nShort Sleeve,\r\nClosure: No closure.\r\n100% cotton,\r\nRegular fit,\r\nModel: 50475284.', NULL, 1, 2, 'cl1.jpg', 'Clothing', 150),
(8, 'Exchic Women\'s Dress, Round Neck, A-Line, Short Sleeve, Casual Midi Dress', '150.00', 'A-line, high waist, short sleeve, plain, very comfortable to wear.\r\nWomen\'s casual midi dress, stretchy, soft, breathable, comfortable to wear.\r\n95% Viskose, 5% Elasthan, A-Line\r\nIdeal for combining with high heels, necklace or ankle boots, jacket, knitted jacket, casual jewellery.\r\nOccasions: Summer holidays, casual, office, beach, date, party, daily life.\r\nPlease check our size information in the product description before purchasing.', NULL, 1, 2, 'cl3.jpg', 'Clothing', 40),
(9, 'Essentials men\'s fleece sweatshirt', '16.80', 'This classic everyday sweatshirt features long sleeves, a kangaroo pocket, a drawstring hood and wide ribbed cuffs at the hem and sleeves to lock in warmth.\r\nMake your everyday life nicer: We optimise every detail to ensure quality, fit and comfort.\r\nLangarm\r\nClosure: Pull-on\r\n52% Cotton, 48% Polyester\r\nFleece Pullover Hooded Sweatshirt\r\nModel: F17AE50001\r\nOur model is 1.88 m tall and wearing a size M.', NULL, 1, 2, 'cl4.jpg', 'Clothing', 150),
(10, 'Exchic Women\'s Dress, Round Neck, A-Line, Short Sleeve, Casual Midi Dress', '150.00', 'A-line, high waist, short sleeve, plain, very comfortable to wear.\r\nWomen\'s casual midi dress, stretchy, soft, breathable, comfortable to wear.\r\n95% Viskose, 5% Elasthan, A-Line\r\nIdeal for combining with high heels, necklace or ankle boots, jacket, knitted jacket, casual jewellery.\r\nOccasions: Summer holidays, casual, office, beach, date, party, daily life.\r\nPlease check our size information in the product description before purchasing.', NULL, 1, 2, 'cl3.jpg', 'Clothing', 40),
(11, 'Essentials men\'s fleece sweatshirt', '16.80', 'This classic everyday sweatshirt features long sleeves, a kangaroo pocket, a drawstring hood and wide ribbed cuffs at the hem and sleeves to lock in warmth.\r\nMake your everyday life nicer: We optimise every detail to ensure quality, fit and comfort.\r\nLangarm\r\nClosure: Pull-on\r\n52% Cotton, 48% Polyester\r\nFleece Pullover Hooded Sweatshirt\r\nModel: F17AE50001\r\nOur model is 1.88 m tall and wearing a size M.', NULL, 1, 2, 'cl4.jpg', 'Clothing', 150),
(12, 'BOSS RN 3P CO Men’s T-Shirts Made from Cotton Blue', '15.00', 'High-quality workmanship,\r\nCollar Style: Crew Neck,\r\nShort Sleeve,\r\nClosure: No closure.\r\n100% cotton,\r\nRegular fit,\r\nModel: 50475284.', NULL, 1, 2, 'cl2.jpg', 'Clothing', 150),
(13, 'Essentials Kids\' Disney Star Wars Marvel Snug-Fit Cotton Pyjama Set, Nightmare Santa Jack, 4 Years', '25.40', 'Get ready for cosy nights with these soft and comfortable pyjamas\r\nEveryday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort\r\nLong Sleeve\r\n100% cotton\r\nKids\' Disney Star Wars Marvel Snug-Fit Cotton Pyjamas\r\nModel: UAE90062/63FL18\r\nPlease note that the size label on the inner neckline in your garment is the brand/manufacturer size. Please use the size chart on the product details page to find the appropriate size.\r\n', NULL, 1, 2, 'cl5.jpg', 'Clothing', 12),
(14, 'Essentials Kids\' Pyjama Set', '15.80', 'Get ready for cosy nights with these soft and comfortable pyjamas\r\nEveryday made better: we listen to customer feedback and fine-tune every detail to ensure quality, fit, and comfort\r\nLong Sleeve\r\n100% cotton\r\nKids\' Disney Star Wars Marvel Snug-Fit Cotton Pyjamas\r\nModel: UAE90062/63FL18\r\nPlease note that the size label on the inner neckline in your garment is the brand/manufacturer size. Please use the size chart on the product details page to find the appropriate size.\r\n', NULL, 1, 2, 'cl6.jpg', 'Clothing', 25),
(15, 'Krups HZ656815 Steffen Henssler Special Edition Hand Blender (1000 Watt, Speed Settings: 20, Includi', '60.00', 'Exclusive Powelix technology: Incredible suppleness, creamy texture and effortless mixing even the toughest ingredients.\r\nPowerful: 1000 W motor for optimal mixing performance, easy to operate: Intuitive controller with 20 variable speeds for constant mixing.\r\nEnhanced control: Soft, non-slip handle for added comfort and control even with wet hands.\r\n800 ml cup: For added convenience. 500 ml shredder: For easy cutting of a range of ingredients. Whisk: For effortless punching.\r\nBox contents: Krups HZ656815 Steffen Henssler special edition hand blender with removable foot, cup, crusher and whisk.', NULL, 1, 3, 'k1.jpg', 'Kitchen', 20),
(16, 'STONELINE Ceramic Cookware Sets', '0.00', 'Cook and fry with little fat and oil: Stoneline ceramic cookware set allows healthy, vitamin-preserving cooking and frying of meat, fish and vegetables. The coating is equipped with real stone particles. This allows the pot set to cook just like on hot natural stone.\r\nBox contents: saucepan 18 cm and (volume 1.8 l), glass lid (18 cm), cooking pot 20 cm (volume 2.6 l), glass lid (20 cm), saucepan 24 cm (volume 4.2 l), glass lid (24 cm), material: aluminium, coating: ceramic, item number: 18505 Stoneline\r\nSuitable for all types of cookers: suitable for induction, gas, electric and vitro-ceramic hobs. Extra strong, energy saving, warp free base. The base allows optimal heat distribution. Thanks to the coating, food does not burn in the cookware. Oven safe up to 180 °C, suitable for induction hobs with stay cool handles. The set is also ideal for camping or as a caravan accessory or motorhome accessory.\r\nThe saucepans are coated with the scratch-resistant Stoneline ceramic non-stick coating. Thanks to the extremely hard, durable ceramic coating with lotus pearling effect, you will have even more joy and cooking pleasure when preparing your food.\r\nEasy to clean: the easy-clean effect allows the pot set to be cleaned by simply wiping with a wet cloth, of course, the cooking pot set is also dishwasher safe. For long-lasting enjoyment with your Stoneline pan and pot, we recommend cleaning by hand.', NULL, 1, 3, 'k2.jpg', 'Kitchen', 23),
(17, 'Telicano Kitchen Utensil Set Stainless Steel [6 Pieces] Wooden Handle Kitchen Accessories Kitchen Ut', '18.90', 'You can touch your cooking accessories and burn yourself on the hot metal. The wooden handle shields any heat, so you can easily access.\r\nPerfect for kitchen - The modern design of the kitchen utensils is a real eye-catcher in any kitchen.\r\n✅ All cooling products use materials that discolour after a few applications. While we rely on robust materials that ensure that your cookware set is particularly heat-resistant and will still be your faithful companion even after years.\r\nNo more searching for the right cutlery. Our kitchen set has your right helper for every dish.\r\nWhat is correctly applied to the wall? Our customers often hear when asked by friends, why preparing such delicious dishes looks so easy. - Now!', NULL, 1, 3, 'k3.jpg', 'Kitchen', 50),
(18, 'CHwares Digital Kitchen Scales, USB Charging, 3 kg /0.1 g Mini Food Scales, Electric Kitchen Scales,', '26.80', 'Charging station with built-in lithium battery. High precision: Equipped with a high-precision sensor system to deliver instant and accurate results from 0.1 g to 1000 g. Ideal for measuring ingredients - water, milk, foodstuffs. Easy to clean and use - ideal for homes and kitchens.\r\nMultifunctional: With instant and automatic tare function for convenient measuring. Fast and convenient conversion of measurement results at any time between grams, ounces, pounds, millilitres, kilograms, centilitres at the touch of a button.\r\nLarge weight range: These digital kitchen scales weigh between 0.1 g and 3000 g and are suitable for a variety of items.\r\nPortable design and backlight indicator: Minimalist and elegant design makes these electronic food scales very stylish. Features a large, clear LCD display with white backlight for a clear, accurate display.\r\nEnergy-saving: USB rechargeable. Includes low battery indicator and power off function after 70 seconds of inactivity, which helps to preserve battery power and maintain efficiency. One time charge lasts for one or two months.', NULL, 1, 3, 'k4.jpg', 'Kitchen', 60),
(19, '5 Tier with 2 Storage Cabinets Metal Kitchen Baker\'s Rack, Microwave Storage Rack Oven Stand with Wi', '60.50', 'Beautiful look – the top of the shelves is made of high-quality fibreboard, it is robust, scratch-resistant, water-repellent and colourfast.\r\nStorage plate is made of 18 mm E1 graduated MDF fibreboard and frame with high-quality steel.\r\nDimensions: 80 x 30 x 155 cm (W x D x H). Weight: 13.5 kg, max. Load capacity per shelf: 8 kg.\r\nVersatile, easy to clean, easy to assemble - perfect for hallway, living room, bedroom. Each part is numbered as in the enclosed instructions (English language not guaranteed) and it is easy to assemble\r\nBakers or measuring jugs can be placed neatly and easily accessible on the shelf.', NULL, 1, 3, 'k5.jpg', 'Kitchen', 60),
(20, 'Apple Watch Series 7 GPS + Cellular, 41 mm Edelstahlgehäuse Gold, Sportarmband Abyssblau - Regular', '300.00', 'Stay connected to your family and friend through calls, messages and e-mails even if you don\'t have your iPhone with you.\r\nStream music, podcasts and audio books on the go and leave your iPhone at home\r\nSet up an Apple Watch for each family member and manage it directly from your iPhone with the family configuration.\r\nThe Always-On Retina display has an almost 20% larger display area than the Series 6, so you can see everything better and operate it easier.\r\nThe most shatterproof front glass an Apple Watch ever had, IP6X dustproof and floatproof.\r\nMeasure the oxygen content in your blood with a powerful sensor and an app\r\nMake an ECG. Anytime, anywhere.', NULL, 1, 1, 't1.jpg', 'Tech', 20),
(21, 'Sennheiser HD 350BT Wireless Foldable Headphones', '180.00', 'Great wireless sound with deep, dynamic bass and support demanding codecs such as AAC and AptX low latency\r\n30 hours battery life.\r\nSupports the Sennheiser Smart Control app including equalizer, podcast mode and firmware updates.\r\nIntuitive controls including voice assistant button for Siri and Google Assistant.\r\nFast charging via USB-C and current Bluetooth 5. 0 wireless technology for hassle-free, reliable connections.\r\n', NULL, 1, 1, 't2.jpg', 'Tech', 150),
(22, 'Hisense 43A6GG 108 cm (43 inch) TV, 4K UHD, Smart TV, HDR, Dolby Vision, Triple Tuner DVB-C/S/ S2/ T', '450.00', '4K UHD - offers four times higher resolution than FHD TVs. Watch your favourite shows, immerse yourself in the latest movies or enjoy every moment of the hottest games.\r\nSize with stand (W x H x D) in cm 96.3 × 61.4 × 19.6; size without base (W x H x D) in cm 96.3 × 56 × 7.4\r\nDolby Vision - Inspired by cinema technology, Dolby Vision HDR technology provides amazing brightness and contrast depth that is 40 times brighter and 10 times darker than standard images.\r\nDTS Virtual X - Enjoy an impressive sound experience without the need for high speakers, because the bass perception puts you in the middle of the action.\r\nVIDAA U5 - A simple, intelligent and intuitive operating system that simplifies access to rich content and apps (Youtube, Netflix and Prime Video, etc.) and makes your TV experience more fun.\r\nAlexa Built-in - Keep your TV in your voice. Ask Alexa to play music, listen to the messages, check the weather, control your smart home and much more.\r\nSport mode - When a sports signal is detected, the device switches to sports mode to recreate an impressive live experience in the stadium, from picture to sound.', NULL, 1, 1, 't3.jpg', 'Tech', 20),
(23, 'VR Glasses, Virtual Reality Glasses, Compatible with iPhone and Android [3D glasses] - Experience ga', '250.00', '✅ Perfect gift for children and adults. Premium gift for Father\'s Day, Birthday, Easter, Christmas, Black Friday, Cyber Monday Sale. VR glasses for children. Compatible with smartphones and other mobile devices with a 4 - 6.3 inches screen for a unique virtual 360 degree experience.\r\n✅ VR smartphone compatibility: Smartphones with a gyro sensor (almost all models) and with a 4 - 6.3 inches screen. For example: The Bnext VR glasses are compatible with models X, XR, XS, 8, 8 plus, 9, 9 plus, 10, 7, 7 plus, 6, 6s, 6s plus, 6 plus, 6, 5, 5 plus, 5c, 5s, SE, etc. Also compatible with Samsung Android Galaxy s8, s7, j3, s7 edge, s6, s6 edge, note5, a8+, note 3, note 4, note 5, note 7, note 8, note 9, s5 s6, s7, s8, s8 plus, s9, s9 plus, s10, s10 plus, one plus, Box VR etc.\r\n✅ Modern VR Gaming Technology - VR games and VR films work best when your eyes are optimally aligned to the display box. That\'s why our VR headset includes FD and OD adjustments (wide field of view), to extend the viewing angle, as well as to adjust the focal length and object distance for reduced distortion.', NULL, 1, 1, 't4.jpg', 'Tech', 20),
(24, 'Apple Iphone 13', '800.00', '6.1 inch Super Retina XDR display\r\nThe cinema mode automatically adds low depth of field and moves the focus in your videos.\r\nAdvanced dual camera system with 12MP wide-angle and ultra-wide angle lenses, photographic styles, smart HDR 4, night mode, 4K HDR recording with Dolby Vision.\r\n12MP TrueDepth front camera with night mode, 4K HDR video recording with Dolby Vision.\r\nA15 Bionic chip for super-fast performance\r\nUp to 19 hours of video playback.\r\nRobust design with Ceramic Shield.', NULL, 1, 1, 't5.jpg', 'Tech', 20),
(25, 'Samsung Galaxy A33 5G Android Smartphone, Infinity-U FHD+ Display Super AMOLED 6.4 Inch¹, 6GB RAM an', '250.00', 'Display: 6.4\" Super AMOLED 90Hz Refresh Rate.\r\nMemory: 128GB internal memory, up to 1TB with microSD/6GB RAM\r\nExynos 1280 Octa-Core Processor\r\nQuad Main Camera (48MP + 8MP + 5MP + 2MP)\r\nBattery: 5000 mAh.\r\n', NULL, 1, 1, 't6.jpg', 'Tech', 20),
(91, 'Samsung Galaxy A33 5G Android Smartphone, Infinity-U FHD+ Display Super AMOLED 6.4 Inch¹, 6GB RAM an', '200.00', 'Display: 6.4\" Super AMOLED 90Hz Refresh Rate.\r\nMemory: 128GB internal memory, up to 1TB with microSD/6GB RAM.\r\nExynos 1280 Octa-Core Processor\r\nQuad Main Camera (48MP + 8MP + 5MP + 2MP)\r\nBattery: 5000 mAh.\r\n', NULL, 1, 1, 't6.jpg', 'Tech', 30),
(92, 'Samsung Galaxy A33 5G Android Smartphone, Infinity-U FHD+ Display Super AMOLED 6.4 Inch¹, 6GB RAM an', '200.00', 'Display: 6.4\" Super AMOLED 90Hz Refresh Rate.\r\nMemory: 128GB internal memory, up to 1TB with microSD/6GB RAM.\r\nExynos 1280 Octa-Core Processor\r\nQuad Main Camera (48MP + 8MP + 5MP + 2MP)\r\nBattery: 5000 mAh.\r\n', NULL, 1, 1, 't6.jpg', 'Tech', 30);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `question_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `question`, `fk_user`, `fk_product`, `question_date`) VALUES
(1, 'How long does the shipment take?\r\n', 2, 18, '2022-08-11');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `review` text DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `review`, `review_date`, `fk_product`, `fk_user`) VALUES
(1, 'Battery life: No charger in the box. Improved battery life, but not quite as good as the iPhone 13 Pro. The iPhone 12s 17 hour battery life was solid, but the iPhone 13s internal components have been rearranged to take up less space. This allows for a larger battery, meaning the iPhone 13 now gets 19 hours of battery life.', '2022-08-01', 24, 2),
(2, 'Battery life: No charger in the box. Improved battery life, but not quite as good as the iPhone 13 Pro. The iPhone 12s 17 hour battery life was solid, but the iPhone 13s internal components have been rearranged to take up less space. This allows for a larger battery, meaning the iPhone 13 now gets 19 hours of battery life.', '2022-08-01', 24, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `f_name` varchar(60) DEFAULT NULL,
  `l_name` varchar(60) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `picture` varchar(255) NOT NULL,
  `user_ban` tinyint(1) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `f_name`, `l_name`, `email`, `pass`, `birthdate`, `picture`, `user_ban`, `status`) VALUES
(1, 'Admin', 'Adminee', 'admin@gmail.com', 'admin123', '1992-08-11', 'admin.png', 0, 'admin'),
(2, 'Kate', 'Moss', 'kate@gmail.com', 'kate123', '1980-03-12', 'user.png', 0, 'user.png'),
(5, 'Bob', 'Banned', 'boby@gmail.com', 'bob123', '1980-02-15', 'user.png', 1, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `street_nr` varchar(255) NOT NULL,
  `city` varchar(70) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_address`
--

INSERT INTO `user_address` (`id`, `street_nr`, `city`, `country`, `zip_code`, `fk_user`) VALUES
(1, 'Kartnerstrasse 30.', 'Vienna', 'Austria', '1020', 2),
(2, 'Kartnerstrasse 30.', 'Vienna', 'Austria', '1020', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ban_date`
--
ALTER TABLE `ban_date`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_order` (`fk_order`);

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_payment` (`fk_payment`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_order` (`fk_order`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`fk_product`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `producer`
--
ALTER TABLE `producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producer` (`fk_producer`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_product` (`fk_product`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`fk_product`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ban_date`
--
ALTER TABLE `ban_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producer`
--
ALTER TABLE `producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ban_date`
--
ALTER TABLE `ban_date`
  ADD CONSTRAINT `ban_date_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`fk_order`) REFERENCES `orders` (`id`);

--
-- Constraints for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`fk_payment`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `invoice_details_ibfk_3` FOREIGN KEY (`fk_address`) REFERENCES `user_address` (`id`),
  ADD CONSTRAINT `invoice_details_ibfk_4` FOREIGN KEY (`fk_order`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`fk_producer`) REFERENCES `producer` (`id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`fk_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_address`
--
ALTER TABLE `user_address`
  ADD CONSTRAINT `user_address_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
