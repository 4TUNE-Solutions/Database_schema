

CREATE TABLE `GL_article_list` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `barcode1` varchar(15),
  `barcode2` varchar(15),
  `barcode3` varchar(15),
  `barcode4` varchar(15),
  `article_name` varchar(30),
  `sub_group1` int,
  `sub_group2` int,
  `sub_group3` int,
  `measure_unit` varchar(5),
  `tax_id` int,
  `description` text,
  `article_note` text,
  `exp_date` date,
  `supplier_id` int,
  `service` boolean,
  `discount` int
);

CREATE TABLE `GL_article_group` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `group_name` varchar(20),
  `group_color` varchar(20),
  `discount_amount` int
);

CREATE TABLE `GL_article_sub_group` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `group_id` int,
  `sub_group_id` int,
  `sub_group_name` varchar(20),
  `sub_group_color` varchar(20),
  `discount_amount` int
);

CREATE TABLE `GL_article_grouping_connection` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `group_id` int,
  `sub_group_id` int,
  `article_id` int
);

CREATE TABLE `GL_shops_list` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `address` varchar(50),
  `city` varchar(20),
  `postal_code` varchar(7),
  `email` varchar(20),
  `mobile1` varchar(20),
  `mobile2` varchar(20),
  `mobile3` varchar(20),
  `operating` boolean
);

CREATE TABLE `GL_inventory_list` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `address` varchar(50),
  `city` varchar(20),
  `postal_code` varchar(7),
  `email` varchar(20),
  `mobile1` varchar(20),
  `mobile2` varchar(20),
  `mobile3` varchar(20),
  `operating` boolean
);

CREATE TABLE `GL_working_hours` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `shop_id` int,
  `day` varchar(10),
  `opening_hours` time,
  `closing_hours` time,
  `working` boolean
);

CREATE TABLE `GL_corpo_buyers_list` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `address` varchar(50),
  `city` varchar(20),
  `postal_code` varchar(7),
  `email` varchar(20),
  `telephone` varchar(20),
  `mobile` varchar(20),
  `fax` varchar(20),
  `website` varchar(50),
  `contact_person` varchar(50),
  `bank_account_number1` varchar(50),
  `bank_account_number2` varchar(50),
  `TIN` varchar(20),
  `UCID` varchar(20),
  `taxpayer` boolean
);

CREATE TABLE `GL_access_level_accounts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `worker_name` varchar(50),
  `visible_name` varchar(20),
  `username` varchar(20),
  `password` varchar(20),
  `is_admin` boolean,
  `is_manager` boolean
);

CREATE TABLE `GL_retail_costs` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `shop_id` int,
  `type_of_pay` int,
  `issuance_day` date,
  `due_month` int,
  `due_year` int,
  `cost` double,
  `payment_code` int,
  `reference_number` varchar(50),
  `payer_name` varchar(50)
);

CREATE TABLE `GL_retail_costs_types` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `service_name` varchar(20),
  `service_bank_account_number` varchar(20)
);

CREATE TABLE `INV_state` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `article_id` int,
  `inventory_id` int,
  `count_number` double,
  `purchase_price` double,
  `selling_margin` double
);

CREATE TABLE `INV_procurement` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `suplier_id` int,
  `inventory_id` int,
  `creation_date` date,
  `realized` boolean
);

CREATE TABLE `INV_procurement_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `procurment_id` int,
  `article_id` int,
  `amount_number` double
);

CREATE TABLE `INV_delivery` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `shop_id` int,
  `inventory_id` int,
  `delivery_date` date,
  `realized` boolean
);

CREATE TABLE `INV_delivery_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `shop_id` int,
  `article_id` int,
  `amount_number` double
);

CREATE TABLE `INV_suppliers_list` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50),
  `address` varchar(50),
  `city` varchar(20),
  `postal_code` varchar(7),
  `email` varchar(20),
  `telephone` varchar(20),
  `mobile` varchar(20),
  `fax` varchar(20),
  `website` varchar(50),
  `contact_person` varchar(50),
  `bank_account_number1` varchar(50),
  `bank_account_number2` varchar(50),
  `TIN` varchar(20),
  `UCID` varchar(20),
  `taxpayer` boolean
);

CREATE TABLE `RT_state` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `shop_id` int,
  `article_id` int,
  `count_number` double,
  `selling_price` double,
  `discount` double,
  `expiration_date` date
);

CREATE TABLE `RT_fiscal_bills` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `worker_id` int,
  `shop_id` int,
  `buyer_id` int,
  `reference_number` int,
  `sum_cash` double,
  `sum_card` double,
  `final_sum` double,
  `money_given` double,
  `cash_back` double,
  `date_time_issued` datetime,
  `TAX_amount` double,
  `discount_amount` double
);

CREATE TABLE `RT_sold_goods` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fiscall_bill_id` int,
  `article_id` int,
  `amount` double,
  `article_cost` double,
  `article_TAX` double,
  `article_discount` double
);

CREATE TABLE `RT_order_request` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `inventory_id` int,
  `shop_id` int,
  `creation_date` date,
  `realized` boolean
);

