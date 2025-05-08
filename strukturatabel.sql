-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 08 Maj 2025, 22:22
-- Wersja serwera: 10.5.21-MariaDB-0+deb11u1
-- Wersja PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `dbs255`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy_okretow`
--

CREATE TABLE `klasy_okretow` (
  `typ` varchar(50) NOT NULL,
  `klasa` varchar(50) DEFAULT NULL,
  `kraj` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `klasy_okretow`
--

INSERT INTO `klasy_okretow` (`typ`, `klasa`, `kraj`) VALUES
('Bismarck', 'pancernik', 'Niemcy'),
('Clemson', 'niszczyciel', 'USA'),
('Dido', 'krazownik lekki', 'Wielka Brytania'),
('Fletcher', 'niszczyciel', 'USA'),
('Hipper', 'krazownik ciezki', 'Niemcy'),
('Iowa', 'pancernik', 'USA'),
('Kongo', 'krazownik liniowy', 'Japonia'),
('Mogami', 'krazownik ciezki', 'Japonia'),
('Revenge', 'pancernik', 'Wielka Brytania'),
('Yamato', 'pancernik', 'Japonia');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `okrety`
--

CREATE TABLE `okrety` (
  `id_okretu` int(11) NOT NULL,
  `nazwa` varchar(50) DEFAULT NULL,
  `typ` varchar(50) DEFAULT NULL,
  `rok_zwodzenia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `okrety`
--

INSERT INTO `okrety` (`id_okretu`, `nazwa`, `typ`, `rok_zwodzenia`) VALUES
(1, 'USS Missouri', 'Iowa', 1944),
(2, 'Yamato', 'Yamato', 1940),
(3, 'HMS Royal Oak', 'Revenge', 1914),
(4, 'USS Fletcher', 'Fletcher', 1942),
(5, 'IJN Kirishima', 'Kongo', 1915),
(6, 'Bismarck', 'Bismarck', 1939),
(7, 'Prinz Eugen', 'Hipper', 1938),
(8, 'HMS Dido', 'Dido', 1939),
(9, 'IJN Mogami', 'Mogami', 1934),
(10, 'USS Clemson', 'Clemson', 1919),
(11, 'USS Iowa', 'Iowa', 1942),
(12, 'Musashi', 'Yamato', 1941),
(13, 'HMS Revenge', 'Revenge', 1915),
(14, 'USS Nicholas', 'Fletcher', 1942),
(15, 'IJN Kongo', 'Kongo', 1913),
(16, 'Tirpitz', 'Bismarck', 1941),
(17, 'HMS Belfast', 'Dido', 1938),
(18, 'IJN Suzuya', 'Mogami', 1935),
(19, 'USS Russell', 'Clemson', 1918),
(20, 'IJN Haruna', 'Kongo', 1915);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `klasy_okretow`
--
ALTER TABLE `klasy_okretow`
  ADD PRIMARY KEY (`typ`);

--
-- Indeksy dla tabeli `okrety`
--
ALTER TABLE `okrety`
  ADD PRIMARY KEY (`id_okretu`),
  ADD KEY `typ` (`typ`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `okrety`
--
ALTER TABLE `okrety`
  ADD CONSTRAINT `okrety_ibfk_1` FOREIGN KEY (`typ`) REFERENCES `klasy_okretow` (`typ`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
