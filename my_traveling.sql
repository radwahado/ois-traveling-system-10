-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2020 at 05:49 PM
-- Server version: 10.4.16-MariaDB
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_traveling`
--

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `icao_code` varchar(25) NOT NULL,
  `email` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `iata_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`icao_code`, `email`, `name`, `phone_number`, `iata_code`) VALUES
('BEL', 'bel@abc.com', 'Brussels Airlines', '02 723 23 62', 'SN');

-- --------------------------------------------------------

--
-- Table structure for table `airline_service`
--

CREATE TABLE `airline_service` (
  `title` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `price` double NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `airline_icao_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airline_service`
--

INSERT INTO `airline_service` (`title`, `description`, `price`, `service_type`, `airline_icao_code`) VALUES
('Extra_legroom_50', NULL, 50, 'seat_selection', 'BEL'),
('Extra_legroom_75', NULL, 75, 'seat_selection', 'BEL'),
('Extra_legroom_included', NULL, 0, 'seat_selection', 'BEL'),
('On_board_meal_drinks_included', NULL, 0, 'special_meal', 'BEL'),
('Preferred_Zone_35', NULL, 35, 'seat_selection', 'BEL'),
('Preferred_Zone_45', NULL, 45, 'seat_selection', 'BEL'),
('Preferred_Zone_Included', NULL, 0, 'seat_selection', 'BEL'),
('Premium_Economy_Free_Seat', NULL, 0, 'seat_selection', 'BEL'),
('Regular_seat_25', NULL, 25, 'seat_selection', 'BEL'),
('Regular_seat_30', NULL, 30, 'seat_selection', 'BEL'),
('Regular_seat_included', NULL, 0, 'seat_selection', 'BEL'),
('Special_Meal_Order_1', NULL, 50, 'special_meal', 'BEL'),
('Special_Meal_Order_2', NULL, 75, 'special_meal', 'BEL'),
('WiFi_Basic', 'Can use wifi on board', 5, 'wifi_on_board', 'BEL'),
('WiFi_High', NULL, 30, 'wifi_on_board', 'BEL'),
('WiFi_Medium', NULL, 10, 'wifi_on_board', 'BEL');

-- --------------------------------------------------------

--
-- Table structure for table `airport`
--

CREATE TABLE `airport` (
  `iata_code` varchar(25) NOT NULL,
  `address` longtext NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` varchar(250) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city_zip_code` varchar(255) NOT NULL,
  `city_dbpedia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `airport`
--

INSERT INTO `airport` (`iata_code`, `address`, `name`, `phone_number`, `email`, `city_zip_code`, `city_dbpedia`) VALUES
('BRU', 'Leopoldlaan, 1930 Zaventem', 'Brussels Airport', '890082292', 'bru@abc.com', '1082', 'Brussels'),
('CAI', 'Oruba، Road، El Nozha, Cairo Governorate, Egypt', 'Cairo International Airport ', '222655000', 'cai@abc.com', '11311', 'Cairo'),
('CDG', 'Dépose Minute Terminal 1, Avenue Charles de Gaulle, 95700 Roissy-en-France, France', 'Aéroport de Paris-Charles de Gaulle', '0', '', '75000', 'Paris'),
('DEL', 'New Delhi, Delhi 110037, India', 'Indira Gandhi International Airport', '1243376000', 'del@abc.com', '110008', 'Delhi'),
('EWR', '3 Brewster Rd, Newark, NJ 07114, United States', 'Newark Liberty International Airport', '0', '', '07101', 'New_Jersey'),
('IAD', '1 Saarinen Cir, Dulles, VA 20166, United States', 'Dulles International Airport', '1', '', '20001', 'Virginia'),
('LAX', '1 World Way, Los Angeles, CA 90045, United States', 'Los Angeles International Airport', '8554635252', 'lax@abc.com', '90045', 'Los_Angeles');

-- --------------------------------------------------------

--
-- Table structure for table `baggage_policy`
--

CREATE TABLE `baggage_policy` (
  `title` varchar(80) NOT NULL,
  `cabin_bag_dimension_cm` double NOT NULL DEFAULT 0,
  `cabin_bags_no` double NOT NULL DEFAULT 0,
  `cabin_bag_weight_kg` double NOT NULL DEFAULT 0,
  `checked_bag_dimension_cm` double NOT NULL DEFAULT 0,
  `checked_bags_no` double NOT NULL DEFAULT 0,
  `checked_bag_weight_kg` double NOT NULL DEFAULT 0,
  `excessive_price_perkg` double NOT NULL DEFAULT 0,
  `flight_type` varchar(60) NOT NULL,
  `airline_icao_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `baggage_policy`
--

INSERT INTO `baggage_policy` (`title`, `cabin_bag_dimension_cm`, `cabin_bags_no`, `cabin_bag_weight_kg`, `checked_bag_dimension_cm`, `checked_bags_no`, `checked_bag_weight_kg`, `excessive_price_perkg`, `flight_type`, `airline_icao_code`) VALUES
('0_Bag', 0, 1, 8, 0, 0, 0, 0, 'africa-europe', 'BEL'),
('1_BAG', 0, 1, 8, 158, 1, 23, 2, 'africa-europe', 'BEL'),
('Business_Standard', 0, 2, 8, 0, 2, 32, 6, '', 'BEL'),
('Flex', 0, 1, 8, 158, 2, 23, 2, 'africa-europe', 'BEL'),
('Premium_Economy_Standard', 0, 1, 8, 0, 2, 23, 6, '', 'BEL');

-- --------------------------------------------------------

--
-- Table structure for table `cabin_class`
--

CREATE TABLE `cabin_class` (
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `airline_icao_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabin_class`
--

INSERT INTO `cabin_class` (`title`, `description`, `airline_icao_code`) VALUES
('Business', 'Enjoy the wonderful experience of our Business Class, available on all our intercontinental flights. Get comfortable, feel at home and enjoy some pampering and a great service high above the clouds.\r\n', 'BEL'),
('Economy', 'With our extended intercontinental network, our premium service on board and our excellent cabin features, Brussels Airlines Economy Class is your best choice for a comfortable journey.', 'BEL'),
('Premium_Economy', 'In our new Premium Economy Class, you can unwind all the way. Our Premium Economy Class cabin focuses on comfort, personal space and hospitality. Offering you a more enjoyable flight experience in a quiet and separate area.\r\n', 'BEL');

-- --------------------------------------------------------

--
-- Table structure for table `cancellation_policy`
--

CREATE TABLE `cancellation_policy` (
  `title` varchar(75) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` longtext NOT NULL,
  `refund_postdue_percentage` int(11) DEFAULT NULL,
  `refund_predue_percentage` int(11) DEFAULT NULL,
  `airline_icao_code` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancellation_policy`
--

INSERT INTO `cancellation_policy` (`title`, `description`, `due_date`, `refund_postdue_percentage`, `refund_predue_percentage`, `airline_icao_code`) VALUES
('Business_Full_Refund', 'enjoy free cancellation', '1 week before flight', 100, NULL, 'BEL'),
('Business_No_Refund', 'no refund', '-', 0, NULL, 'BEL'),
('Full_Refund', 'fully fundable', '1 week before flight', 100, 100, 'BEL'),
('No_Refund', 'only airport taxes', '-', NULL, NULL, 'BEL'),
('Partial_Refund', '€190 cancellation fee\r\n', '2 week before flight', NULL, NULL, 'BEL'),
('Premium_Economy_Full_Refund', 'enjoy free cancellation', '1 week before flight', 100, NULL, 'BEL'),
('Premium_Economy_No_Refund', 'without refund', '-', 0, NULL, 'BEL');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `city_zipcode` varchar(255) NOT NULL,
  `city_name` varchar(45) NOT NULL,
  `country_iso_code` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`city_zipcode`, `city_name`, `country_iso_code`) VALUES
('07101', 'Newark', 'USA'),
('1082', 'Bruxelles', 'BE'),
('110008', 'Delhi', 'IND'),
('11311', 'Cairo', 'EGY'),
('20001', 'Washington D.C', 'USA'),
('75000', 'Paris', 'FRA'),
('90045', 'Los Angeles', 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_iso_code` varchar(25) NOT NULL,
  `country_name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_iso_code`, `country_name`) VALUES
('BE', 'Belgium'),
('EGY', 'Egypt'),
('FRA', 'France'),
('IND', 'India'),
('ISR', 'Israel'),
('USA', 'United States of America');

-- --------------------------------------------------------

--
-- Table structure for table `direct_flight`
--

CREATE TABLE `direct_flight` (
  `flight_number` varchar(255) NOT NULL,
  `departure_airport_iata_code` varchar(255) NOT NULL,
  `arriving_airport_iata_code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `direct_flight`
--

INSERT INTO `direct_flight` (`flight_number`, `departure_airport_iata_code`, `arriving_airport_iata_code`) VALUES
('SN8801', 'BRU', 'IAD'),
('SN8807', 'BRU', 'EWR'),
('SN8913', 'EWR', 'LAX'),
('SN8943', 'IAD', 'LAX');

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `number` varchar(255) NOT NULL,
  `departure_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `distance_km` double DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL,
  `duration_min` double NOT NULL,
  `airline_icao_code` varchar(45) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`number`, `departure_date`, `arrival_date`, `distance_km`, `is_available`, `duration_min`, `airline_icao_code`, `type`) VALUES
('SN8801', '2020-12-03 11:55:00', '2020-12-03 14:35:00', NULL, 1, 520, 'BEL', 'direct'),
('SN8801-SN8943', '2020-12-03 11:55:00', '2020-12-03 21:12:00', NULL, 1, 580, 'BEL', 'non-direct'),
('SN8807', '2020-11-30 10:10:00', '2020-11-30 12:25:00', NULL, 1, 495, 'BEL', 'direct'),
('SN8807-SN8913', '2020-11-30 10:10:00', '2020-11-30 17:49:00', NULL, 1, 459, 'BEL', 'non-direct'),
('SN8913', '2020-11-30 14:45:00', '2020-11-30 17:49:00', NULL, 1, 364, 'BEL', 'direct'),
('SN8943', '2020-12-03 18:15:00', '2020-12-03 21:12:00', NULL, 1, 357, 'BEL', 'direct');

-- --------------------------------------------------------

--
-- Table structure for table `flight_package`
--

CREATE TABLE `flight_package` (
  `title` varchar(25) NOT NULL,
  `description` longtext DEFAULT NULL,
  `cabin_class_title` varchar(255) NOT NULL,
  `baggage_policy_title` varchar(255) NOT NULL,
  `cancelation_policy_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `flight_package`
--

INSERT INTO `flight_package` (`title`, `description`, `cabin_class_title`, `baggage_policy_title`, `cancelation_policy_title`) VALUES
('1_BAG_E', '', 'Economy', '1_BAG', 'No_Refund'),
('Light_E', NULL, 'Economy', '0_Bag', 'No_Refund'),
('Low_Flex_B', NULL, 'Business', 'Business_Standard', 'Business_No_Refund'),
('Low_Flex_E', '', 'Economy', 'Flex', 'No_Refund'),
('Low_Flex_PE', NULL, 'Premium_Economy', 'Premium_Economy_Standard', 'Premium_Economy_No_Refund'),
('Max_Flex_B', NULL, 'Business', 'Business_Standard', 'Business_Full_Refund'),
('Max_Flex_E', NULL, 'Economy', 'Flex', 'Full_Refund'),
('Max_Flex_PE', NULL, 'Premium_Economy', 'Premium_Economy_Standard', 'Premium_Economy_Full_Refund'),
('Medium_Flex_E', NULL, 'Economy', 'Flex', 'Partial_Refund');

-- --------------------------------------------------------

--
-- Table structure for table `non_direct_flight`
--

CREATE TABLE `non_direct_flight` (
  `subflight_number` varchar(255) NOT NULL,
  `flight_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `non_direct_flight`
--

INSERT INTO `non_direct_flight` (`subflight_number`, `flight_number`) VALUES
('SN8801', 'SN8801-SN8943'),
('SN8943', 'SN8801-SN8943'),
('SN8913', 'SN8807-SN8913'),
('SN8807', 'SN8807-SN8913');

-- --------------------------------------------------------

--
-- Table structure for table `package_service`
--

CREATE TABLE `package_service` (
  `flight_package_title` varchar(255) NOT NULL,
  `airline_service_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package_service`
--

INSERT INTO `package_service` (`flight_package_title`, `airline_service_title`) VALUES
('1_BAG_E', 'Extra_legroom_50'),
('1_BAG_E', 'On_board_meal_drinks_included'),
('1_BAG_E', 'Preferred_Zone_35'),
('1_BAG_E', 'Regular_seat_25'),
('Light_E', 'Extra_legroom_75'),
('Light_E', 'On_board_meal_drinks_included'),
('Light_E', 'Preferred_Zone_45'),
('Light_E', 'Regular_seat_30'),
('Max_Flex_E', 'Extra_legroom_75'),
('Max_Flex_E', 'On_board_meal_drinks_included'),
('Max_Flex_E', 'Preferred_Zone_45'),
('Max_Flex_E', 'Regular_seat_included');

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_number` varchar(10) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `flight_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_number`, `is_available`, `flight_number`) VALUES
('10A', 1, 'SN8801'),
('10A', 1, 'SN8807'),
('10A', 1, 'SN8913'),
('10A', 1, 'SN8943'),
('10B', 1, 'SN8801'),
('10B', 1, 'SN8807'),
('10B', 1, 'SN8913'),
('10B', 1, 'SN8943'),
('10C', 0, 'SN8801'),
('10C', 1, 'SN8807'),
('10C', 1, 'SN8913'),
('10C', 1, 'SN8943'),
('10D', 1, 'SN8801'),
('10D', 1, 'SN8807'),
('10D', 1, 'SN8913'),
('10D', 1, 'SN8943'),
('10E', 1, 'SN8801'),
('10E', 1, 'SN8807'),
('10E', 1, 'SN8913'),
('10E', 1, 'SN8943'),
('10F', 1, 'SN8801'),
('10F', 1, 'SN8807'),
('10F', 1, 'SN8913'),
('10F', 1, 'SN8943'),
('10G', 1, 'SN8801'),
('10G', 1, 'SN8807'),
('10G', 1, 'SN8913'),
('10G', 1, 'SN8943'),
('10H', 1, 'SN8801'),
('10H', 1, 'SN8807'),
('10H', 1, 'SN8913'),
('10H', 1, 'SN8943'),
('10I', 1, 'SN8801'),
('10I', 1, 'SN8807'),
('10I', 1, 'SN8913'),
('10I', 1, 'SN8943'),
('10J', 1, 'SN8801'),
('10J', 1, 'SN8807'),
('10J', 1, 'SN8913'),
('10J', 1, 'SN8943'),
('14A', 1, 'SN8801'),
('14A', 1, 'SN8807'),
('14A', 1, 'SN8913'),
('14A', 1, 'SN8943'),
('14B', 1, 'SN8801'),
('14B', 1, 'SN8807'),
('14B', 1, 'SN8913'),
('14B', 1, 'SN8943'),
('14C', 1, 'SN8801'),
('14C', 1, 'SN8807'),
('14C', 1, 'SN8913'),
('14C', 1, 'SN8943'),
('14D', 1, 'SN8801'),
('14D', 1, 'SN8807'),
('14D', 1, 'SN8913'),
('14D', 1, 'SN8943'),
('14E', 1, 'SN8801'),
('14E', 1, 'SN8807'),
('14E', 1, 'SN8913'),
('14E', 1, 'SN8943'),
('14F', 1, 'SN8801'),
('14F', 1, 'SN8807'),
('14F', 1, 'SN8913'),
('14F', 1, 'SN8943'),
('14G', 1, 'SN8801'),
('14G', 1, 'SN8807'),
('14G', 1, 'SN8913'),
('14G', 1, 'SN8943'),
('14H', 1, 'SN8801'),
('14H', 1, 'SN8807'),
('14H', 1, 'SN8913'),
('14H', 1, 'SN8943'),
('14I', 1, 'SN8801'),
('14I', 1, 'SN8807'),
('14I', 1, 'SN8913'),
('14I', 1, 'SN8943'),
('14J', 1, 'SN8801'),
('14J', 1, 'SN8807'),
('14J', 1, 'SN8913'),
('14J', 1, 'SN8943'),
('1A', 1, 'SN8801'),
('1A', 1, 'SN8807'),
('1A', 1, 'SN8913'),
('1A', 1, 'SN8943'),
('1B', 1, 'SN8801'),
('1B', 1, 'SN8807'),
('1B', 1, 'SN8913'),
('1B', 1, 'SN8943'),
('1C', 1, 'SN8801'),
('1C', 1, 'SN8807'),
('1C', 1, 'SN8913'),
('1C', 1, 'SN8943'),
('1D', 1, 'SN8801'),
('1D', 1, 'SN8807'),
('1D', 1, 'SN8913'),
('1D', 1, 'SN8943'),
('1E', 1, 'SN8801'),
('1E', 1, 'SN8807'),
('1E', 1, 'SN8913'),
('1E', 1, 'SN8943'),
('1F', 1, 'SN8801'),
('1F', 1, 'SN8807'),
('1F', 1, 'SN8913'),
('1F', 1, 'SN8943'),
('1G', 1, 'SN8801'),
('1G', 1, 'SN8807'),
('1G', 1, 'SN8913'),
('1G', 1, 'SN8943'),
('1H', 1, 'SN8801'),
('1H', 1, 'SN8807'),
('1H', 1, 'SN8913'),
('1H', 1, 'SN8943'),
('1I', 1, 'SN8801'),
('1I', 1, 'SN8807'),
('1I', 1, 'SN8913'),
('1I', 1, 'SN8943'),
('1J', 1, 'SN8801'),
('1J', 1, 'SN8807'),
('1J', 1, 'SN8913'),
('1J', 1, 'SN8943'),
('2A', 1, 'SN8801'),
('2A', 1, 'SN8807'),
('2A', 1, 'SN8913'),
('2A', 1, 'SN8943'),
('2B', 1, 'SN8801'),
('2B', 1, 'SN8807'),
('2B', 1, 'SN8913'),
('2B', 1, 'SN8943'),
('2C', 1, 'SN8801'),
('2C', 1, 'SN8807'),
('2C', 1, 'SN8913'),
('2C', 1, 'SN8943'),
('2D', 1, 'SN8801'),
('2D', 1, 'SN8807'),
('2D', 1, 'SN8913'),
('2D', 1, 'SN8943'),
('2E', 1, 'SN8801'),
('2E', 1, 'SN8807'),
('2E', 1, 'SN8913'),
('2E', 1, 'SN8943'),
('2F', 1, 'SN8801'),
('2F', 1, 'SN8807'),
('2F', 1, 'SN8913'),
('2F', 1, 'SN8943'),
('2G', 1, 'SN8801'),
('2G', 1, 'SN8807'),
('2G', 1, 'SN8913'),
('2G', 1, 'SN8943'),
('2H', 1, 'SN8801'),
('2H', 1, 'SN8807'),
('2H', 1, 'SN8913'),
('2H', 1, 'SN8943'),
('2I', 1, 'SN8801'),
('2I', 1, 'SN8807'),
('2I', 1, 'SN8913'),
('2I', 1, 'SN8943'),
('2J', 1, 'SN8801'),
('2J', 1, 'SN8807'),
('2J', 1, 'SN8913'),
('2J', 1, 'SN8943'),
('3A', 1, 'SN8801'),
('3A', 1, 'SN8807'),
('3A', 1, 'SN8913'),
('3A', 1, 'SN8943'),
('3B', 1, 'SN8801'),
('3B', 1, 'SN8807'),
('3B', 1, 'SN8913'),
('3B', 1, 'SN8943'),
('3C', 1, 'SN8801'),
('3C', 1, 'SN8807'),
('3C', 1, 'SN8913'),
('3C', 1, 'SN8943'),
('3D', 1, 'SN8801'),
('3D', 1, 'SN8807'),
('3D', 1, 'SN8913'),
('3D', 1, 'SN8943'),
('3E', 1, 'SN8801'),
('3E', 1, 'SN8807'),
('3E', 1, 'SN8913'),
('3E', 1, 'SN8943'),
('3F', 1, 'SN8801'),
('3F', 1, 'SN8807'),
('3F', 1, 'SN8913'),
('3F', 1, 'SN8943'),
('3G', 1, 'SN8801'),
('3G', 1, 'SN8807'),
('3G', 1, 'SN8913'),
('3G', 1, 'SN8943'),
('3H', 1, 'SN8801'),
('3H', 1, 'SN8807'),
('3H', 1, 'SN8913'),
('3H', 1, 'SN8943'),
('3I', 1, 'SN8801'),
('3I', 1, 'SN8807'),
('3I', 1, 'SN8913'),
('3I', 1, 'SN8943'),
('3J', 1, 'SN8801'),
('3J', 1, 'SN8807'),
('3J', 1, 'SN8913'),
('3J', 1, 'SN8943'),
('4A', 1, 'SN8801'),
('4A', 1, 'SN8807'),
('4A', 1, 'SN8913'),
('4A', 1, 'SN8943'),
('4B', 1, 'SN8801'),
('4B', 1, 'SN8807'),
('4B', 1, 'SN8913'),
('4B', 1, 'SN8943'),
('4C', 1, 'SN8801'),
('4C', 1, 'SN8807'),
('4C', 1, 'SN8913'),
('4C', 1, 'SN8943'),
('4D', 1, 'SN8801'),
('4D', 1, 'SN8807'),
('4D', 1, 'SN8913'),
('4D', 1, 'SN8943'),
('4E', 1, 'SN8801'),
('4E', 1, 'SN8807'),
('4E', 1, 'SN8913'),
('4E', 1, 'SN8943'),
('4F', 1, 'SN8801'),
('4F', 1, 'SN8807'),
('4F', 1, 'SN8913'),
('4F', 1, 'SN8943'),
('4G', 1, 'SN8801'),
('4G', 1, 'SN8807'),
('4G', 1, 'SN8913'),
('4G', 1, 'SN8943'),
('4H', 1, 'SN8801'),
('4H', 1, 'SN8807'),
('4H', 1, 'SN8913'),
('4H', 1, 'SN8943'),
('4I', 1, 'SN8801'),
('4I', 1, 'SN8807'),
('4I', 1, 'SN8913'),
('4I', 1, 'SN8943'),
('4J', 1, 'SN8801'),
('4J', 1, 'SN8807'),
('4J', 1, 'SN8913'),
('4J', 1, 'SN8943'),
('5A', 1, 'SN8801'),
('5A', 1, 'SN8807'),
('5A', 1, 'SN8913'),
('5A', 1, 'SN8943'),
('5B', 1, 'SN8801'),
('5B', 1, 'SN8807'),
('5B', 1, 'SN8913'),
('5B', 1, 'SN8943'),
('5C', 1, 'SN8801'),
('5C', 1, 'SN8807'),
('5C', 1, 'SN8913'),
('5C', 1, 'SN8943'),
('5D', 1, 'SN8801'),
('5D', 1, 'SN8807'),
('5D', 1, 'SN8913'),
('5D', 1, 'SN8943'),
('5E', 1, 'SN8801'),
('5E', 1, 'SN8807'),
('5E', 1, 'SN8913'),
('5E', 1, 'SN8943'),
('5F', 1, 'SN8801'),
('5F', 1, 'SN8807'),
('5F', 1, 'SN8913'),
('5F', 1, 'SN8943'),
('5G', 1, 'SN8801'),
('5G', 1, 'SN8807'),
('5G', 1, 'SN8913'),
('5G', 1, 'SN8943'),
('5H', 1, 'SN8801'),
('5H', 1, 'SN8807'),
('5H', 1, 'SN8913'),
('5H', 1, 'SN8943'),
('5I', 1, 'SN8801'),
('5I', 1, 'SN8807'),
('5I', 1, 'SN8913'),
('5I', 1, 'SN8943'),
('5J', 1, 'SN8801'),
('5J', 1, 'SN8807'),
('5J', 1, 'SN8913'),
('5J', 1, 'SN8943'),
('6A', 1, 'SN8801'),
('6A', 1, 'SN8807'),
('6A', 1, 'SN8913'),
('6A', 1, 'SN8943'),
('6B', 1, 'SN8801'),
('6B', 1, 'SN8807'),
('6B', 1, 'SN8913'),
('6B', 1, 'SN8943'),
('6C', 1, 'SN8801'),
('6C', 1, 'SN8807'),
('6C', 1, 'SN8913'),
('6C', 1, 'SN8943'),
('6D', 1, 'SN8801'),
('6D', 1, 'SN8807'),
('6D', 1, 'SN8913'),
('6D', 1, 'SN8943'),
('6E', 1, 'SN8801'),
('6E', 1, 'SN8807'),
('6E', 1, 'SN8913'),
('6E', 1, 'SN8943'),
('6F', 1, 'SN8801'),
('6F', 1, 'SN8807'),
('6F', 1, 'SN8913'),
('6F', 1, 'SN8943'),
('6G', 1, 'SN8801'),
('6G', 1, 'SN8807'),
('6G', 1, 'SN8913'),
('6G', 1, 'SN8943'),
('6H', 1, 'SN8801'),
('6H', 1, 'SN8807'),
('6H', 1, 'SN8913'),
('6H', 1, 'SN8943'),
('6I', 1, 'SN8801'),
('6I', 1, 'SN8807'),
('6I', 1, 'SN8913'),
('6I', 1, 'SN8943'),
('6J', 1, 'SN8801'),
('6J', 1, 'SN8807'),
('6J', 1, 'SN8913'),
('6J', 1, 'SN8943'),
('7A', 1, 'SN8801'),
('7A', 1, 'SN8807'),
('7A', 1, 'SN8913'),
('7A', 1, 'SN8943'),
('7B', 1, 'SN8801'),
('7B', 1, 'SN8807'),
('7B', 1, 'SN8913'),
('7B', 1, 'SN8943'),
('7C', 1, 'SN8801'),
('7C', 1, 'SN8807'),
('7C', 1, 'SN8913'),
('7C', 1, 'SN8943'),
('7D', 1, 'SN8801'),
('7D', 1, 'SN8807'),
('7D', 1, 'SN8913'),
('7D', 1, 'SN8943'),
('7E', 1, 'SN8801'),
('7E', 1, 'SN8807'),
('7E', 1, 'SN8913'),
('7E', 1, 'SN8943'),
('7F', 1, 'SN8801'),
('7F', 1, 'SN8807'),
('7F', 1, 'SN8913'),
('7F', 1, 'SN8943'),
('7G', 1, 'SN8801'),
('7G', 1, 'SN8807'),
('7G', 1, 'SN8913'),
('7G', 1, 'SN8943'),
('7H', 1, 'SN8801'),
('7H', 1, 'SN8807'),
('7H', 1, 'SN8913'),
('7H', 1, 'SN8943'),
('7I', 1, 'SN8801'),
('7I', 1, 'SN8807'),
('7I', 1, 'SN8913'),
('7I', 1, 'SN8943'),
('7J', 1, 'SN8801'),
('7J', 1, 'SN8807'),
('7J', 1, 'SN8913'),
('7J', 1, 'SN8943'),
('8A', 1, 'SN8801'),
('8A', 1, 'SN8807'),
('8A', 1, 'SN8913'),
('8A', 1, 'SN8943'),
('8B', 1, 'SN8801'),
('8B', 1, 'SN8807'),
('8B', 1, 'SN8913'),
('8B', 1, 'SN8943'),
('8C', 1, 'SN8801'),
('8C', 1, 'SN8807'),
('8C', 1, 'SN8913'),
('8C', 1, 'SN8943'),
('8D', 1, 'SN8801'),
('8D', 1, 'SN8807'),
('8D', 1, 'SN8913'),
('8D', 1, 'SN8943'),
('8E', 1, 'SN8801'),
('8E', 1, 'SN8807'),
('8E', 1, 'SN8913'),
('8E', 1, 'SN8943'),
('8F', 1, 'SN8801'),
('8F', 1, 'SN8807'),
('8F', 1, 'SN8913'),
('8F', 1, 'SN8943'),
('8G', 1, 'SN8801'),
('8G', 1, 'SN8807'),
('8G', 1, 'SN8913'),
('8G', 1, 'SN8943'),
('8H', 1, 'SN8801'),
('8H', 1, 'SN8807'),
('8H', 1, 'SN8913'),
('8H', 1, 'SN8943'),
('8I', 1, 'SN8801'),
('8I', 1, 'SN8807'),
('8I', 1, 'SN8913'),
('8I', 1, 'SN8943'),
('8J', 1, 'SN8801'),
('8J', 1, 'SN8807'),
('8J', 1, 'SN8913'),
('8J', 1, 'SN8943'),
('9A', 1, 'SN8801'),
('9A', 1, 'SN8807'),
('9A', 1, 'SN8913'),
('9A', 1, 'SN8943'),
('9B', 1, 'SN8801'),
('9B', 1, 'SN8807'),
('9B', 1, 'SN8913'),
('9B', 1, 'SN8943'),
('9C', 1, 'SN8801'),
('9C', 1, 'SN8807'),
('9C', 1, 'SN8913'),
('9C', 1, 'SN8943'),
('9D', 1, 'SN8801'),
('9D', 1, 'SN8807'),
('9D', 1, 'SN8913'),
('9D', 1, 'SN8943'),
('9E', 1, 'SN8801'),
('9E', 1, 'SN8807'),
('9E', 1, 'SN8913'),
('9E', 1, 'SN8943'),
('9F', 1, 'SN8801'),
('9F', 1, 'SN8807'),
('9F', 1, 'SN8913'),
('9F', 1, 'SN8943'),
('9G', 1, 'SN8801'),
('9G', 1, 'SN8807'),
('9G', 1, 'SN8913'),
('9G', 1, 'SN8943'),
('9H', 1, 'SN8801'),
('9H', 1, 'SN8807'),
('9H', 1, 'SN8913'),
('9H', 1, 'SN8943'),
('9I', 1, 'SN8801'),
('9I', 1, 'SN8807'),
('9I', 1, 'SN8913'),
('9I', 1, 'SN8943'),
('9J', 1, 'SN8801'),
('9J', 1, 'SN8807'),
('9J', 1, 'SN8913'),
('9J', 1, 'SN8943');

-- --------------------------------------------------------

--
-- Table structure for table `special_meal_type`
--

CREATE TABLE `special_meal_type` (
  `meal_type` varchar(255) NOT NULL,
  `airline_service_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `special_meal_type`
--

INSERT INTO `special_meal_type` (`meal_type`, `airline_service_title`) VALUES
('low calories', 'Special_Meal_Order_1'),
('diabetes', 'Special_Meal_Order_2');

-- --------------------------------------------------------

--
-- Table structure for table `stopping`
--

CREATE TABLE `stopping` (
  `duration_min` double NOT NULL,
  `duration_from` datetime NOT NULL,
  `duration_to` datetime NOT NULL,
  `airport_iatacode` varchar(45) NOT NULL,
  `flight_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stopping`
--

INSERT INTO `stopping` (`duration_min`, `duration_from`, `duration_to`, `airport_iatacode`, `flight_number`) VALUES
(140, '2020-11-30 12:25:00', '2020-11-30 14:45:00', 'EWR', 'SN8807-SN8913'),
(230, '2020-12-03 14:35:00', '2020-12-03 18:15:00', 'IAD', 'SN8801-SN8943');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `flight_number` varchar(255) NOT NULL,
  `package_title` varchar(255) NOT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `requested_excessive_baggage_kg` int(11) DEFAULT NULL,
  `seat_number` varchar(10) NOT NULL,
  `chosen_meal_service_price` int(11) DEFAULT NULL,
  `chosen_wifi_service_price` int(11) DEFAULT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`flight_number`, `package_title`, `trip_id`, `requested_excessive_baggage_kg`, `seat_number`, `chosen_meal_service_price`, `chosen_wifi_service_price`, `price`) VALUES
('SN8801', '1_BAG_E', NULL, NULL, '8A', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8B', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8C', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8D', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8E', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8F', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8G', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8H', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8I', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '8J', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9A', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9B', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9C', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9D', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9E', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9F', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9G', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9H', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9I', NULL, NULL, 330),
('SN8801', '1_BAG_E', NULL, NULL, '9J', NULL, NULL, 330),
('SN8801', 'LIGHT_E', NULL, NULL, '10A', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10B', NULL, NULL, 200),
('SN8801', 'LIGHT_E', 1, 0, '10C', 0, 0, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10D', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10E', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10F', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10G', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10H', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10I', NULL, NULL, 200),
('SN8801', 'LIGHT_E', NULL, NULL, '10J', NULL, NULL, 200),
('SN8801', 'Low_Flex_B', NULL, NULL, '1J', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2A', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2B', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2C', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2D', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2E', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2F', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2G', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2H', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2I', NULL, NULL, 690),
('SN8801', 'Low_Flex_B', NULL, NULL, '2J', NULL, NULL, 690),
('SN8801', 'Low_Flex_E', NULL, NULL, '7A', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7B', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7C', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7D', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7E', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7F', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7G', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7H', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7I', NULL, NULL, 400),
('SN8801', 'Low_Flex_E', NULL, NULL, '7J', NULL, NULL, 400),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4A', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4B', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4C', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4D', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4E', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4F', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4G', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4H', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4I', NULL, NULL, 543),
('SN8801', 'Low_Flex_PE', NULL, NULL, '4J', NULL, NULL, 543),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1A', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1B', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1C', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1D', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1E', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1F', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1G', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1H', NULL, NULL, 800),
('SN8801', 'MAX_Flex_B', NULL, NULL, '1I', NULL, NULL, 800),
('SN8801', 'Max_Flex_E', NULL, NULL, '5A', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5B', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5C', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5D', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5E', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5F', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5G', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5H', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5I', NULL, NULL, 500),
('SN8801', 'Max_Flex_E', NULL, NULL, '5J', NULL, NULL, 500),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3A', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3B', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3C', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3D', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3E', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3F', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3G', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3H', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3I', NULL, NULL, 570),
('SN8801', 'MAX_Flex_PE', NULL, NULL, '3J', NULL, NULL, 570),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6A', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6B', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6C', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6D', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6E', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6F', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6G', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6H', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6I', NULL, NULL, 448),
('SN8801', 'Medium_Flex_E', NULL, NULL, '6J', NULL, NULL, 448),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14A', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14B', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14C', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14D', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14E', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14F', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14G', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14H', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14I', NULL, NULL, 450),
('SN8801-SN8943', '1_BAG_E', NULL, NULL, '14J', NULL, NULL, 450),
('SN8807', '1_BAG_E', NULL, NULL, '8A', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8B', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8C', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8D', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8E', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8F', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8G', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8H', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8I', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '8J', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9A', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9B', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9C', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9D', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9E', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9F', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9G', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9H', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9I', NULL, NULL, 430),
('SN8807', '1_BAG_E', NULL, NULL, '9J', NULL, NULL, 430),
('SN8807', 'LIGHT_E', NULL, NULL, '10A', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10B', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10C', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10D', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10E', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10F', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10G', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10H', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10I', NULL, NULL, 400),
('SN8807', 'LIGHT_E', NULL, NULL, '10J', NULL, NULL, 400),
('SN8807', 'Low_Flex_B', NULL, NULL, '1J', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2A', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2B', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2C', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2D', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2E', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2F', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2G', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2H', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2I', NULL, NULL, 990),
('SN8807', 'Low_Flex_B', NULL, NULL, '2J', NULL, NULL, 990),
('SN8807', 'Low_Flex_E', NULL, NULL, '7A', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7B', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7C', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7D', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7E', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7F', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7G', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7H', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7I', NULL, NULL, 470),
('SN8807', 'Low_Flex_E', NULL, NULL, '7J', NULL, NULL, 470),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4A', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4B', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4C', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4D', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4E', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4F', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4G', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4H', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4I', NULL, NULL, 700),
('SN8807', 'Low_Flex_PE', NULL, NULL, '4J', NULL, NULL, 700),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1A', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1B', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1C', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1D', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1E', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1F', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1G', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1H', NULL, NULL, 1050),
('SN8807', 'MAX_Flex_B', NULL, NULL, '1I', NULL, NULL, 1050),
('SN8807', 'Max_Flex_E', NULL, NULL, '5A', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5B', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5C', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5D', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5E', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5F', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5G', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5H', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5I', NULL, NULL, 520),
('SN8807', 'Max_Flex_E', NULL, NULL, '5J', NULL, NULL, 520),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3A', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3B', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3C', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3D', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3E', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3F', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3G', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3H', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3I', NULL, NULL, 770),
('SN8807', 'MAX_Flex_PE', NULL, NULL, '3J', NULL, NULL, 770),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6A', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6B', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6C', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6D', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6E', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6F', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6G', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6H', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6I', NULL, NULL, 495),
('SN8807', 'Medium_Flex_E', NULL, NULL, '6J', NULL, NULL, 495),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14A', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14B', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14C', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14D', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14E', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14F', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14G', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14H', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14I', NULL, NULL, 630),
('SN8807-SN8913', '1_BAG_E', NULL, NULL, '14J', NULL, NULL, 630),
('SN8913', '1_BAG_E', NULL, NULL, '8A', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8B', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8C', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8D', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8E', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8F', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8G', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8H', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8I', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '8J', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9A', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9B', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9C', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9D', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9E', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9F', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9G', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9H', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9I', NULL, NULL, 200),
('SN8913', '1_BAG_E', NULL, NULL, '9J', NULL, NULL, 200),
('SN8913', 'LIGHT_E', NULL, NULL, '10A', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10B', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10C', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10D', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10E', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10F', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10G', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10H', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10I', NULL, NULL, 150),
('SN8913', 'LIGHT_E', NULL, NULL, '10J', NULL, NULL, 150),
('SN8913', 'Low_Flex_B', NULL, NULL, '1J', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2A', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2B', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2C', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2D', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2E', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2F', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2G', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2H', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2I', NULL, NULL, 880),
('SN8913', 'Low_Flex_B', NULL, NULL, '2J', NULL, NULL, 880),
('SN8913', 'Low_Flex_E', NULL, NULL, '7A', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7B', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7C', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7D', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7E', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7F', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7G', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7H', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7I', NULL, NULL, 220),
('SN8913', 'Low_Flex_E', NULL, NULL, '7J', NULL, NULL, 220),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4A', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4B', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4C', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4D', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4E', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4F', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4G', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4H', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4I', NULL, NULL, 500),
('SN8913', 'Low_Flex_PE', NULL, NULL, '4J', NULL, NULL, 500),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1A', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1B', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1C', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1D', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1E', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1F', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1G', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1H', NULL, NULL, 950),
('SN8913', 'MAX_Flex_B', NULL, NULL, '1I', NULL, NULL, 950),
('SN8913', 'Max_Flex_E', NULL, NULL, '5A', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5B', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5C', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5D', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5E', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5F', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5G', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5H', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5I', NULL, NULL, 380),
('SN8913', 'Max_Flex_E', NULL, NULL, '5J', NULL, NULL, 380),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3A', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3B', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3C', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3D', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3E', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3F', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3G', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3H', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3I', NULL, NULL, 570),
('SN8913', 'MAX_Flex_PE', NULL, NULL, '3J', NULL, NULL, 570),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6A', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6B', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6C', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6D', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6E', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6F', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6G', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6H', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6I', NULL, NULL, 345),
('SN8913', 'Medium_Flex_E', NULL, NULL, '6J', NULL, NULL, 345),
('SN8943', '1_BAG_E', NULL, NULL, '8A', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8B', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8C', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8D', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8E', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8F', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8G', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8H', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8I', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '8J', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9A', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9B', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9C', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9D', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9E', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9F', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9G', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9H', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9I', NULL, NULL, 390),
('SN8943', '1_BAG_E', NULL, NULL, '9J', NULL, NULL, 390),
('SN8943', 'LIGHT_E', NULL, NULL, '10A', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10B', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10C', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10D', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10E', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10F', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10G', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10H', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10I', NULL, NULL, 330),
('SN8943', 'LIGHT_E', NULL, NULL, '10J', NULL, NULL, 330),
('SN8943', 'Low_Flex_B', NULL, NULL, '1J', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2A', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2B', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2C', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2D', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2E', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2F', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2G', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2H', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2I', NULL, NULL, 1280),
('SN8943', 'Low_Flex_B', NULL, NULL, '2J', NULL, NULL, 1280),
('SN8943', 'Low_Flex_E', NULL, NULL, '7A', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7B', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7C', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7D', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7E', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7F', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7G', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7H', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7I', NULL, NULL, 440),
('SN8943', 'Low_Flex_E', NULL, NULL, '7J', NULL, NULL, 440),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4A', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4B', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4C', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4D', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4E', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4F', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4G', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4H', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4I', NULL, NULL, 800),
('SN8943', 'Low_Flex_PE', NULL, NULL, '4J', NULL, NULL, 800),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1A', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1B', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1C', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1D', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1E', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1F', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1G', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1H', NULL, NULL, 1450),
('SN8943', 'MAX_Flex_B', NULL, NULL, '1I', NULL, NULL, 1450),
('SN8943', 'Max_Flex_E', NULL, NULL, '5A', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5B', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5C', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5D', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5E', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5F', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5G', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5H', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5I', NULL, NULL, 600),
('SN8943', 'Max_Flex_E', NULL, NULL, '5J', NULL, NULL, 600),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3A', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3B', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3C', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3D', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3E', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3F', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3G', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3H', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3I', NULL, NULL, 890),
('SN8943', 'MAX_Flex_PE', NULL, NULL, '3J', NULL, NULL, 890),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6A', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6B', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6C', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6D', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6E', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6F', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6G', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6H', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6I', NULL, NULL, 505),
('SN8943', 'Medium_Flex_E', NULL, NULL, '6J', NULL, NULL, 505);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `id` int(11) NOT NULL,
  `tax` double NOT NULL,
  `booking_date` datetime NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`id`, `tax`, `booking_date`, `user_email`, `type`) VALUES
(1, 10, '2020-12-21 19:43:19', 'johnwill@abc.com', 'one-way');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `email` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `birthdate` date NOT NULL,
  `passport_number` varchar(45) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone_number` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`email`, `first_name`, `last_name`, `birthdate`, `passport_number`, `address`, `password`, `phone_number`) VALUES
('johnwill@abc.com', 'John', 'Will', '1995-10-01', 'M3245671', 'Will Cottage, 23 Baker Street, Los Angeles, 90045', 'john123', 234543200),
('marymark@abc.com', 'Mary', 'Mark', '1990-06-17', 'G2098761', 'Mark Cottage, 19 Luther Street, Zaventem, 1930', 'mary123', 487234981);

-- --------------------------------------------------------

--
-- Table structure for table `wifi_onboard_service`
--

CREATE TABLE `wifi_onboard_service` (
  `wifi_onboard_service_bandwidth_MB` double NOT NULL,
  `airline_service_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wifi_onboard_service`
--

INSERT INTO `wifi_onboard_service` (`wifi_onboard_service_bandwidth_MB`, `airline_service_title`) VALUES
(20, 'WiFi_Basic'),
(200, 'WiFi_High'),
(50, 'WiFi_Medium');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`icao_code`);

--
-- Indexes for table `airline_service`
--
ALTER TABLE `airline_service`
  ADD PRIMARY KEY (`title`,`airline_icao_code`),
  ADD KEY `service_airline_icao_code` (`airline_icao_code`);

--
-- Indexes for table `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`iata_code`),
  ADD KEY `city_zip_code` (`city_zip_code`);

--
-- Indexes for table `baggage_policy`
--
ALTER TABLE `baggage_policy`
  ADD PRIMARY KEY (`title`,`airline_icao_code`),
  ADD KEY `baggage_airline_icao_code` (`airline_icao_code`);

--
-- Indexes for table `cabin_class`
--
ALTER TABLE `cabin_class`
  ADD PRIMARY KEY (`title`,`airline_icao_code`),
  ADD KEY `airline_icao_code` (`airline_icao_code`);

--
-- Indexes for table `cancellation_policy`
--
ALTER TABLE `cancellation_policy`
  ADD PRIMARY KEY (`title`,`airline_icao_code`),
  ADD KEY `cancellation_policy_title` (`title`),
  ADD KEY `cancelation_airline_icao_code` (`airline_icao_code`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_zipcode`),
  ADD KEY `city_lies_in_country` (`country_iso_code`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_iso_code`);

--
-- Indexes for table `direct_flight`
--
ALTER TABLE `direct_flight`
  ADD PRIMARY KEY (`flight_number`),
  ADD KEY `departure_airport_iata_code` (`departure_airport_iata_code`),
  ADD KEY `arriving_airport_iata_code` (`arriving_airport_iata_code`),
  ADD KEY `flight_number` (`flight_number`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`number`),
  ADD KEY `flight_icao_code` (`airline_icao_code`) USING BTREE;

--
-- Indexes for table `flight_package`
--
ALTER TABLE `flight_package`
  ADD PRIMARY KEY (`title`,`cabin_class_title`),
  ADD KEY `cabin_class_title` (`cabin_class_title`),
  ADD KEY `baggage_policy_title` (`baggage_policy_title`),
  ADD KEY `cancelation_policy_title` (`cancelation_policy_title`);

--
-- Indexes for table `non_direct_flight`
--
ALTER TABLE `non_direct_flight`
  ADD KEY `non_direct_flight_number` (`flight_number`),
  ADD KEY `direct_flight_number` (`subflight_number`);

--
-- Indexes for table `package_service`
--
ALTER TABLE `package_service`
  ADD PRIMARY KEY (`flight_package_title`,`airline_service_title`),
  ADD KEY `airline_service_title` (`airline_service_title`),
  ADD KEY `fare_title` (`flight_package_title`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_number`,`flight_number`),
  ADD KEY `driect_flight_number` (`flight_number`);

--
-- Indexes for table `special_meal_type`
--
ALTER TABLE `special_meal_type`
  ADD PRIMARY KEY (`airline_service_title`),
  ADD KEY `airline_service_title` (`airline_service_title`);

--
-- Indexes for table `stopping`
--
ALTER TABLE `stopping`
  ADD PRIMARY KEY (`airport_iatacode`,`flight_number`),
  ADD KEY `nondirect_flight_stop_airport_iatacode` (`airport_iatacode`) USING BTREE,
  ADD KEY `nondirect_flight_stop_flight_number` (`flight_number`) USING BTREE;

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`flight_number`,`package_title`,`seat_number`),
  ADD KEY `flight_number` (`flight_number`),
  ADD KEY `fare_title` (`package_title`),
  ADD KEY `seat_number` (`seat_number`),
  ADD KEY `trip_id` (`trip_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `wifi_onboard_service`
--
ALTER TABLE `wifi_onboard_service`
  ADD PRIMARY KEY (`airline_service_title`),
  ADD KEY `airline_service_title` (`airline_service_title`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `airline_service`
--
ALTER TABLE `airline_service`
  ADD CONSTRAINT `service_airline_icao_code` FOREIGN KEY (`airline_icao_code`) REFERENCES `airline` (`icao_code`);

--
-- Constraints for table `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `city_zip_code` FOREIGN KEY (`city_zip_code`) REFERENCES `city` (`city_zipcode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baggage_policy`
--
ALTER TABLE `baggage_policy`
  ADD CONSTRAINT `baggage_airline_icao_code` FOREIGN KEY (`airline_icao_code`) REFERENCES `airline` (`icao_code`);

--
-- Constraints for table `cabin_class`
--
ALTER TABLE `cabin_class`
  ADD CONSTRAINT `airline_icao_code_cabinclass` FOREIGN KEY (`airline_icao_code`) REFERENCES `airline` (`icao_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cancellation_policy`
--
ALTER TABLE `cancellation_policy`
  ADD CONSTRAINT `cancelation_airline_icao_code` FOREIGN KEY (`airline_icao_code`) REFERENCES `airline` (`icao_code`);

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_lies_in_country` FOREIGN KEY (`country_iso_code`) REFERENCES `country` (`country_iso_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `direct_flight`
--
ALTER TABLE `direct_flight`
  ADD CONSTRAINT `arriving_airport_iata_code` FOREIGN KEY (`arriving_airport_iata_code`) REFERENCES `airport` (`iata_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `departure_airport_iata_code` FOREIGN KEY (`departure_airport_iata_code`) REFERENCES `airport` (`iata_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `airline_icao_code` FOREIGN KEY (`airline_icao_code`) REFERENCES `airline` (`icao_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flight_package`
--
ALTER TABLE `flight_package`
  ADD CONSTRAINT `baggage_policy_title_fare` FOREIGN KEY (`baggage_policy_title`) REFERENCES `baggage_policy` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cancelation_policy_title_fare` FOREIGN KEY (`cancelation_policy_title`) REFERENCES `cancellation_policy` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `non_direct_flight`
--
ALTER TABLE `non_direct_flight`
  ADD CONSTRAINT `direct_flight_number` FOREIGN KEY (`subflight_number`) REFERENCES `flight` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `non_direct_flight_number` FOREIGN KEY (`flight_number`) REFERENCES `flight` (`number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `package_service`
--
ALTER TABLE `package_service`
  ADD CONSTRAINT `airline_service_title_constraint` FOREIGN KEY (`airline_service_title`) REFERENCES `airline_service` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fare_tittle_constraint` FOREIGN KEY (`flight_package_title`) REFERENCES `flight_package` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `fight_number` FOREIGN KEY (`flight_number`) REFERENCES `flight` (`number`);

--
-- Constraints for table `special_meal_type`
--
ALTER TABLE `special_meal_type`
  ADD CONSTRAINT `airline_service_title` FOREIGN KEY (`airline_service_title`) REFERENCES `airline_service` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stopping`
--
ALTER TABLE `stopping`
  ADD CONSTRAINT `nondirect_flight_stop_airport_iatacode` FOREIGN KEY (`airport_iatacode`) REFERENCES `airport` (`iata_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nondirect_flight_stop_flight_number` FOREIGN KEY (`flight_number`) REFERENCES `flight` (`number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fare_title` FOREIGN KEY (`package_title`) REFERENCES `flight_package` (`title`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flight_number` FOREIGN KEY (`flight_number`) REFERENCES `flight` (`number`),
  ADD CONSTRAINT `trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `user_email` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`);

--
-- Constraints for table `wifi_onboard_service`
--
ALTER TABLE `wifi_onboard_service`
  ADD CONSTRAINT `airline_service_title_wifi` FOREIGN KEY (`airline_service_title`) REFERENCES `airline_service` (`title`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
