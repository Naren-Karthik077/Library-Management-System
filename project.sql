CREATE TABLE publishers (
    publisher_id VARCHAR(4) CONSTRAINT pbpk PRIMARY KEY,
    publisher_name VARCHAR(30),
    phone_no NUMBER(10),
    address VARCHAR(30)
);


CREATE TABLE supplier (
    supplier_id VARCHAR(4) CONSTRAINT spk PRIMARY KEY,
    supplier_name VARCHAR(30),
    contact_info NUMBER(10),
    book_id varchar(4) references books(book_id) on delete cascade
);


CREATE TABLE books (
    book_id VARCHAR(4) CONSTRAINT bpk PRIMARY KEY,
    title VARCHAR(50),
    author VARCHAR(30),
    status VARCHAR(10),
    no_of_copies INT,
    edition NUMBER(10),
    publisher_id VARCHAR(4) REFERENCES publishers(publisher_id) ON DELETE CASCADE,
    published_yr NUMBER(4),
    isbn VARCHAR(15),
    genre CHAR(30)
);



CREATE TABLE librarian (
    librarian_id VARCHAR(4) CONSTRAINT lpk PRIMARY KEY,
    librarian_name VARCHAR(40),
    contact_info_l NUMBER(10)
);


CREATE TABLE member_status (
    membership_id VARCHAR(4) CONSTRAINT mpk PRIMARY KEY,
    type VARCHAR(20),
    duration NUMBER(3),
    fee INT,
    m_status VARCHAR(10)
);





CREATE TABLE users (
    user_id VARCHAR(4) CONSTRAINT upk PRIMARY KEY,
    user_name VARCHAR(40),
    email VARCHAR(40),
    contact_info_u NUMBER(10),
    membership_id VARCHAR(4) REFERENCES member_status(membership_id) ON DELETE CASCADE,
    librarian_id VARCHAR(4) REFERENCES librarian(librarian_id) ON DELETE CASCADE
);







CREATE TABLE reservation (
    reservation_id VARCHAR(10) CONSTRAINT rpk PRIMARY KEY,
    reservation_date DATE,
    user_id VARCHAR(4) REFERENCES users(user_id) ON DELETE CASCADE,
    book_id VARCHAR(4) REFERENCES books(book_id) ON DELETE CASCADE
);



CREATE TABLE reservation_status (
    reservation_id VARCHAR(10) REFERENCES reservation(reservation_id) ON DELETE CASCADE,
    r_status VARCHAR(10),
    PRIMARY KEY (reservation_id)
);



