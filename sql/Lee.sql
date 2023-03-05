/*
 Navicat Premium Data Transfer

 Source Server         : 李寻
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 21/02/2023 19:44:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员账户',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin');
INSERT INTO `admin` VALUES (2, 'admin1', 'admin');

-- ----------------------------
-- Table structure for cinema
-- ----------------------------
DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影院id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院名称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院电话',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院所在区县',
  `specified_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影院详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cinema
-- ----------------------------
INSERT INTO `cinema` VALUES (1, '中影4KMAX国际影城（西丽店）', '0755-28119118', '广东省', '深圳市', '南山区', '南山区留仙大道2188号悦方广场一楼（留仙洞地铁站B出口）');
INSERT INTO `cinema` VALUES (2, '中影星美国际影城（南山云城店）', '0755-86522580', '广东省', '深圳市', '南山区', '南山区西丽街道留仙洞打石二路1号万科云城5层L5-015M-02号');
INSERT INTO `cinema` VALUES (3, '中影红树林国际影城（前海店）', '0755-86165216', '广东省', '深圳市', '南山区', '南山区桂湾三路龙海商业广场北区13-17号铺');
INSERT INTO `cinema` VALUES (4, '华夏君盛影城（南山店）', '0755-29902555', '广东省', '深圳市', '南山区', '深圳市南山区南头街道前海路港湾丽都二楼');
INSERT INTO `cinema` VALUES (5, '百川国际影城（南山欢乐颂店）', '0755-86605666', '广东省', '深圳市', '南山区', '深圳市南山区南新路3030号欢乐颂Fun2F5');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `user_score` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户评分',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '用户评论内容',
  `comment_date` datetime(6) NULL DEFAULT NULL COMMENT '评论日期',
  `support_num` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '点赞数',
  `support_user` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '点赞用户数组',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `movie_id`(`movie_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, 1, 12, 10, '好看！', '2021-03-14 02:40:36.000000', 2, '[1,2]');
INSERT INTO `comment` VALUES (3, 2, 12, 9, 'good!', '2021-03-14 02:44:10.000000', NULL, NULL);
INSERT INTO `comment` VALUES (4, 3, 13, 10, '好看!', '2021-03-31 16:10:38.000000', NULL, NULL);

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `headline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求标题',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态(1..待启动、2.开发中、3.开发完成 4.需求暂停)',
  `type` bigint(255) NULL DEFAULT NULL COMMENT '需求类型1:产品需求，2:技术需求,3:设计需求 4.运营需求.5.bug修复',
  `creation_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `developer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发人员',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '实际开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '完成时间/结束时间',
  `workload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际工作量(天)',
  `PRD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PRD文档',
  `priority` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优先级',
  `schedule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否排期',
  `project` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否规划',
  `predict_start_time` datetime(0) NULL DEFAULT NULL COMMENT '需求开始时间',
  `predict_end_time` datetime(0) NULL DEFAULT NULL COMMENT '需求结束时间',
  `predict_workload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计工作量(天)',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `demand_owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求Owner',
  `demand_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求描述',
  `success_state` int(255) NULL DEFAULT NULL COMMENT '完成状态(1:按时完成,2:提前完成，3:超时完成)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demand
-- ----------------------------
INSERT INTO `demand` VALUES (8, '需求登录注册3', 1, 2, '2022-12-12 16:27:15', '100', NULL, NULL, NULL, 'https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1', 'P1', NULL, '本月工作', '2022-12-13 00:00:00', '2022-12-17 00:00:00', NULL, NULL, 'admin', '1231323', NULL);
INSERT INTO `demand` VALUES (9, '需求登录注册4', 3, 1, '2022-12-13 16:28:02', '1,100', '2022-12-13 16:30:00', '2022-12-13 16:52:50', '0', 'https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1', 'P1', NULL, '本月工作', '2022-12-13 00:00:00', '2022-12-14 00:00:00', '1', '2022-12-13 16:53:20', 'admin', '1231323', 2);
INSERT INTO `demand` VALUES (10, '需求登录注册5', 2, 3, '2022-12-13 16:28:18', '1,100', '2022-12-13 00:00:00', NULL, NULL, 'https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1', 'P1', NULL, '本月工作', '2022-12-14 00:00:00', '2022-12-15 00:00:00', '1', '2022-12-14 13:28:25', 'admin', '1231323', NULL);
INSERT INTO `demand` VALUES (11, '需求登录注册5', 1, 4, '2022-12-13 16:28:47', '1,100', NULL, NULL, NULL, 'https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1', 'P1', NULL, '下月规划', '2023-01-01 00:00:00', '2023-01-15 00:00:00', NULL, NULL, 'admin', '1231323', NULL);
INSERT INTO `demand` VALUES (12, '需求登录注册6', 1, 5, '2022-12-13 16:29:30', '1,100', NULL, NULL, NULL, 'https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1', 'P1', NULL, '本月工作', '2022-12-10 00:00:00', '2022-12-20 00:00:00', NULL, NULL, 'admin', '1231323', NULL);
INSERT INTO `demand` VALUES (13, '11111', 1, 4, '2022-12-13 17:52:33', '1', NULL, NULL, NULL, '1111111111111', 'P1', NULL, '下月工作', '2022-12-01 00:00:00', '2022-12-15 00:00:00', NULL, NULL, 'admin', '11111111111111111111', NULL);
INSERT INTO `demand` VALUES (17, '111111111', 1, 3, '2022-12-13 17:57:40', '100', NULL, NULL, NULL, '1111111111', 'P2', NULL, '本月工作', '2022-12-08 00:00:00', '2022-12-24 00:00:00', NULL, NULL, 'admin', '111111111111111111', NULL);
INSERT INTO `demand` VALUES (19, '22222222', 1, 2, '2022-12-14 13:58:28', '1,100', NULL, NULL, NULL, '2222222222222222', 'P1', NULL, '下月工作', '2022-12-16 00:00:00', '2022-12-29 00:00:00', NULL, NULL, 'admin', '222222222222222222222222', NULL);
INSERT INTO `demand` VALUES (20, '22222222', 1, 2, '2022-12-14 13:59:25', '1,100', NULL, NULL, NULL, '2222222222222222', 'P1', NULL, '下月工作', '2022-12-16 00:00:00', '2022-12-29 00:00:00', NULL, NULL, 'admin', '222222222222222222222222', NULL);
INSERT INTO `demand` VALUES (23, '111111', 1, 2, '2022-12-14 16:56:20', '1', NULL, NULL, NULL, '11111111111111', 'P1', NULL, '本月工作', '2022-12-15 00:00:00', '2022-12-16 00:00:00', NULL, NULL, 'admin', '11111111111111111', NULL);
INSERT INTO `demand` VALUES (24, '11111111', 1, 1, '2022-12-14 16:57:17', '1,100', NULL, NULL, NULL, '111111111111', 'P1', NULL, '本月工作', '2022-12-15 00:00:00', '2022-12-16 00:00:00', NULL, NULL, 'admin', '11111111111111111', NULL);

-- ----------------------------
-- Table structure for demand_type
-- ----------------------------
DROP TABLE IF EXISTS `demand_type`;
CREATE TABLE `demand_type`  (
  `id` bigint(255) NOT NULL,
  `demand_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求类型名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of demand_type
-- ----------------------------
INSERT INTO `demand_type` VALUES (1, '产品需求', '2022-12-09 10:43:39', NULL);
INSERT INTO `demand_type` VALUES (2, '技术需求', '2022-12-09 10:43:48', NULL);
INSERT INTO `demand_type` VALUES (3, '设计需求', '2022-12-09 10:43:56', NULL);
INSERT INTO `demand_type` VALUES (4, '运营需求', '2022-12-09 10:44:03', NULL);
INSERT INTO `demand_type` VALUES (5, 'bug修复', '2022-12-09 10:44:11', NULL);

-- ----------------------------
-- Table structure for financing
-- ----------------------------
DROP TABLE IF EXISTS `financing`;
CREATE TABLE `financing`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `person_sum` int(255) NULL DEFAULT NULL COMMENT '众筹人数',
  `amount` int(255) NULL DEFAULT NULL COMMENT '众筹金额(单次)',
  `amount_sum` int(255) NULL DEFAULT NULL COMMENT '总金额',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态(0=待审核 1==审核成功，2= 审核失败)',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of financing
-- ----------------------------
INSERT INTO `financing` VALUES (5, '2', 3, 1, 3, '2023-02-20 14:58:39', '2023-02-20 20:02:46', 2, '/group1/M00/03/D7/CgAIC2PzGh2AagpMAADb7K8c9xU087.jpg', 'admin');
INSERT INTO `financing` VALUES (6, '213', 2, 123, 246, '2023-02-20 20:00:11', '2023-02-21 19:40:47', 1, '/group1/M00/03/D8/CgAIC2PzYMmAeOPDAADb7K8c9xU182.jpg', 'admin');
INSERT INTO `financing` VALUES (7, '1', 0, 1, 1, '2023-02-20 20:15:48', NULL, 0, '/group1/M00/03/D8/CgAIC2PzZHKAOzPAAADb7K8c9xU437.jpg', 'admin');
INSERT INTO `financing` VALUES (8, '113232', 0, 231321, 231321, '2023-02-21 19:39:50', NULL, 0, '/group1/M00/03/D9/CgAIC2P0rXyADuj4AADb7K8c9xU810.jpg', 'Lee0625');

-- ----------------------------
-- Table structure for financing_info
-- ----------------------------
DROP TABLE IF EXISTS `financing_info`;
CREATE TABLE `financing_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户',
  `count` int(10) NULL DEFAULT NULL COMMENT '数量',
  `amount` int(255) NULL DEFAULT NULL COMMENT '众筹金额',
  `fina_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of financing_info
-- ----------------------------
INSERT INTO `financing_info` VALUES (1, 'admin', 1, 1, '1', '2023-02-20 15:39:31', NULL);
INSERT INTO `financing_info` VALUES (2, 'admin', 1, 1, '1', '2023-02-20 15:40:26', NULL);
INSERT INTO `financing_info` VALUES (3, 'admin', 1, 1, '2', '2023-02-20 15:41:04', NULL);
INSERT INTO `financing_info` VALUES (6, 'admin', 1, 1, '2', '2023-02-20 20:02:46', NULL);
INSERT INTO `financing_info` VALUES (7, '李寻', 1, 1, '213', '2023-02-21 14:18:31', NULL);
INSERT INTO `financing_info` VALUES (8, 'Lee0625', 1, 1, '213', '2023-02-21 19:40:47', NULL);

-- ----------------------------
-- Table structure for financing_log
-- ----------------------------
DROP TABLE IF EXISTS `financing_log`;
CREATE TABLE `financing_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `financing_id` bigint(20) NULL DEFAULT NULL COMMENT '项目id',
  `sysuser_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `status` int(255) NULL DEFAULT NULL COMMENT '状态(1=审核成功 2=审核失败)',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of financing_log
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (15, 'financing', '', NULL, NULL, 'Financing', 'crud', 'com.ruoyi.system', 'system', 'financing', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-02-20 13:10:29', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (16, 'financing_info', '', NULL, NULL, 'FinancingInfo', 'crud', 'com.ruoyi.system', 'system', 'info', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-02-20 13:10:29', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (17, 'financing_log', '', NULL, NULL, 'FinancingLog', 'crud', 'com.ruoyi.system', 'system', 'log', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-02-20 13:10:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (132, '15', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (133, '15', 'project_name', '项目名称', 'varchar(255)', 'String', 'projectName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (134, '15', 'person_sum', '众筹人数', 'int(255)', 'Long', 'personSum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (135, '15', 'amount', '众筹金额(单次)', 'int(255)', 'Long', 'amount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, '15', 'amount_sum', '总金额', 'varchar(255)', 'String', 'amountSum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, '15', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, '15', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '15', 'status', '状态(1=待审核 2= 审核成功)', 'int(255)', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '15', 'pic', '图片', 'varchar(255)', 'String', 'pic', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '15', 'user_id', '用户id', 'bigint(20)', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '16', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '16', 'user', '用户', 'bigint(255)', 'Long', 'user', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '16', 'count', '数量', 'int(10)', 'Integer', 'count', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '16', 'amount', '众筹金额', 'int(255)', 'Long', 'amount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '16', 'fina_id', '项目id', 'bigint(20)', 'Long', 'finaId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '16', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '16', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '17', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '17', 'financing_id', '项目id', 'bigint(20)', 'Long', 'financingId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '17', 'sysuser_id', '管理员id', 'bigint(20)', 'Long', 'sysuserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '17', 'status', '状态(1=审核成功 2=审核失败)', 'int(255)', 'Long', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '17', 'note', '备注', 'varchar(255)', 'String', 'note', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '17', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2023-02-20 13:10:29', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '17', 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2023-02-20 13:10:29', '', NULL);

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '影厅id',
  `cinema_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cinema_id`(`cinema_id`) USING BTREE,
  CONSTRAINT `hall_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES (1, 1, '1号厅');
INSERT INTO `hall` VALUES (2, 1, '2号厅');
INSERT INTO `hall` VALUES (3, 1, '3号厅');
INSERT INTO `hall` VALUES (4, 2, '1号厅');
INSERT INTO `hall` VALUES (5, 2, '2号厅');
INSERT INTO `hall` VALUES (6, 2, '3号厅');
INSERT INTO `hall` VALUES (7, 3, '1号厅');
INSERT INTO `hall` VALUES (8, 3, '2号厅');
INSERT INTO `hall` VALUES (9, 3, '3号厅');
INSERT INTO `hall` VALUES (10, 4, '1号厅');
INSERT INTO `hall` VALUES (11, 4, '2号厅');
INSERT INTO `hall` VALUES (12, 4, '3号厅');
INSERT INTO `hall` VALUES (13, 5, '1号厅');
INSERT INTO `hall` VALUES (14, 5, '2号厅');
INSERT INTO `hall` VALUES (15, 5, '3号厅');

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '电影id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影名称',
  `poster` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影海报',
  `director` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '导演',
  `actor` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '主演',
  `movie_long` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影片长',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影语言版本',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '电影简介',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影类型',
  `public_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '电影上映时间',
  `wish_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '想看人数',
  `score` decimal(4, 1) NULL DEFAULT NULL COMMENT '电影综合评分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '钢铁侠3', '/poster/16156559621221.jpg', '沙恩·布莱克', '小罗伯特·唐尼、格温妮斯·帕特洛', '134分钟', '英语', '自纽约事件以来，托尼·斯塔克（小罗伯特·唐尼饰）为前所未有的焦虑症所困扰。他疯狂投入钢铁侠升级版的研发，为此废寝忘食，甚至忽略了女友佩珀·波茨（格温妮斯·帕特洛饰）的感受。\n与此同时，臭名昭著的恐怖头目“曼达林”（本·金斯利饰）制造了一连串的爆炸事件，托尼当年最忠诚的保镖哈皮即在最近的一次袭击中身受重伤。托尼、佩珀以及曾与他有过一面之缘的女植物学家玛雅（丽贝卡·豪尔饰）在家中遭到猛烈的炮火袭击，几乎丧命，而这一切似乎都与22年前那名偶然邂逅的科学家阿尔德里奇·基连（盖·皮尔斯饰）及其终极生物的研究有关。即使有精密先进的铠甲护身，也无法排遣发自心底的焦虑。被击碎一切的托尼，如何穿越来自地狱的熊熊烈火。\n', '科幻', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (2, '哆啦A梦：伴我同行', '/poster/16156562931442.jpg', '八木龙一，山崎贵', '水田山葵、大原惠、嘉数由美、木村昴、关智一', '95分钟', '日语', '为了什么都做不来的野比大雄，22 世纪的玄孙野比世修送了猫型机器人──哆啦A梦来现代。\n笨笨的野比大雄原本自己开了间公司，但很不幸的倒闭，之后剩下了一屁股债务，子孙们吃了莫大的苦。于是，野比世修才打算送哆啦A梦到现代，打算改变大雄的未来，并且为哆啦A梦设定了完成程式，如果野比大雄不幸福的话，哆啦A梦就不能回22世纪。\n哆啦A梦于是开始勉勉强强的协助野比大雄的日常生活。虽然刚开始不太习惯，但两个人的关系也日渐变的紧密。得知野比大雄的梦想是打算与梦中情人的同班同学源静香结婚以后，哆啦A梦就想尽办法要帮助野比大雄获得静香的芳心。\n正当源静香总算答应了野比大雄的求婚的时候，任务完成的哆啦A梦却被完成程式要求，要在48小时内回到22世纪。难道，得到了什么，自然的，也会失去些什么这个命定的预言，没办法被哆啦A梦跟野比大雄突破。面对哆啦A梦即将离开的冲击，野比大雄又该如何自处。\n', '动漫', '2021-06-01', 0, NULL);
INSERT INTO `movie` VALUES (3, '我不是药神', '/poster/16156567525303.jpeg', '文牧野', '徐峥、周一围、王传君、谭卓、章宇、杨新鸣', '116分钟', '国语', '印度神油店老板程勇日子过得窝囊，店里没生意，老父病危，手术费筹不齐。前妻跟有钱人怀上了孩子，还要把他儿子的抚养权给拿走。一日，店里来了一个白血病患者，求他从印度带回一批仿制的特效药，好让买不起天价正版药的患者保住一线生机。百般不愿却走投无路的程勇，意外因此一夕翻身，平价特效药救人无数，让他被病患封为“药神”，但随着利益而来的，是一场让他的生活以及贫穷病患性命都陷入危机的多方拉锯战。\n', '剧情', '2021-05-14', 1, NULL);
INSERT INTO `movie` VALUES (4, '复仇者联盟4：终局之战', '/poster/16156568016944.jpg', '安东尼·罗素、乔·罗素', '小罗伯特·唐尼、克里斯·埃文斯、马克·鲁法洛、克里斯·海姆斯沃斯、斯嘉丽·约翰逊、杰瑞米·雷纳', '181分钟', '英语', '来自泰坦星的灭霸为了解决宇宙资源匮乏、人口暴增的问题，集齐了所有无限宝石，一个响指成功地使全宇宙生命随机减半。\n宇宙由于灭霸的行动而变得满目疮痍，但是五年之后，被困在量子领域的蚁人意外回到现实世界，他的出现为幸存的复仇者点燃了希望。无论前方将遭遇怎样的后果，幸存的复仇者都必须在剩余盟友的帮助下再一次集结，以逆转灭霸的所作所为，彻底恢复宇宙的秩序\n', '科幻', '2021-05-01', 1, NULL);
INSERT INTO `movie` VALUES (5, '扫毒2：天地对决', '/poster/16156568986525.jpg', '邱礼涛', '刘德华、古天乐、苗侨伟', '99分钟', '国语', '毒品市场维持四分天下的格局已久，自从地藏（古天乐饰）与墨西哥大毒枭合作扩张势力，策划一连串黑吃黑事件企图“毒霸”香港毒品市场，警员林正风（苗侨伟饰）便带着他的扫毒行动组全力追缉毒贩。而儿时亲眼目睹父亲被毒品所毁而嫉毒如仇的慈善家兼金融巨子余顺天（刘德华饰），悬赏一亿追杀香港最大毒贩，此举在社会上引起轩然大波。原来，余顺天和地藏有着不可告人的同门关系，一场天地对决一触即发。在二十年的同门情谊面前，兄弟二人又将如何面对这场“毒局”。与此同时，林正风妻子、同事在执行缉毒任务时被吸毒者和毒贩残忍杀害，背负着丧妻之痛的他也将与毒贩们展开殊死对决\n', '剧情', '2021-03-26', 0, NULL);
INSERT INTO `movie` VALUES (6, '升起的烟花，从下面看？还是从侧面看？', '/poster/16156569452526.jpg', '新房昭之，武内宣之', '广濑铃，菅田将晖，宫野真守，松隆子', '90分钟', '日语', '暑假，某个海边小镇。在烟花晚会之前，热热闹闹地聊着“升空的烟花从侧面看是圆的？还是平的？”这样的话题的同班同学。与此同时，典道暗恋着的奈砂，因为奈砂的母亲的再婚对象已确定所以要转学了。\n“我们私奔、吧”\n奈砂向典道发出了一起逃出小镇的邀请，却在那之前被母亲带走了。而典道只是眼睁睁地看着这些。\n“如果，那时候我…”\n没有救下奈砂的典道，因为心中的苛责而丢出了奈砂在海中捡到的不可思议的珠子。就这样，不知何时起，时间被倒回到了奈砂被带走之前的时候…。一次又一次被重复的一天，奈砂与典道的命运会？\n', '动漫', '2021-05-05', 0, NULL);
INSERT INTO `movie` VALUES (7, '你好，李焕英', '/poster/16156593162617.jpg', '贾玲', '贾玲、张小斐、沈腾、陈赫', '128分钟', '国语', '2001年的某一天，刚刚考上大学的贾晓玲（贾玲 饰）经历了人生中的一次大起大落。一心想要成为母亲骄傲的她却因母亲突遭严重意外，而悲痛万分。在贾晓玲情绪崩溃的状态下，竟意外的回到了1981年，并与年轻的母亲李焕英（张小斐 饰）相遇，二人形影不离，宛如闺蜜。与此同时，也结识了一群天真善良的好朋友。晓玲以为来到了这片“广阔天地”，她可以凭借自己超前的思维，让母亲“大有作为”，但结果却让晓玲感到意外\n', '言情', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (8, '唐人街探案3', '/poster/16156593537158.jpg', '陈思诚', '王宝强、刘昊然、妻夫木聪、托尼·贾', '136分钟', '国语', '继曼谷、纽约之后，东京再出大案。唐人街神探唐仁（王宝强 饰）、秦风（刘昊然 饰）受侦探野田昊（妻夫木聪 饰）的邀请前往破案。“CRIMASTER世界侦探排行榜”中的侦探们闻讯后也齐聚东京，加入挑战，而排名第一Q的现身，让这个大案更加扑朔迷离，一场亚洲最强神探之间的较量即将爆笑展开\n', '悬疑恐怖', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (9, '功夫', '/poster/16156593866869.jpg', '周星驰', '周星驰、黄圣依、陈国坤、元华、元秋、梁小龙', '95分钟', '国语', '故事发生在1930年代的中国南方某地。黑帮斧头帮在当地欺行霸市，且收买当地的警察逃脱指控。\n阿星（周星驰饰）整日梦想成为黑帮人物，但意志不坚、无所作为。只好冒充斧头帮，跑到黑帮无暇顾及的贫民窟——猪笼城寨敲诈点钱财。不料猪笼城寨的老百姓各个身怀绝技，阿星被众人暴打。恰好斧头帮路过，副头领被阿星的假斧头帮信号炮炸伤，阿星把此事嫁祸给猪笼城寨。帮众进入城寨寻事打斗，结果斧头帮被猪笼城寨的三位武功高手（五郎八卦棍、洪家铁线拳、十二路谭腿）大挫锐气，大失颜面，败阵而退。\n阿星回想起童年时，在奸商手上买了失传武功秘笈《如来神掌》，开始习武，有一天他看见一名不能说话的小女孩被多人欺负，欲见义勇为帮她解围，但反被他们击倒，甚至在阿星身上撒尿。这位哑女孩欲把手中的波板糖送给阿星，但阿星觉得自己深受侮辱，哭著离去，因此便打算在长大后去当坏人。\n斧头帮帮主随后请来两名杀手榜知名高手前去铲除这三个家伙，他俩利用手中古筝，弹出暗器（冲击波），在猪笼城寨杀了他们。猪笼城寨的包租公和包租婆最后忍无可忍，露出自己暗藏已久的功夫（太极拳、狮吼功），将这两名杀手打得落花流水、武功尽失，替三个邻居报了仇。\n斧头帮坐不住了，利用阿星开锁的手艺，从”非正常人类研究中心“（精神病院）放出了号称当今武林第一高人”火云邪神“（梁小龙饰），期望能对付猪笼城寨的武术高强的房东夫妇。火云邪神果然不负斧头帮之期望，力克包租公、包租婆。阿星在关键时候，叛离斧头帮，帮助包租公、包租婆，但不幸自己落入火云邪神手中。火云邪神把阿星打得差点一命呜呼，混乱中不但重创了包租婆和包租公，也要了斧头帮帮主的性命。并成了新的斧头帮帮主。但没想到火云邪神的几拳竟然打通了阿星的任督二脉，加上阿星年幼时练习的“如来神掌”，阿星一下子具有了震撼之极的武功。最终，火云邪神带斧头帮众前去猪笼城寨与阿星决斗，阿星使出“如来神掌”击破火云邪神的“蛤蟆功”，把火云邪神打败，而火云邪神最后的暗器”莲花毒箭“也被阿星破解，使火云邪神臣服于阿星。\n一切归于平静后，阿星和那位哑女孩重新相遇……\n', '动作', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (10, '哥斯拉：怪兽之王', '/poster/161565941817110.jpg', '迈克尔·道赫蒂', '凯尔·钱德勒，维拉·法梅加，米莉·博比·布朗，渡边谦，章子怡，布莱德利·惠特福德，莎莉·霍金斯', '132分钟', '英语', '动物基因组学（帝王计划）研究机构的一个小组在一座庙里研究着魔斯拉。她从幼体中孵出，在一群雇佣兵袭击这个机构时，魔斯拉逃了出去。然后她在一个瀑布包了茧，随后破茧而出，完成了全形态生长。在2014年，哥斯拉被整个世界看到后，“帝王组织”在水下建了一个基地，在这个位于水下好几英里的水中基地中，他们研究着哥斯拉和其它可能存在的生物。那是他们真正的研究核心 [2]  。\n长期沉睡于地底和冰川里面神秘的巨兽在星球上面已经有上万，甚至好几万年的历史，它要把这个星球重新夺回它自己的手下。为了大自然的一个自然平衡物，哥斯拉苏醒了，它去消灭那些未来可能会去损害大自然平衡的生物 [3]  。后来，哥斯拉和魔斯拉、拉顿以及它的强敌基多拉相遇。此前一直被认为只存在于神话当中的古老的超级怪兽一一登场，他们将为争夺“怪兽之王”而战，人类的生存也受到严重威胁\n', '科幻', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (11, '流浪地球', '/poster/161565944939911.jpg', '郭帆', '吴京、屈楚萧、赵今麦、李光洁、吴孟达', '136分钟', '国语', '近年来，科学家们发现太阳急速衰老膨胀，短时间内包括地球在内的整个太阳系都将被太阳所吞没。为了自救，人类提出一个名为“流浪地球”的大胆计划，即倾全球之力在地球表面建造上万座发动机和转向发动机，推动地球离开太阳系，用2500年的时间奔往新家园。\n中国航天员刘培强（吴京饰）在儿子刘启四岁那年前往领航员空间站，和国际同侪肩负起领航者的重任。转眼刘启（屈楚萧饰）长大，他带着妹妹韩朵朵（赵今麦饰）偷偷跑到地表，偷开外公韩子昂（吴孟达饰）的运输车，结果不仅遭到逮捕，还遭遇了全球发动机停摆的事件。为了修好发动机，阻止地球坠入木星，全球开始展开饱和式营救，连刘启他们的车也被强征加入。在与时间赛跑的过程中，无数的人前仆后继，奋不顾身，只为延续百代子孙生存的希望\n', '科幻', '2021-03-15', 0, NULL);
INSERT INTO `movie` VALUES (12, 'Hello Wrold', '/poster/161565948330912.jpeg', '伊藤智彦', '北村匠海、松坂桃李、滨边美波、钉宫理惠', '97分钟', '日语', '在京都居住的内向男高中生直实的面前，突然出现从10年后穿越而来26岁的自己。未来的直实告诉他，自己不久便会与琉璃相爱并指导直实如何去撩妹，可是之后烟花大会时她却会因为一场事故意外离世。 为了拯救爱人，16岁的直实卷入了这场现实与虚拟的记忆世界，经历了一系列超乎想象的事情。\n', '动漫', '2021-03-15', 2, NULL);
INSERT INTO `movie` VALUES (13, '天气之子', '/poster/161565951419413.jpg', '新海诚', '醍醐虎汰朗、森七菜', '112分钟', '日语', '“想尝试前往，那道光芒之中”\n高中一年级的夏天，从离岛离家出走，来到东京的帆高。但是他的生活立马变得穷困，在度过孤独的每一天之后终于找到的工作，是为古怪的超自然杂志撰稿。\n如同预示着他接下来的命运一般，连日不断地下雨。此时，在人潮熙熙攘攘的都市一角，帆高遇到了一位少女。\n由于某些缘故，少女·阳菜和弟弟两人一起坚强生活。而她，拥有不可思议的能力。\n“呐，现在开始就要放晴了哦”\n雨逐渐停止，街道笼罩在美丽的光芒中。那是仅仅在心中祈祷，就能让天空放晴的力量——\n', '动漫', '2021-03-17', 1, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `schedule_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '下单手机',
  `order_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户下单时间',
  `num` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '购买电影票数',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '电影票单价',
  `seat_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '座位信息',
  `pay_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `phone_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机取票码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `schedule_id`(`schedule_id`) USING BTREE,
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, 1, '13966668888', '2021-3-14', 4, 132.00, '[34,35,36,37]', '0', '485036');
INSERT INTO `order` VALUES (2, 2, 1, '13988886666', '2021-3-14', 2, 66.00, '[14,17]', '0', '342726');
INSERT INTO `order` VALUES (3, 3, 4, '15362749548', '2021-3-31', 4, 132.00, '[25,26,27,24]', '0', '159162');

-- ----------------------------
-- Table structure for project_approval
-- ----------------------------
DROP TABLE IF EXISTS `project_approval`;
CREATE TABLE `project_approval`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `project_sponsor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '立项人',
  `project_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目标题',
  `project_time` datetime(0) NULL DEFAULT NULL COMMENT '立项时间',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '评估结算时间',
  `predict_workload` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计工作量(天)',
  `developer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发人员',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的描述',
  `product_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品需求',
  `official_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文案需求',
  `front_end_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端需求',
  `background_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后台需求',
  `test_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '测试需求',
  `interaction_demand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交互需求',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `project_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目评估描述',
  `project_completeness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目完成度',
  `project_evaluation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目测评',
  `acceptor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收人',
  `check_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验收结果',
  `status` int(255) NULL DEFAULT NULL COMMENT '项目状态(1:进行中，2:已验收)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project_approval
-- ----------------------------
INSERT INTO `project_approval` VALUES (1, '2022-12-14 11:49:30', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', '开发', '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (2, '2022-12-14 11:52:14', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', '开发', '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (3, '2022-12-14 11:54:23', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', '开发', '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (4, '2022-12-14 13:02:50', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', '开发', '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (5, '2022-12-14 14:14:40', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', NULL, '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (6, '2022-12-14 14:18:55', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', NULL, '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);
INSERT INTO `project_approval` VALUES (7, '2022-12-14 14:19:21', NULL, 'admin', 'oa项目开发', '2022-12-14 00:00:00', '2022-12-20 00:00:00', '30', '100,1', '开发', '开发', '开发', '开发', '开发', '开发', '开发', '1111', NULL, NULL, NULL, '103', NULL, 1);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for remind
-- ----------------------------
DROP TABLE IF EXISTS `remind`;
CREATE TABLE `remind`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `state` int(11) NULL DEFAULT NULL COMMENT '状态(1:未提醒，2:已提醒)',
  `demand_id` bigint(20) NULL DEFAULT NULL COMMENT '需求id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `remind_time` datetime(0) NULL DEFAULT NULL COMMENT '提醒时间',
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '员工id',
  `type` bigint(255) NULL DEFAULT NULL COMMENT '类型(1、待办提醒,2、催办提醒,3、完成提示4、逾期提醒 5、删除提醒, 6、添加日报提醒)',
  `organizer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '催办人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of remind
-- ----------------------------
INSERT INTO `remind` VALUES (1, 2, 2, '2022-12-12 13:11:10', '2022-12-12 13:13:56', 1, NULL, NULL);
INSERT INTO `remind` VALUES (2, 2, 2, '2022-12-12 13:11:10', '2022-12-12 16:29:13', 100, NULL, NULL);
INSERT INTO `remind` VALUES (3, 2, 2, NULL, '2022-12-13 17:41:08', 1, 4, NULL);
INSERT INTO `remind` VALUES (4, 2, 2, NULL, '2022-12-12 16:29:13', 100, 4, NULL);
INSERT INTO `remind` VALUES (5, 2, 5, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (6, 2, 5, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (7, 2, 6, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (8, 2, 6, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (9, 2, 7, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (10, 2, 7, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (11, 2, 8, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (12, 2, 9, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (13, 2, 9, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (14, 2, 10, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (15, 2, 10, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (16, 2, 11, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (17, 2, 11, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (18, 2, 12, NULL, '2022-12-13 17:41:08', 1, 1, NULL);
INSERT INTO `remind` VALUES (19, 2, 12, NULL, '2022-12-13 17:41:24', 100, 1, NULL);
INSERT INTO `remind` VALUES (20, 2, 9, NULL, '2022-12-13 17:41:08', 1, 3, NULL);
INSERT INTO `remind` VALUES (21, 2, 9, NULL, '2022-12-13 17:41:08', 1, 3, NULL);
INSERT INTO `remind` VALUES (22, 2, 9, NULL, '2022-12-13 17:41:08', 1, 3, NULL);
INSERT INTO `remind` VALUES (23, 2, 9, NULL, '2022-12-13 17:41:24', 100, 3, NULL);
INSERT INTO `remind` VALUES (24, 1, 17, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (25, 1, 18, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (26, 1, 18, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (27, 1, 19, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (28, 1, 19, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (29, 1, 20, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (30, 1, 20, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (31, 1, 21, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (32, 1, 21, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (33, 1, 22, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (34, 1, 18, '2022-12-14 16:42:11', NULL, 1, 2, NULL);
INSERT INTO `remind` VALUES (35, 1, 18, '2022-12-14 16:42:11', NULL, 100, 2, NULL);
INSERT INTO `remind` VALUES (36, 1, 14, NULL, NULL, 1, 5, NULL);
INSERT INTO `remind` VALUES (37, 1, 18, NULL, NULL, 1, 5, NULL);
INSERT INTO `remind` VALUES (38, 1, 21, NULL, NULL, 1, 5, NULL);
INSERT INTO `remind` VALUES (39, 1, 22, NULL, NULL, 1, 5, NULL);
INSERT INTO `remind` VALUES (40, 1, 23, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (41, 1, 24, NULL, NULL, 1, 1, NULL);
INSERT INTO `remind` VALUES (42, 1, 24, NULL, NULL, 100, 1, NULL);
INSERT INTO `remind` VALUES (43, 1, 24, '2022-12-14 16:57:21', NULL, 1, 2, NULL);
INSERT INTO `remind` VALUES (44, 1, 24, '2022-12-14 16:57:21', NULL, 100, 2, NULL);

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '排片id',
  `movie_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  `cinema_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '影院id',
  `hall_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '影厅名字',
  `show_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映日期',
  `show_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放映时间',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '电影售价',
  `seat_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '座位信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `movie_id`(`movie_id`) USING BTREE,
  INDEX `cinema_id`(`cinema_id`) USING BTREE,
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES (1, 12, 1, '1号厅', '2021-03-15', '09:30', 33.00, '[34,35,36,37,14,17]');
INSERT INTO `schedule` VALUES (2, 6, 1, '1号厅', '2021-05-07', '20:20', 20.00, NULL);
INSERT INTO `schedule` VALUES (3, 7, 3, '1号厅', '2021-03-15', '09:30', 44.00, NULL);
INSERT INTO `schedule` VALUES (4, 13, 1, '1号厅', '2021-03-31', '20:20', 33.00, '[25,26,27,24]');
INSERT INTO `schedule` VALUES (5, 1, 1, '1号厅', '2021-03-31', '22:00', 33.00, NULL);
INSERT INTO `schedule` VALUES (6, 3, 1, '1号厅', '2021-05-14', '09:30', 33.00, NULL);
INSERT INTO `schedule` VALUES (7, 2, 1, '2号厅', '2021-06-01', '09:30', 33.00, NULL);
INSERT INTO `schedule` VALUES (8, 4, 1, '1号厅', '2021-05-01', '16:30', 44.00, NULL);
INSERT INTO `schedule` VALUES (9, 4, 1, '2号厅', '2021-05-01', '16:30', 44.00, NULL);
INSERT INTO `schedule` VALUES (10, 7, 4, '1号厅', '2021-04-01', '09:30', 33.00, NULL);
INSERT INTO `schedule` VALUES (11, 7, 4, '1号厅', '2021-04-01', '16:30', 33.00, NULL);
INSERT INTO `schedule` VALUES (12, 7, 4, '2号厅', '2021-04-01', '20:20', 33.00, NULL);
INSERT INTO `schedule` VALUES (13, 10, 5, '3号厅', '2021-03-31', '22:00', 33.00, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-12-07 11:04:40', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-12-07 11:04:40', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-12-07 11:04:40', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-12-07 11:04:40', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-12-07 11:04:40', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-12-07 11:04:40', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-12-07 11:04:40', '', '2022-12-07 11:43:23', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_job` VALUES (4, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '0 0 16 * * ? ', '1', '1', '1', 'admin', '2022-12-12 16:19:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (5, '日报提醒', 'DEFAULT', 'messageTask.dailyReminder', '0 0 18 * * ? ', '1', '1', '1', 'admin', '2022-12-12 16:20:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：3毫秒', '0', '', '2022-12-07 11:35:54');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:36:00');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:36:10');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：2毫秒', '0', '', '2022-12-07 11:40:40');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:40:50');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:41:00');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:41:10');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:41:20');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2022-12-07 11:41:30');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:41:40');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:41:50');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:00');
INSERT INTO `sys_job_log` VALUES (13, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:10');
INSERT INTO `sys_job_log` VALUES (14, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:20');
INSERT INTO `sys_job_log` VALUES (15, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:30');
INSERT INTO `sys_job_log` VALUES (16, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:40');
INSERT INTO `sys_job_log` VALUES (17, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:42:50');
INSERT INTO `sys_job_log` VALUES (18, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:43:00');
INSERT INTO `sys_job_log` VALUES (19, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:43:10');
INSERT INTO `sys_job_log` VALUES (20, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:43:20');
INSERT INTO `sys_job_log` VALUES (21, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '系统默认（有参） 总共耗时：0毫秒', '0', '', '2022-12-07 11:45:18');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '系统默认（多参） 总共耗时：2毫秒', '0', '', '2022-12-07 11:45:38');
INSERT INTO `sys_job_log` VALUES (23, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：7毫秒', '0', '', '2022-12-12 16:21:44');
INSERT INTO `sys_job_log` VALUES (24, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：11981毫秒', '0', '', '2022-12-12 16:22:21');
INSERT INTO `sys_job_log` VALUES (25, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：41000毫秒', '1', 'java.lang.reflect.InvocationTargetException\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:61)\r\n	at com.ruoyi.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:33)\r\n	at com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\r\n	at com.ruoyi.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:43)\r\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\r\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\r\nCaused by: java.lang.NullPointerException\r\n	at com.ruoyi.system.job.MessageTask.overdue(MessageTask.java:37)\r\n	... 10 more\r\n', '2022-12-12 16:23:56');
INSERT INTO `sys_job_log` VALUES (26, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：15340毫秒', '0', '', '2022-12-12 16:24:17');
INSERT INTO `sys_job_log` VALUES (27, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：73521毫秒', '0', '', '2022-12-12 16:25:51');
INSERT INTO `sys_job_log` VALUES (28, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：6051毫秒', '0', '', '2022-12-12 16:27:05');
INSERT INTO `sys_job_log` VALUES (29, '逾期提醒', 'DEFAULT', 'messageTask.overdue', '逾期提醒 总共耗时：54591毫秒', '0', '', '2022-12-12 16:28:26');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 532 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 11:09:26');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 11:13:31');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 11:13:38');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 11:13:45');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 11:52:10');
INSERT INTO `sys_logininfor` VALUES (105, '李健', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-07 11:52:19');
INSERT INTO `sys_logininfor` VALUES (106, '李健', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-07 11:52:23');
INSERT INTO `sys_logininfor` VALUES (107, '李健', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 11:52:26');
INSERT INTO `sys_logininfor` VALUES (108, '李健', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 11:53:33');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 11:53:37');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 13:25:28');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 13:29:32');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 13:29:35');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 13:33:18');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 14:13:51');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 14:14:30');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-07 14:14:33');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 14:14:38');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 14:25:13');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 14:25:19');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 15:02:33');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 15:29:02');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 15:35:57');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 15:44:16');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 15:48:38');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-07 15:53:58');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 15:53:59');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 16:01:10');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 16:07:02');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-07 16:09:47');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 16:09:51');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 16:17:36');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 16:38:16');
INSERT INTO `sys_logininfor` VALUES (133, 'string', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-07 16:45:06');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 17:06:44');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-07 17:36:10');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.91.72', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-07 17:47:31');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '192.168.91.72', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-07 17:52:43');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-07 17:55:54');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:01:50');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:15:03');
INSERT INTO `sys_logininfor` VALUES (141, 'string', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-08 09:34:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-08 09:34:59');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-08 09:36:58');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-08 09:37:09');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-08 09:37:58');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-08 09:37:58');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-08 09:38:04');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-08 09:38:31');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-08 09:38:31');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-08 09:39:22');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:39:46');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-08 09:44:21');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:44:24');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:51:00');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '192.168.91.91', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:53:03');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 09:53:26');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 10:47:43');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 14:58:39');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '192.168.91.72', '内网IP', 'Chrome 8', 'Windows 7', '0', '登录成功', '2022-12-08 16:18:17');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-08 16:29:41');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 09:05:01');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-09 09:24:52');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-09 09:24:55');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 09:25:01');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 09:25:01');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-09 09:25:04');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-09 09:25:05');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 09:25:13');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 09:25:13');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 09:27:26');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 09:27:26');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 09:27:29');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2022-12-09 09:27:29');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 09:27:34');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2022-12-09 09:27:34');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 09:27:40');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 09:27:40');
INSERT INTO `sys_logininfor` VALUES (178, '李健', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 09:28:07');
INSERT INTO `sys_logininfor` VALUES (179, '李健', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-09 09:46:23');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 09:46:27');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 10:08:31');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 11:11:44');
INSERT INTO `sys_logininfor` VALUES (183, 'string', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：string 不存在', '2022-12-09 11:18:01');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 11:18:46');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 13:25:22');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 13:26:16');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '192.168.204.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 13:32:36');
INSERT INTO `sys_logininfor` VALUES (188, 'string', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：string 不存在', '2022-12-09 13:35:41');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 13:41:32');
INSERT INTO `sys_logininfor` VALUES (190, 'string', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：string 不存在', '2022-12-09 13:45:15');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 13:45:27');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 14:39:46');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 14:40:21');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:03:55');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:08:59');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:14:29');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 15:35:47');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:35:47');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 15:36:08');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:36:08');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:38:49');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 15:40:10');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 15:40:13');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:40:13');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 15:40:14');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:40:14');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 15:40:15');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:40:15');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误4次', '2022-12-09 15:40:15');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:40:15');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:40:16');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误5次', '2022-12-09 15:40:16');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 15:40:16');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 15:40:16');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 15:40:17');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-09 15:40:17');
INSERT INTO `sys_logininfor` VALUES (217, 'dsad', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsad 不存在', '2022-12-09 15:41:23');
INSERT INTO `sys_logininfor` VALUES (218, 'dasdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasdas 不存在', '2022-12-09 15:41:36');
INSERT INTO `sys_logininfor` VALUES (219, 'dasdasd', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasdasd 不存在', '2022-12-09 15:43:50');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:45:37');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:45:37');
INSERT INTO `sys_logininfor` VALUES (222, '李健', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:46:11');
INSERT INTO `sys_logininfor` VALUES (223, '李健', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 15:46:48');
INSERT INTO `sys_logininfor` VALUES (224, '1111', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '登录用户：1111 不存在', '2022-12-09 15:46:54');
INSERT INTO `sys_logininfor` VALUES (225, '1111', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '登录用户：1111 不存在', '2022-12-09 15:46:54');
INSERT INTO `sys_logininfor` VALUES (226, 'ry', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 15:47:08');
INSERT INTO `sys_logininfor` VALUES (227, 'ry', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:47:08');
INSERT INTO `sys_logininfor` VALUES (228, 'ry', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:47:11');
INSERT INTO `sys_logininfor` VALUES (229, 'ry', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 15:47:39');
INSERT INTO `sys_logininfor` VALUES (230, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:47:44');
INSERT INTO `sys_logininfor` VALUES (231, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 15:47:44');
INSERT INTO `sys_logininfor` VALUES (232, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 15:47:45');
INSERT INTO `sys_logininfor` VALUES (233, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:47:45');
INSERT INTO `sys_logininfor` VALUES (234, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:47:46');
INSERT INTO `sys_logininfor` VALUES (235, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 15:47:46');
INSERT INTO `sys_logininfor` VALUES (236, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:47:47');
INSERT INTO `sys_logininfor` VALUES (237, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:47:47');
INSERT INTO `sys_logininfor` VALUES (238, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:48:00');
INSERT INTO `sys_logininfor` VALUES (239, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:48:00');
INSERT INTO `sys_logininfor` VALUES (240, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:53:24');
INSERT INTO `sys_logininfor` VALUES (241, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:53:24');
INSERT INTO `sys_logininfor` VALUES (242, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:54:28');
INSERT INTO `sys_logininfor` VALUES (243, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:54:28');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:55:40');
INSERT INTO `sys_logininfor` VALUES (245, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:02');
INSERT INTO `sys_logininfor` VALUES (246, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:12');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 15:58:14');
INSERT INTO `sys_logininfor` VALUES (248, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:17');
INSERT INTO `sys_logininfor` VALUES (249, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:19');
INSERT INTO `sys_logininfor` VALUES (250, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:19');
INSERT INTO `sys_logininfor` VALUES (251, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:19');
INSERT INTO `sys_logininfor` VALUES (252, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:19');
INSERT INTO `sys_logininfor` VALUES (253, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:19');
INSERT INTO `sys_logininfor` VALUES (254, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:20');
INSERT INTO `sys_logininfor` VALUES (255, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:21');
INSERT INTO `sys_logininfor` VALUES (256, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:21');
INSERT INTO `sys_logininfor` VALUES (257, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 15:58:21');
INSERT INTO `sys_logininfor` VALUES (258, 'asdas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdas 不存在', '2022-12-09 15:58:21');
INSERT INTO `sys_logininfor` VALUES (259, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 15:58:24');
INSERT INTO `sys_logininfor` VALUES (260, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 15:58:34');
INSERT INTO `sys_logininfor` VALUES (261, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:58:34');
INSERT INTO `sys_logininfor` VALUES (262, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 15:58:35');
INSERT INTO `sys_logininfor` VALUES (263, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:58:35');
INSERT INTO `sys_logininfor` VALUES (264, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 15:58:35');
INSERT INTO `sys_logininfor` VALUES (265, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 15:58:35');
INSERT INTO `sys_logininfor` VALUES (266, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:35');
INSERT INTO `sys_logininfor` VALUES (267, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:58:36');
INSERT INTO `sys_logininfor` VALUES (268, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:58:36');
INSERT INTO `sys_logininfor` VALUES (269, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:36');
INSERT INTO `sys_logininfor` VALUES (270, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:36');
INSERT INTO `sys_logininfor` VALUES (271, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:36');
INSERT INTO `sys_logininfor` VALUES (272, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:37');
INSERT INTO `sys_logininfor` VALUES (273, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:37');
INSERT INTO `sys_logininfor` VALUES (274, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:37');
INSERT INTO `sys_logininfor` VALUES (275, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:37');
INSERT INTO `sys_logininfor` VALUES (276, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:58:41');
INSERT INTO `sys_logininfor` VALUES (277, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 15:58:41');
INSERT INTO `sys_logininfor` VALUES (278, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:53');
INSERT INTO `sys_logininfor` VALUES (279, 'dasda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dasda 不存在', '2022-12-09 15:58:54');
INSERT INTO `sys_logininfor` VALUES (280, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:58:57');
INSERT INTO `sys_logininfor` VALUES (281, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:58:58');
INSERT INTO `sys_logininfor` VALUES (282, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:58:59');
INSERT INTO `sys_logininfor` VALUES (283, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:00');
INSERT INTO `sys_logininfor` VALUES (284, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:00');
INSERT INTO `sys_logininfor` VALUES (285, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:01');
INSERT INTO `sys_logininfor` VALUES (286, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:01');
INSERT INTO `sys_logininfor` VALUES (287, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:01');
INSERT INTO `sys_logininfor` VALUES (288, '', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户： 不存在', '2022-12-09 15:59:05');
INSERT INTO `sys_logininfor` VALUES (289, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:21');
INSERT INTO `sys_logininfor` VALUES (290, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:22');
INSERT INTO `sys_logininfor` VALUES (291, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:23');
INSERT INTO `sys_logininfor` VALUES (292, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:23');
INSERT INTO `sys_logininfor` VALUES (293, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:24');
INSERT INTO `sys_logininfor` VALUES (294, 'dsadassfg', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadassfg 不存在', '2022-12-09 15:59:24');
INSERT INTO `sys_logininfor` VALUES (295, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:04:10');
INSERT INTO `sys_logininfor` VALUES (296, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:04:10');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:06:14');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:07:01');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:07:16');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:07:40');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:07:44');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:08:13');
INSERT INTO `sys_logininfor` VALUES (303, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:09:37');
INSERT INTO `sys_logininfor` VALUES (304, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '0', '退出成功', '2022-12-09 16:09:40');
INSERT INTO `sys_logininfor` VALUES (305, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 16:09:50');
INSERT INTO `sys_logininfor` VALUES (306, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 16:09:50');
INSERT INTO `sys_logininfor` VALUES (307, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 16:09:50');
INSERT INTO `sys_logininfor` VALUES (308, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 16:09:50');
INSERT INTO `sys_logininfor` VALUES (309, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 16:09:51');
INSERT INTO `sys_logininfor` VALUES (310, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-09 16:09:51');
INSERT INTO `sys_logininfor` VALUES (311, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:09:52');
INSERT INTO `sys_logininfor` VALUES (312, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:09:52');
INSERT INTO `sys_logininfor` VALUES (313, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:11:52');
INSERT INTO `sys_logininfor` VALUES (314, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:12:17');
INSERT INTO `sys_logininfor` VALUES (315, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:12:48');
INSERT INTO `sys_logininfor` VALUES (316, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:12:48');
INSERT INTO `sys_logininfor` VALUES (317, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:12:48');
INSERT INTO `sys_logininfor` VALUES (318, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:13:16');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:14:01');
INSERT INTO `sys_logininfor` VALUES (320, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:14:38');
INSERT INTO `sys_logininfor` VALUES (321, 'lee', '127.0.0.1', '内网IP', 'Firefox 10', 'Windows 10', '1', '密码输入错误3次，帐户锁定10分钟', '2022-12-09 16:14:38');
INSERT INTO `sys_logininfor` VALUES (322, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:15:46');
INSERT INTO `sys_logininfor` VALUES (323, 'dsadas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadas 不存在', '2022-12-09 16:18:27');
INSERT INTO `sys_logininfor` VALUES (324, 'dsadas', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：dsadas 不存在', '2022-12-09 16:18:34');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:19:13');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:23:53');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:24:06');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:24:11');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:24:13');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:25:58');
INSERT INTO `sys_logininfor` VALUES (331, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:27:04');
INSERT INTO `sys_logininfor` VALUES (332, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:27:18');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:32:06');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:33:29');
INSERT INTO `sys_logininfor` VALUES (335, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:36:43');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:37:04');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:38:29');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:41:23');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:42:45');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-09 16:44:47');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码错误，请重新输入', '2022-12-09 16:44:47');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-09 16:44:58');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码错误，请重新输入', '2022-12-09 16:44:58');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码错误，请重新输入', '2022-12-09 16:44:59');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-09 16:44:59');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:01');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:01');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:02');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:30');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次，您的账号已锁定', '2022-12-09 16:45:30');
INSERT INTO `sys_logininfor` VALUES (358, 'asdda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdda 不存在', '2022-12-09 16:46:48');
INSERT INTO `sys_logininfor` VALUES (359, 'asdda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdda 不存在', '2022-12-09 16:46:48');
INSERT INTO `sys_logininfor` VALUES (360, 'asdda', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：asdda 不存在', '2022-12-09 16:46:49');
INSERT INTO `sys_logininfor` VALUES (361, 'sdasd', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdasd 不存在', '2022-12-09 16:47:53');
INSERT INTO `sys_logininfor` VALUES (362, 'sdasd', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdasd 不存在', '2022-12-09 16:47:54');
INSERT INTO `sys_logininfor` VALUES (363, 'sdasd', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdasd 不存在', '2022-12-09 16:47:55');
INSERT INTO `sys_logininfor` VALUES (364, 'sdasd', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdasd 不存在', '2022-12-09 16:47:55');
INSERT INTO `sys_logininfor` VALUES (365, 'sdfs', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdfs 不存在', '2022-12-09 16:48:34');
INSERT INTO `sys_logininfor` VALUES (366, 'sdfs', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdfs 不存在', '2022-12-09 16:48:34');
INSERT INTO `sys_logininfor` VALUES (367, 'sdfs', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdfs 不存在', '2022-12-09 16:48:34');
INSERT INTO `sys_logininfor` VALUES (368, 'sdfs', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：sdfs 不存在', '2022-12-09 16:48:35');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:49:36');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 16:55:27');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '192.168.91.72', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 17:12:54');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-09 17:18:36');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-10 09:36:43');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 09:03:08');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '192.168.91.92', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 09:43:20');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 10:29:23');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 13:05:22');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 14:05:38');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 14:24:16');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 14:47:45');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 15:34:43');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 15:39:28');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 15:52:04');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 16:19:00');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 17:28:40');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 17:40:46');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-12 17:55:31');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:05:01');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:05:02');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:05:02');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:07:15');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 09:30:15');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:34:14');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 09:34:23');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:34:27');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 09:36:23');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:36:31');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 09:36:50');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:37:00');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:37:40');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 09:37:49');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:38:02');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:38:16');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '192.168.91.66', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:38:29');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 09:38:45');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 10:39:36');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 11:04:00');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 11:27:21');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 13:03:00');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 13:32:05');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 14:16:17');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 14:37:57');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 15:41:14');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 16:24:14');
INSERT INTO `sys_logininfor` VALUES (415, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 16:24:54');
INSERT INTO `sys_logininfor` VALUES (416, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 16:41:26');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-13 16:50:19');
INSERT INTO `sys_logininfor` VALUES (418, 'lee', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：lee 不存在', '2022-12-13 16:50:39');
INSERT INTO `sys_logininfor` VALUES (419, '李健', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 16:50:51');
INSERT INTO `sys_logininfor` VALUES (420, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 17:01:03');
INSERT INTO `sys_logininfor` VALUES (421, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 17:23:24');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 17:36:16');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 17:47:03');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-13 17:47:35');
INSERT INTO `sys_logininfor` VALUES (425, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 09:06:07');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 09:28:39');
INSERT INTO `sys_logininfor` VALUES (427, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 10:17:55');
INSERT INTO `sys_logininfor` VALUES (428, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 13:01:47');
INSERT INTO `sys_logininfor` VALUES (429, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 13:10:25');
INSERT INTO `sys_logininfor` VALUES (430, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 13:38:42');
INSERT INTO `sys_logininfor` VALUES (431, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 15:56:57');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 15:58:58');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 16:52:17');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-14 17:49:41');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-15 09:03:08');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-15 09:03:16');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-15 10:01:26');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-15 11:47:21');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '192.168.91.59', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-15 11:54:06');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-19 13:31:29');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 12:46:42');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 12:54:04');
INSERT INTO `sys_logininfor` VALUES (443, 'lee', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-02-20 12:58:06');
INSERT INTO `sys_logininfor` VALUES (444, 'lee', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 12:58:14');
INSERT INTO `sys_logininfor` VALUES (445, 'lee', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 13:09:38');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 13:09:42');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 13:09:45');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 13:09:47');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 15:21:46');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 15:21:58');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 15:22:02');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 19:25:08');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 19:52:24');
INSERT INTO `sys_logininfor` VALUES (454, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-02-20 19:54:57');
INSERT INTO `sys_logininfor` VALUES (455, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-20 19:55:10');
INSERT INTO `sys_logininfor` VALUES (456, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-20 19:55:10');
INSERT INTO `sys_logininfor` VALUES (457, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-02-20 19:55:54');
INSERT INTO `sys_logininfor` VALUES (458, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-20 19:55:54');
INSERT INTO `sys_logininfor` VALUES (459, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-20 19:55:57');
INSERT INTO `sys_logininfor` VALUES (460, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 19:56:01');
INSERT INTO `sys_logininfor` VALUES (461, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 19:56:11');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 19:56:14');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:12:01');
INSERT INTO `sys_logininfor` VALUES (464, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:12:14');
INSERT INTO `sys_logininfor` VALUES (465, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:14:38');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:14:41');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:17:32');
INSERT INTO `sys_logininfor` VALUES (468, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:17:46');
INSERT INTO `sys_logininfor` VALUES (469, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:19:16');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:19:22');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:19:44');
INSERT INTO `sys_logininfor` VALUES (472, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:19:54');
INSERT INTO `sys_logininfor` VALUES (473, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:20:06');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:20:10');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 20:20:29');
INSERT INTO `sys_logininfor` VALUES (476, '李寻Lee11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 20:20:35');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-21 14:06:08');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:06:11');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:07:13');
INSERT INTO `sys_logininfor` VALUES (480, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-21 14:07:24');
INSERT INTO `sys_logininfor` VALUES (481, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:07:27');
INSERT INTO `sys_logininfor` VALUES (482, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:07:46');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:07:49');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:09:39');
INSERT INTO `sys_logininfor` VALUES (485, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:09:50');
INSERT INTO `sys_logininfor` VALUES (486, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:09:58');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:10:02');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:10:48');
INSERT INTO `sys_logininfor` VALUES (489, '李健', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:10:54');
INSERT INTO `sys_logininfor` VALUES (490, '李健', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:11:38');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:11:41');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:13:12');
INSERT INTO `sys_logininfor` VALUES (493, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:13:20');
INSERT INTO `sys_logininfor` VALUES (494, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:13:29');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:13:33');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:14:48');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:14:50');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:18:11');
INSERT INTO `sys_logininfor` VALUES (499, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:18:20');
INSERT INTO `sys_logininfor` VALUES (500, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:21:48');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:21:51');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:38:42');
INSERT INTO `sys_logininfor` VALUES (503, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:38:49');
INSERT INTO `sys_logininfor` VALUES (504, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:40:29');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:40:32');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:41:07');
INSERT INTO `sys_logininfor` VALUES (507, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-21 14:41:14');
INSERT INTO `sys_logininfor` VALUES (508, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:41:17');
INSERT INTO `sys_logininfor` VALUES (509, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 14:42:53');
INSERT INTO `sys_logininfor` VALUES (510, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 14:42:57');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 15:09:15');
INSERT INTO `sys_logininfor` VALUES (512, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:09:24');
INSERT INTO `sys_logininfor` VALUES (513, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 15:09:38');
INSERT INTO `sys_logininfor` VALUES (514, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:09:57');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 15:18:05');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:18:11');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 15:18:28');
INSERT INTO `sys_logininfor` VALUES (518, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-02-21 15:27:36');
INSERT INTO `sys_logininfor` VALUES (519, '李寻', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:27:39');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 19:37:44');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 19:38:25');
INSERT INTO `sys_logininfor` VALUES (522, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-02-21 19:38:52');
INSERT INTO `sys_logininfor` VALUES (523, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-21 19:39:08');
INSERT INTO `sys_logininfor` VALUES (524, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-21 19:39:11');
INSERT INTO `sys_logininfor` VALUES (525, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-21 19:39:11');
INSERT INTO `sys_logininfor` VALUES (526, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-21 19:39:20');
INSERT INTO `sys_logininfor` VALUES (527, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 19:39:23');
INSERT INTO `sys_logininfor` VALUES (528, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 19:40:06');
INSERT INTO `sys_logininfor` VALUES (529, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 19:40:10');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 19:40:21');
INSERT INTO `sys_logininfor` VALUES (531, 'Lee0625', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 19:40:32');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1075 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 4, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-12-07 11:04:39', 'admin', '2023-02-21 15:17:40', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 5, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-12-07 11:04:39', 'admin', '2023-02-21 15:17:46', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 6, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-12-07 11:04:39', 'admin', '2023-02-21 15:17:53', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2022-12-07 11:04:39', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-12-07 11:04:39', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-12-07 11:04:39', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-12-07 11:04:39', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-12-07 11:04:39', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-12-07 11:04:39', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-12-07 11:04:39', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-12-07 11:04:39', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-12-07 11:04:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-12-07 11:04:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-12-07 11:04:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-12-07 11:04:39', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-12-07 11:04:39', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-12-07 11:04:39', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-12-07 11:04:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-12-07 11:04:39', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-12-07 11:04:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-12-07 11:04:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-12-07 11:04:39', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-12-07 11:04:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-12-07 11:04:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-12-07 11:04:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '项目众筹', 0, 0, 'financing', 'financing/index', NULL, 1, 0, 'C', '0', '0', 'sysytem:financing:index', 'cascader', 'admin', '2023-02-20 13:19:21', 'admin', '2023-02-20 13:20:07', '');
INSERT INTO `sys_menu` VALUES (1065, '查看筹资情况', 0, 2, 'info', 'info/index', NULL, 1, 0, 'C', '0', '0', 'sysytem:info:index', 'component', 'admin', '2023-02-20 15:42:45', 'admin', '2023-02-21 15:17:30', '');
INSERT INTO `sys_menu` VALUES (1066, '项目众筹审核', 0, 3, 'log', 'log/index', NULL, 1, 0, 'C', '0', '0', 'system:log:index', 'date', 'admin', '2023-02-20 15:58:39', 'admin', '2023-02-21 15:17:35', '');
INSERT INTO `sys_menu` VALUES (1069, '新增', 1064, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:financing:add', '#', 'admin', '2023-02-21 14:14:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1070, '众筹审核详情', 0, 1, 'audit', 'audit/index', NULL, 1, 0, 'C', '0', '0', 'sysytem:audit:index', 'date', 'admin', '2023-02-21 14:23:52', 'admin', '2023-02-21 15:17:25', '');
INSERT INTO `sys_menu` VALUES (1071, '删除', 1070, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:MyFinancingInfo:remove', '#', 'admin', '2023-02-21 14:35:55', 'admin', '2023-02-21 15:16:42', '');
INSERT INTO `sys_menu` VALUES (1072, '删除', 1065, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:financingInfo:remove', '#', 'admin', '2023-02-21 14:37:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1073, '查看', 1064, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:financing:getInfo', '#', 'admin', '2023-02-21 15:09:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1074, '删除', 1064, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:financing:remove', '#', 'admin', '2023-02-21 15:17:03', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-12-07 11:04:40', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-12-07 11:04:41', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '11', '1', NULL, '0', 'admin', '2022-12-09 15:09:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '在线用户', 7, 'com.ruoyi.web.controller.monitor.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/monitor/online/b4e2265e-57e3-4b40-a5bd-fbc5a70fb92c', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:15:11');
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '192.168.91.72', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":103,\"email\":\"2513098091@qq.com\",\"nickName\":\"李健\",\"params\":{},\"phonenumber\":\"18586344689\",\"postIds\":[4],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"李健\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:16:53');
INSERT INTO `sys_oper_log` VALUES (102, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '192.168.91.72', '内网IP', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:35:50');
INSERT INTO `sys_oper_log` VALUES (103, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '192.168.91.72', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:35:54');
INSERT INTO `sys_oper_log` VALUES (104, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '192.168.91.72', '内网IP', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:43:23');
INSERT INTO `sys_oper_log` VALUES (105, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '192.168.91.72', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":2,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:45:18');
INSERT INTO `sys_oper_log` VALUES (106, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '192.168.91.72', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":3,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:45:38');
INSERT INTO `sys_oper_log` VALUES (107, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '192.168.91.72', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>32123<img src=\\\"/dev-api/profile/upload/2022/12/07/微信图片_20221018212506_20221207114853A002.jpg\\\"></p>\",\"noticeTitle\":\"1231\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:48:55');
INSERT INTO `sys_oper_log` VALUES (108, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '192.168.91.72', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-07 11:48:55\",\"noticeContent\":\"<p>32123<img src=\\\"/dev-api/profile/upload/2022/12/07/微信图片_20221018212506_20221207114853A002.jpg\\\"></p>\",\"noticeId\":10,\"noticeTitle\":\"1231\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:49:22');
INSERT INTO `sys_oper_log` VALUES (109, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/10', '192.168.91.72', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:50:39');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, '李健', NULL, '/system/menu', '192.168.91.72', '内网IP', '{\"children\":[],\"createBy\":\"李健\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"1\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"1\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:52:45');
INSERT INTO `sys_oper_log` VALUES (111, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, '李健', NULL, '/system/post', '192.168.91.72', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2022-12-07 11:04:39\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"董事长\",\"postSort\":1,\"remark\":\"1\",\"status\":\"0\",\"updateBy\":\"李健\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:53:08');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '192.168.91.72', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 11:53:46');
INSERT INTO `sys_oper_log` VALUES (113, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '192.168.91.72', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-07 12:00:03');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2022-12-08 09:49:55');
INSERT INTO `sys_oper_log` VALUES (115, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '192.168.91.72', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"1111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-08 11:07:15');
INSERT INTO `sys_oper_log` VALUES (116, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '192.168.91.72', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-08 11:07:30');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"task\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-08 14:58:47');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"task\"}', NULL, 0, NULL, '2022-12-08 14:58:49');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"task\",\"className\":\"Task\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-08 14:58:47\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Headline\",\"columnComment\":\"需求标题\",\"columnId\":2,\"columnName\":\"headline\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-08 14:58:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"headline\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态(1.需求待完善、2.待评估时间、3.待启动、4.开发中、5.开发完成、6.提测跟进、7.已发布、8.需求暂停)\",\"columnId\":3,\"columnName\":\"status\",\"columnType\":\"int(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-08 14:58:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"需求类型\",\"columnId\":4,\"columnName\":\"type\",\"columnType\":\"int(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-08 14:58:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"q', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-08 16:32:00');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"task\"}', NULL, 0, NULL, '2022-12-08 16:32:05');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, '李健', NULL, '/tool/gen/synchDb/task', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2022-12-09 09:34:02');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, '李健', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 09:34:06');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, '李健', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"demand\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 09:34:11');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '李健', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"demand\"}', NULL, 0, NULL, '2022-12-09 09:34:13');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, '李健', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"demand\",\"className\":\"Demand\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"李健\",\"createTime\":\"2022-12-09 09:34:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Headline\",\"columnComment\":\"需求标题\",\"columnId\":15,\"columnName\":\"headline\",\"columnType\":\"varchar(255)\",\"createBy\":\"李健\",\"createTime\":\"2022-12-09 09:34:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"headline\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态(1.需求待完善、2.待评估时间、3.待启动、4.开发中、5.开发完成、6.提测跟进、7.已发布、8.需求暂停)\",\"columnId\":16,\"columnName\":\"status\",\"columnType\":\"int(255)\",\"createBy\":\"李健\",\"createTime\":\"2022-12-09 09:34:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"需求类型\",\"columnId\":17,\"columnName\":\"type\",\"columnType\":\"int(255)\",\"createBy\":\"李健\",\"createTime\":\"2022-12-09 09:34:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 09:36:19');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, '李健', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"demand\"}', NULL, 0, NULL, '2022-12-09 09:36:26');
INSERT INTO `sys_oper_log` VALUES (127, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '192.168.91.72', '内网IP', '{\"createBy\":\"admin\",\"noticeTitle\":\"11\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 15:09:48');
INSERT INTO `sys_oper_log` VALUES (128, '需求', 3, 'com.ruoyi.web.controller.system.DemandController.remove()', 'DELETE', 1, 'admin', NULL, '/system/demand/2', '192.168.91.72', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 15:29:31');
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'ry', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"ry\",\"deptId\":100,\"nickName\":\"1\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"lee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 15:47:27');
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-09 16:32:17');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/demand', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-10 09:36:58');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"demand\"}', NULL, 0, NULL, '2022-12-10 09:37:02');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"demand\"}', NULL, 0, NULL, '2022-12-10 09:40:28');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/demand', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-10 11:17:20');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"demand\"}', NULL, 0, NULL, '2022-12-10 11:17:23');
INSERT INTO `sys_oper_log` VALUES (136, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册\",\"id\":2,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-13 00:00:00\",\"predictStartTime\":\"2022-12-14 00:00:00\",\"predictWorkload\":\"1天\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 09:22:29');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"remind\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 11:36:44');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"remind\",\"className\":\"Remind\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":34,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-12 11:36:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"State\",\"columnComment\":\"状态(1:未提醒，2:已提醒)\",\"columnId\":35,\"columnName\":\"state\",\"columnType\":\"int(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-12 11:36:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"state\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DemandId\",\"columnComment\":\"需求id\",\"columnId\":36,\"columnName\":\"demand_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-12 11:36:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"demandId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":37,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-12-12 11:36:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"s', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 11:37:19');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"remind\"}', NULL, 0, NULL, '2022-12-12 11:37:22');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/remind', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 11:45:32');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"remind\"}', NULL, 0, NULL, '2022-12-12 11:45:34');
INSERT INTO `sys_oper_log` VALUES (142, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-12-12 13:10:39.732\",\"demandId\":2,\"params\":{},\"state\":1,\"userId\":1}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\RemindMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.RemindMapper.insertRemind-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into remind          ( state,             demand_id,             create_time,                          user_id )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2022-12-12 13:10:39');
INSERT INTO `sys_oper_log` VALUES (143, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '127.0.0.1', '内网IP', '{\"createTime\":\"2022-12-12 13:11:10.43\",\"demandId\":2,\"params\":{},\"state\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 13:11:10');
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 14:51:46');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/remind', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 15:47:28');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"remind\"}', NULL, 0, NULL, '2022-12-12 15:47:29');
INSERT INTO `sys_oper_log` VALUES (147, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 16 * * ? \",\"invokeTarget\":\"messageTask.overdue\",\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"jobName\":\"逾期提醒\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2022-12-13 16:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:19:53');
INSERT INTO `sys_oper_log` VALUES (148, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0 0 18 * * ? \",\"invokeTarget\":\"messageTask.dailyReminder\",\"jobGroup\":\"DEFAULT\",\"jobId\":5,\"jobName\":\"日报提醒\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2022-12-12 18:00:00\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:20:39');
INSERT INTO `sys_oper_log` VALUES (149, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:21:44');
INSERT INTO `sys_oper_log` VALUES (150, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:22:21');
INSERT INTO `sys_oper_log` VALUES (151, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:23:56');
INSERT INTO `sys_oper_log` VALUES (152, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:24:17');
INSERT INTO `sys_oper_log` VALUES (153, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:25:51');
INSERT INTO `sys_oper_log` VALUES (154, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:27:05');
INSERT INTO `sys_oper_log` VALUES (155, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.run()', 'PUT', 1, 'admin', NULL, '/monitor/job/run', '127.0.0.1', '内网IP', '{\"jobGroup\":\"DEFAULT\",\"jobId\":4,\"misfirePolicy\":\"0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-12 16:28:21');
INSERT INTO `sys_oper_log` VALUES (156, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 11:28:21.217\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册1\",\"id\":5,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-13 00:00:00\",\"predictStartTime\":\"2022-12-14 00:00:00\",\"predictWorkload\":\"1\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 11:28:21');
INSERT INTO `sys_oper_log` VALUES (157, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 11:28:34.476\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册2\",\"id\":6,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-20 00:00:00\",\"predictWorkload\":\"4\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 11:28:34');
INSERT INTO `sys_oper_log` VALUES (158, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 11:29:57.083\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册2\",\"id\":7,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-20 00:00:00\",\"predictWorkload\":\"0\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 11:29:57');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"task_log\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 14:38:10');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"log\",\"className\":\"TaskLog\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":41,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-13 14:38:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":42,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-13 14:38:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":43,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-12-13 14:38:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"修改时间\",\"columnId\":44,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-12-13 14:38:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":4,\"superColumn\":true,\"tableId\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 14:38:40');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"task_log\"}', NULL, 0, NULL, '2022-12-13 14:39:07');
INSERT INTO `sys_oper_log` VALUES (162, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"demandDesc\":\"1231323\",\"developer\":\"100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册3\",\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-17 00:00:00\",\"predictStartTime\":\"2022-12-13 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"type\":2}', NULL, 1, '结束时间不能在开始时间之前！！！', '2022-12-13 16:26:34');
INSERT INTO `sys_oper_log` VALUES (163, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 16:27:14.558\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册3\",\"id\":8,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-17 00:00:00\",\"predictStartTime\":\"2022-12-13 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 16:27:14');
INSERT INTO `sys_oper_log` VALUES (164, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 16:28:01.901\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册4\",\"id\":9,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-14 00:00:00\",\"predictStartTime\":\"2022-12-13 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 16:28:01');
INSERT INTO `sys_oper_log` VALUES (165, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 16:28:17.666\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册5\",\"id\":10,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-15 00:00:00\",\"predictStartTime\":\"2022-12-14 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 16:28:17');
INSERT INTO `sys_oper_log` VALUES (166, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 16:28:47.176\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册5\",\"id\":11,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-01-15 00:00:00\",\"predictStartTime\":\"2022-01-01 00:00:00\",\"priority\":\"P1\",\"project\":\"下月规划\",\"status\":1,\"type\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 16:28:47');
INSERT INTO `sys_oper_log` VALUES (167, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '127.0.0.1', '内网IP', '{\"creationTime\":\"2022-12-13 16:29:29.814\",\"demandDesc\":\"1231323\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"需求登录注册6\",\"id\":12,\"params\":{},\"prd\":\"https://app.mockplus.cn/run/prototype/-WbB_skRAbbUX/zh6YBBOsk/wjyrlXe3wm?cps=collapse&ha=1&linkID=&nav=1\",\"predictEndTime\":\"2022-12-20 00:00:00\",\"predictStartTime\":\"2022-12-10 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 16:29:29');
INSERT INTO `sys_oper_log` VALUES (168, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-13 17:52:32.578\",\"demandDesc\":\"11111111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"若依\",\"developmentProgress\":\"0\",\"headline\":\"11111\",\"id\":13,\"params\":{},\"prd\":\"1111111111111\",\"predictEndTime\":\"2022-12-15 00:00:00\",\"predictStartTime\":\"2022-12-01 00:00:00\",\"project\":\"下月工作\",\"status\":1,\"type\":4}', NULL, 1, 'For input string: \"若依\"', '2022-12-13 17:52:32');
INSERT INTO `sys_oper_log` VALUES (169, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-13 17:53:42.885\",\"demandDesc\":\"1111111111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"李健\",\"developmentProgress\":\"0\",\"headline\":\"1111111111\",\"id\":14,\"params\":{},\"prd\":\"1111111111111\",\"predictEndTime\":\"2022-12-30 00:00:00\",\"predictStartTime\":\"2022-12-03 00:00:00\",\"priority\":\"P0\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', NULL, 1, 'For input string: \"李健\"', '2022-12-13 17:53:42');
INSERT INTO `sys_oper_log` VALUES (170, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-13 17:54:50.755\",\"demandDesc\":\"的撒法国红酒看，\",\"demandOwner\":\"admin\",\"developmentProgress\":\"0\",\"headline\":\"dsadsa\",\"id\":15,\"params\":{},\"prd\":\"阿斯顿\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-16 00:00:00\",\"priority\":\"P1\",\"project\":\"下月工作\",\"status\":1,\"type\":2}', NULL, 1, '', '2022-12-13 17:54:50');
INSERT INTO `sys_oper_log` VALUES (171, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-13 17:56:01.241\",\"demandDesc\":\"1111111111111111111111\",\"demandOwner\":\"admin\",\"developmentProgress\":\"0\",\"headline\":\"1111111111111\",\"id\":16,\"params\":{},\"prd\":\"1111111111111\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-09 00:00:00\",\"priority\":\"P2\",\"project\":\"下月工作\",\"status\":1,\"type\":1}', NULL, 1, '', '2022-12-13 17:56:01');
INSERT INTO `sys_oper_log` VALUES (172, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-13 17:57:40.451\",\"demandDesc\":\"111111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"100\",\"developmentProgress\":\"0\",\"headline\":\"111111111\",\"id\":17,\"params\":{},\"prd\":\"1111111111\",\"predictEndTime\":\"2022-12-24 00:00:00\",\"predictStartTime\":\"2022-12-08 00:00:00\",\"priority\":\"P2\",\"project\":\"本月工作\",\"status\":1,\"type\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-13 17:57:40');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"project_approval\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 10:18:03');
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"approval\",\"className\":\"ProjectApproval\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":46,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-14 10:18:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":47,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-12-14 10:18:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UpdateTime\",\"columnComment\":\"修改时间\",\"columnId\":48,\"columnName\":\"update_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2022-12-14 10:18:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"updateTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProjectSponsor\",\"columnComment\":\"立项人\",\"columnId\":49,\"columnName\":\"project_sponsor\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2022-12-14 10:18:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"projectSponsor\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 10:18:55');
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"project_approval\"}', NULL, 0, NULL, '2022-12-14 10:18:58');
INSERT INTO `sys_oper_log` VALUES (176, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-12-07 11:16:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"2513098091@qq.com\",\"loginDate\":\"2022-12-13 16:50:51\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"李健\",\"params\":{},\"phonenumber\":\"18586344689\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"李健\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 10:36:51');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"李寻\",\"params\":{},\"postIds\":[1],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":103,\"userName\":\"李寻\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 10:39:19');
INSERT INTO `sys_oper_log` VALUES (178, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"developmentProgress\":\"0\",\"params\":{},\"predictStartTime\":\"2022-12-15 00:00:00\",\"type\":2}', NULL, 1, '', '2022-12-14 11:02:56');
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"project_approval\"}', NULL, 0, NULL, '2022-12-14 11:03:09');
INSERT INTO `sys_oper_log` VALUES (180, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:22:30.051\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:22:30');
INSERT INTO `sys_oper_log` VALUES (181, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:23:47.654\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:23:47');
INSERT INTO `sys_oper_log` VALUES (182, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:24:25.511\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:24:25');
INSERT INTO `sys_oper_log` VALUES (183, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:27:29.33\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:27:29');
INSERT INTO `sys_oper_log` VALUES (184, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:28:30.047\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:28:30');
INSERT INTO `sys_oper_log` VALUES (185, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:31:01.198\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:31:01');
INSERT INTO `sys_oper_log` VALUES (186, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"111111111\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:32:16.333\",\"describe\":\"111111\",\"developer\":\"100,1\",\"frontEndDemand\":\"1111\",\"interactionDemand\":\"1111\",\"note\":\"1111\",\"officialDemand\":\"1111\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"1111\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"1111\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:32:16');
INSERT INTO `sys_oper_log` VALUES (187, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:33:10.905\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:33:10');
INSERT INTO `sys_oper_log` VALUES (188, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:33:12.798\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:33:12');
INSERT INTO `sys_oper_log` VALUES (189, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:33:13.061\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:33:13');
INSERT INTO `sys_oper_log` VALUES (190, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:33:13.301\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:33:13');
INSERT INTO `sys_oper_log` VALUES (191, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:39:36.205\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\r\n### The error may exist in file [D:\\idea\\workspaceIDAE\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\ProjectApprovalMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ProjectApprovalMapper.insertProjectApproval-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into project_approval          ( create_time,                                       project_title,             project_time,             check_time,             predict_workload,             developer,             describe,             product_demand,             official_demand,             front_end_demand,             background_demand,             test_demand,             interaction_demand,             note,                                                    acceptor,                          status )           values ( ?,                                       ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,                                                    ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,\n            f\' at line 10\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'describe,\n            product_demand,\n            official_demand,', '2022-12-14 11:39:46');
INSERT INTO `sys_oper_log` VALUES (192, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:47:51.799\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'projectsponsor\' in \'class com.ruoyi.system.domain.ProjectApproval\'', '2022-12-14 11:47:51');
INSERT INTO `sys_oper_log` VALUES (193, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:49:30.266\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":1,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 11:49:30');
INSERT INTO `sys_oper_log` VALUES (194, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:52:14.057\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":2,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"1\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 11:52:14');
INSERT INTO `sys_oper_log` VALUES (195, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 11:54:22.596\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":3,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"admin\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 11:54:22');
INSERT INTO `sys_oper_log` VALUES (196, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 13:02:49.775\",\"describe\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":4,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"admin\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":1,\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 13:02:49');
INSERT INTO `sys_oper_log` VALUES (197, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"developmentProgress\":\"0\",\"params\":{}}', NULL, 1, '', '2022-12-14 13:38:01');
INSERT INTO `sys_oper_log` VALUES (198, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 13:56:10.378\",\"demandDesc\":\"1111111111111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"1111111111\",\"id\":18,\"params\":{},\"prd\":\"111111111111111\",\"predictEndTime\":\"2022-12-23 00:00:00\",\"predictStartTime\":\"2022-12-15 00:00:00\",\"priority\":\"P0\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 13:56:10');
INSERT INTO `sys_oper_log` VALUES (199, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 13:58:28.351\",\"demandDesc\":\"222222222222222222222222\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"22222222\",\"id\":19,\"params\":{},\"prd\":\"2222222222222222\",\"predictEndTime\":\"2022-12-29 00:00:00\",\"predictStartTime\":\"2022-12-16 00:00:00\",\"priority\":\"P1\",\"project\":\"下月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 13:58:28');
INSERT INTO `sys_oper_log` VALUES (200, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 13:59:25.195\",\"demandDesc\":\"222222222222222222222222\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"22222222\",\"id\":20,\"params\":{},\"prd\":\"2222222222222222\",\"predictEndTime\":\"2022-12-29 00:00:00\",\"predictStartTime\":\"2022-12-16 00:00:00\",\"priority\":\"P1\",\"project\":\"下月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 13:59:25');
INSERT INTO `sys_oper_log` VALUES (201, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 14:01:16.871\",\"demandDesc\":\"333333333333333333\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"333333333\",\"id\":21,\"params\":{},\"prd\":\"333333333333\",\"predictEndTime\":\"2022-12-22 00:00:00\",\"predictStartTime\":\"2022-12-15 00:00:00\",\"priority\":\"P0\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 14:01:16');
INSERT INTO `sys_oper_log` VALUES (202, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"developer\":\"\",\"developmentProgress\":\"0\",\"headline\":\"44444\",\"params\":{}}', NULL, 1, '', '2022-12-14 14:02:15');
INSERT INTO `sys_oper_log` VALUES (203, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 14:02:37.664\",\"demandDesc\":\"44444444444444444\",\"demandOwner\":\"admin\",\"developer\":\"1\",\"developmentProgress\":\"0\",\"headline\":\"44444\",\"id\":22,\"params\":{},\"prd\":\"444444444\",\"predictEndTime\":\"2022-12-24 00:00:00\",\"predictStartTime\":\"2022-12-16 00:00:00\",\"priority\":\"P0\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 14:02:37');
INSERT INTO `sys_oper_log` VALUES (204, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 14:14:40.147\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":5,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"admin\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":\"1\",\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 14:14:40');
INSERT INTO `sys_oper_log` VALUES (205, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 14:18:54.611\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":6,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"admin\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":\"1\",\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 14:18:54');
INSERT INTO `sys_oper_log` VALUES (206, '项目立项', 1, 'com.ruoyi.web.controller.system.ProjectApprovalController.add()', 'POST', 1, 'admin', NULL, '/system/approval', '127.0.0.1', '内网IP', '{\"acceptor\":\"103\",\"backgroundDemand\":\"开发\",\"checkTime\":\"2022-12-20 00:00:00\",\"createTime\":\"2022-12-14 14:19:21.407\",\"description\":\"开发\",\"developer\":\"100,1\",\"frontEndDemand\":\"开发\",\"id\":7,\"interactionDemand\":\"开发\",\"note\":\"1111\",\"officialDemand\":\"开发\",\"params\":{},\"predictWorkload\":\"30\",\"productDemand\":\"开发\",\"projectSponsor\":\"admin\",\"projectTime\":\"2022-12-14 00:00:00\",\"projectTitle\":\"oa项目开发\",\"status\":\"1\",\"testDemand\":\"开发\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 14:19:21');
INSERT INTO `sys_oper_log` VALUES (207, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"id\":14,\"params\":{}}', NULL, 1, '当前需求不存在', '2022-12-14 16:34:59');
INSERT INTO `sys_oper_log` VALUES (208, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"id\":18,\"params\":{}}', NULL, 1, '当前需求不存在', '2022-12-14 16:35:11');
INSERT INTO `sys_oper_log` VALUES (209, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"id\":21,\"params\":{}}', NULL, 1, '当前需求不存在', '2022-12-14 16:35:24');
INSERT INTO `sys_oper_log` VALUES (210, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"id\":18,\"params\":{}}', NULL, 1, '当前需求不存在', '2022-12-14 16:37:03');
INSERT INTO `sys_oper_log` VALUES (211, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"createTime\":\"2022-12-14 16:42:11.45\",\"demandId\":18,\"params\":{},\"state\":1,\"type\":2,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:42:11');
INSERT INTO `sys_oper_log` VALUES (212, '需求', 3, 'com.ruoyi.web.controller.system.DemandController.remove()', 'GET', 1, 'admin', NULL, '/system/demand/delete', '192.168.91.59', '内网IP', '{\"id\":\"14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:54:22');
INSERT INTO `sys_oper_log` VALUES (213, '需求', 3, 'com.ruoyi.web.controller.system.DemandController.remove()', 'GET', 1, 'admin', NULL, '/system/demand/delete', '192.168.91.59', '内网IP', '{\"id\":\"18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:55:23');
INSERT INTO `sys_oper_log` VALUES (214, '需求', 3, 'com.ruoyi.web.controller.system.DemandController.remove()', 'GET', 1, 'admin', NULL, '/system/demand/delete', '192.168.91.59', '内网IP', '{\"id\":\"21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:55:46');
INSERT INTO `sys_oper_log` VALUES (215, '需求', 3, 'com.ruoyi.web.controller.system.DemandController.remove()', 'GET', 1, 'admin', NULL, '/system/demand/delete', '192.168.91.59', '内网IP', '{\"id\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:55:52');
INSERT INTO `sys_oper_log` VALUES (216, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 16:56:20.492\",\"demandDesc\":\"11111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"1\",\"developmentProgress\":\"0\",\"headline\":\"111111\",\"id\":23,\"params\":{},\"prd\":\"11111111111111\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-15 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:56:20');
INSERT INTO `sys_oper_log` VALUES (217, '需求', 1, 'com.ruoyi.web.controller.system.DemandController.add()', 'POST', 1, 'admin', NULL, '/system/demand', '192.168.91.59', '内网IP', '{\"creationTime\":\"2022-12-14 16:57:16.587\",\"demandDesc\":\"11111111111111111\",\"demandOwner\":\"admin\",\"developer\":\"1,100\",\"developmentProgress\":\"0\",\"headline\":\"11111111\",\"id\":24,\"params\":{},\"prd\":\"111111111111\",\"predictEndTime\":\"2022-12-16 00:00:00\",\"predictStartTime\":\"2022-12-15 00:00:00\",\"priority\":\"P1\",\"project\":\"本月工作\",\"status\":1,\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:57:16');
INSERT INTO `sys_oper_log` VALUES (218, '催办', 1, 'com.ruoyi.web.controller.system.RemindController.add()', 'POST', 1, 'admin', NULL, '/system/remind', '192.168.91.59', '内网IP', '{\"createTime\":\"2022-12-14 16:57:20.679\",\"demandId\":24,\"params\":{},\"state\":1,\"type\":2,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-12-14 16:57:20');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-12-07 11:04:39', '李健', '2022-12-07 11:53:08', '1');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-12-07 11:04:39', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-12-07 11:04:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-12-07 11:04:39', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-12-07 11:04:39', 'admin', '2023-02-21 15:18:25', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (2, 1069);
INSERT INTO `sys_role_menu` VALUES (2, 1070);
INSERT INTO `sys_role_menu` VALUES (2, 1071);
INSERT INTO `sys_role_menu` VALUES (2, 1072);
INSERT INTO `sys_role_menu` VALUES (2, 1073);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/02/20/blob_20230220134418A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-02-21 19:40:10', 'admin', '2022-12-07 11:04:39', '', '2023-02-21 19:40:10', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$rDqSeoj15viuz2LFrsLSS.nI928Pxm4iN2STYYjy9sWwM7Krd1spy', '0', '0', '127.0.0.1', '2022-12-09 15:47:12', 'admin', '2022-12-07 11:04:39', 'admin', '2022-12-09 15:47:11', '测试员');
INSERT INTO `sys_user` VALUES (100, 103, '李健', '李健', '00', '2513098091@qq.com', '18586344689', '0', '', '$2a$10$vLTO1DioJQXPf3G3qoVJQePS/0bX8LtKnuDZ2c7CXG1HHPOVKE8qS', '0', '0', '127.0.0.1', '2023-02-21 14:10:55', 'admin', '2022-12-07 11:16:53', 'admin', '2023-02-21 14:10:54', NULL);
INSERT INTO `sys_user` VALUES (103, 100, '李寻', '李寻', '00', '', '', '0', '', '$2a$10$rta3/CPyE.KR.k.mWZVKS.rnVFMv13f4VIrA/.TK71lkN8h.vygQm', '0', '0', '127.0.0.1', '2023-02-21 15:27:40', 'admin', '2022-12-14 10:39:19', '', '2023-02-21 15:27:39', NULL);
INSERT INTO `sys_user` VALUES (104, NULL, 'lee', 'lee', '00', '', '', '0', '', '$2a$10$QtSGDvkHSAbfT2RyIe0rS.7Kh6Q8J46SF9ja8VQ3DLoXhsKrrdYCi', '0', '0', '127.0.0.1', '2023-02-20 12:58:14', '', '2023-02-20 12:58:06', '', '2023-02-20 12:58:14', NULL);
INSERT INTO `sys_user` VALUES (105, NULL, '李寻Lee', '李寻Lee', '00', '', '', '0', '', '$2a$10$e/qxStqJlJUQn7v6AqGZgOPVhHo3FCHuwVXrG.d8VvAW2sNy3hnvu', '0', '0', '', NULL, '', '2023-02-20 19:52:47', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, NULL, '李寻Lee1', '李寻Lee1', '00', '', '', '0', '', '$2a$10$urOx/muC/QdYjrGkb2zx.umUzhT2aP83mHFD8FavEqvyY/obuHOC.', '0', '0', '', NULL, '', '2023-02-20 19:53:53', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, NULL, '李寻Lee11', '李寻Lee11', '00', '', '', '0', '', '$2a$10$pohybhrRu8.0Gy9K9qhZo.FzxLjIabbaEY.3ZIip/B74fkz2LHN4u', '0', '0', '127.0.0.1', '2023-02-20 20:20:36', '', '2023-02-20 19:54:49', '', '2023-02-20 20:20:35', NULL);
INSERT INTO `sys_user` VALUES (108, NULL, 'Lee0625', 'Lee0625', '00', '', '', '0', '', '$2a$10$CQRETfjsEaVl9c3U8.eCaOguSIDxFIgD56bbOfnBDT7L20LYbsQzW', '0', '0', '127.0.0.1', '2023-02-21 19:40:32', '', '2023-02-21 19:38:52', '', '2023-02-21 19:40:32', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 4);
INSERT INTO `sys_user_post` VALUES (103, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 1);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `demand_id` int(11) NULL DEFAULT NULL COMMENT '需求/任务id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_log
-- ----------------------------
INSERT INTO `task_log` VALUES (4, 1, '2022-12-13 16:49:40', NULL, 9);
INSERT INTO `task_log` VALUES (5, 100, '2022-12-13 16:52:50', NULL, 9);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '账户',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户性别',
  `birth` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户出生年月日',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户签名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '13966668888', '测试用户1', '/img/1615660711852微信图片_20200613161732.jpg', '123456', '13966668888', '男', '2021-3-14', '测试');
INSERT INTO `user` VALUES (2, '13988886666', '测试用户2', '/img/1615661304203微信图片_20200613161719.jpg', '123456', '13988886666', '女', '2021-3-15', '测试');
INSERT INTO `user` VALUES (3, '15362749548', '测试用户3', '/img/1617178069173微信图片_20200613161732.jpg', '123456', '15362749548', '男', '2021-3-31', 'testtetst');

-- ----------------------------
-- Table structure for wishmovie
-- ----------------------------
DROP TABLE IF EXISTS `wishmovie`;
CREATE TABLE `wishmovie`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '想看电影id',
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `movie_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '电影id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `movie_id`(`movie_id`) USING BTREE,
  CONSTRAINT `wishmovie_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishmovie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of wishmovie
-- ----------------------------
INSERT INTO `wishmovie` VALUES (1, 1, 12);
INSERT INTO `wishmovie` VALUES (2, 2, 12);
INSERT INTO `wishmovie` VALUES (3, 3, 13);
INSERT INTO `wishmovie` VALUES (4, 3, 3);
INSERT INTO `wishmovie` VALUES (5, 3, 4);

SET FOREIGN_KEY_CHECKS = 1;
