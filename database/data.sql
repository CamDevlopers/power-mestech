-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2016 at 07:22 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `power`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_equipments`
--

CREATE TABLE `tbl_equipments` (
  `eid` int(11) NOT NULL,
  `etype` int(11) DEFAULT NULL COMMENT 'type = 1 is lamp, type = 2 is air, type = 3 is white door, type = 4 is red door',
  `ename` varchar(100) DEFAULT NULL,
  `eremote` int(11) DEFAULT '0',
  `eremoter` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_equipments`
--

INSERT INTO `tbl_equipments` (`eid`, `etype`, `ename`, `eremote`, `eremoter`, `rid`) VALUES
(1, 1, 'អំពូល', 0, 0, 1),
(2, 2, 'ម.ត្រជាក់', 0, 0, 1),
(3, 3, 'ទ្វារ ស', 0, 0, 1),
(4, 4, 'ទ្វារ ក្រហម', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_floors`
--

CREATE TABLE `tbl_floors` (
  `fid` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_floors`
--

INSERT INTO `tbl_floors` (`fid`, `fname`) VALUES
(1, 'ជាន់ទី៥');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rooms`
--

CREATE TABLE `tbl_rooms` (
  `rid` int(11) NOT NULL,
  `rname` varchar(400) DEFAULT NULL,
  `fid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rooms`
--

INSERT INTO `tbl_rooms` (`rid`, `rname`, `fid`) VALUES
(1, 'បន្ទប់ G05-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `uid` int(11) NOT NULL,
  `uname` varchar(45) DEFAULT NULL,
  `uauthename` varchar(45) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`uid`, `uname`, `uauthename`, `password`) VALUES
(1, 'Vannakpanha', 'admin', 'fcea920f7412b5da7be0cf42b8c93759');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_equipments`
--
ALTER TABLE `tbl_equipments`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `fk_tbl_equipments_tbl_rooms1_idx` (`rid`);

--
-- Indexes for table `tbl_floors`
--
ALTER TABLE `tbl_floors`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  ADD PRIMARY KEY (`rid`),
  ADD KEY `fk_tbl_rooms_tbl_floors_idx` (`fid`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_equipments`
--
ALTER TABLE `tbl_equipments`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbl_floors`
--
ALTER TABLE `tbl_floors`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_equipments`
--
ALTER TABLE `tbl_equipments`
  ADD CONSTRAINT `fk_tbl_equipments_tbl_rooms1` FOREIGN KEY (`rid`) REFERENCES `tbl_rooms` (`rid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_rooms`
--
ALTER TABLE `tbl_rooms`
  ADD CONSTRAINT `fk_tbl_rooms_tbl_floors` FOREIGN KEY (`fid`) REFERENCES `tbl_floors` (`fid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
