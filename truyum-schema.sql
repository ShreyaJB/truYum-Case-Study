drop database truyum;
show databases;
create database truyum;
use truyum;
create table menu_item(item_id int primary key,
						menu_item_name varchar(20),
						active_not varchar(10),
						price int,
						date_of_launch varchar(10),
						category varchar(20),
						free_delivery varchar(8));

create table user(user_id varchar(20) primary key,
					upassword varchar(20) not null,
					utype varchar(20) DEFAULT "user");

create table cart(cart_id int primary key,
					user_id varchar(5),
					item_id int, 
					quantity int, 
					foreign key(user_id) references user(user_id),
					foreign key(item_id) references menu_item(item_id));



                        
			
                        