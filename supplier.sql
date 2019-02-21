/*Table structure for table `_channel_apply` */
USE `parking_default`;

DROP TABLE IF EXISTS `_channel_apply`;

CREATE TABLE `_channel_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_no` varchar(64) NOT NULL DEFAULT '' COMMENT '申请编号',
  `park_apply_no` varchar(64) NOT NULL DEFAULT '' COMMENT '停车场的申请编号',
  `merchant` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商商户号',
  `type` tinyint(4) NOT NULL COMMENT '渠道类型：1,微信对公2,微信对私3,支付宝对公4,支付宝对私',
  `telephone` varchar(32) NOT NULL DEFAULT '' COMMENT '校验手机号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付渠道状态：\n-1已删除, 0 资料填写中, 1 待审核, 2 审核中, 3 审核通过(可用未启用), 4 已开通(正式启用), -2 审核不通过',
  `status_desc` varchar(256) NOT NULL DEFAULT '' COMMENT '状态描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apply_no` (`apply_no`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `_channel_kv`;

CREATE TABLE `_channel_kv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL DEFAULT '' COMMENT '属性名称',
  `value` varchar(128) NOT NULL DEFAULT '' COMMENT '属性值',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未审核、1审核通过、-1审核未通过',
  `status_desc` varchar(32) NOT NULL DEFAULT '' COMMENT '审核状态描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


/*Table structure for table `_materiel_apply` */

DROP TABLE IF EXISTS `_materiel_apply`;

CREATE TABLE `_materiel_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seqno` varchar(32) NOT NULL DEFAULT '' COMMENT '申请单号',
  `merchant` varchar(32) NOT NULL DEFAULT '' COMMENT '供应商商户号',
  `park_uuid` varchar(64) NOT NULL DEFAULT '',
  `receiver_name` varchar(32) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `receiver_addr` varchar(64) NOT NULL DEFAULT '' COMMENT '收货人地址',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:未发货，1已发货',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seqno` (`seqno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


/*Table structure for table `_supplier_park_apply` */

DROP TABLE IF EXISTS `_supplier_park_apply`;

CREATE TABLE `_supplier_park_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `park_uuid` varchar(64) DEFAULT '' COMMENT '车场 uuid，只有在审核通过时才会更新为正式数据',
  `park_code` varchar(32) DEFAULT '' COMMENT '车场商户号，只有在审核通过时才会更新为正式数据',
  `merchant` varchar(32) NOT NULL COMMENT '供应商商户号',
  `seqno` varchar(24) NOT NULL COMMENT '申请编号',
  `park_name` varchar(100) NOT NULL COMMENT '车场名称',
  `province` varchar(30) NOT NULL COMMENT '省',
  `city` varchar(30) NOT NULL COMMENT '市',
  `district` varchar(30) NOT NULL COMMENT '区/县',
  `address` varchar(100) NOT NULL COMMENT '详细地址（如：广东省深圳市南山区科技1路）',
  `area` varchar(10) DEFAULT '' COMMENT '地理编码',
  `lng` decimal(16,10) DEFAULT '0.0000000000' COMMENT '经度',
  `lat` decimal(16,10) DEFAULT '0.0000000000' COMMENT '纬度',
  `total_parking_space` int(11) NOT NULL COMMENT '总车位数',
  `charge_type` tinyint(4) NOT NULL COMMENT '收费类型: com.chinaroad.api.v1.parking.ChargeType',
  `charge_json` varchar(500) NOT NULL DEFAULT '' COMMENT '收费规则JSON描述',
  `charge_image` varchar(200) DEFAULT '' COMMENT '收费牌照片',
  `gate_image` varchar(200) DEFAULT '' COMMENT '出入口照片',
  `enter_gate` varchar(500) DEFAULT '' COMMENT '入口图片集合',
  `leave_gate` varchar(500) DEFAULT '' COMMENT '出口图片集合',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  `status` tinyint(4) NOT NULL COMMENT '审核状态',
  `reason` varchar(200) DEFAULT '' COMMENT '审核未通过的消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*Table structure for table `_supplier_merchant_setting` */

DROP TABLE IF EXISTS `_supplier_merchant_setting`;

CREATE TABLE `_supplier_merchant_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant` varchar(32) NOT NULL COMMENT '供应商商户号',
  `auth_code` varchar(24) NOT NULL DEFAULT '' COMMENT '授权码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


/*Table structure for table `_supplier_park_rt` */



CREATE TABLE `_supplier_park_rt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '供应商商户号',
  `api_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '对接接口分类',
  `api_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接入名称',
  `api_icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '接入接口LOGO',
  `api_features` bigint(11) NOT NULL COMMENT '接入特性',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态: 1有效, 0无效 ',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '1001-01-01 00:00:00' COMMENT '更新时间',
  `remark` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;