CREATE TABLE book_records (
    checkout_id VARCHAR(5) CONSTRAINT bkpk PRIMARY KEY,
    b_status VARCHAR(10),
    checkout_date DATE,
    return_date DATE,
    due_date DATE,
    user_id VARCHAR(4) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO publishers VALUES ('P001', 'HarperCollins', 1234567890, '123 Main St, Anytown');
INSERT INTO publishers VALUES ('P002', 'Penguin Books', 9876543210, '456 Elm St, Another City');
INSERT INTO publishers VALUES ('P003', 'Random House', 5551234567, '789 Oak Ave, Somewhere');
INSERT INTO publishers VALUES ('P004', 'Scholastic', 9998887777, '321 Pine Rd, Nowhere');
INSERT INTO publishers VALUES ('P005', 'Simon and Schuster', 1112223333, '654 Maple Dr, Elsewhere');
INSERT INTO publishers VALUES ('P006', 'Macmillan Publishers', 4445556666, '876 Cedar Ln, Anytown');
INSERT INTO publishers VALUES ('P007', 'Hachette Book Group', 7778889999, '234 Elm St, Another City');
INSERT INTO publishers VALUES ('P008', 'Oxford University Press', 8889990000, '567 Oak Ave, Somewhere');
INSERT INTO publishers VALUES ('P009', 'Pearson Education', 3334445555, '432 Pine Rd, Nowhere');
INSERT INTO publishers VALUES ('P010', 'Bloomsbury Publishing', 6667778888, '765 Maple Dr, Elsewhere');
INSERT INTO publishers VALUES ('P011', 'Wiley', 2223334444, '345 Cedar Ln, Anytown');
INSERT INTO publishers VALUES ('P012', 'Harvard University Press', 9990001111, '678 Elm St, Another City');
INSERT INTO publishers VALUES ('P013', 'Cambridge University Press', 1112223333, '987 Oak Ave, Somewhere');
INSERT INTO publishers VALUES ('P014', 'Houghton Mifflin Harcourt', 4445556666, '210 Pine Rd, Nowhere');
INSERT INTO publishers VALUES ('P015', 'Disney Publishing Worldwide', 7778889999, '543 Maple Dr, Elsewhere');
INSERT INTO publishers VALUES ('P016', 'Marvel Comics', 8889990000, '876 Cedar Ln, Anytown');
INSERT INTO publishers VALUES ('P017', 'DC Comics', 3334445555, '321 Elm St, Another City');
INSERT INTO publishers VALUES ('P018', 'National Geographic', 6667778888, '654 Oak Ave, Somewhere');
INSERT INTO publishers VALUES ('P019', 'Puffin Books', 2223334444, '987 Pine Rd, Nowhere');
INSERT INTO publishers VALUES ('P020', 'Usborne Publishing', 9990001111, '210 Maple Dr, Elsewhere');

INSERT INTO supplier VALUES ('S001', 'Supplier A', 1234567890, 'B001');
INSERT INTO supplier VALUES ('S002', 'Supplier B', 2345678901, 'B002');
INSERT INTO supplier VALUES ('S003', 'Supplier C', 3456789012, 'B003');
INSERT INTO supplier VALUES ('S004', 'Supplier D', 4567890123, 'B004');
INSERT INTO supplier VALUES ('S005', 'Supplier E', 5678901234, 'B005');
INSERT INTO supplier VALUES ('S006', 'Supplier F', 6789012345, 'B006');
INSERT INTO supplier VALUES ('S007', 'Supplier G', 7890123456, 'B007');
INSERT INTO supplier VALUES ('S008', 'Supplier H', 8901234567, 'B008');
INSERT INTO supplier VALUES ('S009', 'Supplier I', 9012345678, 'B009');
INSERT INTO supplier VALUES ('S010', 'Supplier J', 1234567890, 'B010');
INSERT INTO supplier VALUES ('S011', 'Supplier K', 2345678901, 'B011');
INSERT INTO supplier VALUES ('S012', 'Supplier L', 3456789012, 'B012');
INSERT INTO supplier VALUES ('S013', 'Supplier M', 4567890123, 'B013');
INSERT INTO supplier VALUES ('S014', 'Supplier N', 5678901234, 'B014');
INSERT INTO supplier VALUES ('S015', 'Supplier O', 6789012345, 'B015');
INSERT INTO supplier VALUES ('S016', 'Supplier P', 7890123456, 'B016');
INSERT INTO supplier VALUES ('S017', 'Supplier Q', 8901234567, 'B017');
INSERT INTO supplier VALUES ('S018', 'Supplier R', 9012345678, 'B018');
INSERT INTO supplier VALUES ('S019', 'Supplier S', 1234567890, 'B019');
INSERT INTO supplier VALUES ('S020', 'Supplier T', 2345678901, 'B020');


REM:BOOKS
INSERT INTO books  VALUES ('B001', 'The Catcher in the Rye', 'J.D. Salinger', 'AVL', 50, 1, 'P001', 1951, '9780316769488', 'Fiction');

INSERT INTO books  VALUES ('B002', 'To Kill a Mockingbird', 'Harper Lee', 'AVL', 30, 2, 'P002', 1960, '9780061120084', 'Fiction');

INSERT INTO books VALUES ('B003', '1984', 'George Orwell', 'AVL', 40, 1, 'P003', 1949, '9780451524935', 'Sci-Fi');

INSERT INTO books VALUES ('B004', 'Pride and Prejudice', 'Jane Austen', 'AVL', 25, 3, 'P004', 1813, '9780141439518', 'Classic');

INSERT INTO books VALUES ('B005', 'The Hobbit', 'J.R.R. Tolkien', 'AVL', 35, 2, 'P005', 1937, '9780618260300', 'Fantasy');

INSERT INTO books VALUES ('B006', 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'AVL', 60, 1, 'P001', 1997, '9780747532743', 'Fantasy');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B007', 'The Great Gatsby', 'F. Scott Fitzgerald', 'AVL', 20, 2, 'P002', 1925, '9780743273565', 'Classic');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B008', 'Moby-Dick', 'Herman Melville', 'AVL', 15, 1, 'P003', 1851, '9780142437247', 'Adventure');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B009', 'The Lord of the Rings', 'J.R.R. Tolkien', 'AVL', 30, 3, 'P005', 1954, '9780544003415', 'Fantasy');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B010', 'Brave New World', 'Aldous Huxley', 'AVL', 25, 1, 'P001', 1932, '9780060850524', 'Sci-Fi');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B011', 'The Book Thief', 'Markus Zusak', 'AVL', 40, 1, 'P002', 2005, '9780375831003', 'Historical');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B012', 'Frankenstein', 'Mary Shelley', 'AVL', 20, 2, 'P003', 1818, '9780486282114', 'Gothic');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B013', 'Alice''s Adventures in Wonderland', 'Lewis Carroll', 'AVL', 30, 3, 'P004', 1865, '9780141439761', 'Fantasy');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B014', 'Crime and Punishment', 'Fyodor Dostoevsky', 'AVL', 15, 1, 'P005', 1866, '9780143058142', 'Psychological');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B015', 'The Odyssey', 'Homer', 'AVL', 25, 2, 'P001', 800, '9780140268867', 'Epic');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B016', 'The Road', 'Cormac McCarthy', 'AVL', 20, 1, 'P002', 2006, '9780307387899', 'Post-Apocalyptic');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B017', 'War and Peace', 'Leo Tolstoy', 'AVL', 35, 4, 'P003', 1869, '9780199232765', 'Historical');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B018', 'Slaughterhouse-Five', 'Kurt Vonnegut', 'AVL', 25, 2, 'P004', 1969, '9780440180296', 'Science Fiction');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B019', 'Jane Eyre', 'Charlotte Bronte', 'AVL', 30, 3, 'P005', 1847, '9780141441146', 'Gothic');

