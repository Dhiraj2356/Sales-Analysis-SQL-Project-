---------Data exploration---------
--how many sales we have
SELECT count(*) as total_sales from retailsale

--how many customers we have
SELECT count (distinct(customer_id)) as number_of_customers from retailsale

--how many categories we have
SELECT distinct category from retailsale;

-------DATA ANALYSIS-------

--Most valued customers 
Select distinct customer_id, sum(total_sale) as purchased_worth from retailsale
group by customer_id
having count(customer_id)>10
order by purchased_worth desc;

---retrive the data for sales made on 2022-11-05
Select * from retailsale
where sale_date = '2022-11-05';

---retrive all the transactions where category is clothing  and the quantity sold more than 3 in the month of nov 2022
select * from retailsale
where category = 'Clothing'
and to_char(sale_date, 'YYYY-MM') = '2022-11' and quantiy >3;

--calculate total sales and count quantity for each category
select category, 
	sum(total_sale)
	as net_sales,
	count(quantiy) as total_orders from retailsale
group by category;

---Find out the average age of customers purchased items from the 'beauty' products

select category, round(avg(age), 2) as average_age from retailsale
where category = 'Beauty'
group by category;

---Find all the transactions where total sales is more than 1000
Select * from retailsale
where total_sale > 1000

---find the total number of transactions made by each gender to each category
select category, gender, count(*) as total_transactions from retailsale
group by category, gender
order by category

---Calculate the average sales for each month and find out best month for each year

select extract(year from sale_date) as year,
       extract(month from sale_date) as month,
	   ROUND(AVG(total_sale)::Numeric, 2) AS total_sales
	  
from retailsale
group by year, month
order by total_sales desc
limit 2;

---find the top 5 customers based on the highest total sales
select distinct customer_id, sum(total_sale) as total_sale
from retailsale
group by customer_id 
order by total_sale desc
limit 5;

---find the number of unique customers who purchased items from each category.:

select count(distinct customer_id) as unique_customers, category from retailsale
group by category

---Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):

select count(transactions_id) as Total_Orders, Shift from (
select *, case 
			when extract(hour from sale_time) < 12 then 'Morning'
			when extract(hour from sale_time) between 12 and 16 then 'Afternoon'
			Else 'Evening'
			end as Shift

from retailsale ) 
Group by Shift;
