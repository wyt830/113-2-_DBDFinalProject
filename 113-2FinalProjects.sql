use OnlineEduDB;

--建立Student學生資料表並插入資料
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

INSERT INTO Student (name, email, phone) VALUES
('王小明', 'ming@student.com', '0911222333'),
('林小美', 'mei@student.com', '0933444555'),
('李俊宏', 'john@student.com', '0922111222'),
('陳雨柔', 'yurou@student.com', '0977888999'),
('劉大志', 'dazhi@student.com', '0911000111'),
('吳怡婷', 'iting@student.com', '0922333444'),
('周志豪', 'hao@student.com', '0988777666'),
('鄭雅文', 'yaya@student.com', '0966555444'),
('蔡佳恩', 'chiaen@student.com', '0955666777'),
('張博翔', 'boshiang@student.com', '0988112233'),
('張心妍', 'xinyan@student.com', '0988777123'),
('林怡君', 'yijun2@student.com', '0923456782'),
('黃志明', 'zhiming3@student.com', '0934567893'),
('張嘉玲', 'jialing4@student.com', '0945678904'),
('劉建宏', 'jianhong5@student.com', '0956789015'),
('王詩涵', 'shihan6@student.com', '0967890126'),
('李欣怡', 'xinyi7@student.com', '0978901237'),
('周明軒', 'mingxuan8@student.com', '0989012348'),
('蔡依婷', 'yiting9@student.com', '0912345609'),
('郭子豪', 'zihao10@student.com', '0923456710'),
('徐佳慧', 'jiahui11@student.com', '0934567821'),
('謝孟哲', 'mengzhe12@student.com', '0945678932'),
('許柔柔', 'rourou13@student.com', '0956789043'),
('范逸群', 'yiqun14@student.com', '0967890154'),
('鄭雅婷', 'yating15@student.com', '0978901265'),
('洪志偉', 'zhiwei16@student.com', '0989012376'),
('宋佳琳', 'jialin17@student.com', '0912345487'),
('邱俊宏', 'junhong18@student.com', '0923456598'),
('曹婉如', 'wanru19@student.com', '0934567609'),
('何家豪', 'jiahao20@student.com', '0945678710'),
('馮雅文', 'yawan21@student.com', '0956789821'),
('潘志強', 'zhiqiang22@student.com', '0967890932'),
('鄒雅婷', 'yating23@student.com', '0978901043'),
('賴俊傑', 'junjie24@student.com', '0989012154'),
('藍品妤', 'pinyu25@student.com', '0912345265'),
('葉家瑜', 'jiayu26@student.com', '0923456376'),
('呂家豪', 'jiahao27@student.com', '0934567487'),
('丁雅文', 'yawan28@student.com', '0945678598'),
('江明軒', 'mingxuan29@student.com', '0956789609'),
('蘇嘉玲', 'jialing30@student.com', '0967890710');

--建立Teacher教師資料表並插入資料
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    subject VARCHAR(50)
);

INSERT INTO Teacher (name, subject) VALUES
('陳老師', '數學'),
('李老師', '英文'),
('黃老師', '物理'),
('林老師', '化學'),
('謝老師', '國文');

--建立Course課程資料表並插入資料
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    subject VARCHAR(50),
    level VARCHAR(20),
    teacher_id INT,
    max_seats INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

INSERT INTO Course (title, subject, level, teacher_id, max_seats) VALUES
('國中數學進階班', '數學', '國中', 1, 30),
('高中英文作文班', '英文', '高中', 2, 25),
('高中物理衝刺班', '物理', '高中', 3, 20),
('國中化學先修班', '化學', '國中', 4, 20),
('國文閱讀理解班', '國文', '高中', 5, 20),
('高中英文會話班', '英文', '高中', 2, 15);

--建立Schedule課程時段資料表並插入資料
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    start_time DATETIME,
    end_time DATETIME,
    room VARCHAR(50),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Schedule (course_id, start_time, end_time, room) VALUES
