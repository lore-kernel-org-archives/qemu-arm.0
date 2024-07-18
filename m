Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1261022njk;
        Wed, 17 Jul 2024 23:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXIHEGvJZLLRRpzfTILqENAnnlGBmtFbPhobzA4MPJZjmAWisKGrOrg0h1f13pD3zMkw/8qAUd05oH1HUCxY2hS6uSKVyxd
X-Google-Smtp-Source: AGHT+IGtHH6pkwand53RK+nG1B+pLhubgLYDUtZKv5eezVgSkHa9WACGAF1ETYMt5yxKlUDoCALG
X-Received: by 2002:a05:6102:1517:b0:48f:e954:2426 with SMTP id ada2fe7eead31-49159739936mr5075813137.2.1721285563746;
        Wed, 17 Jul 2024 23:52:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285563; cv=none;
        d=google.com; s=arc-20160816;
        b=gpukCJQthDGiEKqL0Kd4a0TN8L907Vv98OYSIjQvSmUy2w71keySU9WqeQUh6Ii9k0
         Y5qXkB66RzoZDaWwiGVkdDBDTZo3Rx18BXRJO2Qb2gpzxeS/SNMGHCziGaHp5xQXwgF2
         XczDBUKP0LN4xI0ViYBPUEUjYteH00FW6+MS4KYrOy6Je0r9GXqQJAVITE3ECeSvIk6D
         N2oGX/tj8nO4oBkb8wj/ipCOEBu0b1b9uP/UFT+gBLeZLKlE878roII9W7VAMadwY1bH
         8z/6tjDeIWgaT37675dMzRZk56PIqByX4BkT2M4Xj6Haa69XME4bzAn4YiLxctyfHXyy
         5B2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=o5OIeQ0sRi7L3i5A2e29VtkBS56V4AWZJGTrAhhr6EE=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=PUrmjxmL7itTSEEaF0wvn6uUcvEZ+4RZyY6bXzBtR9yun2UQdjRVxmIIQUl4QgwXsk
         j6MaIpVLNuIzvfM4OPQIgk7WJ6CuC6CIe8Q0SxrQjepBkb1XhiG/fik381iPy6wRTR0v
         bt44Rhe2Jf7UAIMqnhuFo8p2wWZIm52Ft46htmOzDl/bFy80k4T/m3SNS6vZex/l7PJ5
         68di5myPy5GuM1R1iQ3WHwzjEyVyjEaYCe2C16KCO69P0bQFpeqD7jDmYpZj80ZaIM8B
         r5RqpEwMhLAdnRxllttI7YmVBENYrTaUJirT8ia1Nup5lrBCyVMXTCA5yOOqIZBvl1zj
         Ddmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c58790csi14228046d6.120.2024.07.17.23.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:52:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKyf-0006vs-A3; Thu, 18 Jul 2024 02:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyZ-0006KO-4e; Thu, 18 Jul 2024 02:50:51 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKyX-0004VA-3x; Thu, 18 Jul 2024 02:50:50 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:17 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:50:17 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 09/15] hw/i2c/aspeed: Add AST2700 support
Date: Thu, 18 Jul 2024 14:49:19 +0800
Message-ID: <20240718064925.1846074-10-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NZqDtuOvtBdo

Introduce a new ast2700 class to support AST2700.
The I2C bus register memory regions and
I2C bus pool buffer memory regions are discontinuous
and they do not back compatible AST2600.

Add a new ast2700 i2c class init function to match the
address of I2C bus register and pool buffer from the datasheet.

An I2C controller registers owns 8KB address space.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/i2c/aspeed_i2c.c         | 62 +++++++++++++++++++++++++++++++++++++
 include/hw/i2c/aspeed_i2c.h |  1 +
 2 files changed, 63 insertions(+)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index c0d3ac3867..29d400ac93 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1101,6 +1101,41 @@ static void aspeed_i2c_instance_init(Object *obj)
  *   0xDA0 ... 0xDBF: Device 14 buffer
  *   0xDC0 ... 0xDDF: Device 15 buffer (15 and 16 unused in AST1030)
  *   0xDE0 ... 0xDFF: Device 16 buffer
