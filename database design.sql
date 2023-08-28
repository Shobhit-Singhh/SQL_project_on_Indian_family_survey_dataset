
CREATE TABLE `family` (
    `state` varchar(20)  NOT NULL ,
    `family_id` int  NOT NULL ,
    `ResidenceType_Urban` boolean  NOT NULL ,
    `Household_members` int  NOT NULL ,
    `HealthInsurance` boolean  NOT NULL ,
    `Single_Parent` boolean  NOT NULL ,
    `Religion` int  NOT NULL ,
    PRIMARY KEY (
        `family_id`
    )
);

CREATE TABLE `facility` (
    `family_id` int  NOT NULL ,
    `electricity` boolean  NOT NULL ,
    `toilet` boolean  NOT NULL ,
    `radio` boolean  NOT NULL ,
    `tv` boolean  NOT NULL ,
    `bicycle` boolean  NOT NULL ,
    `motorcycle` boolean  NOT NULL ,
    `car` boolean  NOT NULL ,
    PRIMARY KEY (
        `family_id`
    )
);

CREATE TABLE `drug_abuse` (
    `family_id` int  NOT NULL ,
    `Smoke_at_Home` boolean  NOT NULL ,
    `Alcohol` boolean  NOT NULL ,
    `Smoke` boolean  NOT NULL ,
    `Betel_Leaf` boolean  NOT NULL ,
    `Tobacco` boolean  NOT NULL ,
    PRIMARY KEY (
        `family_id`
    )
);

CREATE TABLE `disease` (
    `family_id` int  NOT NULL ,
    `Diabetes` boolean  NOT NULL ,
    `Hypertension` boolean  NOT NULL ,
    `RespDisease` boolean  NOT NULL ,
    `Thyroid` boolean  NOT NULL ,
    `HeartDisease` boolean  NOT NULL ,
    `Cancer` boolean  NOT NULL ,
    `Kidney` boolean  NOT NULL ,
    PRIMARY KEY (
        `family_id`
    )
);

CREATE TABLE `birth` (
    `family_id` int  NOT NULL ,
    `Child_under5` boolean  NOT NULL ,
    `Total_child_born` boolean  NOT NULL ,
    `Sons_died` boolean  NOT NULL ,
    `Daughters_died` boolean  NOT NULL ,
    `ChildAlive` boolean  NOT NULL ,
    `Birth_Size` boolean  NOT NULL ,
    `Birth_Weight` boolean  NOT NULL ,
    `Child_Brst` boolean  NOT NULL ,
    `Breastfeed_duration` boolean  NOT NULL ,
    PRIMARY KEY (
        `family_id`
    )
);

CREATE TABLE `district` (
    `State` varchar(20)  NOT NULL ,
    `District` varchar(20)  NOT NULL ,
    `population` int  NOT NULL ,
    `Growth_rate` decimal(3,2)  NOT NULL ,
    `Sex_Ratio` decimal(3,2)  NOT NULL ,
    `Literacy` decimal(3,2)  NOT NULL ,
    `Area` int  NOT NULL ,
    PRIMARY KEY (
        `State`
    )
);

ALTER TABLE `family` ADD CONSTRAINT `fk_family_family_id` FOREIGN KEY(`family_id`)
REFERENCES `facility` (`family_id`);

ALTER TABLE `drug_abuse` ADD CONSTRAINT `fk_drug_abuse_family_id` FOREIGN KEY(`family_id`)
REFERENCES `family` (`family_id`);

ALTER TABLE `disease` ADD CONSTRAINT `fk_disease_family_id` FOREIGN KEY(`family_id`)
REFERENCES `family` (`family_id`);

ALTER TABLE `birth` ADD CONSTRAINT `fk_birth_family_id` FOREIGN KEY(`family_id`)
REFERENCES `family` (`family_id`);

ALTER TABLE `family`
ADD INDEX `idx_state` (`state`);

ALTER TABLE `district` ADD CONSTRAINT `fk_district_State` FOREIGN KEY(`State`)
REFERENCES `family` (`state`);


