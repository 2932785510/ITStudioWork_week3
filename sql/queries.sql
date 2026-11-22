USE bookshop;

-- 查询库存为0的书，预期查出球闪和白夜行
SELECT title,stock FROM books
WHERE stock=0;

-- 按价格降序取前三本，并把他们按id升序，预期查出白夜行，解忧和球闪
SELECT title,price FROM books
ORDER BY price DESC,id ASC LIMIT 3;

-- 查询价格在20到40的书，预期查出除了呐喊以外的所有书
SELECT title,price FROM books
WHERE price BETWEEN 20 AND 40;

-- 用JOIN查询每一本书的书名，作者和价格
SELECT b.title,a.name AS author,b.price FROM books AS b
JOIN authors AS a ON b.author_id=a.id
ORDER BY b.id;

-- 先确认id为1的书的库存，再在保证其库存不为零的情况下减一，再确认该书的库存
SELECT id,title,stock FROM books
WHERE id=1;
UPDATE books SET stock=stock-1
WHERE id=1;
SELECT id,title,stock FROM books
WHERE id=1;

-- 先插入一本书，再用delete把他删除
INSERT INTO books (title,author_id,price,stock,published_at)
VALUES(
    'delete book',
    (SELECT id FROM authors WHERE name='鲁迅' LIMIT 1),
    39.00,
    10,
    '2024-01-01'
);
SELECT id,title FROM books
WHERE title='delete book';
DELETE FROM books
WHERE title='delete book';
SELECT id,title FROM books
WHERE title='delete book';