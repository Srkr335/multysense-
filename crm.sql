-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2023 at 12:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `accept_estimates`
--

CREATE TABLE `accept_estimates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `signature` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `clock_in_time` datetime NOT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `clock_in_ip` varchar(191) NOT NULL,
  `clock_out_ip` varchar(191) NOT NULL,
  `working_from` varchar(191) NOT NULL DEFAULT 'office',
  `late` enum('yes','no') NOT NULL DEFAULT 'no',
  `half_day` enum('yes','no') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` int(11) NOT NULL DEFAULT 1,
  `employee_clock_in_out` enum('yes','no') NOT NULL DEFAULT 'yes',
  `office_open_days` varchar(191) NOT NULL DEFAULT '[1,2,3,4,5]',
  `ip_address` text DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `radius_check` enum('yes','no') NOT NULL DEFAULT 'no',
  `ip_check` enum('yes','no') NOT NULL DEFAULT 'no',
  `alert_after` int(11) DEFAULT NULL,
  `alert_after_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `company_id`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `employee_clock_in_out`, `office_open_days`, `ip_address`, `radius`, `radius_check`, `ip_check`, `alert_after`, `alert_after_status`, `created_at`, `updated_at`) VALUES
(1, NULL, '09:00:00', '18:00:00', NULL, 20, 2, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', NULL, 1, '2023-02-14 05:30:22', '2023-02-14 05:30:22'),
(2, 1, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', NULL, 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `authorize_invoices`
--

CREATE TABLE `authorize_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authorize_subscriptions`
--

CREATE TABLE `authorize_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `subscription_id` varchar(191) NOT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `plan_type` varchar(191) DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE `client_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `office_phone` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `linkedin` varchar(191) DEFAULT NULL,
  `facebook` varchar(191) DEFAULT NULL,
  `twitter` varchar(191) DEFAULT NULL,
  `skype` varchar(191) DEFAULT NULL,
  `gst_number` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`id`, `company_id`, `user_id`, `name`, `email`, `image`, `mobile`, `company_name`, `address`, `shipping_address`, `office_phone`, `city`, `state`, `postal_code`, `website`, `note`, `linkedin`, `facebook`, `twitter`, `skype`, `gst_number`, `created_at`, `updated_at`, `email_notifications`, `country_id`, `category_id`, `sub_category_id`) VALUES
(1, 1, 4, 'Miss Charlotte Skiles', 'alfreda34@gmail.com', NULL, NULL, 'Hudson-O\'Reilly', '76015 Devonte Estate\nBaumbachbury, AK 29254', NULL, NULL, NULL, NULL, NULL, 'yost.net', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_docs`
--

CREATE TABLE `client_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `hashname` varchar(200) NOT NULL,
  `size` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_sub_categories`
--

CREATE TABLE `client_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_user_notes`
--

CREATE TABLE `client_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) NOT NULL,
  `company_email` varchar(191) NOT NULL,
  `company_phone` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `login_background` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `website` varchar(191) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') NOT NULL DEFAULT 'monthly',
  `timezone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) NOT NULL DEFAULT 'd-m-Y',
  `date_picker_format` varchar(191) DEFAULT NULL,
  `moment_format` varchar(191) DEFAULT NULL,
  `time_format` varchar(20) NOT NULL DEFAULT 'h:i A',
  `week_start` int(11) NOT NULL DEFAULT 1,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `leaves_start_from` enum('joining_date','year_start') NOT NULL DEFAULT 'joining_date',
  `active_theme` enum('default','custom') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive','license_expired') NOT NULL DEFAULT 'active',
  `task_self` enum('yes','no') NOT NULL DEFAULT 'yes',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(191) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL,
  `rounded_theme` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL,
  `default_task_status` int(10) UNSIGNED DEFAULT NULL,
  `show_update_popup` tinyint(1) NOT NULL DEFAULT 1,
  `dashboard_clock` tinyint(1) NOT NULL DEFAULT 1,
  `ticket_form_google_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `lead_form_google_captcha` tinyint(1) NOT NULL DEFAULT 0,
  `rtl` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `currency_id`, `package_id`, `package_type`, `timezone`, `date_format`, `date_picker_format`, `moment_format`, `time_format`, `week_start`, `locale`, `latitude`, `longitude`, `leaves_start_from`, `active_theme`, `status`, `task_self`, `last_updated_by`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`, `rounded_theme`, `last_login`, `default_task_status`, `show_update_popup`, `dashboard_clock`, `ticket_form_google_captcha`, `lead_form_google_captcha`, `rtl`) VALUES
(1, 'Worksuite Demo Company', 'admin@example.com', '517-966-5663', NULL, NULL, '4868  Ben Street Lansing Michigan 48906', 'worksuite.biz', 1, 1, 'monthly', 'Asia/Kolkata', 'd-m-Y', 'dd-mm-yyyy', 'DD-MM-YYYY', 'h:i A', 1, 'en', NULL, NULL, 'joining_date', 'default', 'active', 'yes', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) NOT NULL,
  `amount` varchar(191) NOT NULL,
  `original_amount` decimal(15,2) NOT NULL,
  `contract_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `original_start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `original_end_date` date DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `contract_name` varchar(191) DEFAULT NULL,
  `company_logo` varchar(191) DEFAULT NULL,
  `alternate_address` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `office_phone` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `contract_detail` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT 1,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_discussions`
--

CREATE TABLE `contract_discussions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_files`
--

CREATE TABLE `contract_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_renews`
--

CREATE TABLE `contract_renews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `renewed_by` int(10) UNSIGNED NOT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_signs`
--

CREATE TABLE `contract_signs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `contract_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `signature` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_two` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

CREATE TABLE `conversation_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `reply` text NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `iso` char(2) NOT NULL,
  `name` varchar(80) NOT NULL,
  `nicename` varchar(80) NOT NULL,
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `iso`, `name`, `nicename`, `iso3`, `numcode`, `phonecode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4, 93),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8, 355),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12, 213),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16, 1684),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20, 376),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24, 244),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660, 1264),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL, 0),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28, 1268),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32, 54),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51, 374),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533, 297),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36, 61),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40, 43),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31, 994),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44, 1242),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48, 973),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50, 880),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52, 1246),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112, 375),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56, 32),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84, 501),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204, 229),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60, 1441),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64, 975),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68, 591),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70, 387),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72, 267),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL, 0),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76, 55),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL, 246),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96, 673),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100, 359),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854, 226),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108, 257),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116, 855),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120, 237),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124, 1),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132, 238),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136, 1345),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140, 236),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148, 235),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152, 56),
(44, 'CN', 'CHINA', 'China', 'CHN', 156, 86),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL, 61),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL, 672),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170, 57),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174, 269),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178, 242),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180, 242),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184, 682),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188, 506),
(53, 'CI', 'COTE D\'IVOIRE', 'Cote D\'Ivoire', 'CIV', 384, 225),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191, 385),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192, 53),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196, 357),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203, 420),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208, 45),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262, 253),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212, 1767),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214, 1809),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218, 593),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818, 20),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222, 503),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226, 240),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232, 291),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233, 372),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231, 251),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238, 500),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234, 298),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242, 679),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246, 358),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250, 33),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254, 594),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258, 689),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL, 0),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266, 241),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270, 220),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268, 995),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276, 49),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288, 233),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292, 350),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300, 30),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304, 299),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308, 1473),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312, 590),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316, 1671),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320, 502),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324, 224),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624, 245),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328, 592),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332, 509),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL, 0),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336, 39),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340, 504),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344, 852),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348, 36),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352, 354),
(99, 'IN', 'INDIA', 'India', 'IND', 356, 91),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360, 62),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364, 98),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368, 964),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372, 353),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376, 972),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380, 39),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388, 1876),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392, 81),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400, 962),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398, 7),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404, 254),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296, 686),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF', 'Korea, Democratic People\'s Republic of', 'PRK', 408, 850),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410, 82),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414, 965),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417, 996),
(116, 'LA', 'LAO PEOPLE\'S DEMOCRATIC REPUBLIC', 'Lao People\'s Democratic Republic', 'LAO', 418, 856),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428, 371),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422, 961),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426, 266),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430, 231),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434, 218),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438, 423),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440, 370),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442, 352),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446, 853),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807, 389),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450, 261),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454, 265),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458, 60),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462, 960),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466, 223),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470, 356),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584, 692),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474, 596),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478, 222),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480, 230),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL, 269),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484, 52),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583, 691),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498, 373),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492, 377),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496, 976),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500, 1664),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504, 212),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508, 258),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104, 95),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516, 264),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520, 674),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524, 977),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528, 31),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530, 599),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540, 687),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554, 64),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558, 505),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562, 227),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566, 234),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570, 683),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574, 672),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580, 1670),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578, 47),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512, 968),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586, 92),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585, 680),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL, 970),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591, 507),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598, 675),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600, 595),
(168, 'PE', 'PERU', 'Peru', 'PER', 604, 51),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608, 63),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612, 0),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616, 48),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620, 351),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630, 1787),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634, 974),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638, 262),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642, 40),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643, 70),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646, 250),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654, 290),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659, 1869),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662, 1758),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666, 508),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670, 1784),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882, 684),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674, 378),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678, 239),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682, 966),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686, 221),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL, 381),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690, 248),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694, 232),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702, 65),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703, 421),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705, 386),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90, 677),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706, 252),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710, 27),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL, 0),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724, 34),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144, 94),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736, 249),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740, 597),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744, 47),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748, 268),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752, 46),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756, 41),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760, 963),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158, 886),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762, 992),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834, 255),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764, 66),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL, 670),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768, 228),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772, 690),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776, 676),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780, 1868),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788, 216),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792, 90),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795, 7370),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796, 1649),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798, 688),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800, 256),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804, 380),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784, 971),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826, 44),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840, 1),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL, 1),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858, 598),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860, 998),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548, 678),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862, 58),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704, 84),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92, 1284),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850, 1340),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876, 681),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732, 212),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887, 967),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894, 260),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716, 263),
(240, 'RS', 'SERBIA', 'Serbia', 'SRB', 688, 381),
(241, 'AP', 'ASIA PACIFIC REGION', 'Asia / Pacific Region', '0', 0, 0),
(242, 'ME', 'MONTENEGRO', 'Montenegro', 'MNE', 499, 382),
(243, 'AX', 'ALAND ISLANDS', 'Aland Islands', 'ALA', 248, 358),
(244, 'BQ', 'BONAIRE, SINT EUSTATIUS AND SABA', 'Bonaire, Sint Eustatius and Saba', 'BES', 535, 599),
(245, 'CW', 'CURACAO', 'Curacao', 'CUW', 531, 599),
(246, 'GG', 'GUERNSEY', 'Guernsey', 'GGY', 831, 44),
(247, 'IM', 'ISLE OF MAN', 'Isle of Man', 'IMN', 833, 44),
(248, 'JE', 'JERSEY', 'Jersey', 'JEY', 832, 44),
(249, 'XK', 'KOSOVO', 'Kosovo', '---', 0, 381),
(250, 'BL', 'SAINT BARTHELEMY', 'Saint Barthelemy', 'BLM', 652, 590),
(251, 'MF', 'SAINT MARTIN', 'Saint Martin', 'MAF', 663, 590),
(252, 'SX', 'SINT MAARTEN', 'Sint Maarten', 'SXM', 534, 1),
(253, 'SS', 'SOUTH SUDAN', 'South Sudan', 'SSD', 728, 211);

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `cn_number` varchar(191) NOT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('closed','open') NOT NULL DEFAULT 'open',
  `recurring` enum('yes','no') NOT NULL DEFAULT 'no',
  `billing_frequency` varchar(191) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_original_name` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes_invoice`
--