INSERT INTO books (book_id, title, author, status, no_of_copies, edition, publisher_id, published_yr, isbn, genre) 
VALUES ('B020', 'The Picture of Dorian Gray', 'Oscar Wilde', 'AVL', 20, 2, 'P006', 1890, '9780141442464', 'Gothic');




-- Inserting values into librarian table
INSERT INTO librarian VALUES ('L001', 'John Doe', 1234567890);
INSERT INTO librarian VALUES ('L002', 'Jane Smith', 9876543210);
INSERT INTO librarian VALUES ('L003', 'Michael Johnson', 5551234567);
INSERT INTO librarian VALUES ('L004', 'Emily Brown', 9998887776);
INSERT INTO librarian VALUES ('L005', 'David Wilson', 1112223334);
INSERT INTO librarian VALUES ('L006', 'Sarah Taylor', 6665554443);
INSERT INTO librarian VALUES ('L007', 'Robert Martinez', 7776665552);
INSERT INTO librarian VALUES ('L008', 'Jennifer Davis', 4443332221);
INSERT INTO librarian VALUES ('L009', 'Daniel Garcia', 8889990000);
INSERT INTO librarian VALUES ('L010', 'Jessica Rodriguez', 2221110009);
INSERT INTO librarian VALUES ('L011', 'William Moore', 3332221118);
INSERT INTO librarian VALUES ('L012', 'Amanda Hernandez', 7778889997);
INSERT INTO librarian VALUES ('L013', 'Matthew Lopez', 1110008886);
INSERT INTO librarian VALUES ('L014', 'Laura Gonzalez', 6667778885);
INSERT INTO librarian VALUES ('L015', 'Christopher Perez', 5554443334);
INSERT INTO librarian VALUES ('L016', 'Ashley Sanchez', 9990001113);
INSERT INTO librarian VALUES ('L017', 'Joshua Torres', 3334445552);
INSERT INTO librarian VALUES ('L018', 'Megan Ramirez', 8887776661);
INSERT INTO librarian VALUES ('L019', 'Kevin Flores', 2223334440);
INSERT INTO librarian VALUES ('L020', 'Kimberly Rivera', 4445556669);


