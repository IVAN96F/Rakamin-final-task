# Rakamin-final-task
rakamin final task performance analitycs 


#🎯 Ringkasan Proyek
Proyek ini bertujuan untuk mengevaluasi kinerja bisnis Kimia Farma dari tahun 2020 hingga 2023, menggunakan data transaksi, inventaris, kantor cabang, dan produk. Hasil akhir proyek ini adalah Tabel Analisis yang teragregasi di BigQuery dan visualisasi kinerja bisnis dalam bentuk Dashboard di Google Looker Studio.

#🛠️ Tools dan Teknologi
Teknologi	Tujuan
Google Cloud Platform (GCP)	Lingkungan utama untuk hosting data dan komputasi.
BigQuery	Warehouse data untuk mengimpor dataset dan menjalankan syntax SQL analisis kinerja.
Google Looker Studio	Platform untuk membuat Dashboard Performance Analytics.
GitHub	Repositori untuk menyimpan semua syntax SQL yang telah dibuat.
#📂 Struktur Repositori
Repositori ini menyimpan syntax SQL yang digunakan untuk pengolahan data di BigQuery.

⚙️ Detail Pengerjaan (BigQuery SQL)
File utama yang dikumpulkan adalah SQL/create_analysis_table.sql. File ini mencakup langkah-langkah berikut:

Penggabungan Data: Melakukan operasi LEFT JOIN antara kf_final_transaction, kf_kantor_cabang, dan kf_product.
Perhitungan Metrik: Menghitung kolom-kolom mandatory yang baru:
nett_sales: Harga setelah diskon[cite: 54].
persentase_gross_laba: Persentase laba berdasarkan kategori harga jual obat.
nett_profit: Keuntungan yang diperoleh Kimia Farma.
Tabel Hasil: Hasil query disimpan sebagai tabel kf_analysis_table di dalam dataset kimia_farma.
Referensi Tabel Sumber:
kf_final_transaction
kf_inventory
kf_kantor_cabang
kf_product
📈 Dashboard Performance Analytics
Dashboard ini dibuat di Google Looker Studio menggunakan tabel kf_analysis_table sebagai sumber data.

Link Dashboard Looker Studio: [Link Looker Studio]

Komponen Wajib Dashboard:
Judul dan Summary Dashboard.
Filter Control (Tanggal dan Provinsi)
Snapshot Data (KPI utama).
Perbandingan Pendapatan Kimia Farma dari tahun ke tahun.
Top 10 Total transaksi cabang provinsi.
Top 10 Nett sales cabang provinsi.
Top 5 Cabang Dengan Rating Tertinggi, namun Rating Transaksi Terendah.
Indonesia's Geo Map Untuk Total Profit Masing-masing Provinsi.
🎬 Video Presentasi
Link Video Presentasi/Penjelasan Proyek: [Link YouTube / Google Drive Video]


