-- FWM TEAM
--
-- History:
-- 10-09-14: added location table
-- 03-10-14: added technician and client tables
-- 19-11-14: tidy up of database 
-- 04-12-14: ON DELETE CASCADE added to foreign keys

DROP SCHEMA IF EXISTS `baiken_fwm_1`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- Database: `baiken_fwm_1`
CREATE DATABASE IF NOT EXISTS `baiken_fwm_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `baiken_fwm_1`;

-- Table structure for table `project_manager`
CREATE TABLE IF NOT EXISTS `project_manager` (
    `pm_id` int(11) NOT NULL AUTO_INCREMENT,
    `pm_comp_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `pm_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `pm_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    `pm_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
    `pm_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`pm_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=2;

-- Table structure for table `project`
CREATE TABLE IF NOT EXISTS `project` (
    `project_id` int(11) NOT NULL AUTO_INCREMENT,
    `project_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    `project_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `project_desc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
    `project_active` tinyint(1) DEFAULT NULL,
    `project_visible` tinyint(1) DEFAULT NULL,
    `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
    `project_is_default` TINYINT(1) DEFAULT 0 NULL,
    PRIMARY KEY (`project_id`),
    CONSTRAINT `fk_project_pm` FOREIGN KEY (`pm_id`)
        REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `technician`
CREATE TABLE IF NOT EXISTS `technician` (
    `technician_id` INT(11) NOT NULL AUTO_INCREMENT,
    `technician_name` VARCHAR(50) COLLATE utf8_unicode_ci NULL,
    `technician_phone` VARCHAR(12) COLLATE utf8_unicode_ci NULL,
    `technician_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `technician_document` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
    `technician_active` smallint(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 1,
    `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
    PRIMARY KEY (`technician_id`),
    CONSTRAINT `fk_tech_pm` FOREIGN KEY (`pm_id`)
        REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `client`
CREATE TABLE IF NOT EXISTS `client` (
    `client_id` INT(11) NOT NULL AUTO_INCREMENT,
    `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
    `client_company_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    `client_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    `client_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `client_contact_phone` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
    `client_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`client_id`),
    CONSTRAINT `fk_client_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `facility`
CREATE TABLE IF NOT EXISTS `facility` (
    `facility_id` int(11) NOT NULL AUTO_INCREMENT,
    `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
    `facility_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
    `facility_address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
    `facility_lat` FLOAT(10 , 6 ) COLLATE utf8_unicode_ci NOT NULL,
    `facility_long` FLOAT(10 , 6 ) COLLATE utf8_unicode_ci NOT NULL,
    `facility_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `facility_contact_phone` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
    `facility_contact_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `facility_id_num` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
    `facility_sector` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
    `facility_sic` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
    `boundary` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`facility_id`),
    CONSTRAINT `fk_facility_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `location`
CREATE TABLE IF NOT EXISTS `location` (
    `location_id` INT(11) COLLATE utf8_unicode_ci NOT NULL AUTO_INCREMENT,
    `location_name` VARCHAR(50) COLLATE utf8_unicode_ci NULL,
    `location_desc` VARCHAR(250) COLLATE utf8_unicode_ci NULL,
    `location_address` VARCHAR(500) COLLATE utf8_unicode_ci NULL,
    `location_lat` FLOAT(10 , 6 ) COLLATE utf8_unicode_ci NULL,
    `location_long` FLOAT(10 , 6 ) COLLATE utf8_unicode_ci NULL,
    `location_active` tinyint(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 1,
    `location_visible` tinyint(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 1,
    `location_category` VARCHAR(50) COLLATE utf8_unicode_ci NULL,
    `project_id` INT(11) NOT NULL COMMENT 'Foreign key => project',
    PRIMARY KEY (`location_id`),
    CONSTRAINT `fk_loc_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `task`
