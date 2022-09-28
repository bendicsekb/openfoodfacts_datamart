CREATE TABLE `DIM_CONTRIBUTOR` (
  `num_seq_contib` int,
  `pseudo` varchar(1000),
  PRIMARY KEY (`num_seq_contib`)
);

CREATE TABLE `DIM_PNNS` (
  `name_PNNS2` int,
  `name_PNNS1` varchar(1000),
  PRIMARY KEY (`name_PNNS2`)
);

CREATE TABLE `DIM_DATE` (
  `num_seq_date` int,
  `dim_date` date,
  PRIMARY KEY (`num_seq_date`)
);

CREATE TABLE `DIM_NUTRITION_SCORE` (
  `num_seq_ns` int,
  `nutrition_score` int,
  `nutrition_cat` varchar(1000),
  PRIMARY KEY (`num_seq_ns`)
);

CREATE TABLE `DIM_BARCODE` (
  `barcode` int,
  `product_name` varchar(1000),
  PRIMARY KEY (`barcode`)
);
CREATE TABLE `PRODUCT_FACTS` (
  `num_seq_product` int,
  `num_seq_date` int,
  `barcode` int,
  `num_seq_ns` int,
  `num_seq_contib` int,
  PRIMARY KEY (`num_seq_product`),
  CONSTRAINT date_const FOREIGN KEY (num_seq_date) REFERENCES DIM_DATE(num_seq_date),
  CONSTRAINT barcode_const FOREIGN KEY (barcode) REFERENCES DIM_BARCODE(barcode),
  CONSTRAINT num_seq_contib_const FOREIGN KEY (num_seq_contib) REFERENCES DIM_CONTRIBUTOR(num_seq_contib),
  CONSTRAINT num_seq_ns_const FOREIGN KEY (num_seq_ns) REFERENCES DIM_NUTRITION_SCORE(num_seq_ns)
);
CREATE TABLE `PRODUCT_VERSION_FACTS` (
  `num_seq_version` int,
  `num_seq_date` int,
  `name_PNNS2` int,
  `num_seq_ns` int,
  `num_seq_contib` int,
  PRIMARY KEY (`num_seq_version`),
  CONSTRAINT date_const_version FOREIGN KEY (num_seq_date) REFERENCES DIM_DATE(num_seq_date),
  CONSTRAINT name_PNNS2_const_version FOREIGN KEY (name_PNNS2) REFERENCES DIM_PNNS(name_PNNS2),
  CONSTRAINT num_seq_contib_const_version FOREIGN KEY (num_seq_contib) REFERENCES DIM_CONTRIBUTOR(num_seq_contib),
  CONSTRAINT num_seq_ns_const_version FOREIGN KEY (num_seq_ns) REFERENCES DIM_NUTRITION_SCORE(num_seq_ns)
);
