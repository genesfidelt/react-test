-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 04, 2022 at 08:07 AM
-- Server version: 8.0.27
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quickcash`
--

-- --------------------------------------------------------

--
-- Table structure for table `capital_histories`
--

DROP TABLE IF EXISTS `capital_histories`;
CREATE TABLE IF NOT EXISTS `capital_histories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_history_id` bigint UNSIGNED DEFAULT NULL,
  `total_amt` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  KEY `user_id` (`user_id`),
  KEY `loan_history_id` (`loan_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `capital_histories`
--

INSERT INTO `capital_histories` (`id`, `company_id`, `user_id`, `date`, `amount`, `comment`, `loan_history_id`, `total_amt`) VALUES
(1, NULL, 1, '2022-06-27 01:13:33', '100.00', 'comment 1', NULL, '100.00'),
(2, NULL, 3, '2022-06-29 00:35:51', '10000.00', 'Loaned', 1, '-9900.00'),
(3, NULL, 3, '2022-06-29 00:36:36', '3500.00', 'Partial loan payment', 1, '-6400.00'),
(4, NULL, 2, '2022-06-29 00:37:13', '6400.00', 'add new capital', NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `softdeleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `softdeleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Company 1', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36'),
(2, 'Big Corp', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36'),
(3, 'Medium Business', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36'),
(4, 'Local Establishment', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
CREATE TABLE IF NOT EXISTS `configurations` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `setting`, `value`) VALUES
(1, 'Interest', '5'),
(2, 'Max Amortization Length', '3');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `loanees`
--

DROP TABLE IF EXISTS `loanees`;
CREATE TABLE IF NOT EXISTS `loanees` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `company_identification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `loanees`
--

INSERT INTO `loanees` (`id`, `created_at`, `updated_at`, `user_id`, `company_id`, `company_identification`) VALUES
(1, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 3, 1, '1abc-65k1-0048-ab01'),
(2, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 4, 1, '1234-2345-3456-4567'),
(3, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 5, 2, 'abc-abc-111-222');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
CREATE TABLE IF NOT EXISTS `loans` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loanee_id` bigint UNSIGNED NOT NULL,
  `company_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `term_in_months` bigint DEFAULT NULL,
  `approver_id` bigint UNSIGNED DEFAULT NULL,
  `acknowledger_id` bigint UNSIGNED DEFAULT NULL,
  `date_approved` timestamp NULL DEFAULT NULL,
  `date_acknowledged` timestamp NULL DEFAULT NULL,
  `bank_account_loanee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_lender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_companyPayingLoan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loanee_id` (`loanee_id`),
  KEY `loans_ibfk_2` (`company_id`),
  KEY `approver_id` (`approver_id`),
  KEY `acknowledger_id` (`acknowledger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `created_at`, `updated_at`, `loanee_id`, `company_id`, `amount`, `rate`, `term_in_months`, `approver_id`, `acknowledger_id`, `date_approved`, `date_acknowledged`, `bank_account_loanee`, `bank_account_lender`, `is_companyPayingLoan`) VALUES
(1, '2022-06-29 00:35:38', '2022-06-29 00:35:51', 1, 1, '10000.00', 5, 3, NULL, 2, NULL, '2022-06-29 00:35:51', 'bank1', 'bank2', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_histories`
--

DROP TABLE IF EXISTS `loan_histories`;
CREATE TABLE IF NOT EXISTS `loan_histories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loan_id` bigint UNSIGNED NOT NULL,
  `amortization_date` timestamp NULL DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT NULL,
  `bank_account_loanee` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_lender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `loan_id` (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `loan_histories`
--

INSERT INTO `loan_histories` (`id`, `created_at`, `updated_at`, `loan_id`, `amortization_date`, `is_paid`, `bank_account_loanee`, `bank_account_lender`) VALUES
(1, '2022-06-29 00:35:51', '2022-06-29 00:36:36', 1, '2022-06-30 16:00:00', 1, 'bank1', 'bank2'),
(2, '2022-06-29 00:35:51', '2022-06-29 00:35:51', 1, '2022-07-31 16:00:00', NULL, NULL, NULL),
(3, '2022-06-29 00:35:51', '2022-06-29 00:35:51', 1, '2022-08-31 16:00:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logged_users`
--

DROP TABLE IF EXISTS `logged_users`;
CREATE TABLE IF NOT EXISTS `logged_users` (
  `user_id` bigint UNSIGNED NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_refresh` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2000_01_01_000000_create_capital_histories_table', 1),
(2, '2000_01_01_000000_create_companies_table', 1),
(3, '2000_01_01_000000_create_configurations_table', 1),
(4, '2000_01_01_000000_create_failed_jobs_table', 1),
(5, '2000_01_01_000000_create_loan_histories_table', 1),
(6, '2000_01_01_000000_create_loanees_table', 1),
(7, '2000_01_01_000000_create_loans_table', 1),
(8, '2000_01_01_000000_create_password_resets_table', 1),
(9, '2000_01_01_000000_create_roles_table', 1),
(10, '2000_01_01_000000_create_users_table', 1),
(11, '2000_01_01_000001_add_foreign_keys_to_capital_histories_table', 1),
(12, '2000_01_01_000001_add_foreign_keys_to_loan_histories_table', 1),
(13, '2000_01_01_000001_add_foreign_keys_to_loanees_table', 1),
(14, '2000_01_01_000001_add_foreign_keys_to_loans_table', 1),
(15, '2000_01_01_000001_add_foreign_keys_to_users_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 'Level 4'),
(2, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 'Level 3'),
(3, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 'Level 2'),
(4, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 'Level 1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `softdeleted_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `softdeleted_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`) VALUES
(1, 'owner', 'owner@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 1),
(2, 'admin', 'admin@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 2),
(3, 'emp1', 'emp1@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 4),
(4, 'pay', 'pay@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 3),
(5, 'emp2', 'emp2@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 4),
(6, 'emp3', 'emp3@mail.com', NULL, NULL, '$2y$10$Rknx6gU0b92OMIKLogrJwuLdl.dPfgt9NuOk/Z6kR21kNoqAvJ7hO', NULL, '2022-06-20 08:24:36', '2022-06-20 08:24:36', 4),
(7, 'MyName', 'mymail@mail.com', NULL, NULL, '$2y$10$Qx8.mbpLCrPt6PjpZK/FVuV89ehq57dYPA3GyRUY5QSmJdksU7DRW', NULL, '2022-06-29 21:23:28', '2022-06-29 21:23:28', NULL),
(8, 'asfd3', 'admins@mail.com', NULL, NULL, '$2y$10$5NKTBmGZiicMBaBlQJNSueyyt1PqK1vEfsNwiiVKUkRerTSAzAhFG', NULL, '2022-06-30 17:50:39', '2022-06-30 17:50:39', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capital_histories`
--
ALTER TABLE `capital_histories`
  ADD CONSTRAINT `capital_histories_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `capital_histories_ibfk_3` FOREIGN KEY (`loan_history_id`) REFERENCES `loan_histories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `capital_histories_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `loanees`
--
ALTER TABLE `loanees`
  ADD CONSTRAINT `loanees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `loanees_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`loanee_id`) REFERENCES `loanees` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `loans_ibfk_3` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `loans_ibfk_4` FOREIGN KEY (`acknowledger_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `loan_histories`
--
ALTER TABLE `loan_histories`
  ADD CONSTRAINT `loan_histories_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `logged_users`
--
ALTER TABLE `logged_users`
  ADD CONSTRAINT `logged_users_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
