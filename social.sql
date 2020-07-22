-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 22 2020 г., 16:08
-- Версия сервера: 10.4.13-MariaDB
-- Версия PHP: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `social`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'Hello', 'gleb_martianov', 'gleb_martianov', '2020-07-14 08:57:22', 'no', 32),
(2, 'How much&', 'gleb_martianov', 'gleb_martianov', '2020-07-14 08:57:49', 'no', 27),
(3, 'Yers', 'gleb_martianov', 'gleb_martianov', '2020-07-14 09:32:14', 'no', 32);

-- --------------------------------------------------------

--
-- Структура таблицы `friend_request`
--

CREATE TABLE `friend_request` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `friend_request`
--

INSERT INTO `friend_request` (`id`, `user_to`, `user_from`) VALUES
(14, 'ivan_ivanov', 'john_tomas');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`id`, `username`, `post_id`) VALUES
(13, 'gleb_martianov', 54),
(14, 'gleb_martianov', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user_to`, `user_from`, `body`, `date`, `opened`, `viewed`, `deleted`) VALUES
(1, 'john_tomas', 'gleb_martianov', 'How are you Johnny?', '2020-07-16 09:59:04', 'yes', 'yes', 'no'),
(2, 'john_tomas', 'gleb_martianov', 'Hello body', '2020-07-16 09:59:09', 'yes', 'yes', 'no'),
(3, 'john_tomas', 'gleb_martianov', 'How are you?', '2020-07-16 09:59:15', 'yes', 'yes', 'no'),
(4, 'gleb_martianov', 'john_tomas', 'Hello', '2020-07-16 10:36:52', 'yes', 'yes', 'no'),
(5, 'gleb_martianov', 'john_tomas', 'р1', '2020-07-16 10:40:14', 'yes', 'yes', 'no'),
(6, 'gleb_martianov', 'john_tomas', 'ава', '2020-07-16 10:40:16', 'yes', 'yes', 'no'),
(7, 'gleb_martianov', 'john_tomas', 'аываыва', '2020-07-16 10:40:18', 'yes', 'yes', 'no'),
(8, 'gleb_martianov', 'john_tomas', 'аываыва', '2020-07-16 10:40:19', 'yes', 'yes', 'no'),
(9, 'gleb_martianov', 'john_tomas', 'аыва', '2020-07-16 10:40:20', 'yes', 'yes', 'no'),
(10, 'gleb_martianov', 'john_tomas', 'ыаыва', '2020-07-16 10:40:21', 'yes', 'yes', 'no'),
(11, 'gleb_martianov', 'john_tomas', 'ыаыва', '2020-07-16 10:40:22', 'yes', 'yes', 'no'),
(12, 'gleb_martianov', 'john_tomas', 'ываыва', '2020-07-16 10:40:24', 'yes', 'yes', 'no'),
(13, 'john_tomas', 'ivan_ivanov', 'Hey', '2020-07-16 11:40:09', 'yes', 'yes', 'no'),
(14, 'gleb_martianov', 'ivan_ivanov', 'he gleb', '2020-07-16 18:21:00', 'yes', 'yes', 'no'),
(15, 'john_tomas', 'ivan_ivanov', 'John How are you?', '2020-07-16 19:17:54', 'no', 'yes', 'no'),
(16, 'ivan_ivanov', 'gleb_martianov', 'hey', '2020-07-17 10:16:37', 'no', 'no', 'no'),
(17, 'gleb_martianov', 'gleb_martianov', 'Hi there', '2020-07-20 09:47:02', 'yes', 'yes', 'no'),
(18, 'gleb_martianov', 'gleb_martianov', 'Hi there', '2020-07-20 09:47:39', 'yes', 'yes', 'no'),
(19, 'gleb_martianov', 'gleb_martianov', 'john', '2020-07-20 09:47:46', 'yes', 'yes', 'no'),
(20, 'gleb_martianov', 'john_tomas', 'Gleb?', '2020-07-20 12:41:14', 'yes', 'yes', 'no'),
(21, 'gleb_martianov', 'john_tomas', 'Gleb?', '2020-07-20 12:42:02', 'yes', 'yes', 'no'),
(22, 'gleb_martianov', 'john_tomas', 'glebedsf', '2020-07-20 12:46:39', 'yes', 'yes', 'no'),
(23, 'john_tomas', 'gleb_martianov', 'ава', '2020-07-20 14:14:42', 'yes', 'yes', 'no'),
(24, 'john_tomas', 'gleb_martianov', 'ава', '2020-07-20 14:14:57', 'yes', 'yes', 'no'),
(25, 'john_tomas', 'gleb_martianov', '123123123', '2020-07-20 14:14:59', 'yes', 'yes', 'no'),
(26, 'john_tomas', 'gleb_martianov', '123123123', '2020-07-20 14:15:07', 'yes', 'yes', 'no'),
(27, 'john_tomas', 'gleb_martianov', '123123123', '2020-07-20 14:16:58', 'yes', 'yes', 'no'),
(28, 'john_tomas', 'gleb_martianov', '3123123', '2020-07-20 14:17:01', 'yes', 'yes', 'no'),
(29, 'john_tomas', 'gleb_martianov', '3123123', '2020-07-20 14:17:03', 'yes', 'yes', 'no'),
(30, 'john_tomas', 'gleb_martianov', '3123123', '2020-07-20 14:17:24', 'yes', 'yes', 'no'),
(31, 'john_tomas', 'gleb_martianov', '312312312', '2020-07-20 14:17:29', 'yes', 'yes', 'no'),
(32, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:19:06', 'yes', 'yes', 'no'),
(33, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:21:38', 'yes', 'yes', 'no'),
(34, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:22:33', 'yes', 'yes', 'no'),
(35, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:22:38', 'yes', 'yes', 'no'),
(36, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:23:25', 'yes', 'yes', 'no'),
(37, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:25:53', 'yes', 'yes', 'no'),
(38, 'john_tomas', 'gleb_martianov', '12312312', '2020-07-20 14:31:18', 'yes', 'yes', 'no'),
(39, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:31:22', 'yes', 'yes', 'no'),
(40, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:35:09', 'yes', 'yes', 'no'),
(41, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:41:53', 'yes', 'yes', 'no'),
(42, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:43:30', 'yes', 'yes', 'no'),
(43, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:43:35', 'yes', 'yes', 'no'),
(44, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:46:09', 'yes', 'yes', 'no'),
(45, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:51:43', 'yes', 'yes', 'no'),
(46, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:51:56', 'yes', 'yes', 'no'),
(47, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:55:12', 'yes', 'yes', 'no'),
(48, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 14:55:52', 'yes', 'yes', 'no'),
(49, 'john_tomas', 'gleb_martianov', '123213', '2020-07-20 15:07:14', 'yes', 'yes', 'no'),
(50, 'john_tomas', 'gleb_martianov', 'Jonny?', '2020-07-20 18:18:10', 'yes', 'yes', 'no');

-- --------------------------------------------------------

--
-- Структура таблицы `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `notifications`
--

INSERT INTO `notifications` (`id`, `user_to`, `user_from`, `message`, `link`, `datetime`, `opened`, `viewed`) VALUES
(1, 'john_tomas', 'gleb_martianov', 'Gleb Martianov posted your profile', 'post.php?id=55', '2020-07-20 14:55:51', 'no', 'yes'),
(2, 'john_tomas', 'gleb_martianov', 'Gleb Martianov posted your profile', 'post.php?id=56', '2020-07-20 15:07:10', 'yes', 'yes'),
(3, 'john_tomas', 'gleb_martianov', 'Gleb Martianov liked your post', 'post.php?id=13', '2020-07-20 15:30:28', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` text NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image`) VALUES
(11, 'Post', 'gleb_martianov', 'none', '2020-07-13 14:04:50', 'no', 'yes', 0, ''),
(12, '123123', 'john_tomas', 'none', '2020-07-13 14:12:09', 'no', 'no', 0, ''),
(13, '123', 'john_tomas', 'none', '2020-07-13 14:12:12', 'no', 'no', 1, ''),
(14, '123123', 'gleb_martianov', 'none', '2020-07-13 16:18:28', 'no', 'no', 0, ''),
(15, '13213', 'gleb_martianov', 'none', '2020-07-13 16:18:29', 'no', 'no', 0, ''),
(16, '3123123', 'gleb_martianov', 'none', '2020-07-13 16:18:31', 'no', 'no', 0, ''),
(17, '123', 'gleb_martianov', 'none', '2020-07-13 16:18:32', 'no', 'no', 0, ''),
(18, '3123123', 'gleb_martianov', 'none', '2020-07-13 16:18:33', 'no', 'no', 0, ''),
(19, '3213', 'gleb_martianov', 'none', '2020-07-13 16:18:34', 'no', 'yes', 0, ''),
(20, '312312', 'gleb_martianov', 'none', '2020-07-13 16:18:35', 'no', 'yes', 0, ''),
(21, '123123123131', 'gleb_martianov', 'none', '2020-07-13 16:18:37', 'no', 'yes', 0, ''),
(22, '13123123123131', 'gleb_martianov', 'none', '2020-07-13 16:18:38', 'no', 'yes', 0, ''),
(23, '1231231231', 'gleb_martianov', 'none', '2020-07-13 16:18:40', 'no', 'yes', 0, ''),
(24, '123123123', 'gleb_martianov', 'none', '2020-07-13 16:18:41', 'no', 'yes', 0, ''),
(25, '123123123123', 'gleb_martianov', 'none', '2020-07-13 16:18:42', 'no', 'yes', 0, ''),
(26, '1232131', 'gleb_martianov', 'none', '2020-07-13 16:18:47', 'no', 'yes', 0, ''),
(27, '123123', 'gleb_martianov', 'none', '2020-07-13 16:18:48', 'no', 'yes', 0, ''),
(28, '12312', 'gleb_martianov', 'none', '2020-07-13 16:18:49', 'no', 'yes', 0, ''),
(29, '123123', 'gleb_martianov', 'none', '2020-07-13 16:18:50', 'no', 'yes', 0, ''),
(30, '123123', 'gleb_martianov', 'none', '2020-07-13 16:18:52', 'no', 'yes', 0, ''),
(31, '23123', 'gleb_martianov', 'none', '2020-07-13 16:18:53', 'no', 'yes', 0, ''),
(32, '123123', 'gleb_martianov', 'none', '2020-07-13 16:18:54', 'no', 'yes', 0, ''),
(33, 'выфвфыв', 'gleb_martianov', 'john_tomas', '2020-07-15 09:53:39', 'no', 'yes', 0, ''),
(34, 'выфвфыв', 'gleb_martianov', 'john_tomas', '2020-07-15 09:53:51', 'no', 'yes', 0, ''),
(35, 'Hi!', 'gleb_martianov', 'john_tomas', '2020-07-20 14:10:49', 'no', 'no', 0, ''),
(36, 'авав', 'gleb_martianov', 'john_tomas', '2020-07-20 14:14:25', 'no', 'no', 0, ''),
(37, '23123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:15:05', 'no', 'no', 0, ''),
(38, '321312', 'gleb_martianov', 'john_tomas', '2020-07-20 14:15:10', 'no', 'no', 0, ''),
(39, '321312', 'gleb_martianov', 'john_tomas', '2020-07-20 14:15:47', 'no', 'no', 0, ''),
(40, '123123213', 'gleb_martianov', 'john_tomas', '2020-07-20 14:22:36', 'no', 'no', 0, ''),
(41, '12321312312', 'gleb_martianov', 'john_tomas', '2020-07-20 14:23:31', 'no', 'no', 0, ''),
(42, '12321312312', 'gleb_martianov', 'john_tomas', '2020-07-20 14:25:07', 'no', 'no', 0, ''),
(43, '123123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:26:09', 'no', 'no', 0, ''),
(44, '123123123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:27:13', 'no', 'no', 0, ''),
(45, '1231231', 'gleb_martianov', 'john_tomas', '2020-07-20 14:31:29', 'no', 'no', 0, ''),
(46, '123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:35:12', 'no', 'no', 0, ''),
(47, '123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:43:34', 'no', 'no', 0, ''),
(48, '123123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:45:44', 'no', 'no', 0, ''),
(49, '123213', 'gleb_martianov', 'john_tomas', '2020-07-20 14:46:21', 'no', 'no', 0, ''),
(50, '123213213123', 'gleb_martianov', 'john_tomas', '2020-07-20 14:51:42', 'no', 'no', 0, ''),
(51, 'example', 'gleb_martianov', 'john_tomas', '2020-07-20 14:51:55', 'no', 'no', 0, ''),
(52, '123123213', 'gleb_martianov', 'john_tomas', '2020-07-20 14:54:06', 'no', 'no', 0, ''),
(53, 'fuck', 'gleb_martianov', 'john_tomas', '2020-07-20 14:54:39', 'no', 'no', 0, ''),
(54, '32131231', 'gleb_martianov', 'john_tomas', '2020-07-20 14:55:23', 'no', 'no', 1, ''),
(55, '32131231123231', 'gleb_martianov', 'john_tomas', '2020-07-20 14:55:51', 'no', 'no', 0, ''),
(56, '123213123', 'gleb_martianov', 'john_tomas', '2020-07-20 15:07:10', 'no', 'no', 0, ''),
(57, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/BwF1CEy3ZI4\'></iframe><br>', 'gleb_martianov', 'none', '2020-07-22 15:00:02', 'no', 'no', 0, ''),
(58, '<br><iframe width=\'420\' height=\'315\' src=\'https://www.youtube.com/embed/NKRtO-qVXI8\'></iframe><br>', 'gleb_martianov', 'none', '2020-07-22 15:03:16', 'no', 'no', 0, ''),
(59, 'hello my name is gleb', 'gleb_martianov', 'none', '2020-07-22 16:15:47', 'no', 'no', 0, ''),
(60, 'This is gleb and this is cool', 'gleb_martianov', 'none', '2020-07-22 16:16:38', 'no', 'no', 0, ''),
(61, 'Glebs', 'gleb_martianov', 'none', '2020-07-22 16:18:32', 'no', 'no', 0, ''),
(62, 'fdfds', 'gleb_martianov', 'none', '2020-07-22 16:19:16', 'no', 'no', 0, ''),
(63, 'jordge', 'gleb_martianov', 'none', '2020-07-22 16:21:17', 'no', 'no', 0, ''),
(64, 'fds', 'gleb_martianov', 'none', '2020-07-22 16:21:27', 'no', 'no', 0, ''),
(65, 'fdfdsfsdff', 'gleb_martianov', 'none', '2020-07-22 16:22:17', 'no', 'no', 0, ''),
(66, 'ававыа', 'gleb_martianov', 'none', '2020-07-22 16:22:44', 'no', 'no', 0, ''),
(67, '3213123213', 'gleb_martianov', 'none', '2020-07-22 16:26:47', 'no', 'no', 0, ''),
(68, 'авыавыавыа', 'gleb_martianov', 'none', '2020-07-22 16:27:41', 'no', 'no', 0, ''),
(69, 'авыавыа', 'gleb_martianov', 'none', '2020-07-22 16:28:34', 'no', 'no', 0, ''),
(70, 'авыаыва', 'gleb_martianov', 'none', '2020-07-22 16:28:56', 'no', 'no', 0, ''),
(71, 'ывыфвыфв', 'gleb_martianov', 'none', '2020-07-22 16:29:26', 'no', 'no', 0, ''),
(72, 'This is glebs', 'gleb_martianov', 'none', '2020-07-22 16:31:47', 'no', 'no', 0, ''),
(73, 'hey', 'gleb_martianov', 'none', '2020-07-22 17:00:50', 'no', 'no', 0, ''),
(74, 'sdsad', 'gleb_martianov', 'none', '2020-07-22 17:03:33', 'no', 'no', 0, 'assets/images/posts/5f1847355c5e3B7I6HFZJq9o.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('Glebs', 1),
('Sdsad', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_post` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_post`, `num_likes`, `user_closed`, `friend_array`) VALUES
(10, 'Gleb', 'Martianov', 'gleb_martianov', 'margleb@yandex.ru', 'fcea920f7412b5da7be0cf42b8c93759', '2020-07-11', 'assets/images/profile_pics/gleb_martianov58f18d075ead3b38b602d42708c57f20n.jpeg', 40, 2, 'no', ',john_tomas,'),
(11, 'John', 'Tomas', 'john_tomas', 'johntomas@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-07-13', 'assets/images/profile_pics/defaults/head_deep_blue.png', 2, 0, 'no', ',gleb_martianov,'),
(12, 'Ivan', 'Ivanov', 'ivan_ivanov', 'ivanivanov@mail.com', 'e10adc3949ba59abbe56e057f20f883e', '2020-07-15', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ',gleb_martianov,');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `friend_request`
--
ALTER TABLE `friend_request`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `friend_request`
--
ALTER TABLE `friend_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
