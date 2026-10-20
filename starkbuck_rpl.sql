-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Okt 2026 pada 03.13
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `starkbuck_rpl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `id_nota` varchar(20) DEFAULT NULL,
  `id_transaksi` int(11) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `kuantitas` int(11) DEFAULT NULL,
  `kuantitas_harga` decimal(12,3) DEFAULT NULL,
  `harga` decimal(12,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_kasir`, `id_produk`, `id_nota`, `id_transaksi`, `kategori`, `kuantitas`, `kuantitas_harga`, `harga`) VALUES
(1, 1002, 1, 'Chk 2639', 1, 'Minuman', 1, '123.765', '123.765'),
(2, 1002, 2, 'Chk 2639', 1, 'Minuman', 2, '24.930', '12.465'),
(3, 1002, 3, 'Chk 2639', 1, 'Minuman', 1, '105.957', '100.000'),
(4, 1002, 4, 'Chk 2639', 1, 'Tambahan', 1, '14.246', '14.246'),
(5, 1002, 5, 'Chk 2639', 1, 'Makanan', 1, '57.876', '57.876'),
(6, 1005, 2, 'Chk 2640', 2, 'Minuman', 3, '37.395', '12.465'),
(7, 1005, 6, 'Chk 2640', 2, 'Minuman', 1, '30.000', '30.000'),
(8, 1005, 7, 'Chk 2640', 2, 'Minuman', 5, '135.000', '27.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kasir`
--

CREATE TABLE `kasir` (
  `id_kasir` int(11) NOT NULL,
  `nama_kasir` varchar(100) DEFAULT NULL,
  `no_telp` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kasir`
--

INSERT INTO `kasir` (`id_kasir`, `nama_kasir`, `no_telp`, `alamat`, `email`) VALUES
(1002, 'Olivia', '08912313131231', 'Jalan Bypass Ngurah Rai', 'Oliv@gmail.com'),
(1003, 'Dilla', '08912313131232', 'Jalan Pulau Sailus', 'dilla21@gmail.com'),
(1004, 'Nitha', '08912313131233', 'Jalan Taman Pancing', 'nit24@yahoo.com'),
(1005, 'Ade', '08912313131234', 'Jalan Danau Tempe', 'ade788@email.com'),
(1006, 'Magnum', '08912313131235', 'Jalan Monang Maning', 'mag@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga` decimal(12,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`) VALUES
(1, 'Venti Mocha Latte', '123.765'),
(2, 'Oat Milk', '12.465'),
(3, 'Grande Caramel Macchiato', '105.957'),
(4, 'Extra Shot', '14.246'),
(5, 'Tall Pike Place Roast', '57.876'),
(6, 'Matcha Latte', '30.000'),
(7, 'Americanno', '27.000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `subtotal` decimal(12,3) DEFAULT NULL,
  `pajak` decimal(12,3) DEFAULT NULL,
  `total` decimal(12,3) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `waktu` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `subtotal`, `pajak`, `total`, `tanggal`, `waktu`) VALUES
(1, '326.774', '35.945', '362.719', '2026-03-18', '10:52:41'),
(2, '202.395', '22.263', '224.658', '2026-03-19', '12:45:59');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_kasir` (`id_kasir`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`id_kasir`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD CONSTRAINT `fk_detail_kasir` FOREIGN KEY (`id_kasir`) REFERENCES `kasir` (`id_kasir`),
  ADD CONSTRAINT `fk_detail_produk` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`),
  ADD CONSTRAINT `fk_detail_transaksi` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
