-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:05
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `school`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `classID` varchar(5) NOT NULL,
  `schoolYear` int(11) DEFAULT NULL,
  `eduformID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculumID` int(11) NOT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `eduformID` int(11) DEFAULT NULL,
  `schoolYear` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `isTheory` tinyint(1) DEFAULT NULL,
  `isPractice` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `department`
--

CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentAllocationID` int(11) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `headOfDepartment` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `departmentallocation`
--

CREATE TABLE `departmentallocation` (
  `departmentAllocationID` int(11) NOT NULL,
  `teacherID` varchar(10) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `formofeducation`
--

CREATE TABLE `formofeducation` (
  `eduformID` int(11) NOT NULL,
  `curriculumID` int(11) DEFAULT NULL,
  `classID` varchar(5) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `regularClass` tinyint(1) DEFAULT NULL,
  `eveningClass` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gradelist`
--

CREATE TABLE `gradelist` (
  `gradelistID` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `schoolYear` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parent`
--

CREATE TABLE `parent` (
  `parentID` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `siblinglist`
--

CREATE TABLE `siblinglist` (
  `siblinglistID` int(11) NOT NULL,
  `studentID` int(11) DEFAULT NULL,
  `siblingID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `classID` varchar(5) DEFAULT NULL,
  `gradelistID` int(11) DEFAULT NULL,
  `parentID` int(11) DEFAULT NULL,
  `siblinglistID` int(11) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `function` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject`
--

CREATE TABLE `subject` (
  `subjectID` int(11) NOT NULL,
  `teachinggroupID` int(11) DEFAULT NULL,
  `subjectlistID` int(11) DEFAULT NULL,
  `curriculumID` int(11) DEFAULT NULL,
  `gradelistID` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `classroom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subjectlist`
--

CREATE TABLE `subjectlist` (
  `subjectListID` int(11) NOT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `teacherID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` varchar(10) NOT NULL,
  `departmentallocationID` int(11) DEFAULT NULL,
  `subjectlistID` int(11) DEFAULT NULL,
  `firstName` varchar(20) DEFAULT NULL,
  `lastName` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `valueUnits` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teachinggroup`
--

CREATE TABLE `teachinggroup` (
  `teachingGroupID` int(11) NOT NULL,
  `subjectID` int(11) DEFAULT NULL,
  `factor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`classID`),
  ADD KEY `eduformID` (`eduformID`);

--
-- Indizes für die Tabelle `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculumID`);

--
-- Indizes für die Tabelle `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentID`),
  ADD KEY `departmentAllocationID` (`departmentAllocationID`);

--
-- Indizes für die Tabelle `departmentallocation`
--
ALTER TABLE `departmentallocation`
  ADD PRIMARY KEY (`departmentAllocationID`);

--
-- Indizes für die Tabelle `formofeducation`
--
ALTER TABLE `formofeducation`
  ADD PRIMARY KEY (`eduformID`),
  ADD KEY `curriculumID` (`curriculumID`);

--
-- Indizes für die Tabelle `gradelist`
--
ALTER TABLE `gradelist`
  ADD PRIMARY KEY (`gradelistID`);

--
-- Indizes für die Tabelle `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`parentID`);

--
-- Indizes für die Tabelle `siblinglist`
--
ALTER TABLE `siblinglist`
  ADD PRIMARY KEY (`siblinglistID`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `classID` (`classID`),
  ADD KEY `gradelistID` (`gradelistID`),
  ADD KEY `parentID` (`parentID`),
  ADD KEY `siblinglistID` (`siblinglistID`);

--
-- Indizes für die Tabelle `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectID`),
  ADD KEY `teachinggroupID` (`teachinggroupID`),
  ADD KEY `subjectlistID` (`subjectlistID`),
  ADD KEY `curriculumID` (`curriculumID`),
  ADD KEY `gradelistID` (`gradelistID`);

--
-- Indizes für die Tabelle `subjectlist`
--
ALTER TABLE `subjectlist`
  ADD PRIMARY KEY (`subjectListID`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`),
  ADD KEY `departmentallocationID` (`departmentallocationID`),
  ADD KEY `subjectlistID` (`subjectlistID`);

--
-- Indizes für die Tabelle `teachinggroup`
--
ALTER TABLE `teachinggroup`
  ADD PRIMARY KEY (`teachingGroupID`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`eduformID`) REFERENCES `formofeducation` (`eduformID`);

--
-- Constraints der Tabelle `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`departmentAllocationID`) REFERENCES `departmentallocation` (`departmentAllocationID`);

--
-- Constraints der Tabelle `formofeducation`
--
ALTER TABLE `formofeducation`
  ADD CONSTRAINT `formofeducation_ibfk_1` FOREIGN KEY (`curriculumID`) REFERENCES `curriculum` (`curriculumID`);

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`gradelistID`) REFERENCES `gradelist` (`gradelistID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`parentID`) REFERENCES `parent` (`parentID`),
  ADD CONSTRAINT `student_ibfk_4` FOREIGN KEY (`siblinglistID`) REFERENCES `siblinglist` (`siblinglistID`);

--
-- Constraints der Tabelle `subject`
--
ALTER TABLE `subject`
  ADD CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`teachinggroupID`) REFERENCES `teachinggroup` (`teachingGroupID`),
  ADD CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`subjectlistID`) REFERENCES `subjectlist` (`subjectListID`),
  ADD CONSTRAINT `subject_ibfk_3` FOREIGN KEY (`curriculumID`) REFERENCES `curriculum` (`curriculumID`),
  ADD CONSTRAINT `subject_ibfk_4` FOREIGN KEY (`gradelistID`) REFERENCES `gradelist` (`gradelistID`);

--
-- Constraints der Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`departmentallocationID`) REFERENCES `departmentallocation` (`departmentAllocationID`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`subjectlistID`) REFERENCES `subjectlist` (`subjectListID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
