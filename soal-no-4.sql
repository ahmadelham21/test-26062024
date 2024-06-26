-- /////////////////////////////////////////////////////////////////////////

--   -- Create the 'pelanggan' table
-- CREATE TABLE pelanggan (
--     KODE VARCHAR(11) PRIMARY KEY,
--     NAMA VARCHAR(255),
--     ALAMAT VARCHAR(255)
-- );

-- -- Create the 'barang' table
-- CREATE TABLE barang (
--     KODE VARCHAR(255) PRIMARY KEY,
--     NAMA VARCHAR(255),
--     HARGA DOUBLE PRECISION
-- );

-- -- Create the 'transaksi' table
-- CREATE TABLE transaksi (
--     KODE VARCHAR(255) PRIMARY KEY,
--     TANGGAL DATE,
--     KODE_PELANGGAN VARCHAR(255),
--     KODE_BARANG VARCHAR(255),
--     JUMLAH_BARANG DOUBLE PRECISION,
--     FOREIGN KEY (KODE_PELANGGAN) REFERENCES pelanggan(KODE),
--     FOREIGN KEY (KODE_BARANG) REFERENCES barang(KODE)
-- );

-- -- Insert records into 'barang' table
-- INSERT INTO barang (KODE, NAMA, HARGA)
-- VALUES
-- ('B1', 'Baju', 12000),
-- ('B2', 'Celana', 10000),
-- ('B3', 'Sepatu', 30000);

-- -- Insert records into 'pelanggan' table
-- INSERT INTO pelanggan (KODE, NAMA, ALAMAT)
-- VALUES
-- ('P1', 'Yogi', 'JAKARTA'),
-- ('P2', 'Anggi', 'BANDUNG'),
-- ('P3', 'Rahma', 'BANDUNG');

-- -- Insert records into 'transaksi' table
-- INSERT INTO transaksi (KODE, TANGGAL, KODE_PELANGGAN, KODE_BARANG, JUMLAH_BARANG)
-- VALUES
-- ('TRX001', '2019-10-01', 'P1', 'B1', 3),
-- ('TRX002', '2019-10-02', 'P2', 'B2', 2),
-- ('TRX003', '2019-10-08', 'P2', 'B1', 5),
-- ('TRX004', '2019-10-10', 'P1', 'B1', 1),
-- ('TRX005', '2019-10-17', 'P3', 'B2', 2),
-- ('TRX006', '2019-10-17', 'P2', 'B3', 1),
-- ('TRX007', '2019-10-18', 'P3', 'B1', 4),
-- ('TRX008', '2019-10-18', 'P2', 'B2', 2);
-- /////////////////////////////////////////////////////////////////////////

--/*  4A */
SELECT		*
FROM		barang b
LEFT JOIN	transaksi t ON t.KODE_BARANG = b.KODE
WHERE		harga > 10
ORDER BY	harga ASC

--/* 4B */
SELECT		*
FROM		pelanggan p
LEFT JOIN	transaksi t ON t.kode_pelanggan = p.kode
WHERE		p.alamat = 'BANDUNG' AND p.nama LIKE '%g%'

--/* 4C */
SELECT 		t.kode AS "KODE",
			t.tanggal AS "TANGGAL",
			p.nama AS "NAMA PELANGGAN",
			b.nama AS "NAMA BARANG",
			t.jumlah_barang AS "JUMLAH",
			b.harga AS "HARGA SATUAN",
			b.harga * t.jumlah_barang AS "TOTAL"
FROM		transaksi t
LEFT JOIN 	barang b ON t.kode_barang = b.kode
LEFT JOIN 	pelanggan p ON t.kode_pelanggan = p.kode
ORDER BY	p.nama, b.harga ASC

--/* 4D */
SELECT 		p.nama AS "NAMA PELANGGAN",
			SUM(t.jumlah_barang) AS "JUMLAH",
			SUM(b.harga * t.jumlah_barang) AS "TOTAL HARGA"
FROM		transaksi t
LEFT JOIN 	barang b ON t.kode_barang = b.kode
LEFT JOIN 	pelanggan p ON t.kode_pelanggan = p.kode
GROUP BY	p.nama
ORDER BY	p.nama