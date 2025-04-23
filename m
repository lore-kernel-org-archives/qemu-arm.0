Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2774126njd;
        Tue, 22 Apr 2025 19:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMYyo1KqKMj4uynD/weLrS5PxDt5Vl+9E37fNgbN1gHy66zumMTRChAX1xSHf7dWkDATMmI5aA+c6xpg==@linaro.org
X-Google-Smtp-Source: AGHT+IFhczJJTc2dRurSLhZpZae63yFuYHYTFySqD5Uz3Iux5IpvWMw4WUAE6hRrARbd6ejr5HBm
X-Received: by 2002:a05:620a:2415:b0:7c5:5cc4:ca5b with SMTP id af79cd13be357-7c927f63372mr2776730585a.12.1745377078236;
        Tue, 22 Apr 2025 19:57:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745377078; cv=none;
        d=google.com; s=arc-20240605;
        b=eharVAW7u5DULx4cRkjd/B10T/xZokPC0Jy/ULwJbpi+4kXO7CiszKzPa+2ZrwKg0u
         GHQ9af4PEzvxA/d1J+c5SGHe7iQM0kszq9bGxUW95XHAIefGCy1bv/+5Dz3erh8YOsac
         aLOddf+n+Ldw8GS9vVT15UBvgbH81D4O9YoRGP4bZlwgo16oXoxu2RvhixWVYvbrsSWp
         oFrLHWRQ6HnYzu2+MUDaRg3ueCDg1TznWXJtREjI1ad8caHEX4sQxmBQnk2SSWfy1Eeb
         veuXHDFKWIqkdPyNBFMDDFvbF71la7Uq0/R9skHkoveNHBtBGMekPkF+onwZKuXeDIRA
         ++sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=bUjj155XiSLYxlUcyB10Xn0j4Ei6lEwpy/78j8RI4OU=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=gaCFS9mgjwTpEUr+k1mLpG8BAP9HQuHVDqWpNwh2aWUqyXxhWV/01BGvYkrWjtrMIn
         s3K2Hnt1x9e1J11ejCno4GtreCs1Mrp1OEsX1jH4wwC6FLEiSis+IPfh2WyKI+n1hmv3
         AeZgDEcsPagcaG6xXkjsaUojSf3r5rh7djKsWB5OxJheRjNqr82Ubcmq9apCU+wER3u+
         a3BkbhtdjJzJjnbJAsxOAWjLqHDZQk6pEl0Bfxqr4ym/1OREsdvH3wLZdz437SglNyHV
         STbZJsU0tySsL7M9EbNV+TFWM0F+LC9oII+uCV+OyRCbWeRzVWMyNCttOgX+N1GQTLQn
         JP3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f2c2beb46fsi123638966d6.168.2025.04.22.19.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Apr 2025 19:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7QIb-0007Gm-3v; Tue, 22 Apr 2025 22:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIV-0007Dd-CT; Tue, 22 Apr 2025 22:57:15 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1u7QIT-00043I-9V; Tue, 22 Apr 2025 22:57:15 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 23 Apr
 2025 10:56:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 23 Apr 2025 10:56:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v3 3/3] hw/arm: Integrate Aspeed OTP memory into AST10x0 and
 AST2600 SoCs
Date: Wed, 23 Apr 2025 10:56:51 +0800
Message-ID: <20250423025651.189702-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423025651.189702-1-kane_chen@aspeedtech.com>
References: <20250423025651.189702-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 24lnLGmH6TdJ

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

This patch wires up the OTP memory device (`aspeed.otpmem`) into the
AST1030 and AST2600 SoC models. The device is initialized, attached
to a backing block drive (`-drive id=otpmem`) and linked to the SBC
controller via a QOM link.

The default OTP memory image can be generated using the following
command.
```bash
for i in $(seq 1 2048); do
  printf '\x00\x00\x00\x00\xff\xff\xff\xff'
done > otpmem.img
```

To load the OTP memory image into the guest, use:
```bash
./qemu-system-arm \
  -drive id=otpmem,file=otpmem.img,if=none,format=raw \
  ...
```

Note: Do not use the -snapshot option, or OTP data writes will not
persist to the image file.

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/arm/aspeed_ast10x0.c     | 19 +++++++++++++++++++
 hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 3 files changed, 40 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index ec329f4991..eaa70feb9f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -15,6 +15,7 @@
 #include "system/system.h"
 #include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
+#include "system/block-backend-global-state.h"
 #include "hw/arm/aspeed_soc.h"
 
 #define ASPEED_SOC_IOMEM_SIZE 0x00200000
@@ -156,6 +157,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
 
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
 
+    object_initialize_child(obj, "otpmem", &s->otpmem, TYPE_ASPEED_OTPMEM);
+
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
@@ -194,6 +197,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
     Error *err = NULL;
     int i;
     g_autofree char *sram_name = NULL;
+    BlockBackend *blk;
 
     if (!clock_has_source(s->sysclk)) {
         error_setg(errp, "sysclk clock must be wired up by the board code");
@@ -359,6 +363,21 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
+    /* OTP memory */
+    blk = blk_by_name(ASPEED_OTPMEM_DRIVE);
+    if (blk) {
+        blk_set_perm(blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                     0, &error_fatal);
+        qdev_prop_set_drive(DEVICE(&s->otpmem), "drive", blk);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->otpmem), errp)) {
+            return;
+        }
+        /* Assign OTP memory to SBC */
+        object_property_set_link(OBJECT(&s->sbc), "otpmem",
+                                 OBJECT(&s->otpmem), &error_abort);
+    }
+
     /* Secure Boot Controller */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 1f994ba26c..9fe3eeeb0e 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/misc/unimp.h"
+#include "system/block-backend-global-state.h"
 #include "hw/arm/aspeed_soc.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
@@ -263,6 +264,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
 
+    object_initialize_child(obj, "otpmem", &s->otpmem, TYPE_ASPEED_OTPMEM);
+
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
@@ -293,6 +296,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     qemu_irq irq;
     g_autofree char *sram_name = NULL;
+    BlockBackend *blk;
 
     /* Default boot region (SPI memory or ROMs) */
     memory_region_init(&s->spi_boot_container, OBJECT(s),
@@ -628,6 +632,21 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
     }
 
+    /* OTP memory */
+    blk = blk_by_name(ASPEED_OTPMEM_DRIVE);
+    if (blk) {
+        blk_set_perm(blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                     0, &error_fatal);
+        qdev_prop_set_drive(DEVICE(&s->otpmem), "drive", blk);
+
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->otpmem), errp)) {
+            return;
+        }
+        /* Assign OTP memory to SBC */
+        object_property_set_link(OBJECT(&s->sbc), "otpmem",
+                                 OBJECT(&s->otpmem), &error_abort);
+    }
+
     /* Secure Boot Controller */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->sbc), errp)) {
         return;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f069d17d16..2d15c6047a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -36,6 +36,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "qom/object.h"
 #include "hw/misc/aspeed_lpc.h"
+#include "hw/misc/aspeed_otpmem.h"
 #include "hw/misc/unimp.h"
 #include "hw/misc/aspeed_peci.h"
 #include "hw/fsi/aspeed_apb2opb.h"
@@ -73,6 +74,7 @@ struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     EHCISysBusState ehci[ASPEED_EHCIS_NUM];
     AspeedSBCState sbc;
+    AspeedOTPMemState otpmem;
     AspeedSLIState sli;
     AspeedSLIState sliio;
     MemoryRegion secsram;
-- 
2.43.0

