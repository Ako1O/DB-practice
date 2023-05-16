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
-- База данных: `Triggers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `avtor`
--

CREATE TABLE `avtor` (
  `ID_Avtor` int NOT NULL,
  `NameAvtor` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `avtor`
--

INSERT INTO `avtor` (`ID_Avtor`, `NameAvtor`) VALUES
(1, 'Пушкин Александр Сергеевич'),
(2, 'Толстой Лев Николаевич');

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `fio`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `fio` (
`FIO` varchar(122)
);

-- --------------------------------------------------------

--
-- Структура таблицы `info_vidacha`
--

CREATE TABLE `info_vidacha` (
  `ID_Info_Vidacha` int NOT NULL,
  `ID_Vidacha` int NOT NULL,
  `DataVozvrataNeed` timestamp NOT NULL,
  `Shtraf` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `info_vidacha`
--

INSERT INTO `info_vidacha` (`ID_Info_Vidacha`, `ID_Vidacha`, `DataVozvrataNeed`, `Shtraf`) VALUES
(1, 2, '2022-10-27 06:05:46', 300.00),
(2, 3, '2022-10-27 06:35:29', NULL),
(3, 4, '2022-10-27 06:35:29', 400.00);

-- --------------------------------------------------------

--
-- Структура таблицы `izdatelstvo`
--

CREATE TABLE `izdatelstvo` (
  `ID_izdatelstvo` int NOT NULL,
  `NameIzdatelstvo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `izdatelstvo`
--

INSERT INTO `izdatelstvo` (`ID_izdatelstvo`, `NameIzdatelstvo`) VALUES
(1, 'Мир'),
(2, 'Дрофа');

-- --------------------------------------------------------

--
-- Структура таблицы `janr`
--

