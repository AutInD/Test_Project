-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2021 at 09:04 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbotforsmesdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL COMMENT 'รหัสออเดอร์',
  `Order_CountProduct` int(11) NOT NULL COMMENT 'จำนวนของสินค้า',
  `Order_TotalCost` int(11) NOT NULL COMMENT 'ราคาที่ลูกค้าสั่งทั้งหมดภายในออเดอร์',
  `Order_Date` datetime NOT NULL COMMENT 'เวลาและวันที่',
  `Order_Status` varchar(20) NOT NULL COMMENT 'สถานะออเดอร์ว่าชำระเงินแล้วหรือยัง',
  `Order_CusName` varchar(45) NOT NULL,
  `Order_CusTel` varchar(45) NOT NULL,
  `Order_CusAdd` varchar(45) NOT NULL,
  `Order_DeliveryType` varchar(45) NOT NULL,
  `Order_Tracking` varchar(255) NOT NULL,
  `Product_idProduct` int(11) NOT NULL,
  `Payment_idPayment` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `Order_CountProduct`, `Order_TotalCost`, `Order_Date`, `Order_Status`, `Order_CusName`, `Order_CusTel`, `Order_CusAdd`, `Order_DeliveryType`, `Order_Tracking`, `Product_idProduct`, `Payment_idPayment`) VALUES
(1, 6, 1800, '2021-08-31 19:36:18', 'ชำระเงินแล้ว', 'อรรถพล ตันติวัฒนะผล', '0827754150', 'เกกีงาม 3 ฉลองกรุง ลาดกระบัง กรุงเทพ', 'EMS', '', 1, 2),
(2, 20, 3800, '2021-08-31 22:41:31', 'ยังไม่ได้ชำระเงิน', 'เจตวัฒน์ บูรณ์สัน', '0886142582', 'เกกีงาม 3 ฉลองกรุง ลาดกระบัง กรุงเทพ', 'Flash Express', '', 5, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `idPayment` int(11) NOT NULL,
  `PayDate` datetime NOT NULL,
  `Payment_PayCost` int(11) NOT NULL,
  `Payment_Pic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`idPayment`, `PayDate`, `Payment_PayCost`, `Payment_Pic`) VALUES
(2, '2021-08-31 22:44:12', 1800, '');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `Product_Count` int(11) NOT NULL,
  `Product_Expire` date NOT NULL,
  `Product_Cost` int(11) NOT NULL,
  `Product_Detail` text DEFAULT NULL,
  `Product_Picture` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `Product_Name`, `Product_Count`, `Product_Expire`, `Product_Cost`, `Product_Detail`, `Product_Picture`) VALUES
(1, 'เห็ดหลินจือ', 300, '2022-09-01', 300, 'เห็ดหลินจือจากเมืองจีนที่ปลูกบนเขาเหลียงซานกว่า 5 ปี', NULL),
(2, 'กระชายดำผสมงาดำ', 300, '2022-09-01', 250, 'กระชายดำธรรมชาติที่ผสมงาดำ', NULL),
(3, 'ถังเช่าสีทอง', 150, '2022-09-01', 320, 'ถังเช่านำเข้าจากเมืองจีน', NULL),
(4, 'กระชายขาวผสมขิง', 400, '2022-09-01', 250, 'กระชายขาวที่ผสมขิงซึ่งผสานกันอย่างลงตัวเหมาะสำหรับคนที่เป็นเบาหวาน ความดัน', NULL),
(5, 'ฟ้าทลายโจรผสมกระชายขาว', 400, '2022-09-01', 280, 'ฟ้าทลายโจรผสมกระชายขาวช่วยลดความดัน ต่อต้านเชื้อไวรัสโควิด 19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `User_Fname` varchar(45) NOT NULL,
  `User_Sname` varchar(45) NOT NULL,
  `User_Password` varchar(18) NOT NULL,
  `User_Othername` varchar(45) DEFAULT NULL COMMENT 'ชื่อของผู้ใช้งานที่เราต้องการเพิ่มสิทธิการใช้งานให้',
  `User_Permission` enum('Admin, User') DEFAULT NULL,
  `User_Location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `User_Fname`, `User_Sname`, `User_Password`, `User_Othername`, `User_Permission`, `User_Location`) VALUES
(1, 'ณัฐภูมิ', 'ล้อมเขตร', '0850530128', '', 'Admin, User', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Order_Product1_idx` (`Product_idProduct`),
  ADD KEY `fk_Order_Payment1_idx` (`Payment_idPayment`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idPayment`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'รหัสออเดอร์', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `idPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_Order_Payment1` FOREIGN KEY (`Payment_idPayment`) REFERENCES `payment` (`idPayment`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Order_Product1` FOREIGN KEY (`Product_idProduct`) REFERENCES `product` (`idProduct`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
