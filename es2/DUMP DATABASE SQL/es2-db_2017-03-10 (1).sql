-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 10, 2017 at 08:04 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `es2`
--

-- --------------------------------------------------------

--
-- Table structure for table `clienti`
--

CREATE TABLE `clienti` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` int(15) NOT NULL,
  `cellulare` int(15) NOT NULL,
  `callulare` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clienti`
--

INSERT INTO `clienti` (`id`, `nome`, `email`, `telefono`, `cellulare`, `callulare`) VALUES
(1, 'Tizio', 'tizio@gmail.it', 166846, 68764168, NULL),
(2, 'Caio', 'caio@gmail.it', 123456, 456987321, NULL),
(3, 'Mimmo', 'mimmo@gmail.it', 98716516, 96486511, NULL),
(4, 'Franco', 'franco@gmail.it', 98165615, 984651, NULL),
(5, 'Rocco', 'rocco@gmail.it', 987981569, 7981636, NULL),
(6, 'Gino', 'gino@gmail.it', 1691353, 98716561, NULL),
(7, 'Pino', 'pino@gmail.it', 978165, 64568, NULL),
(8, 'Tino', 'tino@hotmail.com', 987645, 0, 9816);

-- --------------------------------------------------------

--
-- Table structure for table `ricevute`
--

CREATE TABLE `ricevute` (
  `id` int(11) NOT NULL,
  `dataemissione` date NOT NULL,
  `clienti_id` int(11) NOT NULL,
  `descrizione` varchar(100) NOT NULL,
  `importo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ricevute`
--

INSERT INTO `ricevute` (`id`, `dataemissione`, `clienti_id`, `descrizione`, `importo`) VALUES
(1, '2017-03-01', 1, 'DESC.1', 10.01),
(2, '2017-03-01', 1, 'DESC.2', 10.02),
(3, '2017-03-03', 1, 'DESC.3', 10.03),
(4, '2017-03-04', 2, 'DESC.4', 10.04),
(5, '2017-03-08', 2, 'DESC.5', 10.05),
(6, '2017-03-08', 3, 'DESC.6', 10.06),
(7, '2017-03-09', 3, 'DESC.7', 10.07),
(8, '2017-03-10', 3, 'DESC.8', 10.08),
(9, '2017-03-07', 4, 'DESC.9', 10.09),
(10, '2017-03-06', 5, 'DESC.10', 10.1),
(11, '2017-03-09', 6, 'DESC.11', 10.11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clienti`
--
ALTER TABLE `clienti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ricevute`
--
ALTER TABLE `ricevute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clienti_id` (`clienti_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clienti`
--
ALTER TABLE `clienti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ricevute`
--
ALTER TABLE `ricevute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ricevute`
--
ALTER TABLE `ricevute`
  ADD CONSTRAINT `ricevute_ibfk_1` FOREIGN KEY (`clienti_id`) REFERENCES `clienti` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
