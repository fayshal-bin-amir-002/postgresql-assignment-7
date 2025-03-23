-- create a database named "bookstore_db"
CREATE DATABASE bookstore_db;

-- create table named "books"
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) check (price > 0) NOT NULL,
  stock INT NOT NULL,
  published_year VARCHAR(255) NOT NULL
);


-- create table named "customers"
CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  joined_date DATE DEFAULT CURRENT_DATE
);

-- create table named "orders"
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER NOT NULL REFERENCES customers(id) on delete CASCADE,
  book_id INTEGER NOT NULL REFERENCES books(id) on delete CASCADE,
  quantity INT check (quantity > 0) NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- insert data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
  ('To Kill a Mockingbird', 'Harper Lee', 12.99, 50, '1960'),
  ('1984', 'George Orwell', 14.50, 30, '1949'),
  ('Pride and Prejudice', 'Jane Austen', 9.99, 40, '1813'),
  ('The Great Gatsby', 'F. Scott Fitzgerald', 10.99, 0, '1925'),
  ('Moby-Dick', 'Herman Melville', 15.75, 15, '1851'),
  ('War and Peace', 'Leo Tolstoy', 20.00, 10, '1869'),
  ('The Catcher in the Rye', 'J.D. Salinger', 13.25, 35, '1951'),
  ('The Hobbit', 'J.R.R. Tolkien', 18.99, 20, '1937'),
  ('Fahrenheit 451', 'Ray Bradbury', 11.50, 45, '1953'),
  ('Brave New World', 'Aldous Huxley', 13.99, 38, '1932'),
  ('The Lord of the Rings', 'J.R.R. Tolkien', 25.00, 0, '1954'),
  ('The Alchemist', 'Paulo Coelho', 16.50, 50, '1988'),
  ('Crime and Punishment', 'Fyodor Dostoevsky', 14.25, 18, '1866'),
  ('The Divine Comedy', 'Dante Alighieri', 22.50, 8, '1320'),
  ('Les Misérables', 'Victor Hugo', 19.99, 14, '1862'),
  ('Dracula', 'Bram Stoker', 12.75, 33, '1897'),
  ('The Odyssey', 'Homer', 17.50, 22, '1971'),
  ('Don Quixote', 'Miguel de Cervantes', 21.00, 0, '1605'),
  ('Frankenstein', 'Mary Shelley', 10.99, 27, '1818'),
  ('The Picture of Dorian Gray', 'Oscar Wilde', 11.25, 31, '1890');


-- insert data into customers table
INSERT INTO customers (name, email) VALUES
  ('John Doe', 'johndoe@example.com'),
  ('Jane Smith', 'janesmith@example.com'),
  ('Alice Johnson', 'alicejohnson@example.com'),
  ('Robert Brown', 'robertbrown@example.com'),
  ('Emily Davis', 'emilydavis@example.com'),
  ('Michael Wilson', 'michaelwilson@example.com'),
  ('Sarah Miller', 'sarahmiller@example.com'),
  ('David Anderson', 'davidanderson@example.com'),
  ('Laura Thomas', 'laurathomas@example.com'),
  ('James White', 'jameswhite@example.com');


INSERT INTO orders (customer_id, book_id, quantity) VALUES
  (1, 2, 3),
  (2, 5, 1),
  (3, 7, 2),
  (4, 1, 4),
  (1, 3, 5),  
  (5, 3, 2), 
  (6, 8, 2),
  (7, 4, 6),
  (2, 10, 3), 
  (8, 6, 1);


-- 1️⃣ Find books that are out of stock.
SELECT * FROM books
  WHERE stock = 0;

-- 2️⃣ Retrieve the most expensive book in the store.
SELECT * FROM books
  ORDER BY price DESC
  LIMIT 1;


-- 3️⃣ Find the total number of orders placed by each customer.
SELECT name, count(*) as total_orders from customers
  JOIN orders ON customers.id = orders.customer_id
  GROUP BY name;

-- 4️⃣ Calculate the total revenue generated from book sales.
SELECT sum(orders.quantity * books.price) as total_revenue FROM orders
  JOIN books on books.id = orders.book_id;

-- 5️⃣ List all customers who have placed more than one order.
SELECT name, count(*) as orders_count FROM customers
  JOIN orders on orders.customer_id = customers.id
  GROUP BY name;

-- 6️⃣ Find the average price of books in the store.
SELECT round(avg(price), 2) as avg_book_price FROM books;

-- 7️⃣ Increase the price of all books published before 2000 by 10%.
UPDATE books
  SET price = price + ((price * 10) / 100)
  WHERE published_year::INTEGER < 2000;

-- 8️⃣ Delete customers who haven't placed any orders.
DELETE FROM customers
  WHERE id NOT IN (
    SELECT customer_id FROM orders
      GROUP BY customer_id ORDER BY customer_id
  );




