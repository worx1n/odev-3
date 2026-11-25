-- Ödev 3 - Kampüs Kafe sorguları
-- Çalıştırma: psql -d kafe -a -f sorgular.sql > sorgular_cikti.txt 2>&1

-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Menüdeki pahalı ürünleri tek bakışta görüp fiyat politikasını değerlendirmeyi sağlar.
SELECT name, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik sırala.
-- Ne işe yarar: Belirli bir bölümdeki müşterilerin düzenli bir listesini çıkarır (örneğin o bölüme özel kampanya için).
SELECT full_name
FROM customer
WHERE department = 'YBS'
ORDER BY full_name;

-- Q3: Her siparişin numarasını, tarihini ve müşterinin adını listele.
-- Ne işe yarar: Hangi siparişin kim tarafından ve ne zaman verildiğini tek tabloda gösterir.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
INNER JOIN customer c ON c.customer_id = o.customer_id;

-- Q4: Her sipariş kaleminin ürün adını ve adedini listele.
-- Ne işe yarar: Siparişlerde hangi üründen kaç adet satıldığını görmeyi sağlar.
SELECT p.name, oi.quantity
FROM order_item oi
INNER JOIN product p ON p.product_id = oi.product_id;

-- Q5: Her müşterinin kaç sipariş verdiğini müşteri adıyla listele.
-- Ne işe yarar: En sık gelen müşterileri belirleyip sadakat çalışmalarına temel oluşturur.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
INNER JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Kategorilerin fiyat seviyelerini karşılaştırmayı sağlar.
SELECT category, AVG(price) AS ortalama_fiyat
FROM product
GROUP BY category;
