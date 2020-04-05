Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2550021lfi;
        Sat, 4 Apr 2020 21:46:06 -0700 (PDT)
X-Google-Smtp-Source: APiQypIrLE9WAoq1bv2kopORIsSX+O5utTRK5sV877JAc6gwZIMf+UKXUbaLAWOwf0n46w4ATnmn
X-Received: by 2002:ac8:7b26:: with SMTP id l6mr15543679qtu.64.1586061965884;
        Sat, 04 Apr 2020 21:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586061965; cv=none;
        d=google.com; s=arc-20160816;
        b=PUpqNyvouyGv+cbP5hkP712Rleo0GFnh0SpvnsXwTOCttnUQGW2inkEsTRnZ0M2/9b
         HgCboNXCt/8C3C2eFpojtnmRe+qc+ikyhiOqNct7pMh3ReWimZCe16yrpbEG7apGIswh
         5zaXESUOLTdtttc7lpcDg+C/wL7ZYhdechMW9SSbcwWJ9aOHO95JJKbylpbHXcH+t/dr
         3MbIBKZYx9fuwJYffMh4RNnUOmX+Xj46s/nA7w/xN1rla281OhCarn97Z5GnWhL/YypD
         LNsjgpakNKQhxZUgQ1hp4DoRPgRbKF6xoTEUQ5baNZZf/PV3zRZPvYvttKUnK0xCO+aB
         /hHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=mnUjiO3eFVb5IikUPCFhl5zRRKuczfWeD8BaNcdN8Sw=;
        b=yKgnSG+mF2GuKoQSxABW2j7InVGyMBIsHpj0gnC3RWretF4DFFVod6DSs2Z/hwbd6K
         usPl1uRXtJOCbjqjuhxPyeDuLCgQn1bGViT76U7QoZeoxbezVzGUmWi8erYVlWVn16oo
         Z/f98XKOKIEK+WJZx8O47TGi6tXMBsFDhGwP/xFUdwJJpCjdIEpvmreVcZFbBqrlUuxc
         A2UQlDUj+/5RcLviIw1IVhblYWTlsbzLpNEbFxxC1xk97NGTQ9lnVMdJ6zvYT+gsCxmq
         nMmaaLCiqafVe5walhHqnr5KCEFDukq329ohcP0y0aF1lAQcYGYPM71Y/ybCKYU7Jw8Q
         I6XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ghmcgk9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si7819350qvb.90.2020.04.04.21.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 21:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ghmcgk9m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKxAa-00048K-5M
	for alex.bennee@linaro.org; Sun, 05 Apr 2020 00:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxAO-00044W-Ki
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 00:45:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sundeep.lkml@gmail.com>) id 1jKxAN-0000At-7r
 for qemu-arm@nongnu.org; Sun, 05 Apr 2020 00:45:52 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:38016)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
 id 1jKxAK-00009Y-Mo; Sun, 05 Apr 2020 00:45:48 -0400
Received: by mail-pj1-x1043.google.com with SMTP id m15so4961286pje.3;
 Sat, 04 Apr 2020 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mnUjiO3eFVb5IikUPCFhl5zRRKuczfWeD8BaNcdN8Sw=;
 b=Ghmcgk9mQDPBW/T526f8yJ12BAJbokWGcsYuG7uzUoIdxGkzjj5l6DzP4qahAT//GX
 YsewuxMs/newdBRlhpzjN4JIWfQc4HDUdug/uJoGnKq7B4ZUtWroeI83+AdrP07mVd2p
 0TgJ5ssmsr50IqGJsplTg1Uo+ha0dRcadujMzhvWYWG+433RPHlwTLjMDejouhiBeViS
 D6AfNUVr6eA+3IWcrje5k+v9wNqNgDSbRc8lxWJgYKmtyQMj6vIizJZY29zwqGoZUKw2
 Bu2XAlSHlXWZex7c53/C+SreexIL3h6TTmCesRfhCk2uIprOXG3sVQA4YTK/NxGaXEEn
 QN0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mnUjiO3eFVb5IikUPCFhl5zRRKuczfWeD8BaNcdN8Sw=;
 b=C9GKhdLMCA54wK85xoz+mMrkujFIO2B3vEw/mLMlcY9FTcE/IiGXirvuedMez47XFD
 nQl625JaCsbVlqOhtrOZEoQnAxQqWFAaIP6SEQgISf0n7snOPwk8TDeP1XY/YxbxEI5o
 P319ZOWBRal2seMYFetE8X0bfJv10KtYlfazkQFwQGun/UXL8OBJ34Ke15MsFekPXkC4
 qBShsy46jlAvUibFg2KsTznhH1SU/ZnrYo+ATA84zsYHStOjvpkPHuoXoxRbx6ZDRxcF
 gPP0zUUoiLolLvjlh9B0AeY1qbN7F0OFZKa28ZGnBAbBu0XxZ3efpzGiwB17ktrukNtm
 ZmlA==
