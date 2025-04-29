use company;
select * from books;
select * from customers;
select * from orders;

-- 1) Retrieve all books in the "Fiction" genre:
select * from books where genre="Fiction";

-- 2) Find books published after the year 1950:
select * from books where published_year>1950;

-- 3) List all customers from the Canada:
select * from customers where country='Canada';

-- 4) Show orders placed in November 2023:
select * from orders where order_date between '2023-11-01'and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select sum(stock) as 'Total_Stock' from books;

-- 6) Find the details of the most expensive book:
select * from books order by price desc limit 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from orders where quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders where total_amount>20;

-- 9) List all genres available in the Books table:
select distinct(genre) from books;

-- 10) Find the book with the lowest stock:
select * from books order by stock asc limit 1;

-- 11) Calculate the total revenue generated from all orders:
select sum(total_amount) as Total_Revenue from orders;

-- 12) Retrieve the total number of books sold for each genre:
select * from books;
select * from orders;
select b.genre, sum(o.quantity) as Total_Books_sold from orders o
join books b on b.book_id=o.book_id group by b.genre;

-- 13) Find the average price of books in the "Fantasy" genre:
select avg(price) as Avg_Price from books where genre='Fantasy';

-- 14) List customers who have placed at least 2 orders:
select * from customers;
select * from orders;
select o.customer_id, c.name,count(o.order_id) as ORDER_COUNT
from orders o join customers c on c.customer_id=o.customer_id
group by o.customer_id, c.name having count(o.order_id)>=2;

-- 15) Find the most frequently ordered book:
select * from books;
select * from orders;
select b.book_id, b.title, count(o.order_id) as ORDER_COUNT from orders o
join books b on b.book_id=o.book_id group by b.book_id, b.title order by ORDER_COUNT desc limit 1;


-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books where genre="Fantasy" order by price desc limit 3;


-- 17) Retrieve the total quantity of books sold by each author:
select * from orders;
select * from books;
select b.author, sum(o.quantity) as Total_Books_Sold from orders o 
join books b on o.book_id=b.book_id group by b.author;

-- 18) List the cities where customers who spent over $30 are located:
select * from customers;
select * from orders;
select distinct c.city, o.total_amount from orders o join customers c
on c.customer_id=o.customer_id where o.total_amount>30;

-- 19) Find the customer who spent the most on orders:
select * from customers;
select * from orders;
select c.customer_id, c.name, sum(o.total_amount) as Total_Spent
from orders o join customers c on c.customer_id=o.customer_id group by c.customer_id, c.name
order by Total_Spent desc limit 1;


-- 20) Calculate the stock remaining after fulfilling all orders:
select * from orders;
select * from books;
select b.book_id,b.title,b.stock,coalesce(sum(o.quantity), 0)
as Order_Quantity,b.stock-coalesce(sum(o.quantity), 0) as Remaining_Quantity
from books b left join orders o on b.book_id=o.book_id group by b.book_id, b.title, b.stock;





