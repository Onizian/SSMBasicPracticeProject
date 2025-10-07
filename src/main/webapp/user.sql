/*
 Navicat Premium Data Transfer

 Source Server         : study
 Source Server Type    : MySQL
 Source Server Version : 50512
 Source Host           : localhost:3306
 Source Schema         : user

 Target Server Type    : MySQL
 Target Server Version : 50512
 File Encoding         : 65001

 Date: 02/10/2025 19:09:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root23', 'root2');
INSERT INTO `user` VALUES (3, '吴彦辉e', 'root2');
INSERT INTO `user` VALUES (4, '吴彦辉', 'root2');
INSERT INTO `user` VALUES (9, '彦辉', 'root2');
INSERT INTO `user` VALUES (10, '彦辉', 'root2');
INSERT INTO `user` VALUES (12, 'jack', 'root2');

SET FOREIGN_KEY_CHECKS = 1;
