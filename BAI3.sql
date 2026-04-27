-- CREATE DATABASE BOOK_WORM;

USE BOOK_WORM;

CREATE TABLE authors (
	author_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    birth_year YEAR NOT NULL,
    nationality VARCHAR(50) NOT NULL,
    
    -- RÀNG BUỘC
    CONSTRAINT PK_AUTHORS PRIMARY KEY(author_id)
);

CREATE TABLE Books (
	book_id INT AUTO_INCREMENT,
    book_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    author_id INT,
    price DECIMAL(18,1) NOT NULL DEFAULT(0),
    publish_year YEAR NOT NULL,
    
    -- RÀNG BUỘC
    CONSTRAINT PK_Books PRIMARY KEY(book_id),
    CONSTRAINT FK_Books FOREIGN KEY(author_id) REFERENCES authors(author_id) ON DELETE CASCADE,
    CONSTRAINT CK_Books CHECK(price >= 0)
);

CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(10) NOT NULL,
    registration_date TIMESTAMP NOT NULL DEFAULT(CURRENT_TIMESTAMP),
    
    CONSTRAINT PK_customers PRIMARY KEY(customer_id),
    CONSTRAINT UQ_customers_email UNIQUE(email),
    CONSTRAINT UQ_customers_phone UNIQUE(phone)
);


-- THÊM 3 TÁC GIẢ
INSERT INTO authors(full_name,birth_year,nationality)
VALUES
('Lê Hà Thanh Sang', 2000, 'Africa'),
('Lê Phước Lộc', 2007, 'VietNam'),
('Trần Quốc Tuấn', 2003,'Angola');

-- Thêm 8 quyển sách

INSERT INTO books(book_name,category,author_id,price,publish_year)
VALUES
('Dế Mèn Phiêu Lưu Ký', 'Văn học', 1, 50.0, 1941),
('Sherlock Holmes Toàn Tập', 'Trinh thám', 2, 120.0, 1901),
('Đắc Nhân Tâm', 'Kỹ năng', 2, 80.0, 1936),
('Nhà Giả Kim', 'Tiểu thuyết', 1, 90.0, 1988),
('Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Kỹ năng', 3, 70.0, 2016),
('Harry Potter và Hòn Đá Phù Thủy', 'Fantasy', 1, 150.0, 1997),
('Bố Già', 'Tiểu thuyết', 2, 110.0, 1969),
('Không Gia Đình', 'Văn học', 3, 95.0, 1901);

-- thêm 5 khách hàng
INSERT INTO customers(full_name,email,phone)
VALUES
('Nguyễn Văn A', 'a@gmail.com', '0900000001'),
('Trần Thị B', 'b@gmail.com', '0900000002'),
('Lê Văn C', 'c@gmail.com', '0900000003'),
('Phạm Thị D', 'd@gmail.com', '0900000004'),
('Hoàng Văn E', 'e@gmail.com', '0900000005');

-- KHÁCH HÀNG TRÙNG EMAIL
-- ('Nguyễn Văn F', 'a@gmail.com', '0900000006');

-- GIẢI THÍCH CỘT email đã được em thiết lập constraint UNIQUE, có nghĩa là khi insert giá trị đó vào 1 lần rồi, mà insert lần 2 thì nó sẽ báo lỗi
-- giống như thầy yêu của em vậy trên đời làm gì có thầy Sang thứ 2, mà có thì chắc là sẽ lỗi liền :))


-- bài 3 ngày 3

-- In ra danh sách các cuốn sách thuộc thể loại "Trinh thám" CÓ giá bán dưới 100.000đ.

SELECT * FROM Books 
WHERE category = 'Trinh thám' AND price < 100000;

-- Tìm những khách hàng sử dụng email của Google.
SELECT * FROM customers
WHERE email LIKE '%@gmail.com';


-- Lấy ra top 3 cuốn sách đắt tiền nhất trong cửa hàng.
SELECT book_name, price FROM books
ORDER BY price DESC
LIMIT 3;

-- Nhân dịp lễ lớn, nhà sách giảm giá 10% cho TẤT CẢ sách được xuất bản trước năm 2020. Hãy viết lệnh để thực hiện việc cập nhật giá đồng loạt.
SET SQL_SAFE_UPDATES = 0;

UPDATE Books
SET price = price * 0.9;
