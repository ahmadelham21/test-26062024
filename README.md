# Technical Assessment Solutions for Programmer Position

This document provides solutions for a technical assessment for the Programmer (P) position. The assessment includes Javascript programs for algorithmic problems and SQL queries for database-related tasks. The tasks and solutions are detailed below.

## Overview

The solutions are implemented using Javascript and PostgreSQL. The Javascript programs can run independently as they include their own `main` methods.

## Task 1: Algorithm for Special Number Printing

### Problem Statement

Create an algorithm to display numbers from 1 to n with the following rules:

- Multiples of 3 should be replaced with "OK"
- Multiples of 4 should be replaced with "YES"
- Multiples of both 3 and 4 should be replaced with "OKYES"

### Solution

The following Javascript code solves the problem:

```javascript
const yesOrNo = (n) => {
  for (let i = 1; i < n; i++) {
    if (i % 3 == 0 && i % 4 == 0) {
      console.log("OKYES");
    } else if (i % 3 == 0) {
      console.log("OK");
    } else if (i % 4 == 0) {
      console.log("YES");
    } else {
      console.log(i);
    }
  }
};

yesOrNo(20);
```

## Task 2: Pattern Printing

### Problem Statement

Write an algorithm to display various patterns for a given n.

### Solution

The following Javascript code solves the problem:

```javascript
const soal2A = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = " ";
    for (let j = 1; j <= i; j++) {
      line += i;
    }
    console.log(line);
  }
};
soal2A(5);

const soal2B = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = " ";
    for (let j = i; j > 0; j--) {
      line += j;
    }
    console.log(line);
  }
};

soal2B(5);

const soal2C = (n) => {
  for (let i = 1; i <= n; i++) {
    let num = i;
    let line = "";
    for (let j = 1; j <= i; j++) {
      line += num;
      num++;
    }
    console.log(line);
  }
};

soal2C(5);

const soal2D = (n) => {
  for (let i = 1; i <= n; i++) {
    let line = "";
    for (let j = 0; j < n; j++) {
      line += i + j * n + " ";
    }
    console.log(line);
  }
};

soal2D(5);
```

## Task 3: Array Manipulation

### Problem Statement

Given an array, remove all multiples of 3 and sort the remaining numbers in ascending order.

### Solution

The following Javascript code solves the problem:

```javascript
function filterAndSortArray(arr) {
  let filteredArray = arr.filter((i) => i % 3 !== 0);

  filteredArray.sort((a, b) => a - b);

  return filteredArray;
}
let numList = [12, 9, 13, 6, 10, 4, 7, 2];
let result = filterAndSortArray(numList);
console.log("n = [" + result.join(", ") + "]");
```

## Task 4: SQL Queries for Database Operations

### Problem Statement

Write SQL queries to display specific data from the provided tables.

### Solution

The following SQL scripts solve the problem. Ensure to create and populate the tables as shown below before executing the queries.

```sql
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

```
