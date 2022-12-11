CREATE DATABASE `base_dmarouf` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `DIM_BARCODE` (
  `barcode` char(13) NOT NULL,
  `product_name` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DIM_CONTRIBUTOR` (
  `num_seq_contrib` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`num_seq_contrib`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DIM_DATE` (
  `num_seq_date` int NOT NULL AUTO_INCREMENT,
  `dim_date` datetime DEFAULT NULL,
  PRIMARY KEY (`num_seq_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `DIM_PNNS` (
  `name_PNNS2` varchar(254) NOT NULL,
  `name_PNNS1` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`name_PNNS2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PRODUCT_FACTS` (
  `num_seq_product` int NOT NULL AUTO_INCREMENT,
  `num_seq_date` int DEFAULT NULL,
  `barcode` char(15) DEFAULT NULL,
  `num_seq_contrib` int DEFAULT NULL,
  PRIMARY KEY (`num_seq_product`),
  KEY `BARCODE_idx` (`barcode`),
  KEY `num_idx` (`num_seq_contrib`),
  KEY `DateFK_idx` (`num_seq_date`),
  CONSTRAINT `Barcode` FOREIGN KEY (`barcode`) REFERENCES `DIM_BARCODE` (`barcode`),
  CONSTRAINT `Contrib` FOREIGN KEY (`num_seq_contrib`) REFERENCES `DIM_CONTRIBUTOR` (`num_seq_contrib`),
  CONSTRAINT `DIMDate` FOREIGN KEY (`num_seq_date`) REFERENCES `DIM_DATE` (`num_seq_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PRODUCT_VERSION_FACTS` (
  `num_seq_version` int NOT NULL AUTO_INCREMENT,
  `num_seq_creation_date` int DEFAULT NULL,
  `num_seq_modification_date` int DEFAULT NULL,
  `Name_PNNS2` varchar(254) DEFAULT NULL,
  `num_seq_contrib` int DEFAULT NULL,
  `nutrition_score` tinyint DEFAULT NULL,
  `barcode` char(13) DEFAULT NULL,
  PRIMARY KEY (`num_seq_version`),
  KEY `Name_PNNS2_idx` (`Name_PNNS2`),
  KEY `num_idx` (`num_seq_contrib`),
  KEY `DateFK_idx` (`num_seq_creation_date`),
  KEY `DIMBARCODE2_idx` (`barcode`),
  CONSTRAINT `Contrib2` FOREIGN KEY (`num_seq_contrib`) REFERENCES `DIM_CONTRIBUTOR` (`num_seq_contrib`),
  CONSTRAINT `DIMBARCODE2` FOREIGN KEY (`barcode`) REFERENCES `DIM_BARCODE` (`barcode`),
  CONSTRAINT `DIMDate2` FOREIGN KEY (`num_seq_creation_date`) REFERENCES `DIM_DATE` (`num_seq_date`),
  CONSTRAINT `DIMPNNS2` FOREIGN KEY (`Name_PNNS2`) REFERENCES `DIM_PNNS` (`name_PNNS2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
