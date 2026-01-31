-- DROP DATABASE LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;
-- --Import three tables in database librarydb--  
select*from books;
select*from customers;
select*from orders;

-- 1 ques -> retrive all books in the 'fiction' genre-- 
SELECT* FROM books
where Genre = 'Fiction';

-- 2 ques -> find the books published year after 1950
select*from books
where Published_Year >1950;

-- 3 ques -> list all the customer from canada 
select*from customers
where  Country = 'canada';

-- 4 ques -> show order placed in november 2023
select*from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5 ques -> retrive the total stock of books available
 select sum(stock) as total_stock from books;
 
-- 6 ques ->find the most expensive books
 select*from books
 order by Price DESC
 LIMIT 1;
 
 -- 7 ques -> show all customer who order more than 1 quanity of book
 select*from orders
 where Quantity >1
 order by Quantity;
 
 -- 8 ques -> reterive all the order where total amount exceeds 20$
  select*from orders
  where Total_Amount > 20
  order by Total_Amount;
  
  -- 9 ques -> list all genre avaliable in books table
  select distinct Genre from books;
  
  -- 10 ques -> find the books with lowest stock
  select* from books
  order by Stock;
  
  -- 11 ques -> calculate the total revenue generate from all order
  select sum(Total_Amount) as Total_revenue from orders;
  
  -- 12 ques -> reterive the total number of books sold each genre
  -- select*from orders;
  -- select* from books;
  select b.Genre, sum(o.Quantity) as revenue
  from orders o
  join books b
  on b.Book_ID = o.Order_ID
  group by b.genre;
  
  -- 13 ques -> find the average price of books in the 'fantasy' genre
  -- select* from books;
  select avg(Price) as average_price
  from books
  where Genre = 'Fantasy';
  
  -- 14 ques -> list customer who have atleast placed two Quantity
  select*from orders
  where Quantity >=2;   
  
  -- 15 ques -> find the most frequent ordered books
  select Book_ID,count(Order_ID) as Count_order
  from orders
  group by Book_ID
  order by Count_order desc;
  
  -- 16 ques -> show the top 3 most expensive books of 'fantasy' genre
    select*from books
    where Genre = 'Fantasy'
    order by Genre desc
    limit 3;
    
    -- 17 ques reterive the total quantity of books sold by each author
	-- select*from orders; we get the quantity from order
 -- select*from books; we get the Author from books
 select b.Author, SUM(o.Quantity) AS total_quantity
 from orders o 
 join books b 
 on b.Book_ID = o.Order_ID
 group by b.Author;
 
 -- 18 ques list the city where customers who spent more than 30$ are located
 select*from customers;
  select*from orders;
 select c.city, o.Total_Amount
 from customers c
 join orders o
 on o.Order_ID = c.Customer_ID
 WHERE Total_Amount >30
 order by Total_Amount;
 
 -- 19 ques -> find the customer who spent more 
 select c.Name, SUM(o.Total_Amount) AS total_spent
 from orders o
 join customers c 
 on o.Order_ID = c.Customer_ID
 group by c.Name
 ORDER BY total_spent DESC
 LIMIT 1;

  
  
  
  
  
  
 



 



