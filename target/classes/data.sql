--CREATE DATABASE IF NOT EXISTS `crmapp` COLLATE 'utf8_general_ci';
--SET GLOBAL max_allowed_packet = 1024*1024*50;
USE `crmapp`;

SET FOREIGN_KEY_CHECKS=0;

TRUNCATE `category`;
INSERT INTO `category` (`id`, `label`, `icon`, `router_link`, `expanded`, `items`, `optlock`)
VALUES 
	( 1 , ' Clients ' , ' fa-users ' , ' / clients ' , b ' 0 ' , null , 0 ),
	( 2 , ' Contractual relations ' , ' fa-file-o ' , ' / agreements ' , b ' 0 ' , null , 0 ),
	( 3 , ' Workflow ' , ' fa-file-o ' , ' / documents ' , b ' 0 ' , null , 0 )
	( 4 , ' Individuals ' , ' fa-users ' , ' / persons ' , b ' 0 ' , null , 0 ),
	( 5 , ' Employees ' , ' fa-users ' , ' / employees ' , b ' 0 ' , null , 0 ),
	( 6 , ' Leave ' , ' fa-file-o ' , ' / vacations ' , b ' 0 ' , null , 0 )
	( 7 , ' Hospital sheets ' , ' fa-file-o ' , ' / sicklists ' , b ' 0 ' , null , 0 )
	( 8 , ' Outgoing number ' , ' fa-file-o ' , ' / outputs ' , b ' 0 ' , null , 0 );