X-Gm-Message-State: AGi0Puan4twHiAAmW6BWBw2opAkX7jcJYwwtQW/Vt3YML8prNLTQ9qYI
 PN9G00aHW7gOHwM+cwvjP/z61fK6
X-Received: by 2002:a17:902:9a45:: with SMTP id
 x5mr13904313plv.296.1586061947801; 
 Sat, 04 Apr 2020 21:45:47 -0700 (PDT)
Received: from hyd1358.marvell.com ([115.113.156.2])
 by smtp.googlemail.com with ESMTPSA id x25sm8164778pgc.63.2020.04.04.21.45.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 04 Apr 2020 21:45:47 -0700 (PDT)
From: sundeep.lkml@gmail.com
To: jasowang@redhat.com, peter.maydell@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [Qemu-devel PATCH 2/2] msf2: Add EMAC block to SmartFusion2 SoC
Date: Sun,  5 Apr 2020 10:15:31 +0530
Message-Id: <1586061931-12600-3-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586061931-12600-1-git-send-email-sundeep.lkml@gmail.com>
References: <1586061931-12600-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Subbaraya Sundeep <sbhatta@marvell.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mbKXUaMoBAZY

From: Subbaraya Sundeep <sbhatta@marvell.com>

With SmartFusion2 Ethernet MAC model in
place this patch adds the same to SoC.

Signed-off-by: Subbaraya Sundeep <sbhatta@marvell.com>
---
 hw/arm/msf2-soc.c         | 21 ++++++++++++++++++++-
 include/hw/arm/msf2-soc.h |  3 +++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 588d643..2f2db6d 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -35,6 +35,7 @@
 
 #define MSF2_TIMER_BASE       0x40004000
 #define MSF2_SYSREG_BASE      0x40038000
+#define MSF2_EMAC_BASE        0x40041000
 
 #define ENVM_BASE_ADDRESS     0x60000000
 
@@ -55,6 +56,7 @@ static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
 static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
 static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
 static const int timer_irq[MSF2_NUM_TIMERS] = { 14, 15 };
+static const int emac_irq[MSF2_NUM_EMACS] = { 12 };
 
 static void do_sys_reset(void *opaque, int n, int level)
 {
@@ -81,6 +83,13 @@ static void m2sxxx_soc_initfn(Object *obj)
         sysbus_init_child_obj(obj, "spi[*]", &s->spi[i], sizeof(s->spi[i]),
                           TYPE_MSS_SPI);
     }
+
+    sysbus_init_child_obj(obj, "eth", &s->emac, sizeof(s->emac),
+                          TYPE_MSS_EMAC);
+    if (nd_table[0].used) {
+        qemu_check_nic_model(&nd_table[0], TYPE_MSS_EMAC);
+        qdev_set_nic_properties(DEVICE(&s->emac), &nd_table[0]);
+    }
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -192,6 +201,17 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         g_free(bus_name);
     }
 
+    dev = DEVICE(&s->emac);
+    object_property_set_bool(OBJECT(&s->emac), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_EMAC_BASE);
+    sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(armv7m, emac_irq[0]));
+
     /* Below devices are not modelled yet. */
     create_unimplemented_device("i2c_0", 0x40002000, 0x1000);
     create_unimplemented_device("dma", 0x40003000, 0x1000);
@@ -202,7 +222,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     create_unimplemented_device("can", 0x40015000, 0x1000);
     create_unimplemented_device("rtc", 0x40017000, 0x1000);
     create_unimplemented_device("apb_config", 0x40020000, 0x10000);
-    create_unimplemented_device("emac", 0x40041000, 0x1000);
     create_unimplemented_device("usb", 0x40043000, 0x1000);
 }
 
diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 3cfe5c7..296ed03 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -29,12 +29,14 @@
 #include "hw/timer/mss-timer.h"
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
+#include "hw/net/msf2-emac.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
 #define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
 
 #define MSF2_NUM_SPIS         2
 #define MSF2_NUM_UARTS        2
+#define MSF2_NUM_EMACS        1
 
 /*
  * System timer consists of two programmable 32-bit
@@ -62,6 +64,7 @@ typedef struct MSF2State {
     MSF2SysregState sysreg;
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
+    MSF2EmacState emac;
 } MSF2State;
 
 #endif
-- 
2.7.4

