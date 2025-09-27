/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admins
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admission_info
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admission_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `content` longtext,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admissions
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `admissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` text NOT NULL,
  `admission_fee` decimal(10, 2) NOT NULL,
  `term1_fee` decimal(10, 2) NOT NULL,
  `term2_fee` decimal(10, 2) NOT NULL,
  `term3_fee` decimal(10, 2) NOT NULL,
  `term4_fee` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 50 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: alumni
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `alumni` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `batch_from` year NOT NULL,
  `batch_to` year NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `current_status` enum('Study', 'Job', 'Other') DEFAULT 'Other',
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `address` text,
  `feelings` text,
  `suggestions` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: beyond_classrooms
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `beyond_classrooms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: contact_messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: core_values
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `core_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: enrollment_images
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `enrollment_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) NOT NULL,
  `alt_text` varchar(100) DEFAULT 'Student Enrollment',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: events
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext,
  `location` varchar(255) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: facilities
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `facilities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  `image5` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fun_classes
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fun_classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` longtext,
  `description` longtext,
  `youtube_link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: fun_facts
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `fun_facts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading1` varchar(255) DEFAULT NULL,
  `number1` int DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `heading2` varchar(255) DEFAULT NULL,
  `number2` int DEFAULT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `heading3` varchar(255) DEFAULT NULL,
  `number3` int DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  `heading4` varchar(255) DEFAULT NULL,
  `number4` int DEFAULT NULL,
  `image4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: gallery
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `cover_image` varchar(500) NOT NULL,
  `images` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: hero_section
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `hero_section` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_heading` varchar(255) NOT NULL,
  `main_description` longtext NOT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `youtube_link` varchar(255) DEFAULT NULL,
  `total_students` int DEFAULT '0',
  `background_image` varchar(255) DEFAULT NULL,
  `hero_image` varchar(255) DEFAULT NULL,
  `funfact_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: messages
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `message_to_students` text,
  `message_to_staff` text,
  `social_facebook` varchar(255) DEFAULT NULL,
  `social_twitter` varchar(255) DEFAULT NULL,
  `social_skype` varchar(255) DEFAULT NULL,
  `social_linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: principal_message
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `principal_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `role` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `message_to_students` text,
  `message_to_staff` text,
  `social_facebook` varchar(255) DEFAULT NULL,
  `social_twitter` varchar(255) DEFAULT NULL,
  `social_skype` varchar(255) DEFAULT NULL,
  `social_linkedin` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: school_info
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `school_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `field_value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `seo_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `og_title` varchar(255) DEFAULT NULL,
  `og_description` text,
  `og_image` varchar(255) DEFAULT NULL,
  `twitter_title` varchar(255) DEFAULT NULL,
  `twitter_description` text,
  `twitter_image` varchar(255) DEFAULT NULL,
  `canonical_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: site_content
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `site_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_heading` varchar(255) DEFAULT NULL,
  `main_description` text,
  `home1_image` varchar(255) DEFAULT NULL,
  `home2_image` varchar(255) DEFAULT NULL,
  `home3_image` varchar(255) DEFAULT NULL,
  `about_home_heading` varchar(255) DEFAULT NULL,
  `about_home_description` text,
  `about1_image` varchar(255) DEFAULT NULL,
  `about2_image` varchar(255) DEFAULT NULL,
  `about3_image` varchar(255) DEFAULT NULL,
  `mission_heading` varchar(255) DEFAULT NULL,
  `mission_description` text,
  `mission_image` varchar(255) DEFAULT NULL,
  `vision_heading` varchar(255) DEFAULT NULL,
  `vision_description` text,
  `vision_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `homeabout_heading` varchar(255) DEFAULT NULL,
  `homeabout_description` longtext,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: site_settings
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `site_title` varchar(255) DEFAULT NULL,
  `site_description` text,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: staff
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_name` varchar(255) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `professional_qualification` varchar(255) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `trained_status` enum('TRAINED', 'UNTRAINED') NOT NULL,
  `first_appointment` date DEFAULT NULL,
  `class_assigned` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 38 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: student_enrollment
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `student_enrollment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `section` varchar(10) DEFAULT '-',
  `enrolment_count` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `why_choose_us` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_heading` varchar(255) DEFAULT NULL,
  `main_description` text,
  `celebration_link` varchar(500) DEFAULT NULL,
  `values_heading` varchar(255) DEFAULT NULL,
  `values_description` text,
  `mission_heading` varchar(255) DEFAULT NULL,
  `mission_description` text,
  `vision_heading` varchar(255) DEFAULT NULL,
  `vision_description` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admins
# ------------------------------------------------------------

INSERT INTO
  `admins` (`id`, `username`, `password`, `created_at`)
VALUES
  (
    1,
    'admin',
    '$2b$10$4zKZ5ESqp8S0LPjL1mtGYOyIxK3IY7xAD3DS85W0SuK/LuD2hAmA2',
    '2025-09-15 11:28:02'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admission_info
# ------------------------------------------------------------

INSERT INTO
  `admission_info` (`id`, `image`, `content`, `updated_at`)
VALUES
  (
    3,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758949991/harvesttenderroots/admission/flactcoqgxee7mgbjq3i.png',
    '<h4><strong>Admission Procedure – HPS</strong></h4><p>At Harvest, we believe in stress-free and child-centered education. Therefore, the admission procedure is designed to be child-friendly and supportive.</p><ul><li><strong>Admission Test:</strong><br>Students seeking admission need to attend an Admission Test. This test is conducted only to assess their strengths and weaknesses, so that proper support can be provided accordingly.</li><li><strong>Interaction:</strong><br>A simple and accessible interaction with the Correspondent and Principal is arranged, helping children and parents feel comfortable with the school’s environment and norms.</li><li><strong>Applicable Grades:</strong><br>The same procedure is followed for all admissions from Nursery to Grade V.</li><li><strong>Mid-Year Admissions:</strong><br>Though it may involve additional formalities, Harvest accepts admissions in the middle of the academic year, provided the candidate submits the following.</li></ul><blockquote><ol><li>Transfer Certificate (T.C.)</li><li>Conduct Certificate (duly signed)</li></ol></blockquote>',
    '2025-09-27 10:43:11'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admissions
# ------------------------------------------------------------

INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    8,
    'NURSERY / LKG',
    36000.00,
    0.00,
    5800.00,
    5800.00,
    5800.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (9, 'UKG', 36000.00, 8300.00, 5800.00, 5800.00, 5800.00);
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    10,
    'I & II',
    36250.00,
    8550.00,
    6050.00,
    6050.00,
    6050.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    11,
    'III & IV',
    36500.00,
    8800.00,
    6300.00,
    6300.00,
    6300.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (12, 'V', 36765.00, 9065.00, 6565.00, 6565.00, 6565.00);
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (13, 'VI', 37025.00, 9325.00, 6825.00, 6825.00, 6825.00);
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    14,
    'VII',
    37155.00,
    9455.00,
    6955.00,
    6955.00,
    6955.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    15,
    'VIII',
    37300.00,
    9600.00,
    7100.00,
    7100.00,
    7100.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (16, 'IX', 37420.00, 9720.00, 7220.00, 7220.00, 7220.00);
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (17, 'X', 37550.00, 9850.00, 7350.00, 7350.00, 7350.00);
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    18,
    'XI',
    40860.00,
    28160.00,
    10660.00,
    10660.00,
    10660.00
  );
INSERT INTO
  `admissions` (
    `id`,
    `class_name`,
    `admission_fee`,
    `term1_fee`,
    `term2_fee`,
    `term3_fee`,
    `term4_fee`
  )
VALUES
  (
    19,
    'XII',
    40860.00,
    13160.00,
    10660.00,
    10660.00,
    10660.00
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: alumni
# ------------------------------------------------------------

INSERT INTO
  `alumni` (
    `id`,
    `student_name`,
    `date_of_birth`,
    `batch_from`,
    `batch_to`,
    `email`,
    `mobile_no`,
    `current_status`,
    `country`,
    `state`,
    `city`,
    `address`,
    `feelings`,
    `suggestions`,
    `created_at`
  )
VALUES
  (
    2,
    'Priya Singh',
    '1996-09-20',
    '2006',
    '2011',
    'priya.singh@example.com',
    '9123456780',
    'Study',
    'India',
    'Maharashtra',
    'Mumbai',
    '45 Marine Drive, Mumbai',
    'Had a great time with friends and teachers.',
    'Introduce more cultural events.',
    '2025-09-23 17:32:59'
  );
INSERT INTO
  `alumni` (
    `id`,
    `student_name`,
    `date_of_birth`,
    `batch_from`,
    `batch_to`,
    `email`,
    `mobile_no`,
    `current_status`,
    `country`,
    `state`,
    `city`,
    `address`,
    `feelings`,
    `suggestions`,
    `created_at`
  )
VALUES
  (
    4,
    'sai kiran test',
    '2025-09-23',
    '2003',
    '2001',
    'saikirancmoon@gmail.com',
    '08978553778',
    'Study',
    'India',
    'Telangana',
    'hyderabad',
    'colour moon technologies',
    '&lt;script&gt;alert(&#x27;Hacked!&#x27;)&lt;&#x2F;script&gt;',
    'http:&#x2F;&#x2F;localhost:3000&#x2F;alumni',
    '2025-09-23 22:58:47'
  );
INSERT INTO
  `alumni` (
    `id`,
    `student_name`,
    `date_of_birth`,
    `batch_from`,
    `batch_to`,
    `email`,
    `mobile_no`,
    `current_status`,
    `country`,
    `state`,
    `city`,
    `address`,
    `feelings`,
    `suggestions`,
    `created_at`
  )
VALUES
  (
    6,
    'sai kiran test',
    '2025-09-23',
    '1991',
    '1992',
    'saikirancmoon@gmail.com',
    '08978553778',
    'Job',
    'India',
    'Telangana',
    'hyderabad',
    'colour moon technologies',
    '&lt;script&gt;alert(\'Hacked!\')&lt;/script&gt;',
    'hack',
    '2025-09-23 23:14:45'
  );
INSERT INTO
  `alumni` (
    `id`,
    `student_name`,
    `date_of_birth`,
    `batch_from`,
    `batch_to`,
    `email`,
    `mobile_no`,
    `current_status`,
    `country`,
    `state`,
    `city`,
    `address`,
    `feelings`,
    `suggestions`,
    `created_at`
  )
VALUES
  (
    7,
    'sai kiran test',
    '2025-09-23',
    '2007',
    '2007',
    'saikirancmoon@gmail.com',
    '08978553778',
    'Job',
    'India',
    'Telangana',
    'hyderabad',
    'colour moon technologies',
    '&lt;script&gt;alert(&#x27;Hacked!&#x27;)&lt;&#x2F;script&gt;',
    '&lt;form action=&quot;&#x2F;alumini&quot; method=&quot;POST&quot;&gt;',
    '2025-09-23 23:23:55'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: beyond_classrooms
# ------------------------------------------------------------

INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    3,
    'Green Day',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758282578/harvesttenderroots/beyond-classrooms/noum1cot08sbtjdqkevc.jpg',
    '2025-09-19 17:19:38',
    '2025-09-19 17:19:38'
  );
INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    4,
    'Bathukamma-dance',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758282605/harvesttenderroots/beyond-classrooms/zip9iv2n2vt242webjmd.jpg',
    '2025-09-19 17:20:06',
    '2025-09-19 17:20:06'
  );
INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    5,
    'World\'s-differnce-day',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758282669/harvesttenderroots/beyond-classrooms/guyryv9f6ixy3okszd2l.jpg',
    '2025-09-19 17:21:10',
    '2025-09-19 17:21:10'
  );
INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    6,
    'Farewell-Celebrations',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758282694/harvesttenderroots/beyond-classrooms/btgjx8auydytc2if07uj.jpg',
    '2025-09-19 17:21:35',
    '2025-09-19 17:21:35'
  );
INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    8,
    'test',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758609659/harvesttenderroots/beyond-classrooms/ukcwikut1ogcha9xlcy7.jpg',
    '2025-09-23 12:10:59',
    '2025-09-23 12:10:59'
  );
INSERT INTO
  `beyond_classrooms` (`id`, `title`, `image`, `created_at`, `updated_at`)
VALUES
  (
    9,
    'test1',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758610154/harvesttenderroots/beyond-classrooms/sybgnp0umnhijhuuaccd.jpg',
    '2025-09-23 12:19:15',
    '2025-09-23 12:19:15'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: contact_messages
# ------------------------------------------------------------

INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    3,
    'Robert Brown',
    'robert.brown@example.com',
    '9988776655',
    'Event Participation',
    'I want to participate in the upcoming alumni meet.',
    '2025-09-23 17:39:29'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    5,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test',
    'test',
    '2025-09-23 18:17:59'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    6,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test',
    'tes',
    '2025-09-23 18:31:00'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    7,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'test',
    'tes',
    '2025-09-23 18:32:07'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    9,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'pp',
    'pp',
    '2025-09-23 18:37:22'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    10,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'javascript:alert(&#x27;Hacked&#x27;)',
    '&lt;script&gt;alert(&#x27;XSS&#x27;)&lt;&#x2F;script&gt;',
    '2025-09-23 18:37:48'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    11,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'pdajkdba',
    'wertyuiofghjk',
    '2025-09-23 18:53:44'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    12,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '&lt;script&gt;alert(\'XSS\')&lt;/script&gt;',
    'javascript:alert(\'Hacked\')',
    '2025-09-23 18:54:41'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    13,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '8978553778',
    'alert(\'XSS\')',
    'test',
    '2025-09-23 19:00:51'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    14,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'javascript:alert(\'Hacked\')',
    'alert(\'XSS\')',
    '2025-09-23 19:01:57'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    15,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '',
    'test',
    '2025-09-23 21:52:19'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    16,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '',
    'alert(&#x27;XSS&#x27;)',
    '2025-09-23 21:53:02'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    17,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '',
    'ppp',
    '2025-09-23 22:07:24'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    19,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'alert(&#x27;Hacked&#x27;) Click me',
    '',
    '2025-09-23 22:17:40'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    20,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    'Injected Heading',
    '&#x27; OR &#x27;1&#x27;=&#x27;1\r\n',
    '2025-09-23 22:19:17'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    21,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '&#x27; DROP TABLE users; --',
    '&#x27; OR &#x27;1&#x27;=&#x27;1',
    '2025-09-23 22:21:02'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    22,
    'sai kiran',
    'saikirancmoon@gmail.com',
    '08978553778',
    '',
    'tlive',
    '2025-09-23 23:46:23'
  );
INSERT INTO
  `contact_messages` (
    `id`,
    `name`,
    `email`,
    `phone`,
    `subject`,
    `message`,
    `created_at`
  )
VALUES
  (
    25,
    'Ramesh',
    'rameshtest@gmail.com',
    '8143470027',
    'test',
    'About Harvest School\r\nShaping Young Minds with Care\r\nWe provide a balanced educational programme within a safe and stimulating environment, so that each child embarks on a physical, intellectual and social journey of curiosity and reasoning. Harvest thus offers a comprehensive and a balanced curriculum which is designed to make learning enjoyable, activity-based and experimental, preparing every student for higher challenges. During these important years, the focus is both on the curriculum as well as the development of intricate skills like critical thinking, solving real life issues while developing independence and wisdom. test\r\n\r\nFlexible Classes\r\nAt Harvest School, we understand that every child learns differently. Our flexible classes are designed to adapt to individual learning styles, ensuring that students grasp concepts at their own pace. With a mix of interactive sessions, activity-based learning, and personalized guidance, we make education both engaging and effective.\r\n\r\nRead More',
    '2025-09-25 11:15:39'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: core_values
# ------------------------------------------------------------

INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    1,
    'Respect for others',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757957230/harvesttenderroots/core-values/j98zkklm9uuf2ofwdwpd.png',
    '2025-09-15 22:57:11',
    '2025-09-15 22:58:22'
  );
INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    3,
    'A Healthy Lifestyle',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757957934/harvesttenderroots/core-values/vaffqdpsj8jide2adkkm.png',
    '2025-09-15 23:08:54',
    '2025-09-15 23:08:54'
  );
INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    4,
    'Responsibility',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757957959/harvesttenderroots/core-values/t860olqbodakg3e6kbqv.png',
    '2025-09-15 23:09:19',
    '2025-09-15 23:09:19'
  );
INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    5,
    ' Courage',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757957999/harvesttenderroots/core-values/whl7pyhiqzrlyivqswxi.png',
    '2025-09-15 23:10:00',
    '2025-09-15 23:10:00'
  );
INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    6,
    'Self Discipline',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757958023/harvesttenderroots/core-values/hdwrbcgiyg3iv5hbpml5.png',
    '2025-09-15 23:10:23',
    '2025-09-15 23:10:23'
  );
INSERT INTO
  `core_values` (`id`, `heading`, `image`, `created_at`, `updated_at`)
VALUES
  (
    7,
    'Honesty',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757958037/harvesttenderroots/core-values/mrv90wnhofjulirriaqk.png',
    '2025-09-15 23:10:37',
    '2025-09-15 23:10:37'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: enrollment_images
# ------------------------------------------------------------

INSERT INTO
  `enrollment_images` (`id`, `image_url`, `alt_text`)
VALUES
  (
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758692722/harvesttenderroots/enrollment/pdn6mfgyu9bvyztj6kvx.png',
    'Student Enrollment'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: events
# ------------------------------------------------------------

INSERT INTO
  `events` (
    `id`,
    `event_name`,
    `title`,
    `description`,
    `location`,
    `start_time`,
    `end_time`,
    `event_date`,
    `created_at`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`
  )
