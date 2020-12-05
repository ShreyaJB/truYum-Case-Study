use truyum;
/*1. View Menu Item List Admin (TYUC001);
a. Frame insert scripts to add data into menu_item table. Refer View Menu
Item List Admin screen below for sample data.*/
insert into menu_item values(11,"Sandwich","Yes",99,"15/03/2017","Main Course","Yes");
insert into menu_item values(12,"Burger","Yes",129,"23/12/2017","Main Course","No");
insert into menu_item values(13,"Pizza","Yes",149,"21/08/2017","Main Course","No");
insert into menu_item values(14,"French Fries","No",57,"02/07/2017","Starters","Yes");
insert into menu_item values(15,"Chocolate Brownie","Yes",32,"02/11/2022","Desserts","Yes");

/*b. Frame SQL query to get all menu items*/
select * from menu_item;

/*2. View Menu Item List Customer (TYUC002)
a. Frame SQL query to get all menu items which after launch date and is
active.*/
select * from menu_item where date_of_launch < curdate() and active_not='Yes';

/*3. Edit Menu Item (TYUC003)
a. Frame SQL query to get a menu items based on Menu Item Id*/
select * from menu_item where item_id=11;
select * from menu_item where item_id=12;
select * from menu_item where item_id=13;
select * from menu_item where item_id=14;
select * from menu_item where item_id=15;

/*b. Frame update SQL menu_items table to update all the columns values
based on Menu Item Id*/
update menu_item 
set menu_item_name="bread",
active_not='Yes',
price=60,
date_of_launch='21/12/2019',
category='desserts',
free_delivery='No' where item_id=13;

/*4. Add to Cart (TYUC004)
a. Frame insert scripts for adding data into user and cart tables.In user table
create two users. Once user will not have any entries in cart, while the
other will have at least 3 items in the cart.*/
INSERT INTO user VALUES("A1","JOHN","admin");
INSERT into user VALUES("A2","bob","customer");

insert into cart values(1,"A1",11,2);
insert into cart values(2,"A2",13,4);
insert into cart values(3,"A2",12,2);
insert into cart values(4,"A2",11,2);

/*5. View Cart (TYUC005)
a. Frame SQL query to get all menu items in a particular user’s cart*/
select * from cart where user_id="A2";

select menu_item_name,free_delivery,price,category 
from menu_item natural join cart 
where user_id="A2";

/*b. Frame SQL query to get the total price of all menu items in a particular
user’s cart*/
select sum(price)as total 
from menu_item natural join cart 
where item_id=item_id and user_id="A2";

/*6. Remove Item from Cart (TYUC006)
a. Frame SQL query to remove a menu items from Cart based on User Id
and Menu Item Id*/
delete from cart where user_id ="A2" and  item_id=13;

