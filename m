Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp3887622ejb;
        Tue, 21 Mar 2023 03:26:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set/K6g9N0P/Hbsnuq/sNTwCzZk9uGSGdKPL7rvh+mVgqFbpakiJSnrEN4UzZjevZ6VnGoUv1
X-Received: by 2002:ad4:5968:0:b0:56e:b91f:aec4 with SMTP id eq8-20020ad45968000000b0056eb91faec4mr2664693qvb.11.1679394381854;
        Tue, 21 Mar 2023 03:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679394381; cv=none;
        d=google.com; s=arc-20160816;
        b=k+6EVLN0Te/Wr0imJdd4scUlP27eEwNFo3iQPap/ypVWTbmeW0XAQw9PeH/4Gz+b6a
         1kty/QZhGlwIzfQBg4f+AEOqFDGX5yvJc1cSBd1eQX560sv7av+912vTrmxyFu/+km/1
         SEPEH9e2RZKAZ4B6cMmYCnayVmfJ5mjeA4hAWv4fWiYTOqXtSJDUVKUjkhzUZ0UDfRKQ
         Tyz30f2bqPpilmlX3DPL8w0nxuk5PksZcwgXmsThVVmLecgzpJNl6/Q0/oSHqV5AJ/58
         RyxOF9SRru+kZ1ii5NxolElC4jQUNQoyffagYOLNSm3By2lImXsOcHFrnbK4Q2Pu7PLY
         g/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wXXoWyWKWWH2FjBzmJ6Ej1UtcbxrxEiAo5dH8WKonGY=;
        b=nYD21DqOC9Kv4clHAqGqBEupP34DZY5mpAQVXrklt1jt1qbYENtYsUDztjvRoKObHK
         oYv/xWF9S3NhoJZsJmXlKZA0re6rOPEcXRAYj1RNITzaD9dPsjOJjmWCwa9gGTypY055
         tIScBmUX+kUZIM4MHHxFbw3ulN4YXZMD0sCqSi2Eaftx2ev+c0ISC82xStyQpJDI1BSR
         I2m6NYixcp0qz7obRNv9TD1aEpH11fKq1riYf0dwCcKsOqkAb1ogIVvI9MutiCPjiIF6
         2aONDUafDtP9+hRh7ihiFc+4Mp5zZrB/PU2Whc2TR77/L/pnZELCrehdmz/aSOSxjm4u
         Ikow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=iiKCuHR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do18-20020a05620a2b1200b007456a4f5f03si7913613qkb.102.2023.03.21.03.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Mar 2023 03:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=iiKCuHR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1peZBR-0000Qy-OH; Tue, 21 Mar 2023 06:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1peZBP-0000PM-N5; Tue, 21 Mar 2023 06:25:35 -0400
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1peZBK-0008NI-IM; Tue, 21 Mar 2023 06:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wXXoW
 yWKWWH2FjBzmJ6Ej1UtcbxrxEiAo5dH8WKonGY=; b=iiKCuHR02Fi5gvuxz7lTi
 y3hcQOW6dA21VqeTJ9k+GQgMGQT2aGYj4SSoEh4ynvmAUqDRy07HKSRsvDFs4oPO
 c02T4oAEYpXvMIfbEdq+D/a/atEMZkfpUd5swNJH0PQ8FO8wIxlFtlWd/Jnrx0ux
 X4ZWTHUOh6Fm2Kb91GN3ts=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g5-1 (Coremail) with SMTP id _____wBnznIHhhlk7VIWAA--.11160S6;
 Tue, 21 Mar 2023 18:25:14 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v1 04/11] hw: arm: allwinner-r40: Add 5 TWI controllers
Date: Tue, 21 Mar 2023 18:25:03 +0800
Message-Id: <20230321102510.16754-5-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321102510.16754-1-qianfanguijin@163.com>
References: <20230321102510.16754-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnznIHhhlk7VIWAA--.11160S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kKw1xCw4DtFW3Kr15Arb_yoW7ZF48pF
 W7C390grW0gw18Ar4kKws3XrySy348Gr17K3WS9FWftr10gr4kXry2va1UCF45Krs7Way3
 XrZ5JFWxG3W7taDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR-J5rUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXQc57VWBo+uC8QABsg
Received-SPF: pass client-ip=220.181.12.215;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GZjlaP8JmLpp

From: qianfan Zhao <qianfanguijin@163.com>

TWI(i2c) is designed to be used as an interface between CPU host and the
serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
operated in standard mode(100kbit/s) or fast-mode, supporting data rate
up to 400kbit/s.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 47 ++++++++++++++++++++++++++++++----
 include/hw/arm/allwinner-r40.h | 11 ++++++++
 2 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index fde01783b1..9fa23e1f33 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -52,6 +52,11 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_UART5]      = 0x01c29400,
     [AW_R40_DEV_UART6]      = 0x01c29800,
     [AW_R40_DEV_UART7]      = 0x01c29c00,
