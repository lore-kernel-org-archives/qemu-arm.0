Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp3299427ejq;
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FIC1h8oSKmhEw4m79YwrUgTMo9sKjx97EwU+bigraloN4uyjfva8XFDmjrqDsyW4KvaVz
X-Received: by 2002:ad4:5e88:0:b0:616:2ff9:4826 with SMTP id jl8-20020ad45e88000000b006162ff94826mr27115994qvb.18.1683714649141;
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683714649; cv=none;
        d=google.com; s=arc-20160816;
        b=wt1nKgT8xOrmD+sRnSwSiEAMjxtr6vLnooVeAHa/0C3H4CitkyJsavg6nQWHslzLGL
         5baHcIhWMUOJf8IzPtF9XTn0GuUgPFolqgkD6R+uSFdLDbt/PX+Oo0Q2Q8yR4qcC8uJ6
         G9HKbaW/QkZcNydMPg2Iy20i++lRIHfVRXQ7ja87MFMM7SVJMEZ7G5W5kjfMB+wSY+j5
         oqMgiinzh71PkAfZw9oy28uRRMODgQOwK9jdNLUKXvcwQW888qVW1m6ya8S8v2ZGpPVh
         tSrfzgSHnwv1r1tCg2D8tiqniYvgcbdt+SMmzPPXodlCyaBz9EnaAELRSnXlCMs0Q52V
         HFqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ssr3YcMfBRQyrFgA16vA9luoUvtonw5w3L+xZwG8/4A=;
        b=zZuGUv1Y49sn22W4x94MHIEfXILFsKiEOzWqIIwKcIv+uAlIDyl4bVJgDfD8Uin4MT
         ZYApAGFz0bu6qa2BavpXoCMfRDb91QsdibMSJL80JWgPdsYiqS5YY+sph1TEmuHE9d7k
         OBU8dJn46Z0nu0W9GSWpdMUiTzLxuZc+PZycP50f8+EEYiqUUZQKMACmMdsxEomgeL7T
         OeP3dDyRiYJEMp5ZxZ2k32PCTYv8U6cPmk/7VLNympvpBWkeZCfTNM3nNldl8gggfOXw
         2ZgXA8bmxGTFDH6WyV/wFLLHU8iXzvSUWIZs36qeczMV2h5k2mBoPFD8UdnuiYbtNyis
         Bu/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=GWTGB82F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13-20020ad45c8d000000b005f7d2dac697si1903512qvh.278.2023.05.10.03.30.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 May 2023 03:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=GWTGB82F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwh5c-0003XE-Pk; Wed, 10 May 2023 06:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pwh5b-0003Vr-Bn; Wed, 10 May 2023 06:30:31 -0400
Received: from m12.mail.163.com ([220.181.12.199])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pwh5X-00081f-41; Wed, 10 May 2023 06:30:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ssr3Y
 cMfBRQyrFgA16vA9luoUvtonw5w3L+xZwG8/4A=; b=GWTGB82FPdSDH85/5aFrz
 EGausojhTBEkwmGyE1flRlIPb7QabznVsgto8nQkgSCrjR6IkSg+gdSm8OOtbBW2
 q6LSs+9yg9tG2kT3k0o6juFugxBJMFiXqi7PPi1z95g5abQl8JgnWvqGweZGTPaf
 +44RmggrWS+AbVeGJVcqgE=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wBnkgAvcltk0WrrBQ--.23956S6;
 Wed, 10 May 2023 18:30:15 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v4 04/11] hw: arm: allwinner-r40: Add i2c0 device
Date: Wed, 10 May 2023 18:29:57 +0800
Message-Id: <20230510103004.30015-5-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510103004.30015-1-qianfanguijin@163.com>
References: <20230510103004.30015-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnkgAvcltk0WrrBQ--.23956S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4fXFW3JFWkCw13JFyDAwb_yoW5Zw43pF
 W5C398Gryjg3WrAFW8Kws3Zry8t348Grnrt3W0kFWxtF1jgF4v9r4Iqa1UGF45KFZ7Wa17
 XrZxtFW7W3W2qaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pReOJ8UUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRhr7VWBph7YxQAAsy
