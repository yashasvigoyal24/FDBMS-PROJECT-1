show databases;
create database uber;
use uber;

/* Entity Tables */
/* Table 1 */ 

create table if not exists passenger_account (pass_id varchar(2) primary key, pass_phone bigint not null, pass_email varchar(20) not null, password varchar(10) not null, pass_name varchar(10) not null);
insert into passenger_account values ('P1','9564323452','abc@gmail.com','okm','ika');
insert into passenger_account values ('P2','9843237654','asd@gmail.com','jgh','jyoti');
insert into passenger_account values ('P3','7687654342','uyg@gmail.com','ijh','riya');
insert into passenger_account values ('P4','9810871717','uhg@gmail.com','jhg','prem');
insert into passenger_account values ('P5','9711839300','uvg@gmail.com','hgk','akash');

/* Table 2 */ 

create table if not exists driver ( driver_id varchar(2) primary key, driver_name varchar(10) not null, driver_phone bigint not null, address varchar(25) not null, total_no_of_rides varchar(5) not null, rating varchar(12) not null);
insert into driver values ('D1','raj','9876543234','245 shivalik a block','200','5 stars');
insert into driver values ('D2','manoj','9653427654','76 satya niketan','250','4.3 stars');
insert into driver values ('D3','shalinder','9465465789','B-709 nanakpura','151','4.9 stars');
insert into driver values ('D4','niwas','9646865876','8687 mehrauli park','765','3.9 stars');

/* Table 3 */ 

create table if not exists cab (car_number varchar(15) primary key, model varchar(9) not null, car_type ENUM('HATCHBACK','SEDAN','SUV') not null, Year char(4) not null, Car_Company varchar(15) not null, Colour varchar(7) not null);
insert into cab values ('HR56DK9876','alto',1,'2010','maruti suzuki','red');
insert into cab values ('DL78BV9854','xcent',2,'2015','Hyundai','Black');
insert into cab values ('DL8CAR0009','elantra',2,'2019','hyundai','silver');
insert into cab values ('UP87VC9832','BREZZA',3,'2009','maruti suzuki','white');

/* Table 4 */ 

create table if not exists payment (bill_id varchar(2) primary key, pay_time time not null, pay_date date not null, bill_amt varchar(10) not null, pay_mode ENUM('cash','card','upi','paytm','amazon pay') not null);
insert into payment values ('B1','10:37','2022-01-01','145',1);
insert into payment values ('B2','20:00','2022-01-02','657',1);
insert into payment values ('B3','18:00','2022-01-03','243',4);
insert into payment values ('B4','16:00','2022-01-04','786',2);
insert into payment values ('B5','15:00','2022-01-05','100',3);

/* Table 5 */ 

create table if not exists ride (ride_id varchar(4) primary key, eta_mins time not null, pick_up varchar(3) not null, drop_off varchar(3) not null, Date_of_booking date not null, cab_type ENUM('UBERGO','PREMIER','GOSEDAN','UBERXL') not null);
insert into ride values ('BK1','01:16','YTF','JHO','2022-01-01',1);
insert into ride values ('BK2','00:24','UHI','JHG','2022-01-02',2);
insert into ride values ('BK3','00:34','GHU','GYU','2022-01-03',3);
insert into ride values ('BK4','00:25','BIJ','JHG','2022-01-04',4);
insert into ride values ('BK5','00:28','KHO','JHI','2022-01-05',1);

/* Relationship Tables */
/* Table 6 */ 

create table if not exists passenger_account_payment ( pass_id varchar(2) not null, pass_phone bigint not null, pass_email varchar(20) not null, password varchar(10) not null, pass_name varchar(10) not null, bill_id varchar(2) not null, pay_time time not null, pay_date date not null, bill_amt varchar(10) not null, pay_mode ENUM('cash','card','upi','paytm','amazon pay') not null, primary key (pass_id,bill_id), foreign key (pass_id) references passenger_account(pass_id),foreign key (bill_id) references payment(bill_id));
insert into passenger_account_payment values ('P1','9564323452','abc@gmail.com','okm','ika','B1','10:37','2022-01-01','145',1);
insert into passenger_account_payment values ('P2','9843237654','asd@gmail.com','jgh','jyoti','B2','20:00','2022-01-02','657',1);
insert into passenger_account_payment values ('P3','7687654342','uyg@gmail.com','ijh','riya','B3','18:00','2022-01-03','243',4);
insert into passenger_account_payment values ('P4','9810871717','uhg@gmail.com','jhg','prem','B4','16:00','2022-01-04','786',2);
insert into passenger_account_payment values ('P5','9711839300','uvg@gmail.com','hgk','akash','B5','15:00','2022-01-05','100',3);

/* Table 7 */ 

create table if not exists driver_passenger (driver_id varchar(2) not null, driver_name varchar(10) not null, driver_phone bigint not null, address varchar(25) not null, total_no_of_rides varchar(5) not null, rating varchar(12) not null, pass_id varchar(2) not null, primary key(driver_id,pass_id),  foreign key (driver_id) references driver(driver_id),  foreign key (pass_id) references passenger_account(pass_id));
insert into driver_passenger values ('D1','raj','9876543234','245 shivalik a block','200','5 stars','P1');
insert into driver_passenger values ('D2','manoj','9653427654','76 satya niketan','250','4.3 stars','P2');
insert into driver_passenger values ('D3','shalinder','9465465789','B-709 nanakpura','151','4.9 stars','P3');
insert into driver_passenger values ('D4','niwas','9646865876','8687 mehrauli park','765','3.9 stars','P4');
insert into driver_passenger values ('D1','raj','9876543234','245 shivalik a block','200','5 stars','P5');

/* Table 8 */ 

