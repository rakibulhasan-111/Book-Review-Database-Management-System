-- database project on book review database management system by 1707095

-- drop tables
DROP TABLE Review;
DROP TABLE BookList;
DROP TABLE Writer;
DROP TABLE Store;

--create tables
CREATE TABLE Review(
    ReaderId number(10),
    BookName varchar(20),
    Review varchar(20),
    Rating number(10),
    PRIMARY KEY (ReaderId)
);

CREATE TABLE BookList(
    BookName varchar(20),
    Writer varchar(20),
    Store varchar(20),
    Price number(10),
    PRIMARY KEY (BookName)
);

CREATE TABLE Writer(
    Writer varchar(20),
    BookName varchar(20),
    Store varchar(20),
    PRIMARY KEY (Writer)
);

CREATE TABLE Store(
    Store varchar(20),
    Writer varchar(20),
    BookName varchar(20),
    Address varchar(20),
    PRIMARY KEY (Store)
);

describe Review;
describe BookList;
describe Writer;
describe Store;

ALTER TABLE Store RENAME COLUMN Address TO Location;
ALTER TABLE Review ADD Language varchar(10);

describe Review;
describe BookList;
describe Writer;
describe Store;

INSERT INTO Review VALUES (21001, 'Faluda', 'Great Book', 9, 'Bangla');
INSERT INTO Review VALUES (21002, 'Byomkesh', 'Great Book', 9, 'Bangla');
INSERT INTO Review VALUES (21003, 'Sherlock', 'Great Book', 9, 'English');
INSERT INTO Review VALUES (21004, 'Kakababu', 'Great Book', 7, 'Bangla');
INSERT INTO Review VALUES (21005, 'Himu', 'Great Book', 7, 'Bangla');

SELECT * FROM Review;

INSERT INTO BookList VALUES ('Faluda', 'Shattajit Ray', 'National L.', 350);
INSERT INTO BookList VALUES ('Byomkesh', 'Sharadindu B.', 'National L.', 550);
INSERT INTO BookList VALUES ('Sharlock', 'Sir Aurther C.', 'National L.', 550);
INSERT INTO BookList VALUES ('Kakababu', 'Unknown', 'National L.', 250);
INSERT INTO BookList VALUES ('Himu', 'Humaun Ahmed', 'National L.', 150);

SELECT * FROM BookList;

INSERT INTO Writer VALUES ('Shattajit Ray', 'Prof. Shongku', 'National L.');
INSERT INTO Writer VALUES ('Sharadindu B.', 'Byomkesh', 'National L.');
INSERT INTO Writer VALUES ('Humaun Ahmed', 'Himu, Misir Ali', 'National L.');
INSERT INTO Writer VALUES ('Sir Aurther C.', 'Sherlock', 'National L.');
INSERT INTO Writer VALUES ('Dan Brown', 'ALL', 'National L.');

SELECT * FROM Writer;

INSERT INTO Store VALUES ('National L.', 'Shattajit Ray', 'Faluda', 'Mirpur-14, Dhaka');
INSERT INTO Store VALUES ('SPSC L.', 'Sharadindu B.', 'Byomkesh', 'Mirpur-14, Dhaka');
INSERT INTO Store VALUES ('Dhaka L.', 'Humaun Ahmed', 'Himu, Misir Ali', 'Mirpur-14, Dhaka');
INSERT INTO Store VALUES ('Nikhet L.', 'Dan Brown', 'All', 'Mirpur-14, Dhaka');
INSERT INTO Store VALUES ('Mirpur L.', 'Shattajit Ray', 'Prof. Shangku', 'Mirpur-14, Dhaka');

SELECT * FROM Store;

UPDATE Store SET BookName='All' WHERE Store='Mirpur L.';

SELECT * FROM Store;

SELECT BookName FROM Review ORDER BY Rating;

SELECT MAX(Rating) FROM Review;

SELECT BookName, COUNT(BookName) FROM Review WHERE Rating>7 GROUP BY BookName;

SELECT Store FROM Store WHERE Writer IN (SELECT Writer FROM BookList WHERE BookName IN (SELECT BookName FROM Review WHERE Rating>7));

SELECT BookName FROM Review WHERE Rating>7 UNION SELECT BookName FROM BookList WHERE Price<1000;

SELECT BookName FROM Review WHERE Rating>7 UNION ALL SELECT BookName FROM BookList WHERE Price<1000;

SELECT BookName FROM Review WHERE Rating>7 INTERSECT SELECT BookName FROM BookList WHERE Price<1000;

SELECT BookName FROM Review WHERE Rating>7 MINUS SELECT BookName FROM BookList WHERE Price<1000;

SELECT Review.Rating, BookList.Writer FROM Review JOIN BookList USING(BookName);

