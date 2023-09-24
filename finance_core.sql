/*
 Navicat Premium Data Transfer

 Source Server         : localhost_mysql
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43-log)
 Source Host           : localhost:3306
 Source Schema         : finance_core

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43-log)
 File Encoding         : 65001

 Date: 18/09/2023 15:13:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for borrow_info
-- ----------------------------
DROP TABLE IF EXISTS `borrow_info`;
CREATE TABLE `borrow_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '借款期限',
  `borrow_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `money_use` tinyint(3) NULL DEFAULT NULL COMMENT '资金用途',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未提交，1：审核中， 2：审核通过， -1：审核不通过）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrow_info
-- ----------------------------
INSERT INTO `borrow_info` VALUES (1, 8, 10000.00, 12, 0.12, 3, 1, 2, '2023-08-08 18:23:42', '2023-08-08 18:23:42', 0);
INSERT INTO `borrow_info` VALUES (2, 10, 20000.00, 12, 0.12, 3, 1, 2, '2023-08-09 08:13:27', '2023-08-09 08:13:27', 0);
INSERT INTO `borrow_info` VALUES (3, 15, 100000.00, 12, 0.12, 3, 1, 2, '2023-09-11 14:57:42', '2023-09-11 14:57:42', 0);
INSERT INTO `borrow_info` VALUES (4, 17, 100000.00, 12, 0.12, 3, 1, 2, '2023-09-18 10:15:49', '2023-09-18 10:15:49', 0);

-- ----------------------------
-- Table structure for borrower
-- ----------------------------
DROP TABLE IF EXISTS `borrower`;
CREATE TABLE `borrower`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `sex` tinyint(3) NULL DEFAULT NULL COMMENT '性别（1：男 0：女）',
  `age` tinyint(3) NULL DEFAULT NULL COMMENT '年龄',
  `education` tinyint(3) NULL DEFAULT NULL COMMENT '学历',
  `is_marry` tinyint(1) NULL DEFAULT NULL COMMENT '是否结婚（1：是 0：否）',
  `industry` tinyint(3) NULL DEFAULT NULL COMMENT '行业',
  `income` tinyint(3) NULL DEFAULT NULL COMMENT '月收入',
  `return_source` tinyint(3) NULL DEFAULT NULL COMMENT '还款来源',
  `contacts_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名称',
  `contacts_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人手机',
  `contacts_relation` tinyint(3) NULL DEFAULT NULL COMMENT '联系人关系',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态（0：未认证，1：认证中， 2：认证通过， -1：认证失败）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrower
-- ----------------------------
INSERT INTO `borrower` VALUES (1, 7, '13100000000', '0', '13100000000', 1, 25, 4, 1, 1, 1, 1, '白骨精', '13100000001', 1, 2, '2023-08-08 08:35:39', '2023-08-08 08:35:39', 0);
INSERT INTO `borrower` VALUES (2, 8, '沙和尚', '14011019900512163X', '13200000000', 1, 24, 3, 1, 1, 1, 1, '孙悟空', '13300000000', 1, 2, '2023-08-08 18:22:54', '2023-08-08 18:22:54', 0);
INSERT INTO `borrower` VALUES (3, 10, '13400000000', '0', '13400000000', 1, 30, 1, 1, 1, 1, 1, '唐僧', '13400000001', 1, 2, '2023-08-09 08:06:22', '2023-08-09 08:06:22', 0);
INSERT INTO `borrower` VALUES (4, 15, '晁盖', '140110199005121601', '13900000005', 1, 40, 5, 1, 6, 1, 1, '宋江', '13300000000', 4, 2, '2023-09-11 14:49:16', '2023-09-11 14:49:16', 0);
INSERT INTO `borrower` VALUES (5, 17, '卢俊义', '111111111111111111', '13900000007', 1, 20, 1, 1, 6, 3, 1, '小卢', '13900000007', 4, 2, '2023-09-18 10:10:33', '2023-09-18 10:10:33', 0);

-- ----------------------------
-- Table structure for borrower_attach
-- ----------------------------
DROP TABLE IF EXISTS `borrower_attach`;
CREATE TABLE `borrower_attach`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `borrower_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款人id',
  `image_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片类型（idCard1：身份证正面，idCard2：身份证反面，house：房产证，car：车）',
  `image_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `image_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_borrower_id`(`borrower_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借款人上传资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of borrower_attach
-- ----------------------------
INSERT INTO `borrower_attach` VALUES (1, 1, 'idCard1', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard1/2023/08/08/50a021db-fbf1-48b6-826c-d55aef0ea910.png', 'logo.png', '2023-08-08 08:35:39', '2023-08-08 08:35:39', 0);
INSERT INTO `borrower_attach` VALUES (2, 1, 'idCard2', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard2/2023/08/08/1da430e2-7b36-42ec-9d9a-b5f2f7f29dda.png', 'logo.png', '2023-08-08 08:35:39', '2023-08-08 08:35:39', 0);
INSERT INTO `borrower_attach` VALUES (3, 1, 'house', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/house/2023/08/08/a3071eae-81b1-43fe-a786-2fdae50c1089.png', 'logo.png', '2023-08-08 08:35:39', '2023-08-08 08:35:39', 0);
INSERT INTO `borrower_attach` VALUES (4, 1, 'car', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/car/2023/08/08/d1e2d92d-aa33-4518-8180-4b723acfffb3.png', 'logo.png', '2023-08-08 08:35:39', '2023-08-08 08:35:39', 0);
INSERT INTO `borrower_attach` VALUES (5, 2, 'idCard1', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard1/2023/08/08/aa444c67-6cdd-4a3f-810c-751cd1dc2c6c.png', 'logo.png', '2023-08-08 18:22:54', '2023-08-08 18:22:54', 0);
INSERT INTO `borrower_attach` VALUES (6, 2, 'idCard2', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard2/2023/08/08/04dd5d21-5c69-4c97-9035-a85ec27ddf98.png', 'logo.png', '2023-08-08 18:22:54', '2023-08-08 18:22:54', 0);
INSERT INTO `borrower_attach` VALUES (7, 2, 'house', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/house/2023/08/08/21b32d9d-3f98-4b50-a2d3-dde2d1520365.png', 'logo.png', '2023-08-08 18:22:54', '2023-08-08 18:22:54', 0);
INSERT INTO `borrower_attach` VALUES (8, 2, 'car', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/car/2023/08/08/b27e8189-85ce-4ada-b59d-f52cbb8470ab.png', 'logo.png', '2023-08-08 18:22:54', '2023-08-08 18:22:54', 0);
INSERT INTO `borrower_attach` VALUES (9, 3, 'idCard1', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard1/2023/08/09/dd0b6244-53d0-4da0-ab14-94f8a76d2c7d.png', 'logo.png', '2023-08-09 08:06:22', '2023-08-09 08:06:22', 0);
INSERT INTO `borrower_attach` VALUES (10, 3, 'idCard2', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard2/2023/08/09/120f5ad3-01bc-49b4-934e-502e66a08caa.png', 'logo.png', '2023-08-09 08:06:22', '2023-08-09 08:06:22', 0);
INSERT INTO `borrower_attach` VALUES (11, 3, 'house', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/house/2023/08/09/ab47f1b2-2e27-483d-a795-221c92ba82ec.png', 'logo.png', '2023-08-09 08:06:22', '2023-08-09 08:06:22', 0);
INSERT INTO `borrower_attach` VALUES (12, 3, 'car', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/car/2023/08/09/be164b70-3c66-470d-942e-9314f00a77fb.png', 'logo.png', '2023-08-09 08:06:22', '2023-08-09 08:06:22', 0);
INSERT INTO `borrower_attach` VALUES (13, 4, 'idCard1', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard1/2023/09/11/f5aba44f-769c-4e62-854a-b499218d9d1c.jpg', '正面1.jpg', '2023-09-11 14:49:16', '2023-09-11 14:49:16', 0);
INSERT INTO `borrower_attach` VALUES (14, 4, 'idCard2', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard2/2023/09/11/2ea6acaa-e396-44db-85df-193f38daefb4.jpg', '反面.jpg', '2023-09-11 14:49:16', '2023-09-11 14:49:16', 0);
INSERT INTO `borrower_attach` VALUES (15, 4, 'house', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/house/2023/09/11/e6fb1c40-0f30-4485-9064-41739a321c0f.jpg', 'house.jpg', '2023-09-11 14:49:16', '2023-09-11 14:49:16', 0);
INSERT INTO `borrower_attach` VALUES (16, 4, 'car', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/car/2023/09/11/8eebd62d-794f-4146-b8d0-93888da7cc40.jpg', 'car.jpg', '2023-09-11 14:49:16', '2023-09-11 14:49:16', 0);
INSERT INTO `borrower_attach` VALUES (17, 5, 'idCard1', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard1/2023/09/18/143c9f47-93f5-436e-b7ba-93a5a63d789b.jpg', '正面1.jpg', '2023-09-18 10:10:33', '2023-09-18 10:10:33', 0);
INSERT INTO `borrower_attach` VALUES (18, 5, 'idCard2', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/idCard2/2023/09/18/908a03fb-a704-4b4c-bbcf-8fcf07279f67.jpg', '反面.jpg', '2023-09-18 10:10:33', '2023-09-18 10:10:33', 0);
INSERT INTO `borrower_attach` VALUES (19, 5, 'house', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/house/2023/09/18/b33f7ce3-8c5a-4d88-9916-aeec3a11c5b4.jpg', 'house.jpg', '2023-09-18 10:10:33', '2023-09-18 10:10:33', 0);
INSERT INTO `borrower_attach` VALUES (20, 5, 'car', 'https://finance-0530.cn-beijing.oss.aliyuncs.com/car/2023/09/18/18e9ed5b-9a24-470f-a71f-2465e271c059.jpg', 'car.jpg', '2023-09-18 10:10:33', '2023-09-18 10:10:33', 0);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `value` int(11) NULL DEFAULT NULL COMMENT '值',
  `dict_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_parent_id_value`(`parent_id`, `value`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 0, '全部分类', NULL, 'ROOT', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20000, 1, '行业', NULL, 'industry', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20001, 20000, 'IT', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20002, 20000, '医生', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20003, 20000, '教师', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20004, 20000, '导游', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20005, 20000, '律师', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (20006, 20000, '其他', 6, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30000, 1, '学历', NULL, 'education', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30001, 30000, '高中', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30002, 30000, '大专', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30003, 30000, '本科', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30004, 30000, '研究生', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (30005, 30000, '其他', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40000, 1, '收入', NULL, 'income', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40001, 40000, '0-3000', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40002, 40000, '3000-5000', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40003, 40000, '5000-10000', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (40004, 40000, '10000以上', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50000, 1, '收入来源', NULL, 'returnSource', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50001, 50000, '工资', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50002, 50000, '股票', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (50003, 50000, '兼职', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60000, 1, '关系', NULL, 'relation', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60001, 60000, '夫妻', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60002, 60000, '兄妹', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60003, 60000, '父母', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (60004, 60000, '其他', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70000, 1, '还款方式', NULL, 'returnMethod', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70001, 70000, '等额本息', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70002, 70000, '等额本金', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70003, 70000, '每月还息一次还本', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (70004, 70000, '一次还本还息', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80000, 1, '资金用途', NULL, 'moneyUse', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80001, 80000, '旅游', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80002, 80000, '买房', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80003, 80000, '装修', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80004, 80000, '医疗', 4, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80005, 80000, '美容', 5, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (80006, 80000, '其他', 6, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81000, 1, '借款状态', NULL, 'borrowStatus', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81001, 81000, '待审核', 0, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81002, 81000, '审批通过', 1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81003, 81000, '还款中', 2, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81004, 81000, '结束', 3, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (81005, 81000, '审批不通过', -1, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82000, 1, '学校性质', NULL, 'SchoolStatus', '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82001, 82000, '211/985', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82002, 82000, '一本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82003, 82000, '二本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82004, 82000, '三本', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82005, 82000, '高职高专', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82006, 82000, '中职中专', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);
INSERT INTO `dict` VALUES (82007, 82000, '高中及以下', NULL, NULL, '2021-02-20 00:26:22', '2021-02-20 00:26:22', 0);

-- ----------------------------
-- Table structure for integral_grade
-- ----------------------------
DROP TABLE IF EXISTS `integral_grade`;
CREATE TABLE `integral_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `integral_start` int(11) NULL DEFAULT NULL COMMENT '积分区间开始',
  `integral_end` int(11) NULL DEFAULT NULL COMMENT '积分区间结束',
  `borrow_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款额度',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of integral_grade
-- ----------------------------
INSERT INTO `integral_grade` VALUES (1, 10, 50, 10000.00, '2020-12-08 17:02:29', '2021-02-19 17:58:10', 0);
INSERT INTO `integral_grade` VALUES (2, 51, 100, 30000.00, '2020-12-08 17:02:42', '2021-02-19 18:00:25', 0);
INSERT INTO `integral_grade` VALUES (3, 101, 2000, 100000.00, '2020-12-08 17:02:57', '2021-02-23 21:03:03', 0);

-- ----------------------------
-- Table structure for lend
-- ----------------------------
DROP TABLE IF EXISTS `lend`;
CREATE TABLE `lend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款用户id',
  `borrow_info_id` bigint(20) NULL DEFAULT NULL COMMENT '借款信息id',
  `lend_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标的编号',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '标的金额',
  `period` int(11) NULL DEFAULT NULL COMMENT '投资期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `service_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台服务费率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式',
  `lowest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低投资金额',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已投金额',
  `invest_num` int(11) NULL DEFAULT NULL COMMENT '投资人数',
  `publish_date` datetime NULL DEFAULT NULL COMMENT '发布日期',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `lend_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际收益',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `check_admin_id` bigint(1) NULL DEFAULT NULL COMMENT '审核用户id',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '放款时间',
  `payment_admin_id` datetime NULL DEFAULT NULL COMMENT '放款人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_no`(`lend_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的准备表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend
-- ----------------------------
INSERT INTO `lend` VALUES (1, 10, 2, 'LEND20230809081406338', '闪电贷002', 20000.00, 12, 0.12, 0.05, 3, 100.00, 20000.00, 2, '2023-08-09 08:14:06', '2023-08-31', '2024-08-31', '闪电贷002', 1000.00, 1000.00, 2, '2023-08-09 08:14:06', 1, '2023-08-11 20:33:18', NULL, '2023-08-09 08:14:06', '2023-08-09 08:14:06', 0);
INSERT INTO `lend` VALUES (2, 15, 3, 'LEND20230911150106751', '晁盖旅游贷', 100000.00, 12, 0.12, 0.05, 3, 100.00, 100000.00, 1, '2023-09-11 15:01:06', '2023-09-11', '2024-09-11', '晁盖旅游贷', 4999.99, 4999.99, 2, '2023-09-11 15:01:06', 1, '2023-09-11 15:29:38', NULL, '2023-09-11 15:01:06', '2023-09-11 15:01:06', 0);
INSERT INTO `lend` VALUES (3, 17, 4, 'LEND20230918101830614', '卢俊义旅游贷', 100000.00, 12, 0.12, 0.05, 3, 100.00, 100000.00, 1, '2023-09-18 10:18:31', '2023-09-18', '2024-09-18', '卢俊义旅游贷', 4999.99, 4999.99, 2, '2023-09-18 10:18:31', 1, '2023-09-18 10:26:19', NULL, '2023-09-18 10:18:30', '2023-09-18 10:18:30', 0);

-- ----------------------------
-- Table structure for lend_item
-- ----------------------------
DROP TABLE IF EXISTS `lend_item`;
CREATE TABLE `lend_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_item_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资编号',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(20) NULL DEFAULT NULL COMMENT '投资用户id',
  `invest_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资人名称',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '投资金额',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `invest_time` datetime NULL DEFAULT NULL COMMENT '投资时间',
  `lend_start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `lend_end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `expect_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '预期收益',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际收益',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0：默认 1：已支付 2：已还款）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_lend_item_no`(`lend_item_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_item
-- ----------------------------
INSERT INTO `lend_item` VALUES (1, 'INVEST20230811065537836', 1, 12, '投资者二', 10000.00, 0.12, '2023-08-11 06:55:37', '2023-08-31', '2024-08-31', 1200.00, 100.00, 1, '2023-08-11 06:55:37', '2023-08-11 06:55:37', 0);
INSERT INTO `lend_item` VALUES (2, 'INVEST20230811173340903', 1, 13, '13900000003', 10000.00, 0.12, '2023-08-11 17:33:40', '2023-08-31', '2024-08-31', 1200.00, 100.00, 1, '2023-08-11 17:33:40', '2023-08-11 17:33:40', 0);
INSERT INTO `lend_item` VALUES (3, 'INVEST20230911152504048', 2, 14, '13900000004', 100000.00, 0.12, '2023-09-11 15:25:04', '2023-09-11', '2024-09-11', 12000.00, 0.00, 1, '2023-09-11 15:25:04', '2023-09-11 15:25:04', 0);
INSERT INTO `lend_item` VALUES (4, 'INVEST20230918102422819', 3, 16, '13900000006', 100000.00, 0.12, '2023-09-18 10:24:23', '2023-09-18', '2024-09-18', 12000.00, 0.00, 1, '2023-09-18 10:24:22', '2023-09-18 10:24:22', 0);

-- ----------------------------
-- Table structure for lend_item_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_item_return`;
CREATE TABLE `lend_item_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_return_id` bigint(20) NULL DEFAULT NULL COMMENT '标的还款id',
  `lend_item_id` bigint(20) NULL DEFAULT NULL COMMENT '标的项id',
  `lend_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '标的id',
  `invest_user_id` bigint(1) NULL DEFAULT NULL COMMENT '出借用户id',
  `invest_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '出借金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lend_return_id`(`lend_return_id`) USING BTREE,
  INDEX `idx_lend_item_id`(`lend_item_id`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_invest_user_id`(`invest_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标的出借回款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_item_return
-- ----------------------------
INSERT INTO `lend_item_return` VALUES (145, 145, 1, 1, 12, 10000.00, 1, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-09-30', '2023-08-12 09:21:35', 0, NULL, 1, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (146, 146, 1, 1, 12, 10000.00, 2, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-10-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (147, 147, 1, 1, 12, 10000.00, 3, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-11-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (148, 148, 1, 1, 12, 10000.00, 4, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-12-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (149, 149, 1, 1, 12, 10000.00, 5, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-01-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (150, 150, 1, 1, 12, 10000.00, 6, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-02-29', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (151, 151, 1, 1, 12, 10000.00, 7, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-03-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (152, 152, 1, 1, 12, 10000.00, 8, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-04-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (153, 153, 1, 1, 12, 10000.00, 9, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-05-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (154, 154, 1, 1, 12, 10000.00, 10, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-06-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (155, 155, 1, 1, 12, 10000.00, 11, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-07-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (156, 156, 1, 1, 12, 10000.00, 12, 0.12, 3, 10000.00, 100.00, 10100.00, 0.00, '2024-08-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (157, 145, 2, 1, 13, 10000.00, 1, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-09-30', '2023-08-12 09:21:35', 0, NULL, 1, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (158, 146, 2, 1, 13, 10000.00, 2, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-10-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (159, 147, 2, 1, 13, 10000.00, 3, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-11-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (160, 148, 2, 1, 13, 10000.00, 4, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2023-12-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (161, 149, 2, 1, 13, 10000.00, 5, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-01-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (162, 150, 2, 1, 13, 10000.00, 6, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-02-29', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (163, 151, 2, 1, 13, 10000.00, 7, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-03-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (164, 152, 2, 1, 13, 10000.00, 8, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-04-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (165, 153, 2, 1, 13, 10000.00, 9, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-05-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (166, 154, 2, 1, 13, 10000.00, 10, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-06-30', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (167, 155, 2, 1, 13, 10000.00, 11, 0.12, 3, 0.00, 100.00, 100.00, 0.00, '2024-07-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (168, 156, 2, 1, 13, 10000.00, 12, 0.12, 3, 10000.00, 100.00, 10100.00, 0.00, '2024-08-31', NULL, 0, NULL, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_item_return` VALUES (169, 157, 3, 2, 14, 100000.00, 1, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-10-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (170, 158, 3, 2, 14, 100000.00, 2, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-11-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (171, 159, 3, 2, 14, 100000.00, 3, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-12-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (172, 160, 3, 2, 14, 100000.00, 4, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-01-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (173, 161, 3, 2, 14, 100000.00, 5, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-02-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (174, 162, 3, 2, 14, 100000.00, 6, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-03-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (175, 163, 3, 2, 14, 100000.00, 7, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-04-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (176, 164, 3, 2, 14, 100000.00, 8, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-05-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (177, 165, 3, 2, 14, 100000.00, 9, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-06-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (178, 166, 3, 2, 14, 100000.00, 10, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-07-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (179, 167, 3, 2, 14, 100000.00, 11, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-08-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (180, 168, 3, 2, 14, 100000.00, 12, 0.12, 3, 100000.00, 1000.00, 101000.00, 0.00, '2024-09-11', NULL, 0, NULL, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_item_return` VALUES (181, 169, 4, 3, 16, 100000.00, 1, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-10-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (182, 170, 4, 3, 16, 100000.00, 2, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-11-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (183, 171, 4, 3, 16, 100000.00, 3, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-12-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (184, 172, 4, 3, 16, 100000.00, 4, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-01-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (185, 173, 4, 3, 16, 100000.00, 5, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-02-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (186, 174, 4, 3, 16, 100000.00, 6, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-03-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (187, 175, 4, 3, 16, 100000.00, 7, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-04-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (188, 176, 4, 3, 16, 100000.00, 8, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-05-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (189, 177, 4, 3, 16, 100000.00, 9, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-06-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (190, 178, 4, 3, 16, 100000.00, 10, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-07-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (191, 179, 4, 3, 16, 100000.00, 11, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-08-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_item_return` VALUES (192, 180, 4, 3, 16, 100000.00, 12, 0.12, 3, 100000.00, 1000.00, 101000.00, 0.00, '2024-09-18', NULL, 0, NULL, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);

-- ----------------------------
-- Table structure for lend_return
-- ----------------------------
DROP TABLE IF EXISTS `lend_return`;
CREATE TABLE `lend_return`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `lend_id` bigint(20) NULL DEFAULT NULL COMMENT '标的id',
  `borrow_info_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '借款信息id',
  `return_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '还款批次号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '借款人用户id',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '借款金额',
  `base_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '计息本金额',
  `current_period` int(11) NULL DEFAULT NULL COMMENT '当前的期数',
  `lend_year_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '年化利率',
  `return_method` tinyint(3) NULL DEFAULT NULL COMMENT '还款方式 1-等额本息 2-等额本金 3-每月还息一次还本 4-一次还本',
  `principal` decimal(10, 2) NULL DEFAULT NULL COMMENT '本金',
  `interest` decimal(10, 2) NULL DEFAULT NULL COMMENT '利息',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '本息',
  `fee` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `return_date` date NULL DEFAULT NULL COMMENT '还款时指定的还款日期',
  `real_return_time` datetime NULL DEFAULT NULL COMMENT '实际发生的还款时间',
  `is_overdue` tinyint(1) NULL DEFAULT NULL COMMENT '是否逾期',
  `overdue_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '逾期金额',
  `is_last` tinyint(1) NULL DEFAULT NULL COMMENT '是否最后一次还款',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态（0-未归还 1-已归还）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_return_no`(`return_no`) USING BTREE,
  INDEX `idx_lend_id`(`lend_id`) USING BTREE,
  INDEX `idx_borrow_info_id`(`borrow_info_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 181 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '还款记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lend_return
-- ----------------------------
INSERT INTO `lend_return` VALUES (145, 1, 2, 'RETURN20230811203318348', 10, 20000.00, 20000.00, 1, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2023-09-30', '2023-08-12 09:21:35', 0, NULL, 0, 1, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (146, 1, 2, 'RETURN20230811203318286', 10, 20000.00, 20000.00, 2, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2023-10-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (147, 1, 2, 'RETURN20230811203318968', 10, 20000.00, 20000.00, 3, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2023-11-30', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (148, 1, 2, 'RETURN20230811203318248', 10, 20000.00, 20000.00, 4, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2023-12-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (149, 1, 2, 'RETURN20230811203318987', 10, 20000.00, 20000.00, 5, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-01-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (150, 1, 2, 'RETURN20230811203318767', 10, 20000.00, 20000.00, 6, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-02-29', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (151, 1, 2, 'RETURN20230811203318403', 10, 20000.00, 20000.00, 7, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-03-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (152, 1, 2, 'RETURN20230811203318854', 10, 20000.00, 20000.00, 8, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-04-30', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (153, 1, 2, 'RETURN20230811203318843', 10, 20000.00, 20000.00, 9, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-05-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (154, 1, 2, 'RETURN20230811203318999', 10, 20000.00, 20000.00, 10, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-06-30', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (155, 1, 2, 'RETURN20230811203318282', 10, 20000.00, 20000.00, 11, 0.12, 3, 0.00, 200.00, 200.00, 0.00, '2024-07-31', NULL, 0, NULL, 0, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (156, 1, 2, 'RETURN20230811203318998', 10, 20000.00, 20000.00, 12, 0.12, 3, 20000.00, 200.00, 20200.00, 0.00, '2024-08-31', NULL, 0, NULL, 1, 0, '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `lend_return` VALUES (157, 2, 3, 'RETURN20230911152937719', 15, 100000.00, 100000.00, 1, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-10-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (158, 2, 3, 'RETURN20230911152937998', 15, 100000.00, 100000.00, 2, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-11-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (159, 2, 3, 'RETURN20230911152937246', 15, 100000.00, 100000.00, 3, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-12-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (160, 2, 3, 'RETURN20230911152937732', 15, 100000.00, 100000.00, 4, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-01-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (161, 2, 3, 'RETURN20230911152937763', 15, 100000.00, 100000.00, 5, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-02-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (162, 2, 3, 'RETURN20230911152937854', 15, 100000.00, 100000.00, 6, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-03-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (163, 2, 3, 'RETURN20230911152937366', 15, 100000.00, 100000.00, 7, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-04-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (164, 2, 3, 'RETURN20230911152937122', 15, 100000.00, 100000.00, 8, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-05-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (165, 2, 3, 'RETURN20230911152937420', 15, 100000.00, 100000.00, 9, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-06-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (166, 2, 3, 'RETURN20230911152937590', 15, 100000.00, 100000.00, 10, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-07-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (167, 2, 3, 'RETURN20230911152937944', 15, 100000.00, 100000.00, 11, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-08-11', NULL, 0, NULL, 0, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (168, 2, 3, 'RETURN20230911152937617', 15, 100000.00, 100000.00, 12, 0.12, 3, 100000.00, 1000.00, 101000.00, 0.00, '2024-09-11', NULL, 0, NULL, 1, 0, '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `lend_return` VALUES (169, 3, 4, 'RETURN20230918102618884', 17, 100000.00, 100000.00, 1, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-10-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (170, 3, 4, 'RETURN20230918102618377', 17, 100000.00, 100000.00, 2, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-11-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (171, 3, 4, 'RETURN20230918102618954', 17, 100000.00, 100000.00, 3, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2023-12-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (172, 3, 4, 'RETURN20230918102618295', 17, 100000.00, 100000.00, 4, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-01-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (173, 3, 4, 'RETURN20230918102618265', 17, 100000.00, 100000.00, 5, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-02-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (174, 3, 4, 'RETURN20230918102618505', 17, 100000.00, 100000.00, 6, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-03-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (175, 3, 4, 'RETURN20230918102618041', 17, 100000.00, 100000.00, 7, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-04-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (176, 3, 4, 'RETURN20230918102618876', 17, 100000.00, 100000.00, 8, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-05-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (177, 3, 4, 'RETURN20230918102618166', 17, 100000.00, 100000.00, 9, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-06-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (178, 3, 4, 'RETURN20230918102618113', 17, 100000.00, 100000.00, 10, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-07-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (179, 3, 4, 'RETURN20230918102618595', 17, 100000.00, 100000.00, 11, 0.12, 3, 0.00, 1000.00, 1000.00, 0.00, '2024-08-18', NULL, 0, NULL, 0, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `lend_return` VALUES (180, 3, 4, 'RETURN20230918102618614', 17, 100000.00, 100000.00, 12, 0.12, 3, 100000.00, 1000.00, 101000.00, 0.00, '2024-09-18', NULL, 0, NULL, 1, 0, '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);

-- ----------------------------
-- Table structure for trans_flow
-- ----------------------------
DROP TABLE IF EXISTS `trans_flow`;
CREATE TABLE `trans_flow`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `trans_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '交易单号',
  `trans_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '交易类型（1：充值 2：提现 3：投标 4：投资回款 ...）',
  `trans_type_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易类型名称',
  `trans_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '交易金额',
  `memo` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_trans_no`(`trans_no`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trans_flow
-- ----------------------------
INSERT INTO `trans_flow` VALUES (1, 12, '投资者二', '20230809212758659', 1, '充值', 20000.00, '充值', '2023-08-09 21:28:22', '2023-08-09 21:28:22', 0);
INSERT INTO `trans_flow` VALUES (2, 12, '投资者二', 'INVEST20230811065537836', 2, '投标锁定', 10000.00, '投资项目编号：LEND20230809081406338，项目名称：闪电贷002', '2023-08-11 06:55:56', '2023-08-11 06:55:56', 0);
INSERT INTO `trans_flow` VALUES (3, 13, '投资者三', '20230811173248055', 1, '充值', 30000.00, '充值', '2023-08-11 17:33:01', '2023-08-11 17:33:01', 0);
INSERT INTO `trans_flow` VALUES (4, 13, '投资者三', 'INVEST20230811173340903', 2, '投标锁定', 10000.00, '投资项目编号：LEND20230809081406338，项目名称：闪电贷002', '2023-08-11 17:34:03', '2023-08-11 17:34:03', 0);
INSERT INTO `trans_flow` VALUES (41, 10, '唐僧', 'LOAN20230811203318779', 5, '放款到账', 20000.00, '借款放款到账，编号：LEND20230809081406338', '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `trans_flow` VALUES (42, 12, '投资者二', 'TRANS20230811203318341', 3, '放款解锁', 10000.00, '冻结资金转出，出借放款，编号：LEND20230809081406338', '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `trans_flow` VALUES (43, 13, '投资者三', 'TRANS20230811203318597', 3, '放款解锁', 10000.00, '冻结资金转出，出借放款，编号：LEND20230809081406338', '2023-08-11 20:33:18', '2023-08-11 20:33:18', 0);
INSERT INTO `trans_flow` VALUES (44, 10, '唐僧', 'WITHDRAW20230812091953284', 8, '提现', 10000.00, '提现', '2023-08-12 09:20:02', '2023-08-12 09:20:02', 0);
INSERT INTO `trans_flow` VALUES (45, 10, '唐僧', 'RETURN20230811203318348', 6, '还款扣减', 200.00, '借款人还款扣减，项目编号：LEND20230809081406338，项目名称：闪电贷002', '2023-08-12 09:21:35', '2023-08-12 09:21:35', 0);
INSERT INTO `trans_flow` VALUES (46, 12, '投资者二', 'RETURNITEM20230812092135164', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20230809081406338，项目名称：闪电贷002', '2023-08-12 09:21:35', '2023-08-12 09:21:35', 0);
INSERT INTO `trans_flow` VALUES (47, 13, '投资者三', 'RETURNITEM20230812092135106', 7, '出借回款', 100.00, '还款到账，项目编号：LEND20230809081406338，项目名称：闪电贷002', '2023-08-12 09:21:35', '2023-08-12 09:21:35', 0);
INSERT INTO `trans_flow` VALUES (48, 14, '范蠡', '20230911151959197', 1, '充值', 100000.00, '充值', '2023-09-11 15:21:06', '2023-09-11 15:21:06', 0);
INSERT INTO `trans_flow` VALUES (49, 14, '范蠡', 'INVEST20230911152504048', 2, '投标锁定', 100000.00, '投资项目编号：LEND20230911150106751，项目名称：晁盖旅游贷', '2023-09-11 15:25:30', '2023-09-11 15:25:30', 0);
INSERT INTO `trans_flow` VALUES (50, 15, '晁盖', 'LOAN20230911152937869', 5, '放款到账', 95000.01, '借款放款到账，编号：LEND20230911150106751', '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `trans_flow` VALUES (51, 14, '范蠡', 'TRANS20230911152937218', 3, '放款解锁', 100000.00, '冻结资金转出，出借放款，编号：LEND20230911150106751', '2023-09-11 15:29:37', '2023-09-11 15:29:37', 0);
INSERT INTO `trans_flow` VALUES (52, 16, '高太尉', '20230918102211847', 1, '充值', 200000.00, '充值', '2023-09-18 10:22:39', '2023-09-18 10:22:39', 0);
INSERT INTO `trans_flow` VALUES (53, 16, '高太尉', 'INVEST20230918102422819', 2, '投标锁定', 100000.00, '投资项目编号：LEND20230918101830614，项目名称：卢俊义旅游贷', '2023-09-18 10:24:36', '2023-09-18 10:24:36', 0);
INSERT INTO `trans_flow` VALUES (54, 17, '卢俊义', 'LOAN20230918102618624', 5, '放款到账', 95000.01, '借款放款到账，编号：LEND20230918101830614', '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);
INSERT INTO `trans_flow` VALUES (55, 16, '高太尉', 'TRANS20230918102618219', 3, '放款解锁', 100000.00, '冻结资金转出，出借放款，编号：LEND20230918101830614', '2023-09-18 10:26:18', '2023-09-18 10:26:18', 0);

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '帐户可用余额',
  `freeze_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  `version` int(11) NOT NULL DEFAULT 0 COMMENT '版本号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_account
-- ----------------------------
INSERT INTO `user_account` VALUES (7, 7, 0.00, 0.00, '2023-08-07 15:57:47', '2023-08-07 15:57:47', 0, 0);
INSERT INTO `user_account` VALUES (8, 8, 0.00, 0.00, '2023-08-07 15:59:53', '2023-08-07 15:59:53', 0, 0);
INSERT INTO `user_account` VALUES (9, 9, 0.00, 0.00, '2023-08-07 16:26:20', '2023-08-07 16:26:20', 0, 0);
INSERT INTO `user_account` VALUES (10, 10, 9800.00, 0.00, '2023-08-09 08:04:36', '2023-08-12 09:21:35', 0, 0);
INSERT INTO `user_account` VALUES (11, 11, 0.00, 0.00, '2023-08-09 21:02:39', '2023-08-09 21:02:39', 0, 0);
INSERT INTO `user_account` VALUES (12, 12, 10100.00, 0.00, '2023-08-09 21:25:30', '2023-08-12 09:21:35', 0, 0);
INSERT INTO `user_account` VALUES (13, 13, 20100.00, 0.00, '2023-08-11 17:30:41', '2023-08-12 09:21:35', 0, 0);
INSERT INTO `user_account` VALUES (14, 14, 0.00, 0.00, '2023-09-11 11:13:39', '2023-09-11 15:29:37', 0, 0);
INSERT INTO `user_account` VALUES (15, 15, 95000.01, 0.00, '2023-09-11 11:19:16', '2023-09-11 15:29:37', 0, 0);
INSERT INTO `user_account` VALUES (16, 16, 100000.00, 0.00, '2023-09-18 10:00:20', '2023-09-18 10:26:18', 0, 0);
INSERT INTO `user_account` VALUES (17, 17, 95000.01, 0.00, '2023-09-18 10:01:58', '2023-09-18 10:26:18', 0, 0);

-- ----------------------------
-- Table structure for user_bind
-- ----------------------------
DROP TABLE IF EXISTS `user_bind`;
CREATE TABLE `user_bind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '身份证号',
  `bank_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行类型',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `status` tinyint(3) NULL DEFAULT NULL COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_bind
-- ----------------------------
INSERT INTO `user_bind` VALUES (1, 9, '孙悟空', '14011019900512161X', '111111111111', '中国建设银行', '13300000000', NULL, 0, '2023-08-07 17:15:56', '2023-08-07 17:15:56', 0);
INSERT INTO `user_bind` VALUES (2, 7, '猪八戒', '14011019900512162X', '111111111111', '中国建设银行', '13100000000', NULL, 0, '2023-08-07 17:22:40', '2023-08-07 17:22:40', 0);
INSERT INTO `user_bind` VALUES (3, 8, '沙和尚', '14011019900512163X', '111111111113', '中国建设银行', '13200000000', '5c31e92f26294157b453cfa81d719189', 1, '2023-08-07 17:31:32', '2023-08-07 17:31:32', 0);
INSERT INTO `user_bind` VALUES (4, 10, '唐僧', '140110199005121611', '6227000265970203700', '中国建设银行', '13400000000', 'c1bccfe18a5942b89f08549b76eda732', 1, '2023-08-09 08:11:17', '2023-08-09 08:11:17', 0);
INSERT INTO `user_bind` VALUES (5, 11, '投资人一', '140110199005121620', '14011019900', '中国建设银行', '13900000000', '7fd66955d6124f2cbcbaf59d97aeecc9', 1, '2023-08-09 21:12:21', '2023-08-09 21:12:21', 0);
INSERT INTO `user_bind` VALUES (6, 12, '投资者二', '140110199005121612', '111111111112', '中国建设银行', '13300000000', '61802e4825aa4f02ad1bdbf376424e08', 1, '2023-08-09 21:26:52', '2023-08-09 21:26:52', 0);
INSERT INTO `user_bind` VALUES (7, 13, '投资者三', '140110199005121613', '14011019900512', '中国建设银行', '13300000003', '1d425c49d853426f896ebed6f9175b93', 1, '2023-08-11 17:32:00', '2023-08-11 17:32:00', 0);
INSERT INTO `user_bind` VALUES (8, 15, '晁盖', '140110199005121601', '111111111111', '中国建设银行', '13300000001', 'f1f0e71d0b2a40fc8254f4fa08c55109', 1, '2023-09-11 14:35:23', '2023-09-11 14:35:23', 0);
INSERT INTO `user_bind` VALUES (9, 14, '范蠡', '140110199005121100', '111111111111', '民生银行', '13100000001', 'b6489eae0434414a9134ee01affdecab', 1, '2023-09-11 15:17:02', '2023-09-11 15:17:02', 0);
INSERT INTO `user_bind` VALUES (10, 17, '卢俊义', '111111111111111111', '111111111111111111', '民生银行', '13900000007', '5745d27cefb64b68a7a591261172a756', 1, '2023-09-18 10:04:38', '2023-09-18 10:04:38', 0);
INSERT INTO `user_bind` VALUES (11, 16, '高太尉', '22222222222222222', '22222222222222222', '民生银行', '13900000006', 'b497a511591f4016a9bcf9e4444ccc18', 1, '2023-09-18 10:20:01', '2023-09-18 10:20:01', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '1：出借人 2：借款人',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `nick_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `openid` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户标识openid',
  `head_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `bind_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '绑定状态（0：未绑定，1：绑定成功 -1：绑定失败）',
  `borrow_auth_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '借款人认证状态（0：未认证 1：认证中 2：认证通过 -1：认证失败）',
  `bind_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定账户协议号',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `status` tinyint(3) NOT NULL DEFAULT 1 COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (7, 2, '13100000000', 'ac6ddfa5fe989be61f6caa89edb6da75', '13100000000', '13100000000', NULL, NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 0, 2, NULL, 220, 1, '2023-08-07 15:57:47', '2023-08-07 16:22:05', 0);
INSERT INTO `user_info` VALUES (8, 2, '13200000000', 'ac6ddfa5fe989be61f6caa89edb6da75', '13200000000', '沙和尚', '14011019900512163X', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 2, '5c31e92f26294157b453cfa81d719189', 220, 1, '2023-08-07 15:59:53', '2023-08-07 16:28:26', 0);
INSERT INTO `user_info` VALUES (9, 2, '13300000000', 'ac6ddfa5fe989be61f6caa89edb6da75', '13300000000', '13300000000', NULL, NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 0, 0, NULL, 0, 1, '2023-08-07 16:26:20', '2023-08-07 16:28:29', 0);
INSERT INTO `user_info` VALUES (10, 2, '13400000000', 'ac6ddfa5fe989be61f6caa89edb6da75', '13400000000', '唐僧', '140110199005121611', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 2, 'c1bccfe18a5942b89f08549b76eda732', 220, 1, '2023-08-09 08:04:36', '2023-08-09 08:04:36', 0);
INSERT INTO `user_info` VALUES (11, 1, '13900000000', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000000', '投资人一', '140110199005121620', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 0, '7fd66955d6124f2cbcbaf59d97aeecc9', 0, 1, '2023-08-09 21:02:39', '2023-08-09 21:02:39', 0);
INSERT INTO `user_info` VALUES (12, 1, '13900000002', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000002', '投资者二', '140110199005121612', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 0, '61802e4825aa4f02ad1bdbf376424e08', 0, 1, '2023-08-09 21:25:30', '2023-08-09 21:25:30', 0);
INSERT INTO `user_info` VALUES (13, 1, '13900000003', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000003', '投资者三', '140110199005121613', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 0, '1d425c49d853426f896ebed6f9175b93', 0, 1, '2023-08-11 17:30:41', '2023-08-11 17:30:42', 0);
INSERT INTO `user_info` VALUES (14, 1, '13900000004', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000004', '范蠡', '140110199005121100', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 0, 'b6489eae0434414a9134ee01affdecab', 0, 1, '2023-09-11 11:13:39', '2023-09-11 11:13:40', 0);
INSERT INTO `user_info` VALUES (15, 2, '13900000005', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000005', '晁盖', '140110199005121601', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 2, 'f1f0e71d0b2a40fc8254f4fa08c55109', 220, 1, '2023-09-11 11:19:16', '2023-09-11 11:19:17', 0);
INSERT INTO `user_info` VALUES (16, 1, '13900000006', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000006', '高太尉', '22222222222222222', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 0, 'b497a511591f4016a9bcf9e4444ccc18', 0, 1, '2023-09-18 10:00:20', '2023-09-18 10:00:20', 0);
INSERT INTO `user_info` VALUES (17, 2, '13900000007', 'ac6ddfa5fe989be61f6caa89edb6da75', '13900000007', '卢俊义', '111111111111111111', NULL, NULL, 'https://finance-0528.oss-cn-beijing.aliyuncs.com/logo.png', 1, 2, '5745d27cefb64b68a7a591261172a756', 220, 1, '2023-09-18 10:01:58', '2023-09-18 10:01:59', 0);

-- ----------------------------
-- Table structure for user_integral
-- ----------------------------
DROP TABLE IF EXISTS `user_integral`;
CREATE TABLE `user_integral`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获取积分说明',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户积分记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_integral
-- ----------------------------
INSERT INTO `user_integral` VALUES (1, 7, 30, '借款人基本信息', '2023-08-08 12:21:38', '2023-08-08 12:21:38', 0);
INSERT INTO `user_integral` VALUES (2, 7, 30, '借款人身份证信息', '2023-08-08 12:21:38', '2023-08-08 12:21:38', 0);
INSERT INTO `user_integral` VALUES (3, 7, 100, '借款人房产信息', '2023-08-08 12:21:38', '2023-08-08 12:21:38', 0);
INSERT INTO `user_integral` VALUES (4, 7, 60, '借款人车辆信息', '2023-08-08 12:21:38', '2023-08-08 12:21:38', 0);
INSERT INTO `user_integral` VALUES (5, 8, 30, '借款人基本信息', '2023-08-08 18:23:23', '2023-08-08 18:23:23', 0);
INSERT INTO `user_integral` VALUES (6, 8, 30, '借款人身份证信息', '2023-08-08 18:23:23', '2023-08-08 18:23:23', 0);
INSERT INTO `user_integral` VALUES (7, 8, 100, '借款人房产信息', '2023-08-08 18:23:23', '2023-08-08 18:23:23', 0);
INSERT INTO `user_integral` VALUES (8, 8, 60, '借款人车辆信息', '2023-08-08 18:23:23', '2023-08-08 18:23:23', 0);
INSERT INTO `user_integral` VALUES (9, 10, 30, '借款人基本信息', '2023-08-09 08:07:40', '2023-08-09 08:07:40', 0);
INSERT INTO `user_integral` VALUES (10, 10, 30, '借款人身份证信息', '2023-08-09 08:07:40', '2023-08-09 08:07:40', 0);
INSERT INTO `user_integral` VALUES (11, 10, 100, '借款人房产信息', '2023-08-09 08:07:40', '2023-08-09 08:07:40', 0);
INSERT INTO `user_integral` VALUES (12, 10, 60, '借款人车辆信息', '2023-08-09 08:07:40', '2023-08-09 08:07:40', 0);
INSERT INTO `user_integral` VALUES (13, 15, 30, '借款人基本信息', '2023-09-11 14:54:45', '2023-09-11 14:54:45', 0);
INSERT INTO `user_integral` VALUES (14, 15, 30, '借款人身份证信息', '2023-09-11 14:54:45', '2023-09-11 14:54:45', 0);
INSERT INTO `user_integral` VALUES (15, 15, 100, '借款人房产信息', '2023-09-11 14:54:45', '2023-09-11 14:54:45', 0);
INSERT INTO `user_integral` VALUES (16, 15, 60, '借款人车辆信息', '2023-09-11 14:54:45', '2023-09-11 14:54:45', 0);
INSERT INTO `user_integral` VALUES (17, 17, 30, '借款人基本信息', '2023-09-18 10:12:16', '2023-09-18 10:12:16', 0);
INSERT INTO `user_integral` VALUES (18, 17, 30, '借款人身份证信息', '2023-09-18 10:12:16', '2023-09-18 10:12:16', 0);
INSERT INTO `user_integral` VALUES (19, 17, 100, '借款人房产信息', '2023-09-18 10:12:16', '2023-09-18 10:12:16', 0);
INSERT INTO `user_integral` VALUES (20, 17, 60, '借款人车辆信息', '2023-09-18 10:12:16', '2023-09-18 10:12:16', 0);

-- ----------------------------
-- Table structure for user_login_record
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户登录记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------
INSERT INTO `user_login_record` VALUES (1, 9, '192.168.7.1', '2023-08-07 16:28:32', '2023-08-07 16:28:32', 0);
INSERT INTO `user_login_record` VALUES (2, 9, '192.168.7.1', '2023-08-07 17:10:39', '2023-08-07 17:10:39', 0);
INSERT INTO `user_login_record` VALUES (3, 7, '192.168.7.1', '2023-08-07 17:21:47', '2023-08-07 17:21:47', 0);
INSERT INTO `user_login_record` VALUES (4, 8, '192.168.7.1', '2023-08-07 17:30:51', '2023-08-07 17:30:51', 0);
INSERT INTO `user_login_record` VALUES (5, 7, '192.168.7.1', '2023-08-08 08:02:12', '2023-08-08 08:02:12', 0);
INSERT INTO `user_login_record` VALUES (6, 7, '192.168.7.1', '2023-08-08 08:29:55', '2023-08-08 08:29:55', 0);
INSERT INTO `user_login_record` VALUES (7, 7, '192.168.7.1', '2023-08-08 17:45:42', '2023-08-08 17:45:42', 0);
INSERT INTO `user_login_record` VALUES (8, 8, '192.168.7.1', '2023-08-08 18:06:57', '2023-08-08 18:06:57', 0);
INSERT INTO `user_login_record` VALUES (9, 7, '192.168.7.1', '2023-08-08 18:08:10', '2023-08-08 18:08:10', 0);
INSERT INTO `user_login_record` VALUES (10, 7, '192.168.7.1', '2023-08-08 18:08:13', '2023-08-08 18:08:13', 0);
INSERT INTO `user_login_record` VALUES (11, 7, '192.168.7.1', '2023-08-08 18:08:20', '2023-08-08 18:08:20', 0);
INSERT INTO `user_login_record` VALUES (12, 7, '192.168.7.1', '2023-08-08 18:08:31', '2023-08-08 18:08:31', 0);
INSERT INTO `user_login_record` VALUES (13, 7, '192.168.7.1', '2023-08-08 18:08:39', '2023-08-08 18:08:39', 0);
INSERT INTO `user_login_record` VALUES (14, 7, '192.168.7.1', '2023-08-08 18:10:27', '2023-08-08 18:10:27', 0);
INSERT INTO `user_login_record` VALUES (15, 8, '192.168.7.1', '2023-08-08 18:17:34', '2023-08-08 18:17:34', 0);
INSERT INTO `user_login_record` VALUES (16, 10, '192.168.7.1', '2023-08-09 08:04:51', '2023-08-09 08:04:51', 0);
INSERT INTO `user_login_record` VALUES (17, 10, '192.168.7.1', '2023-08-09 20:19:24', '2023-08-09 20:19:24', 0);
INSERT INTO `user_login_record` VALUES (18, 11, '192.168.7.1', '2023-08-09 21:02:50', '2023-08-09 21:02:50', 0);
INSERT INTO `user_login_record` VALUES (19, 11, '192.168.7.1', '2023-08-09 21:10:31', '2023-08-09 21:10:31', 0);
INSERT INTO `user_login_record` VALUES (20, 12, '192.168.7.1', '2023-08-09 21:25:42', '2023-08-09 21:25:42', 0);
INSERT INTO `user_login_record` VALUES (21, 12, '192.168.7.1', '2023-08-11 06:53:46', '2023-08-11 06:53:46', 0);
INSERT INTO `user_login_record` VALUES (22, 13, '192.168.7.1', '2023-08-11 17:30:50', '2023-08-11 17:30:50', 0);
INSERT INTO `user_login_record` VALUES (23, 10, '192.168.7.1', '2023-08-12 09:17:08', '2023-08-12 09:17:08', 0);
INSERT INTO `user_login_record` VALUES (24, 14, '192.168.7.1', '2023-09-11 11:17:00', '2023-09-11 11:17:00', 0);
INSERT INTO `user_login_record` VALUES (25, 15, '192.168.7.1', '2023-09-11 11:19:29', '2023-09-11 11:19:29', 0);
INSERT INTO `user_login_record` VALUES (26, 15, '192.168.7.1', '2023-09-11 11:40:18', '2023-09-11 11:40:18', 0);
INSERT INTO `user_login_record` VALUES (27, 14, '192.168.7.1', '2023-09-11 15:14:48', '2023-09-11 15:14:48', 0);
INSERT INTO `user_login_record` VALUES (28, 16, '10.84.139.135', '2023-09-18 10:01:11', '2023-09-18 10:01:11', 0);
INSERT INTO `user_login_record` VALUES (29, 17, '10.84.139.135', '2023-09-18 10:02:22', '2023-09-18 10:02:22', 0);
INSERT INTO `user_login_record` VALUES (30, 16, '10.84.139.135', '2023-09-18 10:19:04', '2023-09-18 10:19:04', 0);
INSERT INTO `user_login_record` VALUES (31, 17, '10.84.139.135', '2023-09-18 10:29:39', '2023-09-18 10:29:39', 0);
INSERT INTO `user_login_record` VALUES (32, 17, '10.84.139.135', '2023-09-18 10:29:40', '2023-09-18 10:29:40', 0);
INSERT INTO `user_login_record` VALUES (33, 17, '10.84.139.135', '2023-09-18 10:30:01', '2023-09-18 10:30:01', 0);
INSERT INTO `user_login_record` VALUES (34, 17, '10.84.139.135', '2023-09-18 10:39:20', '2023-09-18 10:39:20', 0);
INSERT INTO `user_login_record` VALUES (35, 17, '10.84.139.135', '2023-09-18 10:46:01', '2023-09-18 10:46:01', 0);

SET FOREIGN_KEY_CHECKS = 1;