VALUES
  (
    17,
    '<h3>Annual Day</h3>',
    '<p>Celebrating Growth and Harmony<br>&nbsp;</p>',
    '<p>At Harvest Tender Roots School, Annual Day is a vibrant celebration of learning, creativity, and togetherness. It provides students a platform to showcase their talents and achievements, while strengthening the bond between school, parents, and the community.</p><p><strong>Celebrating Talent:</strong><br>Students participate in cultural performances, plays, music, and dance, highlighting their creativity and confidence.</p><p><strong>Recognizing Achievements:</strong><br>Annual Day is also a moment of pride, where academic and extracurricular accomplishments are acknowledged and celebrated.</p><p><strong>Unity &amp; Joy:</strong><br>The event brings everyone together, fostering school spirit, teamwork, and cherished memories.</p>',
    '<p>hyderabad</p>',
    '21:58:00',
    '23:58:00',
    '2025-09-19',
    '2025-09-21 21:58:58',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758472132/harvesttenderroots/facilities/yd9orahfw6x5ozq8lkwp.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758472135/harvesttenderroots/facilities/xdkbplh9oj6grzbqy5g8.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758472138/harvesttenderroots/facilities/pyr30yuw23nuczgqj2f3.jpg',
    NULL,
    NULL
  );
INSERT INTO
  `events` (
    `id`,
    `event_name`,
    `title`,
    `description`,
    `location`,
    `start_time`,
    `end_time`,
    `event_date`,
    `created_at`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`
  )
VALUES
  (
    18,
    '<h3>Republic Day</h3>',
    '<p>Republic Day at Harvest Tender Roots School</p>',
    '<p>At Harvest Tender Roots School, Republic Day is celebrated with pride and patriotism, reminding students of the values of freedom, democracy, and unity that define our nation.</p><p><strong>Patriotic Spirit:</strong><br>The day begins with the hoisting of the national flag, followed by the singing of the national anthem, filling the campus with a sense of pride and respect.</p><p><strong>Student Expressions:</strong><br>Through speeches, patriotic songs, dances, and skits, children showcase their love for the country and honor India’s rich cultural heritage.</p><p><strong>Inspiring Values:</strong><br>Republic Day inspires students to embrace responsibility, unity, and discipline as they grow into responsible citizens of tomorrow.</p>',
    '<p>hyderabad</p>',
    '07:00:00',
    '10:00:00',
    '2025-01-19',
    '2025-09-21 22:01:10',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758472267/harvesttenderroots/facilities/kg1qjvefxz6gyt3frzio.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758472269/harvesttenderroots/facilities/toarensmnbwegwboulh8.jpg',
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  `events` (
    `id`,
    `event_name`,
    `title`,
    `description`,
    `location`,
    `start_time`,
    `end_time`,
    `event_date`,
    `created_at`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`
  )
