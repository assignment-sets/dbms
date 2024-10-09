-- i
-- Create AUTHOR table
CREATE TABLE AUTHOR (
    author_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Create PUBLISHER table
CREATE TABLE PUBLISHER (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Create CATEGORY table
CREATE TABLE CATEGORY (
    category_id INT PRIMARY KEY,
    description VARCHAR(100)
);

-- Create CATLOG table (corrected to have category_id)
CREATE TABLE CATLOG (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
    publisher_id INT,
    category_id INT,
    year INT,
    price INT,
    FOREIGN KEY (author_id) REFERENCES AUTHOR(author_id),
    FOREIGN KEY (publisher_id) REFERENCES PUBLISHER(publisher_id),
    FOREIGN KEY (category_id) REFERENCES CATEGORY(category_id)
);

-- Create ORDER_DETAILS table
CREATE TABLE ORDER_DETAILS (
    order_no INT PRIMARY KEY,
    book_id INT,
    quantity INT,
    FOREIGN KEY (book_id) REFERENCES CATLOG(book_id)
);

-- ii
insert all
INTO AUTHOR (author_id, name, city, country) VALUES (1, 'J.K. Rowling', 'Edinburgh', 'UK')
INTO AUTHOR (author_id, name, city, country) VALUES (2, 'George R.R. Martin', 'Bayonne', 'USA')
INTO AUTHOR (author_id, name, city, country) VALUES (3, 'J.R.R. Tolkien', 'Bloemfontein', 'South Africa')
INTO AUTHOR (author_id, name, city, country) VALUES (4, 'Agatha Christie', 'Torquay', 'UK')
INTO AUTHOR (author_id, name, city, country) VALUES (5, 'Isaac Asimov', 'Petrovichi', 'Russia')
select * from dual;

INSERT ALL
    INTO PUBLISHER (publisher_id, name, city, country) VALUES (1, 'Bloomsbury', 'London', 'UK')
    INTO PUBLISHER (publisher_id, name, city, country) VALUES (2, 'Bantam Books', 'New York', 'USA')
    INTO PUBLISHER (publisher_id, name, city, country) VALUES (3, 'HarperCollins', 'New York', 'USA')
    INTO PUBLISHER (publisher_id, name, city, country) VALUES (4, 'Penguin Random House', 'New York', 'USA')
    INTO PUBLISHER (publisher_id, name, city, country) VALUES (5, 'Macmillan', 'London', 'UK')
SELECT * FROM dual;

INSERT ALL
    INTO CATEGORY (category_id, description) VALUES (1, 'Fantasy')
    INTO CATEGORY (category_id, description) VALUES (2, 'Science Fiction')
    INTO CATEGORY (category_id, description) VALUES (3, 'Mystery')
    INTO CATEGORY (category_id, description) VALUES (4, 'Horror')
    INTO CATEGORY (category_id, description) VALUES (5, 'Biography')
SELECT * FROM dual;

INSERT ALL
    INTO CATLOG (book_id, title, author_id, publisher_id, category_id, year, price) VALUES (1, 'Harry Potter and the Philosophers Stone', 1, 1, 1, 1997, 20)
    INTO CATLOG (book_id, title, author_id, publisher_id, category_id, year, price) VALUES (2, 'A Game of Thrones', 2, 2, 1, 1996, 25)
    INTO CATLOG (book_id, title, author_id, publisher_id, category_id, year, price) VALUES (3, 'The Hobbit', 3, 3, 1, 1937, 15)
    INTO CATLOG (book_id, title, author_id, publisher_id, category_id, year, price) VALUES (4, 'Murder on the Orient Express', 4, 4, 3, 1934, 10)
    INTO CATLOG (book_id, title, author_id, publisher_id, category_id, year, price) VALUES (5, 'I, Robot', 5, 5, 2, 1950, 18)
SELECT * FROM dual;

INSERT ALL
    INTO ORDER_DETAILS (order_no, book_id, quantity) VALUES (1, 1, 2)
    INTO ORDER_DETAILS (order_no, book_id, quantity) VALUES (2, 2, 1)
    INTO ORDER_DETAILS (order_no, book_id, quantity) VALUES (3, 3, 4)
    INTO ORDER_DETAILS (order_no, book_id, quantity) VALUES (4, 4, 3)
    INTO ORDER_DETAILS (order_no, book_id, quantity) VALUES (5, 5, 5)
SELECT * FROM dual;

-- iii
select * from author where author_id in (
    select author_id from (
        select author_id, count(*) as cnt from (
            select * from catlog where
            price > (select avg(price) from catlog ) and 
            year > 2010
        ) group by author_id
    ) where cnt > 1
)
-- no data found

-- iv
select name as auth_name from author where author_id in (
    select author_id from catlog where book_id in (
        select book_id from (
            select book_id, sum(quantity) as orders from ORDER_DETAILS group by book_id
        ) a
        where a.orders = (
            select max(orders) from (
                select book_id, sum(quantity) as orders from ORDER_DETAILS group by book_id
            )
        )               
    )
)

-- v
update catlog
set price = price*1.1
where publisher_id = 2
-- statement processed