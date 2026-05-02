-- ======================
-- THÊM DỮ LIỆU MOVIES
-- ======================
INSERT INTO movies (title, duration_minutes, age_restriction) VALUES
('Avengers: Secret Wars', 150, 13),
('Fast & Furious 11', 140, 16),
('The Nun 2', 110, 18), -- phim 18+
('Kung Fu Panda 4', 95, 0);

-- ======================
-- THÊM DỮ LIỆU ROOMS
-- ======================
INSERT INTO rooms (name, max_seats, status) VALUES
('Phòng 1', 100, 'active'),
('Phòng 2', 80, 'active'),
('Phòng 3', 120, 'maintenance'); -- phòng bảo trì

-- ======================
-- THÊM SHOWTIMES
-- (KHÔNG dùng phòng 3 vì đang bảo trì)
-- ======================
INSERT INTO showtimes (movie_id, room_id, show_time, ticket_price) VALUES
(1, 1, '2026-05-02 09:00:00', 80000),
(2, 1, '2026-05-02 12:00:00', 90000),
(3, 2, '2026-05-02 15:00:00', 100000),
(4, 2, '2026-05-02 18:00:00', 85000),
(1, 2, '2026-05-02 21:00:00', 95000);

-- ======================
-- THÊM BOOKINGS (10 vé)
-- ======================
INSERT INTO bookings (showtime_id, customer_name, phone, booking_date) VALUES
(1, 'Nguyen Van A', '0900000001', NOW()),
(1, 'Tran Thi B', '0900000002', NOW()),
(2, 'Le Van C', '0900000003', NOW()),
(2, 'Pham Thi D', '0900000004', NOW()),
(3, 'Hoang Van E', '0900000005', NOW()),
(3, 'Vo Thi F', '0900000006', NOW()),
(4, 'Dang Van G', '0900000007', NOW()),
(4, 'Bui Thi H', '0900000008', NOW()),
(5, 'Do Van I', '0900000009', NOW()),
(5, 'Nguyen Thi K', '0900000010', NOW());