VALUES
  (
    19,
    '<h3>Yoga Day</h3>',
    '<p>Embracing Wellness Together</p>',
    '<p>On Yoga Day, we come together as a community to celebrate the power of mindfulness and movement. Students engage in yoga to enhance physical well-being, reduce stress, and foster a sense of inner peace.</p><ul><li><strong>Global Wellness:</strong> Students participate in a school-wide yoga session, promoting health and harmony.</li><li><strong>Focus and Relaxation:</strong> Breathing exercises and yoga poses help improve concentration and calmness.</li><li><strong>A Shared Practice:</strong> An opportunity for all to connect through the peaceful practice of yoga.</li></ul>',
    '<p>hyderabad</p>',
    '23:10:00',
    '23:10:00',
    '2025-09-17',
    '2025-09-21 23:10:38',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758476436/harvesttenderroots/facilities/dg9damffjwqr3kdzazgp.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758476437/harvesttenderroots/facilities/ebqhsat967xddqobmqkt.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758476438/harvesttenderroots/facilities/egmue3bsdjhhrwtzrdma.jpg',
    NULL,
    NULL
  );
INSERT INTO
  `events` (
    `id`,
    `event_name`,
    `title`,
    `description`,
    `location`,
    `start_time`,
    `end_time`,
    `event_date`,
    `created_at`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`
  )
VALUES
  (
    20,
    '<h3>Independence Day&nbsp;</h3>',
    '<p>At Harvest Tender Roots School, Independence Day is celebrated with pride, gratitude, and joy.<br>&nbsp;</p>',
    '<p>At Harvest Tender Roots School, Independence Day is celebrated with pride, gratitude, and joy. It is a day to honor the sacrifices of our freedom fighters and to cherish the spirit of unity and progress.</p><p><strong>Flag Hoisting &amp; Anthem:</strong><br>The celebrations begin with the hoisting of the national flag and the singing of the national anthem, filling the atmosphere with patriotic fervor.</p><p><strong>Cultural Presentations:</strong><br>Students present patriotic songs, dances, and skits that reflect India’s journey of freedom and its vibrant culture.</p><p><strong>Inspiring Young Minds:</strong><br>Independence Day instills in students the values of courage, responsibility, and love for the nation, inspiring them to contribute to a brighter future.</p>',
    '<p>hydarabad</p>',
    '07:00:00',
    '00:00:00',
    '2025-08-12',
    '2025-09-22 15:36:13',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758535567/harvesttenderroots/facilities/m3dtwoksgjgxal7cqfda.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758535570/harvesttenderroots/facilities/yyvxttmhgpopgky9uqf9.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758535572/harvesttenderroots/facilities/yn38ms0cvtewee0bgcsw.jpg',
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: facilities
# ------------------------------------------------------------

INSERT INTO
  `facilities` (
    `id`,
    `facility_name`,
    `description`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'yoga',
    '<h2><strong>Yoga at Harvest Tender Roots School</strong></h2><p>At Harvest Tender Roots School, we believe that education is not only for the mind, but also for the body and soul. To nurture healthy habits and a balanced lifestyle, Yoga is a part of our regular school activities.</p><ul><li><strong>Mind &amp; Body Balance:</strong>Children practice simple yoga postures that help improve concentration, memory, and confidence.</li><li><strong>Stress-Free Learning:</strong>Yoga helps students stay calm, energetic, and positive throughout the day.</li><li><strong>Healthy Lifestyle:</strong>Regular practice of breathing exercises and meditation encourages discipline, fitness, and inner peace.</li></ul>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758544671/harvesttenderroots/Facilities/s3gufzlhmiu6ilgpv52y.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758544671/harvesttenderroots/Facilities/xarm8dgrnaqcjjtgc89l.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758544672/harvesttenderroots/Facilities/obhebsmd30t6v9nlifm0.jpg',
    NULL,
    NULL,
    '2025-09-22 18:07:53',
    '2025-09-22 18:08:06'
  );
INSERT INTO
  `facilities` (
    `id`,
    `facility_name`,
    `description`,
    `image1`,
    `image2`,
    `image3`,
    `image4`,
    `image5`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'Dance',
    '<h2><strong>Dance at Harvest Tender Roots School</strong><br>&nbsp;</h2><p>At Harvest Tender Roots School, we believe that every child is an artist. Dance is an integral part of our co-curricular activities, giving students a platform to express themselves with joy, rhythm, and creativity.</p><ul><li><strong>Cultural Expression</strong><br>Children learn traditional and contemporary dance forms that connect them with our rich cultural heritage..</li><li><strong>Team Spirit</strong><br>Group performances teach cooperation, discipline, and the joy of working together.</li><li><strong>Creativity &amp; Joy</strong><br>Through dance, children explore movement, music, and imagination in a stress-free environment.</li></ul>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758545424/harvesttenderroots/Facilities/lyjngrwwhqvxn8fq0nxa.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758545426/harvesttenderroots/Facilities/cvuvndqh3krlln1ldtz9.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758545431/harvesttenderroots/Facilities/pmxhc0mxgsikkzmgapav.png',
    NULL,
    NULL,
    '2025-09-22 18:20:33',
    '2025-09-22 18:51:46'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fun_classes
# ------------------------------------------------------------

INSERT INTO
  `fun_classes` (
    `id`,
    `heading`,
    `description`,
    `youtube_link`,
    `image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    '<h2>Learning Made Fun &nbsp;test</h2>',
    '<p>Experience the vibrant journey of learning and growth at Harvest School through our videos. From classrooms to cultural events, every moment reflects joy, curiosity, and creativity. Our students engage in academics, sports, and activities that build confidence and skills. Each video captures the essence of our child-friendly and value-based education.</p>',
    'https://www.youtube.com/watch?v=PO_fBTkoznc',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758010786/harvesttenderroots/fun-classes/tfqfhlheuhehjnwwerlw.jpg',
    '2025-09-16 11:28:19',
    '2025-09-23 12:07:52'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: fun_facts
# ------------------------------------------------------------

INSERT INTO
  `fun_facts` (
    `id`,
    `heading1`,
    `number1`,
    `image1`,
    `heading2`,
    `number2`,
    `image2`,
    `heading3`,
    `number3`,
    `image3`,
    `heading4`,
    `number4`,
    `image4`
  )
VALUES
  (
    1,
    'Child-Friendly Atmosphere',
    100,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758283730/fun-facts/huv2kyieogg3mr1gfbpk.png',
    'Child-Friendly Atmosphere',
    500,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758283732/fun-facts/ewhqj1g6f8pp33scoxu2.png',
    '30+ Sports & Arts Programs',
    30,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758283732/fun-facts/glv3pbwrevkocsfbnc8r.png',
    'Annual Cultural Events',
    28,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758283733/fun-facts/yvmhhsfy3rjjeyib2d7i.png'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: gallery
# ------------------------------------------------------------

INSERT INTO
  `gallery` (`id`, `category`, `cover_image`, `images`)
VALUES
  (
    2,
    'yoga',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758607801/harvesttenderroots/gallery/zthlfazuh6yxsukt7ccg.png',
    '[\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758604606/harvesttenderroots/gallery/hsikm3p5oejtivlxzdmf.png\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758604606/harvesttenderroots/gallery/zjgihtmqu9mt8pklquzo.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758604608/harvesttenderroots/gallery/xagaejf1yfmbbpd6fudx.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758604609/harvesttenderroots/gallery/uxag4w8ap3bes0bbowau.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758604654/harvesttenderroots/gallery/xwij7yihptrcadnjlci8.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758605220/harvesttenderroots/gallery/hgxech5k6qcwdnctqrdn.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758615303/harvesttenderroots/gallery/tkxldufgumecbnrh2lxc.jpg\"]'
  );
INSERT INTO
  `gallery` (`id`, `category`, `cover_image`, `images`)
VALUES
  (
    4,
    'Celebrations',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758616161/harvesttenderroots/gallery/jtlqgtc81dolefseo1ub.jpg',
    '[\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758615271/harvesttenderroots/gallery/bcwz8sqibtjxuhkrm1jf.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758615272/harvesttenderroots/gallery/wqxhsmyb4a5mq2kx25br.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758615273/harvesttenderroots/gallery/wa0vy2by1envjhrerm4z.jpg\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758615274/harvesttenderroots/gallery/yfm1bxeprxfhanuiyu9o.jpg\"]'
  );
INSERT INTO
  `gallery` (`id`, `category`, `cover_image`, `images`)
VALUES
  (
    5,
    'Childrens Day',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758616142/harvesttenderroots/gallery/n6mcmsujkuaij4wx08ic.jpg',
    '[\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758616117/harvesttenderroots/gallery/d2wg8xzohctsa2fqfadt.png\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758616118/harvesttenderroots/gallery/j5ta5or9vftxm81h3xy0.png\",\"https://res.cloudinary.com/dhuzvzyut/image/upload/v1758616120/harvesttenderroots/gallery/keealpefkfubjiatr68c.png\"]'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: hero_section
# ------------------------------------------------------------

INSERT INTO
  `hero_section` (
    `id`,
    `main_heading`,
    `main_description`,
    `sub_heading`,
    `youtube_link`,
    `total_students`,
    `background_image`,
    `hero_image`,
    `funfact_image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    '<h2><strong>Harvest School Nurturing Young Minds</strong><br><strong>Building Bright Futures.&nbsp;</strong></h2>',
    '<p>At<strong> Harvest</strong>, we create a safe and inspiring space where every child begins a journey of curiosity and growth. Our balanced curriculum blends academics with real-world skills through engaging, activity-based learning. We empower students with independence, critical thinking, and wisdom to face tomorrow’s challenges with confidence.&nbsp;</p>',
    'Activities ',
    'https://www.youtube.com/watch?v=VcY1_UNMZRE',
    11,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758546940/harvesttenderroots/hero/cedhxmuvnttl4pzlnb1n.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758716488/harvesttenderroots/hero/mggtlyoxtawnank8ig7u.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758605324/harvesttenderroots/hero/bskv4wfnocrtdnss5q3y.png',
    '2025-09-15 17:08:37',
    '2025-09-27 11:50:36'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: messages
# ------------------------------------------------------------

INSERT INTO
  `messages` (
    `id`,
    `name`,
    `role`,
    `image`,
    `message_to_students`,
    `message_to_staff`,
    `social_facebook`,
    `social_twitter`,
    `social_skype`,
    `social_linkedin`,
    `created_at`
  )
VALUES
  (
    4,
    'sai kiran',
    'Student',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758042982/harvesttenderroots/messages/meqltptubtmolq4xw3in.jpg',
    'PRINCIPAL MESSAGE TO STAFF\r\nMake the children move in (queque) rows.\r\nLet them avoid pull and push and shout\r\nKeep them clean and green their belongings ,class rooms and surroundings too\r\nMake them feel scholl as their home\r\nLet them feel homely atmosphere by being friendly\r\nBe patient to listen to them and set right smoothly the problem they faced\r\nBe prompt at your work\r\nNegotiate with your collegues for the around development of children\r\nProvide remedial teaching to those that needed\r\nEncourage the gifted children to reach the new heights',
    'PRINCIPAL MESSAGE TO STAFF\r\nMake the children move in (queque) rows.\r\nLet them avoid pull and push and shout\r\nKeep them clean and green their belongings ,class rooms and surroundings too\r\nMake them feel scholl as their home\r\nLet them feel homely atmosphere by being friendly\r\nBe patient to listen to them and set right smoothly the problem they faced\r\nBe prompt at your work\r\nNegotiate with your collegues for the around development of children\r\nProvide remedial teaching to those that needed\r\nEncourage the gifted children to reach the new heights',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    '2025-09-16 22:46:23'
  );
INSERT INTO
  `messages` (
    `id`,
    `name`,
    `role`,
    `image`,
    `message_to_students`,
    `message_to_staff`,
    `social_facebook`,
    `social_twitter`,
    `social_skype`,
    `social_linkedin`,
    `created_at`
  )
VALUES
  (
    5,
    'test',
    'twst',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758043981/harvesttenderroots/messages/b0yrfmcny2sfvydmuvuw.jpg',
    'PRINCIPAL MESSAGE TO STAFF\r\nMake the children move in (queque) rows.\r\nLet them avoid pull and push and shout\r\nKeep them clean and green their belongings ,class rooms and surroundings too\r\nMake them feel scholl as their home\r\nLet them feel homely atmosphere by being friendly\r\nBe patient to listen to them and set right smoothly the problem they faced\r\nBe prompt at your work\r\nNegotiate with your collegues for the around development of children\r\nProvide remedial teaching to those that needed\r\nEncourage the gifted children to reach the new heights',
    'PRINCIPAL MESSAGE TO STAFF\r\nMake the children move in (queque) rows.\r\nLet them avoid pull and push and shout\r\nKeep them clean and green their belongings ,class rooms and surroundings too\r\nMake them feel scholl as their home\r\nLet them feel homely atmosphere by being friendly\r\nBe patient to listen to them and set right smoothly the problem they faced\r\nBe prompt at your work\r\nNegotiate with your collegues for the around development of children\r\nProvide remedial teaching to those that needed\r\nEncourage the gifted children to reach the new heights',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    '2025-09-16 23:03:02'
  );
INSERT INTO
  `messages` (
    `id`,
    `name`,
    `role`,
    `image`,
    `message_to_students`,
    `message_to_staff`,
    `social_facebook`,
    `social_twitter`,
    `social_skype`,
    `social_linkedin`,
    `created_at`
  )
VALUES
  (
    6,
    'sai kiran',
    'Student',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758085500/harvesttenderroots/messages/tgl4fjlkv8ou6upxi92g.jpg',
    '<p>tedt</p>\r\n',
    '<p>test</p>\r\n',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    'https://cmdemo.in/html/2025/harvesttenderroots.in/v4/principal-message.php',
    '2025-09-17 10:35:01'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: principal_message
# ------------------------------------------------------------

INSERT INTO
  `principal_message` (
    `id`,
    `name`,
    `role`,
    `image`,
    `message_to_students`,
    `message_to_staff`,
    `social_facebook`,
    `social_twitter`,
    `social_skype`,
    `social_linkedin`,
    `created_at`
  )
VALUES
  (
    7,
    '<h3><strong>P. Ravi Maruth</strong></h3>',
    '<h3><strong>Correspondent</strong></h3>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758261840/harvesttenderroots/principal-message/fs4iba2etmc59oucdaiz.jpg',
    '<p>Dear Students</p><p>Be Friendly and Children you, feel free here Behave to clarify your doubts Speak pleasantly and politely. Never be angry with anyone. Try to participate in as many activities as possible.</p><h4><strong>Learn new things</strong></h4><ul><li>Listen to your children and guide him observe school discipline</li><li>Send the children neat and tidy to the school</li><li>Feed them well let them carry nutrient food only</li><li>Check their bags now and then to know whether they are carrying tools that they needed</li><li>Talk to them and know how he learns in the school.</li></ul>',
    '<h4><strong>MESSAGE TO STAFF BY CORRESPONDENT</strong></h4><ul><li>Be friendly to make the pupils free to express their feelings</li><li>Appreciate the children whenever they do something good to boost up their courage and confidence for better learning</li><li>Never be harsh and resort to abusing on trifles reasons</li><li>Make them learn good habits like punctuality and loyalty.</li></ul>',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    '2025-09-19 10:20:57'
  );
INSERT INTO
  `principal_message` (
    `id`,
    `name`,
    `role`,
    `image`,
    `message_to_students`,
    `message_to_staff`,
    `social_facebook`,
    `social_twitter`,
    `social_skype`,
    `social_linkedin`,
    `created_at`
  )
VALUES
  (
    9,
    '<h4><strong>Mrs. Parvathi Reddy</strong></h4>',
    '<h4><strong>Principal</strong></h4>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758261920/harvesttenderroots/principal-message/pubuafrrtzlnsclabv1j.jpg',
    '<p>PRINCIPAL MESSAGE TO STUDENTS</p><ul><li>Children, be regular to school. Parents send them on time</li><li>Listen to your teachers and obey their instructions. Guide the children to obey the teachers</li><li>Ready to receive and reproduce, parents should make children listen and write what they are taught</li><li>Do your work both at school and home properly .Observe their work</li><li>Participate you might and interest in both cocuricular and extra curricular activities for the acquisition of special skills and sound health</li></ul>',
    '<h4><strong>PRINCIPAL MESSAGE TO STAFF</strong></h4><ul><li>Make the children move in (queque) rows.</li><li>Let them avoid pull and push and shout</li><li>Keep them clean and green their belongings ,class rooms and surroundings too</li><li>Make them feel scholl as their home</li><li>Let them feel homely atmosphere by being friendly</li><li>Be patient to listen to them and set right smoothly the problem they faced</li><li>Be prompt at your work</li><li>Negotiate with your collegues for the around development of children</li><li>Provide remedial teaching to those that needed</li><li>Encourage the gifted children to reach the new heights</li></ul>',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    'https://www.facebook.com/',
    '2025-09-19 11:25:52'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: school_info
# ------------------------------------------------------------

INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Name of the School with Address',
    'Harvest Public School, 5-7-200/11, Near Mamatha Hospital, Pakabanda Bazar, Khammam, Telangana – 507001',
    '2025-09-16 19:36:52',
    '2025-09-23 12:28:51'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'E-mail',
    '<a href=\"mailto:harvestkhammam@gmail.com\">harvestkhammam@gmail.com</a>',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    'Phone No.',
    '<a href=\"tel:+918742295442\">08742-295442/43</a>',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    4,
    'Fax No.',
    '—',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    5,
    'Year of Establishment',
    '01.04.2007',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    6,
    'NOC Obtained ',
    'Yes',
    '2025-09-16 19:36:52',
    '2025-09-17 10:35:49'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    7,
    'NOC No.',
    '20284/PS.I/A1/2006',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    8,
    'NOC Issuing Date',
    '14.12.2006',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    9,
    'Recognition Authority',
    'CBSE',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    10,
    'Status of Affiliation',
    'Composite Provisional Affiliation',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    11,
    'Affiliation No.',
    'CBSE/AFFL/3630058/(SL-01507-0708)/2007/105906',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    12,
    'Affiliation with the Board since',
    '01.04.2007',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    13,
    'Extension of Affiliation upto',
    '31.03.2015 — CBSE/AFFL/3630058/EXTNO143210011/2010/2050864 (29.07.2010)',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    14,
    'Name of Trust / Society / Company',
    'Quest Educational Society 67/2002',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    15,
    'Registration Validity',
    'Valid upto 21.03.2027 (Act 35 of 2001)',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    16,
    'Correspondent Name',
    'P. Ravi Maruth',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    17,
    'Correspondent Address',
    'Dr. No: 5-7-200/11, Near Mamatha Hospital, Pakabanda Bazar, Khammam',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    18,
    'Correspondent E-mail',
    '<a href=\"mailto:ravi.maruth@gmail.com\">ravi.maruth@gmail.com</a>',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    19,
    'Correspondent Phone No.',
    '<a href=\"tel:+919849114369\">9849114369</a>',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    20,
    'Campus Area (Acres)',
    '2.85 acres',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    21,
    'Campus Area (sq. mtrs)',
    '11,533 sq. mtrs',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    22,
    'Built-up Area (sq. mtrs)',
    '976 sq. mtrs',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    23,
    'Playground Area (sq. mtrs)',
    '10,557 sq. mtrs',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );
INSERT INTO
  `school_info` (
    `id`,
    `field_name`,
    `field_value`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    24,
    'Facilities',
    'Indoor games (chess, carroms, table tennis), Dance Rooms, Music Rooms, Health & Medical Check-up',
    '2025-09-16 19:36:52',
    '2025-09-16 19:36:52'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: seo_settings
# ------------------------------------------------------------

INSERT INTO
  `seo_settings` (
    `id`,
    `page_slug`,
    `meta_title`,
    `meta_description`,
    `meta_keywords`,
    `og_title`,
    `og_description`,
    `og_image`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `canonical_url`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'home ',
    'Welcome to Harvest Tender Roots',
    'Best school in Khammam nurturing young minds.',
    'school, khammam, harvest, education',
    'Harvest School - Home',
    'Discover our facilities and holistic learning.',
    '/uploads/og-home.jpg',
    'Harvest School',
    'Learn, Grow, and Achieve with us.',
    '/uploads/twitter-home.jpg',
    'https://harvestschool.com/',
    '2025-09-24 15:19:47',
    '2025-09-24 16:09:42'
  );
INSERT INTO
  `seo_settings` (
    `id`,
    `page_slug`,
    `meta_title`,
    `meta_description`,
    `meta_keywords`,
    `og_title`,
    `og_description`,
    `og_image`,
    `twitter_title`,
    `twitter_description`,
    `twitter_image`,
    `canonical_url`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    2,
    'about  ',
    'About Us - Harvest Tender Roots',
    'Know more about our vision and mission.',
    'about harvest, tender roots school',
    'About Harvest',
    'We believe in holistic education.',
    '/uploads/og-about.jpg',
    'About Harvest',
    'Discover our mission & vision.',
    '/uploads/twitter-about.jpg',
    'https://harvestschool.com/about',
    '2025-09-24 15:19:47',
    '2025-09-24 17:24:41'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: site_content
# ------------------------------------------------------------

INSERT INTO
  `site_content` (
    `id`,
    `main_heading`,
    `main_description`,
    `home1_image`,
    `home2_image`,
    `home3_image`,
    `about_home_heading`,
    `about_home_description`,
    `about1_image`,
    `about2_image`,
    `about3_image`,
    `mission_heading`,
    `mission_description`,
    `mission_image`,
    `vision_heading`,
    `vision_description`,
    `vision_image`,
    `created_at`,
    `updated_at`,
    `homeabout_heading`,
    `homeabout_description`
  )
VALUES
  (
    1,
    '<h2>Shaping Young Minds with Care</h2>',
    '<p>We provide a balanced educational programme within a safe and stimulating environment, so that each child embarks on a physical, intellectual and social journey of curiosity and reasoning. Harvest thus offers a comprehensive and a balanced curriculum which is designed to make learning enjoyable, activity-based and experimental, preparing every student for higher challenges. During these important years, the focus is both on the curriculum as well as the development of intricate skills like critical thinking, solving real life issues while developing independence and wisdom. test</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962682/home/wmnaakamcl1kc7kldysu.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962683/home/hld033gbsuh7m7hapegq.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962684/home/jy4ypi3pq8ohsanu0ycc.png',
    '<h2><strong>A School with Heart, Vision, and Excellence</strong></h2>',
    '<p>We provide a balanced educational programme within a safe and stimulating environment, so that each child embarks on a physical, intellectual and social journey of curiosity and reasoning. Harvest thus offers a comprehensive and a balanced curriculum which is designed to make learning enjoyable, activity-based and experimental, preparing every student for higher challenges. During these important years, the focus is both on the curriculum as well as the development of intricate skills like critical thinking, solving real life issues while developing independence and wisdom.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757996593/about/y3ohvqlx1mvwfvg7ttn1.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962688/about/u1v1srwhobdkilieqm9e.jpg',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757996610/about/oez8xdzhvq2ejieatwdl.jpg',
    ' Our Mission',
    '<p>We promote practices to enhance the rational thinking, concern to the nature, dignity Of labour, fraternity and the freedom of thought and expression.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962690/mission_vision/gkuflancbuzghfotdt9f.png',
    'Our Vision',
    '<p>We aim at the inculcation of scientific, aesthetic and democratic temperament among the children.</p><p><br>&nbsp;</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1757962691/mission_vision/ugnhqcbia0qsxj1y19ve.png',
    '2025-09-15 23:31:42',
    '2025-09-16 19:24:10',
    '<h4>Flexible Classes</h4>',
    '<p>At Harvest School, we understand that every child learns differently. Our flexible classes are designed to adapt to individual learning styles, ensuring that students grasp concepts at their own pace. With a mix of interactive sessions, activity-based learning, and personalized guidance, we make education both engaging and effective.</p>'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: site_settings
# ------------------------------------------------------------

INSERT INTO
  `site_settings` (
    `id`,
    `site_logo`,
    `favicon`,
    `site_title`,
    `site_description`,
    `facebook`,
    `instagram`,
    `pinterest`,
    `twitter`,
    `address`,
    `email`,
    `phone`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758716816/zjwdyuud6kbe6y7iof9a.png',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758696392/favicon_knmsfi.png',
    'Harvest-Tendor-Roots ',
    'Harvest School – Nurturing Young Minds with Joy, Values, and All-Round Growth. test',
    'https://facebook.com/harvesttenderroots',
    'https://instagram.com/harvesttenderroots',
    'https://pinterest.com/harvesttenderroots',
    'https://twitter.com/harvesttenderroots',
    'Gattaiah center, khammam - 507002',
    'tenderrootsharvest@gmail.com',
    '9248977754',
    '2025-09-24 12:20:40',
    '2025-09-24 17:57:07'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: staff
# ------------------------------------------------------------

INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    1,
    'R PARVATHI REDDY',
    'PRINCIPAL',
    '1974-08-30',
    'M.Sc., M.Ed.',
    '18 YEARS',
    'TRAINED',
    NULL,
    '1st class'
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    2,
    'CH.V N. SEKHAR BABU',
    'PGT',
    '1969-07-19',
    'M.A., B.Ed',
    '16 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    3,
    'SANJEEV KUMAR PATRA',
    'PGT',
    '1974-05-26',
    'M.A., B.Ed',
    '15 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    4,
    'K NAGA RAJU',
    'PGT',
    '1982-08-21',
    'M.Sc., B.Ed',
    '10 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    5,
    'Ch SIVA NAGESWARA RAO',
    'PGT',
    '1984-08-28',
    'M.Sc., B.Ed',
    '13 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    6,
    'G NARESH KUMAR',
    'PGT',
    '1984-05-03',
    'M.Sc., B.Ed',
    '14 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    7,
    'G RAMA KRISHNA REDDY',
    'PGT',
    '1975-04-08',
    'M.Sc., B.Ed',
    '12 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    8,
    'G SREENU',
    'PGT',
    '1980-05-24',
    'M.Sc., B.Ed',
    '10 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    9,
    'B HARI PRASAD',
    'PGT',
    '1985-06-25',
    'M.Sc., B.Ed',
    '10 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    10,
    'MD AYUB PASHA',
    'PGT',
    '1982-04-19',
    'M.Sc., B.Ed',
    '14 YEARS',
    'TRAINED',
    '2005-06-01',
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    11,
    'NAGI REDDY',
    'TGT',
    '1983-07-12',
    'B.Sc., B.Ed',
    '11 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    12,
    'SUJATHA',
    'TGT',
    '1984-09-16',
    'B.A., B.Ed',
    '10 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    13,
    'SURESH KUMAR',
    'TGT',
    '1981-05-04',
    'B.Sc., B.Ed',
    '12 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    14,
    'SANDHYA RANI',
    'TGT',
    '1986-10-29',
    'B.Sc., B.Ed',
    '9 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    15,
    'SANTHOSH',
    'TGT',
    '1985-06-23',
    'B.A., B.Ed',
    '8 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    16,
    'PRASAD',
    'TGT',
    '1982-11-12',
    'B.Sc., B.Ed',
    '11 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    17,
    'HEMA',
    'TGT',
    '1987-02-05',
    'B.Sc., B.Ed',
    '7 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    18,
    'PRANEETHA',
    'TGT',
    '1984-03-10',
    'B.A., B.Ed',
    '9 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    19,
    'RAJESH',
    'TGT',
    '1986-08-14',
    'B.Sc., B.Ed',
    '8 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    20,
    'ANJALI',
    'TGT',
    '1988-02-02',
    'B.A., B.Ed',
    '6 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    21,
    'DEVI',
    'PRT',
    '1990-07-09',
    'B.A., D.Ed',
    '5 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    22,
    'BHARATHI',
    'PRT',
    '1989-12-13',
    'B.Sc., D.Ed',
    '5 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    23,
    'RAMESH',
    'PRT',
    '1991-09-22',
    'B.A., D.Ed',
    '4 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    24,
    'KAVITHA',
    'PRT',
    '1992-05-15',
    'B.Sc., D.Ed',
    '4 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    25,
    'SUNIL',
    'PRT',
    '1990-11-30',
    'B.A., D.Ed',
    '5 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    26,
    'POOJA',
    'PRT',
    '1991-04-27',
    'B.Sc., D.Ed',
    '5 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    27,
    'VIKRAM',
    'PRT',
    '1993-01-07',
    'B.A., D.Ed',
    '3 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    28,
    'LATHA',
    'PRT',
    '1992-08-18',
    'B.Sc., D.Ed',
    '4 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    29,
    'SWATHI',
    'PRT',
    '1993-10-12',
    'B.A., D.Ed',
    '3 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    30,
    'MAHESH',
    'PRT',
    '1994-03-25',
    'B.Sc., D.Ed',
    '2 YEARS',
    'TRAINED',
    NULL,
    NULL
  );
INSERT INTO
  `staff` (
    `id`,
    `teacher_name`,
    `designation`,
    `date_of_birth`,
    `professional_qualification`,
    `experience`,
    `trained_status`,
    `first_appointment`,
    `class_assigned`
  )
VALUES
  (
    37,
    'test',
    'test',
    '2025-09-25',
    '',
    '',
    'TRAINED',
    NULL,
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: student_enrollment
# ------------------------------------------------------------

INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (2, 'Nursery', '-', 27);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (3, 'LKG', '-', 42);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (4, 'UKG', '-', 60);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (5, 'I', '-', 90);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (6, 'II', '-', 60);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (7, 'III', '-', 62);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (8, 'IV', '-', 42);
INSERT INTO
  `student_enrollment` (`id`, `class_name`, `section`, `enrolment_count`)
VALUES
  (9, 'V', '-', 30);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: why_choose_us
# ------------------------------------------------------------

INSERT INTO
  `why_choose_us` (
    `id`,
    `main_heading`,
    `main_description`,
    `celebration_link`,
    `values_heading`,
    `values_description`,
    `mission_heading`,
    `mission_description`,
    `vision_heading`,
    `vision_description`,
    `image`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    'Harvest School – ',
    '<p>At Harvest School, we provide a stress-free and child-friendly atmosphere filled with love and care. Our flexible classes and activity-based learning make education engaging, meaningful, and enjoyable.</p>',
    'https://www.youtube.com/watch?v=VcY1_UNMZRE',
    'Vission',
    '<p>We aim at the inculcation of scientific, aesthetic and democratic temperament among the children.</p>',
    'Mission',
    '<p>We promote practices to enhance the rational thinking, concern to the nature, dignity Of labour, fraternity and the freedom of thought and expression.</p>',
    'Values',
    '<p>Harvest\'s motto is to provide stress and strain free Education with love and affection for the all-around development of Children in a Child friendly atmosphere.</p>',
    'https://res.cloudinary.com/dhuzvzyut/image/upload/v1758269723/harvesttenderroots/why-choose-us/zvpwj5dqxcypjr1vk0x2.jpg',
    '2025-09-16 10:48:29',
    '2025-09-19 13:45:23'
  );

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
