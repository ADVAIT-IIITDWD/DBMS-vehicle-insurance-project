create schema vehicle;
show schemas;
use vehicle;

CREATE TABLE `vehicle`.`ADVAIT_customer` (
  `cust_id` VARCHAR(20) NOT NULL,
  `cust_fname` VARCHAR(45) NOT NULL,
  `cust_lname` VARCHAR(45) NOT NULL,
  `cust_dob` DATE NOT NULL,
  `cust_gender` CHAR(2) NOT NULL,
  `cust_address` VARCHAR(45) NOT NULL,
  `cust_mob_number` INT NOT NULL,
  `cust_email` VARCHAR(45) NOT NULL,
  `cust_passport_num` VARCHAR(45) NOT NULL,
  `cust_maritial_status` VARCHAR(45) NOT NULL,
  `cust_pps_number` INT NOT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);

CREATE TABLE `vehicle`.`ADVAIT_application` (
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(45) NOT NULL,
  `application_status` CHAR(8) NOT NULL,
  `coverage` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`application_id`),
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_application` add
constraint fk_cust_id foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_quote` (
  `quote_id` VARCHAR(20) NOT NULL,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `issue_date` DATETIME NOT NULL,
  `valid_from_date` DATETIME NOT NULL,
  `valid_till_date` DATETIME NOT NULL,
  `description` VARCHAR(100) NULL,
  `product_id` VARCHAR(20) NOT NULL,
  `coverage_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`quote_id`),
  UNIQUE INDEX `quote_id_UNIQUE` (`quote_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_quote` add
constraint fk_application_id foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_quote` add
constraint fk_cust_id1 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);  



CREATE TABLE `vehicle`.`ADVAIT_insurance_policy` (
  `agreement_id` VARCHAR(20) NOT NULL,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `department_name` VARCHAR(20) NOT NULL,
  `policy_number` VARCHAR(20) NOT NULL,
  `start_date` DATETIME NOT NULL,
  `expiry_date` DATETIME NOT NULL,
  `term_condition_description` VARCHAR(100) NULL,
  PRIMARY KEY (`agreement_id`),
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_insurance_policy` add
constraint fk_application_id2 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_insurance_policy` add
constraint fk_cust_id2 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);  


CREATE TABLE `vehicle`.`ADVAIT_premium_payment` (
  `premium_payment_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `policy_number` VARCHAR(20) NOT NULL,
  `premium_payment_schedule` DATETIME NOT NULL,
  `premium_payment_amount` INT NOT NULL,
  `receipt_id` VARCHAR(20) NOT NULL,
  UNIQUE INDEX `premium_payment_id_UNIQUE` (`premium_payment_id` ASC) VISIBLE,
  PRIMARY KEY (`premium_payment_id`),
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_premium_payment` add
constraint fk_cust_id3 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);