create table if not exists passenger_ride (pass_id varchar(2) not null, pass_phone bigint not null, pass_email varchar(20) not null, password varchar(10) not null, pass_name varchar(10) not null, ride_id varchar(4) not null, eta_mins time not null, pick_up varchar(3) not null, drop_off varchar(3) not null, Date_of_booking date not null, cab_type ENUM('UBERGO','PREMIER','GOSEDAN','UBERXL') not null, primary key(pass_id,ride_id), foreign key (pass_id) references passenger_account(pass_id), foreign key (ride_id) references ride(ride_id));
insert into passenger_ride values ('P1','9564323452','abc@gmail.com','okm','ika','BK1','01:16','YTF','JHO','2022-01-01',1);
insert into passenger_ride values ('P2','9843237654','asd@gmail.com','jgh','jyoti','BK2','00:24','UHI','JHG','2022-01-02',2);
insert into passenger_ride values ('P3','7687654342','uyg@gmail.com','ijh','riya','BK3','00:34','GHU','GYU','2022-01-03',3);
insert into passenger_ride values ('P4','9810871717','uhg@gmail.com','jhg','prem','BK4','00:25','BIJ','JHG','2022-01-04',4);
insert into passenger_ride values ('P5','9711839300','uvg@gmail.com','hgk','akash','BK5','00:28','KHO','JHI','2022-01-05',1);

/* Table 9 */ 

create table if not exists car_ride (car_number varchar(15) not null, model varchar(9) not null, car_type ENUM('HATCHBACK','SEDAN','SUV') not null, Year char(4) not null, Car_Company varchar(15) not null, Colour varchar(7) not null, ride_id varchar(4) not null, primary key(car_number,ride_id), foreign key (ride_id) references ride(ride_id), foreign key (car_number) references cab(car_number));
insert into car_ride values ('HR56DK9876','alto',1,'2010','maruti suzuki','red','BK1');
insert into car_ride values ('DL78BV9854','xcent',2,'2015','Hyundai','Black','BK2');
insert into car_ride values ('DL8CAR0009','elantra',2,'2019','hyundai','silver','BK3');
insert into car_ride values ('UP87VC9832','BREZZA',3,'2009','maruti suzuki','white','BK4');
insert into car_ride values ('HR56DK9876','alto',1,'2010','maruti suzuki','red','BK5');

/* Table 10 */ 

create table if not exists cab_driver (car_number varchar(15) not null, model varchar(9) not null, car_type ENUM('HATCHBACK','SEDAN','SUV') not null, Year char(4) not null, Car_Company varchar(15) not null, Colour varchar(7) not null, driver_id varchar(2) not null, driver_name varchar(10) not null, driver_phone bigint not null, address varchar(25) not null, total_no_of_rides varchar(5) not null, rating varchar(12) not null, primary key(car_number,driver_id), foreign key (car_number) references cab(car_number), foreign key(driver_id) references driver(driver_id));
insert into cab_driver values ('HR56DK9876','alto',1,'2010','maruti suzuki','red','D1','raj','9876543234','245 shivalik a block','200','5 stars');
insert into cab_driver values ('DL78BV9854','xcent',2,'2015','Hyundai','Black','D2','manoj','9653427654','76 satya niketan','250','4.3 stars');
insert into cab_driver values ('DL8CAR0009','elantra',2,'2019','hyundai','silver','D3','shalinder','9465465789','B-709 nanakpura','151','4.9 stars');
insert into cab_driver values ('UP87VC9832','BREZZA',3,'2009','maruti suzuki','white','D4','niwas','9646865876','8687 mehrauli park','765','3.9 stars');

/* Table 11 */ 

create table if not exists ride_driver (driver_id varchar(2) not null, driver_name varchar(10) not null, driver_phone bigint not null, address varchar(25) not null, total_no_of_rides varchar(5) not null, rating varchar(12) not null, ride_id varchar(4) not null, primary key(driver_id,ride_id), foreign key(driver_id) references driver(driver_id), foreign key (ride_id) references ride(ride_id));
insert into ride_driver values ('D1','raj','9876543234','245 shivalik a block','200','5 stars','BK1');
insert into ride_driver values ('D2','manoj','9653427654','76 satya niketan','250','4.3 stars','BK2');
insert into ride_driver values ('D3','shalinder','9465465789','B-709 nanakpura','151','4.9 stars','BK3');
insert into ride_driver values ('D4','niwas','9646865876','8687 mehrauli park','765','3.9 stars','BK4');
insert into ride_driver values ('D1','raj','9876543234','245 shivalik a block','200','5 stars','BK5');

/*
creating users
*/
create user 'jyoti'@'localhost' identified by 'jyoti';
create user 'manoj'@'localhost' identified by 'manoj';
create user 'admin'@'localhost' identified by 'admin';


--admin
grant create,drop,select on *.* to 'admin'@'localhost' with grant option ;

--passenger
grant select on ride to 'jyoti'@'localhost';
grant select on passenger_account_payment to 'jyoti'@'localhost';
grant select on cab to 'jyoti'@'localhost';
grant select on driver to 'jyoti'@'localhost';
grant select on driver_passenger to 'jyoti'@'localhost';
grant update on passenger_account to 'jyoti'@'localhost';
grant select on passenger_ride to 'jyoti'@'localhost';

--driver
grant select, insert on driver to 'manoj'@'localhost';
grant select on cab to 'manoj'@'localhost';
grant select on payment to 'manoj'@'localhost';
grant select on ride to 'manoj'@'localhost';
grant select on passenger to 'manoj'@'localhost';
grant select on driver_passenger to 'manoj'@'localhost';
grant select on ride_driver to 'manoj'@'localhost';
grant select on car_ride to 'manoj'@'localhost';
grant select on cab_driver to 'manoj'@'localhost';