TRUNCATE `client`;
INSERT INTO `client` (`id`, `alias`, `title`, `edrpou`, `inn`, `vat_certificate`, `optlock`)
VALUES 
	( 1 , ' kyivstar ' , ' PRAT' KYIVSTAR ' ' , ' 00987654 ' , ' 0098765321 ' , ' 345432678 ' , 0 ),
	( 2 , ' farlep ' , ' PRAT' FARLEP-INVEST ' ' , ' 00678906 ' , ' 00678905412 ' , ' 087654322 ' , 0 ),
	( 3 , ' ukrtelecom ' , ' PJSC' UKRTELECOM ' ' , ' 00312156 ' , ' 00312156412 ' , ' 085987432 ' , 0 ),
	( 4 , ' pride-group ' , ' ТОВ' ПРАЙД-ГРУП ' ' , ' 00352359 ' , ' ' , ' ' , 0 )
	( 5 , ' 2daytelecom ' , ' Number "2DEI Telecom" ' , ' 1111111111 ' , ' ' , ' ' , 0 ),
	( 6 , ' golden-tel ' , ' TOV GOLDEN TELECOM' ' , ' 19028202 ' , ' ' , ' ' , 0 ),
	(7, 'test-client1', 'ТОВ "TEST-CLIENT1"', '19028202', '', '', 0),
	(8, 'test-client2', 'ТОВ "TEST-CLIENT2"', '19028202', '', '', 0),
	(9, 'test-client3', 'ТОВ "TEST-CLIENT3"', '19028202', '', '', 0),
	(10, 'test-client4', 'ТОВ "TEST-CLIENT4"', '19028202', '', '', 0),
	(11, 'test-client5', 'ТОВ "TEST-CLIENT5"', '19028202', '', '', 0),
	(12, 'test-client6', 'ТОВ "TEST-CLIENT6"', '19028202', '', '', 0),
	(13, 'test-client7', 'ТОВ "TEST-CLIENT7"', '19028202', '', '', 0);

TRUNCATE `client_address`;
INSERT INTO `client_address` (`id`, `client_id`, `presentation`, `date_start`, `optlock`)
VALUES 
	( 1 , 1 , ' Ukraine, 03150, Kyiv, Gorkogo St., 172, office 1421 ' , '01 -01-01 ' , 0 ),
	( 2 , 2 , ' Ukraine, 01210, Kyiv, Khreshchatyk street, 38 ' , ' 2012-01-01 ' , 0 ),
	( 3 , 3 , ' Ukraine, 00023, Kyiv, T. Shevchenko blvd., 18 ' , ' 2012-01-01 ' , 0 );

TRUNCATE `client_director`;
INSERT INTO `client_director` (`id`, `client_id`, `post_id`, `full_name`, `short_name`, `date_start`, `optlock`)
VALUES
	( 1 , 1 , 1 , ' Stepanyuk Alla Borisovna ' , ' Stepanyuk AB ' , ' 2013-01-01 ' , 0 ),
	( 2 , 2 , 1 , ' Slyapakov Semyon Valerievich ' , ' Slackakov SV ' , ' 2013-01-01 ' , 0 ),
	( 3 , 3 , 1 , ' Makhno Nestor Petrovich ' , ' Makhno NP ' , ' 2013-01-01 ' , 0 );

TRUNCATE `client_account`;
INSERT INTO `client_account` (`id`, `client_id`, `presentation`, `date_start`, `optlock`)
VALUES
	( 1 , 1 , ' 26007017100038 JSC "Piraeus Bank ICB" MFO 300658 ' , ' 1/1/2013 ' , 0 )
	( 2 , 2 , ' 26007247100756 at AT & T PRIVATBANK, IFO 320699 ' , ' 2013-01-01 ' , 0 );

TRUNCATE `post`;
INSERT INTO `post` (`id`, `title`, `optlock`)
VALUES
	( 1 , ' General Director ' , 0 ),
	(2, 'Java Developer', 0),
	( 3 , ' Administrator ' , 0 ),
	(4, 'Senior Software Developer', 0),
	(5, 'Software Developer', 0);
	
TRUNCATE `person`;
INSERT INTO `person` (`id`, `surname`, `firstname`, `lastname`, `short_name`, `inn`, `birth_date`, `optlock`)
VALUES
	( 1 , ' Ivanov ' , ' Alexander ' , ' Vladimirovich ' , ' Ivanov AV ' , ' 2344566541 ' , ' 1972-03-24 ' , 0 ),
	( 2 , ' Petrov ' , ' Ivan ' , ' Fedorovich ' , ' Petrov IF ' , ' 3045679871 ' , ' 1984-06-15 ' , 0 ),
	( 3 , ' Sidorov ' , ' Petr ' , ' Valerievich ' , ' Sidorov PV ' , ' 2874526548 ' , ' 1978-09-20 ' , 0 ),
	( 4 , ' Sidorenko ' , ' Fedor ' , ' S. ' , ' Sidorenko FS ' , ' 2674826643 ' , ' 9/30/1960 ' , 0 );
	
TRUNCATE `employee`;
INSERT INTO `employee` (`id`, `person_id`, `is_entrepreneur`, `hire_date`, `fired_date`, `post_id`, `optlock`)
VALUES
	(1, 1, b'0', '2012-01-01', null, 5, 0),
	(2, 2, b'1', '2013-06-01', null, 5, 0),
	(3, 3, b'0', '2012-01-01', null, 5, 0),
	(4, 4, b'0', '2012-01-01', null, 4, 0);

TRUNCATE `employee_address`;
INSERT INTO `employee_address` (`id`, `employee_id`, `presentation`, `date_start`, `optlock`)
VALUES 
	( 1 , 1 , ' Ukraine, 04205, Kyiv, Obolonsky ave., 23, room 34 ' , '01 -01-2012 ' , 0 ),
	( 2 , 2 , ' Ukraine, 01210, Kyiv, Kreschatik Street, 12 ' , ' 2012-01-01 ' , 0 ),
	( 3 , 3 , ' Ukraine, 00023, Kyiv, T. Shevchenko blvd., 34/1 ' , ' 2012-01-01 ' , 0 );

TRUNCATE `employee_account`;
INSERT INTO `employee_account` (`id`, `employee_id`, `presentation`, `date_start`, `optlock`)
VALUES
	( 1 , 1 , ' 26007017100038 JSC "Piraeus Bank ICB" MFO 300658 ' , ' 1/1/2013 ' , 0 )
	( 2 , 2 , ' 26007247100756 at AT & T PRIVATBANK, IFO 320699 ' , ' 2013-01-01 ' , 0 ),
	( 3 , 3 , ' 26007547230756 at AT & T PRIVATBANK, IFO 320699 ' , ' 2013-01-01 ' , 0 );

TRUNCATE `vacation`;
INSERT INTO `vacation` (`id`, `employee_id`, `description`, `date_start`, `date_final`, `days_amount`, `holiday_amount`, `comment`, `optlock`)
VALUES
	( 1 , 1 , ' Vacation (1 part) for 2013 ' , ' 2014-02-01 ' , ' 2014-02-12 ' , 12 , 0 , ' ' , 0 ),
	( 2 , 1 , ' Holidays (2 parts) for 2013 ' , ' 2014-07-01 ' , ' 2014-07-12 ' , 12 , 0 , ' ' , 0 ),
	( 3 , 2 , ' Holiday (1 part) for 2013 ' , ' 2014-02-01 ' , ' 2014-02-12 ' , 12 , 0 , ' ' , 0 ),
	( 4 , 2 , ' Holiday (2 parts) for 2013 ' , ' 2014-07-01 ' , ' 2014-07-12 ' , 12 , 0 , ' ' , 0 ),
	( 5 , 3 , ' Holiday (1 part) for 2013 ' , ' 2014-02-01 ' , ' 2014-02-12 ' , 12 , 0 , ' ' , 0 ),
	( 6 , 3 , ' Holiday (2 parts) for 2013 ' , ' 2014-07-01 ' , ' 2014-07-12 ' , 12 , 0 , ' ' , 0 );
	
TRUNCATE `sick_list`;
INSERT INTO `sick_list` (`id`, `employee_id`, `description`, `date_start`, `date_final`, `days_amount`, `comment`, `optlock`)
VALUES
	( 1 , 1 , ' Hospital in February 2014 ' , ' 2014-02-01 ' , ' 2014-02-12 ' , 12 , ' ' , 0 );

TRUNCATE `client_agreement`;
INSERT INTO `client_agreement` (`id`, `client_id`, `number`, `date_start`, `comment`, `optlock`)
VALUES 
	(1, 1, '20170701/45/76', '2017-07-01', '', 0),
	( 2 , 2 , ' FLP-2015/3 ' , ' 2015-03-01 ' , ' TP Contract 2015 ' , 0 ),
	(3, 1, '20170701/45/77', '2017-08-01', '', 0),
	(4, 3, '2017-07-01/4578/7709', '2017-09-01', '', 0);

TRUNCATE `document_type`;
INSERT INTO `document_type` (`id`, `title`, `short_title`, `optlock`)
VALUES 
	( 1 , ' Act of Completed Works ' , ' Act of Issuance of Work ' , 0 ),
	( 2 , ' Invoice ' , ' w / ff ' , 0 ),
	( 3 , ' Additional agreement ' , ' additional acc. ' , 0 ),
	( 4 , ' Act of transfer of licenses ' , ' act of persons. ' , 0 );

TRUNCATE `document_status`;
INSERT INTO `document_status` (`id`, `status`, `optlock`)
VALUES 
	( 1 , ' Transmitted ' , 0 ),
	( 2 , ' Signed ' , 0 ),
	( 3 , ' Paid ' , 0 ),
	( 4 , ' Entered ' , 0 );

TRUNCATE `document`;
INSERT INTO `document` (`id`, `client_agreement_id`, `doc_type_id`, `number`, `dated`, `amount`, `payment_date`, `doc_status_id`, `comment`, `optlock`)
VALUES 
	(1, 1, 2, '18', '2017-06-30', 20000.0, null, '1', '', 0),
	( 2 , 2 , 3 , ' 3 ' , ' 2017-07-01 ' , 500000 . 0 , ' 2017-07-01 ' , ' 4 ' , ' On Suppl. Services for 3 neighborhood ' , 0 ),
	(3, 3, 1, '64', '2017-06-30', 20000.0, '2017-07-10', '3', '', 0),
	(4, 3, 1, '65', '2017-07-10', 30000.0, '2017-08-14', '1', '', 0),
	(5, 3, 1, '66', '2017-08-15', 30001.0, '2017-09-16', '2', '', 0),
	(6, 4, 1, '67', '2017-09-30', 40000.0, '2017-12-01', '3', '', 0),
	(7, 3, 1, '67', '2017-09-30', 40000.0, '2017-12-01', '4', '', 0);

TRUNCATE `mail_document_type`;
INSERT INTO `mail_document_type` (`id`, `title`, `optlock`)
VALUES 
	( 1 , ' Letter ' , 0 ),
	( 2 , ' Power of Attorney ' , 0 ),
	( 3 , ' Commercial offer ' , 0 );

TRUNCATE `mail_output`;
INSERT INTO `mail_output` (`id`, `mail_doc_type_id`, `number`, `dated`, `receiver`, `comment`, `optlock`)
VALUES 
	( 1 , 1 , ' 401 ' , ' 2017-04-30 ' , ' Test Recipient ' , ' ' , 0 ),
	( 2 , 2 , ' 402 ' , ' 2017-05-01 ' , ' Test Recipient ' , ' ' , 0 ),
	( 3 , 3 , ' 403 ' , ' 2017-06-02 ' , ' Test Recipient ' , ' ' , 0 ),
	( 4 , 1 , ' 404 ' , ' 2017-06-02 ' , ' Test Recipient ' , ' ' , 0 ),
	( 5 , 1 , ' 405 ' , ' 2017-07-03 ' , ' Test Recipient ' , ' ' , 0 ),
	( 6 , 2 , ' 406 ' , ' 2017-09-06 ' , ' Test Recipient ' , ' ' , 0 );

RUNCATE `our_company`;
INSERT INTO `our_company` (`id`, `alias`, `title`, `edrpou`, `inn`, `vat_certificate`, `optlock`)
VALUES 
	( 1 , ' geosap ' , ' ТОВ' ГЕОСАП ' ' , ' 36483010 ' , ' ' , ' ' , 0 );

TRUNCATE `our_company_address`;
INSERT INTO `our_company_address` (`id`, `our_company_id`, `presentation`, `date_start`, `optlock`)
VALUES 
	( 1 , 1 , ' Ukraine, 03150, Kyiv, Gorky St., 172, office 1020 ' , ' 2009-01-01 ' , 0 ),
	( 2 , 2 , ' Ukraine, 03022, Kyiv, Kozatskaya street, 120/4, summer B ' , ' 2015-07-01 ' , 0 );

TRUNCATE `our_company_director`;
INSERT INTO `our_company_director` (`id`, `our_company_id`, `post_id`, `full_name`, `short_name`, `date_start`, `optlock`)
VALUES
	( 1 , 1 , 1 , ' Стоян Олександр Володимирович ' , ' Стоян О.В. ' , ' 2015-01-01 ' , 0 );

SET FOREIGN_KEY_CHECKS=1;