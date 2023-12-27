-- -------------------------------------------------------------
-- TablePlus 5.5.2(512)
--
-- https://tableplus.com/
--
-- Database: api_leads_management
-- Generation Time: 2023-12-27 13:29:43.3490
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `branches` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branches_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `channels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channels_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `leads` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) unsigned NOT NULL,
  `status_id` bigint(20) unsigned NOT NULL,
  `probability_id` bigint(20) unsigned NOT NULL,
  `type_id` bigint(20) unsigned NOT NULL,
  `channel_id` bigint(20) unsigned NOT NULL,
  `media_id` bigint(20) unsigned DEFAULT NULL,
  `source_id` bigint(20) unsigned DEFAULT NULL,
  `lead_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leads_lead_number_unique` (`lead_number`),
  UNIQUE KEY `leads_email_unique` (`email`),
  UNIQUE KEY `leads_phone_number_unique` (`phone_number`),
  KEY `leads_branch_id_foreign` (`branch_id`),
  KEY `leads_status_id_foreign` (`status_id`),
  KEY `leads_probability_id_foreign` (`probability_id`),
  KEY `leads_type_id_foreign` (`type_id`),
  KEY `leads_channel_id_foreign` (`channel_id`),
  KEY `leads_media_id_foreign` (`media_id`),
  KEY `leads_source_id_foreign` (`source_id`),
  CONSTRAINT `leads_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`),
  CONSTRAINT `leads_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  CONSTRAINT `leads_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `leads_probability_id_foreign` FOREIGN KEY (`probability_id`) REFERENCES `probabilities` (`id`),
  CONSTRAINT `leads_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`),
  CONSTRAINT `leads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `leads_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_name_unique` (`name`),
  KEY `media_channel_id_foreign` (`channel_id`),
  CONSTRAINT `media_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `probabilities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sources_media_id_foreign` (`media_id`),
  CONSTRAINT `sources_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `statuses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;;

INSERT INTO `branches` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'GlobalXtreme Bali', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'GlobalXtreme Malang', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'GlobalXtreme Jakarta', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(4, 'GlobalXtreme Balikpapan', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(5, 'GlobalXtreme Samarinda', '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `channels` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Official Channels', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Walk-ins', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'Marketing Channels', '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `leads` (`id`, `branch_id`, `status_id`, `probability_id`, `type_id`, `channel_id`, `media_id`, `source_id`, `lead_number`, `fullname`, `email`, `phone_number`, `address`, `latitude`, `longitude`, `company_name`, `notes`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 1, 2, 1, 3, 5, 'WL11810049', 'Dr. Ona Jaskolski', 'rosenbaum.rafael@example.com', '32021240341', '7252 Schneider Walks\nLake Gracie, NY 61511', '77.3451', '-54.968626', 'Gusikowski, Kozey and Weissnat', 'Quia sunt illo recusandae quae qui reprehenderit. In esse voluptas id ullam dicta est. Eos itaque dolor necessitatibus atque. Harum voluptatum vero dolorum labore amet omnis deleniti.', '2023-12-22 03:57:44', '2023-12-25 05:29:37'),
(2, 3, 4, 2, 1, 3, 14, 8, 'BZ95801097', 'Tressa Rutherford MD', 'elmore.shields@example.net', '1-281-946-0762', '76152 McDermott Manors Apt. 427\nEmelystad, VT 87549', '-23.708853', '-9.696729', 'Hauck-Kassulke', 'Aut et aliquam nobis aut nesciunt dolores error. Aut quia dolor beatae consectetur. Dolorum dolorum provident consequatur doloribus animi.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 1, 8, 2, 1, 1, 2, 3, 'SZ91079067', 'Itzel Wolf', 'qraynor@example.org', '+1-458-635-4723', '1407 Jamar Roads Apt. 443\nAufderharborough, NV 93508', '26.371991', '-64.855357', 'Conn, Lehner and Beier', 'Voluptate quod quia voluptatem amet illum. Ratione praesentium amet consequuntur. Aut at sunt qui excepturi aut. Quia qui non repellendus omnis omnis. Aut placeat veniam iusto est quod et qui.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(4, 2, 6, 1, 1, 1, 5, NULL, 'MR21380557', 'Michael Daugherty', 'mzieme@example.org', '+1.567.517.5921', '88631 Eulah Roads\nSouth Ashton, MD 94034-2939', '-78.589775', '22.525173', 'Weimann, Von and King', 'Aut et assumenda quae tempora aut unde tempora. Nihil quo voluptatem nihil hic. Ipsa non aliquid dolore a sunt corrupti aut. Omnis delectus culpa vero accusamus.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(5, 5, 10, 2, 2, 1, 1, 2, 'NN73407374', 'Ms. Heloise Brekke', 'hermann.jayme@example.com', '+1.870.766.0271', '594 Beau Landing\nEmardtown, MI 30776', '59.380044', '6.094614', 'Grady-VonRueden', 'Repudiandae qui ratione maxime impedit repellendus doloremque. Ipsam rem sit non aperiam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(6, 3, 2, 2, 1, 1, 6, NULL, 'AC71024064', 'Modesta Feeney', 'sschumm@example.org', '+1.816.213.3633', '148 Emard Street\nPort Mollie, KS 67238-1019', '84.901132', '-157.516434', 'Kling-Schultz', 'Quisquam qui excepturi rerum expedita ipsum vitae. Et enim fugit et et corporis aut. Voluptatem assumenda maxime qui necessitatibus eveniet quisquam. Eligendi rerum ut et dolorem quia aliquam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(8, 5, 3, 3, 1, 3, 13, NULL, 'IE18112891', 'Schuyler Stanton V', 'ahaley@example.com', '928.820.0884', '72535 Olson Motorway\nBogantown, KY 21814-5517', '-28.625912', '-1.247434', 'Zboncak LLC', 'Ut impedit minima eos laudantium sint. Nihil saepe debitis quam et iste inventore.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(9, 3, 3, 1, 1, 3, 13, NULL, 'CX65179224', 'Prof. Dayna Hudson', 'mary.mraz@example.com', '1-520-683-2390', '833 Kuhn Cove Suite 266\nHayleyville, NE 65790', '45.012103', '-83.245124', 'Steuber, Orn and Leannon', 'Et aut corrupti qui labore ipsa voluptatem sunt. Nisi ut impedit perferendis ipsa repellendus quis. Sint reiciendis aliquid ut reprehenderit voluptatem. Sed totam fugit et sed sed sit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(10, 2, 2, 3, 2, 2, 12, NULL, 'LH08875913', 'Elenora Adams', 'coby25@example.net', '314-764-7357', '1065 Rory Island\nCorkerychester, MS 34362-2279', '-85.080855', '81.100238', 'Monahan, Adams and Kulas', 'Vero rerum animi harum modi. Doloremque maiores alias est officiis non blanditiis. Sequi ea aspernatur nulla earum explicabo soluta quibusdam non. Veniam repellat fugit autem hic ea asperiores.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(11, 4, 7, 2, 2, 2, 9, NULL, 'VF13924338', 'Bettye Olson', 'eileen31@example.com', '1-240-925-7808', '18419 Klein Port\nSouth Cristobal, NE 31764', '-53.440378', '-144.687473', 'Baumbach-Howell', 'Porro iusto minima asperiores ut. In delectus qui qui reprehenderit maiores eos odio. Eveniet illo qui aspernatur. Incidunt tempore magnam velit nesciunt aliquam qui.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(12, 5, 4, 3, 2, 2, 11, NULL, 'DS04694305', 'Joseph Koelpin', 'stehr.zula@example.com', '1-925-486-3318', '9361 Monica Lock\nBartolettiport, NC 05944', '38.6141', '-89.825923', 'Collins-Jaskolski', 'Error voluptatem dolorem laboriosam vero ducimus. Aliquid voluptatem cumque eos maxime quos. Unde quia expedita molestiae ducimus.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(13, 3, 4, 3, 2, 2, 8, NULL, 'SV84018027', 'Angelica Goldner', 'vokeefe@example.com', '458-536-3854', '61983 Gleichner Court\nNorth Howellborough, WA 98323-3788', '19.371776', '161.697947', 'Kilback Ltd', 'Laboriosam est natus ea aliquid. Est magni labore iure est nobis quis ipsum. Iste aperiam facere debitis laboriosam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(14, 5, 5, 2, 1, 3, 13, NULL, 'JA21892010', 'Virginie Pollich', 'katrine82@example.org', '1-720-509-4227', '62384 Luettgen Well\nWolffshire, OH 49260-5990', '-49.435388', '39.740952', 'Greenfelder Inc', 'Soluta sapiente sapiente dolores eum ipsa ut. Sint rem dolorum cumque sed. Perferendis esse dicta sint eligendi dolor. Nisi a ut non eaque.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(15, 3, 2, 3, 1, 2, 12, NULL, 'FY96010846', 'Nina Greenfelder', 'fabian.walker@example.net', '970.714.4689', '4886 Considine Street\nSouth Ryan, NV 92747', '-55.111562', '-86.132657', 'Bergstrom-Walker', 'Veritatis quisquam odit officia libero. Et doloremque voluptas incidunt unde. Eius soluta odit tempora.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(16, 3, 3, 1, 2, 3, 14, 10, 'HL54153175', 'Alan Paucek', 'wsanford@example.net', '+1-512-851-3936', '965 Pouros Track Apt. 895\nConroymouth, WI 11448-3475', '-67.381534', '57.972151', 'Marquardt Group', 'Excepturi sit voluptatum vitae fuga ut. Laborum molestiae cupiditate sunt optio vitae quia. Ad voluptas magni modi rerum iusto aliquid. Ullam non minima eum.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(17, 2, 10, 2, 1, 2, 10, NULL, 'AP28467468', 'Prof. Berry Greenfelder II', 'keshawn87@example.com', '+1-304-862-8875', '11702 Mills Ports\nHilpertshire, ID 89944-3734', '58.192993', '-114.093887', 'O\'Connell-Pfeffer', 'Tenetur iure eum molestiae voluptates necessitatibus fuga optio. Et fuga omnis et fugit dolores similique. Quaerat voluptatem sunt non. Voluptatem ipsa voluptas modi facilis est odio odit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(18, 3, 10, 1, 1, 2, 12, NULL, 'TR78635431', 'Etha Hahn Sr.', 'gswift@example.com', '1-641-697-7413', '9883 Emery Mountain Apt. 371\nEast Rickie, NM 99607-6674', '15.895181', '-41.771162', 'Beier, Lindgren and Senger', 'Incidunt aspernatur et aut quaerat nam. Est a omnis ipsam voluptate minus quis. Ut expedita quaerat ratione.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(19, 1, 1, 3, 2, 2, 10, NULL, 'GB30900442', 'Mr. Avery Bashirian III', 'gsteuber@example.com', '(347) 324-1620', '9114 Reginald Station Apt. 164\nSouth Daphnee, MO 28686', '49.694947', '-6.046568', 'Zulauf-Deckow', 'Sed ratione deserunt numquam illum cupiditate maxime quidem magni. Est quis et necessitatibus sit. Et beatae tenetur quo minus quam. Laboriosam accusantium commodi ut quas autem veritatis magnam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(20, 1, 2, 1, 1, 2, 9, NULL, 'NL67231183', 'Wiley Hessel MD', 'brad.reilly@example.com', '+12015762254', '5634 Connelly Harbor\nNorth Verna, NJ 63437', '17.759141', '133.169551', 'Kulas, Casper and Swaniawski', 'Minus dignissimos optio animi optio veritatis. Quia quibusdam voluptatem ratione consequatur placeat provident. Harum officia consequatur eos laboriosam earum.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(21, 1, 1, 1, 1, 3, 13, NULL, 'MG03312879', 'Prof. Lavina Howell DDS', 'lbraun@example.net', '+1 (210) 948-4830', '9580 Morton Glens\nSouth Websterfort, VA 18036', '65.559257', '-121.670662', 'Green-Hagenes', 'Impedit numquam ea et et nihil aut omnis aut. Natus aut dolore iste qui tempore. Saepe consectetur et et nemo repellendus.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(22, 3, 10, 3, 1, 3, 13, NULL, 'VY07617251', 'Ryleigh Walsh', 'mlindgren@example.com', '1-423-513-8334', '245 Carson Locks\nWest Constance, SC 66872', '-84.281525', '137.491556', 'Harris, Reinger and Gusikowski', 'Veniam aut eius voluptate eos. Deleniti est adipisci repellat eveniet unde dolorem.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(23, 1, 2, 3, 2, 3, 14, 11, 'RS70808200', 'Katrina Paucek', 'bruen.ken@example.com', '1-917-806-3377', '87857 Sawayn Lights Apt. 876\nNew Eldon, MD 36791-6047', '-43.083711', '-142.853145', 'Hyatt Inc', 'Aliquam voluptatem minus et quis. Tempora amet dolore ad modi. Voluptates ut fuga provident et omnis et sit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(24, 2, 7, 3, 1, 3, 13, NULL, 'YY58463170', 'Mayra Nader V', 'aliza44@example.com', '1-636-512-2708', '7188 Albina Mount Suite 629\nNolanfort, LA 01643-7605', '-79.428737', '-52.924433', 'Parker and Sons', 'Et veniam at quia aspernatur. Aliquid ea accusantium et. Quia voluptates quo fugiat iure quia explicabo ipsa a. Cum sed pariatur ut et.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(25, 5, 10, 3, 2, 3, 13, NULL, 'FH58279800', 'Dr. Rod Gleichner II', 'paolo.walsh@example.com', '+1-458-680-7720', '7591 Paxton Fields\nWest Wilmer, VA 16886-2514', '52.983952', '18.527712', 'Champlin and Sons', 'Asperiores eveniet dolor rerum corrupti neque corporis sit. Quis minus consequuntur autem voluptate magnam culpa. Eius consectetur qui voluptatem est a.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(26, 4, 8, 2, 2, 1, 3, 6, 'UG81819870', 'Prof. Raquel Jerde', 'maxime83@example.net', '1-314-569-2888', '819 Orn Radial\nPort Ova, WY 77482-1539', '-87.457167', '110.80253', 'Williamson-Bruen', 'Quos omnis eveniet officiis sequi maiores. Repellendus molestiae qui id voluptatem autem debitis aut. Iure soluta repellat omnis. Et excepturi ut sed minus aliquid aut.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(27, 2, 9, 2, 2, 3, 14, 8, 'GT99879378', 'Gerald Buckridge', 'berge.amelia@example.net', '+16404303407', '188 Sandra Plaza Apt. 792\nLake Lyda, IL 62034-3620', '26.832677', '-174.74884', 'Cummings Inc', 'Eos explicabo maiores est reiciendis omnis. Voluptatem tempore exercitationem id at. Facere non nemo magnam architecto.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(28, 4, 10, 3, 1, 1, 2, 3, 'PQ00964725', 'Nella Hayes I', 'hayes.cortney@example.net', '+1-570-934-6056', '4606 Grace Orchard Apt. 232\nLake Chasefurt, TN 57801-8609', '-10.06063', '136.312368', 'Harvey, Zulauf and Langosh', 'Consequatur nemo temporibus fuga molestiae. Facilis ipsa totam et velit est est provident. Deleniti laborum ut voluptas earum. Qui nihil molestiae voluptates vitae.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(29, 5, 5, 3, 1, 3, 13, NULL, 'AR21423585', 'Mrs. Rebeca Cummerata V', 'jayson.wisozk@example.net', '+1-520-896-5066', '505 Aurore Parks Apt. 616\nLake Rachelle, HI 70364', '81.464544', '-159.487641', 'Schuppe Group', 'Ratione voluptas quae similique nulla. Eius illo delectus voluptatem fugiat dolorum. Minus vitae consectetur ut dolores sed.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(30, 4, 1, 3, 1, 1, 3, 5, 'ND52815835', 'Granville Hettinger', 'lizzie10@example.org', '216-391-8891', '60153 Rodriguez Rapid\nWest Betsy, SC 22157', '-86.729347', '124.229372', 'Mills-Pfeffer', 'Praesentium ut iste quisquam accusantium occaecati aspernatur. Nihil quam eum assumenda aut. Omnis quisquam autem sint doloremque. A itaque quis rerum voluptatem.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(31, 5, 1, 3, 2, 3, 13, NULL, 'SF87047843', 'Miss Rosalinda Veum', 'tbergnaum@example.net', '+1.989.683.2943', '930 Huel Drives\nLitzyton, ID 34248-4366', '48.715827', '177.99423', 'O\'Hara, Ritchie and Schmeler', 'Ut reiciendis et ut maxime commodi non beatae recusandae. Tenetur reiciendis neque blanditiis sed accusamus quidem. Aliquam voluptatem quisquam accusamus natus quos impedit suscipit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(32, 3, 5, 1, 1, 2, 8, NULL, 'FE71854263', 'Dasia Kreiger', 'akeem.botsford@example.net', '484-857-8113', '2238 Jade Heights Suite 646\nEast Dayna, MD 30562-2509', '-84.685415', '172.585909', 'Stroman-D\'Amore', 'Ipsa minima aliquam nesciunt molestias dolorum necessitatibus neque dolores. Repellat mollitia qui cupiditate voluptatem nesciunt quia dicta.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(33, 5, 3, 2, 1, 1, 6, NULL, 'JU21686467', 'Mellie Lakin', 'derrick.casper@example.com', '(360) 615-5685', '6078 Mariano Parkway\nAlfredbury, NY 57435', '-63.3636', '63.792477', 'Schowalter-Hudson', 'Quo enim officia odit ipsum. Dolores incidunt mollitia aut voluptates rem. Dolorem sapiente voluptas et quaerat ea harum corrupti. Assumenda minus eum voluptas hic fugiat voluptatem amet ut.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(34, 3, 4, 1, 1, 1, 4, NULL, 'OZ54334308', 'Mr. Clinton Kovacek', 'keara73@example.org', '+19312391382', '9410 Schoen Ports\nKileyville, LA 13460', '51.555129', '65.601109', 'Kassulke-Halvorson', 'Eum deleniti aut perspiciatis autem omnis voluptas. Dolorem cum voluptatem ut perferendis similique. Officiis cum quisquam sed ut tempora eaque.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(35, 2, 5, 1, 2, 2, 9, NULL, 'WJ68699059', 'Mekhi Fadel', 'roslyn.abernathy@example.org', '+1-864-306-0044', '230 Turner Stream\nPort Carrie, RI 71729', '31.653517', '121.380712', 'Rolfson, Kohler and Douglas', 'Rerum qui molestiae enim rerum corrupti tempora. Saepe corporis voluptas sunt accusantium ut doloremque. Dolor nesciunt maiores vero asperiores sed at ipsa omnis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(36, 4, 4, 3, 1, 3, 13, NULL, 'AJ91523309', 'Marielle Deckow', 'waelchi.euna@example.com', '+1 (929) 761-5865', '67824 Blick Lock\nLake Creolaview, MS 75553', '-88.816448', '-144.695815', 'McLaughlin-Hegmann', 'Necessitatibus et ipsam non at maiores. Non nobis id commodi possimus et. Molestiae ad et eligendi qui eum dignissimos. Qui eum nemo voluptates quaerat ea accusantium.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(37, 4, 1, 2, 2, 1, 1, 2, 'WO18480273', 'Jacey Daugherty', 'emie.raynor@example.com', '+1.412.652.6534', '94476 Hauck Extensions\nRodriguezbury, KS 94290', '-63.957687', '21.615964', 'Cole, Yundt and Hirthe', 'Nisi minus praesentium rerum non aut odit deserunt nisi. Et sed quidem porro id eum sit. Commodi enim non consequuntur provident quo eum consectetur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(38, 1, 9, 2, 1, 1, 3, 5, 'DR07888246', 'Monserrate Farrell', 'hudson.merle@example.com', '+16826309132', '494 Prohaska Camp Suite 290\nImogenefurt, UT 89120-7894', '19.094895', '66.276334', 'Windler, Strosin and Hoeger', 'Sint quis reiciendis ipsa porro veniam. Sit nihil minima laboriosam voluptatum voluptates voluptate iusto ad. A eius aut inventore eum. Sint assumenda nesciunt minima non non est corrupti.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(39, 1, 1, 1, 2, 2, 12, NULL, 'MK91697964', 'Laurie West', 'leo53@example.net', '+1-660-454-8717', '38827 Lebsack Ramp Apt. 206\nNorth Kyler, MT 91413', '-85.485898', '-17.54222', 'Gislason and Sons', 'Et aut qui voluptas consequatur officiis expedita sit officiis. Nesciunt molestiae itaque et veritatis culpa. Nihil et autem nihil nesciunt et unde.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(40, 2, 6, 1, 2, 2, 9, NULL, 'PQ82049149', 'Wiley Feest', 'uhauck@example.org', '(351) 363-4951', '8035 Reilly Plaza Suite 966\nNew Dinoport, WI 29523-5504', '-27.634506', '-100.691703', 'Paucek-Runte', 'Nulla ipsum vel alias eum amet mollitia eum. Sunt dolor ad voluptatem quaerat vero voluptatem. Adipisci ut quo dignissimos provident beatae totam voluptate.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(41, 4, 5, 1, 2, 2, 12, NULL, 'DB89635069', 'Virginie Beatty', 'bsipes@example.net', '(724) 542-8403', '540 Wiley Fork Apt. 030\nEast Earnest, KS 60569', '-30.010932', '71.483363', 'Mitchell, Schaden and Orn', 'Aliquam vero ab error perferendis iste quas voluptates. Ea repellendus numquam non quo. Doloremque non atque numquam similique ex. Qui qui ab ut quos harum. Nostrum molestias et quidem neque.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(42, 1, 10, 1, 1, 1, 4, NULL, 'VM61084586', 'Edd Moore III', 'jauer@example.com', '1-207-945-9487', '220 Brain Camp\nZackaryborough, VT 75238-2915', '-69.06041', '174.713416', 'Homenick, Bashirian and Cronin', 'Voluptatem vel architecto vel tenetur et consequatur. Voluptatibus ut consequatur sint quis error aspernatur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(43, 4, 10, 1, 1, 2, 11, NULL, 'UT29404789', 'Trycia Leannon', 'cboyle@example.com', '+1.240.672.5891', '25144 Lueilwitz Summit Suite 437\nEast Katrine, DE 21865-4278', '-6.899182', '87.421583', 'Breitenberg, Leannon and Hackett', 'Eum eius autem ex aut et illo amet. Minima nam quos repellendus ad. Ex quae eum voluptate ducimus tempore. Voluptatibus et incidunt voluptas nemo quis ea sed consequatur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(44, 3, 8, 3, 2, 2, 11, NULL, 'EN72498111', 'Delbert Bernhard', 'eveline22@example.net', '952.965.1106', '5410 Ettie Crossroad Suite 408\nPort Sofia, SD 92473', '41.495704', '-46.161513', 'Jacobs, Koss and Collier', 'Quasi explicabo sed ducimus aut autem dicta occaecati. Adipisci assumenda suscipit placeat nam. Aut id facilis vel aut occaecati.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(45, 1, 6, 3, 1, 1, 5, NULL, 'AG68754668', 'Prof. Alivia Runolfsdottir DDS', 'kerluke.ian@example.net', '240.999.8981', '2724 Douglas Lights Suite 348\nPort Lilyanshire, GA 24891', '-14.620796', '48.377683', 'Fisher and Sons', 'Optio quisquam id blanditiis eos hic consequatur. Delectus quibusdam molestiae consequuntur sequi in. Numquam minus minus sint modi sapiente. Optio magni deleniti similique modi eaque dolore.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(46, 3, 2, 1, 1, 3, 14, 7, 'GR74719009', 'Name Spencer', 'larkin.jon@example.net', '(680) 515-6309', '474 Alexanne Cliffs\nBashirianland, CA 41876', '46.785983', '15.148907', 'Konopelski, Gulgowski and Gaylord', 'Rerum incidunt cum praesentium consequuntur rerum ea. Consequatur et occaecati nihil sequi rerum eum sint.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(47, 4, 4, 1, 1, 2, 10, NULL, 'FD82093092', 'Irving Herman', 'jonatan22@example.com', '+1.364.228.0325', '1811 Micah Common Apt. 217\nNew Wilfordborough, AL 03613', '76.934659', '-144.318152', 'Doyle PLC', 'Rerum est modi quo nam eum voluptas. Ut velit sed ut dolores odit vero est mollitia. Id itaque voluptatem earum quis ad vero nihil corrupti.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(48, 4, 3, 2, 2, 3, 13, NULL, 'QG28376337', 'Dr. Samantha Schaefer II', 'tania.yost@example.com', '1-346-946-4940', '22955 Matilda Inlet\nWilfordstad, CT 95725-6662', '69.844317', '-33.36416', 'Hudson-Schultz', 'Sint vitae aut et deleniti non. Nam quam ab tempore. Modi quia qui pariatur et modi sit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(49, 1, 7, 2, 2, 2, 9, NULL, 'LK28824261', 'Paul Haag', 'kovacek.triston@example.com', '484-910-8508', '3540 Jazmyne Alley Suite 892\nSavionview, NV 65747', '23.852532', '-165.724127', 'Ankunding Inc', 'Quisquam velit incidunt corrupti iusto accusamus nihil. Impedit sapiente excepturi enim quam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(50, 4, 9, 2, 2, 3, 14, 10, 'UQ75250000', 'Janessa Gaylord DDS', 'hilma.treutel@example.org', '269.413.3698', '834 Oberbrunner Lodge\nGreenfeldermouth, UT 70108', '-49.383301', '-102.260234', 'Marks Inc', 'Repudiandae laudantium adipisci magnam at sed ipsum nobis. Provident voluptatem molestiae et cupiditate et nihil sint facere. Nulla maiores quo deserunt. Deleniti voluptates aut reprehenderit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(51, 4, 7, 1, 1, 1, 7, NULL, 'QJ48295716', 'Sim Waters', 'mrowe@example.com', '+1.615.530.2594', '842 D\'Amore Plaza Suite 091\nGiovannibury, SD 20003', '39.044883', '-128.215571', 'Paucek-Frami', 'Adipisci eius sapiente fugit molestias. Aliquam officiis et minima doloremque amet velit. Velit aliquam voluptatem facere dolores magni sit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(52, 1, 7, 2, 2, 2, 11, NULL, 'KU51373897', 'Isadore Zieme', 'kautzer.glen@example.net', '+1-640-649-6734', '65966 Hermiston Junctions Apt. 030\nFlaviemouth, WY 74435-1220', '20.382036', '54.517514', 'Wiza Group', 'Molestiae aut aut ab. Aut corporis quis temporibus et. Aut reprehenderit ullam voluptatum et ullam incidunt. Magni facere vero et quo quia totam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(53, 5, 1, 3, 1, 3, 14, 10, 'WY22839435', 'Mrs. Blanche O\'Connell PhD', 'emanuel35@example.org', '+1.949.930.1631', '8435 Kristin Fields Apt. 235\nOrvillemouth, LA 20574-3585', '-58.015795', '-32.339762', 'Johnston LLC', 'Dolorem qui perspiciatis sed quis neque est quo. Quas officia saepe consectetur officia tempora consequatur assumenda excepturi. Sapiente et repellat minus saepe. Tempora non est ullam ullam magni.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(54, 4, 6, 3, 2, 2, 11, NULL, 'AX81695948', 'Rocio Moore', 'millie.white@example.net', '+1-779-283-8765', '7710 Therese Shoals\nJodyshire, KS 00949-8171', '60.264118', '81.76157', 'Eichmann-Kris', 'Minima vel nihil et omnis nam. In nihil quo libero eum cumque. Sed alias rerum perspiciatis et. Numquam quisquam libero excepturi nobis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(55, 4, 10, 1, 1, 3, 14, 8, 'LR50275707', 'Mr. Clifton Hoppe V', 'richard.wisozk@example.org', '913.831.8763', '297 Hauck Park\nThompsonburgh, ID 96639-1049', '-20.861976', '-126.018626', 'Russel-Bauch', 'Nostrum neque nam explicabo ullam voluptas enim dolore. Dolor ipsam molestiae voluptatem dolor accusamus. Sunt voluptas ducimus qui dolore porro tempore eligendi.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(56, 5, 1, 3, 1, 2, 10, NULL, 'GG06574812', 'Jordyn Parisian', 'shanahan.august@example.net', '+1-254-547-0933', '8822 Gottlieb Field\nNorth Neva, KY 68453', '-45.002134', '20.429697', 'Schimmel, Wilderman and Herzog', 'Aut nulla eligendi ad aut. Ipsam ullam eos quia commodi dolores. Dolorum vitae quod et dolor vero alias. Est quis atque consectetur qui molestiae debitis maiores impedit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(57, 4, 4, 3, 1, 3, 14, 9, 'UR16991100', 'Vanessa Towne', 'dawson.bartoletti@example.net', '(860) 271-9855', '35102 Emmy Island\nAyanamouth, WA 11059', '-42.81954', '-108.622863', 'Hegmann, Beer and Leffler', 'Libero doloremque expedita velit aliquid omnis alias ut. Debitis repellat commodi sed velit natus explicabo. Enim quisquam ut exercitationem ipsam nulla rerum.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(58, 4, 10, 1, 2, 3, 13, NULL, 'FG56080496', 'Andreane Legros', 'audie04@example.com', '1-818-649-6551', '243 Baylee Squares Apt. 923\nLake Winston, LA 56419-3807', '-58.033163', '5.521867', 'Moore, Fritsch and Fritsch', 'Eum assumenda qui ducimus non. Sed omnis aut et non velit ipsum numquam eius. Autem qui quia ipsam explicabo dolore quia. Sunt dolorem recusandae recusandae non.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(59, 4, 5, 1, 2, 3, 13, NULL, 'BE12770014', 'Kamron Zulauf', 'skyla61@example.com', '(907) 616-1536', '670 Kiehn Groves Suite 645\nCummingsfurt, TX 94879', '-0.102866', '68.164914', 'Hilpert, Dare and Eichmann', 'Totam beatae non praesentium ut. Aut dolores non quo dolorum quibusdam voluptatibus est. Alias possimus distinctio illo sit tempora dolorem quia.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(60, 3, 6, 1, 1, 2, 8, NULL, 'UK93009145', 'Alex Schroeder MD', 'abbott.antonette@example.com', '1-601-901-6107', '45054 Kirstin Prairie\nPort Jakob, MA 31438-8118', '-64.000841', '43.116398', 'DuBuque-O\'Hara', 'Placeat reiciendis doloribus earum accusamus. Doloremque quibusdam enim veritatis cum sunt. Sit omnis ab beatae sequi debitis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(61, 2, 3, 2, 2, 1, 1, 2, 'ZX78502095', 'Zula Nolan', 'foster23@example.org', '616-564-0457', '198 Cayla Crescent Apt. 277\nLelandport, KS 08226-3395', '-41.686982', '-93.104762', 'Stoltenberg, Dach and Boyer', 'Dolores a in quia blanditiis. Qui excepturi minus maiores. Mollitia dolorem aliquam neque rerum velit eum necessitatibus at. Exercitationem consequuntur veniam sit delectus consequatur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(62, 1, 2, 2, 1, 1, 7, NULL, 'FZ30668597', 'Miss Jermaine Purdy Jr.', 'reichert.santiago@example.net', '651.576.5836', '425 Farrell Hollow\nOkeyside, IL 95959-7035', '-63.058692', '152.160836', 'Dare Ltd', 'Soluta sit quia aut assumenda necessitatibus occaecati. Magnam voluptatem est eligendi.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(63, 2, 5, 1, 2, 2, 11, NULL, 'BA69606435', 'Mr. Green Emard', 'noemi69@example.org', '720.398.7390', '71553 Satterfield Crossing\nCoralieside, AZ 58424-5988', '9.531827', '-160.746825', 'Friesen Group', 'Aut dolores voluptas porro voluptate inventore deserunt soluta. Qui sed aliquid voluptas. Et assumenda eligendi ducimus aliquam id. Et sit nesciunt voluptates qui sit qui exercitationem.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(64, 5, 6, 3, 1, 1, 7, NULL, 'DW66951643', 'Rafael Okuneva', 'ywolff@example.net', '360.692.6473', '7213 Gerhold Brook Suite 139\nPort Alejandrinville, NJ 86221-4369', '79.356312', '-55.473385', 'Wolf Group', 'Veniam iste et velit fugit. Magnam mollitia inventore molestiae ratione quibusdam tempore et. Et velit ipsa accusamus sint voluptates.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(65, 5, 7, 3, 1, 3, 13, NULL, 'IZ26975567', 'Bernardo Jenkins', 'spinka.nicolette@example.com', '(743) 708-8068', '5805 Vandervort Parkway Suite 120\nKreigershire, IL 34372', '86.370785', '177.39999', 'Hickle-Champlin', 'Impedit neque quia et quibusdam. Ut magni quaerat in. Perspiciatis sint sit occaecati temporibus doloribus ut.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(66, 2, 1, 1, 1, 2, 12, NULL, 'TZ28666845', 'Miss America Heaney Sr.', 'matilda35@example.org', '+1.469.816.9552', '48199 Georgette Extensions\nSouth Johannmouth, RI 21076', '35.869336', '37.769747', 'Littel-Sporer', 'Qui earum quisquam ut. Molestiae reiciendis corrupti eum ad. Animi architecto quae recusandae sed et.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(67, 2, 8, 1, 1, 2, 10, NULL, 'YY39730306', 'Mr. Max Keeling III', 'spencer.franz@example.org', '+14808473348', '32095 Jayme Dam Apt. 917\nHellerside, WY 91279', '33.788386', '-25.155498', 'Nitzsche Inc', 'Sequi eveniet iusto commodi ex. Totam in qui qui. Voluptatem iusto incidunt tempora alias earum. Quaerat explicabo voluptatibus non repellat ipsa iste aut ex.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(68, 2, 7, 3, 1, 1, 7, NULL, 'BC41471350', 'Etha Dickens', 'andreanne.marquardt@example.com', '(458) 389-9267', '3583 Stokes Corner Apt. 091\nNew Prince, PA 31652', '-2.909848', '70.344543', 'Stanton-Cummerata', 'Provident asperiores qui voluptas dolor incidunt. Vero in repellat ducimus. Perferendis dolore debitis voluptatem modi.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(69, 1, 3, 1, 1, 2, 10, NULL, 'TA00990360', 'Oda Durgan', 'hreichel@example.org', '1-681-804-7668', '61946 Dario Causeway Apt. 752\nEast Golda, MS 19350-3428', '-28.105539', '-153.809087', 'Anderson Ltd', 'Esse asperiores culpa culpa consequatur fugiat vero quia. Consequatur reprehenderit dicta deserunt ipsum odit dolore. Sapiente soluta vitae ea est. Recusandae voluptatem ab dolores vel voluptas.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(70, 3, 5, 2, 2, 3, 13, NULL, 'LC99299945', 'Prof. Myron Kessler', 'jones.irma@example.net', '1-256-947-2926', '74255 Stanton Garden\nSouth Reynold, WV 05471-4136', '0.188121', '-109.722766', 'Wehner, Medhurst and Mohr', 'Esse eos modi nisi at blanditiis perferendis. Ratione eligendi porro animi ipsa neque assumenda omnis. Et rerum neque minima eius.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(71, 5, 7, 2, 1, 3, 14, 12, 'SD67155490', 'Gino Rutherford', 'euna01@example.net', '+15857680553', '6851 Tod Brook Apt. 949\nWiegandshire, MA 73073-5047', '-35.542136', '111.113817', 'Keeling-Streich', 'Architecto ex magni eos in possimus. Magni omnis distinctio optio. Ipsam magnam id voluptas beatae iusto amet dolorem autem. Veniam exercitationem voluptas aliquid nihil.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(72, 2, 10, 1, 2, 1, 3, 5, 'WT70735909', 'Dr. Arno Shanahan', 'nichole16@example.com', '+12084350507', '9117 Lenora Vista Apt. 957\nLake Lerabury, OR 73470', '79.669165', '155.33483', 'Hettinger, Mante and O\'Connell', 'Molestiae cupiditate tempore quibusdam consequatur eos. Quae asperiores doloremque qui. Error corporis vel omnis odio sit. Molestias et ex corrupti qui occaecati. Sequi sequi repellat est eum vel.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(73, 5, 10, 2, 1, 3, 14, 9, 'BH13906196', 'Aylin Lubowitz', 'titus.davis@example.org', '563-573-1005', '929 Anderson Corner\nHoegerview, CT 23681', '-25.702327', '-30.190974', 'Tillman, Goldner and Zboncak', 'Repudiandae facere et laboriosam amet. Laboriosam qui accusantium magnam culpa minus. Dolor eos quam est.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(74, 3, 2, 2, 1, 2, 11, NULL, 'ZE77571849', 'Dr. Gerald Satterfield III', 'rey.huels@example.com', '+1-917-717-9881', '99298 Torphy Crossing Apt. 724\nTalonstad, ME 81516-2248', '-4.081633', '145.226307', 'Koelpin Ltd', 'Ea rerum rem quis. Sed dicta ut dolores sunt sunt esse atque. Unde libero et magnam laborum distinctio cumque. Est qui vel commodi consequuntur rerum.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(75, 3, 5, 1, 2, 2, 11, NULL, 'ZN86694389', 'Dr. Ellen McCullough DDS', 'noble.spinka@example.org', '1-872-846-1955', '79754 Douglas Courts\nWest Santina, NM 21451-8120', '-11.388648', '-136.481551', 'Rice, Hand and Boyle', 'Accusantium quos aut hic est non. Sint autem quam illum consectetur et dolores esse. Eos laborum alias voluptas natus. Aut accusantium quod qui sit cumque.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(76, 2, 6, 2, 2, 1, 2, 4, 'QP72328714', 'Percival Lebsack', 'jamir44@example.net', '747-836-6157', '15273 Kamille Cape Suite 854\nPort Casimermouth, MI 78622-7792', '-70.558984', '138.232989', 'Ward Inc', 'Molestiae saepe maxime consectetur placeat provident et nihil. Id et blanditiis tempore quidem possimus. Ut numquam deleniti commodi est. Omnis in quisquam sit nostrum. Qui id ut et doloremque.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(77, 2, 5, 3, 2, 2, 11, NULL, 'XI34280557', 'Meagan Bayer', 'wschiller@example.net', '772-913-3785', '387 Alfreda Views\nNew Glennafort, HI 36082-1168', '54.989348', '-17.581557', 'Bednar Ltd', 'Et commodi esse consequuntur libero. Asperiores sequi voluptatem ut quia doloremque unde dolor. Aut et unde adipisci voluptatem. Laudantium quasi est nobis animi recusandae non et.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(78, 5, 4, 2, 2, 3, 13, NULL, 'EU12872999', 'Lyla Bashirian', 'wiza.corine@example.org', '225.297.6913', '85542 Goodwin Wall\nEast Denis, OR 34449-5532', '73.180679', '148.65448', 'Lemke-Stokes', 'Qui in culpa harum voluptate itaque repellendus. Hic architecto repudiandae consequatur nostrum. Saepe possimus nostrum ut quia.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(79, 2, 9, 1, 2, 2, 9, NULL, 'AS94828150', 'Mrs. Melba Goldner', 'lura47@example.com', '(769) 617-4240', '71802 Alexane Fort\nEast Danikaview, OR 34118', '-81.460049', '-80.600255', 'Kling, Tillman and Bashirian', 'Alias alias aut et deleniti ducimus ad. Eum illo debitis quia ut quis reiciendis iure. Officiis sapiente quibusdam eos ipsum. Suscipit velit at expedita.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(80, 2, 7, 2, 2, 1, 1, 1, 'OH91878964', 'Kariane Veum I', 'llittle@example.org', '+1-360-230-0853', '70151 Bradtke Knolls\nVivianburgh, NC 25945', '8.391898', '154.604565', 'Nikolaus, Harris and Sawayn', 'Doloribus minus voluptas qui omnis sunt dolores. Aut vero ex impedit eos voluptatem. Non vel voluptatem quia eum consequatur harum quibusdam consequatur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(81, 4, 4, 3, 2, 3, 14, 9, 'SY86585898', 'Freida Stiedemann', 'odell22@example.net', '+1-251-986-4438', '872 Nash Crossroad\nJohnnieberg, DC 19420', '-4.511444', '-89.722045', 'McCullough, Rippin and Armstrong', 'Perferendis molestiae et aut dolor iure fugit optio iusto. Rerum qui autem ipsam quos adipisci est temporibus quos. Id dolor sequi velit hic nesciunt est voluptas quam.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(82, 4, 9, 2, 2, 2, 11, NULL, 'XW41479853', 'Henriette Dare II', 'joy.herzog@example.org', '+1-405-994-1466', '766 Cassandra Ranch\nBrockhaven, GA 92039', '-83.841354', '37.087406', 'Nienow PLC', 'Optio ratione sint non aut voluptas sint laboriosam. Voluptatibus placeat provident veritatis dignissimos. Quo ipsum ut commodi quas et fuga labore.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(83, 1, 9, 3, 2, 2, 10, NULL, 'DF84573864', 'Augustus Doyle Sr.', 'jerde.denis@example.net', '+1.929.653.3468', '2060 Wilderman Square\nSouth Rodger, VT 06632', '43.945459', '83.677329', 'Greenholt, Corwin and Jast', 'Dolorem quod facere ullam repellat dolorum. Libero facere accusantium ut. Quaerat debitis quisquam consequatur.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(84, 4, 1, 1, 1, 1, 1, 1, 'GH12453195', 'Chelsie Bins', 'cboyer@example.net', '585.204.2467', '899 Liliane Spring Suite 748\nNorth Aliciastad, NV 03383-9836', '-74.304238', '-163.148927', 'Buckridge LLC', 'Blanditiis expedita eaque dolor voluptas accusantium deleniti magnam. Voluptatibus aperiam non officiis odio. Aut laboriosam culpa sunt mollitia. In qui et optio similique.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(85, 1, 6, 1, 2, 1, 4, NULL, 'EA27278560', 'Prof. Laron Rodriguez', 'boyle.macie@example.org', '+1 (210) 438-9585', '17604 Kozey Walk Apt. 736\nBreitenbergfurt, MT 71053-6775', '-56.482753', '-74.208356', 'Ryan-Wehner', 'Voluptate nam qui provident possimus eos eos eaque. Ut vel corrupti ipsum possimus aut voluptatem. Iusto corporis quia deleniti animi eos doloremque nobis. Provident qui velit sit iste rerum non.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(86, 4, 7, 1, 1, 1, 6, NULL, 'FC52751001', 'Nelle Ernser', 'gleason.landen@example.com', '(757) 652-1093', '7455 Kareem Locks Apt. 196\nStokesfort, KS 23226-2695', '79.663519', '165.414044', 'Goldner, Terry and Johnson', 'Ipsa ut deserunt id possimus et provident. Dicta sunt autem necessitatibus quae nobis architecto.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(87, 1, 4, 2, 1, 3, 14, 7, 'JB40133356', 'Katarina Kertzmann DDS', 'kiarra.rice@example.net', '904.891.0318', '95868 Chloe Coves\nNorth Lesleyshire, AR 85736-6937', '3.908577', '131.154387', 'Schamberger-Zulauf', 'Et rem asperiores eos blanditiis deserunt ullam. Veritatis dolorem dolorum eos voluptatem quo. Praesentium perferendis aut expedita ut. Magni quasi dolores maiores nesciunt eum repudiandae et.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(88, 3, 5, 2, 2, 3, 13, NULL, 'FA73152244', 'Emil Pfeffer', 'gorczany.shanelle@example.com', '+17327294778', '4728 Javier Union\nKarliside, AR 03989-5212', '-51.767667', '96.832878', 'Towne, Stroman and Kozey', 'Qui aliquam dolore magnam voluptatum. Atque aperiam dolor qui enim id deserunt. Id eius recusandae atque excepturi est reprehenderit. Ut omnis molestiae dolores ex.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(89, 5, 4, 1, 1, 2, 11, NULL, 'ZR46512435', 'Reymundo Muller', 'cormier.shakira@example.org', '1-320-948-6896', '733 Kemmer Drives Suite 084\nNew Norbertville, PA 84791-6831', '33.824682', '-159.546231', 'Cremin-Hermann', 'Fugit voluptates vel sint qui ea omnis aut. Quia neque incidunt nisi assumenda et. Deserunt ipsam nostrum voluptates consequatur excepturi id fugiat.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(90, 2, 1, 3, 1, 1, 5, NULL, 'JH76002808', 'Einar Hahn', 'zulauf.remington@example.net', '(628) 648-5551', '2524 Waldo Freeway\nAgustinborough, OH 89506-4460', '-69.421661', '124.898874', 'Hamill-Funk', 'Est sapiente voluptates deleniti cumque omnis. In optio deleniti doloribus perspiciatis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(91, 3, 10, 1, 1, 2, 12, NULL, 'NK14272777', 'Anabelle Weissnat', 'wolf.david@example.net', '+1 (641) 863-3404', '2477 Howell Pines Suite 222\nSchneiderton, OK 11741', '24.283865', '-141.418776', 'Toy, Brakus and Parker', 'Voluptas dolor quibusdam accusamus magni ducimus. Consequatur quo est cumque voluptates non.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(92, 3, 8, 2, 1, 3, 14, 9, 'VJ44721774', 'Mr. Ludwig Flatley PhD', 'jameson30@example.com', '+1 (318) 631-3968', '724 Trever Creek\nConstantinchester, KY 75021', '42.273166', '50.125879', 'Koch Ltd', 'Maiores assumenda in et accusantium et. Ut alias et animi libero dolorem architecto nobis. Sequi modi voluptatum quia amet provident assumenda quae.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(93, 1, 7, 1, 1, 1, 3, 6, 'VU71312209', 'Marc Balistreri', 'wpaucek@example.net', '502.609.1413', '53808 Brando Ridge Suite 816\nWest Amparo, NY 16773', '-57.198974', '21.699913', 'Gorczany Ltd', 'Occaecati et ipsam architecto sint sit vero nihil. Accusamus impedit odit quasi delectus molestiae neque. Error modi similique quis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(94, 2, 10, 2, 2, 3, 14, 7, 'GZ97778746', 'Prof. Glenna Moen MD', 'hammes.birdie@example.com', '714.646.6154', '532 Kertzmann Isle\nSouth Haylietown, CT 62625', '84.169847', '33.130068', 'Carter and Sons', 'Ut rerum aut culpa et nemo. Omnis ut numquam nihil nihil facilis ut aut dolor. Hic reprehenderit deleniti cum sunt delectus.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(95, 4, 5, 2, 1, 1, 3, 5, 'KI37982197', 'Percival Kutch', 'sipes.jade@example.net', '904-348-1430', '8951 Koss Road\nCrystelville, WY 13567-2646', '88.360229', '41.643633', 'Dach, Johns and Morar', 'Saepe velit sit qui quos laudantium aut voluptas. Molestiae temporibus at at reprehenderit natus et minus. Et sapiente occaecati sunt et. Minima odio voluptatem numquam voluptas et nemo.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(96, 4, 4, 3, 1, 1, 2, 4, 'KT26457093', 'Ms. Leora Schaefer', 'bernhard.marlee@example.com', '1-406-271-7971', '7169 Shanie Turnpike\nVonshire, MN 47806-4787', '-44.886139', '59.300991', 'Macejkovic, Kautzer and Schroeder', 'Quaerat maiores ea et consequatur mollitia accusamus. Pariatur molestiae officiis at est ut. Consequatur et sapiente non quo.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(97, 3, 1, 3, 2, 2, 11, NULL, 'NC13572346', 'Torey Reilly', 'collins.maudie@example.org', '+1-615-861-6529', '184 Wiegand Throughway Apt. 973\nWest Connie, UT 33818', '-35.204445', '-147.857883', 'Witting Inc', 'Doloribus voluptatibus omnis itaque vitae non. Autem laudantium rerum ut. Ut temporibus excepturi beatae. Dolorum ullam similique possimus animi velit.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(98, 3, 6, 2, 1, 3, 13, NULL, 'NZ72754551', 'Abigail Blanda', 'jazlyn03@example.net', '626.514.2703', '7903 Taya Viaduct Suite 867\nConsidinefurt, SC 87394', '-86.917376', '113.946225', 'Jast LLC', 'Recusandae repellendus qui molestiae vero ut modi eveniet. Impedit et vero temporibus sed ratione praesentium. Maxime quod ad ex consequuntur consequatur. Vel quaerat sit et atque qui quidem.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(99, 2, 1, 3, 1, 1, 4, NULL, 'MD50406804', 'Frida Monahan', 'benny.jerde@example.net', '1-539-549-5227', '1005 Chelsea Burgs Suite 617\nSouth Greenmouth, OH 50769', '-11.189355', '87.525186', 'Gislason Inc', 'Rem quia provident quo odit soluta unde. Assumenda corporis dolores dolorem esse enim. Et libero adipisci fugit non sint. Reprehenderit sequi molestiae quae enim alias tempore quis.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(100, 3, 3, 2, 1, 2, 12, NULL, 'ZU11413039', 'Darby Hill PhD', 'amy.wunsch@example.com', '1-754-407-2891', '369 Feeney Highway Apt. 283\nNicolashaven, IN 18997', '0.077049', '-64.685608', 'Mayert Inc', 'Pariatur quia labore saepe eaque. Temporibus quidem fuga nam. Veritatis blanditiis enim aut vero aut. Nobis quo dolor quia quis. Sit magnam porro ipsa sint corporis ut.', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(101, 1, 3, 1, 1, 1, NULL, NULL, 'MA1703436002', 'Mang Tri', 'admin@admin.com', '081330092930', 'Address', '-6.22137792368825', '106.80656901534206', 'Grune', NULL, '2023-12-24 16:40:02', '2023-12-24 16:40:02'),
(102, 2, 2, 2, 1, 2, NULL, NULL, 'DR1703494623', 'Dr. Ona Jaskolski', 'admin1@admin.com', '081330092931', 'asdas', '-8.793974', '115.55165614932775', 'Grune', NULL, '2023-12-25 08:57:03', '2023-12-25 08:57:03'),
(103, 2, 1, 2, 1, 3, 13, NULL, 'MA1703495028', 'Mang Tri', 'test@example.com', '12312312312', 'asdasd', '-8.497017', '-54.968626', 'Grune', NULL, '2023-12-25 09:03:48', '2023-12-25 09:03:48'),
(104, 1, 1, 2, 2, 1, 7, NULL, 'FE1703644882', 'Ferry Irwandi', 'izanami@gmail.com', '089190929019', 'Jalan Nangka', '-8.793974', '115.556306', 'PT Youtube', NULL, '2023-12-27 02:41:22', '2023-12-27 02:42:05'),
(105, 4, 2, 2, 2, 2, 12, NULL, 'DE1703645450', 'Dery', 'some@example.com', '081330921211', 'Kuta', '77.3451', '-54.968626', 'PT Youtube', NULL, '2023-12-27 02:50:50', '2023-12-27 02:54:14');

INSERT INTO `media` (`id`, `name`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'WA Center', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Call', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'Website', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(4, 'Email', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(5, 'Whatsapp Blast', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(6, 'Referal', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(7, 'OOH', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(8, 'Branch Badung', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(9, 'Branch Denpasar', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(10, 'Branch Malang', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(11, 'Branch Balikpapan', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(12, 'Branch Samarinda', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(13, 'Open Booth', 3, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(14, 'Digital Platform', 3, '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_12_20_140719_create_probabilities_table', 1),
(6, '2023_12_20_140726_create_types_table', 1),
(7, '2023_12_20_140727_create_channels_table', 1),
(8, '2023_12_20_140740_create_media_table', 1),
(9, '2023_12_20_140745_create_sources_table', 1),
(10, '2023_12_20_140808_create_statuses_table', 1),
(11, '2023_12_20_140825_create_branches_table', 1),
(12, '2023_12_20_140856_create_leads_table', 1);

INSERT INTO `probabilities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Converted', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'Cancel', '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `sources` (`id`, `name`, `media_id`, `created_at`, `updated_at`) VALUES
(1, 'Sales', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Customer Support', 1, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'Sales', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(4, 'Customer Support', 2, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(5, 'Tawk to', 3, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(6, 'Lead From', 3, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(7, 'Google Business', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(8, 'Facebook', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(9, 'Instagram', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(10, 'Google Ads', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(11, 'Tiktok', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(12, 'Meta Ads', 14, '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Consideration', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Scheduled', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(3, 'Junk/Trash', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(4, 'FCB - Future Call Back', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(5, 'Qualified', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(6, 'NI - Not Interested', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(7, 'Out Coverage', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(8, 'Not Response', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(9, 'Pending', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(10, 'Cancel', '2023-12-22 03:57:44', '2023-12-22 03:57:44');

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Inbound', '2023-12-22 03:57:44', '2023-12-22 03:57:44'),
(2, 'Outbound', '2023-12-22 03:57:44', '2023-12-22 03:57:44');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;