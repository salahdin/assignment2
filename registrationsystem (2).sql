-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2019 at 11:34 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registrationsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `M_ID` varchar(6) NOT NULL,
  `S_ID` int(8) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Mark` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `C_ID` varchar(6) NOT NULL,
  `CTitle` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courseregistration`
--

CREATE TABLE `courseregistration` (
  `S_ID` int(8) NOT NULL,
  `C_ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `delivers`
--

CREATE TABLE `delivers` (
  `M_ID` varchar(6) NOT NULL,
  `L_ID` int(8) NOT NULL,
  `Semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lecturer`
--

CREATE TABLE `lecturer` (
  `L_ID` int(8) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `M_ID` varchar(6) NOT NULL,
  `M_Name` varchar(20) NOT NULL,
  `Semester` int(1) NOT NULL,
  `C_ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moduleregistration`
--

CREATE TABLE `moduleregistration` (
  `M_ID` varchar(6) NOT NULL,
  `S_ID` int(8) NOT NULL,
  `Semester` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prerequisite`
--

CREATE TABLE `prerequisite` (
  `M_ID` varchar(6) NOT NULL,
  `P_ID` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `S_ID` int(8) NOT NULL,
  `DoB` date NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Age` int(2) NOT NULL,
  `Program` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`M_ID`,`S_ID`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`C_ID`);

--
-- Indexes for table `courseregistration`
--
ALTER TABLE `courseregistration`
  ADD PRIMARY KEY (`S_ID`,`C_ID`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `delivers`
--
ALTER TABLE `delivers`
  ADD PRIMARY KEY (`M_ID`,`L_ID`),
  ADD KEY `L_ID` (`L_ID`);

--
-- Indexes for table `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`L_ID`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`M_ID`),
  ADD KEY `M_ID` (`M_ID`,`M_Name`,`Semester`,`C_ID`),
  ADD KEY `C_ID` (`C_ID`);

--
-- Indexes for table `moduleregistration`
--
ALTER TABLE `moduleregistration`
  ADD PRIMARY KEY (`M_ID`,`S_ID`),
  ADD KEY `S_ID` (`S_ID`);

--
-- Indexes for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD PRIMARY KEY (`M_ID`,`P_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`S_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `assessment_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `module` (`M_ID`),
  ADD CONSTRAINT `assessment_ibfk_2` FOREIGN KEY (`S_ID`) REFERENCES `student` (`S_ID`);

--
-- Constraints for table `courseregistration`
--
ALTER TABLE `courseregistration`
  ADD CONSTRAINT `courseregistration_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `student` (`S_ID`),
  ADD CONSTRAINT `courseregistration_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `course` (`C_ID`);

--
-- Constraints for table `delivers`
--
ALTER TABLE `delivers`
  ADD CONSTRAINT `delivers_ibfk_1` FOREIGN KEY (`L_ID`) REFERENCES `lecturer` (`L_ID`),
  ADD CONSTRAINT `delivers_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `module` (`M_ID`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`C_ID`) REFERENCES `course` (`C_ID`);

--
-- Constraints for table `moduleregistration`
--
ALTER TABLE `moduleregistration`
  ADD CONSTRAINT `moduleregistration_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `student` (`S_ID`),
  ADD CONSTRAINT `moduleregistration_ibfk_2` FOREIGN KEY (`M_ID`) REFERENCES `module` (`M_ID`);

--
-- Constraints for table `prerequisite`
--
ALTER TABLE `prerequisite`
  ADD CONSTRAINT `prerequisite_ibfk_1` FOREIGN KEY (`M_ID`) REFERENCES `module` (`M_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