CREATE TABLE `janr` (
  `ID_Janr` int NOT NULL,
  `NameJanr` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `janr`
--

INSERT INTO `janr` (`ID_Janr`, `NameJanr`) VALUES
(1, 'Сказка'),
(2, 'Повесть');

-- --------------------------------------------------------

--
-- Структура таблицы `klient`
--

CREATE TABLE `klient` (
  `ID_klient` int NOT NULL,
  `F_Klient` varchar(40) NOT NULL,
  `I_Klient` varchar(40) NOT NULL,
  `O_Klient` varchar(40) NOT NULL,
  `BDate` date NOT NULL,
  `Pol` char(1) NOT NULL,
  `Telephone` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `S_Pasp` char(4) NOT NULL,
  `N_Pasp` char(6) NOT NULL,
  `N_ChitBil` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `klient`
--

INSERT INTO `klient` (`ID_klient`, `F_Klient`, `I_Klient`, `O_Klient`, `BDate`, `Pol`, `Telephone`, `S_Pasp`, `N_Pasp`, `N_ChitBil`) VALUES
(1, 'Кылымнык', 'Виталий', 'Сергеевич', '1981-09-22', 'м', '7(916)247-29-01', '4514', '111111', '2022000001'),
(2, 'сайбаталов', 'егор', 'панкратиевич', '1981-11-12', 'м', '7(916)611-11-74', '4514', '111112', '2022000002'),
(3, 'Блинов', 'Константин', 'Евстафиевич', '1981-12-04', 'м', '7(916)089-03-67', '4514', '111113', '2022000003'),
(4, 'Ярошевич', 'Петр', 'Кондратиевич', '1982-04-21', 'м', '7(916)487-04-26', '4514', '111114', '2022000004'),
(5, 'Шамякин', 'Василий', 'Тихонович', '1982-06-02', 'м', '7(916)648-54-90', '4514', '111115', '2022000005'),
(6, 'Анреп', 'Семен', 'Касьянович', '1983-02-15', 'м', '7(916)122-29-78', '4514', '111116', '2022000006'),
(7, 'Ромазанов', 'Арсений', 'Ипполитович', '1984-02-15', 'м', '7(916)670-94-89', '4514', '111117', '2022000007'),
(8, 'Кярбер', 'Виктор', 'Александрович', '1984-04-26', 'м', '7(916)779-19-68', '4514', '111118', '2022000008'),
(9, 'Рунов', 'Михаил', 'Никанорович', '1984-05-05', 'м', '7(916)062-56-36', '4514', '111119', '2022000009'),
(10, 'Малинов', 'Виктор', 'Моисеевич', '1984-08-27', 'м', '7(916)591-56-06', '4514', '111120', '2022000010'),
(11, 'Гришкин', 'Виктор', 'Архипович', '1985-04-28', 'м', '7(916)872-36-12', '4514', '111121', '2022000011'),
(12, 'Грушецкий', 'Михаил', 'Сергеевич', '1986-04-28', 'м', '7(916)815-87-35', '4514', '111122', '2022000012'),
(13, 'Мусорин', 'Сергей', 'Валерьянович', '1987-03-04', 'м', '7(916)083-71-06', '4514', '111123', '2022000013'),
(14, 'Решетников', 'Роман', 'Ипатиевич', '1987-03-13', 'м', '7(916)982-58-88', '4514', '111124', '2022000014'),
(15, 'Яцунов', 'Семен', 'Онисимович', '1987-03-27', 'м', '7(916)500-11-25', '4514', '111125', '2022000015'),
(16, 'Жвиков', 'Денис', 'Олегович', '1988-01-31', 'м', '7(916)419-24-50', '4514', '111126', '2022000016'),
(17, 'Касьянов', 'Семён', 'Аникитевич', '1988-05-10', 'м', '7(916)343-44-01', '4514', '111127', '2022000017'),
(18, 'Царёв', 'Геннадий', 'Олегович', '1989-02-10', 'м', '7(916)830-71-84', '4514', '111128', '2022000018'),
(19, 'Блатов', 'Федор', 'Вадимович', '1989-12-09', 'м', '7(916)958-17-41', '4514', '111129', '2022000019'),
(20, 'Смирнитский', 'Богдан', 'Епифанович', '1991-02-16', 'м', '7(916)514-06-56', '4514', '111130', '2022000020'),
(21, 'Веденеева', 'Виктория', 'Геннадиевна', '1991-08-19', 'ж', '7(916)994-49-68', '4514', '111131', '2022000021'),
(22, 'Еромеева', 'Людмила', 'Тимуровна', '1992-07-16', 'ж', '7(916)985-17-08', '4514', '111132', '2022000022'),
(23, 'Кривоухова', 'Анна', 'Владленовна', '1993-02-04', 'ж', '7(916)577-31-95', '4514', '111133', '2022000023'),
(24, 'Тукаева', 'Нина', 'Владиленовна', '1993-11-14', 'ж', '7(916)097-75-37', '4514', '111134', '2022000024'),
(25, 'Стрельцова', 'Ангелина', 'Данилевна', '1994-02-23', 'ж', '7(916)228-28-71', '4514', '111135', '2022000025'),
(26, 'Травникова', 'Вероника', 'Михеевна', '1994-04-03', 'ж', '7(916)569-27-79', '4514', '111136', '2022000026'),
(27, 'Гавшина', 'Лилия', 'Павеловна', '1994-07-10', 'ж', '7(916)565-75-14', '4514', '111137', '2022000027'),
(28, 'Абалышева', 'Софья', 'Александровна', '1994-08-06', 'ж', '7(916)113-64-10', '4514', '111138', '2022000028'),
(29, 'Шимякина', 'Жанна', 'Евгениевна', '1994-10-01', 'ж', '7(916)390-26-19', '4514', '111139', '2022000029'),
(30, 'Карамзина', 'Юлия', 'Мироновна', '1996-06-28', 'ж', '7(916)895-57-47', '4514', '111140', '2022000030'),
(31, 'Бурякова', 'Инга', 'Серафимовна', '1996-10-06', 'ж', '7(916)139-65-32', '4514', '111141', '2022000031'),
(32, 'Хромченко', 'Алина', 'Константиновна', '1996-10-14', 'ж', '7(916)562-97-37', '4514', '111142', '2022000032'),
(33, 'Беломестова', 'Лариса', 'Захаровна', '1997-08-23', 'ж', '7(916)373-08-33', '4514', '111143', '2022000033'),
(34, 'Педича', 'Екатерина', 'Давидовна', '1997-10-18', 'ж', '7(916)292-94-02', '4514', '111144', '2022000034'),
(35, 'Коптильникова', 'Антонина', 'Федотовна', '1997-11-15', 'ж', '7(916)411-95-46', '4514', '111145', '2022000035'),
(36, 'Холода', 'Дарья', 'Юлиевна', '1997-12-30', 'ж', '7(916)190-82-80', '4514', '111146', '2022000036'),
(37, 'Толкачёва', 'Елизавета', 'Иларионовна', '1998-02-21', 'ж', '7(916)537-47-01', '4514', '111147', '2022000037'),
(38, 'Дворецкова', 'Валерия', 'Петровна', '1998-05-24', 'ж', '7(916)949-34-19', '4514', '111148', '2022000038'),
(39, 'Поличева', 'Ангелина', 'Ивановна', '1999-05-23', 'ж', '7(916)317-95-39', '4514', '111149', '2022000039'),
(40, 'Мальцова', 'Анастасия', 'Яновна', '2000-04-19', 'ж', '7(916)205-58-62', '4514', '111150', '2022000040');

-- --------------------------------------------------------

--
-- Структура таблицы `kniga`
--

CREATE TABLE `kniga` (
  `ID_kniga` int NOT NULL,
  `NameKniga` varchar(200) NOT NULL,
  `ID_Janr` int NOT NULL,
  `ID_izdatelstvo` int NOT NULL,
  `ID_Avtor` int NOT NULL,
  `GodVipusk` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kniga`
--

INSERT INTO `kniga` (`ID_kniga`, `NameKniga`, `ID_Janr`, `ID_izdatelstvo`, `ID_Avtor`, `GodVipusk`) VALUES
(1, 'Сказки Пушкина', 1, 1, 1, 2021),
(2, 'Руслан и Людмила', 2, 1, 1, 2022),
(3, 'Война и мир том 1', 2, 2, 2, 1990);

-- --------------------------------------------------------

--
-- Структура таблицы `vidacha`
--

CREATE TABLE `vidacha` (
  `ID_Vidacha` int NOT NULL,
  `DataVidachi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_Kniga` int NOT NULL,
  `ID_Chitatel` int NOT NULL,
  `DataVozvrata` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `vidacha`
--

INSERT INTO `vidacha` (`ID_Vidacha`, `DataVidachi`, `ID_Kniga`, `ID_Chitatel`, `DataVozvrata`) VALUES
(2, '2022-10-20 06:05:46', 3, 6, '2022-10-30'),
(3, '2022-10-20 06:35:29', 1, 1, '2022-10-24'),
(4, '2022-10-20 06:35:29', 2, 31, '2022-10-31');

--
-- Триггеры `vidacha`
--
DELIMITER $$
CREATE TRIGGER `TRVidacha` AFTER INSERT ON `vidacha` FOR EACH ROW BEGIN
INSERT INTO info_vidacha SET
info_vidacha.ID_Vidacha=new.ID_Vidacha,
info_vidacha.DataVozvrataNeed=DATE_ADD(new.DataVidachi,INTERVAL 1 WEEK);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRVozvrat` AFTER UPDATE ON `vidacha` FOR EACH ROW BEGIN
UPDATE info_vidacha SET
info_vidacha.Shtraf=DATEDIFF(new.DataVozvrata,info_vidacha.DataVozvrataNeed)*100
WHERE info_vidacha.ID_Vidacha=old.ID_Vidacha AND DATEDIFF(new.DataVozvrata,info_vidacha.DataVozvrataNeed)>0; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура для представления `fio`
--
DROP TABLE IF EXISTS `fio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER VIEW `fio`  AS SELECT concat(`klient`.`F_Klient`,' ',`klient`.`I_Klient`,' ',`klient`.`O_Klient`) AS `FIO` FROM `klient``klient`  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `avtor`
--
ALTER TABLE `avtor`
  ADD PRIMARY KEY (`ID_Avtor`);

--
-- Индексы таблицы `info_vidacha`
--
ALTER TABLE `info_vidacha`
  ADD PRIMARY KEY (`ID_Info_Vidacha`);

--
-- Индексы таблицы `izdatelstvo`
--
ALTER TABLE `izdatelstvo`
  ADD PRIMARY KEY (`ID_izdatelstvo`);

--
-- Индексы таблицы `janr`
--
ALTER TABLE `janr`
  ADD PRIMARY KEY (`ID_Janr`);

--
-- Индексы таблицы `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`ID_klient`);

--
-- Индексы таблицы `kniga`
--
ALTER TABLE `kniga`
  ADD PRIMARY KEY (`ID_kniga`),
  ADD KEY `KnigaAvtor` (`ID_Avtor`),
  ADD KEY `KnigaJanr` (`ID_Janr`),
  ADD KEY `KnigaIzd` (`ID_izdatelstvo`);

--
-- Индексы таблицы `vidacha`
--
ALTER TABLE `vidacha`
  ADD PRIMARY KEY (`ID_Vidacha`),
  ADD KEY `VidachaKniga` (`ID_Kniga`),
  ADD KEY `VidacaKlient` (`ID_Chitatel`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `avtor`
--
ALTER TABLE `avtor`
  MODIFY `ID_Avtor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `info_vidacha`
--
ALTER TABLE `info_vidacha`
  MODIFY `ID_Info_Vidacha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `izdatelstvo`
--
ALTER TABLE `izdatelstvo`
  MODIFY `ID_izdatelstvo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `janr`
--
ALTER TABLE `janr`
  MODIFY `ID_Janr` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `klient`
--
ALTER TABLE `klient`
  MODIFY `ID_klient` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `kniga`
--
ALTER TABLE `kniga`
  MODIFY `ID_kniga` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `vidacha`
--
ALTER TABLE `vidacha`
  MODIFY `ID_Vidacha` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `kniga`
--
ALTER TABLE `kniga`
  ADD CONSTRAINT `KnigaAvtor` FOREIGN KEY (`ID_Avtor`) REFERENCES `avtor` (`ID_Avtor`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `KnigaIzd` FOREIGN KEY (`ID_izdatelstvo`) REFERENCES `izdatelstvo` (`ID_izdatelstvo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `KnigaJanr` FOREIGN KEY (`ID_Janr`) REFERENCES `janr` (`ID_Janr`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `vidacha`
--
ALTER TABLE `vidacha`
  ADD CONSTRAINT `VidacaKlient` FOREIGN KEY (`ID_Chitatel`) REFERENCES `klient` (`ID_klient`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `VidachaKniga` FOREIGN KEY (`ID_Kniga`) REFERENCES `kniga` (`ID_kniga`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
