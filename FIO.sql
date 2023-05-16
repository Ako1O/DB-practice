-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2022 г., 03:17
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FIO`
--

-- --------------------------------------------------------

--
-- Структура таблицы `fio`
--

CREATE TABLE `fio` (
  `ID_FIO` int NOT NULL,
  `FIO` char(20) DEFAULT NULL,
  `Surname` char(20) DEFAULT NULL,
  `Name` char(20) DEFAULT NULL,
  `MidName` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `fio`
--

INSERT INTO `fio` (`ID_FIO`, `FIO`, `Surname`, `Name`, `MidName`) VALUES
(1, 'Иванов Иван Иванович', NULL, NULL, NULL),
(2, 'Ильяс Ильявич Илув', NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `fio`
--
ALTER TABLE `fio`
  ADD PRIMARY KEY (`ID_FIO`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `fio`
--
ALTER TABLE `fio`
  MODIFY `ID_FIO` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
