CREATE TABLE `Person` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`address` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Treatment_Data` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`person_id` INT NOT NULL,
	`dentist_id` INT NOT NULL,
	`insurance_id` INT NOT NULL,
	`desiase_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Desiase` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`desiase_name` VARCHAR(255) NOT NULL,
	`details_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Details` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`category_name` VARCHAR(255) NOT NULL,
	`category_type` VARCHAR(255) NOT NULL,
	`difficulty_level` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Treatment_History` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`threatment_id` INT NOT NULL,
	`admission_date` DATE NOT NULL,
	`end_date` DATE NOT NULL,
	`continued_necessary` bool NOT NULL,
	`success` bool NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Dentist` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Employee` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`position` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) NOT NULL,
	`phone_number` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Price` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`service_type` VARCHAR(255) NOT NULL,
	`price` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Appointment` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`patient_id` INT NOT NULL,
	`dentist_id` INT NOT NULL,
	`service_type` VARCHAR(255) NOT NULL,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Insurance` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`insurance_company_name` VARCHAR(255) NOT NULL,
	`insurance_plan_type` VARCHAR(255) NOT NULL,
	`coverage` VARCHAR(255) NOT NULL,
	`costs` INT NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Treatment_Data` ADD CONSTRAINT `Treatment_Data_fk0` FOREIGN KEY (`person_id`) REFERENCES `Person`(`id`);

ALTER TABLE `Treatment_Data` ADD CONSTRAINT `Treatment_Data_fk1` FOREIGN KEY (`dentist_id`) REFERENCES `Dentist`(`id`);

ALTER TABLE `Treatment_Data` ADD CONSTRAINT `Treatment_Data_fk2` FOREIGN KEY (`insurance_id`) REFERENCES `Insurance`(`id`);

ALTER TABLE `Treatment_Data` ADD CONSTRAINT `Treatment_Data_fk3` FOREIGN KEY (`desiase_id`) REFERENCES `Desiase`(`id`);

ALTER TABLE `Desiase` ADD CONSTRAINT `Desiase_fk0` FOREIGN KEY (`details_id`) REFERENCES `Details`(`id`);

ALTER TABLE `Treatment_History` ADD CONSTRAINT `Treatment_History_fk0` FOREIGN KEY (`threatment_id`) REFERENCES `Treatment_Data`(`id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk0` FOREIGN KEY (`patient_id`) REFERENCES `Person`(`id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk1` FOREIGN KEY (`dentist_id`) REFERENCES `Dentist`(`id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk2` FOREIGN KEY (`service_type`) REFERENCES `Price`(`service_type`);