CREATE TABLE `RT_order_request_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `request_id` int,
  `article_id` int,
  `amount_number` double
);

CREATE TABLE `RT_corpo_sell_invoice` (
  `id` int PRIMARY KEY,
  `corpo_id` int,
  `worker_id` int,
  `shop_id` int,
  `date_issued` date,
  `payment_deadline` date,
  `invoice_number` varchar(50),
  `sum_cash` double,
  `sum_card` double,
  `final_sum` double,
  `TAX_amount` double,
  `discount_amount` double,
  `invoice_paid` boolean
);

CREATE TABLE `RT_invoice_sold_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `invoice_id` int,
  `article_id` int,
  `amount` double,
  `article_cost` double,
  `article_TAX` double,
  `article_discount` double
);

CREATE TABLE `RT_corpo_fiscal_bill` (
  `id` int PRIMARY KEY,
  `corpo_id` int,
  `shop_id` int,
  `fiscall_bill_id` int,
  `date_time_issued` datetime
);

ALTER TABLE `GL_article_list` ADD FOREIGN KEY (`supplier_id`) REFERENCES `INV_suppliers_list` (`id`);

ALTER TABLE `GL_article_sub_group` ADD FOREIGN KEY (`group_id`) REFERENCES `GL_article_group` (`id`);

ALTER TABLE `GL_article_sub_group` ADD FOREIGN KEY (`sub_group_id`) REFERENCES `GL_article_sub_group` (`id`);

ALTER TABLE `GL_article_grouping_connection` ADD FOREIGN KEY (`group_id`) REFERENCES `GL_article_group` (`id`);

ALTER TABLE `GL_article_grouping_connection` ADD FOREIGN KEY (`sub_group_id`) REFERENCES `GL_article_sub_group` (`id`);

ALTER TABLE `GL_article_grouping_connection` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `GL_working_hours` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `GL_retail_costs` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `GL_retail_costs` ADD FOREIGN KEY (`type_of_pay`) REFERENCES `GL_retail_costs_types` (`id`);

ALTER TABLE `INV_state` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `INV_state` ADD FOREIGN KEY (`inventory_id`) REFERENCES `GL_inventory_list` (`id`);

ALTER TABLE `INV_procurement` ADD FOREIGN KEY (`suplier_id`) REFERENCES `INV_suppliers_list` (`id`);

ALTER TABLE `INV_procurement` ADD FOREIGN KEY (`inventory_id`) REFERENCES `GL_inventory_list` (`id`);

ALTER TABLE `INV_procurement_items` ADD FOREIGN KEY (`procurment_id`) REFERENCES `INV_procurement` (`id`);

ALTER TABLE `INV_procurement_items` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `INV_delivery` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `INV_delivery` ADD FOREIGN KEY (`inventory_id`) REFERENCES `GL_inventory_list` (`id`);

ALTER TABLE `INV_delivery_items` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `INV_delivery_items` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `RT_state` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `RT_state` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `RT_fiscal_bills` ADD FOREIGN KEY (`worker_id`) REFERENCES `GL_access_level_accounts` (`id`);

ALTER TABLE `RT_fiscal_bills` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `RT_fiscal_bills` ADD FOREIGN KEY (`buyer_id`) REFERENCES `GL_corpo_buyers_list` (`id`);

ALTER TABLE `RT_sold_goods` ADD FOREIGN KEY (`fiscall_bill_id`) REFERENCES `RT_fiscal_bills` (`id`);

ALTER TABLE `RT_sold_goods` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `RT_order_request` ADD FOREIGN KEY (`inventory_id`) REFERENCES `GL_inventory_list` (`id`);

ALTER TABLE `RT_order_request` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `RT_order_request_items` ADD FOREIGN KEY (`request_id`) REFERENCES `RT_order_request` (`id`);

ALTER TABLE `RT_order_request_items` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `RT_corpo_sell_invoice` ADD FOREIGN KEY (`corpo_id`) REFERENCES `GL_corpo_buyers_list` (`id`);

ALTER TABLE `RT_corpo_sell_invoice` ADD FOREIGN KEY (`worker_id`) REFERENCES `GL_access_level_accounts` (`id`);

ALTER TABLE `RT_corpo_sell_invoice` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `RT_invoice_sold_items` ADD FOREIGN KEY (`invoice_id`) REFERENCES `RT_corpo_sell_invoice` (`id`);

ALTER TABLE `RT_invoice_sold_items` ADD FOREIGN KEY (`article_id`) REFERENCES `GL_article_list` (`id`);

ALTER TABLE `RT_corpo_fiscal_bill` ADD FOREIGN KEY (`corpo_id`) REFERENCES `GL_corpo_buyers_list` (`id`);

ALTER TABLE `RT_corpo_fiscal_bill` ADD FOREIGN KEY (`shop_id`) REFERENCES `GL_shops_list` (`id`);

ALTER TABLE `RT_corpo_fiscal_bill` ADD FOREIGN KEY (`fiscall_bill_id`) REFERENCES `RT_fiscal_bills` (`id`);