CREATE TABLE `credit_notes_invoice` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credit_notes_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `credit_amount` double(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_note_items`
--

CREATE TABLE `credit_note_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `credit_note_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `quantity` int(11) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) DEFAULT NULL,
  `currency_code` varchar(191) NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no',
  `usd_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_position` enum('front','behind') NOT NULL DEFAULT 'front',
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `is_cryptocurrency`, `usd_price`, `created_at`, `updated_at`, `currency_position`, `status`) VALUES
(1, 1, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'front', 'enable'),
(2, 1, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'front', 'enable'),
(3, 1, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'behind', 'enable'),
(4, 1, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'front', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `currency_format_settings`
--

CREATE TABLE `currency_format_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL,
  `thousand_separator` varchar(191) DEFAULT NULL,
  `decimal_separator` varchar(191) DEFAULT NULL,
  `sample_data` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency_format_settings`
--

INSERT INTO `currency_format_settings` (`id`, `company_id`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `sample_data`) VALUES
(1, NULL, 'left', 2, ',', '.', NULL),
(2, 1, 'left', 2, ',', '.', '123456.78$');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `required` enum('yes','no') NOT NULL DEFAULT 'no',
  `values` varchar(5000) DEFAULT NULL,
  `show_employee` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) DEFAULT NULL,
  `value` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `model` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `company_id`, `name`, `model`) VALUES
(1, NULL, 'Company', 'App\\Company'),
(2, 1, 'Client', 'App\\ClientDetails'),
(3, 1, 'Employee', 'App\\EmployeeDetails'),
(4, 1, 'Project', 'App\\Project'),
(5, 1, 'Invoice', 'App\\Invoice'),
(6, 1, 'Estimate', 'App\\Estimate'),
(7, 1, 'Task', 'App\\Task'),
(8, 1, 'Expense', 'App\\Expense'),
(9, 1, 'Lead', 'App\\Lead');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_widgets`
--

CREATE TABLE `dashboard_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `widget_name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dashboard_type` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dashboard_widgets`
--

INSERT INTO `dashboard_widgets` (`id`, `company_id`, `widget_name`, `status`, `created_at`, `updated_at`, `dashboard_type`) VALUES
(1, 1, 'total_clients', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(2, 1, 'total_employees', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(3, 1, 'total_projects', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(4, 1, 'total_unpaid_invoices', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(5, 1, 'total_hours_logged', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(6, 1, 'total_pending_tasks', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(7, 1, 'total_today_attendance', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(8, 1, 'total_unresolved_tickets', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(9, 1, 'total_resolved_tickets', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(10, 1, 'recent_earnings', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(11, 1, 'settings_leaves', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(12, 1, 'new_tickets', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(13, 1, 'overdue_tasks', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(14, 1, 'completed_tasks', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(15, 1, 'pending_follow_up', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(16, 1, 'project_activity_timeline', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(17, 1, 'user_activity_timeline', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'admin-dashboard'),
(18, 1, 'total_clients', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(19, 1, 'total_leads', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(20, 1, 'total_lead_conversions', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(21, 1, 'total_contracts_generated', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(22, 1, 'total_contracts_signed', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(23, 1, 'client_wise_earnings', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(24, 1, 'client_wise_timelogs', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(25, 1, 'lead_vs_status', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(26, 1, 'lead_vs_source', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(27, 1, 'latest_client', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(28, 1, 'recent_login_activities', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-client-dashboard'),
(29, 1, 'total_paid_invoices', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(30, 1, 'total_expenses', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(31, 1, 'total_earnings', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(32, 1, 'total_profit', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(33, 1, 'total_pending_amount', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(34, 1, 'invoice_overview', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(35, 1, 'estimate_overview', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(36, 1, 'proposal_overview', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(37, 1, 'invoice_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(38, 1, 'estimate_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(39, 1, 'expense_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(40, 1, 'payment_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(41, 1, 'due_payments_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(42, 1, 'proposal_tab', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(43, 1, 'earnings_by_client', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(44, 1, 'earnings_by_projects', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-finance-dashboard'),
(45, 1, 'total_leaves_approved', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(46, 1, 'total_new_employee', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(47, 1, 'total_employee_exits', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(48, 1, 'average_attendance', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(49, 1, 'department_wise_employee', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(50, 1, 'designation_wise_employee', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(51, 1, 'gender_wise_employee', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(52, 1, 'role_wise_employee', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(53, 1, 'leaves_taken', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(54, 1, 'late_attendance_mark', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-hr-dashboard'),
(55, 1, 'total_project', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-project-dashboard'),
(56, 1, 'total_hours_logged', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-project-dashboard'),
(57, 1, 'total_overdue_project', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-project-dashboard'),
(58, 1, 'status_wise_project', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-project-dashboard'),
(59, 1, 'pending_milestone', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-project-dashboard'),
(60, 1, 'total_unresolved_tickets', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard'),
(61, 1, 'total_unassigned_ticket', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard'),
(62, 1, 'type_wise_ticket', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard'),
(63, 1, 'status_wise_ticket', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard'),
(64, 1, 'channel_wise_ticket', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard'),
(65, 1, 'new_tickets', 1, '2023-02-14 05:30:49', '2023-02-14 05:30:49', 'admin-ticket-dashboard');

-- --------------------------------------------------------

--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussions`
--

CREATE TABLE `discussions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_category_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `color` varchar(20) DEFAULT '#232629',
  `user_id` int(10) UNSIGNED NOT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `best_answer_id` int(10) UNSIGNED DEFAULT NULL,
  `last_reply_by_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_categories`
--

CREATE TABLE `discussion_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) NOT NULL,
  `color` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_files`
--

CREATE TABLE `discussion_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_reply_id` int(10) UNSIGNED DEFAULT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discussion_replies`
--

CREATE TABLE `discussion_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_notification_settings`
--

CREATE TABLE `email_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `setting_name` varchar(191) NOT NULL,
  `send_email` enum('yes','no') NOT NULL DEFAULT 'no',
  `send_slack` enum('yes','no') NOT NULL DEFAULT 'no',
  `send_push` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_notification_settings`
--

INSERT INTO `email_notification_settings` (`id`, `company_id`, `setting_name`, `send_email`, `send_slack`, `send_push`, `created_at`, `updated_at`) VALUES
(7, NULL, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(8, NULL, 'Employee Assign to Project', 'yes', 'no', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(9, NULL, 'New Notice Published', 'no', 'no', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(10, NULL, 'User Assign to Task', 'yes', 'no', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(11, 1, 'New Expense/Added by Admin', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(12, 1, 'New Expense/Added by Member', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(13, 1, 'Expense Status Changed', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(14, 1, 'New Support Ticket Request', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(15, 1, 'User Registration/Added by Admin', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(16, 1, 'Employee Assign to Project', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(17, 1, 'New Notice Published', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(18, 1, 'User Assign to Task', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(19, 1, 'New Leave Application', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(20, 1, 'Task Completed', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(21, 1, 'Invoice Create/Update Notification', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(22, 1, 'Payment Create/Update Notification', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(23, 1, 'Discussion Reply', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(24, 1, 'New Project/Added by Admin', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(25, 1, 'New Project/Added by Member', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(26, 1, 'Project File Added', 'yes', 'no', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(27, 1, 'Lead notification', 'yes', 'no', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_id` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `slack_username` varchar(191) DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `designation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joining_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_date` date DEFAULT NULL,
  `attendance_reminder` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `company_id`, `user_id`, `employee_id`, `address`, `hourly_rate`, `slack_username`, `department_id`, `designation_id`, `created_at`, `updated_at`, `joining_date`, `last_date`, `attendance_reminder`) VALUES
(1, 1, 2, 'EMP002', 'address', 46, NULL, NULL, NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', '2023-02-13 18:30:00', NULL, NULL),
(2, 1, 3, 'EMP003', 'address', 16, NULL, NULL, NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', '2023-02-13 18:30:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE `employee_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `hashname` varchar(200) NOT NULL,
  `size` varchar(200) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_faqs`
--

CREATE TABLE `employee_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `employee_faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_faq_categories`
--

CREATE TABLE `employee_faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_faq_files`
--

CREATE TABLE `employee_faq_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `employee_faq_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_quotas`
--

CREATE TABLE `employee_leave_quotas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `no_of_leaves` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_leave_quotas`
--

INSERT INTO `employee_leave_quotas` (`id`, `company_id`, `user_id`, `leave_type_id`, `no_of_leaves`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 4, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49'),
(2, 1, 2, 5, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49'),
(3, 1, 2, 6, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49'),
(4, 1, 3, 4, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49'),
(5, 1, 3, 5, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49'),
(6, 1, 3, 6, 5, '2023-02-14 05:30:49', '2023-02-14 05:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_teams`
--

CREATE TABLE `employee_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `estimate_number` varchar(191) DEFAULT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting','sent','draft','canceled') NOT NULL DEFAULT 'waiting',
  `note` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` varchar(191) NOT NULL,
  `discount_type` varchar(191) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `item_summary` text DEFAULT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `event_name` varchar(191) NOT NULL,
  `label_color` varchar(191) NOT NULL,
  `where` varchar(191) NOT NULL,
  `description` mediumtext NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `repeat` enum('yes','no') NOT NULL DEFAULT 'no',
  `repeat_every` int(11) DEFAULT NULL,
  `repeat_cycles` int(11) DEFAULT NULL,
  `repeat_type` enum('day','week','month','year') NOT NULL DEFAULT 'day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `event_type_id` int(10) UNSIGNED DEFAULT NULL,
  `event_unique_id` varchar(191) DEFAULT NULL,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

CREATE TABLE `event_attendees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_types`
--

CREATE TABLE `event_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(191) DEFAULT NULL,
  `price` double NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `can_claim` tinyint(1) NOT NULL DEFAULT 1,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expenses_recurring_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category`
--

CREATE TABLE `expenses_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_category_roles`
--

CREATE TABLE `expenses_category_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `expenses_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses_recurring`
--

CREATE TABLE `expenses_recurring` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `day_of_month` int(11) DEFAULT 1,
  `day_of_week` int(11) DEFAULT 1,
  `payment_method` varchar(191) DEFAULT NULL,
  `rotation` enum('monthly','weekly','bi-weekly','quarterly','half-yearly','annually','daily') NOT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `unlimited_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `bill` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text NOT NULL,
  `faq_category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_categories`
--

CREATE TABLE `faq_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq_files`
--

CREATE TABLE `faq_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `faq_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `icon` varchar(200) DEFAULT NULL,
  `type` enum('image','icon','task','bills','team','apps') NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `front_feature_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `language_setting_id`, `title`, `description`, `image`, `icon`, `type`, `created_at`, `updated_at`, `front_feature_id`) VALUES
(1, NULL, 'Meet Your Business Needs', '<p>Manage your projects and your talent in a single system, resulting in empowered teams, satisfied clients, and increased profitability.</p><ul class=\"list1 border-top pt-5 mt-5\">\n                            <li class=\"mb-3\">\n                                Keep a track of all your projects in most simple way.\n                            </li>\n                            <li class=\"mb-3\">\n                                Assign tasks to project members and track the status.\n                            </li>\n                            <li class=\"mb-3\">\n                                Add members to your projects and keep them in sync  with the progress.\n                            </li>\n                        </ul>', NULL, NULL, 'image', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(2, NULL, 'Analyse Your Workflow', '<p>Reports section to analyse what\'s working and what\'s not for your business</p><ul class=\"list1 border-top pt-5 mt-5\">\n                            <li class=\"mb-3\">\n                                It Shows how much you earned and how much you spent.\n                            </li>\n                            <li class=\"mb-3\">\n                                Tiket report shows you Open vs Closed tickets.\n                            </li>\n                            <li class=\"mb-3\">\n                                It creates task report to track completed vs pending tasks.\n                            </li>\n                        </ul>', NULL, NULL, 'image', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(3, NULL, 'Manage your support tickets efficiently', '<p>Whether someone\'s internet is not working, someone is facing issue with housekeeping or need something regarding their work they can raise a ticket for all their problems.</p><ul class=\"list1 border-top pt-5 mt-5\"><li class=\"mb-3\">Admin can assign the tickets to respective department agents.</li></ul>', NULL, NULL, 'image', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(4, NULL, 'Responsive', 'Your website works on any device: desktop, tablet or mobile.', NULL, 'fas fa-desktop', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(5, NULL, 'Customizable', 'You can easily read, edit, and write your own code, or change everything.', NULL, 'fas fa-wrench', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(6, NULL, 'UI Elements', 'There is a bunch of useful and necessary elements for developing your website.', NULL, 'fas fa-cubes', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(7, NULL, 'Clean Code', 'You can find our code well organized, commented and readable.', NULL, 'fas fa-code', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(8, NULL, 'Documented', 'As you can see in the source code, we provided a comprehensive documentation.', NULL, 'far fa-file-alt', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(9, NULL, 'Free Updates', 'When you purchase this template, you\'ll freely receive future updates.', NULL, 'fas fa-download', 'icon', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(10, NULL, 'Track Projects', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Keep a track of all your projects in the most simple way.</span>', NULL, 'fas fa-desktop', 'task', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1),
(11, NULL, 'Add Members', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Add members to your projects and keep them in sync with the progress.</span>', NULL, 'fas fa-users', 'task', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1),
(12, NULL, 'Assign Tasks', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Your website is fully responsive, it will work on any device, desktop, tablet and mobile.</span>', NULL, 'fas fa-list', 'task', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1),
(13, NULL, 'Estimates', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Create estimates how much project can cost and send to your clients.</span>', NULL, 'fas fa-calculator', 'bills', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 2),
(14, NULL, 'Invoices', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Simple and professional invoices can be download in form of PDF.</span>', NULL, 'far fa-file-alt', 'bills', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 2),
(15, NULL, 'Payments', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Track payments done by clients in the payment section.</span>', NULL, 'fas fa-money-bill-alt', 'bills', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 2),
(16, NULL, 'Tickets', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">When someone is facing a problem, they can raise a ticket for their problems. Admin can assign the tickets to respective department agents.</span>', NULL, 'fas fa-ticket-alt', 'team', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 3),
(17, NULL, 'Leaves', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Employees can apply for the multiple leaves from their panel. Admin can approve or reject the leave applications.</span>', NULL, 'fas fa-ban', 'team', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 3),
(18, NULL, 'Attendance', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px; text-align: center;\">Attendance module allows employees to clock-in and clock-out, right from their dashboard. Admin can track the attendance of the team.</span>', NULL, 'far fa-check-circle', 'team', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 3),
(19, NULL, 'OneSignal', NULL, NULL, NULL, 'apps', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(20, NULL, 'Slack', NULL, NULL, NULL, 'apps', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL),
(21, NULL, 'Paypal', NULL, NULL, NULL, 'apps', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `file_storage`
--

CREATE TABLE `file_storage` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

CREATE TABLE `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `filesystem` varchar(191) NOT NULL,
  `auth_keys` text DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer_menu`
--

CREATE TABLE `footer_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `video_link` varchar(191) DEFAULT NULL,
  `video_embed` text DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `hash_name` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `type` enum('header','footer','both') DEFAULT 'footer',
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `footer_menu`
--

INSERT INTO `footer_menu` (`id`, `language_setting_id`, `name`, `slug`, `description`, `created_at`, `updated_at`, `video_link`, `video_embed`, `file_name`, `hash_name`, `external_link`, `type`, `status`) VALUES
(1, NULL, 'Terms of use', 'terms-of-use', '<div><b><span style=\"font-size: 14px;\"><span style=\"font-size: 14px;\">T</span><span style=\"font-size: 14px;\">ERMS OF USE FOR WORKSUITE.BIZ</span></span></b></div><div><br></div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div><br></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div>THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</div><div>UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any Materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India,Terms of Use for worksuite.biz</div><div>The use of any product, service or feature (the \"Materials\") available through the internet web sites accessible at Worksuite.com (the \"Web Site\") by any user of the Web Site (\"You\" or \"Your\" hereafter) shall be governed by the following terms of use:</div><div>This Web Site is provided by Worksuite, a partnership awaiting registration with Government of India, and shall be used for informational purposes only. By using the Web Site or downloading Materials from the Web Site, You hereby agree to abide by the terms and conditions set forth in this Terms of Use. In the event of You not agreeing to these terms and conditions, You are requested by Worksuite not to use the Web Site or download Materials from the Web Site. This Web Site, including all Materials present (excluding any applicable third party materials), is the property of Worksuite and is copyrighted and protected by worldwide copyright laws and treaty provisions. You hereby agree to comply with all copyright laws worldwide in Your use of this Web Site and to prevent any unauthorized copying of the Materials. Worksuite does not grant any express or implied rights under any patents, trademarks, copyrights or trade secret information.</div><div>Worksuite has business relationships with many customers, suppliers, governments, and others. For convenience and simplicity, words like joint venture, partnership, and partner are used to indicate business relationships involving common activities and interests, and those words may not indicate precise legal relationships.</div><div><br></div><div><b><span style=\"font-size: 14px;\">LIMITED LICENSE:</span></b></div><div>Subject to the terms and conditions set forth in these Terms of Use, Worksuite grants You a non-exclusive, non-transferable, limited right to access, use and display this Web Site and the Materials thereon. You agree not to interrupt or attempt to interrupt the operation of the Web Site in any manner. Unless otherwise specified, the Web Site is for Your personal and non-commercial use. You shall not modify, copy, distribute, transmit, display, perform, reproduce, publish, license, create derivative works from, transfer, or sell any information, software, products or services obtained from this Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">THIRD-PARTY CONTENT</span></b></div><div>The Web Site makes information of third parties available, including articles, analyst reports, news reports, and company information, including any regulatory authority, content licensed under Content Licensed under Creative Commons Attribution License, and other data from external sources (the \"Third Party Content\"). You acknowledge and agree that the Third Party Content is not created or endorsed by Worksuite. The provision of Third Party Content is for general informational purposes only and does not constitute a recommendation or solicitation to purchase or sell any securities or shares or to make any other type of investment or investment decision. In addition, the Third Party Content is not intended to provide tax, legal or investment advice. You acknowledge that the Third Party Content provided to You is obtained from sources believed to be reliable, but that no guarantees are made by Worksuite or the providers of the Third Party Content as to its accuracy, completeness, timeliness. You agree not to hold Worksuite, any business offering products or services through the Web Site or any provider of Third Party Content liable for any investment decision or other transaction You may make based on Your reliance on or use of such data, or any liability that may arise due to delays or interruptions in the delivery of the Third Party Content for any reason</div><div>By using any Third Party Content, You may leave this Web Site and be directed to an external website, or to a website maintained by an entity other than Worksuite. If You decide to visit any such site, You do so at Your own risk and it is Your responsibility to take all protective measures to guard against viruses or any other destructive elements. Worksuite makes no warranty or representation regarding, and does not endorse, any linked web sites or the information appearing thereon or any of the products or services described thereon. Links do not imply that Worksuite or this Web Site sponsors, endorses, is affiliated or associated with, or is legally authorized to use any trademark, trade name, logo or copyright symbol displayed in or accessible through the links, or that any linked site is authorized to use any trademark, trade name, logo or copyright symbol of Worksuite or any of its affiliates or subsidiaries. You hereby expressly acknowledge and agree that the linked sites are not under the control of Worksuite and Worksuite is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Worksuite is not responsible for webcasting or any other form of transmission received from any linked site. Worksuite is providing these links to You only as a convenience, and the inclusion of any link shall not be construed to imply endorsement by Worksuite in any manner of the website.</div><div><br></div><div><b><span style=\"font-size: 14px;\">NO WARRANTIES</span></b></div><div>THIS WEB SITE, THE INFORMATION AND MATERIALS ON THE SITE, AND ANY SOFTWARE MADE AVAILABLE ON THE WEB SITE, ARE PROVIDED \"AS IS\" WITHOUT ANY REPRESENTATION OR WARRANTY, EXPRESS OR IMPLIED, OF ANY KIND, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF MERCHANTABILITY, NON INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE. THERE IS NO WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, REGARDING THIRD PARTY CONTENT. INSPITE OF FROIDEN BEST ENDEAVOURS, THERE IS NO WARRANTY ON BEHALF OF FROIDEN THAT THIS WEB SITE WILL BE FREE OF ANY COMPUTER VIRUSES. SOME JURISDICTIONS DO NOT ALLOW FOR THE EXCLUSION OF IMPLIED WARRANTIES, SO THE ABOVE EXCLUSIONS MAY NOT APPLY TO YOU.</div><div>LIMITATION OF DAMAGES:</div><div>IN NO EVENT SHALL FROIDEN OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE LIABLE TO ANY ENTITY FOR ANY DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL OR OTHER DAMAGES (INCLUDING, WITHOUT LIMITATION, ANY LOST PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION OR PROGRAMS OR OTHER DATA ON YOUR INFORMATION HANDLING SYSTEM) THAT ARE RELATED TO THE USE OF, OR THE INABILITY TO USE, THE CONTENT, MATERIALS, AND FUNCTIONS OF THIS WEB SITE OR ANY LINKED WEB SITE, EVEN IF FROIDEN IS EXPRESSLY ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLAIMER:</span></b></div><div><span style=\"font-size: 12px;\">THE WEB SITE MAY CONTAIN INACCURACIES AND TYPOGRAPHICAL AND CLERICAL ERRORS. FROIDEN EXPRESSLY DISCLAIMS ANY OBLIGATION(S) TO UPDATE THIS WEBSITE OR ANY OF THE MATERIALS ON THIS WEBSITE. FROIDEN DOES NOT WARRANT THE ACCURACY OR COMPLETENESS OF THE MATERIALS OR THE RELIABILITY OF ANY ADVICE, OPINION, STATEMENT OR OTHER INFORMATION DISPLAYED OR DISTRIBUTED THROUGH THE WEB SITE. YOU ACKNOWLEDGE THAT ANY RELIANCE ON ANY SUCH OPINION, ADVICE, STATEMENT, MEMORANDUM, OR INFORMATION SHALL BE AT YOUR SOLE RISK. FROIDEN RESERVES THE RIGHT, IN ITS SOLE DISCRETION, TO CORRECT ANY ERRORS OR OMISSIONS IN ANY PORTION OF THE WEB SITE. FROIDEN MAY MAKE ANY OTHER CHANGES TO THE WEB SITE, THE MATERIALS AND THE PRODUCTS, PROGRAMS, SERVICES OR PRICES (IF ANY) DESCRIBED IN THE WEB SITE AT ANY TIME WITHOUT NOTICE. THIS WEB SITE IS FOR INFORMATIONAL PURPOSES ONLY AND SHOULD NOT BE CONSTRUED AS TECHNICAL ADVICE OF ANY MANNER.</span></div><div><span style=\"font-size: 12px;\">UNLAWFUL AND/OR PROHIBITED USE OF THE WEB SITE</span></div><div>As a condition of Your use of the Web Site, You shall not use the Web Site for any purpose(s) that is unlawful or prohibited by the Terms of Use. You shall not use the Web Site in any manner that could damage, disable, overburden, or impair any Worksuite server, or the network(s) connected to any Worksuite server, or interfere with any other party\'s use and enjoyment of any services associated with the Web Site. You shall not attempt to gain unauthorized access to any section of the Web Site, other accounts, computer systems or networks connected to any Worksuite server or to any of the services associated with the Web Site, through hacking, password mining or any other means. You shall not obtain or attempt to obtain any materials or information through any means not intentionally made available through the Web Site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INDEMNITY:</span></b></div><div>You agree to indemnify and hold harmless Worksuite, its subsidiaries and affiliates from any claim, cost, expense, judgment or other loss relating to Your use of this Web Site in any manner, including without limitation of the foregoing, any action You take which is in violation of the terms and conditions of these Terms of Use and against any applicable law.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES:</span></b></div><div>Worksuite reserves the rights, at its sole discretion, to change, modify, add or remove any portion of these Terms of Use in whole or in part, at any time. Changes in these Terms of Use will be effective when notice of such change is posted. Your continued use of the Web Site after any changes to these Terms of Use are posted will be considered acceptance of those changes. Worksuite may terminate, change, suspend or discontinue any aspect of the Web Site, including the availability of any feature(s) of the Web Site, at any time. Worksuite may also impose limits on certain features and services or restrict Your access to certain sections or all of the Web Site without notice or liability. You hereby acknowledge and agree that Worksuite may terminate the authorization, rights, and license given above at any point of time at its own sole discretion, and upon such termination; You shall immediately destroy all Materials.</div><div><br></div><div><b><span style=\"font-size: 14px;\">INTERNATIONAL USERS AND CHOICE OF LAW:</span></b></div><div>This Site is controlled, operated, and administered by Worksuite from within India. Worksuite makes no representation that Materials on this Web Site are appropriate or available for use at any other location(s) outside India. Any access to this Web Site from territories where their contents are illegal is prohibited. You may not use the Web Site or export the Materials in violation of any applicable export laws and regulations. If You access this Web Site from a location outside India, You are responsible for compliance with all local laws.</div><div>These Terms of Use shall be governed by the laws of India, without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect. without giving effect to its conflict of laws provisions. You agree that the appropriate court(s) in Bangalore, India, will have the exclusive jurisdiction to resolve all disputes arising under these Terms of Use and You hereby consent to personal jurisdiction in such forum.</div><div>These Terms of Use constitute the entire agreement between Worksuite and You with respect to Your use of the Web Site. Any claim You may have with respect to Your use of the Web Site must be commenced within one (1) year of the cause of action. If any provision(s) of this Terms of Use is held by a court of competent jurisdiction to be contrary to law then such provision(s) shall be severed from this Terms of Use and the other remaining provisions of this Terms of Use shall remain in full force and effect.</div>', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, NULL, NULL, NULL, NULL, 'footer', 'active'),
(2, NULL, 'Privacy Policy', 'privacy-policy', '<div><b><span style=\"font-size: 14px;\">WHAT DO WE DO WITH YOUR INFORMATION?</span></b></div><div>When you purchase something from our store, as part of the buying and selling process, we collect the personal information you give us such as your name, address, and email address.</div><div><br></div><div>When you browse our store, we also automatically receive your computer’s internet protocol (IP) address in order to provide us with information that helps us learn about your browser and operating system.</div><div><b><br></b></div><div><b>How do you get my consent?</b></div><div>When you provide us with personal information to complete a transaction, verify your credit card, place an order, arrange for a delivery or return a purchase, we imply that you consent to our collecting it and using it for that specific reason only.</div><div><br></div><div>If we ask for your personal information for a secondary reason, like marketing, we will either ask you directly for your expressed consent, or provide you with an opportunity to say no.</div><div><br></div><div><b>How do I withdraw my consent?</b></div><div>If after you opt-in, you change your mind, you may withdraw your consent for us to contact you, for the continued collection, use or disclosure of your information, at any time, by contacting us at <b>support@worksuite.biz</b> or mailing us at my address</div><div><br></div><div><b><span style=\"font-size: 14px;\">DISCLOSURE</span></b></div><div>We may disclose your personal information if we are required by law to do so or if you violate our Terms of Service.</div><div><br></div><div><b><span style=\"font-size: 14px;\">PAYMENT</span></b></div><div>We use Razorpay for processing payments. We/Razorpay do not store your card data on their servers. The data is encrypted through the Payment Card Industry Data Security Standard (PCI-DSS) when processing payment. Your purchase transaction data is only used as long as is necessary to complete your purchase transaction. After that is complete, your purchase transaction information is not saved.</div><div><br></div><div>Our payment gateway adheres to the standards set by PCI-DSS as managed by the PCI Security Standards Council, which is a joint effort of brands like Visa, MasterCard, American Express, and Discover.</div><div><br></div><div>PCI-DSS requirements help ensure the secure handling of credit card information by our store and its service providers.</div><div><br></div><div>For more insight, you may also want to read terms and conditions of Razorpay on https://razorpay.com</div><div><b><br></b></div><div><b><span style=\"font-size: 14px;\">THIRD-PARTY SERVICES</span></b></div><div>In general, the third-party providers used by us will only collect, use, and disclose your information to the extent necessary to allow them to perform the services they provide to us.</div><div><br></div><div>However, certain third-party service providers, such as payment gateways and other payment transaction processors, have their own privacy policies with respect to the information we are required to provide to them for your purchase-related transactions.</div><div><br></div><div>For these providers, we recommend that you read their privacy policies so you can understand the manner in which your personal information will be handled by these providers.</div><div><br></div><div>In particular, remember that certain providers may be located in or have facilities that are located in a different jurisdiction than either you or us. So if you elect to proceed with a transaction that involves the services of a third-party service provider, then your information may become subject to the laws of the jurisdiction(s) in which that service provider or its facilities are located.</div><div><br></div><div>Once you leave our store’s website or are redirected to a third-party website or application, you are no longer governed by this Privacy Policy or our website’s Terms of Service.</div><div><br></div><div><b><span style=\"font-size: 14px;\">Links</span></b></div><div>When you click on links on our store, they may direct you away from our site. We are not responsible for the privacy practices of other sites and encourage you to read their privacy statements.</div><div><br></div><div><b><span style=\"font-size: 14px;\">SECURITY</span></b></div><div>To protect your personal information, we take reasonable precautions and follow industry best practices to make sure it is not inappropriately lost, misused, accessed, disclosed, altered or destroyed.</div><div><br></div><div><b><span style=\"font-size: 14px;\">COOKIES</span></b></div><div>We use cookies to maintain session of your user. It is not used to personally identify you on other websites.</div><div><br></div><div><b><span style=\"font-size: 14px;\">AGE OF CONSENT</span></b></div><div>By using this site, you represent that you are at least the age of majority in your state or province of residence, or that you are the age of majority in your state or province of residence and you have given us your consent to allow any of your minor dependents to use this site.</div><div><br></div><div><b><span style=\"font-size: 14px;\">CHANGES TO THIS PRIVACY POLICY</span></b></div><div>We reserve the right to modify this privacy policy at any time, so please review it frequently. Changes and clarifications will take effect immediately upon their posting on the website. If we make material changes to this policy, we will notify you here that it has been updated, so that you are aware of what information we collect, how we use it, and under what circumstances, if any, we use and/or disclose it.</div><div><br></div><div>If our store is acquired or merged with another company, your information may be transferred to the new owners so that we may continue to sell products to you.</div><div><br></div><div><b><span style=\"font-size: 14px;\">QUESTIONS AND CONTACT INFORMATION</span></b></div><div>If you would like to: access, correct, amend or delete any personal information we have about you, register a complaint, or simply want more information contact our Privacy Compliance Officer at <b>contactus@worksuite.biz</b> or by mail at <i><b>your address here</b></i></div>', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, NULL, NULL, NULL, NULL, 'footer', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `front_clients`
--

CREATE TABLE `front_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_clients`
--

INSERT INTO `front_clients` (`id`, `language_setting_id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Client 1', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(2, NULL, 'Client 2', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(3, NULL, 'Client 3', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(4, NULL, 'Client 4', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `front_details`
--

CREATE TABLE `front_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `get_started_show` enum('yes','no') NOT NULL DEFAULT 'yes',
  `sign_in_show` enum('yes','no') NOT NULL DEFAULT 'yes',
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `social_links` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `primary_color` varchar(191) DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `custom_css_theme_two` longtext DEFAULT NULL,
  `locale` varchar(191) DEFAULT 'en',
  `contact_html` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_details`
--

INSERT INTO `front_details` (`id`, `get_started_show`, `sign_in_show`, `address`, `phone`, `email`, `social_links`, `created_at`, `updated_at`, `primary_color`, `custom_css`, `custom_css_theme_two`, `locale`, `contact_html`) VALUES
(1, 'yes', 'yes', '4868  Ben Street Lansing Michigan 48906', '+91 1234567890', 'company@example.com', '[{\"name\":\"facebook\",\"link\":\"https:\\/\\/facebook.com\"},{\"name\":\"twitter\",\"link\":\"https:\\/\\/twitter.com\"},{\"name\":\"instagram\",\"link\":\"https:\\/\\/instagram.com\"},{\"name\":\"dribbble\",\"link\":\"https:\\/\\/dribbble.com\"},{\"name\":\"youtube\",\"link\":\"https:\\/\\/www.youtube.com\"}]', '2023-02-14 05:30:48', '2023-02-14 05:30:48', '#e94033', NULL, NULL, 'en', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_faqs`
--

CREATE TABLE `front_faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `question` varchar(191) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_faqs`
--

INSERT INTO `front_faqs` (`id`, `language_setting_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Can i see demo?', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px;\">Yes, definitely. We would be happy to demonstrate you Worksuite through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id worksuite@froiden.com.</span>', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(2, NULL, 'How can i update app?', '<span style=\"color: rgb(68, 68, 68); font-family: Lato, sans-serif; font-size: 16px;\">Yes, definitely. We would be happy to demonstrate you Worksuite through a web conference at your convenience. Please submit a query on our contact us page or drop a mail to our mail id worksuite@froiden.com.</span>', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `front_features`
--

CREATE TABLE `front_features` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_features`
--

INSERT INTO `front_features` (`id`, `language_setting_id`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Task Management', 'Manage your projects and your talent in a single system, resulting in empowered teams, satisfied clients, and increased profitability.', 'enable', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(2, NULL, 'Manages All Your Bills', 'Manage your Automate billing and revenue recognition to streamline the contract-to-cash cycle.', 'enable', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(3, NULL, 'Manages All Your Bills', 'Manage your Automate billing and revenue recognition to streamline the contract-to-cash cycle.', 'enable', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `front_menu_buttons`
--

CREATE TABLE `front_menu_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `home` varchar(20) DEFAULT 'home',
  `feature` varchar(20) DEFAULT 'feature',
  `price` varchar(20) DEFAULT 'price',
  `contact` varchar(20) DEFAULT 'contact',
  `get_start` varchar(20) DEFAULT 'get_start',
  `login` varchar(20) DEFAULT 'login',
  `contact_submit` varchar(20) DEFAULT 'contact_submit',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_menu_buttons`
--

INSERT INTO `front_menu_buttons` (`id`, `language_setting_id`, `home`, `feature`, `price`, `contact`, `get_start`, `login`, `contact_submit`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Home', 'Features', 'Pricing', 'Contact', 'Get Started', 'Login', 'Submit Enquiry', '2023-02-14 05:30:30', '2023-02-14 05:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `front_widgets`
--

CREATE TABLE `front_widgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `widget_code` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gdpr_settings`
--

CREATE TABLE `gdpr_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `enable_gdpr` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer_area` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer_footer` tinyint(1) NOT NULL DEFAULT 0,
  `top_information_block` longtext DEFAULT NULL,
  `enable_export` tinyint(1) NOT NULL DEFAULT 0,
  `data_removal` tinyint(1) NOT NULL DEFAULT 0,
  `lead_removal_public_form` tinyint(1) NOT NULL DEFAULT 0,
  `terms_customer_footer` tinyint(1) NOT NULL DEFAULT 0,
  `terms` longtext DEFAULT NULL,
  `policy` longtext DEFAULT NULL,
  `public_lead_edit` tinyint(1) NOT NULL DEFAULT 0,
  `consent_customer` tinyint(1) NOT NULL DEFAULT 0,
  `consent_leads` tinyint(1) NOT NULL DEFAULT 0,
  `consent_block` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gdpr_settings`
--

INSERT INTO `gdpr_settings` (`id`, `company_id`, `enable_gdpr`, `show_customer_area`, `show_customer_footer`, `top_information_block`, `enable_export`, `data_removal`, `lead_removal_public_form`, `terms_customer_footer`, `terms`, `policy`, `public_lead_edit`, `consent_customer`, `consent_leads`, `consent_block`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `global_currencies`
--

CREATE TABLE `global_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `usd_price` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `currency_position` enum('front','behind') NOT NULL DEFAULT 'front',
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `global_currencies`
--

INSERT INTO `global_currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `created_at`, `updated_at`, `deleted_at`, `currency_position`, `status`) VALUES
(1, 'Dollars', '$', 'USD', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, 'front', 'enable'),
(2, 'Pounds', '£', 'GBP', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, 'front', 'enable'),
(3, 'Euros', '€', 'EUR', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, 'behind', 'enable'),
(4, 'Rupee', '₹', 'INR', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, 'front', 'enable');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `timezone` varchar(191) NOT NULL DEFAULT 'Asia/Kolkata',
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `company_name` varchar(191) NOT NULL,
  `company_email` varchar(191) NOT NULL,
  `company_phone` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `login_background` varchar(191) DEFAULT NULL,
  `address` text NOT NULL,
  `website` varchar(191) DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `front_design` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_map_key` varchar(191) NOT NULL,
  `currency_converter_key` varchar(191) NOT NULL,
  `google_captcha_version` varchar(191) NOT NULL DEFAULT 'v2',
  `google_recaptcha_key` text DEFAULT NULL,
  `google_recaptcha_secret` text DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `hide_cron_message` tinyint(1) NOT NULL DEFAULT 0,
  `week_start` int(11) NOT NULL DEFAULT 1,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `email_verification` tinyint(1) NOT NULL DEFAULT 1,
  `logo_background_color` varchar(191) NOT NULL DEFAULT '#171e28',
  `currency_key_version` varchar(191) NOT NULL DEFAULT 'free',
  `show_review_modal` tinyint(1) NOT NULL DEFAULT 1,
  `logo_front` varchar(191) DEFAULT NULL,
  `login_ui` tinyint(1) NOT NULL,
  `active_theme` enum('default','custom') NOT NULL DEFAULT 'default',
  `auth_css` longtext DEFAULT NULL,
  `auth_css_theme_two` longtext DEFAULT NULL,
  `new_company_locale` varchar(191) DEFAULT NULL,
  `frontend_disable` tinyint(1) NOT NULL DEFAULT 0,
  `google_recaptcha_status` tinyint(1) NOT NULL DEFAULT 0,
  `setup_homepage` varchar(191) NOT NULL DEFAULT 'default',
  `custom_homepage_url` varchar(191) DEFAULT NULL,
  `app_debug` tinyint(1) NOT NULL DEFAULT 0,
  `expired_message` text DEFAULT NULL,
  `show_update_popup` tinyint(1) NOT NULL DEFAULT 1,
  `favicon` varchar(191) DEFAULT NULL,
  `enable_register` tinyint(1) NOT NULL DEFAULT 1,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT 0,
  `registration_open` tinyint(1) NOT NULL DEFAULT 1,
  `google_calendar_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `google_client_id` text DEFAULT NULL,
  `google_client_secret` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `currency_id`, `timezone`, `locale`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `last_updated_by`, `front_design`, `created_at`, `updated_at`, `google_map_key`, `currency_converter_key`, `google_captcha_version`, `google_recaptcha_key`, `google_recaptcha_secret`, `purchase_code`, `supported_until`, `hide_cron_message`, `week_start`, `system_update`, `email_verification`, `logo_background_color`, `currency_key_version`, `show_review_modal`, `logo_front`, `login_ui`, `active_theme`, `auth_css`, `auth_css_theme_two`, `new_company_locale`, `frontend_disable`, `google_recaptcha_status`, `setup_homepage`, `custom_homepage_url`, `app_debug`, `expired_message`, `show_update_popup`, `favicon`, `enable_register`, `last_cron_run`, `rtl`, `registration_open`, `google_calendar_status`, `google_client_id`, `google_client_secret`) VALUES
(1, 4, 'Asia/Kolkata', 'en', 'Swayam', 'mail@greenworldin.com', '+91 4868 251186', '43d35cb5f43e879741194754056f62f6.png', NULL, 'GREENWORLD International, Buzzwork, 2nd Floor, Four Points by Sheraton, World Trade Centre, Phase 1, Info Park PO, Kakkanad, Kochi - 682042', 'https://giits.io/', 1, 1, '2023-02-14 05:30:48', '2023-02-14 05:57:46', '', '6c12788708871d0c499d', 'v3', NULL, NULL, NULL, NULL, 0, 1, 0, 0, '#171e28', 'free', 1, '9710deddbca7aa1ff4c1491c343daab7.png', 1, 'custom', NULL, NULL, NULL, 0, 0, 'login', NULL, 1, NULL, 1, '434fa939dba3d307ded5d29862ab31f3.png', 0, NULL, 0, 0, 'inactive', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `google_accounts`
--

CREATE TABLE `google_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `google_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `google_calendar_modules`
--

CREATE TABLE `google_calendar_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_status` tinyint(1) NOT NULL DEFAULT 0,
  `leave_status` tinyint(1) NOT NULL DEFAULT 0,
  `invoice_status` tinyint(1) NOT NULL DEFAULT 0,
  `contract_status` tinyint(1) NOT NULL DEFAULT 0,
  `task_status` tinyint(1) NOT NULL DEFAULT 0,
  `event_status` tinyint(1) NOT NULL DEFAULT 0,
  `holiday_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `occassion` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(191) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('paid','unpaid','partial','canceled','draft','review') NOT NULL DEFAULT 'unpaid',
  `recurring` enum('yes','no') NOT NULL DEFAULT 'no',
  `billing_cycle` int(11) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_original_name` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `credit_note` tinyint(1) NOT NULL DEFAULT 0,
  `show_shipping_address` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED DEFAULT NULL,
  `send_status` tinyint(1) NOT NULL DEFAULT 1,
  `invoice_recurring_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `item_summary` text DEFAULT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring`
--

CREATE TABLE `invoice_recurring` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` double NOT NULL DEFAULT 0,
  `total` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('percent','fixed') NOT NULL DEFAULT 'percent',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `file` varchar(191) DEFAULT NULL,
  `file_original_name` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `show_shipping_address` enum('yes','no') NOT NULL DEFAULT 'no',
  `day_of_month` int(11) DEFAULT 1,
  `day_of_week` int(11) DEFAULT 1,
  `payment_method` varchar(191) DEFAULT NULL,
  `rotation` enum('monthly','weekly','bi-weekly','quarterly','half-yearly','annually','daily') NOT NULL,
  `billing_cycle` int(11) DEFAULT NULL,
  `unlimited_recurring` tinyint(1) NOT NULL DEFAULT 0,
  `client_can_stop` tinyint(1) NOT NULL DEFAULT 1,
  `deleted_at` datetime DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_recurring_items`
--

CREATE TABLE `invoice_recurring_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_recurring_id` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `quantity` double NOT NULL,
  `unit_price` double NOT NULL,
  `amount` double NOT NULL,
  `taxes` text DEFAULT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `item_summary` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

CREATE TABLE `invoice_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(191) NOT NULL,
  `invoice_digit` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `estimate_prefix` varchar(191) NOT NULL DEFAULT 'EST',
  `estimate_digit` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `credit_note_prefix` varchar(191) NOT NULL DEFAULT 'CN',
  `credit_note_digit` int(10) UNSIGNED NOT NULL DEFAULT 3,
  `template` varchar(191) NOT NULL,
  `due_after` int(11) NOT NULL,
  `invoice_terms` text NOT NULL,
  `estimate_terms` text DEFAULT NULL,
  `gst_number` varchar(191) DEFAULT NULL,
  `show_gst` enum('yes','no') DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(80) DEFAULT NULL,
  `hsn_sac_code_show` tinyint(1) NOT NULL DEFAULT 1,
  `locale` varchar(191) DEFAULT 'en',
  `send_reminder` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `company_id`, `invoice_prefix`, `invoice_digit`, `estimate_prefix`, `estimate_digit`, `credit_note_prefix`, `credit_note_digit`, `template`, `due_after`, `invoice_terms`, `estimate_terms`, `gst_number`, `show_gst`, `created_at`, `updated_at`, `logo`, `hsn_sac_code_show`, `locale`, `send_reminder`) VALUES
(1, NULL, 'INV', 3, 'EST', 3, 'CN', 3, 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, NULL, 'no', '2023-02-14 05:30:21', '2023-02-14 05:30:21', NULL, 1, 'en', 0),
(2, 1, 'INV', 3, 'EST', 3, 'CN', 3, 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', NULL, 1, 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` mediumtext NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','resolved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

CREATE TABLE `language_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_code` varchar(191) NOT NULL,
  `language_name` varchar(191) NOT NULL,
  `status` enum('enabled','disabled') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', 'disabled', NULL, NULL),
(2, 'de', 'German', 'disabled', NULL, NULL),
(3, 'es', 'Spanish', 'disabled', NULL, '2023-02-14 05:58:05'),
(4, 'et', 'Estonian', 'disabled', NULL, NULL),
(5, 'fa', 'Farsi', 'disabled', NULL, NULL),
(6, 'fr', 'French', 'disabled', NULL, '2023-02-14 05:58:07'),
(7, 'gr', 'Greek', 'disabled', NULL, NULL),
(8, 'it', 'Italian', 'disabled', NULL, '2023-02-14 05:58:09'),
(9, 'nl', 'Dutch', 'disabled', NULL, NULL),
(10, 'pl', 'Polish', 'disabled', NULL, NULL),
(11, 'pt', 'Portuguese', 'disabled', NULL, NULL),
(12, 'br', 'Portuguese (Brazil)', 'disabled', NULL, NULL),
(13, 'ro', 'Romanian', 'disabled', NULL, NULL),
(14, 'ru', 'Russian', 'disabled', NULL, '2023-02-14 05:58:11'),
(15, 'tr', 'Turkish', 'disabled', NULL, NULL),
(16, 'zh-CN', 'Chinese (S)', 'disabled', NULL, NULL),
(17, 'zh-TW', 'Chinese (T)', 'disabled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `column_priority` int(11) NOT NULL,
  `agent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `website` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `office_phone` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postal_code` varchar(191) DEFAULT NULL,
  `client_name` varchar(191) NOT NULL,
  `client_email` varchar(191) NOT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `next_follow_up` enum('yes','no') NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value` double DEFAULT 0,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_agents`
--

CREATE TABLE `lead_agents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_category`
--

CREATE TABLE `lead_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_custom_forms`
--

CREATE TABLE `lead_custom_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `field_display_name` varchar(191) NOT NULL,
  `field_name` varchar(191) NOT NULL,
  `field_order` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_custom_forms`
--

INSERT INTO `lead_custom_forms` (`id`, `company_id`, `field_display_name`, `field_name`, `field_order`, `status`, `created_at`, `updated_at`, `required`) VALUES
(1, 1, 'Name', 'name', 1, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(2, 1, 'Email', 'email', 2, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(3, 1, 'Company Name', 'company_name', 3, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0),
(4, 1, 'Website', 'website', 4, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0),
(5, 1, 'Address', 'address', 5, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0),
(6, 1, 'Mobile', 'mobile', 6, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0),
(7, 1, 'Message', 'message', 7, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lead_files`
--

CREATE TABLE `lead_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) NOT NULL,
  `hashname` varchar(200) NOT NULL,
  `size` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_follow_up`
--

CREATE TABLE `lead_follow_up` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `remark` longtext DEFAULT NULL,
  `next_follow_up_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'email', NULL, NULL),
(2, NULL, 'google', NULL, NULL),
(3, NULL, 'facebook', NULL, NULL),
(4, NULL, 'friend', NULL, NULL),
(5, NULL, 'direct visit', NULL, NULL),
(6, NULL, 'tv ad', NULL, NULL),
(7, 1, 'email', NULL, NULL),
(8, 1, 'google', NULL, NULL),
(9, 1, 'facebook', NULL, NULL),
(10, 1, 'friend', NULL, NULL),
(11, 1, 'direct visit', NULL, NULL),
(12, 1, 'tv ad', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE `lead_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `default` tinyint(1) NOT NULL,
  `label_color` varchar(191) NOT NULL DEFAULT '#ff0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`id`, `company_id`, `type`, `created_at`, `updated_at`, `priority`, `default`, `label_color`) VALUES
(1, NULL, 'pending', NULL, '2023-02-14 05:30:32', 0, 1, '#ff0000'),
(2, NULL, 'inprocess', NULL, NULL, 0, 0, '#ff0000'),
(3, NULL, 'converted', NULL, NULL, 0, 0, '#ff0000'),
(4, 1, 'pending', NULL, NULL, 1, 1, '#ff0000'),
(5, 1, 'inprocess', NULL, NULL, 2, 0, '#ff0000'),
(6, 1, 'converted', NULL, NULL, 3, 0, '#ff0000');

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `duration` varchar(191) NOT NULL,
  `leave_date` date NOT NULL,
  `reason` text NOT NULL,
  `status` enum('approved','pending','rejected') NOT NULL,
  `reject_reason` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `event_id` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type_name` varchar(191) NOT NULL,
  `color` varchar(191) NOT NULL,
  `no_of_leaves` int(11) NOT NULL DEFAULT 5,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paid` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `company_id`, `type_name`, `color`, `no_of_leaves`, `created_at`, `updated_at`, `paid`) VALUES
(1, NULL, 'Casual', 'success', 5, '2023-02-14 05:30:22', '2023-02-14 05:30:22', 1),
(2, NULL, 'Sick', 'danger', 5, '2023-02-14 05:30:22', '2023-02-14 05:30:22', 1),
(3, NULL, 'Earned', 'info', 5, '2023-02-14 05:30:22', '2023-02-14 05:30:22', 1),
(4, 1, 'Casual', 'success', 5, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1),
(5, 1, 'Sick', 'danger', 5, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1),
(6, 1, 'Earned', 'info', 5, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `licences`
--

CREATE TABLE `licences` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `license_number` char(29) NOT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_person` varchar(70) DEFAULT NULL,
  `billing_name` varchar(100) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `tax_number` varchar(100) DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `next_payment_date` date DEFAULT NULL,
  `status` enum('valid','invalid') NOT NULL DEFAULT 'valid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_time_for`
--

CREATE TABLE `log_time_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `log_time_for` enum('project','task') NOT NULL DEFAULT 'project',
  `auto_timer_stop` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approval_required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log_time_for`
--

INSERT INTO `log_time_for` (`id`, `company_id`, `log_time_for`, `auto_timer_stop`, `created_at`, `updated_at`, `approval_required`) VALUES
(1, 1, 'project', 'no', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_settings`
--

CREATE TABLE `message_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `allow_client_admin` enum('yes','no') NOT NULL DEFAULT 'no',
  `allow_client_employee` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_settings`
--

INSERT INTO `message_settings` (`id`, `company_id`, `allow_client_admin`, `allow_client_employee`, `created_at`, `updated_at`) VALUES
(1, NULL, 'no', 'no', '2023-02-14 05:30:22', '2023-02-14 05:30:22'),
(2, 1, 'yes', 'yes', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193003_create_countries_table', 1),
(2, '2014_04_02_193005_create_translations_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_20_112951_create_user_chat_table', 1),
(6, '2017_03_23_110416_add_column_users_table', 1),
(7, '2017_03_23_111036_create_client_details_table', 1),
(8, '2017_03_23_112028_create_client_contacts_table', 1),
(9, '2017_03_23_112353_create_employee_details_table', 1),
(10, '2017_03_23_114438_create_organisation_settings_table', 1),
(11, '2017_03_23_122646_create_project_category_table', 1),
(12, '2017_03_23_123601_create_projects_table', 1),
(13, '2017_03_23_125424_create_project_members_table', 1),
(14, '2017_03_23_125625_create_project_time_logs_table', 1),
(15, '2017_03_23_130413_create_project_files_table', 1),
(16, '2017_03_24_051800_create_tasks_table', 1),
(17, '2017_03_24_054355_create_notices_table', 1),
(18, '2017_03_24_055005_create_conversation_table', 1),
(19, '2017_03_24_055539_create_conversation_reply_table', 1),
(20, '2017_03_24_055859_create_invoices_table', 1),
(21, '2017_03_24_060421_create_invoice_items_table', 1),
(22, '2017_03_24_060751_create_quotations_table', 1),
(23, '2017_03_24_061241_create_quotation_items_table', 1),
(24, '2017_03_24_061505_create_sticky_notes_table', 1),
(25, '2017_03_24_064541_create_issues_table', 1),
(26, '2017_03_29_123858_entrust_setup_tables', 1),
(27, '2017_04_04_193158_AddColumnsProjectFilesTable', 1),
(28, '2017_04_05_063103_change_clientid_projectid_invoice_table', 1),
(29, '2017_04_06_051401_add_discount_column_invoice_table', 1),
(30, '2017_04_06_054728_add_status_column_issues_table', 1),
(31, '2017_04_08_152902_add_total_hours_column_time_log_table', 1),
(32, '2017_04_18_095809_create_project_activity_table', 1),
(33, '2017_04_18_103815_create_user_activities_table', 1),
(34, '2017_04_19_101519_create_email_notification_settings_table', 1),
(35, '2017_04_20_185211_add_colour_column_sticky_notes_table', 1),
(36, '2017_04_28_114154_create_notifications_table', 1),
(37, '2017_05_03_131016_add_project_completion_field_projects', 1),
(38, '2017_05_03_174333_create_currencies_table', 1),
(39, '2017_05_05_124330_create_module_settings_table', 1),
(40, '2017_05_05_233111_add_status_column_invoices', 1),
(41, '2017_05_11_140502_add_currency_symbol_column_invoices', 1),
(42, '2017_05_11_170244_add_currency_id_column_organisation_settings_table', 1),
(43, '2017_05_22_172748_add_timezone_column_settings_table', 1),
(44, '2017_05_24_120216_create_smtp_settings_table', 1),
(45, '2017_05_31_112158_create_universal_search_table', 1),
(46, '2017_06_22_131112_add_locale_organisation_settings_table', 1),
(47, '2017_07_13_091922_add_calculate_task_progress_column_project_table', 1),
(48, '2017_07_20_093528_on_delete_setnull_timelog', 1),
(49, '2017_07_21_120958_create_theme_settings_table', 1),
(50, '2017_07_24_113657_add_link_color_column_theme_settings_table', 1),
(51, '2017_07_24_123050_add_login_background_organisation_settings_table', 1),
(52, '2017_07_27_101351_add_column_type_invoice_items_table', 1),
(53, '2017_07_28_102010_create_estimates_table', 1),
(54, '2017_07_28_103230_create_estimate_items_table', 1),
(55, '2017_08_04_064431_create_payments_table', 1),
(56, '2017_08_05_103940_create_payment_gateway_credential_table', 1),
(57, '2017_08_08_055908_add_enable_paypal_column_payment_gateway_table', 1),
(58, '2017_08_09_054230_create_expenses_table', 1),
(59, '2017_08_21_065430_add_exchange_rate_column_currency_table', 1),
(60, '2017_08_21_131318_create_invoice_setting_table', 1),
(61, '2017_08_22_055908_add_expense_email_setting_to_email_notification_setting_table', 1),
(62, '2017_08_28_110759_add_recurring_columns_in_invoice_table', 1),
(63, '2017_08_30_061016_add_plan_id_to_payments_table', 1),
(64, '2017_08_30_093400_create_settings_table', 1),
(65, '2017_08_30_123956_add_slack_username_column_employee_details_table', 1),
(66, '2017_08_30_133725_add_send_slack_column_email_notification_settings_table', 1),
(67, '2017_09_01_060715_add_stipe_column_to_payment_credentials_table', 1),
(68, '2017_09_01_090124_add_customer_id_column_to_payments_table', 1),
(69, '2017_09_02_084049_add_locale_column_users_table', 1),
(70, '2017_09_14_095429_create_ticket_reply_templates_table', 1),
(71, '2017_09_14_095815_create_ticket_types_table', 1),
(72, '2017_09_14_100400_create_ticket_groups_table', 1),
(73, '2017_09_14_100530_create_ticket_tag_list_table', 1),
(74, '2017_09_14_114900_create_ticket_channels_table', 1),
(75, '2017_09_14_115003_create_ticket_agent_groups_table', 1),
(76, '2017_09_14_115004_create_tickets_table', 1),
(77, '2017_09_14_115005_create_ticket_tags_table', 1),
(78, '2017_09_18_064917_add_status_column_ticket_agent_group_table', 1),
(79, '2017_09_24_101700_create_ticket_replies_table', 1),
(80, '2017_09_25_060229_drop_description_column_ticket_table', 1),
(81, '2017_09_25_072611_add_deleted_at_column_tickets', 1),
(82, '2017_09_25_072627_add_deleted_at_column_ticket_reply', 1),
(83, '2017_10_03_094922_ticket_notification_migration', 1),
(84, '2017_10_03_134003_add_latitude_longitude_column', 1),
(85, '2017_10_12_111741_create_attendance_setting_table', 1),
(86, '2017_10_13_051909_create_attendance_table', 1),
(87, '2017_10_26_051335_add_mail_from_email_column_smtp_settings_table', 1),
(88, '2017_10_26_112253_add_office_open_days_column_attendance_settings_table', 1),
(89, '2017_11_01_054603_add_columns_to_client_details', 1),
(90, '2017_11_02_045542_change_on_cascade_project_members', 1),
(91, '2017_11_07_054438_add_project_admin_column_project_table', 1),
(92, '2017_11_07_125619_remove_project_admin_role', 1),
(93, '2017_11_08_045549_make_project_id_nullable_tasks_table', 1),
(94, '2017_11_09_071318_create_taskboard_columns_table', 1),
(95, '2017_11_09_092817_add_column_tasks_table', 1),
(96, '2017_11_20_070830_create_custom_fields_table', 1),
(97, '2017_11_20_071758_create_custom_fields__data_table', 1),
(98, '2017_11_22_071535_create_events_table', 1),
(99, '2017_11_23_065323_add_cryptocurrency_columns', 1),
(100, '2017_11_24_103957_create_event_attendees_table', 1),
(101, '2017_12_07_034433_change cascade users in time log table', 1),
(102, '2017_12_12_071823_create_modules_table', 1),
(103, '2017_12_12_073501_add_module_id_column_permissions_table', 1),
(104, '2017_12_21_114839_change_upload_folder', 1),
(105, '2017_12_28_112910_create_leave_types_table', 1),
(106, '2017_12_30_184422_create_leaves_table', 1),
(107, '2018_01_02_122442_add_leaves_notification_setting', 1),
(108, '2018_01_05_062543_add_user_css_column_theme_settings', 1),
(109, '2018_01_09_180937_add_task_completed_notification_setting', 1),
(110, '2018_01_29_073527_create_message_setting_table', 1),
(111, '2018_04_12_100452_add_dropbox_link_column_project_files_table', 1),
(112, '2018_04_12_123243_create_file_storage_table', 1),
(113, '2018_04_13_072732_create_groups_table', 1),
(114, '2018_04_13_092757_create_employee_groups_table', 1),
(115, '2018_04_17_113657_set_attendance_late_column_default', 1),
(116, '2018_05_07_065407_alter_invoice_id_null_payments', 1),
(117, '2018_05_07_065557_add_currency_id_column_payments_table', 1),
(118, '2018_05_08_064539_add_note_column_invoices', 1),
(119, '2018_05_15_072536_add_project_id_column_payments', 1),
(120, '2018_05_28_094515_set_gateway_column_null_payments_table', 1),
(121, '2018_05_29_070343_change_completed_on_column_to_datetime', 1),
(122, '2018_05_29_114402_populate_file_storage_settings_table', 1),
(123, '2018_05_30_051128_add_google_url_to_project_files_table', 1),
(124, '2018_06_05_092136_create_sub_tasks_table', 1),
(125, '2018_06_06_091511_create_task_comments_table', 1),
(126, '2018_06_11_054204_create_push_subscriptions_table', 1),
(127, '2018_06_14_094059_create_taxes_table', 1),
(128, '2018_06_18_065034_add_tax_id_column_invoice_items_table', 1),
(129, '2018_06_18_071442_add_discount_column_invoice_items_table', 1),
(130, '2018_06_21_052408_change_default_taskboard_columns', 1),
(131, '2018_06_26_160023_add_leave_count_column_leave_types_table', 1),
(132, '2018_06_27_072813_add_leaves_start_from_column', 1),
(133, '2018_06_27_075233_add_joining_date_column', 1),
(134, '2018_06_27_113713_add_gender_column_users_table', 1),
(135, '2018_06_28_054604_add_client_view_task_column_project_table', 1),
(136, '2018_06_28_191256_create_language_settings_table', 1),
(137, '2018_06_29_060331_add_active_theme_column_settings', 1),
(138, '2018_06_29_081128_add_manual_timelog_column_project_timelog', 1),
(139, '2018_06_29_104709_seed_languages', 1),
(140, '2018_08_02_121259_add_minutes_column_time_log_table', 1),
(141, '2018_08_22_103829_add_leaves_module', 1),
(142, '2018_08_22_104302_add_leaves_permissions', 1),
(143, '2018_08_27_114329_add_module_list_in_module_settings', 1),
(144, '2018_08_30_065158_add_status_column_users_table', 1),
(145, '2018_08_31_095814_create_lead_table', 1),
(146, '2018_08_31_095815_create_lead_source_table', 1),
(147, '2018_08_31_095815_create_lead_status_table', 1),
(148, '2018_08_31_095816_create_lead_follow_up_table', 1),
(149, '2018_09_04_095158_alter_lead_table', 1),
(150, '2018_09_04_095816_add_lead_module', 1),
(151, '2018_09_05_102010_create_proposal_table', 1),
(152, '2018_09_05_113230_create_proposal_items_table', 1),
(153, '2018_09_07_051239_alter_lead_website_table', 1),
(154, '2018_09_15_174026_add_default_lead_settings', 1),
(155, '2018_09_17_045718_add_leads_permission', 1),
(156, '2018_09_19_091643_add_remarks_to_payments_table', 1),
(157, '2018_09_19_100708_create_products_table', 1),
(158, '2018_09_21_095816_create_offline_payment_method_table', 1),
(159, '2018_09_25_065158_alter_payment_table', 1),
(160, '2018_09_28_110029_create_log_time_for_table', 1),
(161, '2018_09_28_965158_alter_project_time_log_table', 1),
(162, '2018_10_03_121901_create_packages_table', 1),
(163, '2018_10_03_121902_alter_organisation_settings_table', 1),
(164, '2018_10_04_042418_create_licences_table', 1),
(165, '2018_10_04_082754_add_super_admin_column_in_users_table', 1),
(166, '2018_10_08_091643_alter_project_table', 1),
(167, '2018_10_08_095950_create_subscriptions_table', 1),
(168, '2018_10_08_110029_create_lead_files_table', 1),
(169, '2018_10_08_120639_add_company_id_in_users_table', 1),
(170, '2018_10_10_110029_create_holidays_table', 1),
(171, '2018_10_10_114514_add_company_id_in_teams_table', 1),
(172, '2018_10_10_120621_add_company_id_in_leads_table', 1),
(173, '2018_10_10_123601_create_project_templates_table', 1),
(174, '2018_10_10_125424_create_project_template_members_table', 1),
(175, '2018_10_10_135816_add_holiday_module', 1),
(176, '2018_10_10_251800_create_project_template_tasks_table', 1),
(177, '2018_10_11_044355_add_company_id_in_attendances_table', 1),
(178, '2018_10_11_055814_add_company_id_in_holidays_table', 1),
(179, '2018_10_11_061029_add_company_id_in_projects_table', 1),
(180, '2018_10_11_061955_add_company_id_in_project_category_table', 1),
(181, '2018_10_11_063520_add_company_id_in_project_members_table', 1),
(182, '2018_10_11_065229_add_company_id_in_invoices_table', 1),
(183, '2018_10_11_070557_add_company_id_in_project_activity_table', 1),
(184, '2018_10_11_071656_add_company_id_in_products_table', 1),
(185, '2018_10_11_072547_add_company_id_in_taxes_table', 1),
(186, '2018_10_11_081816_add_company_id_in_tasks_table', 1),
(187, '2018_10_11_083600_add_company_id_in_taskboard_columns_table', 1),
(188, '2018_10_11_100425_add_company_id_in_estimates_table', 1),
(189, '2018_10_11_101701_add_company_id_in_payments_table', 1),
(190, '2018_10_11_102047_add_company_id_in_expenses_table', 1),
(191, '2018_10_11_110008_add_company_id_in_employee_details_table', 1),
(192, '2018_10_11_115208_add_company_id_in_project_time_logs_table', 1),
(193, '2018_10_11_115805_add_company_id_in_user_activities_table', 1),
(194, '2018_10_12_045341_add_company_id_in_tickets_table', 1),
(195, '2018_10_12_051409_add_company_id_in_ticket_channels_table', 1),
(196, '2018_10_12_052646_add_company_id_in_ticket_types_table', 1),
(197, '2018_10_12_060038_add_company_id_in_ticket_groups_table', 1),
(198, '2018_10_12_061136_add_company_id_in_ticket_agent_groups_table', 1),
(199, '2018_10_12_061807_add_company_id_in_ticket_reply_templates_table', 1),
(200, '2018_10_12_072321_add_company_id_in_events_table', 1),
(201, '2018_10_12_090132_add_company_id_in_leave_types_table', 1),
(202, '2018_10_12_090146_add_company_id_in_leaves_table', 1),
(203, '2018_10_12_093431_add_company_id_in_notices_table', 1),
(204, '2018_10_12_110433_add_company_id_in_email_notification_settings_table', 1),
(205, '2018_10_12_110842_add_company_id_in_smtp_settings_table', 1),
(206, '2018_10_15_051607_add_company_id_in_currencies_table', 1),
(207, '2018_10_15_052819_create_global_settings_table', 1),
(208, '2018_10_15_065737_add_company_id_in_theme_settings_table', 1),
(209, '2018_10_15_070856_alter_currency_id_in_companies_table', 1),
(210, '2018_10_15_083914_add_company_id_in_payment_gateway_credentials_table', 1),
(211, '2018_10_15_093625_add_company_id_in_invoice_settings_table', 1),
(212, '2018_10_15_094709_add_company_id_in_slack_settings_table', 1),
(213, '2018_10_15_105445_add_company_id_in_attendance_settings_table', 1),
(214, '2018_10_15_115927_add_company_id_in_custom_field_groups_table', 1),
(215, '2018_10_16_045235_add_company_id_in_module_settings_table', 1),
(216, '2018_10_16_071301_add_company_id_in_roles_table', 1),
(217, '2018_10_16_095816_add_holiday_module_detail', 1),
(218, '2018_10_17_043749_add_company_id_in_message_settings_table', 1),
(219, '2018_10_17_052214_add_company_id_in_file_storage_settings_table', 1),
(220, '2018_10_17_063334_add_company_id_in_lead_sources_table', 1),
(221, '2018_10_17_063359_add_company_id_in_lead_status_table', 1),
(222, '2018_10_17_081757_remove_config_datatable_file', 1),
(223, '2018_10_17_965158_alter_leads_address_table', 1),
(224, '2018_10_17_965168_alter_leads_phone_table', 1),
(225, '2018_10_18_034518_create_stripe_invoices_table', 1),
(226, '2018_10_18_075228_add_column_in_global_settings_table', 1),
(227, '2018_10_18_091643_alter_attendance_setting_table', 1),
(228, '2018_10_19_045718_add_holidays_permission', 1),
(229, '2018_10_20_094413_add_products_module', 1),
(230, '2018_10_20_094504_add_products_permissions', 1),
(231, '2018_10_21_051239_alter_holiday_website_table', 1),
(232, '2018_10_22_050933_alter_state_column_companies_table', 1),
(233, '2018_10_23_071525_remove_company_id_column_smtp_settings_table', 1),
(234, '2018_10_24_041117_add_column_email_verification_code_in_users_table', 1),
(235, '2018_10_24_071300_add_file_column_to_invoices_table', 1),
(236, '2018_10_24_965158_alter_employee_detail_table', 1),
(237, '2018_10_29_965158_alter_attendance_setting_default_table', 1),
(238, '2018_11_02_061629_add_column_in_proposals_table', 1),
(239, '2018_11_10_071300_alter_user_table', 1),
(240, '2018_11_10_122646_create_task_category_table', 1),
(241, '2018_11_15_105021_alter_stripe_invoices_table', 1),
(242, '2018_11_16_072246_add_company_id_in_client_details_table', 1),
(243, '2018_11_16_104747_add_column_in_estimate_items_table', 1),
(244, '2018_11_16_112847_add_column_in_proposals_items_table', 1),
(245, '2018_11_22_044348_add_estimate_number_column_in_estimates_table', 1),
(246, '2018_11_30_965158_alter_invoice_item_table', 1),
(247, '2018_12_12_965158_alter_invoice_estimate_response_table', 1),
(248, '2018_12_14_094504_add_expenses_permissions', 1),
(249, '2018_12_14_194504_add_expenses_permissions_detail', 1),
(250, '2018_12_20_1065158_alter_company_setting_table', 1),
(251, '2018_12_20_965158_alter_estimate_quantity_table', 1),
(252, '2018_12_27_074504_check_verify_purchase_file', 1),
(253, '2018_12_28_075730_create_push_notification_settings_table', 1),
(254, '2018_12_28_082056_add_send_push_column_email_notification_table', 1),
(255, '2018_12_28_123245_add_onesignal_player_id_column_users_table', 1),
(256, '2019_01_02_1065158_alter_module_setting_table', 1),
(257, '2019_01_02_2065158_insert_module_setting_client_table', 1),
(258, '2019_01_04_110029_create_employee_docs_table', 1),
(259, '2019_01_10_063520_add_company_id_in_lead_files_table', 1),
(260, '2019_01_17_045235_add_company_id_in_project_template_table', 1),
(261, '2019_01_17_055235_add_company_id_in_task_category_table', 1),
(262, '2019_01_17_065235_add_company_id_in_employee_docs_table', 1),
(263, '2019_01_17_075235_add_company_id_in_log_time_for_table', 1),
(264, '2019_01_21_1065158_alter_task_creator_table', 1),
(265, '2019_02_06_1065158_alter_attendance_check_table', 1),
(266, '2019_02_08_174333_create_global_currencies_table', 1),
(267, '2019_02_08_275235_add_currency_id_in_global_setting_table', 1),
(268, '2019_02_11_1065158_alter_log_time_for_table', 1),
(269, '2019_02_12_2065158_insert_module_setting_client_task_table', 1),
(270, '2019_02_13_110029_create_skills_table', 1),
(271, '2019_02_13_130029_create_employee_skills_table', 1),
(272, '2019_02_15_1065158_alter_employee_end_date_table', 1),
(273, '2019_02_15_1165158_alter_custom_status_table', 1),
(274, '2019_02_20_074848_create_jobs_table', 1),
(275, '2019_02_22_1165158_add_company_currency_api_google_api', 1),
(276, '2019_02_22_1165158_add_currency_api_google_api', 1),
(277, '2019_02_25_965158_alter_package_max_size_table', 1),
(278, '2019_02_28_965158_alter_package_sort_billing_cycle_table', 1),
(279, '2019_03_04_073501_change_module_id_notice_permissions_table', 1),
(280, '2019_03_05_110029_create_front_detail_table', 1),
(281, '2019_03_05_110039_create_feature_table', 1),
(282, '2019_03_08_1165158_create_stripe_table', 1),
(283, '2019_03_08_965158_alter_invoice_project_id_null_table', 1),
(284, '2019_03_11_132024_seed_front_end_data', 1),
(285, '2019_03_18_1165158_alter_stripe_setting_table', 1),
(286, '2019_03_19_061905_add_google_recaptcha_key_column_global_settings', 1),
(287, '2019_03_19_1265158_paypal_invoice_table', 1),
(288, '2019_04_03_965158_alter_project_deadline_table', 1),
(289, '2019_04_04_074848_alter_invoice_setting_table', 1),
(290, '2019_04_04_075848_alter_client_Details_table', 1),
(291, '2019_04_04_1165158_alter_package_default_table', 1),
(292, '2019_04_10_075848_alter_company_task_table', 1),
(293, '2019_04_17_1165158_create_package_setting_table', 1),
(294, '2019_04_22_075848_alter_package_setting_table', 1),
(295, '2019_06_05_163256_add_timezone_column_global_settings_table', 1),
(296, '2019_06_05_180258_add_locale_column_global_settings_table', 1),
(297, '2019_06_21_100408_add_name_and_email_columns_to_client_details_table', 1),
(298, '2019_07_05_083850_add_company_id_in_client_contacts_table', 1),
(299, '2019_07_09_133247_remove_invoice_unique_index', 1),
(300, '2019_07_16_145850_add_deleted_at_in_estimates_table', 1),
(301, '2019_07_16_145851_add_deleted_at_in_invoices_table', 1),
(302, '2019_07_17_145848_remove_estimate_unique_index', 1),
(303, '2019_07_19_112506_add_project_id_column_in_expenses_table', 1),
(304, '2019_08_05_112511_create_credit_notes_table', 1),
(305, '2019_08_05_112513_create_credit_note_items_table', 1),
(306, '2019_08_06_112518_add_credit_note_column_in_invoices_table', 1),
(307, '2019_08_07_112521_add_columns_in_invoice_settings_table', 1),
(308, '2019_08_13_073129_update_settings_add_envato_key', 1),
(309, '2019_08_13_073129_update_settings_add_support_key', 1),
(310, '2019_08_14_091832_add_item_summary_invoice_items_table', 1),
(311, '2019_08_14_105412_add_item_summary_estimate_items_table', 1),
(312, '2019_08_16_075733_change_price_size_proposal', 1),
(313, '2019_08_22_055908_add_invoice_email_setting_to_email_notification_setting_table', 1),
(314, '2019_08_22_075432_remove_unique_column_name_taskboard', 1),
(315, '2019_08_22_121805_add_external_link_column_project_files_table', 1),
(316, '2019_08_26_120718_add_offline_method_id_column_payments_table', 1),
(317, '2019_08_28_070105_create_project_milestones_table', 1),
(318, '2019_08_28_081847_update_smtp_setting_verified', 1),
(319, '2019_08_28_100242_add_columns_projects_table', 1),
(320, '2019_08_28_101747_add_milestone_id_column_tasks_table', 1),
(321, '2019_08_28_115700_add_budget_columns_projects_table', 1),
(322, '2019_08_28_2083812_add_invoice_created_column_project_milestones_table', 1),
(323, '2019_08_29_140115_make_smtp_type_nullable', 1),
(324, '2019_09_03_021925_add_currency_in_free_trail', 1),
(325, '2019_09_04_115714_add_recurring_task_id_column_in_tasks_table', 1),
(326, '2019_09_09_041914_create_project_settings_table', 1),
(327, '2019_09_09_045042_create_faq_categories_table', 1),
(328, '2019_09_09_045056_create_faqs_table', 1),
(329, '2019_09_09_081030_add_rounded_theme_column', 1),
(330, '2019_09_09_115714_add_cron_job_message_hide_table', 1),
(331, '2019_09_12_061447_add_google_recaptcha_secret_in_global_settings_table', 1),
(332, '2019_09_12_1074848_create_designation_table', 1),
(333, '2019_09_12_115714_add_team_field_employee_table', 1),
(334, '2019_09_27_212735_add_timelog_module_clients', 1),
(335, '2019_10_01_110039_create_footer_menu_table', 1),
(336, '2019_10_03_110030_add_social_links_column_in_front_details_table', 1),
(337, '2019_10_03_112806_add_week_start_column_in_companies_table', 1),
(338, '2019_10_04_101818_add_paypal_mode_in_payment_gateway_credentials_table', 1),
(339, '2019_10_04_124931_add_week_start_column_gloabl_settings', 1),
(340, '2019_10_07_063300_add_last_login_column_in_companies_table', 1),
(341, '2019_10_07_063301_add_payments_module_clients', 1),
(342, '2019_10_07_183130_create_dashboard_widgets_table', 1),
(343, '2019_10_07_191818_add_razorpay_detail_in_payment_gateway_credentials_table', 1),
(344, '2019_10_07_201818_add_razorpay_detail_in_stripe_setting_table', 1),
(345, '2019_10_09_191818_add_razorpay_plan_id_in_packages_table', 1),
(346, '2019_10_10_095950_create_razorpay_subscriptions_table', 1),
(347, '2019_10_10_1534518_create_razorpay_invoices_table', 1),
(348, '2019_10_14_060314_create_accept_estimates_table', 1),
(349, '2019_10_14_110606_add_estimate_id_column_in_invoices_table', 1),
(350, '2019_10_15_052931_create_contract_types_table', 1),
(351, '2019_10_15_052932_create_contracts_table', 1),
(352, '2019_10_15_084310_add_contract_module_in_module_settings', 1),
(353, '2019_10_15_115655_create_contract_signs_table', 1),
(354, '2019_10_17_051544_create_contract_discussions_table', 1),
(355, '2019_10_19_191818_add_order_id_in_razorpay_invoice_table', 1),
(356, '2019_10_19_5074854_add_status_column_projects_table', 1),
(357, '2019_10_22_5074864_add_company_id_in_skills_table', 1),
(358, '2019_10_22_5074874_add_company_id_in_universal_search_table', 1),
(359, '2019_10_23_122412_create_contract_renews_table', 1),
(360, '2019_10_23_130413_create_task_files_table', 1),
(361, '2019_10_23_230413_create_ticket_files_table', 1),
(362, '2019_10_23_5074884_alter_company_id_in_project_category_table', 1),
(363, '2019_10_24_120220_add_origin_amount_column_in_contracts_table', 1),
(364, '2019_10_31_043520_add_dependent_task_id_in_tasks_table', 1),
(365, '2019_10_31_122412_create_lead_agent_table', 1),
(366, '2019_11_01_142619_add_column_to_in_notices_table', 1),
(367, '2019_11_02_051209_create_invoice_credit_note_pivot_table', 1),
(368, '2019_11_02_051855_alter_credit_note_status_in_credit_notes_table', 1),
(369, '2019_11_04_0455045_add_column_invoice_item_table', 1),
(370, '2019_11_04_0455055_add_column_credit_note_item_table', 1),
(371, '2019_11_04_0455065_add_column_estimate_item_table', 1),
(372, '2019_11_04_0455075_add_column_products_table', 1),
(373, '2019_11_04_063551_create_gdpr_settings_table', 1),
(374, '2019_11_04_091725_create_removal_requests_table', 1),
(375, '2019_11_04_091810_create_removal_requests_lead_table', 1),
(376, '2019_11_06_092918_add_client_id_in_invoices_table', 1),
(377, '2019_11_06_120145_create_offline_invoices_table', 1),
(378, '2019_11_06_120146_create_offline_plan_changes_table', 1),
(379, '2019_11_08_082637_add_purchase_allow_in_product_table', 1),
(380, '2019_11_12_054145_add_system_update_column_in_global_settings_table', 1),
(381, '2019_11_14_082655_add_employee_id_column_in_employee_details_table', 1),
(382, '2019_11_18_054145_add_discount_column_in_proposal_table', 1),
(383, '2019_11_18_064145_add_tax_column_in_proposal_item_table', 1),
(384, '2019_11_18_123900_create_offline_invoice_payments_table', 1),
(385, '2019_11_19_064145_change_universal_search_client_id', 1),
(386, '2019_11_20_111631_add_payent_method_id_in_offline_invoices_table', 1),
(387, '2019_11_29_122129_add_paypal_mode_column_in_stripe_setting_table', 1),
(388, '2019_12_01_115133_alter_invoice_status_table', 1),
(389, '2019_12_09_171149_make_taxes_nullable_propsal_items_table', 1),
(390, '2019_12_11_082834_add_email_verification_column_in_global_settings_table', 1),
(391, '2019_12_18_121031_add_date_picker_format_column_in_companies_table', 1),
(392, '2019_12_20_143625_add_logo_background_color_column_settings_table', 1),
(393, '2020_01_13_055908_add_payment_email_setting_to_email_notification_setting_table', 1),
(394, '2020_01_13_1100390_create_testimonials_table', 1),
(395, '2020_01_13_1100391_create_front_clients_table', 1),
(396, '2020_01_13_115133_alter_feature_setting_table', 1),
(397, '2020_01_13_122129_add_extra_column_in_front_setting_table', 1),
(398, '2020_01_15_045056_create_front_faqs_table', 1),
(399, '2020_01_15_045057_create_front_menu_table', 1),
(400, '2020_01_15_056908_add_date_picker_format_to_company_setting_table', 1),
(401, '2020_01_16_132024_seed_front_data', 1),
(402, '2020_01_22_093727_add_version_column_global_settings', 1),
(403, '2020_01_22_122009_add_is_private_column_tasks_table', 1),
(404, '2020_01_23_062328_create_task_history_table', 1),
(405, '2020_01_24_093737_add_employee_details_of_default_admin', 1),
(406, '2020_01_24_134008_add_default_task_status_column_organisation_settings', 1),
(407, '2020_02_01_101914_update_settings_review', 1),
(408, '2020_02_13_101914_update_global_phone', 1),
(409, '2020_02_14_101914_update_front_old_settings_global', 1),
(410, '2020_02_18_132351_add_front_setting_logo', 1),
(411, '2020_02_19_121221_create_storage_settings', 1),
(412, '2020_02_19_132351_add_soft_delete_global_currency', 1),
(413, '2020_02_24_060416_update_invoice_setting_logo', 1),
(414, '2020_02_26_121650_add_report_module', 1),
(415, '2020_03_03_121750_add_stripe_active_subscription', 1),
(416, '2020_03_11_101914_remove_employee_id_unique', 1),
(417, '2020_03_11_101924_product_modules_setting_client', 1),
(418, '2020_03_27_102832_create_task_users_table', 1),
(419, '2020_03_30_111911_create_front_widgets_table', 1),
(420, '2020_04_01_062153_add_shipping_address_field_in_client_details_table', 1),
(421, '2020_04_01_062305_add_show_shipping_field_in_invoices_table', 1),
(422, '2020_04_06_130331_create_discussion_categories_table', 1),
(423, '2020_04_06_132027_create_discussions_table', 1),
(424, '2020_04_06_133759_create_discussion_replies_table', 1),
(425, '2020_04_07_093553_create_paystack_subscriptions_table', 1),
(426, '2020_04_08_094325_add_best_answer_id_discussions_table', 1),
(427, '2020_04_08_125803_add_discussion_reply_email_notification_settings_table', 1),
(428, '2020_04_09_051247_add_column_in_payment_gateway_credentials_table', 1),
(429, '2020_04_09_102411_add_last_reply_by_discussions_table', 1),
(430, '2020_04_10_080841_create_failed_jobs_table', 1),
(431, '2020_04_13_114832_create_project_template_task_users_table', 1),
(432, '2020_04_13_119832_migration_for_client_name_table', 1),
(433, '2020_04_15_210107_add_login_ui_column_global_settings', 1),
(434, '2020_04_17_074412_add_private_column_packages_table', 1),
(435, '2020_04_19_143824_remove_emailverification_notifications', 1),
(436, '2020_04_20_083724_add_hourly_rate_project_timelogs', 1),
(437, '2020_04_20_114349_add_hourly_rate_project_members', 1),
(438, '2020_04_20_173833_add_project_id_value_for_tasks_timelogs', 1),
(439, '2020_04_23_124301_add_billable_column_tasks_table', 1),
(440, '2020_04_24_115049_add_approved_invoice_id_column_project_time_logs', 1),
(441, '2020_04_24_122510_add_approval_required_column_log_time_for', 1),
(442, '2020_04_28_154832_create_seo_details_table', 1),
(443, '2020_05_01_132214_update_package_trial_message', 1),
(444, '2020_05_05_064735_stripe_annual_nullable', 1),
(445, '2020_05_08_073554_add_superadmin_theme_settings_theme_settings_table', 1),
(446, '2020_05_08_132214_alter_global_setting_auth_css_table', 1),
(447, '2020_05_08_132214_alter_global_setting_auth_css_theme_table', 1),
(448, '2020_05_13_070505_change_earning_by_minutes_timelogs', 1),
(449, '2020_05_13_113533_add_receipt_column_payments_table', 1),
(450, '2020_05_14_113533_alter_currency_id_in_packages_table', 1),
(451, '2020_05_19_025644_alter_status_column_in_invoices_table', 1),
(452, '2020_05_19_065735_stripe_annual_plan_nullable', 1),
(453, '2020_05_21_040421_currency_position_settings', 1),
(454, '2020_05_21_041143_create_social_auth_settings_table', 1),
(455, '2020_05_26_084027_add_column_expenses_table', 1),
(456, '2020_05_28_081651_alter_payment_gateway_credentials_table', 1),
(457, '2020_05_29_083029_add_company_id_ticket_replies_table', 1),
(458, '2020_05_30_093624_add_send_status_column_invoices_table', 1),
(459, '2020_06_01_021753_add_storage_columns_in_packages_table', 1),
(460, '2020_06_01_080620_add_send_status_column_estimates_table', 1),
(461, '2020_06_02_160923_add_email_notifications_column_users_table', 1),
(462, '2020_06_03_094515_set_task_category_null_table', 1),
(463, '2020_06_03_132214_alter_front_setting_custom_css_theme_table', 1),
(464, '2020_06_05_030225_alter_status_column_invoices_table', 1),
(465, '2020_06_05_132214_alter_footer_setting_video_table', 1),
(466, '2020_06_10_070614_add_company_id_notifications_table', 1),
(467, '2020_06_10_070614_add_default_language_front_detail_table', 1),
(468, '2020_06_10_132214_alter_footer_menu_setting_table', 1),
(469, '2020_06_12_070614_add_default_language_new_company_table', 1),
(470, '2020_06_15_100530_create_task_tag_list_table', 1),
(471, '2020_06_15_116005_create_task_tags_table', 1),
(472, '2020_06_19_070614_add_company_id_notifications_again_table', 1),
(473, '2020_06_20_030225_alter_task_tags_to_label_table', 1),
(474, '2020_06_25_145817_create_tr_front_details_table', 1),
(475, '2020_06_26_023445_add_contracts_module_permissions_in_permissions_table', 1),
(476, '2020_06_26_131840_add_column_priority_column_leads_table', 1),
(477, '2020_07_03_042627_create_mollie_subscriptions_table', 1),
(478, '2020_07_06_132724_add_language_setting_id_column_in_features_table', 1),
(479, '2020_07_06_171614_add_phone_country_code_column_users_table', 1),
(480, '2020_07_07_2065158_insert_module_setting_client_expense_table', 1),
(481, '2020_07_08_091513_add_language_setting_id_column_in_testimonials_table', 1),
(482, '2020_07_08_131840_add_column_recommended_column_packages_table', 1),
(483, '2020_07_08_2065258_enter_lead_status_id_table', 1),
(484, '2020_07_08_2931840_add_column_category_id_in_template_task_table', 1),
(485, '2020_07_09_053724_add_language_setting_id_column_in_front_clients_table', 1),
(486, '2020_07_09_112754_add_language_setting_id_column_in_front_faqs_table', 1),
(487, '2020_07_10_042018_authorize_payment_integration_migrations_table', 1),
(488, '2020_07_10_083207_add_language_setting_id_column_in_front_menu_buttons_table', 1),
(489, '2020_07_13_045503_add_language_id_column_in_footer_menu_table', 1),
(490, '2020_07_29_112558_alter_package_amount_field', 1),
(491, '2020_08_06_2931840_add_column_status_currency_table', 1),
(492, '2020_08_10_2931840_add_column_attachment_notice_table', 1),
(493, '2020_08_10_2931845_add_column_free_plan_table', 1),
(494, '2020_08_13_114705_set_task_category_id_column_null', 1),
(495, '2020_08_13_2931840_add_column_image_faq_table', 1),
(496, '2020_08_17_2931845_add_free_offline_method_table', 1),
(497, '2020_08_19_051839_create_employee_leave_quotas_table', 1),
(498, '2020_08_20_091702_add_moment_format_column_companies_table', 1),
(499, '2020_08_24_2065258_fix_lead_status_id_table', 1),
(500, '2020_08_25_583130_alter_dashboard_widgets_table', 1),
(501, '2020_08_31_2065258_fix_lead_status_issue_table', 1),
(502, '2020_09_01_134008_default_task_status_column', 1),
(503, '2020_09_03_081839_alter_leads_value_table', 1),
(504, '2020_09_15_114705_change_sort_column_value', 1),
(505, '2020_09_17_196005_create_task_notes_table', 1),
(506, '2020_09_18_104145_add_estimate_fields_tasks_table', 1),
(507, '2020_09_22_111607_add_frontend_disable_column_global_settings', 1),
(508, '2020_09_24_522646_create_expenses_category_table', 1),
(509, '2020_09_28_054230_create_expenses_recurring_table', 1),
(510, '2020_09_30_111248_add_google_recpatcha_status_column_global_settings', 1),
(511, '2020_10_06_081839_add_columns_in_notices_table', 1),
(512, '2020_10_06_522646_create_product_category_table', 1),
(513, '2020_10_07_522646_create_pinned_table', 1),
(514, '2020_10_13_054230_create_invoice_recurring_table', 1),
(515, '2020_10_19_091702_add_moment_format_default_table', 1),
(516, '2020_10_21_183130_remove_client_feedback_widgets', 1),
(517, '2020_10_23_114705_project_template_user_id_foreign', 1),
(518, '2020_10_29_081839_add_client_id_credit_note_table', 1),
(519, '2020_11_07_090709_add_set_homepage_column_global_settings_table', 1),
(520, '2020_11_10_081303_add_companylogo_address_column_in_contracts_table', 1),
(521, '2020_11_10_114539_add_custom_field_groups', 1),
(522, '2020_11_10_522646_create_front_feature_table', 1),
(523, '2020_11_12_130413_create_faq_files_table', 1),
(524, '2020_11_18_065533_create_lead_custom_forms_table', 1),
(525, '2020_11_18_130413_create_contract_files_table', 1),
(526, '2020_11_19_122122_add_city_state_column_in_client_details_table', 1),
(527, '2020_11_20_063640_add_city_state_in_leads_table', 1),
(528, '2020_11_20_070745_add_city_state_coloumn_in_contracts_table', 1),
(529, '2020_11_23_081331_create_lead_category_table', 1),
(530, '2020_11_23_081804_add_category_id_column_in_leads_table', 1),
(531, '2020_11_25_095815_create_support_ticket_types_table', 1),
(532, '2020_11_25_101600_create_support_tickets_table', 1),
(533, '2020_11_25_101700_create_support_ticket_replies_table', 1),
(534, '2020_11_25_114705_cancel_status_estimate', 1),
(535, '2020_11_25_230413_create_support_ticket_files_table', 1),
(536, '2020_11_26_103829_add_ticket_support_module', 1),
(537, '2020_11_27_092136_create_project_template_sub_tasks_table', 1),
(538, '2020_12_01_092136_create_notice_view_table', 1),
(539, '2020_12_01_103829_add_global_default_locale', 1),
(540, '2020_12_02_055908_add_project_email_setting_to_email_notification_setting_table', 1),
(541, '2020_12_02_103829_add_app_debug_column_superadmin', 1),
(542, '2020_12_03_065533_create_ticket_custom_forms_table', 1),
(543, '2020_12_04_075308_create_client_category_table', 1),
(544, '2020_12_08_075308_create_project_rating_table', 1),
(545, '2020_12_24_065533_migrate_ticket_custom_forms_table', 1),
(546, '2020_12_29_050407_create_event_type_table', 1),
(547, '2020_12_29_055731_create_event_category_table', 1),
(548, '2020_12_29_062559_add_category_id_in_events_table', 1),
(549, '2020_12_31_110336_fix_default_task_status', 1),
(550, '2021_01_04_000003_create_subscription_items_table', 1),
(551, '2021_01_07_134008_default_task_status_column', 1),
(552, '2021_01_08_134008_add_expired_message_in_global_settings_table', 1),
(553, '2021_01_18_062719_add_estimate_terms_column_in_invoice_setting', 1),
(554, '2021_01_21_122157_add_captcha_version_column_in_global_setting', 1),
(555, '2021_01_22_134008_add_new_update_popup_in_global_settings_table', 1),
(556, '2021_01_29_152503_lead_custom_field_name_change', 1),
(557, '2021_02_02_113619_add_deleted_at_column_taxes', 1),
(558, '2021_02_05_055908_add_lead_proposal_email_setting', 1),
(559, '2021_02_08_115655_create_proposal_signs_table', 1),
(560, '2021_02_08_120510_create_notes_table', 1),
(561, '2021_02_08_135533_alter_lead_custom_forms_table', 1),
(562, '2021_02_10_090111_add_send_status_column_contracts_table', 1),
(563, '2021_02_10_090146_add_company_id_in_client_category_table', 1),
(564, '2021_02_10_120841_create_project_notes_table', 1),
(565, '2021_02_12_113619_add_fevicon_column_in_global_settings_table', 1),
(566, '2021_02_12_124422_add_register_enable_column_in_global_settings_table', 1),
(567, '2021_02_15_082045_modify_status_column_in_projects_table', 1),
(568, '2021_02_15_135533_alter_lead_custom_forms_table', 1),
(569, '2021_02_17_114412_change_version_in_global_setting_table', 1),
(570, '2021_02_17_115412_change_client_details_foreign_table', 1),
(571, '2021_02_18_115412_project_status_enum_table', 1),
(572, '2021_02_22_965158_alter_notes_table', 1),
(573, '2021_02_23_092336_create_user_notes_table', 1),
(574, '2021_02_23_094043_add_dashboard_clock_column_company_table', 1),
(575, '2021_02_23_094558_add_is_client_show_column_notes_table', 1),
(576, '2021_02_23_135533_alter_lead_custom_field_table', 1),
(577, '2021_02_24_083209_create_project_user_notes_table', 1),
(578, '2021_02_24_092148_alter_project_notes_table', 1),
(579, '2021_02_24_092817_add_sac_code_invoice_table', 1),
(580, '2021_03_09_045042_create_employee_faq_and_faq_categories_table', 1),
(581, '2021_03_09_130413_create_employee_faq_files_table', 1),
(582, '2021_03_10_110029_create_client_docs_table', 1),
(583, '2021_03_10_135533_add_company_id_event_category_table', 1),
(584, '2021_03_11_035914_default_global_task_remove_foreign_key', 1),
(585, '2021_03_11_113423_fix_default_task_board_colomn_company', 1),
(586, '2021_03_15_145533_add_last_cron_run_in_global_settings_table', 1),
(587, '2021_03_16_163423_seo_image_column_in_seo_details', 1),
(588, '2021_03_25_135533_alter_lead_custom_field_message_lead_table', 1),
(589, '2021_04_05_110352_add_mobile_field_in_ticket_custom_forms_table', 1),
(590, '2021_04_06_135533_alter_ticket_custom_field_message_table', 1),
(591, '2021_04_07_044843_change_comment_column_type_in_task_comments', 1),
(592, '2021_04_14_080502_add_decription_column_in_proposals_table', 1),
(593, '2021_04_16_043432_add_rtl_column_in_companies_table', 1),
(594, '2021_04_16_070540_add_rtl_column_in_global_settings_table', 1),
(595, '2021_04_19_064140_change_date_null_in_task_table', 1),
(596, '2021_04_23_075556_create_task_comment_files_table', 1),
(597, '2021_04_27_052134_add_comment_id_in_task_comment_files_table', 1),
(598, '2021_05_06_115651_add_link_in_front_details', 1),
(599, '2021_05_14_074538_add_event_unique_id_in_events_table', 1),
(600, '2021_05_17_065904_modify_status_column_in_proposals_table', 1),
(601, '2021_05_18_083231_add_send_status_column_in_proposals_table', 1),
(602, '2021_05_20_095231_modify_currency_id_in_packages_table', 1),
(603, '2021_05_21_050747_add_send_reminder_in_invoice_setting_table', 1),
(604, '2021_05_23_130410_lead_category_company_specific', 1),
(605, '2021_05_31_102117_task_share_unique_hash', 1),
(606, '2021_06_07_054429_add_paid_column_in_leaves_table', 1),
(607, '2021_06_07_060250_add_paid_coloumn_in_leave_types', 1),
(608, '2021_06_08_072201_add_close_date_in_ticket_table', 1),
(609, '2021_06_09_061010_alter_category_id_expense_table', 1),
(610, '2021_06_09_081707_add_column_in_packages_table', 1),
(611, '2021_06_09_082208_add_value_in_packages_table', 1),
(612, '2021_06_09_085733_add_column_null_in_packages_table', 1),
(613, '2021_06_09_092432_alter_product_category_id', 1),
(614, '2021_06_09_114015_custom_field_employee_show', 1),
(615, '2021_06_10_073137_create_sign_up_settings_table', 1),
(616, '2021_06_10_114015_add_new_custom_field_group', 1),
(617, '2021_06_14_044650_remove_and_add_column_in_sign_up_setting_table', 1),
(618, '2021_06_14_053146_update_global_settings_registration_closed_table', 1),
(619, '2021_06_14_061858_add_value_in_sign_up_setting_table', 1),
(620, '2021_06_15_095905_create_currency_format_settings_table', 1),
(621, '2021_06_17_052728_alter_leads_agent_id_leads_table', 1),
(622, '2021_06_17_071622_add_last_login_column_in_users_table', 1),
(623, '2021_06_17_103249_add_sample_data_column_in_currency_format_settings_table', 1),
(624, '2021_06_17_130413_create_sub_task_files_table', 1),
(625, '2021_06_18_071622_product_tax_check_array', 1),
(626, '2021_06_21_063108_add_set_null_in_contract_table', 1),
(627, '2021_06_22_130413_attendance_setting_alert', 1),
(628, '2021_06_23_081926_add_payfast_column_in_stripe_setting_table', 1),
(629, '2021_06_23_085038_add_readonly_mode_in_projects_table', 1),
(630, '2021_06_23_095909_add_payfast_column_in_payment_gateway_credentials_table', 1),
(631, '2021_06_23_130413_alter_theme_setting_login_table', 1),
(632, '2021_06_23_130413_create_discussion_files_table', 1),
(633, '2021_06_28_084623_change_paid_coloumn_nullable_in_leave_types_table', 1),
(634, '2021_06_28_121538_add_column_in_payment_and_stripe_setting_table', 1),
(635, '2021_06_29_063243_create_payfast_subscriptions_table', 1),
(636, '2021_06_29_063258_create_payfast_invoices_table', 1),
(637, '2021_06_29_130413_create_expenses_category_roles_table', 1),
(638, '2021_06_30_112056_add_mode_column_in_payment_and_stripe_setting_table', 1),
(639, '2021_07_01_044938_add_google_event_id_to_bookings_table', 1),
(640, '2021_07_01_103041_create_google_accounts_table', 1),
(641, '2021_07_27_063529_add_due_date_in_project_milestones_table', 1),
(642, '2021_07_29_102117_invoice_client_search_fix', 1),
(643, '2021_07_30_065542_create_task_requests_table', 1),
(644, '2021_07_30_065652_create_task_request_files_table', 1),
(645, '2021_07_30_065850_add_task_requests_id_in_tasks_table', 1),
(646, '2021_08_06_071425_change_task_notification_notifications_table', 1),
(647, '2021_08_19_045939_change_subtask_in_notifications_table', 1),
(648, '2021_08_23_092206_alter_project_members_table', 1),
(649, '2021_08_25_092206_alter_credit_note_status_table', 1),
(650, '2021_08_27_043709_add_data_in_currency_format_settings_table', 1),
(651, '2021_09_01_103041_create_google_calendar_module_table', 1),
(652, '2021_09_06_092206_alter_expenses_price_table', 1),
(653, '2021_09_08_122145_create_pusher_settings_table', 1),
(654, '2021_09_15_062230_alter_currency_format_settings_table', 1),
(655, '2021_09_22_045939_change_subtask_notifications_table', 1),
(656, '2021_10_01_135533_alter_ticket_custom_field_message_change_table', 1),
(657, '2021_3_09_135533_add_lead_custom_column_message_table', 1),
(658, '2022_03_15_073305_update_notification', 1);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'clients', '', NULL, NULL),
(2, 'employees', '', NULL, NULL),
(3, 'projects', 'User can view the basic details of projects assigned to him even without any permission.', NULL, NULL),
(4, 'attendance', 'User can view his own attendance even without any permission.', NULL, NULL),
(5, 'tasks', 'User can view the tasks assigned to him even without any permission.', NULL, NULL),
(6, 'estimates', '', NULL, NULL),
(7, 'invoices', '', NULL, NULL),
(8, 'payments', '', NULL, NULL),
(9, 'timelogs', '', NULL, NULL),
(10, 'tickets', 'User can view the tickets generated by him as default even without any permission.', NULL, NULL),
(11, 'events', 'User can view the events to be attended by him as default even without any permission.', NULL, NULL),
(12, 'messages', '', NULL, NULL),
(13, 'notices', '', NULL, NULL),
(14, 'leaves', 'User can view the leaves applied by him as default even without any permission.', NULL, NULL),
(15, 'leads', NULL, NULL, NULL),
(16, 'holidays', NULL, '2023-02-14 05:30:25', '2023-02-14 05:30:25'),
(17, 'products', NULL, '2023-02-14 05:30:25', '2023-02-14 05:30:25'),
(18, 'expenses', 'User can view and add(self expenses) the expenses as default even without any permission.', '2023-02-14 05:30:25', '2023-02-14 05:30:25'),
(19, 'contracts', 'User can view all contracts', '2023-02-14 05:30:28', '2023-02-14 05:30:28'),
(20, 'reports', 'Report module', '2023-02-14 05:30:30', '2023-02-14 05:30:30'),
(21, 'ticket support', 'Ticket support', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `module_name` varchar(191) NOT NULL,
  `status` enum('active','deactive') NOT NULL,
  `type` enum('admin','employee','client') NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `company_id`, `module_name`, `status`, `type`, `created_at`, `updated_at`) VALUES
(2, 1, 'clients', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(3, 1, 'clients', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(4, 1, 'employees', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(5, 1, 'employees', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(6, 1, 'attendance', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(7, 1, 'attendance', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(8, 1, 'projects', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(9, 1, 'projects', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(10, 1, 'projects', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(11, 1, 'tasks', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(12, 1, 'tasks', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(13, 1, 'tasks', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(14, 1, 'estimates', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(15, 1, 'estimates', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(16, 1, 'estimates', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(17, 1, 'invoices', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(18, 1, 'invoices', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(19, 1, 'invoices', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(20, 1, 'payments', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(21, 1, 'payments', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(22, 1, 'payments', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(23, 1, 'expenses', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(24, 1, 'expenses', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(25, 1, 'timelogs', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(26, 1, 'timelogs', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(27, 1, 'timelogs', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(28, 1, 'tickets', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(29, 1, 'tickets', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(30, 1, 'tickets', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(31, 1, 'messages', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(32, 1, 'messages', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(33, 1, 'messages', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(34, 1, 'events', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(35, 1, 'events', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(36, 1, 'events', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(37, 1, 'leaves', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(38, 1, 'leaves', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(39, 1, 'notices', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(40, 1, 'notices', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(41, 1, 'notices', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(42, 1, 'leads', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(43, 1, 'leads', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(44, 1, 'holidays', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(45, 1, 'holidays', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(46, 1, 'products', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(47, 1, 'products', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(48, 1, 'products', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(49, 1, 'contracts', 'active', 'client', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(50, 1, 'contracts', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(51, 1, 'contracts', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(52, 1, 'reports', 'active', 'employee', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(53, 1, 'reports', 'active', 'admin', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `mollie_invoices`
--

CREATE TABLE `mollie_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mollie_subscriptions`
--

CREATE TABLE `mollie_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `notes_title` varchar(191) NOT NULL,
  `notes_type` tinyint(1) NOT NULL DEFAULT 0,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `ask_password` tinyint(1) NOT NULL DEFAULT 0,
  `note_details` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_client_show` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `to` varchar(191) NOT NULL DEFAULT 'employee',
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `heading` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(191) DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice_views`
--

CREATE TABLE `notice_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_invoices`
--

CREATE TABLE `offline_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `status` enum('paid','unpaid','pending') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_invoice_payments`
--

CREATE TABLE `offline_invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `payment_method_id` int(10) UNSIGNED NOT NULL,
  `slip` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('pending','approve','reject') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `status` enum('yes','no') DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_plan_changes`
--

CREATE TABLE `offline_plan_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `package_type` varchar(191) NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `offline_method_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `status` enum('verified','pending','rejected') NOT NULL DEFAULT 'pending',
  `description` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `max_storage_size` varchar(255) DEFAULT '-1',
  `max_file_size` int(10) UNSIGNED DEFAULT NULL,
  `annual_price` decimal(10,0) UNSIGNED DEFAULT NULL,
  `monthly_price` decimal(10,0) UNSIGNED DEFAULT NULL,
  `billing_cycle` tinyint(3) UNSIGNED DEFAULT NULL,
  `max_employees` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) DEFAULT NULL,
  `module_in_package` varchar(1000) NOT NULL,
  `stripe_annual_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) DEFAULT NULL,
  `stripe_monthly_plan_id` varchar(191) DEFAULT NULL,
  `paystack_monthly_plan_id` varchar(191) DEFAULT NULL,
  `paystack_annual_plan_id` varchar(191) DEFAULT NULL,
  `default` enum('yes','no','trial') DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL,
  `storage_unit` enum('gb','mb') NOT NULL DEFAULT 'mb',
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `is_auto_renew` tinyint(1) NOT NULL DEFAULT 0,
  `monthly_status` varchar(191) DEFAULT '1',
  `annual_status` varchar(191) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `currency_id`, `name`, `description`, `max_storage_size`, `max_file_size`, `annual_price`, `monthly_price`, `billing_cycle`, `max_employees`, `sort`, `module_in_package`, `stripe_annual_plan_id`, `razorpay_annual_plan_id`, `razorpay_monthly_plan_id`, `stripe_monthly_plan_id`, `paystack_monthly_plan_id`, `paystack_annual_plan_id`, `default`, `created_at`, `updated_at`, `is_private`, `storage_unit`, `is_recommended`, `is_free`, `is_auto_renew`, `monthly_status`, `annual_status`) VALUES
(1, 4, 'Default', 'Its a default package and cannot be deleted', '-1', NULL, '0', '0', NULL, 20, 0, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"attendance\",\"4\":\"projects\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"expenses\",\"10\":\"timelogs\",\"11\":\"tickets\",\"12\":\"messages\",\"13\":\"events\",\"14\":\"leaves\",\"15\":\"notices\",\"16\":\"leads\",\"17\":\"holidays\",\"18\":\"products\",\"19\":\"contracts\",\"20\":\"reports\"}', 'default_plan', NULL, NULL, 'default_plan', NULL, NULL, 'yes', '2023-02-14 05:30:27', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1'),
(2, 4, 'Trial', 'Its a trial package', '-1', NULL, '0', '0', NULL, 20, 0, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\",\"19\":\"contracts\",\"20\":\"reports\",\"21\":\"contracts\",\"22\":\"reports\"}', 'trial_plan', NULL, NULL, 'trial_plan', NULL, NULL, 'trial', '2023-02-14 05:30:27', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1'),
(3, 4, 'Free', 'It\'s a free package.', '-1', 10, '0', '0', NULL, 20, 0, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"attendance\",\"4\":\"projects\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"expenses\",\"10\":\"timelogs\",\"11\":\"tickets\",\"12\":\"messages\",\"13\":\"events\",\"14\":\"leaves\",\"15\":\"notices\",\"16\":\"leads\",\"17\":\"holidays\",\"18\":\"products\"}', NULL, NULL, NULL, NULL, NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1'),
(4, 4, 'Starter', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', '-1', 30, '0', '0', 10, 50, 1, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"attendance\",\"4\":\"projects\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"expenses\",\"10\":\"timelogs\",\"11\":\"tickets\",\"17\":\"holidays\"}', 'starter_annual', NULL, NULL, 'starter_monthly', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1'),
(5, 4, 'Medium', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', '-1', 50, '0', '0', 10, 100, 2, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"attendance\",\"4\":\"projects\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"expenses\",\"10\":\"timelogs\",\"11\":\"tickets\",\"12\":\"messages\",\"13\":\"events\",\"14\":\"leaves\",\"15\":\"notices\",\"16\":\"leads\",\"17\":\"holidays\"}', 'medium_annual', NULL, NULL, 'medium_monthly', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1'),
(6, 4, 'Larger', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', '-1', 100, '0', '0', 10, 500, 3, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"attendance\",\"4\":\"projects\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"expenses\",\"10\":\"timelogs\",\"11\":\"tickets\",\"12\":\"messages\",\"13\":\"events\",\"14\":\"leaves\",\"15\":\"notices\",\"16\":\"leads\",\"17\":\"holidays\",\"18\":\"products\"}', 'larger_annual', NULL, NULL, 'larger_monthly', NULL, NULL, 'no', '2023-02-14 05:30:48', '2023-02-14 05:56:12', 0, 'mb', 0, 0, 0, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `package_settings`
--

CREATE TABLE `package_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `no_of_days` int(11) DEFAULT 30,
  `modules` varchar(1000) DEFAULT NULL,
  `trial_message` text DEFAULT NULL,
  `notification_before` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_settings`
--

INSERT INTO `package_settings` (`id`, `status`, `no_of_days`, `modules`, `trial_message`, `notification_before`, `created_at`, `updated_at`) VALUES
(1, 'inactive', 30, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\",\"19\":\"contracts\",\"20\":\"reports\"}', 'Start 30 days free trial', NULL, '2023-02-14 05:30:27', '2023-02-14 05:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payfast_invoices`
--

CREATE TABLE `payfast_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `m_payment_id` varchar(191) DEFAULT NULL,
  `pf_payment_id` varchar(191) DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `signature` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payfast_subscriptions`
--

CREATE TABLE `payfast_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payfast_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `ends_at` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `gateway` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `plan_id` varchar(191) DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `event_id` varchar(191) DEFAULT NULL,
  `status` enum('complete','pending') NOT NULL DEFAULT 'complete',
  `paid_on` datetime DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `offline_method_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `paypal_client_id` varchar(191) DEFAULT NULL,
  `paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` enum('active','deactive') NOT NULL DEFAULT 'deactive',
  `stripe_client_id` varchar(191) DEFAULT NULL,
  `stripe_secret` varchar(191) DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) DEFAULT NULL,
  `stripe_status` enum('active','deactive') NOT NULL DEFAULT 'deactive',
  `razorpay_key` varchar(191) DEFAULT NULL,
  `razorpay_secret` varchar(191) DEFAULT NULL,
  `razorpay_webhook_secret` varchar(191) DEFAULT NULL,
  `razorpay_status` enum('active','deactive') NOT NULL DEFAULT 'deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paypal_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `paystack_client_id` varchar(191) DEFAULT NULL,
  `paystack_secret` varchar(191) DEFAULT NULL,
  `paystack_status` enum('active','inactive') DEFAULT 'inactive',
  `paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co',
  `mollie_api_key` varchar(191) NOT NULL,
  `mollie_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `authorize_api_login_id` varchar(191) DEFAULT NULL,
  `authorize_transaction_key` varchar(191) DEFAULT NULL,
  `authorize_environment` varchar(191) DEFAULT NULL,
  `authorize_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `payfast_key` varchar(191) DEFAULT NULL,
  `payfast_secret` varchar(191) DEFAULT NULL,
  `payfast_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `payfast_salt_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `company_id`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_client_id`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `razorpay_key`, `razorpay_secret`, `razorpay_webhook_secret`, `razorpay_status`, `created_at`, `updated_at`, `paypal_mode`, `paystack_client_id`, `paystack_secret`, `paystack_status`, `paystack_merchant_email`, `paystack_payment_url`, `mollie_api_key`, `mollie_status`, `authorize_api_login_id`, `authorize_transaction_key`, `authorize_environment`, `authorize_status`, `payfast_key`, `payfast_secret`, `payfast_status`, `payfast_salt_passphrase`, `payfast_mode`) VALUES
(1, NULL, NULL, NULL, 'active', NULL, NULL, NULL, 'active', NULL, NULL, NULL, 'deactive', '2023-02-14 05:30:21', '2023-02-14 05:30:21', 'sandbox', NULL, NULL, 'inactive', NULL, 'https://api.paystack.co', '', 'inactive', NULL, NULL, NULL, 'inactive', NULL, NULL, 'inactive', NULL, 'sandbox'),
(2, 1, NULL, NULL, 'deactive', NULL, NULL, NULL, 'deactive', NULL, NULL, NULL, 'deactive', '2023-02-14 05:30:48', '2023-02-14 05:30:48', 'sandbox', NULL, NULL, 'inactive', NULL, 'https://api.paystack.co', '', 'inactive', NULL, NULL, NULL, 'inactive', NULL, NULL, 'inactive', NULL, 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_invoices`
--

CREATE TABLE `paypal_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `remarks` varchar(191) DEFAULT NULL,
  `billing_frequency` varchar(191) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `recurring` enum('yes','no') DEFAULT 'no',
  `status` enum('paid','unpaid','pending') DEFAULT 'pending',
  `plan_id` varchar(191) DEFAULT NULL,
  `event_id` varchar(191) DEFAULT NULL,
  `end_on` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_invoices`
--

CREATE TABLE `paystack_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount` varchar(191) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_subscriptions`
--

CREATE TABLE `paystack_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `token` varchar(191) NOT NULL,
  `plan_id` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 'add_clients', 'Add Clients', NULL, 1, NULL, NULL),
(2, 'view_clients', 'View Clients', NULL, 1, NULL, NULL),
(3, 'edit_clients', 'Edit Clients', NULL, 1, NULL, NULL),
(4, 'delete_clients', 'Delete Clients', NULL, 1, NULL, NULL),
(5, 'add_employees', 'Add Employees', NULL, 2, NULL, NULL),
(6, 'view_employees', 'View Employees', NULL, 2, NULL, NULL),
(7, 'edit_employees', 'Edit Employees', NULL, 2, NULL, NULL),
(8, 'delete_employees', 'Delete Employees', NULL, 2, NULL, NULL),
(9, 'add_projects', 'Add Project', NULL, 3, NULL, NULL),
(10, 'view_projects', 'View Project', NULL, 3, NULL, NULL),
(11, 'edit_projects', 'Edit Project', NULL, 3, NULL, NULL),
(12, 'delete_projects', 'Delete Project', NULL, 3, NULL, NULL),
(13, 'add_attendance', 'Add Attendance', NULL, 4, NULL, NULL),
(14, 'view_attendance', 'View Attendance', NULL, 4, NULL, NULL),
(15, 'add_tasks', 'Add Tasks', NULL, 5, NULL, NULL),
(16, 'view_tasks', 'View Tasks', NULL, 5, NULL, NULL),
(17, 'edit_tasks', 'Edit Tasks', NULL, 5, NULL, NULL),
(18, 'delete_tasks', 'Delete Tasks', NULL, 5, NULL, NULL),
(19, 'add_estimates', 'Add Estimates', NULL, 6, NULL, NULL),
(20, 'view_estimates', 'View Estimates', NULL, 6, NULL, NULL),
(21, 'edit_estimates', 'Edit Estimates', NULL, 6, NULL, NULL),
(22, 'delete_estimates', 'Delete Estimates', NULL, 6, NULL, NULL),
(23, 'add_invoices', 'Add Invoices', NULL, 7, NULL, NULL),
(24, 'view_invoices', 'View Invoices', NULL, 7, NULL, NULL),
(25, 'edit_invoices', 'Edit Invoices', NULL, 7, NULL, NULL),
(26, 'delete_invoices', 'Delete Invoices', NULL, 7, NULL, NULL),
(27, 'add_payments', 'Add Payments', NULL, 8, NULL, NULL),
(28, 'view_payments', 'View Payments', NULL, 8, NULL, NULL),
(29, 'edit_payments', 'Edit Payments', NULL, 8, NULL, NULL),
(30, 'delete_payments', 'Delete Payments', NULL, 8, NULL, NULL),
(31, 'add_timelogs', 'Add Timelogs', NULL, 9, NULL, NULL),
(32, 'view_timelogs', 'View Timelogs', NULL, 9, NULL, NULL),
(33, 'edit_timelogs', 'Edit Timelogs', NULL, 9, NULL, NULL),
(34, 'delete_timelogs', 'Delete Timelogs', NULL, 9, NULL, NULL),
(35, 'add_tickets', 'Add Tickets', NULL, 10, NULL, NULL),
(36, 'view_tickets', 'View Tickets', NULL, 10, NULL, NULL),
(37, 'edit_tickets', 'Edit Tickets', NULL, 10, NULL, NULL),
(38, 'delete_tickets', 'Delete Tickets', NULL, 10, NULL, NULL),
(39, 'add_events', 'Add Events', NULL, 11, NULL, NULL),
(40, 'view_events', 'View Events', NULL, 11, NULL, NULL),
(41, 'edit_events', 'Edit Events', NULL, 11, NULL, NULL),
(42, 'delete_events', 'Delete Events', NULL, 11, NULL, NULL),
(43, 'add_notice', 'Add Notice', NULL, 13, NULL, '2023-02-14 05:30:27'),
(44, 'view_notice', 'View Notice', NULL, 13, NULL, '2023-02-14 05:30:27'),
(45, 'edit_notice', 'Edit Notice', NULL, 13, NULL, '2023-02-14 05:30:27'),
(46, 'delete_notice', 'Delete Notice', NULL, 13, NULL, '2023-02-14 05:30:27'),
(47, 'add_leave', 'Add Leave', NULL, 14, NULL, NULL),
(48, 'view_leave', 'View Leave', NULL, 14, NULL, NULL),
(49, 'edit_leave', 'Edit Leave', NULL, 14, NULL, NULL),
(50, 'delete_leave', 'Delete Leave', NULL, 14, NULL, NULL),
(51, 'add_lead', 'Add Lead', NULL, 15, NULL, NULL),
(52, 'view_lead', 'View Lead', NULL, 15, NULL, NULL),
(53, 'edit_lead', 'Edit Lead', NULL, 15, NULL, NULL),
(54, 'delete_lead', 'Delete Lead', NULL, 15, NULL, NULL),
(55, 'add_holiday', 'Add Holiday', NULL, 16, NULL, NULL),
(56, 'view_holiday', 'View Holiday', NULL, 16, NULL, NULL),
(57, 'edit_holiday', 'Edit Holiday', NULL, 16, NULL, NULL),
(58, 'delete_holiday', 'Delete Holiday', NULL, 16, NULL, NULL),
(59, 'add_product', 'Add Product', NULL, 17, NULL, NULL),
(60, 'view_product', 'View Product', NULL, 17, NULL, NULL),
(61, 'edit_product', 'Edit Product', NULL, 17, NULL, NULL),
(62, 'delete_product', 'Delete Product', NULL, 17, NULL, NULL),
(63, 'add_expenses', 'Add Expenses', NULL, 18, NULL, NULL),
(64, 'view_expenses', 'View Expenses', NULL, 18, NULL, NULL),
(65, 'edit_expenses', 'Edit Expenses', NULL, 18, NULL, NULL),
(66, 'delete_expenses', 'Delete Expenses', NULL, 18, NULL, NULL),
(67, 'add_contract', 'Add Contract', NULL, 19, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(68, 'edit_contract', 'Edit Contract', NULL, 19, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(69, 'view_contract', 'View Contract', NULL, 19, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(70, 'delete_contract', 'Delete Contract', NULL, 19, '2023-02-14 05:30:31', '2023-02-14 05:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pinned`
--

CREATE TABLE `pinned` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `price` varchar(191) NOT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `allow_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) NOT NULL,
  `project_summary` mediumtext DEFAULT NULL,
  `project_admin` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `feedback` mediumtext DEFAULT NULL,
  `read_only` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `manual_timelog` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `client_view_task` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `completion_percent` tinyint(4) NOT NULL,
  `calculate_task_progress` enum('true','false') NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_budget` double(20,2) DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `hours_allocated` double(8,2) DEFAULT NULL,
  `status` enum('not started','in progress','on hold','canceled','finished','under review') NOT NULL DEFAULT 'in progress',
  `visible_rating_employee` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_activity`
--

CREATE TABLE `project_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `activity` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE `project_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `external_link` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hourly_rate` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_milestones`
--

CREATE TABLE `project_milestones` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `milestone_title` varchar(191) NOT NULL,
  `summary` mediumtext NOT NULL,
  `cost` double(15,2) NOT NULL,
  `status` enum('complete','incomplete') NOT NULL DEFAULT 'incomplete',
  `due_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_created` tinyint(1) NOT NULL,
  `invoice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_notes`
--

CREATE TABLE `project_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `notes_title` varchar(191) NOT NULL,
  `notes_type` tinyint(1) NOT NULL DEFAULT 0,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `ask_password` tinyint(1) NOT NULL DEFAULT 0,
  `note_details` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_client_show` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_ratings`
--

CREATE TABLE `project_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `rating` double NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_settings`
--

CREATE TABLE `project_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `send_reminder` enum('yes','no') NOT NULL,
  `remind_time` int(11) NOT NULL,
  `remind_type` varchar(191) NOT NULL,
  `remind_to` varchar(191) NOT NULL DEFAULT '["admins","members"]',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_settings`
--

INSERT INTO `project_settings` (`id`, `company_id`, `send_reminder`, `remind_time`, `remind_type`, `remind_to`, `created_at`, `updated_at`) VALUES
(1, 1, 'no', 5, 'days', '[\"admins\",\"members\"]', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `project_templates`
--

CREATE TABLE `project_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `project_summary` mediumtext DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `feedback` mediumtext DEFAULT NULL,
  `client_view_task` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `manual_timelog` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_members`
--

CREATE TABLE `project_template_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_sub_tasks`
--

CREATE TABLE `project_template_sub_tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_template_task_id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `status` enum('incomplete','complete') NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_tasks`
--

CREATE TABLE `project_template_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_template_task_category_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_template_task_users`
--

CREATE TABLE `project_template_task_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_template_task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_time_logs`
--

CREATE TABLE `project_time_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `memo` text NOT NULL,
  `total_hours` varchar(191) DEFAULT NULL,
  `total_minutes` varchar(191) DEFAULT NULL,
  `edited_by_user` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hourly_rate` int(11) NOT NULL,
  `earnings` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `approved_by` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_user_notes`
--

CREATE TABLE `project_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_notes_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `total` double(16,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting','draft') NOT NULL DEFAULT 'waiting',
  `note` mediumtext DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` varchar(191) NOT NULL,
  `invoice_convert` tinyint(1) NOT NULL DEFAULT 0,
  `discount_type` varchar(191) NOT NULL,
  `client_comment` text DEFAULT NULL,
  `signature_approval` tinyint(1) NOT NULL DEFAULT 1,
  `send_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_items`
--

CREATE TABLE `proposal_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `type` enum('item','discount','tax') NOT NULL DEFAULT 'item',
  `quantity` double(16,2) NOT NULL,
  `unit_price` double(16,2) NOT NULL,
  `amount` double(16,2) NOT NULL,
  `item_summary` text DEFAULT NULL,
  `taxes` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_signs`
--

CREATE TABLE `proposal_signs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `signature` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent`
--

CREATE TABLE `purpose_consent` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_leads`
--

CREATE TABLE `purpose_consent_leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') NOT NULL DEFAULT 'agree',
  `ip` varchar(191) DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED DEFAULT NULL,
  `additional_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purpose_consent_users`
--

CREATE TABLE `purpose_consent_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `purpose_consent_id` int(10) UNSIGNED NOT NULL,
  `status` enum('agree','disagree') NOT NULL DEFAULT 'agree',
  `ip` varchar(191) DEFAULT NULL,
  `updated_by_id` int(10) UNSIGNED NOT NULL,
  `additional_description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusher_settings`
--

CREATE TABLE `pusher_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `pusher_app_id` varchar(191) DEFAULT NULL,
  `pusher_app_key` varchar(191) DEFAULT NULL,
  `pusher_app_secret` varchar(191) DEFAULT NULL,
  `pusher_cluster` varchar(191) DEFAULT NULL,
  `force_tls` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `message_status` tinyint(1) NOT NULL DEFAULT 0,
  `taskboard_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pusher_settings`
--

INSERT INTO `pusher_settings` (`id`, `company_id`, `pusher_app_id`, `pusher_app_key`, `pusher_app_secret`, `pusher_cluster`, `force_tls`, `status`, `message_status`, `taskboard_status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '2023-02-14 05:30:49', '2023-02-14 05:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_settings`
--

CREATE TABLE `push_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `onesignal_app_id` text DEFAULT NULL,
  `onesignal_rest_api_key` text DEFAULT NULL,
  `notification_logo` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `push_notification_settings`
--

INSERT INTO `push_notification_settings` (`id`, `onesignal_app_id`, `onesignal_rest_api_key`, `notification_logo`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'inactive', '2023-02-14 05:30:26', '2023-02-14 05:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `endpoint` varchar(191) NOT NULL,
  `public_key` varchar(191) DEFAULT NULL,
  `auth_token` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(191) NOT NULL,
  `client_name` varchar(191) NOT NULL,
  `client_email` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hsn_sac_code` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_invoices`
--

CREATE TABLE `razorpay_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `invoice_id` varchar(191) NOT NULL,
  `subscription_id` varchar(191) NOT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_subscriptions`
--

CREATE TABLE `razorpay_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `razorpay_id` varchar(191) NOT NULL,
  `razorpay_plan` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests`
--

CREATE TABLE `removal_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `removal_requests_lead`
--

CREATE TABLE `removal_requests_lead` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) NOT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(2, 1, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(3, 1, 'client', 'Client', 'Client can see own tasks and projects.', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(2, 1),
(2, 2),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `seo_details`
--

CREATE TABLE `seo_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `page_name` varchar(191) NOT NULL,
  `seo_title` varchar(191) DEFAULT NULL,
  `seo_keywords` text DEFAULT NULL,
  `seo_description` varchar(191) DEFAULT NULL,
  `seo_author` varchar(191) DEFAULT NULL,
  `og_image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `seo_details`
--

INSERT INTO `seo_details` (`id`, `language_setting_id`, `page_name`, `seo_title`, `seo_keywords`, `seo_description`, `seo_author`, `og_image`, `created_at`, `updated_at`) VALUES
(1, NULL, 'home', 'Home', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', NULL, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(2, NULL, 'feature', 'Feature', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', NULL, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(3, NULL, 'pricing', 'Pricing', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', NULL, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(4, NULL, 'contact', 'Contact', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include  everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, co', 'Worksuite', NULL, '2023-02-14 05:30:31', '2023-02-14 05:30:31'),
(5, NULL, 'terms-of-use', 'Terms of use', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, con', 'Worksuite Saas', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(6, NULL, 'privacy-policy', 'Privacy Policy', 'best crm,hr management software, web hr software, hr software online, free hr software, hr software for sme, hr management software for small business, cloud hr software, online hr management software', 'Worksuite saas is easy to use CRM software that is designed for B2B. It include everything you need to run your businesses. like manage customers, projects, invoices, estimates, timelogs, con', 'Worksuite Saas', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `sign_up_settings`
--

CREATE TABLE `sign_up_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sign_up_settings`
--

INSERT INTO `sign_up_settings` (`id`, `language_setting_id`, `message`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Registration is currently closed. Please try again later. If you have any inquiries feel free to contact us', '2023-02-14 05:30:35', '2023-02-14 05:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slack_settings`
--

CREATE TABLE `slack_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `slack_webhook` text DEFAULT NULL,
  `slack_logo` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slack_settings`
--

INSERT INTO `slack_settings` (`id`, `company_id`, `slack_webhook`, `slack_logo`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(2, 1, NULL, NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail_driver` varchar(191) NOT NULL DEFAULT 'smtp',
  `mail_host` varchar(191) NOT NULL DEFAULT 'smtp.gmail.com',
  `mail_port` varchar(191) NOT NULL DEFAULT '587',
  `mail_username` varchar(191) NOT NULL DEFAULT 'youremail@gmail.com',
  `mail_password` varchar(191) NOT NULL DEFAULT 'your password',
  `mail_from_name` varchar(191) NOT NULL DEFAULT 'your name',
  `mail_from_email` varchar(191) NOT NULL DEFAULT 'from@email.com',
  `mail_encryption` enum('tls','ssl') DEFAULT 'tls',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `created_at`, `updated_at`, `verified`) VALUES
(1, 'mail', 'smtp.gmail.com', '587', 'myemail@gmail.com', 'mypassword', 'GIITS', 'mail@greenworldin.com', 'tls', '2023-02-14 05:30:25', '2023-02-14 05:57:26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `social_id` text NOT NULL,
  `social_service` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_settings`
--

CREATE TABLE `social_auth_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facebook_client_id` varchar(191) DEFAULT NULL,
  `facebook_secret_id` varchar(191) DEFAULT NULL,
  `facebook_status` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `google_client_id` varchar(191) DEFAULT NULL,
  `google_secret_id` varchar(191) DEFAULT NULL,
  `google_status` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `twitter_client_id` varchar(191) DEFAULT NULL,
  `twitter_secret_id` varchar(191) DEFAULT NULL,
  `twitter_status` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `linkedin_client_id` varchar(191) DEFAULT NULL,
  `linkedin_secret_id` varchar(191) DEFAULT NULL,
  `linkedin_status` enum('enable','disable') NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `social_auth_settings`
--

INSERT INTO `social_auth_settings` (`id`, `facebook_client_id`, `facebook_secret_id`, `facebook_status`, `google_client_id`, `google_secret_id`, `google_status`, `twitter_client_id`, `twitter_secret_id`, `twitter_status`, `linkedin_client_id`, `linkedin_secret_id`, `linkedin_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', NULL, NULL, 'disable', '2023-02-14 05:30:31', '2023-02-14 05:30:31');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_notes`
--

CREATE TABLE `sticky_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_text` mediumtext NOT NULL,
  `colour` enum('blue','yellow','red','gray','purple','green') NOT NULL DEFAULT 'blue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `storage_settings`
--

CREATE TABLE `storage_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filesystem` varchar(191) NOT NULL DEFAULT 'local',
  `auth_keys` text DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `storage_settings`
--

INSERT INTO `storage_settings` (`id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, 'local', NULL, 'enabled', '2023-02-14 05:30:30', '2023-02-14 05:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(255) DEFAULT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_setting`
--

CREATE TABLE `stripe_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key` varchar(191) DEFAULT NULL,
  `api_secret` varchar(191) DEFAULT NULL,
  `webhook_key` varchar(191) DEFAULT NULL,
  `paypal_client_id` varchar(191) DEFAULT NULL,
  `paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `stripe_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `razorpay_key` varchar(191) DEFAULT NULL,
  `razorpay_secret` varchar(191) DEFAULT NULL,
  `razorpay_webhook_secret` varchar(191) DEFAULT NULL,
  `razorpay_status` enum('active','deactive') NOT NULL DEFAULT 'deactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `paypal_mode` enum('sandbox','live') NOT NULL,
  `paystack_client_id` varchar(191) DEFAULT NULL,
  `paystack_secret` varchar(191) DEFAULT NULL,
  `paystack_status` enum('active','inactive') DEFAULT 'inactive',
  `paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co',
  `mollie_api_key` varchar(191) NOT NULL,
  `mollie_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `authorize_api_login_id` varchar(191) DEFAULT NULL,
  `authorize_transaction_key` varchar(191) DEFAULT NULL,
  `authorize_signature_key` varchar(191) DEFAULT NULL,
  `authorize_environment` varchar(191) DEFAULT NULL,
  `authorize_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `payfast_key` varchar(191) DEFAULT NULL,
  `payfast_secret` varchar(191) DEFAULT NULL,
  `payfast_status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `payfast_salt_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stripe_setting`
--

INSERT INTO `stripe_setting` (`id`, `api_key`, `api_secret`, `webhook_key`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_status`, `razorpay_key`, `razorpay_secret`, `razorpay_webhook_secret`, `razorpay_status`, `created_at`, `updated_at`, `paypal_mode`, `paystack_client_id`, `paystack_secret`, `paystack_status`, `paystack_merchant_email`, `paystack_payment_url`, `mollie_api_key`, `mollie_status`, `authorize_api_login_id`, `authorize_transaction_key`, `authorize_signature_key`, `authorize_environment`, `authorize_status`, `payfast_key`, `payfast_secret`, `payfast_status`, `payfast_salt_passphrase`, `payfast_mode`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'inactive', 'inactive', NULL, NULL, NULL, 'deactive', '2023-02-14 05:30:27', '2023-02-14 05:30:27', 'sandbox', NULL, NULL, 'inactive', NULL, 'https://api.paystack.co', '', 'inactive', NULL, NULL, NULL, NULL, 'inactive', NULL, NULL, 'inactive', NULL, 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_plan` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_status` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) NOT NULL,
  `stripe_plan` varchar(191) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tasks`
--

CREATE TABLE `sub_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `due_date` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` enum('incomplete','complete') NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_task_files`
--

CREATE TABLE `sub_task_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sub_task_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('open','pending','resolved','closed') NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `support_ticket_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_files`
--

CREATE TABLE `support_ticket_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `support_ticket_reply_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_replies`
--

CREATE TABLE `support_ticket_replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` longtext NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_types`
--

CREATE TABLE `support_ticket_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `support_ticket_types`
--

INSERT INTO `support_ticket_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Question', '2023-02-14 05:30:33', '2023-02-14 05:30:33'),
(2, 'Problem', '2023-02-14 05:30:33', '2023-02-14 05:30:33'),
(3, 'Incident', '2023-02-14 05:30:33', '2023-02-14 05:30:33'),
(4, 'Feature Request', '2023-02-14 05:30:33', '2023-02-14 05:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `taskboard_columns`
--

CREATE TABLE `taskboard_columns` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `column_name` varchar(191) NOT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `label_color` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taskboard_columns`
--

INSERT INTO `taskboard_columns` (`id`, `company_id`, `column_name`, `slug`, `label_color`, `priority`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Incomplete', 'incomplete', '#d21010', 1, '2023-02-14 05:30:22', '2023-02-14 05:30:26'),
(2, NULL, 'Completed', 'completed', '#679c0d', 2, '2023-02-14 05:30:23', '2023-02-14 05:30:26'),
(3, 1, 'Incomplete', 'incomplete', '#d21010', 1, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(4, 1, 'Completed', 'completed', '#679c0d', 2, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `heading` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `status` enum('incomplete','completed') NOT NULL DEFAULT 'incomplete',
  `board_column_id` int(10) UNSIGNED DEFAULT NULL,
  `column_priority` int(11) NOT NULL,
  `completed_on` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `recurring_task_id` int(10) UNSIGNED DEFAULT NULL,
  `dependent_task_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `milestone_id` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 1,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `estimate_hours` int(11) NOT NULL,
  `estimate_minutes` int(11) NOT NULL,
  `hash` varchar(64) DEFAULT NULL,
  `event_id` text DEFAULT NULL,
  `task_request_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_category`
--

CREATE TABLE `task_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_comment_files`
--

CREATE TABLE `task_comment_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `comment_id` int(10) UNSIGNED DEFAULT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_files`
--

CREATE TABLE `task_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_history`
--

CREATE TABLE `task_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `sub_task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `details` text NOT NULL,
  `board_column_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_labels`
--

CREATE TABLE `task_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `label_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_label_list`
--

CREATE TABLE `task_label_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `label_name` varchar(191) NOT NULL,
  `color` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_notes`
--

CREATE TABLE `task_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_requests`
--

CREATE TABLE `task_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(191) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `column_priority` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `dependent_task_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT 1,
  `request_status` enum('pending','approve','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_request_files`
--

CREATE TABLE `task_request_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_users`
--

CREATE TABLE `task_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_name` varchar(191) NOT NULL,
  `rate_percent` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `team_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `comment` text DEFAULT NULL,
  `rating` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `language_setting_id`, `name`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(1, NULL, 'theon salvatore', 'Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit.\n                            Aenean amet socada commodo sit.', 5.00, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(2, NULL, 'jenna gilbert', 'Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit.\n                            Aenean amet socada commodo sit.', 4.00, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(3, NULL, 'Redh gilbert', 'Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit.\n                            Aenean amet socada commodo sit.', 3.00, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(4, NULL, 'angela whatson', 'Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit.\n                            Aenean amet socada commodo sit.', 4.00, '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(5, NULL, 'angela whatson', 'Lorem ipsum dolor sit detudzdae amet, rcquisc adipiscing elit.\n                            Aenean amet socada commodo sit.', 2.00, '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `panel` varchar(191) NOT NULL,
  `header_color` varchar(191) NOT NULL,
  `sidebar_color` varchar(191) NOT NULL,
  `sidebar_text_color` varchar(191) NOT NULL,
  `link_color` varchar(191) NOT NULL DEFAULT '#ffffff',
  `user_css` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `enable_rounded_theme` tinyint(1) NOT NULL DEFAULT 0,
  `login_background` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `company_id`, `panel`, `header_color`, `sidebar_color`, `sidebar_text_color`, `link_color`, `user_css`, `created_at`, `updated_at`, `enable_rounded_theme`, `login_background`) VALUES
(1, NULL, 'superadmin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2023-02-14 05:30:31', '2023-02-14 05:45:19', 0, NULL),
(2, 1, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 0, NULL),
(3, 1, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 0, NULL),
(4, 1, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 0, NULL),
(5, 1, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` text NOT NULL,
  `status` enum('open','pending','resolved','closed') NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `close_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_agent_groups`
--

CREATE TABLE `ticket_agent_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_channels`
--

CREATE TABLE `ticket_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_channels`
--

INSERT INTO `ticket_channels` (`id`, `company_id`, `channel_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Email', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(2, NULL, 'Phone', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(3, NULL, 'Twitter', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(4, NULL, 'Facebook', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(5, 1, 'Email', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(6, 1, 'Phone', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(7, 1, 'Twitter', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(8, 1, 'Facebook', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_custom_forms`
--

CREATE TABLE `ticket_custom_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `field_display_name` varchar(191) NOT NULL,
  `field_name` varchar(191) NOT NULL,
  `field_type` varchar(191) NOT NULL DEFAULT 'text',
  `field_order` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_custom_forms`
--

INSERT INTO `ticket_custom_forms` (`id`, `company_id`, `field_display_name`, `field_name`, `field_type`, `field_order`, `status`, `created_at`, `updated_at`, `required`) VALUES
(1, 1, 'Name', 'name', 'text', 1, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(2, 1, 'Email', 'email', 'text', 2, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(3, 1, 'Ticket Subject', 'ticket_subject', 'text', 3, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(4, 1, 'Message', 'message', 'textarea', 4, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 1),
(5, 1, 'Type', 'type', 'select', 5, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0),
(6, 1, 'Priority', 'priority', 'select', 6, 'active', '2023-02-14 05:30:49', '2023-02-14 05:30:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ticket_files`
--

CREATE TABLE `ticket_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ticket_reply_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `dropbox_link` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_groups`
--

CREATE TABLE `ticket_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_groups`
--

INSERT INTO `ticket_groups` (`id`, `company_id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Sales', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(2, NULL, 'Code', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(3, NULL, 'Management', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(4, 1, 'Sales', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(5, 1, 'Code', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(6, 1, 'Management', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply_templates`
--

CREATE TABLE `ticket_reply_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_heading` mediumtext NOT NULL,
  `reply_text` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tag_list`
--

CREATE TABLE `ticket_tag_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Question', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(2, NULL, 'Problem', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(3, NULL, 'Incident', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(4, NULL, 'Feature Request', '2023-02-14 05:30:21', '2023-02-14 05:30:21'),
(5, 1, 'Question', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(6, 1, 'Problem', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(7, 1, 'Incident', '2023-02-14 05:30:48', '2023-02-14 05:30:48'),
(8, 1, 'Feature Request', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `tr_front_details`
--

CREATE TABLE `tr_front_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` int(10) UNSIGNED DEFAULT NULL,
  `header_title` varchar(200) NOT NULL,
  `header_description` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `feature_title` varchar(191) DEFAULT NULL,
  `feature_description` varchar(191) DEFAULT NULL,
  `price_title` varchar(191) DEFAULT NULL,
  `price_description` varchar(191) DEFAULT NULL,
  `task_management_title` varchar(191) DEFAULT NULL,
  `task_management_detail` text DEFAULT NULL,
  `manage_bills_title` varchar(191) DEFAULT NULL,
  `manage_bills_detail` text DEFAULT NULL,
  `teamates_title` varchar(191) DEFAULT NULL,
  `teamates_detail` text DEFAULT NULL,
  `favourite_apps_title` varchar(191) DEFAULT NULL,
  `favourite_apps_detail` text DEFAULT NULL,
  `cta_title` varchar(191) DEFAULT NULL,
  `cta_detail` text DEFAULT NULL,
  `client_title` varchar(191) DEFAULT NULL,
  `client_detail` text DEFAULT NULL,
  `testimonial_title` varchar(191) DEFAULT NULL,
  `testimonial_detail` text DEFAULT NULL,
  `faq_title` varchar(191) DEFAULT NULL,
  `faq_detail` text DEFAULT NULL,
  `footer_copyright_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tr_front_details`
--

INSERT INTO `tr_front_details` (`id`, `language_setting_id`, `header_title`, `header_description`, `image`, `feature_title`, `feature_description`, `price_title`, `price_description`, `task_management_title`, `task_management_detail`, `manage_bills_title`, `manage_bills_detail`, `teamates_title`, `teamates_detail`, `favourite_apps_title`, `favourite_apps_detail`, `cta_title`, `cta_detail`, `client_title`, `client_detail`, `testimonial_title`, `testimonial_detail`, `faq_title`, `faq_detail`, `footer_copyright_text`, `created_at`, `updated_at`) VALUES
(1, NULL, 'HR, CRM & Project Management System', 'The most powerful and simple way to collaborate with your team.<ul class=\"list1 border-top pt-5 mt-5\">\n                            <li class=\"mb-3\">\n                                Create invoices & Estimates\n                            </li>\n                            <li class=\"mb-3\">\n                                Tracks time and expenses\n                            </li>\n                            <li class=\"mb-3\">\n                                Add company’s employees, track their attendance and manage leaves\n                            </li>\n                        </ul>', '', 'Team communications for the 21st century.', NULL, 'Affordable Pricing', 'Worksuite for Teams is a single workspace for your small- to medium-sized company or team.', 'Task Management', 'Manage your projects and your talent in a single system, resulting in empowered teams, satisfied clients, and increased profitability.', 'Manages All Your Bills', 'Manage your Automate billing and revenue recognition to streamline the contract-to-cash cycle.', 'Manages All Your Bills', 'Manage your Automate billing and revenue recognition to streamline the contract-to-cash cycle.', 'Integrate With Your Favourite Apps.', 'Our app gives you the added advantage of several other third party apps through seamless integrations.', 'Managing Business Has Never Been So Easy.', 'Don\'t hesitate, Our experts will show you how our application can streamline the way your team works.', 'Trusted by the world\'s best team', 'More Than 700 People Use Our Product.', 'Loved By Businesses, And Individuals Across The Globe', NULL, 'Frequently Asked Questions', NULL, 'Copyright © 2020. All Rights Reserved', '2023-02-14 05:30:48', '2023-02-14 05:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `universal_search`
--

CREATE TABLE `universal_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `searchable_id` int(11) NOT NULL,
  `module_type` enum('ticket','invoice','notice','proposal','task','creditNote','client','employee','project','estimate','lead') DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `route_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `mobile` varchar(191) DEFAULT NULL,
  `gender` enum('male','female','others') NOT NULL DEFAULT 'male',
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `status` enum('active','deactive') NOT NULL DEFAULT 'active',
  `login` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `onesignal_player_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `super_admin` enum('0','1') NOT NULL DEFAULT '0',
  `email_verification_code` varchar(40) DEFAULT NULL,
  `social_token` varchar(191) DEFAULT NULL,
  `email_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `authorize_id` varchar(191) DEFAULT NULL,
  `authorize_payment_id` varchar(191) DEFAULT NULL,
  `card_brand` varchar(191) DEFAULT NULL,
  `card_last_four` varchar(191) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `name`, `email`, `password`, `remember_token`, `image`, `mobile`, `gender`, `locale`, `status`, `login`, `onesignal_player_id`, `created_at`, `updated_at`, `super_admin`, `email_verification_code`, `social_token`, `email_notifications`, `country_id`, `authorize_id`, `authorize_payment_id`, `card_brand`, `card_last_four`, `last_login`) VALUES
(1, NULL, 'Super Admin', 'superadmin@example.com', '$2a$12$0jIH8Hmba8wK4gZGGgPoD.YCp0WecRcGCAsqZ07bnN.h5E7P32/1y', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2023-02-14 05:30:48', '2023-02-14 05:30:48', '1', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'Admin', 'admin@example.com', '$2a$12$0jIH8Hmba8wK4gZGGgPoD.YCp0WecRcGCAsqZ07bnN.h5E7P32/1y', NULL, NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', '0', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'Employee', 'employee@example.com', '$2a$12$0jIH8Hmba8wK4gZGGgPoD.YCp0WecRcGCAsqZ07bnN.h5E7P32/1y', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', '0', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, 'Client', 'client@example.com', '$2a$12$0jIH8Hmba8wK4gZGGgPoD.YCp0WecRcGCAsqZ07bnN.h5E7P32/1y', NULL, NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2023-02-14 05:30:49', '2023-02-14 05:30:49', '0', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

CREATE TABLE `users_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) DEFAULT NULL,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `to` int(10) UNSIGNED DEFAULT NULL,
  `message_seen` enum('yes','no') NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_chat_files`
--

CREATE TABLE `users_chat_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `users_chat_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `google_url` varchar(191) DEFAULT NULL,
  `hashname` varchar(191) DEFAULT NULL,
  `size` varchar(191) DEFAULT NULL,
  `external_link` varchar(191) DEFAULT NULL,
  `external_link_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `activity` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accept_estimates_company_id_foreign` (`company_id`),
  ADD KEY `accept_estimates_estimate_id_foreign` (`estimate_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`),
  ADD KEY `attendances_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorize_invoices_company_id_foreign` (`company_id`),
  ADD KEY `authorize_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorize_subscriptions_company_id_foreign` (`company_id`),
  ADD KEY `authorize_subscriptions_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contacts_user_id_foreign` (`user_id`),
  ADD KEY `client_contacts_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_details`
--
ALTER TABLE `client_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_details_user_id_foreign` (`user_id`),
  ADD KEY `client_details_company_id_foreign` (`company_id`),
  ADD KEY `client_details_country_id_foreign` (`country_id`),
  ADD KEY `client_details_category_id_foreign` (`category_id`),
  ADD KEY `client_details_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `client_docs`
--
ALTER TABLE `client_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_docs_company_id_foreign` (`company_id`),
  ADD KEY `client_docs_user_id_foreign` (`user_id`);

--
-- Indexes for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_sub_categories_category_id_foreign` (`category_id`),
  ADD KEY `client_sub_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_user_notes_company_id_foreign` (`company_id`),
  ADD KEY `client_user_notes_user_id_foreign` (`user_id`),
  ADD KEY `client_user_notes_note_id_foreign` (`note_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_settings_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `companies_package_id_foreign` (`package_id`),
  ADD KEY `companies_default_task_status_foreign` (`default_task_status`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contracts_company_id_foreign` (`company_id`),
  ADD KEY `contracts_client_id_foreign` (`client_id`),
  ADD KEY `contracts_contract_type_id_foreign` (`contract_type_id`);

--
-- Indexes for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_discussions_company_id_foreign` (`company_id`),
  ADD KEY `contract_discussions_contract_id_foreign` (`contract_id`),
  ADD KEY `contract_discussions_from_foreign` (`from`);

--
-- Indexes for table `contract_files`
--
ALTER TABLE `contract_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_files_company_id_foreign` (`company_id`),
  ADD KEY `contract_files_user_id_foreign` (`user_id`),
  ADD KEY `contract_files_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `contract_renews`
--
ALTER TABLE `contract_renews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_renews_company_id_foreign` (`company_id`),
  ADD KEY `contract_renews_renewed_by_foreign` (`renewed_by`),
  ADD KEY `contract_renews_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `contract_signs`
--
ALTER TABLE `contract_signs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_signs_company_id_foreign` (`company_id`),
  ADD KEY `contract_signs_contract_id_foreign` (`contract_id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contract_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_user_one_foreign` (`user_one`),
  ADD KEY `conversation_user_two_foreign` (`user_two`);

--
-- Indexes for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_reply_conversation_id_foreign` (`conversation_id`),
  ADD KEY `conversation_reply_user_id_foreign` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_notes_company_id_foreign` (`company_id`),
  ADD KEY `credit_notes_project_id_foreign` (`project_id`),
  ADD KEY `credit_notes_currency_id_foreign` (`currency_id`),
  ADD KEY `credit_notes_client_id_foreign` (`client_id`);

--
-- Indexes for table `credit_notes_invoice`
--
ALTER TABLE `credit_notes_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit_note_items_credit_note_id_foreign` (`credit_note_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_company_id_foreign` (`company_id`);

--
-- Indexes for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_format_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_data_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_fields_data_model_index` (`model`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_groups_model_index` (`model`),
  ADD KEY `custom_field_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_widgets_company_id_foreign` (`company_id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designations_company_id_foreign` (`company_id`);

--
-- Indexes for table `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussions_company_id_foreign` (`company_id`),
  ADD KEY `discussions_discussion_category_id_foreign` (`discussion_category_id`),
  ADD KEY `discussions_project_id_foreign` (`project_id`),
  ADD KEY `discussions_user_id_foreign` (`user_id`),
  ADD KEY `discussions_best_answer_id_foreign` (`best_answer_id`),
  ADD KEY `discussions_last_reply_by_id_foreign` (`last_reply_by_id`);

--
-- Indexes for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `discussion_files`
--
ALTER TABLE `discussion_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_files_company_id_foreign` (`company_id`),
  ADD KEY `discussion_files_user_id_foreign` (`user_id`),
  ADD KEY `discussion_files_discussion_id_foreign` (`discussion_id`),
  ADD KEY `discussion_files_discussion_reply_id_foreign` (`discussion_reply_id`);

--
-- Indexes for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discussion_replies_company_id_foreign` (`company_id`),
  ADD KEY `discussion_replies_discussion_id_foreign` (`discussion_id`),
  ADD KEY `discussion_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_notification_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_details_slack_username_unique` (`slack_username`),
  ADD KEY `employee_details_user_id_foreign` (`user_id`),
  ADD KEY `employee_details_company_id_foreign` (`company_id`),
  ADD KEY `employee_details_designation_id_foreign` (`designation_id`),
  ADD KEY `employee_details_department_id_foreign` (`department_id`);

--
-- Indexes for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_docs_user_id_foreign` (`user_id`),
  ADD KEY `employee_docs_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_faqs`
--
ALTER TABLE `employee_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_faqs_company_id_foreign` (`company_id`),
  ADD KEY `employee_faqs_employee_faq_category_id_foreign` (`employee_faq_category_id`);

--
-- Indexes for table `employee_faq_categories`
--
ALTER TABLE `employee_faq_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_faq_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_faq_files`
--
ALTER TABLE `employee_faq_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_faq_files_company_id_foreign` (`company_id`),
  ADD KEY `employee_faq_files_user_id_foreign` (`user_id`),
  ADD KEY `employee_faq_files_employee_faq_id_foreign` (`employee_faq_id`);

--
-- Indexes for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_leave_quotas_company_id_foreign` (`company_id`),
  ADD KEY `employee_leave_quotas_user_id_foreign` (`user_id`),
  ADD KEY `employee_leave_quotas_leave_type_id_foreign` (`leave_type_id`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_skills_user_id_foreign` (`user_id`),
  ADD KEY `employee_skills_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_teams_team_id_foreign` (`team_id`),
  ADD KEY `employee_teams_user_id_foreign` (`user_id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimates_client_id_foreign` (`client_id`),
  ADD KEY `estimates_currency_id_foreign` (`currency_id`),
  ADD KEY `estimates_company_id_foreign` (`company_id`);

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_items_estimate_id_foreign` (`estimate_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_company_id_foreign` (`company_id`),
  ADD KEY `events_category_id_foreign` (`category_id`),
  ADD KEY `events_event_type_id_foreign` (`event_type_id`);

--
-- Indexes for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_attendees_user_id_foreign` (`user_id`),
  ADD KEY `event_attendees_event_id_foreign` (`event_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_categories_company_id_foreign` (`company_id`);

--
-- Indexes for table `event_types`
--
ALTER TABLE `event_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_currency_id_foreign` (`currency_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`),
  ADD KEY `expenses_expenses_recurring_id_foreign` (`expenses_recurring_id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_category_id_foreign` (`category_id`);

--
-- Indexes for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_category_roles_company_id_foreign` (`company_id`),
  ADD KEY `expenses_category_roles_expenses_category_id_foreign` (`expenses_category_id`),
  ADD KEY `expenses_category_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_recurring_company_id_foreign` (`company_id`),
  ADD KEY `expenses_recurring_currency_id_foreign` (`currency_id`),
  ADD KEY `expenses_recurring_project_id_foreign` (`project_id`),
  ADD KEY `expenses_recurring_user_id_foreign` (`user_id`),
  ADD KEY `expenses_recurring_created_by_foreign` (`created_by`),
  ADD KEY `expenses_recurring_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_faq_category_id_foreign` (`faq_category_id`);

--
-- Indexes for table `faq_categories`
--
ALTER TABLE `faq_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq_files`
--
ALTER TABLE `faq_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_files_user_id_foreign` (`user_id`),
  ADD KEY `faq_files_faq_id_foreign` (`faq_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `features_language_setting_id_foreign` (`language_setting_id`),
  ADD KEY `features_front_feature_id_foreign` (`front_feature_id`);

--
-- Indexes for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_company_id_foreign` (`company_id`);

--
-- Indexes for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `footer_menu_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_clients`
--
ALTER TABLE `front_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_clients_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_details`
--
ALTER TABLE `front_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_faqs_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_features`
--
ALTER TABLE `front_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_features_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_menu_buttons_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_widgets`
--
ALTER TABLE `front_widgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gdpr_settings`
--
ALTER TABLE `gdpr_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gdpr_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `global_currencies`
--
ALTER TABLE `global_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `global_settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `google_accounts`
--
ALTER TABLE `google_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `google_accounts_user_id_foreign` (`user_id`),
  ADD KEY `google_accounts_company_id_foreign` (`company_id`);

--
-- Indexes for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `google_calendar_modules_user_id_foreign` (`user_id`),
  ADD KEY `google_calendar_modules_company_id_foreign` (`company_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `invoices_company_id_foreign` (`company_id`),
  ADD KEY `invoices_estimate_id_foreign` (`estimate_id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_invoice_recurring_id_foreign` (`invoice_recurring_id`),
  ADD KEY `invoices_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recurring_company_id_foreign` (`company_id`),
  ADD KEY `invoice_recurring_currency_id_foreign` (`currency_id`),
  ADD KEY `invoice_recurring_project_id_foreign` (`project_id`),
  ADD KEY `invoice_recurring_client_id_foreign` (`client_id`),
  ADD KEY `invoice_recurring_user_id_foreign` (`user_id`),
  ADD KEY `invoice_recurring_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_recurring_items_invoice_recurring_id_foreign` (`invoice_recurring_id`);

--
-- Indexes for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_user_id_foreign` (`user_id`),
  ADD KEY `issues_project_id_foreign` (`project_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `language_settings`
--
ALTER TABLE `language_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_company_id_foreign` (`company_id`),
  ADD KEY `leads_currency_id_foreign` (`currency_id`),
  ADD KEY `leads_category_id_foreign` (`category_id`),
  ADD KEY `leads_agent_id_foreign` (`agent_id`);

--
-- Indexes for table `lead_agents`
--
ALTER TABLE `lead_agents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_agents_company_id_foreign` (`company_id`),
  ADD KEY `lead_agents_user_id_foreign` (`user_id`);

--
-- Indexes for table `lead_category`
--
ALTER TABLE `lead_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_custom_forms_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_files_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_files_user_id_foreign` (`user_id`),
  ADD KEY `lead_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_follow_up_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_sources_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_status_company_id_foreign` (`company_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `licences_company_id_foreign` (`company_id`),
  ADD KEY `licences_package_id_foreign` (`package_id`);

--
-- Indexes for table `log_time_for`
--
ALTER TABLE `log_time_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_time_for_company_id_foreign` (`company_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_settings`
--
ALTER TABLE `message_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mollie_invoices_company_id_foreign` (`company_id`),
  ADD KEY `mollie_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mollie_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_client_id_foreign` (`client_id`),
  ADD KEY `notes_company_id_foreign` (`company_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_company_id_foreign` (`company_id`),
  ADD KEY `notices_department_id_foreign` (`department_id`);

--
-- Indexes for table `notice_views`
--
ALTER TABLE `notice_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_views_company_id_foreign` (`company_id`),
  ADD KEY `notice_views_notice_id_foreign` (`notice_id`),
  ADD KEY `notice_views_user_id_foreign` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  ADD KEY `notifications_company_id_foreign` (`company_id`);

--
-- Indexes for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_invoices_company_id_foreign` (`company_id`),
  ADD KEY `offline_invoices_package_id_foreign` (`package_id`),
  ADD KEY `offline_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_invoice_payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_invoice_payments_client_id_foreign` (`client_id`),
  ADD KEY `offline_invoice_payments_payment_method_id_foreign` (`payment_method_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_plan_changes_company_id_foreign` (`company_id`),
  ADD KEY `offline_plan_changes_package_id_foreign` (`package_id`),
  ADD KEY `offline_plan_changes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_plan_changes_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_settings`
--
ALTER TABLE `package_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_invoices_company_id_foreign` (`company_id`),
  ADD KEY `payfast_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  ADD UNIQUE KEY `payments_plan_id_unique` (`plan_id`),
  ADD UNIQUE KEY `payments_event_id_unique` (`event_id`),
  ADD KEY `payments_currency_id_foreign` (`currency_id`),
  ADD KEY `payments_project_id_foreign` (`project_id`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `payments_company_id_foreign` (`company_id`),
  ADD KEY `payments_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_company_id_foreign` (`company_id`);

--
-- Indexes for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paypal_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `paypal_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paystack_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_subscriptions_company_id_foreign` (`company_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `pinned`
--
ALTER TABLE `pinned`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pinned_company_id_foreign` (`company_id`),
  ADD KEY `pinned_project_id_foreign` (`project_id`),
  ADD KEY `pinned_task_id_foreign` (`task_id`),
  ADD KEY `pinned_user_id_foreign` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_company_id_foreign` (`company_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_category_company_id_foreign` (`company_id`),
  ADD KEY `product_sub_category_category_id_foreign` (`category_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_category_id_foreign` (`category_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_project_admin_foreign` (`project_admin`),
  ADD KEY `projects_company_id_foreign` (`company_id`),
  ADD KEY `projects_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_activity_project_id_foreign` (`project_id`),
  ADD KEY `project_activity_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_files_user_id_foreign` (`user_id`),
  ADD KEY `project_files_project_id_foreign` (`project_id`),
  ADD KEY `project_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_members_project_id_foreign` (`project_id`),
  ADD KEY `project_members_user_id_foreign` (`user_id`),
  ADD KEY `project_members_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_milestones_company_id_foreign` (`company_id`),
  ADD KEY `project_milestones_project_id_foreign` (`project_id`),
  ADD KEY `project_milestones_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `project_notes`
--
ALTER TABLE `project_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_notes_company_id_foreign` (`company_id`),
  ADD KEY `project_notes_project_id_foreign` (`project_id`),
  ADD KEY `project_notes_client_id_foreign` (`client_id`);

--
-- Indexes for table `project_ratings`
--
ALTER TABLE `project_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_ratings_company_id_foreign` (`company_id`),
  ADD KEY `project_ratings_project_id_foreign` (`project_id`),
  ADD KEY `project_ratings_user_id_foreign` (`user_id`);

--
-- Indexes for table `project_settings`
--
ALTER TABLE `project_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_templates_category_id_foreign` (`category_id`),
  ADD KEY `project_templates_client_id_foreign` (`client_id`),
  ADD KEY `project_templates_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_members_project_template_id_foreign` (`project_template_id`),
  ADD KEY `project_template_members_user_id_foreign` (`user_id`);

--
-- Indexes for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_sub_tasks_project_template_task_id_foreign` (`project_template_task_id`);

--
-- Indexes for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_tasks_project_template_id_foreign` (`project_template_id`),
  ADD KEY `project_template_tasks_project_template_task_category_id_foreign` (`project_template_task_category_id`);

--
-- Indexes for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_task_users_project_template_task_id_foreign` (`project_template_task_id`),
  ADD KEY `project_template_task_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_time_logs_edited_by_user_foreign` (`edited_by_user`),
  ADD KEY `project_time_logs_project_id_foreign` (`project_id`),
  ADD KEY `project_time_logs_user_id_foreign` (`user_id`),
  ADD KEY `project_time_logs_task_id_foreign` (`task_id`),
  ADD KEY `project_time_logs_company_id_foreign` (`company_id`),
  ADD KEY `project_time_logs_approved_by_foreign` (`approved_by`),
  ADD KEY `project_time_logs_invoice_id_foreign` (`invoice_id`);

--
-- Indexes for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_user_notes_company_id_foreign` (`company_id`),
  ADD KEY `project_user_notes_user_id_foreign` (`user_id`),
  ADD KEY `project_user_notes_project_notes_id_foreign` (`project_notes_id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposals_lead_id_foreign` (`lead_id`),
  ADD KEY `proposals_currency_id_foreign` (`currency_id`),
  ADD KEY `proposals_company_id_foreign` (`company_id`);

--
-- Indexes for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_items_proposal_id_foreign` (`proposal_id`),
  ADD KEY `proposal_items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_signs_company_id_foreign` (`company_id`),
  ADD KEY `proposal_signs_proposal_id_foreign` (`proposal_id`);

--
-- Indexes for table `purpose_consent`
--
ALTER TABLE `purpose_consent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose_consent_company_id_foreign` (`company_id`);

--
-- Indexes for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose_consent_leads_lead_id_foreign` (`lead_id`),
  ADD KEY `purpose_consent_leads_purpose_consent_id_foreign` (`purpose_consent_id`),
  ADD KEY `purpose_consent_leads_updated_by_id_foreign` (`updated_by_id`);

--
-- Indexes for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purpose_consent_users_client_id_foreign` (`client_id`),
  ADD KEY `purpose_consent_users_purpose_consent_id_foreign` (`purpose_consent_id`),
  ADD KEY `purpose_consent_users_updated_by_id_foreign` (`updated_by_id`);

--
-- Indexes for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pusher_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_user_id_index` (`user_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_items_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razorpay_invoices_company_id_foreign` (`company_id`),
  ADD KEY `razorpay_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `removal_requests`
--
ALTER TABLE `removal_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removal_requests_company_id_foreign` (`company_id`),
  ADD KEY `removal_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removal_requests_lead_company_id_foreign` (`company_id`),
  ADD KEY `removal_requests_lead_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_company_id_foreign` (`company_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `seo_details`
--
ALTER TABLE `seo_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign_up_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `skills_company_id_foreign` (`company_id`);

--
-- Indexes for table `slack_settings`
--
ALTER TABLE `slack_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slack_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sticky_notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `storage_settings`
--
ALTER TABLE `storage_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_tasks_task_id_foreign` (`task_id`);

--
-- Indexes for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_task_files_company_id_foreign` (`company_id`),
  ADD KEY `sub_task_files_user_id_foreign` (`user_id`),
  ADD KEY `sub_task_files_sub_task_id_foreign` (`sub_task_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_tickets_user_id_foreign` (`user_id`),
  ADD KEY `support_tickets_created_by_foreign` (`created_by`),
  ADD KEY `support_tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `support_tickets_support_ticket_type_id_foreign` (`support_ticket_type_id`);

--
-- Indexes for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_files_user_id_foreign` (`user_id`),
  ADD KEY `support_ticket_files_support_ticket_reply_id_foreign` (`support_ticket_reply_id`);

--
-- Indexes for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `support_ticket_replies_support_ticket_id_foreign` (`support_ticket_id`),
  ADD KEY `support_ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `support_ticket_types_type_unique` (`type`);

--
-- Indexes for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskboard_columns_company_id_foreign` (`company_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_board_column_id_foreign` (`board_column_id`),
  ADD KEY `tasks_company_id_foreign` (`company_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`),
  ADD KEY `tasks_recurring_task_id_foreign` (`recurring_task_id`),
  ADD KEY `tasks_dependent_task_id_foreign` (`dependent_task_id`),
  ADD KEY `tasks_task_category_id_foreign` (`task_category_id`),
  ADD KEY `tasks_milestone_id_foreign` (`milestone_id`),
  ADD KEY `tasks_task_request_id_foreign` (`task_request_id`);

--
-- Indexes for table `task_category`
--
ALTER TABLE `task_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_user_id_foreign` (`user_id`),
  ADD KEY `task_comments_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_comment_files`
--
ALTER TABLE `task_comment_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comment_files_company_id_foreign` (`company_id`),
  ADD KEY `task_comment_files_user_id_foreign` (`user_id`),
  ADD KEY `task_comment_files_task_id_foreign` (`task_id`),
  ADD KEY `task_comment_files_comment_id_foreign` (`comment_id`);

--
-- Indexes for table `task_files`
--
ALTER TABLE `task_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_files_company_id_foreign` (`company_id`),
  ADD KEY `task_files_user_id_foreign` (`user_id`),
  ADD KEY `task_files_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_history`
--
ALTER TABLE `task_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_history_task_id_foreign` (`task_id`),
  ADD KEY `task_history_sub_task_id_foreign` (`sub_task_id`),
  ADD KEY `task_history_user_id_foreign` (`user_id`),
  ADD KEY `task_history_board_column_id_foreign` (`board_column_id`);

--
-- Indexes for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_tags_task_id_foreign` (`task_id`),
  ADD KEY `task_labels_label_id_foreign` (`label_id`);

--
-- Indexes for table `task_label_list`
--
ALTER TABLE `task_label_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_label_list_company_id_foreign` (`company_id`);

--
-- Indexes for table `task_notes`
--
ALTER TABLE `task_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_notes_company_id_foreign` (`company_id`),
  ADD KEY `task_notes_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_requests`
--
ALTER TABLE `task_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_requests_company_id_foreign` (`company_id`),
  ADD KEY `task_requests_project_id_foreign` (`project_id`),
  ADD KEY `task_requests_task_category_id_foreign` (`task_category_id`),
  ADD KEY `task_requests_created_by_foreign` (`created_by`),
  ADD KEY `task_requests_dependent_task_id_foreign` (`dependent_task_id`);

--
-- Indexes for table `task_request_files`
--
ALTER TABLE `task_request_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_request_files_company_id_foreign` (`company_id`),
  ADD KEY `task_request_files_user_id_foreign` (`user_id`),
  ADD KEY `task_request_files_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_users`
--
ALTER TABLE `task_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_users_task_id_foreign` (`task_id`),
  ADD KEY `task_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_foreign` (`company_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_company_id_foreign` (`company_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `testimonials_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_channel_id_foreign` (`channel_id`),
  ADD KEY `tickets_type_id_foreign` (`type_id`),
  ADD KEY `tickets_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_agent_groups_agent_id_foreign` (`agent_id`),
  ADD KEY `ticket_agent_groups_group_id_foreign` (`group_id`),
  ADD KEY `ticket_agent_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_channels_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_custom_forms_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_files_company_id_foreign` (`company_id`),
  ADD KEY `ticket_files_user_id_foreign` (`user_id`),
  ADD KEY `ticket_files_ticket_reply_id_foreign` (`ticket_reply_id`);

--
-- Indexes for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`),
  ADD KEY `ticket_replies_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_reply_templates_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `ticket_tags_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tr_front_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `universal_search`
--
ALTER TABLE `universal_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `universal_search_company_id_foreign` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`),
  ADD KEY `users_country_id_foreign` (`country_id`);

--
-- Indexes for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_user_one_foreign` (`user_one`),
  ADD KEY `users_chat_user_id_foreign` (`user_id`),
  ADD KEY `users_chat_from_foreign` (`from`),
  ADD KEY `users_chat_to_foreign` (`to`);

--
-- Indexes for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_files_company_id_foreign` (`company_id`),
  ADD KEY `users_chat_files_user_id_foreign` (`user_id`),
  ADD KEY `users_chat_files_users_chat_id_foreign` (`users_chat_id`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activities_user_id_foreign` (`user_id`),
  ADD KEY `user_activities_company_id_foreign` (`company_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_details`
--
ALTER TABLE `client_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_docs`
--
ALTER TABLE `client_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_files`
--
ALTER TABLE `contract_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_renews`
--
ALTER TABLE `contract_renews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_signs`
--
ALTER TABLE `contract_signs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_notes_invoice`
--
ALTER TABLE `credit_notes_invoice`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion_files`
--
ALTER TABLE `discussion_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee_docs`
--
ALTER TABLE `employee_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_faqs`
--
ALTER TABLE `employee_faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_faq_categories`
--
ALTER TABLE `employee_faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_faq_files`
--
ALTER TABLE `employee_faq_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_teams`
--
ALTER TABLE `employee_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_attendees`
--
ALTER TABLE `event_attendees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_types`
--
ALTER TABLE `event_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_category`
--
ALTER TABLE `expenses_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_categories`
--
ALTER TABLE `faq_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq_files`
--
ALTER TABLE `faq_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `file_storage`
--
ALTER TABLE `file_storage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_menu`
--
ALTER TABLE `footer_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_clients`
--
ALTER TABLE `front_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `front_details`
--
ALTER TABLE `front_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_faqs`
--
ALTER TABLE `front_faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `front_features`
--
ALTER TABLE `front_features`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_widgets`
--
ALTER TABLE `front_widgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gdpr_settings`
--
ALTER TABLE `gdpr_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_currencies`
--
ALTER TABLE `global_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `google_accounts`
--
ALTER TABLE `google_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_settings`
--
ALTER TABLE `language_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_agents`
--
ALTER TABLE `lead_agents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_category`
--
ALTER TABLE `lead_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lead_files`
--
ALTER TABLE `lead_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lead_status`
--
ALTER TABLE `lead_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `licences`
--
ALTER TABLE `licences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_time_for`
--
ALTER TABLE `log_time_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_settings`
--
ALTER TABLE `message_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=659;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notice_views`
--
ALTER TABLE `notice_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_settings`
--
ALTER TABLE `package_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `pinned`
--
ALTER TABLE `pinned`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_activity`
--
ALTER TABLE `project_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_milestones`
--
ALTER TABLE `project_milestones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_notes`
--
ALTER TABLE `project_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_ratings`
--
ALTER TABLE `project_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_settings`
--
ALTER TABLE `project_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_templates`
--
ALTER TABLE `project_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_members`
--
ALTER TABLE `project_template_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_items`
--
ALTER TABLE `proposal_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent`
--
ALTER TABLE `purpose_consent`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_subscriptions`
--
ALTER TABLE `razorpay_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removal_requests`
--
ALTER TABLE `removal_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seo_details`
--
ALTER TABLE `seo_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slack_settings`
--
ALTER TABLE `slack_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_settings`
--
ALTER TABLE `social_auth_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `storage_settings`
--
ALTER TABLE `storage_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_types`
--
ALTER TABLE `support_ticket_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_category`
--
ALTER TABLE `task_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_comment_files`
--
ALTER TABLE `task_comment_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_files`
--
ALTER TABLE `task_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_history`
--
ALTER TABLE `task_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_labels`
--
ALTER TABLE `task_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_label_list`
--
ALTER TABLE `task_label_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_notes`
--
ALTER TABLE `task_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_requests`
--
ALTER TABLE `task_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_request_files`
--
ALTER TABLE `task_request_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_users`
--
ALTER TABLE `task_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_files`
--
ALTER TABLE `ticket_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `universal_search`
--
ALTER TABLE `universal_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_chat`
--
ALTER TABLE `users_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accept_estimates`
--
ALTER TABLE `accept_estimates`
  ADD CONSTRAINT `accept_estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accept_estimates_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD CONSTRAINT `attendance_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authorize_invoices`
--
ALTER TABLE `authorize_invoices`
  ADD CONSTRAINT `authorize_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authorize_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `authorize_subscriptions`
--
ALTER TABLE `authorize_subscriptions`
  ADD CONSTRAINT `authorize_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `authorize_subscriptions_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD CONSTRAINT `client_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD CONSTRAINT `client_contacts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_details`
--
ALTER TABLE `client_details`
  ADD CONSTRAINT `client_details_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `client_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `client_sub_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `client_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_docs`
--
ALTER TABLE `client_docs`
  ADD CONSTRAINT `client_docs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_sub_categories`
--
ALTER TABLE `client_sub_categories`
  ADD CONSTRAINT `client_sub_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `client_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_sub_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_user_notes`
--
ALTER TABLE `client_user_notes`
  ADD CONSTRAINT `client_user_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_user_notes_note_id_foreign` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `client_user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_default_task_status_foreign` FOREIGN KEY (`default_task_status`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `organisation_settings_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contracts`
--
ALTER TABLE `contracts`
  ADD CONSTRAINT `contracts_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contracts_contract_type_id_foreign` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contract_discussions`
--
ALTER TABLE `contract_discussions`
  ADD CONSTRAINT `contract_discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_discussions_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_files`
--
ALTER TABLE `contract_files`
  ADD CONSTRAINT `contract_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_renews`
--
ALTER TABLE `contract_renews`
  ADD CONSTRAINT `contract_renews_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_renews_renewed_by_foreign` FOREIGN KEY (`renewed_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_signs`
--
ALTER TABLE `contract_signs`
  ADD CONSTRAINT `contract_signs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contract_signs_contract_id_foreign` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD CONSTRAINT `contract_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `conversation_user_one_foreign` FOREIGN KEY (`user_one`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_user_two_foreign` FOREIGN KEY (`user_two`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD CONSTRAINT `conversation_reply_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conversation_reply_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD CONSTRAINT `credit_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `credit_note_items`
--
ALTER TABLE `credit_note_items`
  ADD CONSTRAINT `credit_note_items_credit_note_id_foreign` FOREIGN KEY (`credit_note_id`) REFERENCES `credit_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currency_format_settings`
--
ALTER TABLE `currency_format_settings`
  ADD CONSTRAINT `currency_format_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD CONSTRAINT `custom_fields_custom_field_group_id_foreign` FOREIGN KEY (`custom_field_group_id`) REFERENCES `custom_field_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD CONSTRAINT `custom_fields_data_custom_field_id_foreign` FOREIGN KEY (`custom_field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD CONSTRAINT `custom_field_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dashboard_widgets`
--
ALTER TABLE `dashboard_widgets`
  ADD CONSTRAINT `dashboard_widgets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `designations`
--
ALTER TABLE `designations`
  ADD CONSTRAINT `designations_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussions`
--
ALTER TABLE `discussions`
  ADD CONSTRAINT `discussions_best_answer_id_foreign` FOREIGN KEY (`best_answer_id`) REFERENCES `discussion_replies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_discussion_category_id_foreign` FOREIGN KEY (`discussion_category_id`) REFERENCES `discussion_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_last_reply_by_id_foreign` FOREIGN KEY (`last_reply_by_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_categories`
--
ALTER TABLE `discussion_categories`
  ADD CONSTRAINT `discussion_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_files`
--
ALTER TABLE `discussion_files`
  ADD CONSTRAINT `discussion_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_discussion_reply_id_foreign` FOREIGN KEY (`discussion_reply_id`) REFERENCES `discussion_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discussion_replies`
--
ALTER TABLE `discussion_replies`
  ADD CONSTRAINT `discussion_replies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_replies_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `discussions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discussion_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  ADD CONSTRAINT `email_notification_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD CONSTRAINT `employee_details_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_designation_id_foreign` FOREIGN KEY (`designation_id`) REFERENCES `designations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD CONSTRAINT `employee_docs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_docs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_faqs`
--
ALTER TABLE `employee_faqs`
  ADD CONSTRAINT `employee_faqs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_faqs_employee_faq_category_id_foreign` FOREIGN KEY (`employee_faq_category_id`) REFERENCES `employee_faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_faq_categories`
--
ALTER TABLE `employee_faq_categories`
  ADD CONSTRAINT `employee_faq_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_faq_files`
--
ALTER TABLE `employee_faq_files`
  ADD CONSTRAINT `employee_faq_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_faq_files_employee_faq_id_foreign` FOREIGN KEY (`employee_faq_id`) REFERENCES `employee_faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_faq_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_leave_quotas`
--
ALTER TABLE `employee_leave_quotas`
  ADD CONSTRAINT `employee_leave_quotas_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_leave_quotas_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_leave_quotas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD CONSTRAINT `employee_skills_skill_id_foreign` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_skills_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD CONSTRAINT `employee_teams_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_teams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimates`
--
ALTER TABLE `estimates`
  ADD CONSTRAINT `estimates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estimates_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD CONSTRAINT `estimate_items_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `events_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `events_event_type_id_foreign` FOREIGN KEY (`event_type_id`) REFERENCES `event_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD CONSTRAINT `event_attendees_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_attendees_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD CONSTRAINT `event_categories_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_types`
--
ALTER TABLE `event_types`
  ADD CONSTRAINT `event_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_expenses_recurring_id_foreign` FOREIGN KEY (`expenses_recurring_id`) REFERENCES `expenses_recurring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_category`
--
ALTER TABLE `expenses_category`
  ADD CONSTRAINT `expenses_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_category_roles`
--
ALTER TABLE `expenses_category_roles`
  ADD CONSTRAINT `expenses_category_roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_roles_expenses_category_id_foreign` FOREIGN KEY (`expenses_category_id`) REFERENCES `expenses_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_category_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses_recurring`
--
ALTER TABLE `expenses_recurring`
  ADD CONSTRAINT `expenses_recurring_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `expenses_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_recurring_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_faq_category_id_foreign` FOREIGN KEY (`faq_category_id`) REFERENCES `faq_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `faq_files`
--
ALTER TABLE `faq_files`
  ADD CONSTRAINT `faq_files_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faq_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `features`
--
ALTER TABLE `features`
  ADD CONSTRAINT `features_front_feature_id_foreign` FOREIGN KEY (`front_feature_id`) REFERENCES `front_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD CONSTRAINT `file_storage_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD CONSTRAINT `file_storage_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `footer_menu`
--
ALTER TABLE `footer_menu`
  ADD CONSTRAINT `footer_menu_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_clients`
--
ALTER TABLE `front_clients`
  ADD CONSTRAINT `front_clients_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_faqs`
--
ALTER TABLE `front_faqs`
  ADD CONSTRAINT `front_faqs_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_features`
--
ALTER TABLE `front_features`
  ADD CONSTRAINT `front_features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_menu_buttons`
--
ALTER TABLE `front_menu_buttons`
  ADD CONSTRAINT `front_menu_buttons_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gdpr_settings`
--
ALTER TABLE `gdpr_settings`
  ADD CONSTRAINT `gdpr_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD CONSTRAINT `global_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `global_settings_last_updated_by_foreign` FOREIGN KEY (`last_updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `google_accounts`
--
ALTER TABLE `google_accounts`
  ADD CONSTRAINT `google_accounts_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `google_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `google_calendar_modules`
--
ALTER TABLE `google_calendar_modules`
  ADD CONSTRAINT `google_calendar_modules_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `google_calendar_modules_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `holidays_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_estimate_id_foreign` FOREIGN KEY (`estimate_id`) REFERENCES `estimates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_invoice_recurring_id_foreign` FOREIGN KEY (`invoice_recurring_id`) REFERENCES `invoice_recurring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_recurring`
--
ALTER TABLE `invoice_recurring`
  ADD CONSTRAINT `invoice_recurring_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `invoice_recurring_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_recurring_items`
--
ALTER TABLE `invoice_recurring_items`
  ADD CONSTRAINT `invoice_recurring_items_invoice_recurring_id_foreign` FOREIGN KEY (`invoice_recurring_id`) REFERENCES `invoice_recurring` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD CONSTRAINT `invoice_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issues`
--
ALTER TABLE `issues`
  ADD CONSTRAINT `issues_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `issues_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `lead_agents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `lead_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lead_agents`
--
ALTER TABLE `lead_agents`
  ADD CONSTRAINT `lead_agents_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_agents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_category`
--
ALTER TABLE `lead_category`
  ADD CONSTRAINT `lead_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_custom_forms`
--
ALTER TABLE `lead_custom_forms`
  ADD CONSTRAINT `lead_custom_forms_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD CONSTRAINT `lead_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lead_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD CONSTRAINT `lead_follow_up_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD CONSTRAINT `lead_sources_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD CONSTRAINT `lead_status_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `leaves_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_leave_type_id_foreign` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leaves_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD CONSTRAINT `leave_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `licences`
--
ALTER TABLE `licences`
  ADD CONSTRAINT `licences_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `licences_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `log_time_for`
--
ALTER TABLE `log_time_for`
  ADD CONSTRAINT `log_time_for_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message_settings`
--
ALTER TABLE `message_settings`
  ADD CONSTRAINT `message_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD CONSTRAINT `module_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mollie_invoices`
--
ALTER TABLE `mollie_invoices`
  ADD CONSTRAINT `mollie_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mollie_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mollie_subscriptions`
--
ALTER TABLE `mollie_subscriptions`
  ADD CONSTRAINT `mollie_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `notices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notices_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notice_views`
--
ALTER TABLE `notice_views`
  ADD CONSTRAINT `notice_views_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_views_notice_id_foreign` FOREIGN KEY (`notice_id`) REFERENCES `notices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notice_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_invoices`
--
ALTER TABLE `offline_invoices`
  ADD CONSTRAINT `offline_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_invoice_payments`
--
ALTER TABLE `offline_invoice_payments`
  ADD CONSTRAINT `offline_invoice_payments_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoice_payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_invoice_payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD CONSTRAINT `offline_payment_methods_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD CONSTRAINT `offline_plan_changes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `offline_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payfast_invoices`
--
ALTER TABLE `payfast_invoices`
  ADD CONSTRAINT `payfast_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payfast_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payfast_subscriptions`
--
ALTER TABLE `payfast_subscriptions`
  ADD CONSTRAINT `payfast_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD CONSTRAINT `payment_gateway_credentials_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD CONSTRAINT `paypal_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paypal_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `paystack_invoices`
--
ALTER TABLE `paystack_invoices`
  ADD CONSTRAINT `paystack_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paystack_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paystack_subscriptions`
--
ALTER TABLE `paystack_subscriptions`
  ADD CONSTRAINT `paystack_subscriptions_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pinned`
--
ALTER TABLE `pinned`
  ADD CONSTRAINT `pinned_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinned_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `product_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD CONSTRAINT `product_sub_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sub_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_project_admin_foreign` FOREIGN KEY (`project_admin`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD CONSTRAINT `project_activity_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_activity_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_category`
--
ALTER TABLE `project_category`
  ADD CONSTRAINT `project_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `project_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_milestones`
--
ALTER TABLE `project_milestones`
  ADD CONSTRAINT `project_milestones_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_milestones_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_notes`
--
ALTER TABLE `project_notes`
  ADD CONSTRAINT `project_notes_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_notes_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_ratings`
--
ALTER TABLE `project_ratings`
  ADD CONSTRAINT `project_ratings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ratings_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_settings`
--
ALTER TABLE `project_settings`
  ADD CONSTRAINT `project_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD CONSTRAINT `project_templates_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_templates_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD CONSTRAINT `project_template_members_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_sub_tasks`
--
ALTER TABLE `project_template_sub_tasks`
  ADD CONSTRAINT `project_template_sub_tasks_project_template_task_id_foreign` FOREIGN KEY (`project_template_task_id`) REFERENCES `project_template_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD CONSTRAINT `project_template_tasks_project_template_id_foreign` FOREIGN KEY (`project_template_id`) REFERENCES `project_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_tasks_project_template_task_category_id_foreign` FOREIGN KEY (`project_template_task_category_id`) REFERENCES `task_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `project_template_task_users`
--
ALTER TABLE `project_template_task_users`
  ADD CONSTRAINT `project_template_task_users_project_template_task_id_foreign` FOREIGN KEY (`project_template_task_id`) REFERENCES `project_template_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_template_task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD CONSTRAINT `project_time_logs_approved_by_foreign` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_edited_by_user_foreign` FOREIGN KEY (`edited_by_user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_time_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_user_notes`
--
ALTER TABLE `project_user_notes`
  ADD CONSTRAINT `project_user_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_user_notes_project_notes_id_foreign` FOREIGN KEY (`project_notes_id`) REFERENCES `project_notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `project_user_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposals`
--
ALTER TABLE `proposals`
  ADD CONSTRAINT `proposals_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposals_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD CONSTRAINT `proposal_items_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_items_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proposal_signs`
--
ALTER TABLE `proposal_signs`
  ADD CONSTRAINT `proposal_signs_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proposal_signs_proposal_id_foreign` FOREIGN KEY (`proposal_id`) REFERENCES `proposals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent`
--
ALTER TABLE `purpose_consent`
  ADD CONSTRAINT `purpose_consent_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_leads`
--
ALTER TABLE `purpose_consent_leads`
  ADD CONSTRAINT `purpose_consent_leads_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_leads_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purpose_consent_users`
--
ALTER TABLE `purpose_consent_users`
  ADD CONSTRAINT `purpose_consent_users_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_purpose_consent_id_foreign` FOREIGN KEY (`purpose_consent_id`) REFERENCES `purpose_consent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purpose_consent_users_updated_by_id_foreign` FOREIGN KEY (`updated_by_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  ADD CONSTRAINT `pusher_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD CONSTRAINT `push_subscriptions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_quotation_id_foreign` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `razorpay_invoices`
--
ALTER TABLE `razorpay_invoices`
  ADD CONSTRAINT `razorpay_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `razorpay_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests`
--
ALTER TABLE `removal_requests`
  ADD CONSTRAINT `removal_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `removal_requests_lead`
--
ALTER TABLE `removal_requests_lead`
  ADD CONSTRAINT `removal_requests_lead_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `removal_requests_lead_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seo_details`
--
ALTER TABLE `seo_details`
  ADD CONSTRAINT `seo_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sign_up_settings`
--
ALTER TABLE `sign_up_settings`
  ADD CONSTRAINT `sign_up_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `skills`
--
ALTER TABLE `skills`
  ADD CONSTRAINT `skills_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slack_settings`
--
ALTER TABLE `slack_settings`
  ADD CONSTRAINT `slack_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD CONSTRAINT `sticky_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD CONSTRAINT `stripe_invoices_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stripe_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD CONSTRAINT `sub_tasks_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_task_files`
--
ALTER TABLE `sub_task_files`
  ADD CONSTRAINT `sub_task_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_task_files_sub_task_id_foreign` FOREIGN KEY (`sub_task_id`) REFERENCES `sub_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `support_tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_support_ticket_type_id_foreign` FOREIGN KEY (`support_ticket_type_id`) REFERENCES `support_ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `support_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_ticket_files`
--
ALTER TABLE `support_ticket_files`
  ADD CONSTRAINT `support_ticket_files_support_ticket_reply_id_foreign` FOREIGN KEY (`support_ticket_reply_id`) REFERENCES `support_ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `support_ticket_replies`
--
ALTER TABLE `support_ticket_replies`
  ADD CONSTRAINT `support_ticket_replies_support_ticket_id_foreign` FOREIGN KEY (`support_ticket_id`) REFERENCES `support_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `support_ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  ADD CONSTRAINT `taskboard_columns_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_dependent_task_id_foreign` FOREIGN KEY (`dependent_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_milestone_id_foreign` FOREIGN KEY (`milestone_id`) REFERENCES `project_milestones` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_recurring_task_id_foreign` FOREIGN KEY (`recurring_task_id`) REFERENCES `tasks` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tasks_task_request_id_foreign` FOREIGN KEY (`task_request_id`) REFERENCES `task_requests` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `task_category`
--
ALTER TABLE `task_category`
  ADD CONSTRAINT `task_category_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_comment_files`
--
ALTER TABLE `task_comment_files`
  ADD CONSTRAINT `task_comment_files_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `task_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comment_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comment_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_comment_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_files`
--
ALTER TABLE `task_files`
  ADD CONSTRAINT `task_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_history`
--
ALTER TABLE `task_history`
  ADD CONSTRAINT `task_history_board_column_id_foreign` FOREIGN KEY (`board_column_id`) REFERENCES `taskboard_columns` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_sub_task_id_foreign` FOREIGN KEY (`sub_task_id`) REFERENCES `sub_tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_history_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_labels`
--
ALTER TABLE `task_labels`
  ADD CONSTRAINT `task_labels_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `task_label_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_tags_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_label_list`
--
ALTER TABLE `task_label_list`
  ADD CONSTRAINT `task_label_list_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_notes`
--
ALTER TABLE `task_notes`
  ADD CONSTRAINT `task_notes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_notes_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_requests`
--
ALTER TABLE `task_requests`
  ADD CONSTRAINT `task_requests_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_requests_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_requests_dependent_task_id_foreign` FOREIGN KEY (`dependent_task_id`) REFERENCES `task_requests` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `task_requests_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_requests_task_category_id_foreign` FOREIGN KEY (`task_category_id`) REFERENCES `task_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_request_files`
--
ALTER TABLE `task_request_files`
  ADD CONSTRAINT `task_request_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_request_files_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `task_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_request_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_users`
--
ALTER TABLE `task_users`
  ADD CONSTRAINT `task_users_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `task_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD CONSTRAINT `testimonials_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD CONSTRAINT `theme_settings_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `ticket_channels` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `ticket_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD CONSTRAINT `ticket_agent_groups_agent_id_foreign` FOREIGN KEY (`agent_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_agent_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `ticket_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  ADD CONSTRAINT `ticket_channels_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_custom_forms`
--
ALTER TABLE `ticket_custom_forms`
  ADD CONSTRAINT `ticket_custom_forms_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_files`
--
ALTER TABLE `ticket_files`
  ADD CONSTRAINT `ticket_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_ticket_reply_id_foreign` FOREIGN KEY (`ticket_reply_id`) REFERENCES `ticket_replies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  ADD CONSTRAINT `ticket_groups_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD CONSTRAINT `ticket_replies_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_replies_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  ADD CONSTRAINT `ticket_reply_templates_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD CONSTRAINT `ticket_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `ticket_tag_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_tags_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD CONSTRAINT `ticket_types_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tr_front_details`
--
ALTER TABLE `tr_front_details`
  ADD CONSTRAINT `tr_front_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `universal_search`
--
ALTER TABLE `universal_search`
  ADD CONSTRAINT `universal_search_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD CONSTRAINT `users_chat_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_user_one_foreign` FOREIGN KEY (`user_one`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_chat_files`
--
ALTER TABLE `users_chat_files`
  ADD CONSTRAINT `users_chat_files_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_chat_files_users_chat_id_foreign` FOREIGN KEY (`users_chat_id`) REFERENCES `users_chat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD CONSTRAINT `user_activities_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