REM:member_status




insert into member_status values    ('M001', 'Regular', 12, 50, 'Active');
insert into member_status values    ('M002', 'Premium', 24, 100, 'Active');
insert into member_status values    ('M003', 'Student', 6, 25, 'Active');
insert into member_status values    ('M004', 'Senior Citizen', 18, 40, 'Inactive');
insert into member_status values    ('M005', 'Family', 36, 150, 'Active');
insert into member_status values    ('M006', 'VIP', 24, 200, 'Active');
insert into member_status values    ('M007', 'Basic', 6, 20, 'Active');
insert into member_status values    ('M008', 'Gold', 12, 120, 'Active');
insert into member_status values    ('M009', 'Corporate', 36, 250, 'Active');
insert into member_status values    ('M010', 'Lifetime', 999, 500, 'Active');
insert into member_status values    ('M011', 'Temporary', 3, 15, 'Active');
insert into member_status values    ('M012', 'Bronze', 12, 75, 'Active');
insert into member_status values    ('M013', 'Silver', 24, 150, 'Active');
insert into member_status values    ('M014', 'Platinum', 36, 300, 'Active');
insert into member_status values    ('M015', 'Individual', 12, 60, 'Active');
insert into member_status values    ('M016', 'Family Plus', 36, 200, 'Active');
insert into member_status values    ('M017', 'Executive', 24, 180, 'Active');
insert into member_status values    ('M018', 'Scholar', 6, 15, 'Active');
insert into member_status values    ('M019', 'Part-time', 12, 30, 'Active');
insert into member_status values    ('M020', 'Special', 3, 10, 'Active');



REM:user

insert into users values    ('U001', 'John Doe', 'john.doe@example.com', 5551234567, 'M001', 'L001');
insert into users values    ('U002', 'Jane Smith', 'jane.smith@example.com', 9876543210, 'M002', 'L002');
insert into users values    ('U003', 'Michael Brown', 'michael.brown@example.com', 3334445555, 'M003', 'L003');
insert into users values    ('U004', 'Emily Davis', 'emily.davis@example.com', 9998887777, 'M004', 'L004');
insert into users values    ('U005', 'Chris Wilson', 'chris.wilson@example.com', 1112223333, 'M005', 'L005');
insert into users values    ('U006', 'Sarah Johnson', 'sarah.johnson@example.com', 7777777777, 'M001', 'L001');
insert into users values    ('U007', 'David Garcia', 'david.garcia@example.com', 8888888888, 'M002', 'L002');
insert into users values    ('U008', 'Jennifer Martinez', 'jennifer.martinez@example.com', 6666666666, 'M003', 'L003');
insert into users values    ('U009', 'James Robinson', 'james.robinson@example.com', 5555555555, 'M004', 'L004');
insert into users values    ('U010', 'Jessica Clark', 'jessica.clark@example.com', 4444444444, 'M005', 'L005');
insert into users values    ('U011', 'Matthew Hernandez', 'matthew.hernandez@example.com', 3333333333, 'M001', 'L001');
insert into users values    ('U012', 'Elizabeth Thompson', 'elizabeth.thompson@example.com', 2222222222, 'M002', 'L002');
insert into users values    ('U013', 'Daniel Lewis', 'daniel.lewis@example.com', 1111111111, 'M003', 'L003');
insert into users values    ('U014', 'Megan Walker', 'megan.walker@example.com', 9999999999, 'M004', 'L004');
insert into users values    ('U015', 'Ryan Hall', 'ryan.hall@example.com', 8888888888, 'M005', 'L005');
insert into users values    ('U016', 'Kimberly Young', 'kimberly.young@example.com', 7777777777, 'M001', 'L001');
insert into users values    ('U017', 'Andrew King', 'andrew.king@example.com', 6666666666, 'M002', 'L002');
insert into users values    ('U018', 'Lauren Scott', 'lauren.scott@example.com', 5555555555, 'M003', 'L003');
insert into users values    ('U019', 'Kevin Green', 'kevin.green@example.com', 4444444444, 'M004', 'L004');
insert into users values    ('U020', 'Rachel Adams', 'rachel.adams@example.com', 3333333333, 'M005', 'L005');



