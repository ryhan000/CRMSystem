--CREATE DATABASE IF NOT EXISTS `crmapp` COLLATE 'utf8_general_ci';
--SET GLOBAL max_allowed_packet = 1024*1024*50;
USE `crmapp`;

SET FOREIGN_KEY_CHECKS=0;

TRUNCATE `client`;
INSERT INTO `client` (`id`, `alias`, `title`, `edrpou`, `inn`, `vat_certificate`, `optlock`)
VALUES 
  ( 1 , ' kyivstar ' , ' PRAT' KYIVSTAR ' ' , ' 00987654 ' , ' 0098765321 ' , ' 345432678 ' , 0 ),
  ( 2 , ' farlep ' , ' PRAT' FARLEP-INVEST ' ' , ' 00678906 ' , ' 00678905412 ' , ' 087654322 ' , 0 ),
  ( 3 , ' ukrtelecom ' , ' PJSC' UKRTELECOM ' ' , ' 00312156 ' , ' 00312156412 ' , ' 085987432 ' , 0 );
  
TRUNCATE `client_address`;
INSERT INTO `client_address` (`id`, `client_id`, `presentation`, `date_start`, `optlock`)
VALUES 
  ( 1 , 1 , ' Ukraine, 03150, Kyiv, Gorkogo St., 172, office 1421 ' , '01 -01-01 ' , 0 ),
  ( 2 , 2 , ' Ukraine, 01210, Kyiv, Khreshchatyk street, 38 ' , ' 2012-01-01 ' , 0 ),
  ( 3 , 3 , ' Ukraine, 00023, Kyiv, T. Shevchenko blvd., 18 ' , ' 2012-01-01 ' , 0 );
  
TRUNCATE `client_director`;
INSERT INTO `client_director` (`id`, `client_id`, `post`, `full_name`, `short_name`, `date_start`, `optlock`)
VALUES
	( 1 , 1 , ' General Director ' , ' Stepaniuk Alla Borisovna ' , ' Stepaniuk AB ' , ' 2013-01-01 ' , 0 ),
	( 2 , 2 , ' CEO ' , ' Slyepakov Simon V. ' , ' Slyepakov SV ' , ' 1/1/2013 ' , 0 )
	( 3 , 3 , ' General Director ' , ' Makhno Nestor Petrovich ' , ' Makhno NP ' , ' 2013-01-01 ' , 0 );
	
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
	( 3 , ' Administrator ' , 0 );
	
TRUNCATE `employee`;
INSERT INTO `employee` (`id`, `surname`, `firstname`, `lastname`, `short_name`, `inn`, `birth_date`, `is_entrepreneur`, `hire_date`, `fired_date`, `post_id`, `optlock`)
VALUES
	( 1 , ' Ivanov ' , ' Alexander ' , ' Vladimirovich ' , ' Ivanov AV ' , ' 2344566541 ' , ' 1972-03-24 ' , b ' 0 ' , ' 2012-01-01 ' , null , 1 , 0 ),
	( 2 , ' Petrov ' , ' John ' , ' Fedorovych ' , ' Petrov I.F. ' , ' 3045679871 ' , ' 1984-06-15 ' , b ' 1 ' , ' 2013-06-01 ' , null , 2 , 0 ),
	( 3 , ' Sidorov ' , ' Petr ' , ' Valerievich ' , ' Sidorov PV ' , ' 2874526548 ' , ' 1978-09-20 ' , b ' 0 ' , ' 2012-01-01 ' , null , 3 , 0 );

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

TRUNCATE `agreement`;
INSERT INTO `agreement` (`id`, `client_id`, `number`, `date_start`, `comment`, `optlock`)
VALUES 
  (1, 1, '20170701/45/76', '2017-07-01', '', 0),
  ( 2 , 2 , ' FLP-2015/3 ' , ' 2015-03-01 ' , ' TP Contract 2015 ' , 0 ),
  (3, 1, '20170701/45/77', '2017-08-01', '', 0),
  (4, 3, '2017-07-01/4578/7709', '2017-09-01', '', 0);

TRUNCATE `document_type`;
INSERT INTO `document_type` (`id`, `title`, `optlock`)
VALUES 
  ( 1 , ' Act of Completed Works ' , 0 ),
  ( 2 , ' Invoice ' , 0 ),
  ( 3 , ' Additional agreement ' , 0 );
  
TRUNCATE `document_status`;
INSERT INTO `document_status` (`id`, `status`, `optlock`)
VALUES 
  ( 1 , ' Transmitted ' , 0 ),
  ( 2 , ' Signed ' , 0 ),
  ( 3 , ' Paid ' , 0 );
  
TRUNCATE `document`;
INSERT INTO `document` (`id`, `agreement_id`, `doc_type_id`, `number`, `dated`, `amount`, `payment_date`, `doc_status_id`, `comment`, `optlock`)
VALUES 
  (1, 1, 2, '18', '2017-06-30', 20000.0, null, '1', '', 0),
  ( 2 , 2 , 3 , ' 3 ' , ' 2017-07-01 ' , 500000 . 0 , ' 2017-07-01 ' , ' 2 ' , ' On Suppl. Services for 3 neighborhood ' , 0 ),
  (3, 1, 1, '64', '2017-06-30', 20000.0, '2017-07-10', '3', '', 0);

SET FOREIGN_KEY_CHECKS=1;