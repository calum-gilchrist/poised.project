-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql8.freemysqlhosting.net
-- Generation Time: Jan 15, 2023 at 11:50 AM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql8587615`
--

-- --------------------------------------------------------

--
-- Table structure for table `architects`
--

CREATE TABLE `architects` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `architects`
--

INSERT INTO `architects` (`name`, `phone_number`, `email_address`, `physical_address`) VALUES
('Aaron', '09343445', 'aaron@architect.com', 'Scotland'),
('Calum Gilchrist', '07772541875', 'calum@gilchrist.com', 'My house, Irvine'),
('Dominic Smith', '07837583746', 'domsmith@industry.com', 'The Office, Glasgow'),
('John Smith', '356456', 'trbsrtbsr', 'srtbstrb'),
('Lewis Latham', '07648937476', 'lewis@latham.com', 'Somewhere, Irvine'),
('Sam Smith', '07659487377', 'sam@smith.com', 'The Studio, Glasgow'),
('The Architect', '9458675', 'the@architect.com', 'A Studio, Glasgow');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`name`, `phone_number`, `email_address`, `physical_address`) VALUES
('God knows', '3453465', 'iam@thedevil.com', 'hell, england'),
('Laura Jones', '039487432', 'calum@customer.com', 'South Pole'),
('Mr Mackie', '01294 829975', 'mrmackie@home.com', 'The Gorbles, Kilwinning, KA2 4BJ'),
('Mr Munro', '01294 2746453', 'mikemunro@btinternet.com', 'Whitehirst Park, Kilwinning, KA2 4BJ'),
('Mrs Gary', '01294 473629', 'mrsgary@hotmail.com', '85 Fintry Place, Kilwinning, KA7 8GB'),
('Mrs Smith', '01294 876543', 'smith@btinternet.com', '83 Fintry Place, Kilwinning, KA7 8GB'),
('The Customer', '07837546387', 'custom@email.com', 'A house, somewhere');

-- --------------------------------------------------------

--
-- Table structure for table `engineers`
--

CREATE TABLE `engineers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `engineers`
--

INSERT INTO `engineers` (`name`, `phone_number`, `email_address`, `physical_address`) VALUES
('Adam', '34907345', 'adam@engineer.com', 'Ireland'),
('Irvine Builders', '01294 764938', 'builders@irvine.co.uk', 'Irvine, North Ayrshire'),
('James Anderson', '01294 237624', 'jamesa@builder.co.uk', 'Kilmarnock, East Ayrshire'),
('JRS Construction', '764894837', 'JRS@construct.com', 'The Moon'),
('Marley Construction', '01294 678456', 'marley@construction.com', 'Marley, East Industrial Estate, Irvine'),
('Sam', '233445', 'sam@engineer.com', 'Glasgow'),
('We Are Construction', '01563 764867', 'weare@building.com', 'Somewhere Else, Kilmarnock');

-- --------------------------------------------------------

--
-- Table structure for table `poised_projects`
--

CREATE TABLE `poised_projects` (
  `job_number` int(11) NOT NULL,
  `job_name` char(100) DEFAULT NULL,
  `build_type` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL,
  `erf_number` int(11) DEFAULT NULL,
  `total_fee` double DEFAULT NULL,
  `total_paid` double DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `architect` char(100) DEFAULT NULL,
  `engineer` char(100) DEFAULT NULL,
  `proj_manager` char(100) DEFAULT NULL,
  `customer` char(100) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `poised_projects`
--

INSERT INTO `poised_projects` (`job_number`, `job_name`, `build_type`, `physical_address`, `erf_number`, `total_fee`, `total_paid`, `deadline`, `architect`, `engineer`, `proj_manager`, `customer`, `completed`) VALUES
(3, 'Test Build', 'Treehouse', 'arvrv', 123, 79976, 12321, '2016-06-06', 'John Smith', 'Adam', 'Naomi Ash', 'God knows', 1),
(12, 'New Home', 'house', '27 Carmichael Place, Irvine, North Ayrshire, KA12 0XH', 237, 215000, 104000, '2022-12-25', 'Calum Gilchrist', 'James Anderson', 'Aleksi Warner', 'Mrs Smith', 1),
(13, 'Renovation', 'flat', '14 Globe Place, Irvine, North Ayrshire, KA11 1JB', 836, 321000, 97000, '2025-04-27', 'Dominic Smith', 'We Are Construction', 'Liam Sergeant', 'Mr Munro', 1),
(14, 'Old Home', 'house', '4 Maxwood Place, Irvine, North Ayrshire, KA12 9JB', 736, 150000, 140000, '2021-07-15', 'Lewis Latham', 'Irvine Builders', 'Kat Hunter', 'Mrs Gary', 0),
(15, 'Renovation', 'house', '57 High Street, Irvine, North Ayrshire, KA11 4SU', 836, 76000, 14000, '2019-04-26', 'Sam Smith', 'Marley Construction', 'Jenson Strange', 'Mr Mackie', 1),
(16, 'Glow', 'store', '65 High Street, Kilmarnock, East Ayrshire, KA4 8JU', 123, 100000, 40000, '2023-08-12', 'Aaron', 'JRS Construction', 'Karina Wade', 'Laura Jones', 0),
(19, 'My House', 'Detached House', 'Irvine, North Ayrshire', 23, 789987, 123321, '2025-08-26', 'The Architect', 'Sam', 'Vicki Barr', 'The Customer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `proj_managers`
--

CREATE TABLE `proj_managers` (
  `name` char(50) NOT NULL,
  `phone_number` char(20) DEFAULT NULL,
  `email_address` char(50) DEFAULT NULL,
  `physical_address` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proj_managers`
--

INSERT INTO `proj_managers` (`name`, `phone_number`, `email_address`, `physical_address`) VALUES
('Aleksi Warner', '3459873423', 'aleksi@pjm.com', 'Irvine'),
('Jenson Strange', '345398577896', 'jenson@strange.com', 'Kilmarnock'),
('Karina Wade', '58972987', 'karina@wadepm.com', 'Glasgow'),
('Kat Hunter', '52509785', 'k@hunter.co.uk', 'Aberdeen'),
('Liam Sergeant', '345t09785', 'liam@sergent.co.uk', 'Ayr'),
('Naomi Ash', '3450983475', 'naomiash@management.com', 'Dundee'),
('Vicki Barr', '345784432', 'vickib@rrpjm.com', 'Skye');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `architects`
--
ALTER TABLE `architects`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `engineers`
--
ALTER TABLE `engineers`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `poised_projects`
--
ALTER TABLE `poised_projects`
  ADD PRIMARY KEY (`job_number`) USING BTREE;

--
-- Indexes for table `proj_managers`
--
ALTER TABLE `proj_managers`
  ADD PRIMARY KEY (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
