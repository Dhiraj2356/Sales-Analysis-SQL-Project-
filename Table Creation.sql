create table retailsale
(    
   transactions_id int PRIMARY KEY,
   sale_date	DATE,
   sale_time	TIME,
   customer_id	int,
   gender	varchar(20),
   age	int,
   category varchar(50),	
   quantiy	int,	
   price_per_unit  float,	
   cogs	float,
   total_sale  float
    
);

