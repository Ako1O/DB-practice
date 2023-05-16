-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 28 2022 г., 02:20
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
-- База данных: `dyelog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `basket`
--

CREATE TABLE `basket` (
  `ID_Basket` int NOT NULL,
  `ID_Clients` int NOT NULL,
  `ID_Products` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `basket`
--

INSERT INTO `basket` (`ID_Basket`, `ID_Clients`, `ID_Products`) VALUES
(3, 2, 1),
(4, 2, 2),
(5, 2, 3),
(6, 3, 2),
(7, 4, 3),
(8, 4, 2),
(9, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `ID_Clients` int NOT NULL,
  `Client_name` varchar(128) NOT NULL,
  `Client_surname` varchar(128) NOT NULL,
  `Client_middlename` varchar(128) NOT NULL,
  `Client_phone` varchar(32) NOT NULL,
  `Client_email` varchar(64) NOT NULL,
  `Client_password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`ID_Clients`, `Client_name`, `Client_surname`, `Client_middlename`, `Client_phone`, `Client_email`, `Client_password`) VALUES
(1, 'пм', 'чсапмо', 'сарпмоирл', '123456789098', 'xgvjk@ycgvbjh', '202cb962ac59075b964b07152d234b70'),
(2, 'Иван', 'Иваносв', 'Иванович', '+79993004557', '123@gmail.com', '202cb962ac59075b964b07152d234b70'),
(3, '123', '123', '123', '+79647790971', '123@123', '202cb962ac59075b964b07152d234b70'),
(4, 'Петя', 'Петров', 'Александрович', '+78889992233', '123@123.com', '202cb962ac59075b964b07152d234b70'),
(5, '111111111111111', '1111111111', '111111111111111', '+786499922211', '1111111@111.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `ID_Clients` int NOT NULL,
  `ID_Order` int NOT NULL,
  `Order_token` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`ID_Clients`, `ID_Order`, `Order_token`) VALUES
(2, 1, 19),
(1, 2, 0),
(1, 3, 43),
(2, 4, 456);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `ID_Products` int NOT NULL,
  `Product_name` varchar(128) NOT NULL,
  `Product_description` varchar(256) NOT NULL,
  `Product_cost` decimal(32,2) NOT NULL,
  `ID_Category` int NOT NULL,
  `Product_img` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`ID_Products`, `Product_name`, `Product_description`, `Product_cost`, `ID_Category`, `Product_img`) VALUES
(1, 'Масло моторное MOTOR Платинум 5W40', 'Синтетические моторные масла MOTOR Platinum SN/CF предназначены для применения в бензиновых и дизельных двигателях легковых и дизельных двигателях легковых автомобилей...', '105.00', 1, 'product1.png'),
(2, 'Масло моторное AKross SUPER INEO\n\n', 'Масло моторное AKross SUPER INEO ECS 5W30 (синтетика) объемом 4 л с уверенностью можно назвать продуктом нового поколения, так как оно содержит сниженный уровень сульфатной золы...', '100.00', 1, 'product2.png'),
(3, 'Масло моторное ROWE 5W-40', 'Масло моторное ROWE 5W-40 – моторное масло для бензиновых и дизельных двигателей легковых автомобилей и легких грузовиков. Изготовлено на полусинтетической основе с добавлением пакета...', '150.00', 1, 'product3.png');

-- --------------------------------------------------------

--
-- Структура таблицы `products_category`
--

CREATE TABLE `products_category` (
  `ID_Category` int NOT NULL,
  `Product_category_description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `products_category`
--

INSERT INTO `products_category` (`ID_Category`, `Product_category_description`) VALUES
(1, 'Масло'),
(2, 'Запчасти');

-- --------------------------------------------------------

--
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `ID_Services` int NOT NULL,
  `Services_description` varchar(128) NOT NULL,
  `Services_cost` decimal(32,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`ID_Services`, `Services_description`, `Services_cost`) VALUES
(1, 'Починка запчастей', '5.00'),
(2, 'Замена масла', '4.00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `basket`
--
ALTER TABLE `basket`
  ADD PRIMARY KEY (`ID_Basket`);

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ID_Clients`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID_Order`),
  ADD KEY `R_19` (`ID_Clients`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID_Products`),
  ADD KEY `R_6` (`ID_Category`);

--
-- Индексы таблицы `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`ID_Category`);

--
-- Индексы таблицы `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ID_Services`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `basket`
--
ALTER TABLE `basket`
  MODIFY `ID_Basket` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `ID_Clients` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `ID_Order` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `ID_Products` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `R_6` FOREIGN KEY (`ID_Category`) REFERENCES `products_category` (`ID_Category`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
