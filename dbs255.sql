-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 07 Maj 2025, 21:01
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
-- Struktura tabeli dla tabeli `rest_klienci`
--

CREATE TABLE `rest_klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(255) DEFAULT NULL,
  `nazwisko` varchar(255) DEFAULT NULL,
  `numer_tel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rest_klienci`
--

INSERT INTO `rest_klienci` (`id_klienta`, `imie`, `nazwisko`, `numer_tel`) VALUES
(1, 'Jan', 'Kowalski', '123-456-789'),
(2, 'Anna', 'Nowak', '234-567-890'),
(3, 'Piotr', 'Wiśniewski', '345-678-901'),
(4, 'Katarzyna', 'Wójcik', '456-789-012'),
(5, 'Tomasz', 'Kowalczyk', '567-890-123'),
(6, 'Magdalena', 'Kamińska', '678-901-234'),
(7, 'Michał', 'Lewandowski', '789-012-345'),
(8, 'Agnieszka', 'Zielińska', '890-123-456'),
(9, 'Paweł', 'Szymański', '901-234-567'),
(10, 'Ewa', 'Dąbrowska', '012-345-678');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rest_menu`
--

CREATE TABLE `rest_menu` (
  `id_pozycji` int(11) NOT NULL,
  `nazwa_pozycji` varchar(255) DEFAULT NULL,
  `cena` float DEFAULT NULL,
  `kategoria` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rest_menu`
--

INSERT INTO `rest_menu` (`id_pozycji`, `nazwa_pozycji`, `cena`, `kategoria`) VALUES
(1, 'Pizza Margherita', 25.99, 'Pizza'),
(2, 'Pizza Pepperoni', 29.5, 'Pizza'),
(3, 'Spaghetti Carbonara', 27, 'Makaron'),
(4, 'Lasagna', 30, 'Makaron'),
(5, 'Burger Klasyczny', 22.9, 'Burger'),
(6, 'Burger z kurczakiem', 26.5, 'Burger'),
(7, 'Zupa Pomidorowa', 12, 'Zupy'),
(8, 'Sałatka Cezar', 19.99, 'Sałatki'),
(9, 'Deser Tiramisu', 15, 'Desery'),
(10, 'Lemoniada Cytrynowa', 8.5, 'Napoje');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rest_zamowienia`
--

CREATE TABLE `rest_zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_klienta` int(11) DEFAULT NULL,
  `id_pozycji` int(11) DEFAULT NULL,
  `data_zamowienia` date DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rest_zamowienia`
--

INSERT INTO `rest_zamowienia` (`id_zamowienia`, `id_klienta`, `id_pozycji`, `data_zamowienia`, `ilosc`) VALUES
(1, 3, 7, '2025-05-06', 4),
(2, 5, 5, '2025-03-26', 2),
(3, 1, 2, '2025-04-13', 5),
(4, 8, 1, '2025-04-23', 5),
(5, 3, 4, '2025-04-11', 3),
(6, 10, 6, '2025-03-10', 5),
(7, 5, 8, '2025-03-31', 3),
(8, 10, 5, '2025-05-06', 1),
(9, 7, 4, '2025-04-01', 1),
(10, 7, 3, '2025-03-12', 5),
(11, 2, 5, '2025-04-23', 2),
(12, 4, 6, '2025-04-05', 3),
(13, 10, 2, '2025-03-09', 1),
(14, 5, 2, '2025-03-09', 1),
(15, 2, 10, '2025-04-17', 3),
(16, 4, 9, '2025-04-28', 1),
(17, 9, 7, '2025-03-29', 3),
(18, 9, 3, '2025-05-04', 3),
(19, 9, 5, '2025-04-04', 5),
(20, 7, 4, '2025-04-07', 5),
(21, 1, 5, '2025-04-02', 5),
(22, 8, 4, '2025-03-22', 4),
(23, 6, 10, '2025-03-30', 5),
(24, 8, 3, '2025-04-15', 2),
(25, 9, 9, '2025-03-29', 4),
(26, 9, 9, '2025-03-29', 3),
(27, 4, 4, '2025-04-02', 1),
(28, 1, 3, '2025-03-27', 2),
(29, 4, 6, '2025-04-03', 1),
(30, 9, 9, '2025-04-29', 1),
(31, 4, 3, '2025-04-29', 4),
(32, 1, 2, '2025-03-14', 5),
(33, 1, 4, '2025-03-25', 2),
(34, 1, 10, '2025-03-24', 2),
(35, 5, 8, '2025-03-21', 4),
(36, 4, 7, '2025-03-20', 3),
(37, 9, 8, '2025-03-19', 4),
(38, 10, 1, '2025-04-06', 3),
(39, 2, 3, '2025-03-15', 5),
(40, 2, 6, '2025-04-12', 3),
(41, 3, 10, '2025-03-28', 5),
(42, 8, 9, '2025-03-18', 3),
(43, 7, 2, '2025-04-08', 3),
(44, 10, 6, '2025-04-27', 2),
(45, 2, 3, '2025-04-20', 2),
(46, 1, 7, '2025-04-18', 4),
(47, 6, 1, '2025-03-13', 5),
(48, 2, 7, '2025-03-17', 4),
(49, 6, 2, '2025-03-11', 3),
(50, 6, 8, '2025-04-10', 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `rest_klienci`
--
ALTER TABLE `rest_klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `rest_menu`
--
ALTER TABLE `rest_menu`
  ADD PRIMARY KEY (`id_pozycji`);

--
-- Indeksy dla tabeli `rest_zamowienia`
--
ALTER TABLE `rest_zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `id_klienta` (`id_klienta`),
  ADD KEY `id_pozycji` (`id_pozycji`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `rest_klienci`
--
ALTER TABLE `rest_klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rest_menu`
--
ALTER TABLE `rest_menu`
  MODIFY `id_pozycji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `rest_zamowienia`
--
ALTER TABLE `rest_zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `rest_zamowienia`
--
ALTER TABLE `rest_zamowienia`
  ADD CONSTRAINT `rest_zamowienia_ibfk_1` FOREIGN KEY (`id_klienta`) REFERENCES `rest_klienci` (`id_klienta`),
  ADD CONSTRAINT `rest_zamowienia_ibfk_2` FOREIGN KEY (`id_pozycji`) REFERENCES `rest_menu` (`id_pozycji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
