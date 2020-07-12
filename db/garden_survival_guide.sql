-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2020 at 03:46 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `garden_survival_guide`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Privileges_ID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Admin_ID`, `Privileges_ID`, `FirstName`, `LastName`) VALUES
(1, 1, 'Aaron', 'Pierson'),
(2, 1, 'Tsega ', 'Teka');

-- --------------------------------------------------------

--
-- Table structure for table `calender`
--

CREATE TABLE `calender` (
  `Calender_ID` int(11) NOT NULL,
  `Dates_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dates`
--

CREATE TABLE `dates` (
  `Dates_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Desc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gardens`
--

CREATE TABLE `gardens` (
  `Garden_ID` int(11) NOT NULL,
  `user_ID` int(11) DEFAULT NULL,
  `GardenName` varchar(50) DEFAULT NULL,
  `GardenDescprtion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gardens`
--

INSERT INTO `gardens` (`Garden_ID`, `user_ID`, `GardenName`, `GardenDescprtion`) VALUES
(12, 9, 'Your New garden', 'Here is your new Garden');

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `garden_ID` int(11) NOT NULL,
  `Plant_API_Key` varchar(100) DEFAULT NULL,
  `PlantType` varchar(50) DEFAULT NULL,
  `AmountWanted` int(11) DEFAULT NULL,
  `AmountOwned` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `Admin_Key` int(11) NOT NULL,
  `Description` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`Admin_Key`, `Description`) VALUES
(1, 'Admin Has full rights to manage the entire site'),
(2, 'Admin Can update the content for the site.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Zone` int(11) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `StateCode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `UserName`, `Password`, `Zone`, `City`, `StateCode`) VALUES
(9, 'Aaron', 'testing', 4, 'Sioux Falls', 'SD');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `newUserInsert` AFTER INSERT ON `users` FOR EACH ROW INSERT Into gardens(User_ID, GardenName, GardenDescprtion)
VALUES(NEW.User_ID, 'Your New garden', 'Here is your new Garden')
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `FK` (`Privileges_ID`);

--
-- Indexes for table `calender`
--
ALTER TABLE `calender`
  ADD PRIMARY KEY (`Calender_ID`),
  ADD KEY `FK` (`Dates_ID`);

--
-- Indexes for table `dates`
--
ALTER TABLE `dates`
  ADD PRIMARY KEY (`Dates_ID`);

--
-- Indexes for table `gardens`
--
ALTER TABLE `gardens`
  ADD PRIMARY KEY (`Garden_ID`),
  ADD UNIQUE KEY `User_ID` (`user_ID`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`Admin_Key`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `calender`
--
ALTER TABLE `calender`
  MODIFY `Calender_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gardens`
--
ALTER TABLE `gardens`
  MODIFY `Garden_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