CREATE TABLE IF NOT EXISTS `task` (
    `task_id` int(11) NOT NULL AUTO_INCREMENT,
    `project_id` int(11) NOT NULL COMMENT 'Foreign key => project',
    `task_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `task_deadline` varchar(50) NOT NULL,
    `task_start_date` varchar(50) NULL,
    `task_instructions` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    `task_trigger_cal` TINYINT(1) DEFAULT 0 NULL,
    `task_trigger_cal_value` VARCHAR(50) NULL,
    `task_trigger_pm` TINYINT(1) DEFAULT 0 NULL,
    `task_trigger_ext` TINYINT(1) DEFAULT 0 NULL,
    `task_active` tinyint(1) NOT NULL DEFAULT '0',
    `task_activated` tinyint(1) NOT NULL DEFAULT '0',
    `task_req_form` TINYINT(1) DEFAULT 0 NULL,
    `task_req_field_analyte` TINYINT(1) DEFAULT 0 NULL,
    `task_req_lab_analyte` TINYINT(1) DEFAULT 0 NULL,
    `task_req_service` TINYINT(1) DEFAULT 0 NULL,
    PRIMARY KEY (`task_id`),
    CONSTRAINT `fk_task_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `service`
CREATE TABLE IF NOT EXISTS `service` (
    `service_id` int(11) NOT NULL AUTO_INCREMENT,
    `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
    `service_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'contractor or equipment',
    `service_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
    `service_url` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `service_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
    `service_contact_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `service_contact_phone` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
    `service_contact_email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
    `service_active` tinyint(1) NOT NULL,
    PRIMARY KEY (`service_id`),
    CONSTRAINT `fk_service_pm` FOREIGN KEY (`pm_id`)
        REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `field_analyte`
CREATE TABLE IF NOT EXISTS `field_analyte` (
    `field_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
    `field_analyte_name_unit` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
    `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
    PRIMARY KEY (`field_analyte_id`),
    UNIQUE INDEX `un_fa` (`field_analyte_name_unit` ASC),
    CONSTRAINT `fk_field_analyte_pm` FOREIGN KEY (`pm_id`)
        REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `field_analyte_location`
CREATE TABLE IF NOT EXISTS `field_analyte_location` (
    `task_id` int(11) NOT NULL,
    `field_analyte_id` int(11) NOT NULL,
    `location_id` int(11) NOT NULL,
    CONSTRAINT `fk_fsm_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_fsm_field_analyte` FOREIGN KEY (`field_analyte_id`)
        REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_fsm_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `lab_analyte`
CREATE TABLE IF NOT EXISTS `lab_analyte` (
    `lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
    `lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `pm_id` int(11) NOT NULL COMMENT 'Foreign key => project_manager',
    PRIMARY KEY (`lab_analyte_id`),
    UNIQUE INDEX `un_la` (`lab_analyte_name` ASC),
    CONSTRAINT `fk_lab_analyte_pm` FOREIGN KEY (`pm_id`)
        REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `lab_sample_matrix`
CREATE TABLE IF NOT EXISTS `lab_sample_matrix` (
    `task_id` int(11) NOT NULL,
    `lab_analyte_id` int(11) NOT NULL,
    `location_id` int(11) NOT NULL,
    CONSTRAINT `fk_lsm_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_lsm_lab_analyte` FOREIGN KEY (`lab_analyte_id`)
        REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_lsm_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `task_coc_info`
CREATE TABLE IF NOT EXISTS `task_coc_info` (
    `task_coc_id` int(11) NOT NULL AUTO_INCREMENT,
    `task_id` int(11) NOT NULL,
    `service_id` int(11) NULL COMMENT 'Lab ID number',
    `po_number` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
    `lab_instructions` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
    `lab_sample_type` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
    `lab_sample_tat` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
    `project_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is project.project_number by DEFAULT but deverges from it if the PM wants to change it',
    `results_to_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_name by DEFAULT but can changed',
    `results_to_company` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_comp_name by DEFAULT but can changed',
    `results_to_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_address by DEFAULT but can changed',
    `results_to_phone` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_phone by DEFAULT but can changed',
    `results_to_email` varchar(35) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Is pm.pm_email by DEFAULT but can changed',
    PRIMARY KEY (`task_coc_id`),
    CONSTRAINT `fk_tci_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE
--    CONSTRAINT `fk_tci_service` FOREIGN KEY (`service_id`)
--        REFERENCES `service` (`service_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `task_field_analyte
CREATE TABLE IF NOT EXISTS `task_field_analyte` (
    `task_id` int(11) NOT NULL,
    `field_analyte_id` int(11) NOT NULL,
    CONSTRAINT `fk_tfa_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tfa_field_analyte` FOREIGN KEY (`field_analyte_id`)
        REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_field_data_location
CREATE TABLE IF NOT EXISTS `task_field_data_location` (
    `task_id` int(11) NOT NULL,
    `location_id` int(11) NOT NULL,
    CONSTRAINT `fk_tfdl_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tfdl_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_lab_analyte`
CREATE TABLE IF NOT EXISTS `task_lab_analyte` (
    `task_id` int(11) NOT NULL,
    `lab_analyte_id` int(11) NOT NULL,
    CONSTRAINT `fk_tla_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tla_lab_analyte` FOREIGN KEY (`lab_analyte_id`)
        REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_lab_data_location`
CREATE TABLE IF NOT EXISTS `task_lab_data_location` (
    `task_id` int(11) NOT NULL,
    `location_id` int(11) NOT NULL,
    CONSTRAINT `fk_tldl_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tldl_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_location
CREATE TABLE IF NOT EXISTS `task_location` (
    `task_location_id` INT(11) NOT NULL AUTO_INCREMENT,
    `task_id` int(11) NOT NULL,
    `location_id` int(11) NOT NULL,
    CONSTRAINT `fk_tl_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tl_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE,
	UNIQUE INDEX `un_t_l` (`task_id` ASC, `location_id` ASC),
    PRIMARY KEY (`task_location_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_service`
CREATE TABLE IF NOT EXISTS `task_service` (
    `task_id` int(11) NOT NULL,
    `service_id` int(11) NOT NULL,
    CONSTRAINT `fk_ts_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_ts_service` FOREIGN KEY (`service_id`)
        REFERENCES `service` (`service_id`) ON DELETE CASCADE,
	UNIQUE INDEX `un_t_s` (`task_id` ASC, `service_id` ASC)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `task_technician`
CREATE TABLE IF NOT EXISTS `task_technician` (
    `task_id` int(11) NOT NULL,
    `technician_id` int(11) NOT NULL,
    `is_lead_tech` tinyint(1) DEFAULT 0,
    CONSTRAINT `fk_tt_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_tt_technician` FOREIGN KEY (`technician_id`)
        REFERENCES `technician` (`technician_id`) ON DELETE CASCADE,
	UNIQUE INDEX `un_t_r` (`task_id` ASC, `technician_id` ASC)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `project_field_analyte`
CREATE TABLE IF NOT EXISTS `project_field_analyte` (
    `project_id` int(11) NOT NULL,
    `field_analyte_id` int(11) NOT NULL,
    CONSTRAINT `fk_pfa_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pfa_field_analyte` FOREIGN KEY (`field_analyte_id`)
        REFERENCES `field_analyte` (`field_analyte_id`) ON DELETE CASCADE,
	UNIQUE INDEX `un_pfa_p_fa` (`project_id` ASC, `field_analyte_id` ASC)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `project_lab_analyte`
CREATE TABLE IF NOT EXISTS `project_lab_analyte` (
    `project_id` int(11) NOT NULL,
    `lab_analyte_id` int(11) NOT NULL,
    CONSTRAINT `fk_pla_project` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_pla_field_analyte` FOREIGN KEY (`lab_analyte_id`)
        REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
    UNIQUE INDEX `un_pla_l_la` (`project_id` ASC, `lab_analyte_id` ASC)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for table `common_lab_analyte`
CREATE TABLE IF NOT EXISTS `common_lab_analyte` (
    `common_lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
    `common_lab_analyte_category_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
    `common_lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    UNIQUE INDEX `un_cla` (`common_lab_analyte_name` ASC),
    PRIMARY KEY (`common_lab_analyte_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `common_field_analyte`
CREATE TABLE IF NOT EXISTS `common_field_analyte` (
    `common_field_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
    `common_field_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    UNIQUE INDEX `un_cfa` (`common_field_analyte_name` ASC),
    PRIMARY KEY (`common_field_analyte_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for table `document`
CREATE TABLE IF NOT EXISTS `document` (
    `document_id` int(11) NOT NULL AUTO_INCREMENT,
    `document_content_type` varchar(50) NOT NULL COMMENT 'Store the content type of the document',
    `document_category` varchar(50) NOT NULL COMMENT 'Is the name of the table/class for which we want a document. Possible values(13-01-14): location, technician',
    `document_value` varchar(100) NOT NULL COMMENT 'A unique constraint prevent adding the same document as a given type',
    `document_size` int(11) NOT NULL COMMENT 'File size in Kb',
    `document_title` varchar(250) NULL DEFAULT 'Caption goes here' COMMENT 'This is the value for a document that is displayed in the HTML as a caption',
    PRIMARY KEY (`document_id`),
    UNIQUE INDEX `un_doc_cat_val` (`document_id` ASC, `document_category` ASC, `document_value` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `log`
CREATE TABLE IF NOT EXISTS `log` (
    `log_id` int(11) NOT NULL AUTO_INCREMENT,
    `log_request_id` varchar(50) NOT NULL,
    `log_start` varchar(20) NOT NULL,
    `log_end` varchar(20) NOT NULL COMMENT 'FORMAT: Y-m-d H:i:s',
    `log_execution_time` float(10,6) NOT NULL COMMENT 'In milliseconds',
    `log_type` varchar(40) NOT NULL COMMENT 'http_request, controller_method',
    `log_filter` varchar(100) NOT NULL,
    PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `project_service`
CREATE TABLE IF NOT EXISTS `project_service` (
  `project_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
    CONSTRAINT `fk_ps_p` FOREIGN KEY (`project_id`)
        REFERENCES `project` (`project_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_ps_s` FOREIGN KEY (`service_id`)
        REFERENCES `service` (`service_id`) ON DELETE CASCADE,
    UNIQUE INDEX `un_p_s` (`project_id` ASC, `service_id` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `master_lab_analyte`
CREATE TABLE IF NOT EXISTS `master_lab_analyte` (
    `master_lab_analyte_id` int(11) NOT NULL AUTO_INCREMENT,
    `master_lab_analyte_category_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
    `master_lab_analyte_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`master_lab_analyte_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `master_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `project_form`
CREATE TABLE IF NOT EXISTS `project_form` (
  `project_id` int(11) NOT NULL,
  `master_form_id` int(11) DEFAULT NULL,
  `user_form_id` int(11) DEFAULT NULL,
  UNIQUE KEY `un_pf_p_uf_mf` (`project_id`,`user_form_id`,`master_form_id`),
  CONSTRAINT `fk_pf_project` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `user_form`
CREATE TABLE IF NOT EXISTS `user_form` (
  `form_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pm_id` int(11) NOT NULL,
  PRIMARY KEY (`form_id`),
  KEY `fk_uf_project_manager` (`pm_id`),
  CONSTRAINT `fk_uf_project_manager` FOREIGN KEY (`pm_id`) REFERENCES `project_manager` (`pm_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Table structure for table `task_template_form`
CREATE TABLE IF NOT EXISTS `task_template_form`(
`task_id` INT(11) NOT NULL,
`master_form_id` INT(11),
`user_form_id` INT(11),
UNIQUE INDEX `un_tf_t_uf_mf` (`task_id`, `master_form_id`, `user_form_id`),
CONSTRAINT `fk_tf_task` FOREIGN KEY (`task_id`) REFERENCES `task`(`task_id`) ON DELETE CASCADE
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for `user_role`
CREATE TABLE IF NOT EXISTS `user_role` (
    `user_role_id` smallint(2) NOT NULL,
    `user_role_desc` varchar(100),
    PRIMARY KEY (`user_role_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci;

-- Table structure for `user`
CREATE TABLE IF NOT EXISTS `user` (
    `user_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_login` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `user_password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `user_hint` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
    `user_email` VARCHAR(50) NOT NULL COMMENT 'User email that is unique and must be set',
    `user_type` varchar(50) NOT NULL COMMENT 'Possible values: pm_id, technician_id, service_id',
    `user_value` int(11) NOT NULL COMMENT 'ID value corresponding to the user_type',
    `user_role_id` smallint(2) NOT NULL COMMENT 'Look up the table user_role for details about the roles',
    `user_session_id` VARCHAR(50) NULL COMMENT 'Hashed session ID',
    UNIQUE INDEX `un_user_login` (`user_login` ASC),
    UNIQUE INDEX `un_user_email` (`user_email` ASC),
    CONSTRAINT `fk_user_role_user` FOREIGN KEY (`user_role_id`)
        REFERENCES `user_role` (`user_role_id`),
    PRIMARY KEY (`user_id`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for `lab_analyte_location`
CREATE TABLE IF NOT EXISTS `lab_analyte_location` (
  `task_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `lab_analyte_id` int(11) NOT NULL,
    CONSTRAINT `fk_lal_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_lal_location` FOREIGN KEY (`location_id`)
        REFERENCES `location` (`location_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_lal_lab_analyte` FOREIGN KEY (`lab_analyte_id`)
        REFERENCES `lab_analyte` (`lab_analyte_id`) ON DELETE CASCADE,
    UNIQUE INDEX `un_lal` (`task_id` ASC, `location_id` ASC, `lab_analyte_id`ASC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `task_note` (
  `task_note_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `task_note_category_type` varchar(25) NOT NULL COMMENT 'Possible values: pm_id, technician_id',
  `task_note_category_value` int(11) NOT NULL COMMENT 'Represents the value of the object property set in the task_note_category_type',
  `task_note_value`varchar(500) NULL COMMENT 'The value of the note typed by the user',
    CONSTRAINT `fk_tn_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    PRIMARY KEY (`task_note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for `discussion`
CREATE TABLE IF NOT EXISTS `discussion` (
  `discussion_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `discussion_start_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT `fk_discussion_task` FOREIGN KEY (`task_id`)
        REFERENCES `task` (`task_id`) ON DELETE CASCADE,
    PRIMARY KEY (`discussion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for `discussion_person`
CREATE TABLE IF NOT EXISTS `discussion_person` (
    `discussion_person_id` int(11) NOT NULL AUTO_INCREMENT,
    `discussion_id` int(11) NOT NULL,
    `user_id` int(11) NOT NULL,
    `discussion_person_is_author` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Set to 1 when the person is the one who created the discussion',
    CONSTRAINT `fk_dp_discussion` FOREIGN KEY (`discussion_id`)
        REFERENCES `discussion` (`discussion_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_dp_user` FOREIGN KEY (`user_id`)
        REFERENCES `user` (`user_id`) ON DELETE CASCADE,
    PRIMARY KEY (`discussion_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- Table structure for `discussion_content`
CREATE TABLE IF NOT EXISTS `discussion_content` (
  `discussion_content_id` int(11) NOT NULL AUTO_INCREMENT,
  `discussion_person_id` int(11) NOT NULL,
  `discussion_content_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `discussion_content_message` varchar(500) NOT NULL COMMENT 'The message sent',
    CONSTRAINT `fk_dc_discussion_person` FOREIGN KEY (`discussion_person_id`)
        REFERENCES `discussion_person` (`discussion_person_id`) ON DELETE CASCADE,
    PRIMARY KEY (`discussion_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- Dumping data for table `project_manager`
INSERT INTO 
`project_manager` VALUES
(1,'comp name 2','John','Doe1','1234567890','test@fwa.net'),
(2,'','Demo User','','',''),
(3,'','Damir','','',''),
(4,'','Souvik','','',''),
(5,'','Mehedee','','','');

-- Dumping data for table `technician`
INSERT INTO `technician` VALUES 
(1,'Test tech','','test@test.com','',1,1),
(2,'Demo tech','','demo@demo.com','',1,2),
(3,'Popup tech','','popup@popup.com','',1,3),
(4,'Mapping tech','','mapping@mapping.com','',1,4),
(5,'PDF tech','','pdf@pdf.com','',1,5);

INSERT INTO `service` VALUES 
(1,1,'Test','Test SP','','','','','TestSP@TestSP.com',1);

INSERT INTO `project` VALUES 
(1,'EC-TX','','Texas project',1,0,1,0),
(2,'EC-TX','','Texas project',2,0,2,0),
(3,'EC-TX','','Texas project',3,0,3,0),
(4,'EC-TX','','Texas project',4,0,4,0),
(5,'EC-TX','','Texas project',5,0,5,0);

INSERT INTO `facility` VALUES 
(1,1,'EC-TX','Texas',29.179445,-96.277115,'','','','','','',''),
(2,2,'EC-TX','Texas',29.179445,-96.277115,'','','','','','',''),
(3,3,'EC-TX','Texas',29.179445,-96.277115,'','','','','','',''),
(4,4,'EC-TX','Texas',29.179445,-96.277115,'','','','','','',''),
(5,5,'EC-TX','Texas',29.179445,-96.277115,'','','','','','','');

INSERT INTO `client` VALUES 
(1,1,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),
(2,2,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),
(3,3,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),
(4,4,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com'),
(5,5,'Field Work Manager','Austin, TX','Brian Aiken','','baiken@fieldworkmanager.com');

-- Dumping data for table `user_role`
INSERT INTO `user_role` (`user_role_id`,`user_role_desc`) VALUES
(1,'Administrator'),
(2,'Project Manager'),
(3,'Field Technician'),
(4,'Visitor'),
(5,'None');

-- Dumping data for table `user`
INSERT INTO `user` 
(`user_id`,`user_login`,`user_password`,`user_hint`,`user_type`,`user_value`,`user_role_id`,`user_session_id`,`user_email`)
VALUES 
(1,'test','a94a8fe5ccb19ba61c4c0873d391e987982fbbd3g496lJL683','test','pm_id',1,2,'','test@fieldworkmanager.com'),
(2,'demo','89e495e7941cf9e40e6980d14a16bf023ccd4c91g496lJL683','','pm_id',2,2,NULL,'demo@fieldworkmanager.com'),
(3,'mapping','821b7db1bf69055d3819db82de2c55389a73409bg496lJL683','','pm_id',3,2,'','mapping@fieldworkmanager.com'),
(4,'Popup','3b6fb9033a8302fc168ca0199caaba142dbc5530g496lJL683','','pm_id',4,2,NULL,'Popup@fieldworkmanager.com'),
(5,'pdf','ce9f44bc3d348133b47226685a8f75bbf17e757bg496lJL683','','pm_id',5,2,NULL,'pdf@fieldworkmanager.com'),
(6,'admintest','011c945f30ce2cbafc452f39840f025693339c42g496lJL683','test','administrator_id',0,1,'','admintest@fieldworkmanager.com'),
(7,'test@test.com','a6ad00ac113a19d953efb91820d8788e2263b28ag496lJL683','','technician_id',1,3,NULL,'testtech@fieldworkmanager.com'),
(8,'demo@demo.com','a5388cd0243ebd05597addccc785ed6d48587e63g496lJL683','','technician_id',2,3,NULL,'demotech@fieldworkmanager.com'),
(9,'popup@popup.com','2e6a7e7b17101c9da2aa1083874e719ac6fa6506g496lJL683','','technician_id',3,3,NULL,'popuptech@fieldworkmanager.com'),
(10,'mapping@mapping.com','40944004c454380c10f7d580714a85c727b13390g496lJL683','','technician_id',4,3,NULL,'mappingtech@fieldworkmanager.com'),
(11,'pdf@pdf.com','8e00de4617164a9090ee8ca54de80ec15301ede2g496lJL683','','technician_id',5,3,NULL,'pdftech@fieldworkmanager.com'),
(12,'TestSP@TestSP.com','3dee823db92ebaf3bfbcb4bcaee2870c2616fd34g496lJL683','','service_id',1,4,NULL,'TestSP@fieldworkmanager.com'),
(13,'client_id_1@fieldworkmanager.com','ed5aad2a6289a3ea75d6f0eb89ee60332f684138g496lJL683','','client_id',1,4,NULL,'client_id_1@fieldworkmanager.com');

INSERT INTO `master_form`(`form_id`,`content_type`,`category`,`value`,`size`,`title`) VALUES
(1,'pdf',NULL,'FWM_T-ChainofCustody.pdf',45,'Chain Of Custody'),
(2,'pdf',NULL,'FWM_L-WellPurge.pdf',152,'Well Purge'),(3,'pdf',NULL,'FWM_T-FieldSampling.pdf',100,'Field Sampling');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
