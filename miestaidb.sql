-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2021 m. Bal 08 d. 08:45
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `miestai`
--

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `miestai`
--

CREATE TABLE `miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `pavadinimas` varchar(20) COLLATE utf8_lithuanian_ci NOT NULL,
  `salies_kodas` char(3) COLLATE utf8_lithuanian_ci NOT NULL,
  `ikurimo_data` varchar(4) COLLATE utf8_lithuanian_ci NOT NULL,
  `gyventojai` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `miestai`
--

INSERT INTO `miestai` (`id`, `pavadinimas`, `salies_kodas`, `ikurimo_data`, `gyventojai`) VALUES
(1, 'Kaunas', 'LTU', '1361', 289380),
(2, 'Vilnius', 'LTU', '1323', 587581),
(3, 'Maskva', 'RUS', '1147', 12615882),
(4, 'Talinas', 'EST', '1154', 437619),
(5, 'Ryga', 'LVA', '1201', 627487),
(6, 'Kėdainiai', 'LTU', '1372', 22682),
(7, 'Panevėžys', 'LTU', '1503', 85878),
(8, 'Daugpilis', 'LVA', '1582', 92776),
(9, 'Jonava', 'LTU', '1750', 26427);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `salys`
--

CREATE TABLE `salys` (
  `id` int(10) UNSIGNED NOT NULL,
  `pavadinimas` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL,
  `salies_kodas` char(3) COLLATE utf8_lithuanian_ci NOT NULL,
  `salis` varchar(255) COLLATE utf8_lithuanian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `salys`
--

INSERT INTO `salys` (`id`, `pavadinimas`, `salies_kodas`, `salis`) VALUES
(1, 'Lietuva', 'LTU', NULL),
(2, 'Rusija', 'RUS', NULL),
(3, 'Lenkija', 'POL', NULL);

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `upes`
--

CREATE TABLE `upes` (
  `id` int(10) UNSIGNED NOT NULL,
  `pavadinimas` varchar(255) COLLATE utf8_lithuanian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `upes`
--

INSERT INTO `upes` (`id`, `pavadinimas`) VALUES
(1, 'Nemunas'),
(2, 'Nėris'),
(3, 'Nevėžis'),
(4, 'Dauguva');

-- --------------------------------------------------------

--
-- Sukurta duomenų struktūra lentelei `upes_miestai`
--

CREATE TABLE `upes_miestai` (
  `id` int(10) UNSIGNED NOT NULL,
  `miestai_id` int(10) UNSIGNED NOT NULL,
  `upes_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Sukurta duomenų kopija lentelei `upes_miestai`
--

INSERT INTO `upes_miestai` (`id`, `miestai_id`, `upes_id`) VALUES
(1, 1, 2),
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(5, 8, 4),
(6, 5, 4),
(7, 9, 2),
(8, 1, 2),
(9, 2, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `miestai`
--
ALTER TABLE `miestai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salys`
--
ALTER TABLE `salys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upes`
--
ALTER TABLE `upes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upes_miestai`
--
ALTER TABLE `upes_miestai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `miestai_id` (`miestai_id`),
  ADD KEY `salys_id` (`upes_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `miestai`
--
ALTER TABLE `miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `salys`
--
ALTER TABLE `salys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `upes`
--
ALTER TABLE `upes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `upes_miestai`
--
ALTER TABLE `upes_miestai`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Apribojimai eksportuotom lentelėm
--

--
-- Apribojimai lentelei `upes_miestai`
--
ALTER TABLE `upes_miestai`
  ADD CONSTRAINT `upes_miestai_ibfk_1` FOREIGN KEY (`miestai_id`) REFERENCES `miestai` (`id`),
  ADD CONSTRAINT `upes_miestai_ibfk_2` FOREIGN KEY (`upes_id`) REFERENCES `upes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