(1, '2025-07-01 09:00:00', '2025-07-01 11:00:00', 'A101'),
(2, '2025-07-02 13:00:00', '2025-07-02 15:00:00', 'B202'),
(3, '2025-07-03 10:00:00', '2025-07-03 12:00:00', 'C303'),
(4, '2025-07-04 14:00:00', '2025-07-04 16:00:00', 'D101'),
(5, '2025-07-05 15:00:00', '2025-07-05 17:00:00', 'A202'),
(6, '2025-07-06 08:30:00', '2025-07-06 10:30:00', 'B101');

--建立Enrollment選課紀錄資料表並插入資料
CREATE TABLE Enrollment (
    student_id INT,
    course_id INT,
    grade DECIMAL(5,2),
    status VARCHAR(20),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Enrollment (student_id, course_id, grade, status) VALUES
(1, 1, 88.5, '正常'),
(1, 2, 85.5, '正常'),
(1, 4, 79.0, '正常'),
(2, 2, 91.0, '正常'),
(2, 3, NULL, '正常'),
(3, 2, 82.0, '正常'),
(3, 3, NULL, '正常'),
(3, 5, 88.0, '正常'),
(4, 1, 85.0, '正常'),
(4, 5, NULL, '正常'),
(5, 1, 87.0, '正常'),
(5, 4, NULL, '正常'),
(6, 5, 76.0, '退選'),
(6, 6, NULL, '正常'),
(7, 2, 82.5, '正常'),
(7, 4, 76.5, '正常'),
(8, 3, NULL, '正常'),
(8, 6, NULL, '正常'),
(9, 2, 90.0, '正常'),
(9, 5, 90.0, '正常'),
(10, 1, NULL, '正常'),
(10, 3, 78.0, '正常'),
(11, 1, NULL, '正常'),
(12, 4, 80.0, '正常'),
(13, 6, NULL, '正常'),
(14, 2, 68.5, '正常'),
(15, 3, NULL, '正常'),
(16, 1, 91.0, '正常'),
(17, 5, 84.0, '正常'),
(18, 4, NULL, '退選'),
(19, 2, 77.5, '正常'),
(20, 6, NULL, '正常'),
(21, 3, 83.0, '正常'),
(22, 1, NULL, '正常'),
(23, 5, 89.0, '正常'),
(24, 4, NULL, '正常'),
(25, 6, 70.0, '正常'),
(26, 2, NULL, '正常'),
(27, 3, 88.5, '正常'),
(28, 1, NULL, '正常'),
(29, 5, 93.0, '正常'),
(30, 6, NULL, '正常');

--建立Payment繳費紀錄資料表並插入資料
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    amount DECIMAL(10,2),
    pay_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

INSERT INTO Payment (student_id, course_id, amount, pay_date, status) VALUES
(1, 1, 3000.00, '2025-06-15', '已繳'),
(2, 2, 3200.00, '2025-06-16', '已繳'),
(3, 3, 3500.00, '2025-06-17', '已繳'),
(4, 1, 3000.00, '2025-06-18', '已繳'),
(5, 4, 2800.00, '2025-06-19', '已繳'),
(6, 5, 2700.00, '2025-06-20', '退費'),
(7, 2, 3200.00, '2025-06-21', '已繳'),
(8, 6, 2600.00, '2025-06-22', '已繳'),
(9, 5, 2700.00, '2025-06-23', '已繳'),
(10, 3, 3500.00, '2025-06-24', '已繳'),
(1, 2, 3200.00, '2025-06-25', '已繳'),
(3, 5, 2700.00, '2025-06-26', '已繳'),
(11, 5, NULL, NULL, '未繳');
(12, 4, 2800, '2025-06-27', '已繳'),
(13, 6, NULL, NULL, '未繳'),
(14, 2, 3200, '2025-06-28', '已繳'),
(15, 3, NULL, NULL, '未繳'),
(16, 1, 3000, '2025-06-29', '已繳'),
(17, 5, 2700, '2025-06-30', '已繳'),
(18, 4, NULL, NULL, '未繳'),
(19, 2, 3200, '2025-07-01', '已繳'),
(20, 6, NULL, NULL, '未繳'),
(21, 3, 3500, '2025-07-02', '已繳'),
(22, 1, NULL, NULL, '未繳'),
(23, 5, 2700, '2025-07-03', '已繳'),
(24, 4, NULL, NULL, '未繳'),
(25, 6, 2600, '2025-07-04', '已繳'),
(26, 2, NULL, NULL, '未繳'),
(27, 3, 3500, '2025-07-05', '已繳'),
(28, 1, NULL, NULL, '未繳'),
(29, 5, 2700, '2025-07-06', '已繳'),
(30, 6, NULL, NULL, '未繳'),
(1, 4, 2800, '2025-07-07', '已繳'),
(2, 3, NULL, NULL, '未繳'),
(3, 2, 3200, '2025-07-08', '已繳'),
(4, 5, NULL, NULL, '未繳'),
(5, 1, 3000, '2025-07-09', '已繳'),
(6, 6, NULL, NULL, '未繳'),
(7, 4, 2800, '2025-07-10', '已繳'),
(8, 3, NULL, NULL, '未繳'),
(9, 2, 3200, '2025-07-11', '已繳'),
(10, 1, NULL, NULL, '未繳');

--常用欄位索引
CREATE INDEX idx_subject ON Course(subject);
CREATE INDEX idx_teacher_id ON Course(teacher_id);
CREATE INDEX idx_course_id_enrollment ON Enrollment(course_id);
CREATE INDEX idx_student_id_enrollment ON Enrollment(student_id);
CREATE INDEX idx_payment_status ON Payment(status);
CREATE INDEX idx_student_id_payment ON Payment(student_id);

--交易流程

--正常交易
--新增測試用資料
INSERT INTO Student (student_id, name, email, phone) VALUES (99, '測試學生', 'test99@test.com', '000');
INSERT INTO Course (course_id, title, subject, level, teacher_id, max_seats) VALUES (99, '測試課程', '測試', '初級', 1, 50);
--開始交易
START TRANSACTION;
-- 新增付款資料
INSERT INTO Payment (student_id, course_id, amount, pay_date, status)
VALUES (99, 99, 9999.99, CURDATE(), '已繳');
--確認付款資料
SELECT * FROM Payment WHERE student_id = 99 AND course_id = 99;
--送出交易
COMMIT;
--確認資料寫入
SELECT * FROM Payment WHERE student_id = 99 AND course_id = 99;

--取消交易
--清除測試資料並再次輸入
DELETE FROM Payment WHERE student_id = 99;
--開始交易
START TRANSACTION;
-- 新增付款資料
INSERT INTO Payment (student_id, course_id, amount, pay_date, status)
VALUES (99, 99, 9999.99, CURDATE(), '已繳');
--確認資料並發現有誤
SELECT * FROM Payment WHERE student_id = 99 AND course_id = 99;
--取消整筆交易
ROLLBACK;
--確認資料並沒有被寫入
SELECT * FROM Payment WHERE student_id = 99 AND course_id = 99;

--查詢各課程報名人數及平均成績
SELECT 
    C.course_id,
    C.title,
    COUNT(E.student_id) AS total_students,
    AVG(E.grade) AS avg_grade
FROM Course C
JOIN Enrollment E ON C.course_id = E.course_id
WHERE E.status = '正常'
GROUP BY C.course_id, C.title
HAVING COUNT(E.student_id) > 3;

--查詢有未繳費紀錄的學生清單
SELECT S.student_id, S.name
FROM Student S
WHERE S.student_id IN (
    SELECT DISTINCT student_id
    FROM Payment
    WHERE status = '未繳'
);

--建立「熱門課程視圖」，顯示課程名稱與報名人數
CREATE OR REPLACE VIEW View_HotCourses AS
SELECT C.course_id, C.title, COUNT(E.student_id) AS enroll_count
FROM Course C
LEFT JOIN Enrollment E ON C.course_id = E.course_id
GROUP BY C.course_id, C.title
ORDER BY enroll_count DESC;
--查詢視圖
SELECT * FROM View_HotCourses WHERE enroll_count > 5;

--建立「學生課程成績統計試圖」，顯示學生的修課數量，成績平均分數及修課狀態
CREATE OR REPLACE VIEW vw_StudentPerformanceSummary AS
SELECT 
    S.student_id,
    S.name AS student_name,
    COUNT(E.course_id) AS total_courses_enrolled,
    COUNT(CASE WHEN E.grade IS NOT NULL THEN 1 END) AS graded_courses,
    ROUND(AVG(E.grade), 2) AS avg_grade,
    SUM(CASE WHEN E.status = '退選' THEN 1 ELSE 0 END) AS dropped_courses
FROM 
    Student S
LEFT JOIN 
    Enrollment E ON S.student_id = E.student_id
GROUP BY 
    S.student_id, S.name;
--查詢視圖
SELECT * FROM vw_StudentPerformanceSummary;

--建立產生學生成績報表的Stored Procedure
CREATE PROCEDURE sp_GetStudentReport(IN p_student_id INT)
SELECT 
    C.title AS course_title,
    E.grade,
    E.status
FROM 
    Enrollment E
JOIN 
    Course C ON E.course_id = C.course_id
WHERE 
    E.student_id = p_student_id;
--呼叫
    CALL sp_GetStudentReport(2);

--建立計算課程平均成績Function
CREATE FUNCTION fn_GetCourseAvgGrade(courseId INT)
RETURNS DECIMAL(5,2)
DETERMINISTIC
RETURN (
    SELECT IFNULL(AVG(grade), 0)
    FROM Enrollment
    WHERE course_id = courseId AND grade IS NOT NULL
);
--呼叫
SELECT fn_GetCourseAvgGrade(2) AS avg_grade;

--Trigger設計繳費確認
CREATE TRIGGER trg_PaymentAfterInsert
AFTER INSERT ON Payment
FOR EACH ROW
UPDATE Enrollment
SET status = '報名完成'
WHERE student_id = NEW.student_id AND course_id = NEW.course_id AND NEW.status = '已繳';
--新增資料
INSERT INTO Payment (student_id, course_id, amount, pay_date, status) VALUES
(1, 4, 2800.00, CURDATE(), '已繳');
--檢視觸發
SELECT student_id, course_id, status 
FROM Enrollment
WHERE student_id = 1 AND course_id = 4;

--安全性與權限管理：建立 ROLE
--建立角色
CREATE ROLE course_manager;
CREATE ROLE viewer;
--授權角色權限
GRANT SELECT, INSERT, UPDATE, DELETE ON OnlineEduDB.* TO course_manager;
GRANT SELECT ON OnlineEduDB.* TO viewer;
--建立使用者並指派角色
CREATE USER 'manager_user'@'%' IDENTIFIED BY 'password123';
CREATE USER 'viewer_user'@'%' IDENTIFIED BY 'password123';

GRANT course_manager TO 'manager_user'@'%';
GRANT viewer TO 'viewer_user'@'%';
--預設啟用角色
SET DEFAULT ROLE course_manager FOR 'manager_user'@'%';
SET DEFAULT ROLE viewer FOR 'viewer_user'@'%';

--外鍵約束
--異常測試：插入不合法資料
INSERT INTO Enrollment (student_id, course_id, grade, status)
VALUES (999, 1, 90, '正常');

--效能測試
--單筆查詢測試
EXPLAIN SELECT * FROM Enrollment WHERE student_id = 1;
--大量資料測試
--灌入大量測試資料
INSERT INTO Student (name) 
SELECT CONCAT('TestStudent', n) 
FROM (SELECT @row := @row + 1 AS n FROM (SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t1, 
(SELECT 0 UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) t2, 
(SELECT @row := 0) r
) nums
WHERE n <= 10000;
--測試查詢是否依舊流暢
SELECT COUNT(*) FROM Student;
