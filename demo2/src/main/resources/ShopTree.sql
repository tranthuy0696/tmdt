/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : ShopTree

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 11/22/2017 19:11:06 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
--  Table structure for `CATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `CATEGORY`;
CREATE TABLE `CATEGORY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `urlcode` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
--  Table structure for `SUB_CATEGORY`
-- ----------------------------
DROP TABLE IF EXISTS `SUB_CATEGORY`;
CREATE TABLE `SUB_CATEGORY` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `sub_category_id` (`sub_category_id`),
  CONSTRAINT `category` FOREIGN KEY (`category_id`) REFERENCES `CATEGORY` (`id`),
  CONSTRAINT `sub_category` FOREIGN KEY (`sub_category_id`) REFERENCES `CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `PRODUCT`;
CREATE TABLE `PRODUCT` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_vietnamese_ci NOT NULL,
  `urlcode` varchar(15) COLLATE utf8_vietnamese_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `favorite` int(11) NOT NULL,
  `price` double(14,2) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `PRODUCT_Category` (`category_id`),
  CONSTRAINT `PRODUCT_Category` FOREIGN KEY (`category_id`) REFERENCES `CATEGORY` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

DROP TABLE IF EXISTS `PERMISSION`;
CREATE TABLE `PERMISSION` (
  `id` int(11) NOT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `CUSTOMER`
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) COLLATE utf8_vietnamese_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `password` varchar(30) text DEFAULT NULL,
  `registration_date` date NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  'address' text COLLATE utf8_vietnamese_ci DEFAULT NULL,
  'phone_number' varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `permission` FOREIGN KEY (`permission_id`) REFERENCES `PERMISSION` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

-- ----------------------------
--  Table structure for `PAYMENT`
-- ----------------------------
DROP TABLE IF EXISTS `PAYMENT`;
CREATE TABLE `PAYMENT` (
  `id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `payment_methods` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
--  Table structure for `ORDER`
-- ----------------------------
DROP TABLE IF EXISTS `ORDER`;
CREATE TABLE `ORDER` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `status_payment` int(11) DEFAULT NULL,
  `status_order` int(1) NOT NULL,
  `total` double(14,2) NOT NULL,
  `address_ship` varchar(255) COLLATE utf8_vietnamese_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ORDER_CUSTOMER` (`customer_id`),
  KEY `status` (`status_order`),
  KEY `status_payment` (`status_payment`),
  CONSTRAINT `ORDER_CUSTOMER` FOREIGN KEY (`customer_id`) REFERENCES `CUSTOMER` (`id`),
  CONSTRAINT `Payment` FOREIGN KEY (`status_payment`) REFERENCES `PAYMENT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;



-- ----------------------------
--  Table structure for `PERMISSION`
-- ----------------------------

-- ----------------------------
--  Table structure for `PRODUCT`
-- ----------------------------

-- ----------------------------
--  Table structure for `PRODUCT_ORDER_ITEM`
-- ----------------------------
DROP TABLE IF EXISTS `PRODUCT_ORDER_ITEM`;
CREATE TABLE `PRODUCT_ORDER_ITEM` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `PRODUCT_ORDER_ITEM_ORDER` (`order_id`),
  CONSTRAINT `PRODUCT_ORDER_ITEM_ORDER` FOREIGN KEY (`order_id`) REFERENCES `ORDER` (`id`),
  CONSTRAINT `PRODUCT_ORDER_ITEM_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `PRODUCT` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_vietnamese_ci;

DROP TABLE IF EXISTS `Status_Order`;
CREATE TABLE `Status_Order` (
  `id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  CONSTRAINT `status` FOREIGN KEY (`id`) REFERENCES `ORDER` (`status_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  Table structure for `Status_Order`
-- ----------------------------


SET FOREIGN_KEY_CHECKS = 1;