+    [AW_R40_DEV_TWI0]       = 0x01c2ac00,
+    [AW_R40_DEV_TWI1]       = 0x01c2b000,
+    [AW_R40_DEV_TWI2]       = 0x01c2b400,
+    [AW_R40_DEV_TWI3]       = 0x01c2b800,
+    [AW_R40_DEV_TWI4]       = 0x01c2c000,
     [AW_R40_DEV_GIC_DIST]   = 0x01c81000,
     [AW_R40_DEV_GIC_CPU]    = 0x01c82000,
     [AW_R40_DEV_GIC_HYP]    = 0x01c84000,
@@ -115,11 +120,6 @@ static struct AwR40Unimplemented r40_unimplemented[] = {
     { "uart7",      0x01c29c00, 1 * KiB },
     { "ps20",       0x01c2a000, 1 * KiB },
     { "ps21",       0x01c2a400, 1 * KiB },
-    { "twi0",       0x01c2ac00, 1 * KiB },
-    { "twi1",       0x01c2b000, 1 * KiB },
-    { "twi2",       0x01c2b400, 1 * KiB },
-    { "twi3",       0x01c2b800, 1 * KiB },
-    { "twi4",       0x01c2c000, 1 * KiB },
     { "scr",        0x01c2c400, 1 * KiB },
     { "tvd-top",    0x01c30000, 4 * KiB },
     { "tvd0",       0x01c31000, 4 * KiB },
@@ -167,6 +167,9 @@ enum {
     AW_R40_GIC_SPI_UART1     =  2,
     AW_R40_GIC_SPI_UART2     =  3,
     AW_R40_GIC_SPI_UART3     =  4,
+    AW_R40_GIC_SPI_TWI0      =  7,
+    AW_R40_GIC_SPI_TWI1      =  8,
+    AW_R40_GIC_SPI_TWI2      =  9,
     AW_R40_GIC_SPI_UART4     = 17,
     AW_R40_GIC_SPI_UART5     = 18,
     AW_R40_GIC_SPI_UART6     = 19,
@@ -177,6 +180,8 @@ enum {
     AW_R40_GIC_SPI_MMC1      = 33,
     AW_R40_GIC_SPI_MMC2      = 34,
     AW_R40_GIC_SPI_MMC3      = 35,
+    AW_R40_GIC_SPI_TWI3      = 88,
+    AW_R40_GIC_SPI_TWI4      = 89,
 };
 
 /* Allwinner R40 general constants */
@@ -262,6 +267,12 @@ static void allwinner_r40_init(Object *obj)
     object_initialize_child(obj, "mmc1", &s->mmc1, TYPE_AW_SDHOST_SUN5I);
     object_initialize_child(obj, "mmc2", &s->mmc2, TYPE_AW_SDHOST_SUN5I);
     object_initialize_child(obj, "mmc3", &s->mmc3, TYPE_AW_SDHOST_SUN5I);
+
+    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi1", &s->i2c1, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi2", &s->i2c2, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi3", &s->i2c3, TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi4", &s->i2c4, TYPE_AW_I2C_SUN6I);
 }
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
@@ -429,6 +440,32 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART7),
                    115200, serial_hd(7), DEVICE_NATIVE_ENDIAN);
 
+    /* I2C */
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_R40_DEV_TWI0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI0));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_R40_DEV_TWI1]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI1));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_R40_DEV_TWI2]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI2));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c3), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c3), 0, s->memmap[AW_R40_DEV_TWI3]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c3), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI3));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c4), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c4), 0, s->memmap[AW_R40_DEV_TWI4]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c4), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI4));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
         create_unimplemented_device(r40_unimplemented[i].device_name,
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index dfb5eb609c..6a7e5c1e31 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -26,6 +26,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/misc/allwinner-r40-ccu.h"
+#include "hw/i2c/allwinner-i2c.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -48,6 +49,11 @@ enum {
     AW_R40_DEV_UART5,
     AW_R40_DEV_UART6,
     AW_R40_DEV_UART7,
+    AW_R40_DEV_TWI0,
+    AW_R40_DEV_TWI1,
+    AW_R40_DEV_TWI2,
+    AW_R40_DEV_TWI3,
+    AW_R40_DEV_TWI4,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
@@ -89,6 +95,11 @@ struct AwR40State {
     AwSdHostState mmc2;
     AwSdHostState mmc3;
     AwR40ClockCtlState ccu;
+    AWI2CState i2c0;
+    AWI2CState i2c1;
+    AWI2CState i2c2;
+    AWI2CState i2c3;
+    AWI2CState i2c4;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
-- 
2.25.1

