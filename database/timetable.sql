-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 08:33 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `timetable`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user_id`, `user_name`, `password`, `eid`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contactus`
--

INSERT INTO `contactus` (`id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'Navinder', 'navinder@gmail.com', 'jhkkkj', 'gfghghhjj'),
(2, 'Leerwinash', 'winash451@gmail.com', 'hlo', 'hey');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `department_name`) VALUES
(22, 'DBM'),
(23, 'DIT');

-- --------------------------------------------------------

--
-- Table structure for table `room table`
--

CREATE TABLE `room table` (
  `room_no` varchar(50) CHARACTER SET utf16 NOT NULL,
  `capacity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room table`
--

INSERT INTO `room table` (`room_no`, `capacity`) VALUES
('CL2 ASB LVL 1', 25),
('Biomedical Lab 2 (ASB Lvl 2)', 30),
('Computer Lab 1 (ASB Lvl 2)', 25),
('Biomedical Lab 2 (ASB Lvl 2)', 30),
('SR2 TTS Lvl 2', 20),
('CL3', 25),
('LR7', 50);

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `sem_id` varchar(11) NOT NULL,
  `semester_name` varchar(20) DEFAULT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`sem_id`, `semester_name`, `department_id`) VALUES
('1', '202107', 23),
('1st', '202107', 22),
('2', '202108', 23),
('2nd', '202108', 22),
('3', '202109', 23),
('3rd', '202109', 22),
('4', '202110', 23),
('4th', '202110', 22),
('5', '202111', 23),
('5th', '202111', 22),
('6', '202112', 23),
('6th', '202112', 22);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `department_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `dob` date NOT NULL,
  `pic` varchar(255) NOT NULL,
  `gender` enum('f','m') NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stu_id`, `name`, `eid`, `password`, `mob`, `address`, `department_id`, `sem_id`, `dob`, `pic`, `gender`, `status`, `date`) VALUES
(1, 'Navinder', 'singhnavinder22@gmail.com', 'navinder123', 188714569, 'Malaysia', 0, 1, '1995-07-22', '20141011_164534-1.jpg', 'm', 'ON', '2021-07-22'),
(2, 'leerwinash', 'winash451@gmail.com', 'leerwinash123', 134552172, 'Bangladesh', 23, 1, '1994-12-29', '20151118_105435.jpg', 'm', 'ON', '2021-07-22'),
(3, 'Nandni', 'nandni22@gmail.com', 'nandni123', 12212133, 'Malaysia', 23, 2, '1995-07-11', 'DSC_0015_1.JPG', 'f', 'OFF', '2021-08-22'),
(4, 'Japleen', 'japleen@gmail.com', 'japleen123', 188713282, 'Malaysia', 23, 2, '1999-12-06', '20151118_105529.jpg', 'f', 'OFF', '2021-08-22'),
(5, 'Ria', 'ria@gmail.com', 'ria123', 128282828, 'Malaysia', 23, 3, '1997-12-02', '20151118_000454.jpg', 'f', 'OFF', '2021-09-22'),
(6, 'Neha', 'neha@gmail.com', 'neha123', 128282829, 'Malaysia', 23, 4, '1994-12-05', 'DSC_0033.JPG', 'f', 'OFF', '2021-09-22'),
(7, 'Parul', 'parul@gmail.com', 'parul123', 1292929292, 'Malaysia', 22, 5, '1993-12-01', 'DSC_0042.JPG', 'f', 'ON', '2021-10-22'),
(9, 'Rakesh', 'rakesh@gmail.com', 'rakesh123', 1939299292, 'Shimla', 22, 6, '0091-12-02', 'DSC_0048.JPG', 'm', 'OFF', '2021-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `sem_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `credit hours` varchar(255) NOT NULL,
  `Type` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `sem_id`, `department_id`, `credit hours`, `Type`) VALUES
