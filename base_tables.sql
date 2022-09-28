CREATE TABLE `DIM_CONTRIBUTOR` (
  `nb_seq_contib` int,
  `pseudo` varchar(1000),
  PRIMARY KEY (`nb_seq_contib`)
);

CREATE TABLE `DIM_PNNS` (
  `name_PNNS2` int,
  `name_PNNS1` varchar(1000),
  PRIMARY KEY (`name_PNNS2`)
);

CREATE TABLE `DIM_DATE` (
  `nb_seq_date` int,
  `dim_date` date,
  PRIMARY KEY (`Nb_seq_date`)
);

CREATE TABLE `DIM_NUTRITION_SCORE` (
  `nb_seq_ns` int,
  `nutrition_score` int,
  `nutrition_cat` varchar(1000),
  PRIMARY KEY (`nb_seq_ns`)
);

CREATE TABLE `DIM_BARCODE` (
  `barcode` int,
  `product_name` varchar(1000),
  PRIMARY KEY (`barcode`)
);
CREATE TABLE `PRODUCT_FACTS` (
  `num_seq_product` int,
  `nb_seq_date` int,
  `barcode` int,
  `nb_seq_contib` int,
  PRIMARY KEY (`num_seq_product`),
  CONSTRAINT date_const FOREIGN KEY (nb_seq_date) REFERENCES DIM_DATE(nb_seq_date),
  CONSTRAINT barcode_const FOREIGN KEY (barcode) REFERENCES DIM_BARCODE(barcode),
  CONSTRAINT nb_seq_contib_const FOREIGN KEY (nb_seq_contib) REFERENCES DIM_CONTRIBUTOR(nb_seq_contib)
);
CREATE TABLE `PRODUCT_VERSION_FACTS` (
  `num_seq_version` int,
  `nb_seq_date` int,
  `Name_PNNS2` int,
  `nb_seq_contib` int,
  PRIMARY KEY (`num_seq_version`),
  CONSTRAINT date_const FOREIGN KEY (nb_seq_date) REFERENCES DIM_DATE(nb_seq_date),
  CONSTRAINT Name_PNNS2_const FOREIGN KEY (Name_PNNS2) REFERENCES DIM_PNNS(Name_PNNS2),
  CONSTRAINT nb_seq_contib_const FOREIGN KEY (nb_seq_contib) REFERENCES DIM_CONTRIBUTOR(nb_seq_contib)
);
