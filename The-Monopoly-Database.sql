drop view BrownSpacesView;
drop view LightBlueSpacesView;
drop view PinkSpacesView;
drop view OrangeSpacesView;
drop view RedSpacesView;
drop view YellowSpacesView;
drop view GreenSpacesView;
drop view BlueSpacesView;
drop view RRSpacesView;
drop view UtilitySpacesView;
drop view SpecialSpacesView;

drop table if exists bank;
drop table if exists game_pieces;
drop table if exists jail;
drop table if exists Locations;
drop table if exists draw_squares;
drop table if exists squares_rent;
drop table if exists Rent_Info;
drop table if exists Cards;
drop table if exists players;
drop table if exists Squares;

--------------------------------------------------------------------Tables---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

create table squares
(
     sid integer not null unique,
     name text not null,
     owner integer not null,
     price_mm integer, 
     monopoly boolean,
     type text not null,
     color text,
     house_price_mm integer,
     hotel_price_mm integer,
     houses_on integer,
     hotels_on integer,
     mortgage_price_mm integer,
primary key (sid)
);

create table players
(
   pid integer not null unique,
   name text not null, 
   money_mm integer not null,
   num_props integer not null,
   num_mortgage integer not null,
   piece_id integer,
   jail_status boolean,
   current_cid integer,
primary key (pid)
);

create table locations
(
     pid  integer not null references Players(pid),
     sid  integer not null references Squares(sid),
     turn integer not null,
primary key (pid, sid, turn)
);

create table bank
(
   transaction_num integer not null unique,
   pid integer not null references players(pid),
   cash_total_mm integer not null,
   house_total integer not null,
   hotel_total integer not null, 
   props_total integer not null, 
   free_parking_money_mm integer not null,
   total_taxes_paid_mm integer not null,
   description text not null,
primary key (transaction_num)
);

create table game_pieces
(
     piece_id integer not null,
     owned_by integer references Players(pid),
     piece_name text not null,
primary key (piece_id, owned_by)
);

create table jail
(
     jail_transaction_num integer not null unique, 
     pid integer not null references Players(pid),
     turns_left integer not null,
     bail_posted boolean not null,
     jailed_by text not null,
primary key (jail_transaction_num)
);

create table rent_info
(
     rid integer not null unique,
     num_same_props_owned integer not null,
     rent_price_mm integer not null,
     rp_1H integer, 
     rp_2H integer, 
     rp_3H integer,
     rp_4H integer,
     rp_Hotel integer,
     isMortgaged boolean not null, 
primary key (rid)
);

create table squares_rent
(
     sid integer not null references squares(sid),
     rid integer not null references rent_info,
primary key (sid, rid)
);

create table draw_squares
(
     sid integer not null references squares(sid),
     type text not null,
primary key (sid)
);


create table cards
(
cid integer not null unique,
description text, 
card_drawn_by integer not null references players(pid),
type text not null,
primary key (cid)
);

---------------------------------------insert statements--------------------------------
----------------------------------------------------------------------------------------

insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(1, 'Go', 5, null, false, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(2, 'Mediterranean Avenue', 5, 60, false, 'property', 'brown', 50, 50, 0, 0, 30);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(3, 'Community Chest', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(4, 'Baltic Avenue', 5, 60, false, 'property', 'brown', 50, 50, 0, 0, 30);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(5, 'Income Tax $200', 5, 200, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(6, 'Income Tax 10%', 5, .1, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(7, 'Reading Railroad', 3, 200, false, 'railroad', null, null, null, null, null, 100);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(8, 'Oriental Avenue', 2, 100, false, 'property', 'light blue', 50, 50, 0, 0, 50);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(9,'Chance', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(10, 'Vermont Avenue', 5, 100, false, 'property', 'light blue', 50, 50, 0, 0, 50);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(11, 'Conneticut Avenue', 5, 120, false, 'property', 'light blue', 50, 50, 0, 0, 60);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(12, 'Jail-Visiting', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(13, 'Jail-In', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(14, 'St. Charles Place', 5, 140, false, 'property', 'pink', 100, 100, 0, 0, 70);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(15, 'Electric Company', 5, 150, false, 'utility', null, null, null, null, null, 75);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(16, 'States Avenue', 5, 140, false, 'property', 'pink', 100, 100, 0, 0, 70);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(17, 'Virginia Avenue', 5, 160, false, 'property', 'pink', 100, 100, 0, 0, 80);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(18, 'Pennsylvania Railroad', 5, 200, false, 'railroad', null, null, null, null, null, 100);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(19, 'St. James Place', 5, 180, false, 'property', 'orange', 100, 100, 0, 0, 90);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(20, 'Community Chest', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(21, 'Tennessee Avenue', 5, 180, false, 'property', 'orange', 100, 100, 0, 0, 90);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(22, 'New York Avenue', 5, 200, false, 'property', 'orange', 100, 100, 0, 0, 100);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(23, 'Free Parking', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(24, 'Kentucky Avenue', 5, 220, false, 'property', 'red', 150, 150, 0, 0, 110);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(25, 'Chance', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(26, 'Indiana Avenue', 5, 220, false, 'property', 'red', 150, 150, 0, 0, 110);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(27, 'Illinois Avenue', 5, 240, false, 'property', 'red', 150, 150, 0, 0, 120);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(28, 'B&O Railroad', 5, 200, false, 'railroad', null, null, null, null, null, 100);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(29, 'Atlantic Avenue', 5, 260, false, 'property', 'yellow', 150, 150, 0, 0, 130);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(30, 'Vetnor Avenue', 5, 260, false, 'property', 'yellow', 150, 150, 0, 0, 130);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(31, 'Water Works', 5, 150, false, 'utility', null, null, null, null, null, 75);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(32, 'Marvin Gardens', 5, 280, false, 'property', 'yellow', 150, 150, 0, 0, 140);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(33, 'Go to Jail', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(34, 'Pacific Avenue', 5, 300, false, 'property', 'green', 200, 200, 0, 0, 150);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(35, 'North Caraolina Avenue', 5, 300, false, 'property', 'green', 200, 200, 0, 0, 150);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(36, 'Community Chest', 5, null, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(37, 'Pennsylvania Aveune', 5, 320, false, 'property', 'green', 200, 200, 0, 0, 160);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(38, 'Short Line', 5, 200, false, 'railroad', null, null, null, null, null, 100);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(39, 'Chance', 5, 60, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(40, 'Park Place', 5, 350, false, 'property', 'blue', 200, 200, 0, 0, 175);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(41, 'Luxary Tax', 5, 75, null, 'special', null, null, null, null, null, null);
insert into squares (sid, name, owner, price_mm, monopoly, type, color, house_price_mm, hotel_price_mm, houses_on, hotels_on, mortgage_price_mm)
values(42, 'Boardwalk', 5, 400, false, 'property', 'blue', 200, 200, 0, 0, 200);

insert into players (pid, name, money_mm, num_props, num_mortgage, piece_id, jail_status, current_cid) 
values (1, 'Tadd', 0, 0, 0, 1, false, null);
insert into players (pid, name, money_mm, num_props, num_mortgage, piece_id, jail_status, current_cid) 
values (2, 'Ray', 0, 0, 0, 3, false, null);
insert into players (pid, name, money_mm, num_props, num_mortgage, piece_id, jail_status, current_cid) 
values (3, 'Sean Connery', 0, 0, 0, 2, false, null);
insert into players (pid, name, money_mm, num_props, num_mortgage, piece_id, jail_status, current_cid) 
values (4, 'Alan', 0, 0, 0, 6, false, null);
insert into players (pid, name, money_mm, num_props, num_mortgage, piece_id, jail_status, current_cid) 
values (5, 'Bank', 15140, 0, 0, null, null, null);

insert into locations (pid, sid, turn)
values (1, 1, 1);
insert into locations (pid, sid, turn)
values (2, 1, 2);
insert into locations (pid, sid, turn)
values (3, 1, 3);
insert into locations (pid, sid, turn)
values (4, 1, 4);
insert into locations (pid, sid, turn)
values (1, 4, 5);
insert into locations (pid, sid, turn)
values (2, 8, 6);
insert into locations (pid, sid, turn)
values (3, 7, 7);

insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(1, 1, 1500, 32, 12, 28, 0, 0, 'starting money');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(2, 2, 1500, 32, 12, 28, 0, 0, 'starting money');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(3, 3, 1500, 32, 12, 28, 0, 0, 'starting money');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(4, 4, 1500, 32, 12, 28, 0, 0, 'starting money');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(5, 1, -200, 32, 12, 28, 200, 200, 'player one rolled a 3 and 1. landed on income tax and paid $200.');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(6, 2, -100, 32, 12, 27, 200, 200, 'player two rolled 4 and 2. He bought oriental avenue.');
insert into bank (transaction_num, pid, cash_total_mm, house_total, hotel_total, props_total, free_parking_money_mm,
total_taxes_paid_mm, description) values(7, 3, -200, 32, 12, 26, 200, 200, 'player three rolled 3 and 2. She bought Reading Railroad.');

insert into game_pieces (piece_id, owned_by, piece_name) 
values(1, 1, 'Top Hat');
insert into game_pieces (piece_id, owned_by, piece_name) 
values(2, 3, 'Thimble');
insert into game_pieces (piece_id, owned_by, piece_name) 
values(3, 2, 'Iron');
insert into game_pieces (piece_id, owned_by, piece_name) 
values(4, 5, 'Shoe');
insert into game_pieces (piece_id, owned_by, piece_name) 
values(5, 5, 'Battleship');
insert into game_pieces (piece_id, owned_by, piece_name) 
values(6, 4, 'Cannon');

insert into jail (jail_transaction_num, pid, turns_left, bail_posted, jailed_by)
values (1, 3, 0, true, 'Rolling Doubles');
insert into jail (jail_transaction_num, pid, turns_left, bail_posted, jailed_by)
values (2, 3, 0, true, 'Rolling Doubles');
insert into jail (jail_transaction_num, pid, turns_left, bail_posted, jailed_by)
values (3, 3, 0, true, 'Chance Card');
insert into jail (jail_transaction_num, pid, turns_left, bail_posted, jailed_by)
values (4, 3, 2, true, 'Landing on the Jail Space');

insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(1, 0, 2, 10, 30, 90, 160, 250, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(2, 0, 4, 20, 60, 180, 320, 450, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(3, 0, 6, 30, 90, 270, 400, 550, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(4, 0, 6, 30, 90, 270, 400, 550, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(5, 0, 8, 40, 100, 300, 450, 600, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(6, 0, 10, 50, 150, 450, 625, 750, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(7, 0, 10, 50, 150, 450, 625, 750, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(8, 0, 12, 60, 180, 500, 700, 900, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(9, 0, 14, 70, 200, 550, 750, 950, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(10, 0, 14, 70, 200, 550, 750, 950, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(11, 0, 16, 80, 220, 600, 800, 1000, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(12, 0, 18, 90, 250, 700, 875, 1050, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(13, 0, 18, 90, 250, 700, 875, 1050, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(14, 0, 20, 100, 300, 750, 925, 1100, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(15, 0, 22, 110, 330, 800, 975, 1150, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(16, 0, 22, 110, 330, 800, 975, 1150, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(17, 0, 24, 120, 360, 850, 1025, 1200, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel,isMortgaged)
values(18, 0, 26, 130, 390, 900, 1100, 1275, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(19, 0, 26, 130, 390, 900, 1100, 1275, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(20, 0, 28, 150, 450, 1000, 1200, 1400, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(21, 0, 35, 175, 500, 1100, 1300, 1500, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(22, 0, 50, 200, 600, 1400, 1700, 2000, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(23, 0, 25, null, null, null, null, null, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(24, 0, 25, null, null, null, null, null, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(25, 0, 25, null, null, null, null, null, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(26, 0, 25, null, null, null, null, null, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(27, 0, 4, null, null, null, null, null, false);
insert into rent_info (rid, num_same_props_owned, rent_price_mm, rp_1H, rp_2H, rp_3H, rp_4H, rp_Hotel, isMortgaged)
values(28, 0, 4, null, null, null, null, null, false);

insert into squares_rent(sid, rid)
values(2, 1);
insert into squares_rent(sid, rid)
values(4, 2);
insert into squares_rent(sid, rid)
values(7, 3);
insert into squares_rent(sid, rid)
values(8, 4);
insert into squares_rent(sid, rid)
values(10, 5);
insert into squares_rent(sid, rid)
values(11, 6);
insert into squares_rent(sid, rid)
values(14, 7);
insert into squares_rent(sid, rid)
values(15, 8);
insert into squares_rent(sid, rid)
values(16, 9);
insert into squares_rent(sid, rid)
values(17, 10);
insert into squares_rent(sid, rid)
values(18, 11);
insert into squares_rent(sid, rid)
values(19, 12);
insert into squares_rent(sid, rid)
values(21, 13);
insert into squares_rent(sid, rid)
values(22, 14);
insert into squares_rent(sid, rid)
values(24, 15);
insert into squares_rent(sid, rid)
values(26, 16);
insert into squares_rent(sid, rid)
values(27, 17);
insert into squares_rent(sid, rid)
values(28, 18);
insert into squares_rent(sid, rid)
values(29, 19);
insert into squares_rent(sid, rid)
values(30, 20);
insert into squares_rent(sid, rid)
values(31, 21);
insert into squares_rent(sid, rid)
values(32, 22);
insert into squares_rent(sid, rid)
values(34, 23);
insert into squares_rent(sid, rid)
values(35, 24);
insert into squares_rent(sid, rid)
values(37, 25);
insert into squares_rent(sid, rid)
values(38, 26);
insert into squares_rent(sid, rid)
values(40, 27);
insert into squares_rent(sid, rid)
values(42, 28);

insert into draw_squares(sid, type)
values(9, 'Chance');
insert into draw_squares(sid, type)
values(25, 'Chance');
insert into draw_squares(sid, type)
values(39, 'Chance');
insert into draw_squares(sid, type)
values(3, 'Community Chest');
insert into draw_squares(sid, type)
values(20, 'Community Chest');
insert into draw_squares(sid, type)
values(36, 'Community Chest');

insert into cards (cid, description, card_drawn_by, type)
values(1, 'Advance to Go', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(2, 'Advance to Illinois Ave. If you pass Go, collect $200 ', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(3, 'Advance to St. Charles Place If you pass Go, collect $200', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(4, 'Advance token to nearest Utility. If unowned, you may buy it from the Bank. 
If owned, throw dice and pay owner a total ten times the amount thrown.', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(5, 'Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. 
If Railroad is unowned, you may buy it from the Bank. ', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(6, 'Advance token to the nearest Railroad and pay owner twice the rental to which he/she is otherwise entitled. 
If Railroad is unowned, you may buy it from the Bank. ', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(7, 'Bank pays you dividend of $50', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(8, 'Get out of Jail Free. This card may be kept until needed, or traded/sold', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(9, 'Go back 3 spaces', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(10, 'Go to Jail. If you pass Go, do not collect $200', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(11, 'Make general repairs on all your property. 
For each house pay $25. For each hotel $100 ', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(12, 'Pay poor tax of $15', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(13, 'Take a trip to Reading Railroad. If you pass Go, collect $200', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(14, 'Take a walk on the Boardwalk – Advance token to Boardwalk', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(15, 'You have been elected Chairman of the Board – Pay each player $50', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(16, 'Your building loan matures – Collect $150 ', 5, 'Chance');
insert into cards (cid, description, card_drawn_by, type)
values(17, 'Advance to Go', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(18, 'Bank error in your favor. Collect $200', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(19, 'Doctors fees. Pay $50', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(20, 'Get out of Jail, Free. This card may be kept until needed or sold', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(21, 'Go to Jail. Go directly to jail. Do not pass Go. Do not collect $200 ', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(22, 'Grand Opera Night. Collect $50 from every player for opening night seats', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(23, 'Holiday Fund matures - Receive $100', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(24, 'Income tax refund. Collect $20', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(25, 'Life insurance matures. Collect $100', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(26, 'Pay hospital fees of $100', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(27, 'Pay school fees of $150', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(28, 'Receive $25 consultancy fee ', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(29, 'You are assessed for street repairs. $40 per house. $115 per hotel', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(30, 'You inherit $100', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(31, 'You have won second prize in a beauty contest. Collect $10 ', 5, 'Community Chest');
insert into cards (cid, description, card_drawn_by, type)
values(32, 'From sale of stock you get $50', 5, 'Community Chest');

---------------------------------------------------------------------Views---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

create view BrownSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='brown' and sr.rid=r.rid and sr.sid = s.sid;

create view LightBlueSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='light blue' and sr.rid=r.rid and sr.sid = s.sid;

create view PinkSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='pink' and sr.rid=r.rid and sr.sid = s.sid;

create view OrangeSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='orange' and sr.rid=r.rid and sr.sid = s.sid;

create view RedSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='red' and sr.rid=r.rid and sr.sid = s.sid;

create view YellowSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='yellow' and sr.rid=r.rid and sr.sid = s.sid;
	
create view GreenSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='green' and sr.rid=r.rid and sr.sid = s.sid;

create view BlueSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type, s.color,
	s.house_price_mm, s.hotel_price_mm, s.houses_on, s.hotels_on, s.mortgage_price_mm, 
	r.num_same_props_owned, r.rent_price_mm, r.rp_1H, r.rp_2H, r.rp_3H, r.rp_4H, r.rp_Hotel
	from rent_info r, squares s, squares_rent sr
	where color='blue' and sr.rid=r.rid and sr.sid = s.sid;

create view RRSpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type,  
	r.num_same_props_owned, r.rent_price_mm
	from rent_info r, squares s, squares_rent sr
	where type='railroad' and sr.rid=r.rid and sr.sid = s.sid;

create view UtilitySpacesView as
	select s.name, s.owner, s.price_mm, s.monopoly, s.type,  
	r.num_same_props_owned, r.rent_price_mm
	from rent_info r, squares s, squares_rent sr
	where type='utility' and sr.rid=r.rid and sr.sid = s.sid;

create view SpecialSpacesView as
	select s.name, s.owner, s.type
	from  squares s
	where type='special';

--------------------------------------------------------------Stored Procedures----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

create or replace function getNumPropertiesOwned(integer)
returns table(name text, type text, monopoly boolean, rent_price_mm integer, isMortgaged boolean) as
$$
declare 
     playerID alias for $1;
begin
     return query
     select s.name, s.type, s.monopoly, r.rent_price_mm, r.isMortgaged
     from squares s, rent_info r, squares_rent sr
     where sr.rid = r.rid 
          and sr.sid = s.sid 
	       and  s.owner = playerID;
end;
$$
language plpgsql;

create or replace function getAllBankTransactions(integer)
returns table(transaction_num integer, name text, cash_total_mm integer, description text) as
$$ 
declare
     playerID alias for $1;
begin
     return query
     select b.transaction_num, p.name, b.cash_total_mm, b.description
     from  players p
     inner join bank b on b.pid = playerID
     where b.pid=p.pid;
end;
$$
language plpgsql;

create or replace function getPieceOwner(integer)
returns table(piece_name text, name text) as
$$
declare 
     playerID alias for $1;
begin
     return query
     select gp.piece_name, p.name
     from players p
     inner join game_pieces gp on gp.owned_by = p.pid
     where gp.owned_by = playerID;
end;
$$
language plpgsql;

-------------------------------------------------------------------Triggers--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

create or replace function changeMoney() returns trigger as
$$
begin 
     if new.pid is not null then
          update players
          set money_mm = (money_mm + new.cash_total_mm)
          where pid = new.pid;
          update players 
          set money_mm = (money_mm - new.cash_total_mm)
          where pid = 5;
     else
          rollback;
     end if;

     return new;
end;
$$
language plpgsql; 

create trigger changeMoney
before insert on bank
for each row 
execute procedure changeMoney();

create or replace function goToJail() returns trigger as
$$
begin
	if (new.pid is not null) and new.sid = 33 then
	     new.sid = 13;
	     update players
	     set jail_status = true
	     where pid = new.pid;
	     insert into jail (jail_transaction_num, pid, turns_left, bail_posted, jailed_by)
	     values((select max(jail_transaction_num) from jail)+1, new.pid, 3, false, 'Landed on Go To Jail');
	else
	     rollback;

	end if;
	return new;
	     

end;
$$
language plpgsql;

create trigger jailed
before insert on locations
for each row 
execute procedure goToJail();

-------------------------------------------------------------------Reports--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

--Sample report on the players table and their location on the board in the last few turns
select p.name, p.money_mm, p.num_props, p.num_mortgage, p.jail_status, p.current_cid, l.turn, s.name as position
from players p
inner join locations l on l.pid=p.pid
inner join squares s on s.sid=l.sid
where l.turn = (select max(turn) from locations) 
     or l.turn =  (select max(turn) from locations)-1
          or l.turn = (select max(turn) from locations)-2
               or l.turn = (select max(turn) from locations)-3 
order by l.turn asc;

--Sample reports of the properties that are left on the board
select name, price_mm, type, color
from squares
where owner = 5 
     and type='property'
          or type='utility'
               or type = 'railroad';

-------------------------------------------------------------------Roles--------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

create role player;

create role banker;

create role admin;

--player

revoke all privileges on squares from player;
revoke all privileges on rent_info from player;
revoke all privileges on squares_rent from player;
revoke all privileges on cards from player;
revoke all privileges on jail from player;
revoke all privileges on game_pieces from player;
revoke all privileges on players from player;
revoke all privileges on bank from player;
revoke all privileges on locations from player;

grant select on squares to player;
grant select on rent_info to player;
grant select on squares_rent to player;
grant select on jail to player;
grant select on game_pieces to player;
grant select, insert, update on players to player;
grant select on bank to player;
grant select, insert on locations to player;

--banker

revoke all privileges on squares from banker;
revoke all privileges on rent_info from banker;
revoke all privileges on squares_rent from banker;
revoke all privileges on cards from banker;
revoke all privileges on jail from banker;
revoke all privileges on game_pieces from banker;
revoke all privileges on players from banker;
revoke all privileges on bank from banker;
revoke all privileges on locations from banker;

grant select, update on squares to banker;
grant select, update on rent_info to banker;
grant select on squares_rent to banker;
grant select, update on cards to banker;
grant select, update on jail to banker;
grant select, update on game_pieces to banker;
grant select, insert, update on players to banker;
grant select, insert, update on bank to banker;
grant select, insert on locations to banker;

--admin

grant select, insert, update, delete on squares to admin;
grant select, insert, update, delete on rent_info to admin;
grant select, insert, update, delete on squares_rent to admin;
grant select, insert, update, delete on cards to admin;
grant select, insert, update, delete on jail to admin;
grant select, insert, update, delete on game_pieces to admin;
grant select, insert, update, delete on players to admin;
grant select, insert, update, delete on bank to admin;
grant select, insert, update, delete on locations to admin;
