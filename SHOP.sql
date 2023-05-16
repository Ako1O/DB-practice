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
-- База данных: `SHOP`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ChekSale`
--

CREATE TABLE `ChekSale` (
  `ID_ChekSale` int NOT NULL,
  `ID_Sale` int DEFAULT NULL,
  `DateSale` date DEFAULT NULL,
  `TimeSale` time DEFAULT NULL,
  `SummaSale` float(10,2) DEFAULT '0.00',
  `WhoSale` char(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Firma`
--

CREATE TABLE `Firma` (
  `ID_Firma` int NOT NULL,
  `FirmName` char(200) DEFAULT NULL,
  `AboutFirm` text,
  `Adress` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `ForSale`
--

CREATE TABLE `ForSale` (
  `ID_FS` int NOT NULL,
  `ID_Tovar` int DEFAULT NULL,
  `NewPrice` float(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Триггеры `ForSale`
--
DELIMITER $$
CREATE TRIGGER `TRCHPrice` BEFORE UPDATE ON `ForSale` FOR EACH ROW BEGIN
INSERT INTO OldPrice SET
OldPrice.ID_Tovar=old.ID_Tovar,
OldPrice.OldPrice=old.NewPrice,
OldPrice.DateCHange=CURRENT_DATE,
OldPrice.WhoChange=CURRENT_USER;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `OldPrice`
--

CREATE TABLE `OldPrice` (
  `ID_OldPrice` int NOT NULL,
  `ID_Tovar` int DEFAULT NULL,
  `OldPrice` float(10,2) DEFAULT '0.00',
  `DataChange` date DEFAULT NULL,
  `WhoChange` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Sale`
--

CREATE TABLE `Sale` (
  `ID_Sale` int NOT NULL,
  `ID_Tovar` int DEFAULT NULL,
  `Kolvo` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Триггеры `Sale`
--
DELIMITER $$
CREATE TRIGGER `RTSale` AFTER INSERT ON `Sale` FOR EACH ROW BEGIN
INSERT INTO ChekSale SET
ChekSale.ID_Sale=new.ID_Sale,
ChekSale.DateSale=CURRENT_DATE,
ChekSale.TimeSale=CURRENT_TIME,
ChekSale.WhoSale=CURRENT_USER,
ChekSale.SummaSale=new.Kolvo*(SELECT ForSale.NewPrice FROM ForSale WHERE new.ID_Tovar=ForSale.ID_Tovar);

UPDATE Sklad SET Sklad.Ostatok=Sklad.Ostatok-new.Kolvo
WHERE Sklad.ID_Tovar=new.ID_Tovar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `Sklad`
--

CREATE TABLE `Sklad` (
  `ID_Sklad` int NOT NULL,
  `ID_Tovar` int DEFAULT NULL,
  `Ostatok` float(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Tovar`
--

CREATE TABLE `Tovar` (
  `ID_Tovar` int NOT NULL,
  `NameTovar` char(200) DEFAULT NULL,
  `ID_TypeTovar` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `TovarIN`
--

CREATE TABLE `TovarIN` (
  `ID_TovarIN` int NOT NULL,
  `ID_Firma` int DEFAULT NULL,
  `ID_Tovar` int DEFAULT NULL,
  `Cena` float(10,2) DEFAULT '0.00',
  `Kolvo` float(10,3) DEFAULT '0.000',
  `dataIN` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Триггеры `TovarIN`
--
DELIMITER $$
CREATE TRIGGER `TrSkladIn` AFTER INSERT ON `TovarIN` FOR EACH ROW BEGIN

IF new.id_tovar not in (SELECT sklad.Id_tovar FROM sklad) THEN
INSERT INTO Sklad SET Sklad.ID_Tovar=new.id_tovar, Sklad.Ostatok=new.kolvo;
ELSE

UPDATE Sklad SET Sklad.Ostatok=Sklad.Ostatok+new.kolvo
WHERE Sklad.ID_Tovar=new.ID_tovar;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `TypeTovar`
--

CREATE TABLE `TypeTovar` (
  `ID_TypeTovar` int NOT NULL,
  `NameTypeTovar` char(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ChekSale`
--
ALTER TABLE `ChekSale`
  ADD PRIMARY KEY (`ID_ChekSale`),
  ADD KEY `ID_Sale` (`ID_Sale`);

--
-- Индексы таблицы `Firma`
--
ALTER TABLE `Firma`
  ADD PRIMARY KEY (`ID_Firma`);

--
-- Индексы таблицы `ForSale`
--
ALTER TABLE `ForSale`
  ADD PRIMARY KEY (`ID_FS`),
  ADD KEY `ID_Tovar` (`ID_Tovar`);

--
-- Индексы таблицы `OldPrice`
--
ALTER TABLE `OldPrice`
  ADD PRIMARY KEY (`ID_OldPrice`),
  ADD KEY `ID_Tovar` (`ID_Tovar`);

--
-- Индексы таблицы `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`ID_Sale`),
  ADD KEY `ID_Tovar` (`ID_Tovar`);

--
-- Индексы таблицы `Sklad`
--
ALTER TABLE `Sklad`
  ADD PRIMARY KEY (`ID_Sklad`),
  ADD KEY `ID_Tovar` (`ID_Tovar`);

--
-- Индексы таблицы `Tovar`
--
ALTER TABLE `Tovar`
  ADD PRIMARY KEY (`ID_Tovar`),
  ADD KEY `ID_TypeTovar` (`ID_TypeTovar`);

--
-- Индексы таблицы `TovarIN`
--
ALTER TABLE `TovarIN`
  ADD PRIMARY KEY (`ID_TovarIN`),
  ADD KEY `ID_Firma` (`ID_Firma`),
  ADD KEY `ID_Tovar` (`ID_Tovar`);

--
-- Индексы таблицы `TypeTovar`
--
ALTER TABLE `TypeTovar`
  ADD PRIMARY KEY (`ID_TypeTovar`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ChekSale`
--
ALTER TABLE `ChekSale`
  MODIFY `ID_ChekSale` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Firma`
--
ALTER TABLE `Firma`
  MODIFY `ID_Firma` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ForSale`
--
ALTER TABLE `ForSale`
  MODIFY `ID_FS` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `OldPrice`
--
ALTER TABLE `OldPrice`
  MODIFY `ID_OldPrice` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Sale`
--
ALTER TABLE `Sale`
  MODIFY `ID_Sale` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Sklad`
--
ALTER TABLE `Sklad`
  MODIFY `ID_Sklad` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Tovar`
--
ALTER TABLE `Tovar`
  MODIFY `ID_Tovar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `TovarIN`
--
ALTER TABLE `TovarIN`
  MODIFY `ID_TovarIN` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `TypeTovar`
--
ALTER TABLE `TypeTovar`
  MODIFY `ID_TypeTovar` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ChekSale`
--
ALTER TABLE `ChekSale`
  ADD CONSTRAINT `cheksale_ibfk_1` FOREIGN KEY (`ID_Sale`) REFERENCES `Sale` (`ID_Sale`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ForSale`
--
ALTER TABLE `ForSale`
  ADD CONSTRAINT `forsale_ibfk_1` FOREIGN KEY (`ID_Tovar`) REFERENCES `Tovar` (`ID_Tovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `OldPrice`
--
ALTER TABLE `OldPrice`
  ADD CONSTRAINT `oldprice_ibfk_1` FOREIGN KEY (`ID_Tovar`) REFERENCES `Tovar` (`ID_Tovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`ID_Tovar`) REFERENCES `Tovar` (`ID_Tovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Sklad`
--
ALTER TABLE `Sklad`
  ADD CONSTRAINT `sklad_ibfk_1` FOREIGN KEY (`ID_Tovar`) REFERENCES `Tovar` (`ID_Tovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `Tovar`
--
ALTER TABLE `Tovar`
  ADD CONSTRAINT `tovar_ibfk_1` FOREIGN KEY (`ID_TypeTovar`) REFERENCES `TypeTovar` (`ID_TypeTovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `TovarIN`
--
ALTER TABLE `TovarIN`
  ADD CONSTRAINT `tovarin_ibfk_1` FOREIGN KEY (`ID_Firma`) REFERENCES `Firma` (`ID_Firma`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tovarin_ibfk_2` FOREIGN KEY (`ID_Tovar`) REFERENCES `Tovar` (`ID_Tovar`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