+ *
+ * Address Definitions (AST2700)
+ *   0x000 ... 0x0FF: Global Register
+ *   0x100 ... 0x17F: Device 0
+ *   0x1A0 ... 0x1BF: Device 0 buffer
+ *   0x200 ... 0x27F: Device 1
+ *   0x2A0 ... 0x2BF: Device 1 buffer
+ *   0x300 ... 0x37F: Device 2
+ *   0x3A0 ... 0x3BF: Device 2 buffer
+ *   0x400 ... 0x47F: Device 3
+ *   0x4A0 ... 0x4BF: Device 3 buffer
+ *   0x500 ... 0x57F: Device 4
+ *   0x5A0 ... 0x5BF: Device 4 buffer
+ *   0x600 ... 0x67F: Device 5
+ *   0x6A0 ... 0x6BF: Device 5 buffer
+ *   0x700 ... 0x77F: Device 6
+ *   0x7A0 ... 0x7BF: Device 6 buffer
+ *   0x800 ... 0x87F: Device 7
+ *   0x8A0 ... 0x8BF: Device 7 buffer
+ *   0x900 ... 0x97F: Device 8
+ *   0x9A0 ... 0x9BF: Device 8 buffer
+ *   0xA00 ... 0xA7F: Device 9
+ *   0xAA0 ... 0xABF: Device 9 buffer
+ *   0xB00 ... 0xB7F: Device 10
+ *   0xBA0 ... 0xBBF: Device 10 buffer
+ *   0xC00 ... 0xC7F: Device 11
+ *   0xCA0 ... 0xCBF: Device 11 buffer
+ *   0xD00 ... 0xD7F: Device 12
+ *   0xDA0 ... 0xDBF: Device 12 buffer
+ *   0xE00 ... 0xE7F: Device 13
+ *   0xEA0 ... 0xEBF: Device 13 buffer
+ *   0xF00 ... 0xF7F: Device 14
+ *   0xFA0 ... 0xFBF: Device 14 buffer
+ *   0x1000 ... 0x107F: Device 15
+ *   0x10A0 ... 0x10BF: Device 15 buffer
  */
 static void aspeed_i2c_realize(DeviceState *dev, Error **errp)
 {
@@ -1500,6 +1535,32 @@ static const TypeInfo aspeed_1030_i2c_info = {
     .class_init = aspeed_1030_i2c_class_init,
 };
 
+static void aspeed_2700_i2c_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedI2CClass *aic = ASPEED_I2C_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 I2C Controller";
+
+    aic->num_busses = 16;
+    aic->reg_size = 0x80;
+    aic->reg_gap_size = 0x80;
+    aic->gap = -1; /* no gap */
+    aic->bus_get_irq = aspeed_2600_i2c_bus_get_irq;
+    aic->pool_size = 0x20;
+    aic->pool_gap_size = 0xe0;
+    aic->pool_base = 0x1a0;
+    aic->bus_pool_base = aspeed_2500_i2c_bus_pool_base;
+    aic->has_dma = true;
+    aic->mem_size = 0x10000;
+}
+
+static const TypeInfo aspeed_2700_i2c_info = {
+    .name = TYPE_ASPEED_2700_I2C,
+    .parent = TYPE_ASPEED_I2C,
+    .class_init = aspeed_2700_i2c_class_init,
+};
+
 static void aspeed_i2c_register_types(void)
 {
     type_register_static(&aspeed_i2c_bus_info);
@@ -1509,6 +1570,7 @@ static void aspeed_i2c_register_types(void)
     type_register_static(&aspeed_2500_i2c_info);
     type_register_static(&aspeed_2600_i2c_info);
     type_register_static(&aspeed_1030_i2c_info);
+    type_register_static(&aspeed_2700_i2c_info);
 }
 
 type_init(aspeed_i2c_register_types)
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index bdaea3207d..4f23dc10c3 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -31,6 +31,7 @@
 #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
 #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
 #define TYPE_ASPEED_1030_I2C TYPE_ASPEED_I2C "-ast1030"
+#define TYPE_ASPEED_2700_I2C TYPE_ASPEED_I2C "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
 
 #define ASPEED_I2C_NR_BUSSES 16
-- 
2.34.1