Received-SPF: pass client-ip=220.181.12.199;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: LJxvdkvuikqI

From: qianfan Zhao <qianfanguijin@163.com>

TWI(i2c) is designed to be used as an interface between CPU host and the
serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
operated in standard mode(100kbit/s) or fast-mode, supporting data rate
up to 400kbit/s.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c         | 11 ++++++++++-
 include/hw/arm/allwinner-r40.h |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 537a90b23d..4bc582630c 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -52,6 +52,7 @@ const hwaddr allwinner_r40_memmap[] = {
     [AW_R40_DEV_UART5]      = 0x01c29400,
     [AW_R40_DEV_UART6]      = 0x01c29800,
     [AW_R40_DEV_UART7]      = 0x01c29c00,
+    [AW_R40_DEV_TWI0]       = 0x01c2ac00,
     [AW_R40_DEV_GIC_DIST]   = 0x01c81000,
     [AW_R40_DEV_GIC_CPU]    = 0x01c82000,
     [AW_R40_DEV_GIC_HYP]    = 0x01c84000,
@@ -115,7 +116,6 @@ static struct AwR40Unimplemented r40_unimplemented[] = {
     { "uart7",      0x01c29c00, 1 * KiB },
     { "ps20",       0x01c2a000, 1 * KiB },
     { "ps21",       0x01c2a400, 1 * KiB },
-    { "twi0",       0x01c2ac00, 1 * KiB },
     { "twi1",       0x01c2b000, 1 * KiB },
     { "twi2",       0x01c2b400, 1 * KiB },
     { "twi3",       0x01c2b800, 1 * KiB },
@@ -167,6 +167,7 @@ enum {
     AW_R40_GIC_SPI_UART1     =  2,
     AW_R40_GIC_SPI_UART2     =  3,
     AW_R40_GIC_SPI_UART3     =  4,
+    AW_R40_GIC_SPI_TWI0      =  7,
     AW_R40_GIC_SPI_UART4     = 17,
     AW_R40_GIC_SPI_UART5     = 18,
     AW_R40_GIC_SPI_UART6     = 19,
@@ -270,6 +271,8 @@ static void allwinner_r40_init(Object *obj)
         object_initialize_child(obj, mmc_names[i], &s->mmc[i],
                                 TYPE_AW_SDHOST_SUN5I);
     }
+
+    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
 }
 
 static void allwinner_r40_realize(DeviceState *dev, Error **errp)
@@ -416,6 +419,12 @@ static void allwinner_r40_realize(DeviceState *dev, Error **errp)
                        115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
     }
 
+    /* I2C */
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0, s->memmap[AW_R40_DEV_TWI0]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_TWI0));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
         create_unimplemented_device(r40_unimplemented[i].device_name,
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index 959b5dc4e0..95366f4eee 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -26,6 +26,7 @@
 #include "hw/intc/arm_gic.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/misc/allwinner-r40-ccu.h"
+#include "hw/i2c/allwinner-i2c.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -48,6 +49,7 @@ enum {
     AW_R40_DEV_UART5,
     AW_R40_DEV_UART6,
     AW_R40_DEV_UART7,
+    AW_R40_DEV_TWI0,
     AW_R40_DEV_GIC_DIST,
     AW_R40_DEV_GIC_CPU,
     AW_R40_DEV_GIC_HYP,
@@ -89,6 +91,7 @@ struct AwR40State {
     AwA10PITState timer;
     AwSdHostState mmc[AW_R40_NUM_MMCS];
     AwR40ClockCtlState ccu;
+    AWI2CState i2c0;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
-- 
2.25.1

