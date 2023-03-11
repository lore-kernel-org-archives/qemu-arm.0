Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710426ejc;
        Sat, 11 Mar 2023 06:43:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+q+hlwogX+OFtRpg58hRwrc0s35pCnL8lbaXXKTcuaz1JdrWxFqCIyZd/C44DxGs+/DHxT
X-Received: by 2002:a05:622a:1899:b0:3bf:b240:3817 with SMTP id v25-20020a05622a189900b003bfb2403817mr50142007qtc.54.1678545790257;
        Sat, 11 Mar 2023 06:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678545790; cv=none;
        d=google.com; s=arc-20160816;
        b=WXPhuuRXaGqs57+CY+cONZpbcJoEFg+vuqmcZILNLwWe/lpJg6ms9b6gSrXNBzGh7T
         7zvJgF73XzU8geN+8ERzukXWOtfg2UESSnDaaZ01mrLQklN12IapiVjAEMpqbTkircKN
         2Zl8QT2d1rNa70EXY8aDzUi0euxJaCFZdhq734ENZmOEmJqawwICue5L2vmIVlJEvRgK
         YKU9mG3Oa6Rc2TwqcngdSAqs257zMu/8jf6ZeXlWMlymRTacW4vOa/3MJEEJLR7Cf/Im
         zdTzKwaenfmuJ2J/lkRPCw+GJAtGbxp+4zPkcGkjNteoNL+90t5Cy4JPxy5MGXkJmAt8
         wrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CqYVOJGk1mTWrBU5s8AzWglCDcLEpANLJ6Abrd3QC/s=;
        b=tyTZSVIfWvFr0Jg9z72i04ceUQZTPpTF4Q6f/5ZNUZ6TbdL5cMhn959+fgf/o5MBjN
         pB+/j20YfoIC/U8cwAj8J5DjVN3mY3pi5Rzy0Dxr+g3yBJgZUP+FY4Yct6ea6PdejLPA
         6jb8kx2wzujKSPdgRQPi8MNi+CSZe5bpAsJL1M8k9w6ci7uo41QWAFF6NLnyQVPrrSyO
         MHnmtq026P92bCaKciqz1Q3MJHl8qamHJaVRyup6Dbm73GW/PEMKrd+BXfnGGg/GIEwo
         TXLH7SnHetq2b2wUEF4LobG3goKznHIt6mTScMLg9gPjfs2WXROEXjMNZYkV6AQYpb10
         FfpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gAxIlR60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05622a14cd00b003bccff19a72si1912069qtx.486.2023.03.11.06.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Mar 2023 06:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=gAxIlR60;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pb0QE-00043L-GO; Sat, 11 Mar 2023 09:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0QD-00042r-Kl; Sat, 11 Mar 2023 09:42:09 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0QB-0002oG-UJ; Sat, 11 Mar 2023 09:42:09 -0500
Received: by mail-lf1-x136.google.com with SMTP id bi9so10345170lfb.2;
 Sat, 11 Mar 2023 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678545726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqYVOJGk1mTWrBU5s8AzWglCDcLEpANLJ6Abrd3QC/s=;
 b=gAxIlR60EXZsLTkCKchXNRt30nhJ/3YF5kTPrBlJrSWPrT1NMKkBnvS8c75haX6nqz
 /XkORN+44SGmTA+OCr6CVYpD7auwy40r/bxtgIHaVLD5bDKzPh/IsZeCP071W9eq3u9C
 0Ke7RffKBKvw7sHOt/J91A3CLjMOvXRZo6pT40mHBWW6a+W512IVTIOua5phsqIvpu2G
 ay5F1NdafNbnlLZ6V0oMKrBlmbDicyb6gpthiYiskE5lWoaMHMyg6mYi9nRUKfZgDalj
 cVowjbWo0Jhswan2n32pW9gxgaNqh7GeNBdaU/IxoRB5WBKoqTRcosZmo69fGuUOw/zb
 icEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678545726;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqYVOJGk1mTWrBU5s8AzWglCDcLEpANLJ6Abrd3QC/s=;
 b=dR02UBpba8luT0ztR2BuVCWPVcLjEszVRuvRSWUYGScSV7hHN93578tNpGSqm2FbE7
 aO6KDShSRaRyDBgDhoPKbapj+BSk4qpZw0Tz32bqqgbid6t5oVC0p38SR2JLbcnKDjGc
 /BTiCH0zUkCZE5RXWI9In5jeBFWbx3C5ER0m6zi+19rV6fVIZw6smb+1CswIHuL1Q5zc
 pFZjGMhMTCl75sD4JGc78b6J8deWk1r/BE3CqlJLyi0g0PMZJ1Scr+OcHkh69as4/Ld0
 cDcCcc1FOdhLR3LM1vPY6L0w7wNODLt/aH1NJw/79Y32/SVRLfZ5vZcrTZjbRdWHaWKn
 623g==
