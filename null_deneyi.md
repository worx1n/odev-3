# NULL Deneyi

`customer` tablosunda 8 müşteri var. `phone` sütunu 3 satırda boş (Mehmet Kaya, Can Arslan, Selin Öztürk), `age` sütunu 2 satırda boş (Elif Yıldız, Can Arslan).

## Deney 1

```sql
SELECT COUNT(*), COUNT(phone) FROM customer;
```

**Tahminim:** İkisi de 8 çıkar, çünkü tabloda 8 müşteri var.

**Sonuç:** `COUNT(*)` = 8, `COUNT(phone)` = 5.

**Yorum:** Tahminim yarım tuttu. `COUNT(*)` bütün satırları sayar, `COUNT(phone)` ise NULL olan telefonları saymaz. Telefonu boş 3 müşteri çıkınca 8 yerine 5 kaldı.

## Deney 2

```sql
SELECT AVG(age), SUM(age) / COUNT(*) FROM customer;
```

**Tahminim:** İki ifade aynı sayıyı verir, çünkü ikisi de ortalama yaşı hesaplıyor.

**Sonuç:** `AVG(age)` = 20.8333333333333333, `SUM(age) / COUNT(*)` = 15.

**Yorum:** Tahminim tutmadı. `AVG(age)` yaşı NULL olan 2 kişiyi hesaba katmaz, yani 125 / 6 alır. `SUM(age) / COUNT(*)` ise toplamı (125) 8 satıra böler. Üstelik PostgreSQL iki tam sayıyı bölünce sonucu tam sayıya yuvarlar, bu yüzden 15.625 yerine 15 çıkar. NULL değerler hesabı sessizce değiştirdiği için sonuçlara dikkat etmek gerekir.
