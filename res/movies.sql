-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Erstellungszeit: 03. Jan 2021 um 15:28
-- Server-Version: 5.6.40
-- PHP-Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `moviebucketlist`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `movies`
--

CREATE TABLE `movies` (
  `Ranking` int(3) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Year` int(4) DEFAULT NULL,
  `RID` int(4) DEFAULT NULL,
  `Watched` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `movies`
--

INSERT INTO `movies` (`Ranking`, `Name`, `Year`, `RID`, `Watched`) VALUES
(1, 'Avengers: Endgame', 2019, 8004, 0),
(2, 'Avatar', 2009, 4529, 0),
(3, 'Titanic', 1997, 4623, 0),
(4, 'Wreck-It Ralph', 2012, 7805, 0),
(5, 'Avengers: Infinity War', 2018, 5334, 0),
(6, 'Jurassic World', 2015, 233, 0),
(7, 'The Lion King', 2019, 643, 0),
(8, 'Marvel\'s The Avengers', 2012, 5457, 0),
(9, 'WALL·E', 2008, 8941, 0),
(10, 'Frozen II', 2019, 892, 0),
(11, 'Avengers: Age of Ultron', 2015, 6982, 0),
(12, 'Black Panther', 2018, 7701, 0),
(13, 'Your Name.', 2016, 9682, 0),
(14, 'Schindler\'s List', 1993, 4311, 0),
(15, 'Jurassic World: Fallen Kingdom', 2018, 8190, 0),
(16, 'Frozen', 2013, 7209, 0),
(17, 'Beauty and the Beast', 2017, 3052, 0),
(18, 'Incredibles 2', 2018, 1423, 0),
(19, 'The King of Comedy', 1982, 8645, 0),
(20, 'Iron Man 3', 2013, 5885, 0),
(21, 'Minions', 2015, 1433, 1),
(22, 'Captain America: Civil War', 2016, 3263, 0),
(23, 'Aquaman', 2018, 3913, 0),
(24, 'Spirited Away', 2001, 7381, 0),
(25, 'Spider-Man: Far from Home', 2019, 7423, 0),
(26, 'Captain Marvel', 2019, 7941, 0),
(27, 'Pulp Fiction', 1994, 917, 0),
(28, 'Skyfall', 2012, 2052, 0),
(29, 'Transformers: Age of Extinction', 2014, 9905, 0),
(30, 'The Dark Knight Rises', 2012, 2932, 0),
(31, 'Joker', 2019, 5442, 0),
(32, 'Fight Club', 1999, 3840, 0),
(33, 'Toy Story 4', 2019, 1565, 0),
(34, 'Toy Story 3', 2010, 9943, 0),
(35, 'Pirates of the Caribbean: Dead Man\'s Chest', 2006, 4751, 0),
(36, 'Princess Mononoke', 1997, 2072, 0),
(37, 'Aladdin', 2019, 8843, 1),
(38, 'Pirates of the Caribbean: On Stranger Tides', 2011, 2268, 0),
(39, 'Despicable Me 3', 2017, 6690, 0),
(40, 'Jurassic Park', 1993, 7769, 0),
(41, 'Finding Dory', 2016, 4517, 0),
(42, 'Inception', 2010, 7810, 0),
(43, 'Alice in Wonderland', 2010, 2146, 0),
(44, 'Zootopia', 2016, 2291, 0),
(45, 'Interstellar', 2014, 5911, 0),
(46, 'The Shining', 1980, 9678, 0),
(47, 'The Dark Knight', 2008, 4678, 0),
(48, 'The Lion King', 1994, 8259, 0),
(49, 'Love, Simon', 2018, 6994, 0),
(50, 'Despicable Me 2', 2013, 1256, 0),
(51, 'The Jungle Book', 2016, 4453, 0),
(52, 'Jumanji: Welcome to the Jungle', 2017, 104, 0),
(53, 'Jojo Rabbit', 2019, 7179, 0),
(54, 'Full Metal Jacket', 1987, 3804, 0),
(55, 'Good Will Hunting', 1997, 3135, 0),
(56, 'The Truman Show', 1998, 2189, 0),
(57, 'The Wolf of Wall Street', 2013, 7382, 0),
(58, 'Finding Nemo', 2003, 6782, 0),
(59, 'Up', 2009, 9248, 0),
(60, 'Shrek 2', 2004, 318, 0),
(61, 'Toy Story 2', 1999, 8486, 0),
(62, 'Sherlock: The Abominable Bride', 2016, 8445, 0),
(63, 'Spider-Man 3', 2007, 7359, 0),
(64, 'Ghost in the Shell', 1995, 3128, 0),
(65, 'Ice Age: Dawn of the Dinosaurs', 2009, 593, 0),
(66, 'Spectre', 2015, 215, 0),
(67, 'Spider-Man: Homecoming', 2017, 9606, 0),
(68, 'The Breadwinner', 2017, 1992, 0),
(69, 'Ice Age: Continental Drift', 2012, 9766, 0),
(70, 'The Secret Life of Pets', 2016, 1151, 0),
(71, 'Batman v Superman: Dawn of Justice', 2016, 8678, 0),
(72, 'Wolf Warrior 2', 2017, 4752, 0),
(73, 'Holding the Man', 2015, 3814, 0),
(74, 'The Hunger Games: Catching Fire', 2013, 6664, 0),
(75, 'Guardians of the Galaxy Vol.2', 2017, 8964, 0),
(76, 'Inside Out', 2015, 928, 0),
(77, 'Venom', 2018, 1568, 0),
(78, 'Thor: Ragnarok', 2017, 8383, 0),
(79, 'Inception', 2010, 6234, 0),
(80, 'Titanic', 1997, 114, 0),
(81, 'The Boy in the Striped Pyjamas', 2008, 7727, 0),
(82, 'Spider-Man', 2002, 5028, 0),
(83, 'Wonder Woman', 2017, 7165, 0),
(84, 'Independence Day', 1996, 3843, 0),
(85, 'Fantastic Beasts and Where to Find Them', 2016, 6667, 0),
(86, 'Shrek the Third', 2007, 6127, 0),
(87, 'Toy Story', 1995, 8187, 1),
(88, 'Jumanji: The Next Level', 2019, 5412, 0),
(89, 'My Life as a Zucchini', 2016, 4779, 0),
(90, 'I Want to Eat Your Pancreas', 2018, 8147, 0),
(91, 'E.T. the Extra-Terrestrial', 1982, 9033, 0),
(92, '2012', 2009, 5092, 0),
(93, 'Midnight Sun', 2018, 2172, 0),
(94, 'Indiana Jones and the Kingdom of the Crystal Skull', 2008, 518, 0),
(95, 'Spider-Man 2', 2004, 8809, 0),
(96, 'Kiki\'s Delivery Service', 1989, 1176, 0),
(97, 'Deadpool 2', 2019, 4488, 0),
(98, 'Deadpool', 2016, 8563, 0),
(99, 'Citizenfour', 2014, 2598, 0),
(100, 'Guardians of the Galaxy', 2014, 1753, 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`Ranking`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `movies`
--
ALTER TABLE `movies`
  MODIFY `Ranking` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
