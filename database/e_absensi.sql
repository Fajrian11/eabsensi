/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : e_absensi

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 19/05/2022 11:27:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gedung
-- ----------------------------
DROP TABLE IF EXISTS `gedung`;
CREATE TABLE `gedung`  (
  `id_gedung` int(11) NOT NULL AUTO_INCREMENT,
  `nama_gedung` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_gedung`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gedung
-- ----------------------------
INSERT INTO `gedung` VALUES (12, 'LOKASI 1', 'Alamat 1');
INSERT INTO `gedung` VALUES (13, 'LOKASI 2', 'Alamat 2');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'admin', 'Administrator');
INSERT INTO `groups` VALUES (3, 'Operator', 'Operator');

-- ----------------------------
-- Table structure for jabatan
-- ----------------------------
DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE `jabatan`  (
  `id_jabatan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_jabatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_jabatan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jabatan
-- ----------------------------
INSERT INTO `jabatan` VALUES (5, 'STAFF');
INSERT INTO `jabatan` VALUES (6, 'MANAJER');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kd_karyawan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_karyawan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` int(11) NOT NULL,
  `id_shift` int(20) NOT NULL,
  `id_gedung` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES (129, 'S2008001', 'Karyawan 1', 5, 5, 12);
INSERT INTO `karyawan` VALUES (130, 'M2008129', 'Karyawan bang', 6, 6, 12);
INSERT INTO `karyawan` VALUES (131, 'S2008130', 'Karyawan 3', 5, 5, 12);
INSERT INTO `karyawan` VALUES (132, 'M2205131', 'Fajrian', 6, 6, 12);

-- ----------------------------
-- Table structure for kehadiran
-- ----------------------------
DROP TABLE IF EXISTS `kehadiran`;
CREATE TABLE `kehadiran`  (
  `id_khd` int(11) NOT NULL AUTO_INCREMENT,
  `nama_khd` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_khd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kehadiran
-- ----------------------------
INSERT INTO `kehadiran` VALUES (1, 'Hadir');
INSERT INTO `kehadiran` VALUES (2, 'Sakit');
INSERT INTO `kehadiran` VALUES (3, 'Ijin');
INSERT INTO `kehadiran` VALUES (4, 'Alpha');
INSERT INTO `kehadiran` VALUES (5, 'Lepas/Off');

-- ----------------------------
-- Table structure for login_attempts
-- ----------------------------
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE `login_attempts`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(11) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `id_absen` int(11) NOT NULL AUTO_INCREMENT,
  `id_karyawan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_msk` time(0) NOT NULL,
  `jam_klr` time(0) NOT NULL,
  `id_khd` int(11) NULL DEFAULT NULL,
  `ket` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_status` int(11) NOT NULL,
  PRIMARY KEY (`id_absen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of presensi
-- ----------------------------
INSERT INTO `presensi` VALUES (64, 'S2008001', '2020-08-02', '12:52:43', '12:52:46', 1, '', 2);

-- ----------------------------
-- Table structure for shift
-- ----------------------------
DROP TABLE IF EXISTS `shift`;
CREATE TABLE `shift`  (
  `id_shift` int(11) NOT NULL AUTO_INCREMENT,
  `nama_shift` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_shift`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shift
-- ----------------------------
INSERT INTO `shift` VALUES (5, 'SHIFT 1');
INSERT INTO `shift` VALUES (6, 'SHIFT 2');
INSERT INTO `shift` VALUES (7, 'SHIFT 3');

-- ----------------------------
-- Table structure for stts
-- ----------------------------
DROP TABLE IF EXISTS `stts`;
CREATE TABLE `stts`  (
  `id_status` int(11) NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of stts
-- ----------------------------
INSERT INTO `stts` VALUES (1, 'Masuk');
INSERT INTO `stts` VALUES (2, 'Pulang');
INSERT INTO `stts` VALUES (3, 'tidak hadir');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activation_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activation_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED NULL DEFAULT NULL,
  `remember_selector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `first_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uc_email`(`email`) USING BTREE,
  UNIQUE INDEX `uc_activation_selector`(`activation_selector`) USING BTREE,
  UNIQUE INDEX `uc_forgotten_password_selector`(`forgotten_password_selector`) USING BTREE,
  UNIQUE INDEX `uc_remember_selector`(`remember_selector`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (26, '::1', 'admin@admin.com', '$2y$12$MPcQlOck9fzd/5UjJ6iIXuhZivhkXdfoVD2xFXpZTnZ2IWQw/nFhW', 'admin@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1556798313, 1652707420, 1, 'admin', 'nistator', NULL, '123412341234');
INSERT INTO `users` VALUES (34, '::1', 'jefrimaruli@gmail.com', '$2y$12$yt3Qu8yQzdT3zYSgbDyDsOCi6d6TMtIrCTzB.nJaruVCO5hDMdtm2', 'jefrimaruli@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1560355548, 1560524242, 1, 'Jeff', 'Maruli', NULL, '9832349234');
INSERT INTO `users` VALUES (46, '::1', 'operator@operator.com', '$2y$10$ibxBt.RYG7jib0JxBxB1.usc9pzjqUqPPTvwLgPp1gMRKg6VMLLei', 'operator@operator.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1562178403, 1597138345, 1, 'operator', '2', NULL, '34890234809238490');
INSERT INTO `users` VALUES (47, '::1', 'admin', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'staff@staff.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1564294648, 1564294659, 1, 'staf', 'staff', NULL, '239423849234890');
INSERT INTO `users` VALUES (48, '', 'ujang rambo', 'ee39f26ceb1590cf827db6a870cb0150', 'ujang@admin.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (49, '', 'Administrator', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin@mail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE `users_groups`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uc_users_groups`(`user_id`, `group_id`) USING BTREE,
  INDEX `fk_users_groups_users1_idx`(`user_id`) USING BTREE,
  INDEX `fk_users_groups_groups1_idx`(`group_id`) USING BTREE,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_groups
-- ----------------------------
INSERT INTO `users_groups` VALUES (29, 26, 1);
INSERT INTO `users_groups` VALUES (37, 34, 1);
INSERT INTO `users_groups` VALUES (49, 46, 3);
INSERT INTO `users_groups` VALUES (50, 47, 1);

SET FOREIGN_KEY_CHECKS = 1;
