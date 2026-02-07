-- LANGKAH 1: Buat Tabel Analisis Final (Ganti PROJECT_ID jika berbeda)
-- Tabel ini akan menggabungkan data transaksi, cabang, dan produk
CREATE OR REPLACE TABLE
  `rakamin-kf-analytics-4778.kimia_farma.kf_analysis` AS
SELECT
  -- Kolom Identifikasi Transaksi
  t.transaction_id,
  t.date,
  t.customer_name,
  t.product_id,
  t.branch_id,
  t.rating AS rating_transaksi,
  
  -- Kolom Data Cabang (JOIN dari kf_kantor_cabang)
  kb.branch_name,
  kb.kota,
  kb.provinsi,
  kb.rating AS rating_cabang, -- Rating Cabang
  
  -- Kolom Data Produk (JOIN dari kf_product)
  kp.product_name,

  -- Kolom Harga dan Diskon
  t.price AS actual_price, -- Harga sebelum diskon
  t.discount_percentage,
  
  -- LANGKAH 2: Kalkulasi Persentase Laba (persentase_gross_laba)
  CASE
    WHEN t.price <= 50000 THEN 0.10  -- 10%
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15 -- 15%
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20 -- 20%
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25 -- 25%
    WHEN t.price > 500000 THEN 0.30  -- 30%
    ELSE 0
  END AS persentase_gross_laba,

  -- LANGKAH 3: Kalkulasi Nett Sales (Harga setelah diskon)
  t.price * (1 - t.discount_percentage) AS nett_sales,

  -- LANGKAH 4: Kalkulasi Nett Profit (Keuntungan = Nett Sales * Persentase Laba)
  (t.price * (1 - t.discount_percentage)) * (
    CASE
      WHEN t.price <= 50000 THEN 0.10
      WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
      WHEN t.price > 100000 AND t.price <= 300000 THEN 0.20
      WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
      WHEN t.price > 500000 THEN 0.30
      ELSE 0
    END
  ) AS nett_profit

FROM
  `rakamin-kf-analytics-4778.kimia_farma.kf_final_transaction` AS t
-- JOIN dengan tabel kantor cabang
LEFT JOIN
  `rakamin-kf-analytics-4778.kimia_farma.kf_kantor_cabang` AS kb
  ON t.branch_id = kb.branch_id
-- JOIN dengan tabel produk
LEFT JOIN
  `rakamin-kf-analytics-4778.kimia_farma.kf_product` AS kp
  ON t.product_id = kp.product_id;
