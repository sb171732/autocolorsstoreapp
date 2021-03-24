-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 19 2021 г., 17:49
-- Версия сервера: 5.7.32-0ubuntu0.16.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_wp`
--

-- --------------------------------------------------------

--
-- Структура таблицы `productapp`
--

CREATE TABLE `productapp` (
  `id` int(11) NOT NULL,
  `cod` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `price` varchar(50) NOT NULL,
  `count` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `productapp`
--

INSERT INTO `productapp` (`id`, `cod`, `name`, `price`, `count`) VALUES
(6, '1', 'Тест', '150', '15'),
(7, '2', 'Тест', '150', '25');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `productapp`
--
ALTER TABLE `productapp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `productapp`
--
ALTER TABLE `productapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