(1, 'Introduction to IT', 1, 23, '3', 'Lab'),
(2, 'Computer Organization', 1, 23, '3', 'Lab'),
(3, 'Fundamentals of Programming', 1, 23, '4', 'Lab'),
(4, 'PC Maintenance', 1, 23, '3', 'Lab'),
(5, 'Introduction to Information System', 1, 23, '3', 'Lab'),
(6, 'Data Structures and Algorithms', 2, 23, '4', 'Lab'),
(8, 'Discrete Mathematics', 2, 23, '4', 'Lab'),
(10, 'Multimedia Technology', 2, 23, '4', 'Lab'),
(11, 'Data Communication and Networking', 3, 23, '3', 'Lab'),
(12, 'Object-Oriented Programming', 3, 23, '4', 'Lab'),
(14, 'Database Management System', 3, 23, '4', 'Lab'),
(15, 'Web Design', 4, 23, '4', 'Lab'),
(16, 'Mobile Computing', 4, 23, '4', 'Lab'),
(17, 'System Analysis and Design', 4, 23, '4', 'Lab'),
(18, 'Operating Systems', 4, 23, '4', 'Lab'),
(19, 'Visual Programming', 4, 23, '4', 'Theory'),
(20, 'Information Technology Project', 4, 23, '6', 'Theory'),
(22, 'Practical English 1 ', 4, 23, '3', 'Theory'),
(24, 'Practical English 2', 4, 23, '3', 'Theory'),
(25, 'Penghayatan Etika dan Peradaban', 5, 23, '4', 'Theory'),
(26, 'Interpersonal Communication Skills /Bahasa Kebangs', 5, 23, '4', 'Theory'),
(28, 'Study of Moral & Ethics', 5, 23, '2', 'Theory'),
(29, 'Community Service', 6, 23, '2', 'Theory'),
(39, 'Intro to Business ', 6, 22, '3', 'Theory'),
(40, 'Mobile Management', 6, 22, '4', 'Theory'),
(42, 'Database Management ', 1, 23, '4', ''),
(43, 'Introduction to IT', 1, 23, '3', ''),
(44, 'Computer Organizatio', 2, 23, '3', ''),
(45, 'Fundamentals of Prog', 3, 23, '4', ''),
(46, 'PC Maintenance', 4, 23, '3', ''),
(47, 'Introduction to Info', 6, 23, '3', ''),
(48, 'Data Structures and ', 7, 23, '4', ''),
(50, 'Discrete Mathematics', 9, 23, '4', ''),
(52, 'Multimedia Technolog', 11, 23, '4', ''),
(53, 'Data Communication a', 12, 23, '3', ''),
(54, 'Object-Oriented Prog', 1, 23, '4', ''),
(56, 'Database Management ', 1, 23, '4', ''),
(57, 'Introduction to IT', 1, 23, '3', ''),
(58, 'Computer Organizatio', 2, 23, '3', ''),
(59, 'Fundamentals of Prog', 3, 23, '4', ''),
(60, 'PC Maintenance', 4, 23, '3', ''),
(61, 'Introduction to Info', 6, 23, '3', ''),
(62, 'Data Structures and ', 7, 23, '4', ''),
(64, 'Discrete Mathematics', 9, 23, '4', ''),
(66, 'Multimedia Technolog', 11, 23, '4', ''),
(67, 'Data Communication a', 12, 23, '3', ''),
(68, 'Object-Oriented Prog', 1, 23, '4', ''),
(70, 'Database Management ', 1, 23, '4', ''),
(71, 'Introduction to IT', 1, 23, '3', ''),
(72, 'Computer Organizatio', 2, 23, '3', ''),
(73, 'Fundamentals of Prog', 3, 23, '4', ''),
(74, 'PC Maintenance', 4, 23, '3', ''),
(75, 'Introduction to Info', 6, 23, '3', ''),
(76, 'Data Structures and ', 7, 23, '4', ''),
(78, 'Discrete Mathematics', 9, 23, '4', ''),
(80, 'Multimedia Technolog', 11, 23, '4', ''),
(81, 'Data Communication a', 12, 23, '3', ''),
(83, 'Introduction to IT', 1, 23, '3', ''),
(84, 'Computer Organizatio', 2, 23, '3', ''),
(85, 'Fundamentals of Prog', 3, 23, '4', ''),
(86, 'PC Maintenance', 4, 23, '3', ''),
(87, 'Introduction to Info', 6, 23, '3', ''),
(88, 'Data Structures and ', 7, 23, '4', ''),
(90, 'Discrete Mathematics', 9, 23, '4', ''),
(92, 'Multimedia Technolog', 11, 23, '4', ''),
(93, 'Data Communication a', 12, 23, '3', ''),
(94, 'Object-Oriented Prog', 1, 23, '4', ''),
(96, 'Database Management ', 1, 23, '4', ''),
(97, 'Introduction to IT', 1, 23, '3', ''),
(98, 'Computer Organizatio', 2, 23, '3', ''),
(99, 'Fundamentals of Prog', 3, 23, '4', ''),
(100, 'PC Maintenance', 4, 23, '3', ''),
(101, 'Introduction to Info', 6, 23, '3', ''),
(102, 'Data Structures and ', 7, 23, '4', ''),
(104, 'Discrete Mathematics', 9, 23, '4', ''),
(106, 'Multimedia Technolog', 11, 23, '4', ''),
(107, 'Data Communication a', 12, 23, '3', ''),
(108, 'Introduction to IT', 1, 23, '3', ''),
(109, 'Computer Organizatio', 2, 23, '3', ''),
(110, 'Fundamentals of Prog', 3, 23, '4', ''),
(111, 'PC Maintenance', 4, 23, '3', ''),
(112, 'Introduction to Info', 6, 23, '3', ''),
(113, 'Data Structures and ', 7, 23, '4', ''),
(115, 'Discrete Mathematics', 9, 23, '4', ''),
(117, 'Multimedia Technolog', 11, 23, '4', ''),
(118, 'Data Communication a', 12, 23, '3', ''),
(119, 'Object-Oriented Prog', 1, 23, '4', ''),
(121, 'Database Management ', 1, 23, '4', ''),
(122, 'Introduction to IT', 1, 23, '3', ''),
(123, 'Computer Organizatio', 2, 23, '3', ''),
(124, 'Fundamentals of Prog', 3, 23, '4', ''),
(125, 'PC Maintenance', 4, 23, '3', ''),
(126, 'Introduction to Info', 6, 23, '3', ''),
(127, 'Data Structures and ', 7, 23, '4', ''),
(129, 'Discrete Mathematics', 9, 23, '4', ''),
(131, 'Multimedia Technolog', 11, 23, '4', ''),
(132, 'Data Communication a', 12, 23, '3', '');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `eid` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `mob` bigint(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `sem_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `name`, `eid`, `password`, `mob`, `department_id`, `sem_id`, `status`, `date`) VALUES
(16, 'Ms.Ayu', 'ayu.norafida@qiu.edu.my', 'ayu123', 187858584, 23, 1, 'ON', '2016-05-22'),
(17, 'Mr.Ibrahim', 'muhammad.gobi@qiu.edu.my', 'gobi123', 192929292, 23, 1, 'ON', '2016-05-22'),
(18, 'Ms.Ainun', 'ainunsyakirah.mohdradzi@qiu.edu.my ', 'ainun123', 192929292, 23, 2, 'OFF', '2016-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `timeschedule`
--

CREATE TABLE `timeschedule` (
  `timeschedule_id` int(11) NOT NULL,
  `department_name` varchar(20) DEFAULT NULL,
  `semester_name` varchar(20) DEFAULT NULL,
  `subject_name` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `date` varchar(40) DEFAULT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeschedule`
--

INSERT INTO `timeschedule` (`timeschedule_id`, `department_name`, `semester_name`, `subject_name`, `time`, `date`, `teacher_id`) VALUES
(1, '22', '202107', '1', '01:00', '2016-12-01', 16),
(2, '22', '202107', '2', '02:00', '2016-12-01', 17),
(3, '22', '202107', '3', '03:00', '2016-12-01', 18),
(5, '22', '202107', '6', '02:00', '2016-12-01', 16),
(6, '22', '202107', '7', '03:00', '2016-12-02', 16),
(7, '22', '202107', '8', '03:00', '2016-12-02', 17),
(8, '22', '202107', '11', '10:00', '2016-12-01', 16),
(9, '22', '202107', '12', '09:00', '2016-12-02', 16),
(10, '22', '202107', '13', '02:00', '2016-11-02', 16),
(11, '22', '202107', '14', '04:00', '2016-11-03', 16);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `eid` (`eid`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);
ALTER TABLE `department` ADD FULLTEXT KEY `course_name` (`department_name`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sem_id`),
  ADD UNIQUE KEY `sem_id` (`sem_id`),
  ADD KEY `course_id` (`department_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stu_id`),
  ADD UNIQUE KEY `eid` (`eid`);
ALTER TABLE `student` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`),
  ADD KEY `course_id` (`department_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `eid` (`eid`);
ALTER TABLE `teacher` ADD FULLTEXT KEY `name` (`name`);

--
-- Indexes for table `timeschedule`
--
ALTER TABLE `timeschedule`
  ADD PRIMARY KEY (`timeschedule_id`),
  ADD KEY `teacher_id` (`teacher_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `timeschedule`
--
ALTER TABLE `timeschedule`
  MODIFY `timeschedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE;

--
-- Constraints for table `timeschedule`
--
ALTER TABLE `timeschedule`
  ADD CONSTRAINT `timeschedule_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
