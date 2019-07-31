/*
 Navicat Premium Data Transfer

 Source Server         : 123.56.221.77
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 123.56.221.77:3306
 Source Schema         : zuihou_authority_dev

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 28/07/2019 23:39:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for c_auth_application
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_application`;
CREATE TABLE `c_auth_application` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `index_url` varchar(100) DEFAULT '' COMMENT '首页访问地址',
  `name` varchar(20) DEFAULT '' COMMENT '应用名称',
  `logo_url` varchar(255) DEFAULT '' COMMENT '应用logo',
  `describe_` varchar(200) DEFAULT '' COMMENT '功能描述',
  `code` varchar(20) NOT NULL COMMENT '应用编码\r\n必须唯一',
  `sort_value` int(11) DEFAULT '1' COMMENT '序号',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `icp_code` varchar(32) DEFAULT '' COMMENT 'ICP备案号',
  `title_icon` varchar(255) DEFAULT '' COMMENT '标题logo',
  `support_unit` varchar(32) DEFAULT '' COMMENT '技术支持单位',
  `common_record` varchar(32) DEFAULT '' COMMENT '公网备案号',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `un_code_` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应用';

-- ----------------------------
-- Table structure for c_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_menu`;
CREATE TABLE `c_auth_menu` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `describe_` varchar(200) DEFAULT '' COMMENT '功能描述',
  `code` varchar(255) DEFAULT '' COMMENT '资源编码',
  `is_public` bit(1) DEFAULT b'0' COMMENT '是否公开菜单\r\n就是无需分配就可以访问的。所有人可见',
  `href` varchar(255) DEFAULT '' COMMENT '资源路径',
  `target` varchar(9) DEFAULT 'SELF' COMMENT '打开方式\r\n#TargetType{SELF:_self,相同框架;TOP:_top,当前页;BLANK:_blank,新建窗口;PAREN:_parent,父窗口}',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `icon` varchar(255) DEFAULT '' COMMENT '菜单图标',
  `group_` varchar(20) DEFAULT '' COMMENT '菜单分组',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父级菜单id',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UN_CODE` (`code`) USING BTREE COMMENT '编码唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

-- ----------------------------
-- Table structure for c_auth_micro_service
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_micro_service`;
CREATE TABLE `c_auth_micro_service` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) DEFAULT '' COMMENT '服务名称',
  `describe_` varchar(100) DEFAULT '' COMMENT '服务描述',
  `eureka_code` varchar(100) DEFAULT '' COMMENT 'eureka编码\r\n就是服务注册到eureka后，他的application name',
  `swagger_url` varchar(255) DEFAULT '' COMMENT 'swagger地址',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='服务表';

-- ----------------------------
-- Table structure for c_auth_resource
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_resource`;
CREATE TABLE `c_auth_resource` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `code` varchar(255) DEFAULT '' COMMENT '资源编码\n规则：\n链接：\n数据列：\n按钮：',
  `resource_type` varchar(10) NOT NULL DEFAULT 'BUTTON' COMMENT '资源类型 \n#ResourceType{BUTTON:按钮;URI:链接;COLUMN:字段;}',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '接口名称',
  `micro_service_id` bigint(20) DEFAULT NULL COMMENT '服务ID\n#c_auth_micro_service',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID\n#c_auth_menu',
  `menu_name` varchar(255) DEFAULT '' COMMENT '菜单名称',
  `tags` varchar(255) DEFAULT '' COMMENT '类标签',
  `describe_` varchar(255) DEFAULT '' COMMENT '接口描述',
  `uri` varchar(150) DEFAULT '' COMMENT '地址',
  `http_method` varchar(7) DEFAULT 'GET' COMMENT '请求方式\r\n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}\n         ',
  `deprecated` bit(1) DEFAULT b'0' COMMENT '是否过时',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UN_CODE` (`code`) USING BTREE COMMENT '编码唯一',
  UNIQUE KEY `UN_URI` (`resource_type`,`micro_service_id`,`http_method`,`uri`) USING BTREE COMMENT 'URI唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源';



-- ----------------------------
-- Table structure for c_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role`;
CREATE TABLE `c_auth_role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) DEFAULT '' COMMENT '角色名称',
  `code` varchar(20) DEFAULT '' COMMENT '角色编码',
  `describe_` varchar(100) DEFAULT '' COMMENT '功能描述',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `is_readonly` bit(1) DEFAULT b'0' COMMENT '是否只读角色',
  `ds_type` int(11) DEFAULT '5' COMMENT '数据权限类型\n#DataScopeType{ALL:1,全部;THIS_LEVEL:2,本级;THIS_LEVEL_CHILDREN:3,本级以及子级;CUSTOMIZE:4,自定义;SELF:5,个人;}',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of c_auth_role
-- ----------------------------
BEGIN;
INSERT INTO `c_auth_role` VALUES (1, '超级管理员', 'SUPER_ADMIN', '系统内置超级管理员，勿删', b'1', b'1', 5, 1, '2019-06-06 13:53:56', 1, '2019-06-06 13:53:59');
COMMIT;

-- ----------------------------
-- Table structure for c_auth_role_authority
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role_authority`;
CREATE TABLE `c_auth_role_authority` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `authority_id` bigint(20) NOT NULL COMMENT '资源id\n#c_auth_resource\n#c_auth_menu',
  `authority_type` varchar(10) NOT NULL DEFAULT 'MENU' COMMENT '权限类型\n#AuthorizeType{MENU:菜单;RESOURCE:资源;}',
  `role_id` bigint(20) NOT NULL COMMENT '角色id\n#c_auth_role',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色的资源';

-- ----------------------------
-- Records of c_auth_role_authority
-- ----------------------------
BEGIN;
INSERT INTO `c_auth_role_authority` VALUES (1, 1, 'MENU', 1, '2019-06-26 11:35:07', 0);
INSERT INTO `c_auth_role_authority` VALUES (2, 2, 'MENU', 1, NULL, 0);
INSERT INTO `c_auth_role_authority` VALUES (3, 3, 'MENU', 1, NULL, 0);
INSERT INTO `c_auth_role_authority` VALUES (4, 4, 'MENU', 1, NULL, 0);
INSERT INTO `c_auth_role_authority` VALUES (5, 5, 'MENU', 1, NULL, 0);
INSERT INTO `c_auth_role_authority` VALUES (6, 1, 'RESOURCE', 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for c_auth_role_org
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_role_org`;
CREATE TABLE `c_auth_role_org` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID\n#c_auth_role',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID\n#c_core_org',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色组织关系';

-- ----------------------------
-- Table structure for c_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_user`;
CREATE TABLE `c_auth_user` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `account` varchar(30) NOT NULL COMMENT '账号',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `org_id` bigint(20) DEFAULT NULL COMMENT '组织ID\n#c_core_org',
  `station_id` bigint(20) DEFAULT NULL COMMENT '岗位ID\n#c_core_station',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机',
  `sex` varchar(1) DEFAULT 'M' COMMENT '性别\n#Sex{W:女;M:男}',
  `is_can_login` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可登陆',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '删除标记',
  `photo` varchar(255) DEFAULT '' COMMENT '照片',
  `work_describe` varchar(255) DEFAULT '' COMMENT '工作描述\r\n比如：  市长、管理员、局长等等   用于登陆展示',
  `login_count` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数\n一直累计，记录了此账号总共登录次数',
  `continuation_error_day` date DEFAULT NULL COMMENT '输入密码错误的日期\r\n比如20190102  与error_count合力实现一天输入密码错误次数限制',
  `continuation_error_count` int(11) NOT NULL DEFAULT '0' COMMENT '一天连续输错密码次数',
  `password_expire_time` datetime DEFAULT NULL COMMENT '密码过期时间',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of c_auth_user
-- ----------------------------
BEGIN;
INSERT INTO `c_auth_user` VALUES (1, 'zuihou', 'zuihou', 1, 1, '1', 'M', b'1', b'0', '1', '1', 29, '2019-06-13', 0, '2019-09-07 09:56:54', 'E10ADC3949BA59ABBE56E057F20F883E', 1, '2019-07-28 11:08:20', 1, '2019-06-04 18:29:55');
COMMIT;

-- ----------------------------
-- Table structure for c_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `c_auth_user_role`;
CREATE TABLE `c_auth_user_role` (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '角色ID\n#c_auth_role',
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID\n#c_core_accou',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色分配\r\n账号角色绑定';

-- ----------------------------
-- Records of c_auth_user_role
-- ----------------------------
BEGIN;
INSERT INTO `c_auth_user_role` VALUES (1, 1, 1, 1, NULL);
INSERT INTO `c_auth_user_role` VALUES (2, 2, 1, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for c_common_area
-- ----------------------------
DROP TABLE IF EXISTS `c_common_area`;
CREATE TABLE `c_common_area` (
  `id` bigint(11) NOT NULL COMMENT 'id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '地区编码',
  `full_name` varchar(255) DEFAULT '' COMMENT '全名',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `longitude` varchar(255) DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) DEFAULT '' COMMENT '维度',
  `level` int(1) NOT NULL DEFAULT '0' COMMENT '行政区级',
  `parent_code` varchar(64) DEFAULT NULL COMMENT '上级行政区码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(11) DEFAULT '0' COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(11) DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区表';


-- ----------------------------
-- Table structure for c_common_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `c_common_dictionary`;
CREATE TABLE `c_common_dictionary` (
  `id` bigint(20) NOT NULL,
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '编码\r\n一颗树仅仅有一个统一的编码',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '父级id  \r\n顶级的字典父级id是自己',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '字典名称',
  `describe_` varchar(200) DEFAULT '' COMMENT '字典描述',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典目录';

-- ----------------------------
-- Records of c_common_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `c_common_dictionary` VALUES (1, 'NATION', 1, '民族', '民族', b'1', b'0', 1, '2019-06-01 09:42:50', 1, '2019-06-01 09:42:54');
INSERT INTO `c_common_dictionary` VALUES (2, 'POSITION_STATUS', -1, '在职状态', NULL, b'1', b'0', 1, '2019-06-04 11:37:15', 1, '2019-06-04 11:37:15');
INSERT INTO `c_common_dictionary` VALUES (3, 'EDUCATION', -1, '学历', NULL, b'1', b'0', 1, '2019-06-04 11:33:52', 1, '2019-06-04 11:33:52');
COMMIT;

-- ----------------------------
-- Table structure for c_common_dictionary_item
-- ----------------------------
DROP TABLE IF EXISTS `c_common_dictionary_item`;
CREATE TABLE `c_common_dictionary_item` (
  `id` bigint(20) NOT NULL COMMENT '字典项id',
  `dictionary_id` bigint(20) NOT NULL COMMENT '字典id',
  `dictionary_code` varchar(64) NOT NULL COMMENT '字典编码',
  `code` varchar(64) NOT NULL DEFAULT '' COMMENT '字典项编码',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `is_enable` bit(1) DEFAULT b'1' COMMENT '是否启用',
  `is_delete` bit(1) DEFAULT b'0' COMMENT '是否删除',
  `describe_` varchar(255) DEFAULT '' COMMENT '描述',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `create_user` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint(20) DEFAULT '0' COMMENT '更新人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dict_code_item_code_uniq` (`dictionary_code`,`code`) USING BTREE COMMENT '字典编码与字典项目编码联合唯一'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典项';

-- ----------------------------
-- Records of c_common_dictionary_item
-- ----------------------------
BEGIN;
INSERT INTO `c_common_dictionary_item` VALUES (40, 3, 'EDUCATION', '', '本科', b'1', b'0', '', 1, 1, '2019-06-04 11:36:19', 1, '2019-06-04 11:36:19');
INSERT INTO `c_common_dictionary_item` VALUES (41, 3, 'EDUCATION', '', '博士', b'1', b'0', '', 1, 1, '2019-06-04 11:36:29', 1, '2019-06-04 11:36:29');
INSERT INTO `c_common_dictionary_item` VALUES (43, 1, 'NATION', '', '汉族', b'1', b'0', '汉族', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (44, 1, 'NATION', '', '壮族', b'1', b'0', '壮族', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (45, 1, 'NATION', '', '满族', b'1', b'0', '满族', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (46, 1, 'NATION', '', '回族', b'1', b'0', '回族', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (47, 1, 'NATION', '', '苗族', b'1', b'0', '苗族', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (48, 1, 'NATION', '', '维吾尔族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (49, 1, 'NATION', '', '土家族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (50, 1, 'NATION', '', '彝族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (51, 1, 'NATION', '', '蒙古族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (52, 1, 'NATION', '', '藏族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (53, 1, 'NATION', '', '布依族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (54, 1, 'NATION', '', '侗族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (55, 1, 'NATION', '', '瑶族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (56, 1, 'NATION', '', '朝鲜族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (57, 1, 'NATION', '', '白族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (58, 1, 'NATION', '', '哈尼族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (59, 1, 'NATION', '', '哈萨克族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (60, 1, 'NATION', '', '黎族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (61, 1, 'NATION', '', '傣族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (62, 1, 'NATION', '', '畲族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (63, 1, 'NATION', '', '傈僳族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (64, 1, 'NATION', '', '仡佬族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (65, 1, 'NATION', '', '东乡族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (66, 1, 'NATION', '', '高山族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (67, 1, 'NATION', '', '拉祜族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (68, 1, 'NATION', '', '水族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (69, 1, 'NATION', '', '佤族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (70, 1, 'NATION', '', '纳西族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (71, 1, 'NATION', '', '羌族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (72, 1, 'NATION', '', '土族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (73, 1, 'NATION', '', '仫佬族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (74, 1, 'NATION', '', '锡伯族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (75, 1, 'NATION', '', '柯尔克孜族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (76, 1, 'NATION', '', '达斡尔族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (77, 1, 'NATION', '', '景颇族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (78, 1, 'NATION', '', '毛南族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (79, 1, 'NATION', '', '撒拉族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (80, 1, 'NATION', '', '塔吉克族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (81, 1, 'NATION', '', '阿昌族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (82, 1, 'NATION', '', '普米族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (83, 1, 'NATION', '', '鄂温克族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (84, 1, 'NATION', '', '怒族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (85, 1, 'NATION', '', '京族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (86, 1, 'NATION', '', '基诺族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (87, 1, 'NATION', '', '德昂族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (88, 1, 'NATION', '', '保安族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (89, 1, 'NATION', '', '俄罗斯族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (90, 1, 'NATION', '', '裕固族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (91, 1, 'NATION', '', '乌兹别克族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (92, 1, 'NATION', '', '门巴族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (93, 1, 'NATION', '', '鄂伦春族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (94, 1, 'NATION', '', '独龙族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (95, 1, 'NATION', '', '塔塔尔族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (96, 1, 'NATION', '', '赫哲族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (97, 1, 'NATION', '', '珞巴族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (98, 1, 'NATION', '', '布朗族', b'1', b'0', '', 1, 1, '2018-03-15 20:11:01', 1, '2018-03-15 20:11:04');
INSERT INTO `c_common_dictionary_item` VALUES (99, 2, 'POSITION_STATUS', '', '在职', b'1', b'0', '', 1, 1, '2019-06-04 11:38:16', 1, '2019-06-04 11:38:16');
INSERT INTO `c_common_dictionary_item` VALUES (100, 2, 'POSITION_STATUS', '', '离职', b'1', b'0', '', 1, 1, '2019-06-04 11:38:50', 1, '2019-06-04 11:38:50');
COMMIT;

-- ----------------------------
-- Table structure for c_common_opt_log
-- ----------------------------
DROP TABLE IF EXISTS `c_common_opt_log`;
CREATE TABLE `c_common_opt_log` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `request_ip` varchar(50) DEFAULT '' COMMENT '操作IP',
  `type` varchar(5) DEFAULT 'OPT' COMMENT '日志类型\n#LogType{OPT:操作类型;EX:异常类型}',
  `user_name` varchar(50) DEFAULT '' COMMENT '操作人',
  `description` varchar(255) DEFAULT '' COMMENT '操作描述',
  `class_path` varchar(255) DEFAULT '' COMMENT '类路径',
  `action_method` varchar(50) DEFAULT '' COMMENT '请求类型',
  `request_uri` varchar(50) DEFAULT '' COMMENT '请求地址',
  `http_method` varchar(10) DEFAULT 'GET' COMMENT '请求类型\n#HttpMethod{GET:GET请求;POST:POST请求;PUT:PUT请求;DELETE:DELETE请求;PATCH:PATCH请求;TRACE:TRACE请求;HEAD:HEAD请求;OPTIONS:OPTIONS请求;}',
  `params` text COMMENT '请求参数',
  `result` text COMMENT '返回值',
  `ex_desc` text COMMENT '异常详情信息',
  `ex_detail` text COMMENT '异常描述',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `consuming_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  `ua` varchar(500) DEFAULT '' COMMENT '浏览器',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_type` (`type`) USING BTREE COMMENT '日志类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Table structure for c_core_org
-- ----------------------------
DROP TABLE IF EXISTS `c_core_org`;
CREATE TABLE `c_core_org` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `abbreviation` varchar(255) DEFAULT '' COMMENT '简称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父ID',
  `tree_path` varchar(255) DEFAULT ',' COMMENT '树结构',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `status` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT KEY `FU_PATH` (`tree_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='组织';

-- ----------------------------
-- Records of c_core_org
-- ----------------------------
BEGIN;
INSERT INTO `c_core_org` VALUES (1, '最后集团股份有限公司', '最后集团', -1, ',', 1, b'1', '初始化数据', '2019-07-10 17:02:18', 1, '2019-07-10 17:02:16', 1);
INSERT INTO `c_core_org` VALUES (603634847700746593, '123', '123', -1, ',', 1, b'1', '123', '2019-07-24 17:09:23', 1, '2019-07-24 17:09:23', 1);
INSERT INTO `c_core_org` VALUES (603641417591423009, '123', '123', -1, ',', 1, b'1', '123', '2019-07-24 17:35:29', 1, '2019-07-24 17:35:29', 1);
INSERT INTO `c_core_org` VALUES (603641685313847393, '节点名称', '节点简称', -1, ',', 1, b'1', '节点描述', '2019-07-24 17:36:33', 1, '2019-07-24 17:36:33', 1);
INSERT INTO `c_core_org` VALUES (603970147639626145, '用户中心', '', -1, ',', 1, b'1', '用户中心目录', '2019-07-25 15:21:45', 1, '2019-07-25 15:21:45', 1);
COMMIT;

-- ----------------------------
-- Table structure for c_core_station
-- ----------------------------
DROP TABLE IF EXISTS `c_core_station`;
CREATE TABLE `c_core_station` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '名称',
  `org_id` bigint(20) DEFAULT '0' COMMENT '组织ID\n#c_core_org',
  `sort_value` int(11) DEFAULT '1' COMMENT '排序',
  `status` bit(1) DEFAULT b'1' COMMENT '状态',
  `describe_` varchar(255) DEFAULT '' COMMENT '描述',
  `create_time` datetime DEFAULT NULL,
  `create_user` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='岗位';

-- ----------------------------
-- Records of c_core_station
-- ----------------------------
BEGIN;
INSERT INTO `c_core_station` VALUES (1, '总经理', 1, 1, b'1', '总经理', '2019-07-10 17:03:03', 1, '2019-07-10 17:03:06', 1);
INSERT INTO `c_core_station` VALUES (603609686662447137, '', 1, 1, b'1', '123', '2019-07-24 15:29:24', 1, '2019-07-24 15:29:24', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
