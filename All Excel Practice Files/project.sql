create table books(
	Book_ID	int	primary key,
	Title	varchar(100),	
	Author	varchar(100),	
	Genre	varchar(50),	
	Published_Year	int,	
	Price	numeric(10,2),	
	Stock	int	
);

create table customers(
	Customer_ID	int primary key,
	Name	varchar(100),
	Email	varchar(100),
	Phone	varchar(15),
	City	varchar(50),
	Country	varchar(150)
);

create table orders(
	Order_ID int primary key,
	Customer_ID	int REFERENCES customers(Customer_ID),
	Book_ID	int REFERENCES books(Book_ID),
	Order_Date date,
	Quantity int,
	Total_Amount numeric(10,2)
);

select * from books;
select * from customers;
select * from orders;


                --BASIC
				
--1) retrieve all books in the 'fiction' genre.
select * from books 
where genre like 'Fiction';

--2) find books published after the year 1950.
select * from books
where published_year>1950;

--3) list all customers from the canada.
select * from customers
where country like 'Canada';

--4) show orders placed in november 2023.
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

--5) retrieve the total stock of books availavle.
select sum(stock) from books;


--6) find the details of the most expensive book.
SELECT * FROM books
ORDER BY price DESC
LIMIT 1;

--7) show all customers who ordered more than 1 quantity of a book.
select name, quantity
from orders 
inner join customers 
on orders.customer_id=customers.customer_id;

--2nd option
select * from orders where quantity>1;


--8) retrieve all orders where the total amount exceeds $20.
select * from orders
where total_amount>20;

--9) list all genres available in the books table.
select distinct genre from books;

--10) find the book with the lowest stock.
select * from books 
order by stock asc
limit 5;
--2nd option
select * from books where stock<1;

--11) calcuate the total revnue generated from all orders.
select sum(total_amount) AS total_revnue from orders;

                  --ADVANCE

--1) retrieve the total number of books sold for each genre.
select genre, sum(quantity) AS total_book_sold
from books
join
orders
on books.book_id=orders.book_id
group by genre;

--2) find the average price of books in the 'fantasy' genre.
select avg(price)::numeric(10,2) as average_fantasy_book_price 
from books 
where genre='Fantasy';

--3) list customers who have placed at least 2 orders.
select * from orders
where quantity>=2;

--4) find the most frequently ordered books.
select * from orders order by quantity desc;

--5) show the top 3 most expensive books of 'fantasy' genre.
select * from books 
where genre='Fantasy'
order by price desc
limit 3;


--6) retrieve the total quantity of books sold by each author.
select author, sum(quantity) AS total_book_sold
from books
inner join
orders
on books.book_id=orders.book_id
group by author;

--2nd option
select author,quantity, genre
from books
inner join
orders
on books.book_id=orders.book_id


--7) list the cities where customers who spent over 100 are located.
select distinct city, total_amount
from orders 
join 
customers
on orders.customer_id=customers.customer_id
where total_amount>450;

--8) find the customer who spent the most on orders.
select name, sum(total_amount) AS total_spent
from orders 
join
customers
on orders.customer_id=customers.customer_id
group by customers.customer_id, name
order by total_spent desc
limit 1;

--9) calculate the stock remaining after fulfilling all orders.
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS order_quantity,
		b.stock-COALESCE(SUM(o.quantity),0) AS remaining_quantity 
FROM books b
LEFT JOIN
orders o
ON b.book_id = o.book_id
GROUP BY b.book_id;