-- Sample insert statements for reservation table
insert into reservation values ('RES001', TO_DATE('15-06-2024', 'DD-MM-YYYY'), 'U001', 'B001');
insert into reservation values ('RES002', TO_DATE('20-06-2024', 'DD-MM-YYYY'), 'U002', 'B002');
insert into reservation values ('RES003', TO_DATE('25-06-2024', 'DD-MM-YYYY'), 'U003', 'B003');
insert into reservation values ('RES004', TO_DATE('30-06-2024', 'DD-MM-YYYY'), 'U004', 'B004');
insert into reservation values ('RES005', TO_DATE('05-07-2024', 'DD-MM-YYYY'), 'U005', 'B005');
insert into reservation values ('RES006', TO_DATE('10-07-2024', 'DD-MM-YYYY'), 'U006', 'B006');
insert into reservation values ('RES007', TO_DATE('15-07-2024', 'DD-MM-YYYY'), 'U007', 'B007');
insert into reservation values ('RES008', TO_DATE('20-07-2024', 'DD-MM-YYYY'), 'U008', 'B008');
insert into reservation values ('RES009', TO_DATE('25-07-2024', 'DD-MM-YYYY'), 'U009', 'B009');
insert into reservation values ('RES010', TO_DATE('30-07-2024', 'DD-MM-YYYY'), 'U010', 'B010');
insert into reservation values ('RES011', TO_DATE('05-08-2024', 'DD-MM-YYYY'), 'U011', 'B011');
insert into reservation values ('RES012', TO_DATE('10-08-2024', 'DD-MM-YYYY'), 'U012', 'B012');
insert into reservation values ('RES013', TO_DATE('15-08-2024', 'DD-MM-YYYY'), 'U013', 'B013');
insert into reservation values ('RES014', TO_DATE('20-08-2024', 'DD-MM-YYYY'), 'U014', 'B014');
insert into reservation values ('RES015', TO_DATE('25-08-2024', 'DD-MM-YYYY'), 'U015', 'B015');
insert into reservation values ('RES016', TO_DATE('30-08-2024', 'DD-MM-YYYY'), 'U016', 'B016');
insert into reservation values ('RES017', TO_DATE('05-09-2024', 'DD-MM-YYYY'), 'U017', 'B017');
insert into reservation values ('RES018', TO_DATE('10-09-2024', 'DD-MM-YYYY'), 'U018', 'B018');
insert into reservation values ('RES019', TO_DATE('15-09-2024', 'DD-MM-YYYY'), 'U019', 'B019');
insert into reservation values ('RES020', TO_DATE('20-09-2024', 'DD-MM-YYYY'), 'U020', 'B020');



REM:reservation_status

insert into reservation_status  values  ('RES001', 'Pending');
insert into reservation_status values    ('RES002', 'Confirmed');
insert into reservation_status values    ('RES003', 'Cancelled');
insert into reservation_status values    ('RES004', 'Pending');
insert into reservation_status values    ('RES005', 'Confirmed');
insert into reservation_status values    ('RES006', 'Pending');
insert into reservation_status values    ('RES007', 'Confirmed');
insert into reservation_status values    ('RES008', 'Pending');
insert into reservation_status values    ('RES009', 'Confirmed');
insert into reservation_status values    ('RES010', 'Pending');
insert into reservation_status values    ('RES011', 'Pending');
insert into reservation_status values    ('RES012', 'Confirmed');
insert into reservation_status values    ('RES013', 'Pending');
insert into reservation_status values    ('RES014', 'Confirmed');
insert into reservation_status  values   ('RES015', 'Pending');
insert into reservation_status  values   ('RES016', 'Confirmed');
insert into reservation_status  values   ('RES017', 'Pending');
insert into reservation_status  values   ('RES018', 'Confirmed');
insert into reservation_status  values   ('RES019', 'Pending');
insert into reservation_status  values   ('RES020', 'Confirmed');