CREATE TABLE `vehicle`.`ADVAIT_vehicle` (
  `vehicle_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `policy_id` VARCHAR(20) NOT NULL,
  `dependent_nok_id` VARCHAR(20) NOT NULL,
  `vehicle_registration_number` VARCHAR(20) NOT NULL,
  `vehicle_value` INT NOT NULL,
  `vehicle_type` VARCHAR(20) NOT NULL,
  `vehicle_size` INT NOT NULL,
  `vehicle_number_of_seat` INT NOT NULL,
  `vehicle_manufacturer` VARCHAR(20) NOT NULL,
  `vehicle_engine_number` INT NOT NULL,
  `vehicle_chasis_number` INT NOT NULL,
  `vehicle_number` VARCHAR(20) NOT NULL,
  `vehicle_model_number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE INDEX `vehicle_id_UNIQUE` (`vehicle_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_vehicle` add
constraint fk_cust_id4 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_claim` (
  `claim_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `agreement_id` VARCHAR(20) NOT NULL,
  `claim_amount` INT NOT NULL,
  `incident_id` VARCHAR(20) NOT NULL,
  `damage_type` VARCHAR(20) NOT NULL,
  `date_of_claim` DATE NOT NULL,
  `calim_status` CHAR(10) NOT NULL,
  PRIMARY KEY (`claim_id`),
  UNIQUE INDEX `claim_id_UNIQUE` (`claim_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_claim` add
constraint fk_cust_id5 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_claim_statement` (
  `claim_statement_id` VARCHAR(20) NOT NULL,
  `claim_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(20) NOT NULL,
  `date_settled` DATE NOT NULL,
  `amount_paid` INT NOT NULL,
  `coverage_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`claim_statement_id`),
  UNIQUE INDEX `claim_statement_id_UNIQUE` (`claim_statement_id` ASC) VISIBLE,
  UNIQUE INDEX `claim_id_UNIQUE` (`claim_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_claim_statement` add
constraint fk_cust_id6 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_claim_statement` add
constraint fk_claim_id foreign key (`claim_id`) references `vehicle`.`ADVAIT_claim`(`claim_id`);


CREATE TABLE `vehicle`.`ADVAIT_staff` (
  `staff_id` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `staff_fname` VARCHAR(10) NOT NULL,
  `staff_lname` VARCHAR(10) NOT NULL,
  `staff_address` VARCHAR(20) NOT NULL,
  `staff_contact` INT NOT NULL,
  `staff_gender` CHAR(2) NOT NULL,
  `staff_maritial_status` CHAR(8) NOT NULL,
  `staff_nationality` CHAR(15) NOT NULL,
  `staff_qualification` VARCHAR(20) NOT NULL,
  `staff_allowance` INT NOT NULL,
  `staff_pps_number` INT NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_staff` add
constraint fk_company_name foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);



CREATE TABLE `vehicle`.`ADVAIT_department`(
    `department_name` VARCHAR(10) NOT NULL,
    `company_name` VARCHAR(20) NOT NULL,
    `office` VARCHAR(10) NOT NULL,
    `contact_information` VARCHAR(20) NOT NULL,
    `department_staff` VARCHAR(50) NOT NULL,
    `department_leader` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`department_name`),
	UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
    UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
    
alter table `vehicle`.`ADVAIT_department` add
constraint fk_company_name2 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


CREATE TABLE `vehicle`.`ADVAIT_office`(
    `office_name` VARCHAR(20) NOT NULL,
    `department_name` VARCHAR(10) NOT NULL,
    `company_name` VARCHAR(20) NOT NULL,
    `office_leader` VARCHAR(10) NOT NULL,
    `contact_information` VARCHAR(20) NOT NULL,
    `adderss` VARCHAR(20) NOT NULL,
    `admin_cost` INT NOT NULL,
    `staff` VARCHAR(50) NOT NULL,
    PRIMARY KEY (office_name),
    UNIQUE INDEX `department_name_UNIQUE` (`department_name` ASC) VISIBLE,
    UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE
);

alter table `vehicle`.`ADVAIT_office` add
constraint fk_company_name3 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);

alter table `vehicle`.`ADVAIT_office` add
constraint fk_department_name foreign key (`department_name`) references `vehicle`.`ADVAIT_department`(`department_name`);



CREATE TABLE `vehicle`.`ADVAIT_membership`(
    `membership_id` VARCHAR(20) NOT NULL,
    `cust_id` VARCHAR(20)NOT NULL,
    `membership_type` VARCHAR(20) NOT NULL,
    `organisation_contact` CHAR(15) NOT NULL,
    PRIMARY KEY (`membership_id`),
	UNIQUE INDEX `membership_id_UNIQUE` (`membership_id` ASC) VISIBLE,
	UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE
);

alter table `vehicle`.`ADVAIT_membership` add
constraint fk_cust_id7 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);


CREATE TABLE `vehicle`.`ADVAIT_vehicle_service` (
  `vehicle_service` VARCHAR(20) NOT NULL,
  `vehicle_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `department_name` CHAR(20) NOT NULL,
  `vehicle_service_address` VARCHAR(20) NOT NULL,
  `vehicle_sevice_contact` VARCHAR(20) NOT NULL,
  `vehicle_service_incharge` CHAR(20) NOT NULL,
  `vehicle_service_type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`vehicle_service`),
  UNIQUE INDEX `vehicle_service_UNIQUE` (`vehicle_service` ASC) VISIBLE,
  UNIQUE INDEX `vehicle_id_UNIQUE` (`vehicle_id` ASC) VISIBLE);
    
    
alter table `vehicle`.`ADVAIT_vehicle_service` add
constraint fk_cust_id8 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_vehicle_service` add
constraint fk_vehicle_id foreign key (`vehicle_id`) references `vehicle`.`ADVAIT_vehicle`(`vehicle_id`);
    

CREATE TABLE `vehicle`.`ADVAIT_NOK` (
  `NOK_id` VARCHAR(20) NOT NULL,
  `agreement_id` VARCHAR(20) NOT NULL,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `NOK_name` VARCHAR(20) NOT NULL,
  `NOK_address` VARCHAR(20) NOT NULL,
  `NOK_phone_number` INT NOT NULL,
  `NOK_martial_status` CHAR(8) NOT NULL,
  `NOK_gender` CHAR(2) NOT NULL,
  PRIMARY KEY (`NOK_id`),
  UNIQUE INDEX `NOK_id_UNIQUE` (`NOK_id` ASC) VISIBLE,
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
  
alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_cust_id9 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_application_id3 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_NOK` add
constraint fk_agreement_id foreign key (`agreement_id`) references `vehicle`.`ADVAIT_insurance_policy_coverage`(`agreement_id`); 



CREATE TABLE `vehicle`.`ADVAIT_insurance_company` (
  `company_name` VARCHAR(20) NOT NULL,
  `company_address` VARCHAR(20) NOT NULL,
  `company_contact_number` INT NOT NULL,
  `company_fax` INT NOT NULL,
  `company_email` VARCHAR(20) NOT NULL,
  `company_website` VARCHAR(20) NOT NULL,
  `company_location` VARCHAR(20) NOT NULL,
  `company_departmant_name` VARCHAR(20) NOT NULL,
  `company_office_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`company_name`),
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
    

CREATE TABLE `vehicle`.`ADVAIT_policy_renewable` (
  `policy_renewable_id` VARCHAR(20) NOT NULL,
  `agreement_id` VARCHAR(20) NOT NULL,
  `application_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `date_of_renewal` DATE NOT NULL,
  `type_of_renewal` CHAR(15) NOT NULL,
  PRIMARY KEY (`policy_renewable_id`),
  UNIQUE INDEX `policy_renewable_id_UNIQUE` (`policy_renewable_id` ASC) VISIBLE,
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `application_id_UNIQUE` (`application_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_cust_id10 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_application_id4 foreign key (`application_id`) references `vehicle`.`ADVAIT_application`(`application_id`); 

alter table `vehicle`.`ADVAIT_policy_renewable` add
constraint fk_agreement_id2 foreign key (`agreement_id`) references `vehicle`.`ADVAIT_insurance_policy_coverage`(`agreement_id`); 
    

CREATE TABLE `vehicle`.`ADVAIT_incident` (
  `incident_id` VARCHAR(20) NOT NULL,
  `incident_type` VARCHAR(30) NOT NULL,
  `incident_date` DATE NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`incident_id`),
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE);


  CREATE TABLE `vehicle`.`ADVAIT_incident_report` (
  `incident_report_id` VARCHAR(20) NOT NULL,
  `incident_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `incident_inspector` VARCHAR(20) NOT NULL,
  `incident_cost` INT NOT NULL,
  `incident_type` CHAR(10) NOT NULL,
  `incident_report_description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`incident_report_id`),
  UNIQUE INDEX `incident_report_id_UNIQUE` (`incident_report_id` ASC) VISIBLE,
  UNIQUE INDEX `incident_id_UNIQUE` (`incident_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  

alter table `vehicle`.`ADVAIT_incident_report` add
constraint fk_cust_id11 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_incident_report` add
constraint fk_incident_id foreign key (`incident_id`) references `vehicle`.`ADVAIT_incident`(`incident_id`);




  CREATE TABLE `vehicle`.`ADVAIT_coverage` (
  `coverage_id` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `coverage_amount` INT NOT NULL,
  `coverage_type` CHAR(10) NOT NULL,
  `coverage_level` CHAR(15) NOT NULL,
  `product_id` VARCHAR(20) NOT NULL,
  `coverage_description` VARCHAR(100) NOT NULL,
  `coverage_terms` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`coverage_id`),
  UNIQUE INDEX `coverage_id_UNIQUE` (`coverage_id` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);


alter table `vehicle`.`ADVAIT_coverage` add
constraint fk_company_name4 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


  CREATE TABLE `vehicle`.`ADVAIT_product` (
  `product_number` VARCHAR(20) NOT NULL,
  `company_name` VARCHAR(20) NOT NULL,
  `product_price` INT NOT NULL,
  `product_type` CHAR(15) NOT NULL,
  PRIMARY KEY (`product_number`),
  UNIQUE INDEX `product_number_UNIQUE` (`product_number` ASC) VISIBLE,
  UNIQUE INDEX `company_name_UNIQUE` (`company_name` ASC) VISIBLE);
  
  
alter table `vehicle`.`ADVAIT_product` add
constraint fk_company_name5 foreign key (`company_name`) references `vehicle`.`ADVAIT_insurance_company`(`company_name`);


  
  CREATE TABLE `vehicle`.`ADVAIT_receipt` (
  `receipt_id` VARCHAR(20) NOT NULL,
  `premium_payment_id` VARCHAR(20) NOT NULL,
  `cust_id` VARCHAR(20) NOT NULL,
  `cost` INT NOT NULL,
  `time` DATE NOT NULL,
  PRIMARY KEY (`receipt_id`),
  UNIQUE INDEX `receipt_id_UNIQUE` (`receipt_id` ASC) VISIBLE,
  UNIQUE INDEX `premium_payment_id_UNIQUE` (`premium_payment_id` ASC) VISIBLE,
  UNIQUE INDEX `cust_id_UNIQUE` (`cust_id` ASC) VISIBLE);
  
alter table `vehicle`.`ADVAIT_receipt` add
constraint fk_cust_id12 foreign key (`cust_id`) references `vehicle`.`ADVAIT_customer`(`cust_id`);

alter table `vehicle`.`ADVAIT_receipt` add
constraint fk_premium_payment_id foreign key (`premium_payment_id`) references `vehicle`.`ADVAIT_premium_payment`(`premium_payment_id`);


  CREATE TABLE `vehicle`.`ADVAIT_insurance_policy_coverage` (
  `agreement_id` VARCHAR(20) NOT NULL,
  `coverage_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`agreement_id`),
  UNIQUE INDEX `agreement_id_UNIQUE` (`agreement_id` ASC) VISIBLE,
  UNIQUE INDEX `coverage_id_UNIQUE` (`coverage_id` ASC) VISIBLE);
  


alter table `vehicle`.`ADVAIT_insurance_policy_coverage` add
constraint fk_coverage_id foreign key (`coverage_id`) references `vehicle`.`ADVAIT_coverage`(`coverage_id`);
  

show tables;











