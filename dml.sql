-- Ödev 3 - Bölüm 3: Değiştir ve geri al
-- Çalıştırma: psql -d kafe -a -f dml.sql > dml_cikti.txt 2>&1
\set VERBOSITY verbose
BEGIN;

-- Önce: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 1: Sıcak İçecek ürünlerinin fiyatını 5 TL artır.
UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

-- Sonra: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 2: Var olmayan 999 numaralı ürünü 1 numaralı siparişe ekle (hata verecek).
INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

ROLLBACK;

-- ROLLBACK sonrası: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;
