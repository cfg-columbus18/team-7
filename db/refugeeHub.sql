CREATE TABLE `answer` (
  `a_id` int(10) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `u_id` int(10) NOT NULL,
  `ask_id` int(10) NOT NULL,
  `q_id` int(10) NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `answeru_id_idx` (`u_id`),
  KEY `asku_id_idx` (`ask_id`),
  KEY `questionu_id_idx` (`q_id`),
  CONSTRAINT `answeru_id` FOREIGN KEY (`u_id`) REFERENCES `mentee` (`u_id`),
  CONSTRAINT `asku_id` FOREIGN KEY (`ask_id`) REFERENCES `mentee` (`u_id`),
  CONSTRAINT `questionu_id` FOREIGN KEY (`q_id`) REFERENCES `question` (`q_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `forum_answers` (
  `fa_id` int(10) NOT NULL,
  `a_text` varchar(255) NOT NULL,
  `u_id` int(10) NOT NULL,
  `ask_id` int(10) NOT NULL,
  `fqa_id` int(10) NOT NULL,
  PRIMARY KEY (`fa_id`),
  KEY `fau_id_idx` (`u_id`),
  KEY `aau_id_idx` (`ask_id`),
  KEY `fqa_id_idx` (`fqa_id`),
  CONSTRAINT `aau_id` FOREIGN KEY (`ask_id`) REFERENCES `mentee` (`u_id`),
  CONSTRAINT `fau_id` FOREIGN KEY (`u_id`) REFERENCES `mentee` (`u_id`),
  CONSTRAINT `fqa_id` FOREIGN KEY (`fqa_id`) REFERENCES `forum_q` (`fq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `forum_q` (
  `fq_id` int(10) NOT NULL,
  `q_text` varchar(255) NOT NULL,
  `u_id` int(10) NOT NULL,
  PRIMARY KEY (`fq_id`),
  KEY `user_id_idx` (`u_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`u_id`) REFERENCES `mentee` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Languages` (
  `lang_id` int(10) NOT NULL,
  `lang_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `Location` (
  `loc_id` int(10) NOT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `country` varchar(40) NOT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`loc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `mentee` (
  `first_name` varchar(50) NOT NULL,
  `u_id` int(20) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `location_id` int(10) NOT NULL,
  `lang_id` int(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `mentor` varchar(45) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `platform` (
  `plat_id` int(10) NOT NULL,
  `plat_name` varchar(50) NOT NULL,
  PRIMARY KEY (`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `question` (
  `q_id` int(10) NOT NULL,
  `q_text` varchar(255) NOT NULL,
  `u_id` int(10) NOT NULL,
  PRIMARY KEY (`q_id`),
  KEY `u_id_idx` (`u_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `mentee` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `user_platform` (
  `user_id` int(10) NOT NULL,
  `plat_id` int(10) NOT NULL,
  PRIMARY KEY (`user_id`,`plat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