REM:BOOK_RECORDS
INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR021', 'CHK', TO_DATE('05-07-2024', 'DD-MM-YYYY'), TO_DATE('05-08-2024', 'DD-MM-YYYY'), TO_DATE('20-08-2024', 'DD-MM-YYYY'), 'U001');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR022', 'CHK', TO_DATE('06-07-2024', 'DD-MM-YYYY'), TO_DATE('06-08-2024', 'DD-MM-YYYY'), TO_DATE('21-08-2024', 'DD-MM-YYYY'), 'U002');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR023', 'CHK', TO_DATE('07-07-2024', 'DD-MM-YYYY'), TO_DATE('07-08-2024', 'DD-MM-YYYY'), TO_DATE('22-08-2024', 'DD-MM-YYYY'), 'U003');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR024', 'AVL', TO_DATE('08-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U004');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR025', 'CHK', TO_DATE('09-07-2024', 'DD-MM-YYYY'), TO_DATE('09-08-2024', 'DD-MM-YYYY'), TO_DATE('24-08-2024', 'DD-MM-YYYY'), 'U005');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR026', 'CHK', TO_DATE('10-07-2024', 'DD-MM-YYYY'), TO_DATE('10-08-2024', 'DD-MM-YYYY'), TO_DATE('25-08-2024', 'DD-MM-YYYY'), 'U006');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR027', 'AVL', TO_DATE('11-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U007');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR028', 'CHK', TO_DATE('12-07-2024', 'DD-MM-YYYY'), TO_DATE('12-08-2024', 'DD-MM-YYYY'), TO_DATE('27-08-2024', 'DD-MM-YYYY'), 'U008');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR029', 'CHK', TO_DATE('13-07-2024', 'DD-MM-YYYY'), TO_DATE('13-08-2024', 'DD-MM-YYYY'), TO_DATE('28-08-2024', 'DD-MM-YYYY'), 'U009');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR030', 'AVL', TO_DATE('14-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U010');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR031', 'CHK', TO_DATE('15-07-2024', 'DD-MM-YYYY'), TO_DATE('15-08-2024', 'DD-MM-YYYY'), TO_DATE('30-08-2024', 'DD-MM-YYYY'), 'U011');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR032', 'CHK', TO_DATE('16-07-2024', 'DD-MM-YYYY'), TO_DATE('16-08-2024', 'DD-MM-YYYY'), TO_DATE('31-08-2024', 'DD-MM-YYYY'), 'U012');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR033', 'AVL', TO_DATE('17-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U013');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR034', 'CHK', TO_DATE('18-07-2024', 'DD-MM-YYYY'), TO_DATE('18-08-2024', 'DD-MM-YYYY'), TO_DATE('02-09-2024', 'DD-MM-YYYY'), 'U014');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR035', 'CHK', TO_DATE('19-07-2024', 'DD-MM-YYYY'), TO_DATE('19-08-2024', 'DD-MM-YYYY'), TO_DATE('03-09-2024', 'DD-MM-YYYY'), 'U015');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR036', 'AVL', TO_DATE('20-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U016');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR037', 'CHK', TO_DATE('21-07-2024', 'DD-MM-YYYY'), TO_DATE('21-08-2024', 'DD-MM-YYYY'), TO_DATE('05-09-2024', 'DD-MM-YYYY'), 'U017');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR038', 'CHK', TO_DATE('22-07-2024', 'DD-MM-YYYY'), TO_DATE('22-08-2024', 'DD-MM-YYYY'), TO_DATE('06-09-2024', 'DD-MM-YYYY'), 'U018');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR039', 'AVL', TO_DATE('23-07-2024', 'DD-MM-YYYY'), NULL, NULL, 'U019');

INSERT INTO book_records (checkout_id, b_status, checkout_date, return_date, due_date, user_id) 
VALUES ('BR040', 'CHK', TO_DATE('24-07-2024', 'DD-MM-YYYY'), TO_DATE('24-08-2024', 'DD-MM-YYYY'), TO_DATE('09-09-2024', 'DD-MM-YYYY'), 'U020');












