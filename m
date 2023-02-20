Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2062376ejb;
        Mon, 20 Feb 2023 00:14:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+RZ42Xy6XPS7x/B2ebjixHOD2Hi1TOTw68ajFE/P3cU3Rn3q5xL9g7JfpNm4dhrhO7cHrv
X-Received: by 2002:a05:6214:301d:b0:537:7484:8d1c with SMTP id ke29-20020a056214301d00b0053774848d1cmr925282qvb.30.1676880846487;
        Mon, 20 Feb 2023 00:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676880846; cv=none;
        d=google.com; s=arc-20160816;
        b=cQmT0qpig9wIAvztLwEkt7T20XldAQjZ0B2Mymk36d1K59BmMwoGuyBzhhBkq6a9Ae
         2b/PLMDjgfCzzR1fydKxus8SEmJTToZsaODXC44QVoyCDBpylcxqCQmlbE0VWIUsNKG4
         0693cjIAjBObjH5BCWbUnfh7DieKW+biXCEpYF5EZDVzSJFAd7mIdxaE6d0S6YQLNpjk
         QTHQ5j5LR/7OUvX5az8mToHH0VriIhr3WHTrOXwPSLe8yX9fE5l8jglPNNoAQUnr4NuQ
         EqPA1U5nlZY39wqONf/QLai8ZK7A8+1Y2FO9iHB1HtOyq5m8V292h5dt3tS3KknnvqTS
         KZdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c0oaOKazxYJZtJyXvhbpUehZRKXiMqRZrek0/PzmKMg=;
        b=u4qGBbPJDHBfy0xyfCLPvwtUNkndjnYyoErpPUkxRGc4U6aWxMB6O4hfMQJaSjKubr
         II0dEkvkH8HfHhwKDOUUtZDU833xDJGeU3WVC8Y2Iy/l8UBbejcK5OVtNRSDjGPzGj7v
         SjeOLlZb2o20g9iOgn04W+GmnEHD4ypA4strSyBaj+h+R4jl41UGZ30ErHHJCJBNWqic
         Z9eKVeGXs1bRrVxM5Usdd9vueAyDd55jskdJZJzTfIA+paDC/NZRbW6ywZ177frXtv+T
         aarx1ofA1EmKtxM2KUoyzTFt0hZ9Mf3b6Kwf0pz9aUbgY19Xsi49pZEK3bNYTiSwcYd1
         X8wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=kyjvdRPu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t189-20020ae9dfc6000000b007333725598fsi8531488qkf.126.2023.02.20.00.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 00:14:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=kyjvdRPu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU1Il-0002lS-00; Mon, 20 Feb 2023 03:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pU1Ij-0002jp-8k; Mon, 20 Feb 2023 03:13:33 -0500
Received: from m12.mail.163.com ([220.181.12.215])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pU1Ig-0001Pw-7B; Mon, 20 Feb 2023 03:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=c0oaO
 KazxYJZtJyXvhbpUehZRKXiMqRZrek0/PzmKMg=; b=kyjvdRPugiZBcKiCDmXRo
 61NegRmOdO8XoCihyXU8mFHgykpbuj2DbP4zNTTrQBMENjep7DvndWpr3pp7VotX
 bvjlXBKbHqFPl/kyYAlZwvZnGHRrDx6z0eiqD7dDN0p4QmE+J8jiXPN82stjXC8L
 knMjBmtHcJMssSNILu13qM=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.20])
 by zwqz-smtp-mta-g2-4 (Coremail) with SMTP id _____wCnPYyDK_NjSU3yAQ--.59158S4;
 Mon, 20 Feb 2023 16:12:53 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v2 3/3] hw: arm: allwinner-h3: Fix and complete H3 i2c devices
Date: Mon, 20 Feb 2023 16:12:52 +0800
Message-Id: <20230220081252.25348-3-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220081252.25348-1-qianfanguijin@163.com>
References: <20230220081252.25348-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnPYyDK_NjSU3yAQ--.59158S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyDXw4ftrWkKryrWF1Utrb_yoWrtF1Upr
 WUCrs0gFWrW34xZr1vkwn3Zr1rta48Cr1DCa4SgFyfKr4jgw1qqw1Ivw4UCFy8XF4kuayY
 qryxKFW8G3WUtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_vtCUUUUUU=
X-Originating-IP: [218.201.129.20]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiGgUc7VaEEUbKEQAAsw
Received-SPF: pass client-ip=220.181.12.215;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zUfopPwYyFKC

From: qianfan Zhao <qianfanguijin@163.com>