X-Gm-Message-State: AO0yUKWqAOOscBh3ycVzgfPXRj4ZmJZ8kRvJBj8WmxfLJUa+azF88sBa
 HnnV1v6+ZH/OAAdiIja4z7g=
X-Received: by 2002:a05:6512:390a:b0:4e8:3cf8:5d64 with SMTP id
 a10-20020a056512390a00b004e83cf85d64mr373129lfu.37.1678545725994; 
 Sat, 11 Mar 2023 06:42:05 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 g15-20020a19ee0f000000b004d887e0e9edsm333320lfb.168.2023.03.11.06.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 06:42:05 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 3/4] hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
Date: Sat, 11 Mar 2023 15:41:10 +0100
Message-Id: <20230311144111.30468-4-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
X-TUID: YZDz6P66kTRI

This patch adds WDT to Allwinner-H3 and Orangepi-PC.
WDT is added as an overlay to the Timer module memory area.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 docs/system/arm/orangepi.rst  | 1 +
 hw/arm/Kconfig                | 1 +
 hw/arm/allwinner-h3.c         | 8 ++++++++
 include/hw/arm/allwinner-h3.h | 5 ++++-
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index e5973600a1..9afa54213b 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -26,6 +26,7 @@ The Orange Pi PC machine supports the following devices:
  * System Control module
  * Security Identifier device
  * TWI (I2C)
+ * Watchdog timer
 
 Limitations
 """""""""""
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ec15248536..7d916f5450 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -337,6 +337,7 @@ config ALLWINNER_H3
     select ALLWINNER_A10_PIT
     select ALLWINNER_SUN8I_EMAC
     select ALLWINNER_I2C
+    select ALLWINNER_WDT
     select SERIAL
     select ARM_TIMER
     select ARM_GIC
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 69d0ad6f50..f05afddf7e 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -49,6 +49,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_DEV_OHCI3]      = 0x01c1d400,
     [AW_H3_DEV_CCU]        = 0x01c20000,
     [AW_H3_DEV_PIT]        = 0x01c20c00,
+    [AW_H3_DEV_WDT]        = 0x01c20ca0,
     [AW_H3_DEV_UART0]      = 0x01c28000,
     [AW_H3_DEV_UART1]      = 0x01c28400,
     [AW_H3_DEV_UART2]      = 0x01c28800,
@@ -234,6 +235,8 @@ static void allwinner_h3_init(Object *obj)
     object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
     object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
+
+    object_initialize_child(obj, "wdt", &s->wdt, TYPE_AW_WDT_SUN6I);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -453,6 +456,11 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
                        qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
 
+    /* WDT */
+    sysbus_realize(SYS_BUS_DEVICE(&s->wdt), &error_fatal);
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->wdt), 0,
+                            s->memmap[AW_H3_DEV_WDT], 1);
+
     /* Unimplemented devices */
     for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
         create_unimplemented_device(unimplemented[i].device_name,
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 59e0f822d2..f15d6d7cc7 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -48,6 +48,7 @@
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "hw/rtc/allwinner-rtc.h"
 #include "hw/i2c/allwinner-i2c.h"
+#include "hw/watchdog/allwinner-wdt.h"
 #include "target/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
@@ -96,7 +97,8 @@ enum {
     AW_H3_DEV_RTC,
     AW_H3_DEV_CPUCFG,
     AW_H3_DEV_R_TWI,
-    AW_H3_DEV_SDRAM
+    AW_H3_DEV_SDRAM,
+    AW_H3_DEV_WDT
 };
 
 /** Total number of CPU cores in the H3 SoC */
@@ -141,6 +143,7 @@ struct AwH3State {
     AWI2CState r_twi;
     AwSun8iEmacState emac;
     AwRtcState rtc;
+    AwWdtState wdt;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
-- 
2.30.2