Allwinner h3 has 4 twi(i2c) devices named twi0, twi1, twi2 and r_twi.
The registers are compatible with TYPE_AW_I2C_SUN6I, write 1 to clear
control register's INT_FLAG bit.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-h3.c         | 29 +++++++++++++++++++++++++----
 include/hw/arm/allwinner-h3.h |  6 ++++++
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index bfce3c8d92..69d0ad6f50 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -54,6 +54,8 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_UART2]      = 0x01c28800,
     [AW_H3_DEV_UART3]      = 0x01c28c00,
     [AW_H3_DEV_TWI0]       = 0x01c2ac00,
+    [AW_H3_DEV_TWI1]       = 0x01c2b000,
+    [AW_H3_DEV_TWI2]       = 0x01c2b400,
     [AW_H3_DEV_EMAC]       = 0x01c30000,
     [AW_H3_DEV_DRAMCOM]    = 0x01c62000,
     [AW_H3_DEV_DRAMCTL]    = 0x01c63000,
@@ -64,6 +66,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_GIC_VCPU]   = 0x01c86000,
     [AW_H3_DEV_RTC]        = 0x01f00000,
     [AW_H3_DEV_CPUCFG]     = 0x01f01c00,
+    [AW_H3_DEV_R_TWI]      = 0x01f02400,
     [AW_H3_DEV_SDRAM]      = 0x40000000
 };
 
@@ -107,8 +110,6 @@ struct AwH3Unimplemented {
     { "uart1",     0x01c28400, 1 * KiB },
     { "uart2",     0x01c28800, 1 * KiB },
     { "uart3",     0x01c28c00, 1 * KiB },
-    { "twi1",      0x01c2b000, 1 * KiB },
-    { "twi2",      0x01c2b400, 1 * KiB },
     { "scr",       0x01c2c400, 1 * KiB },
     { "gpu",       0x01c40000, 64 * KiB },
     { "hstmr",     0x01c60000, 4 * KiB },
@@ -123,7 +124,6 @@ struct AwH3Unimplemented {
     { "r_prcm",    0x01f01400, 1 * KiB },
     { "r_twd",     0x01f01800, 1 * KiB },
     { "r_cir-rx",  0x01f02000, 1 * KiB },
-    { "r_twi",     0x01f02400, 1 * KiB },
     { "r_uart",    0x01f02800, 1 * KiB },
     { "r_pio",     0x01f02c00, 1 * KiB },
     { "r_pwm",     0x01f03800, 1 * KiB },
@@ -151,8 +151,11 @@ enum {
     AW_H3_GIC_SPI_UART2     =  2,
     AW_H3_GIC_SPI_UART3     =  3,
     AW_H3_GIC_SPI_TWI0      =  6,
+    AW_H3_GIC_SPI_TWI1      =  7,
+    AW_H3_GIC_SPI_TWI2      =  8,
     AW_H3_GIC_SPI_TIMER0    = 18,
     AW_H3_GIC_SPI_TIMER1    = 19,
+    AW_H3_GIC_SPI_R_TWI     = 44,
     AW_H3_GIC_SPI_MMC0      = 60,
     AW_H3_GIC_SPI_EHCI0     = 72,
     AW_H3_GIC_SPI_OHCI0     = 73,
@@ -227,7 +230,10 @@ static void allwinner_h3_init(Object *obj)
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN6I);
 
-    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C);
+    object_initialize_child(obj, "twi0",  &s->i2c0,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
+    object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -432,6 +438,21 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI0));
 
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_H3_DEV_TWI1]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI1));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_H3_DEV_TWI2]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI2));
+
+    sysbus_realize(SYS_BUS_DEVICE(&s->r_twi), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->r_twi), 0, s->memmap[AW_H3_DEV_R_TWI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
+                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 1d7ce20589..59e0f822d2 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -84,6 +84,8 @@ enum {
     AW_H3_DEV_UART3,
     AW_H3_DEV_EMAC,
     AW_H3_DEV_TWI0,
+    AW_H3_DEV_TWI1,
+    AW_H3_DEV_TWI2,
     AW_H3_DEV_DRAMCOM,
     AW_H3_DEV_DRAMCTL,
     AW_H3_DEV_DRAMPHY,
@@ -93,6 +95,7 @@ enum {
     AW_H3_DEV_GIC_VCPU,
     AW_H3_DEV_RTC,
     AW_H3_DEV_CPUCFG,
+    AW_H3_DEV_R_TWI,
     AW_H3_DEV_SDRAM
 };
 
@@ -133,6 +136,9 @@ struct AwH3State {
     AwSidState sid;
     AwSdHostState mmc0;
     AWI2CState i2c0;
+    AWI2CState i2c1;
+    AWI2CState i2c2;
+    AWI2CState r_twi;
     AwSun8iEmacState emac;
     AwRtcState rtc;
     GICState gic;
-- 
2.25.1

