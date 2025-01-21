Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp6494699njn;
        Mon, 20 Jan 2025 23:06:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/Xo5Ux0E4VbUDwBmsjdK3BLgVDOcp4+n0DyDwnvqRZR2iP+xpokeOdxYyvYzuUi7hpvgpxPoUrm4XbA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5Cmf7eATRNwpmHIRfGTKumef7tdaf1CDas+9Ypu2Cj2+kwlag63i91nKAZnQTa+W0UyHj
X-Received: by 2002:a05:6214:29e2:b0:6d8:af37:ae5b with SMTP id 6a1803df08f44-6e1b224cc01mr249605336d6.43.1737443183902;
        Mon, 20 Jan 2025 23:06:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737443183; cv=none;
        d=google.com; s=arc-20240605;
        b=gnrs+m1524/i4CsalRLvDbzhm8zrzoTR+lcbjcwG8V5KqGM7YjxVC8NJ1sGVrIx7/I
         1GpJ0Yk6P+5M78nHOJwQrSlrmq0yjrAPAm6+iDN57xoftJWkvh5VME80G5y1w6DS7QlD
         iobyaLlYokMk7XX5mQU695Jxm/vhuwEjZFk7PFSD2Hb7fLDusCjBcm0mzhnkjxUC3ygE
         pesLVpXzm7kLPAWYmz2Kt9wPrS2MlDDpNdUvC3v+0ffOL06hdc2OysTJkgsXB+m3n6sO
         R6HNoBmvZw+xU8ww7uGMzc/PKc4FBGz7P+5uR+KHF2RrNWybv3C7D0kyKBIT3NqlTJBk
         dbqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dOiXdbmkCB//UvpReh+yLKTlPIVY675MdTNVl8e94CY=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=Gay/bd6jrRMv3JzvMiAkdZwTaIa8yLcz4XYyXmt9bcJlFzylGhf424zZsHzOzGnvSP
         VA++ddgOwRwTMSfZbnJJV6hh8eyWPzGLjCKFJGbkAk0TaW6RUy9G2XNIfyQFspX2Yrrt
         /8/2t40Y1Mx+vi4VtvSpzM1v/Ns/Sfv65HYGDsYJgr3U15YZAEZx2sfTA4KiVUJwua7J
         WnGCJGgVNEKbxtm23JuKqfj6WN/Y/YOZCyJP2rCTQyZTp/w4zk3ewz6dm6tllwHocJ0D
         btzdDlaaPmznpmMWJxIE4kh+dXTEBIoZNMrvy0wOJhRPaUH9sa1/iunS7YrwB6K/A6Mo
         uBQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e1afc1af57si121449686d6.146.2025.01.20.23.06.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2025 23:06:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ta8JY-0006en-Ga; Tue, 21 Jan 2025 02:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8JV-0006eB-KJ; Tue, 21 Jan 2025 02:04:41 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ta8JT-0001Q8-Pr; Tue, 21 Jan 2025 02:04:41 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 21 Jan
 2025 15:04:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 21 Jan 2025 15:04:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 01/18] hw/intc/aspeed: Rename INTC to INTC0
Date: Tue, 21 Jan 2025 15:04:07 +0800
Message-ID: <20250121070424.2465942-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
References: <20250121070424.2465942-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2pZTZ0PdR/qU

The design of the INTC has significant changes in the AST2700 A1. In the
AST2700 A0, there was one INTC controller, whereas in the AST2700 A1,
there were two INTC controllers: INTC0 (CPU DIE) and INTC1 (I/O DIE).

The previous INTC model only supported the AST2700 A0 and was implemented for
the INTC0 (CPU DIE). To support the future INTC1 (I/O DIE) model, rename INTC
to INTC0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c       |  6 +--
 hw/intc/aspeed_intc.c         | 90 +++++++++++++++++------------------
 include/hw/arm/aspeed_soc.h   |  2 +-
 include/hw/intc/aspeed_intc.h |  2 +-
 4 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 4114e15ddd..ba461fcd3c 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -56,7 +56,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ETH2]      =  0x14060000,
     [ASPEED_DEV_ETH3]      =  0x14070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
-    [ASPEED_DEV_INTC]      =  0x12100000,
+    [ASPEED_DEV_INTC0]     =  0x12100000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
     [ASPEED_GIC_DIST]      =  0x12200000,
@@ -372,7 +372,7 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
     object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
-    object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC);
+    object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC0);
 
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
@@ -517,7 +517,7 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     }
 
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc), 0,
-                    sc->memmap[ASPEED_DEV_INTC]);
+                    sc->memmap[ASPEED_DEV_INTC0]);
 
     /* GICINT orgates -> INTC -> GIC */
     for (i = 0; i < ic->num_ints; i++) {
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 126b711b94..df4da759e1 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -14,27 +14,27 @@
 #include "hw/registerfields.h"
 #include "qapi/error.h"
 
-/* INTC Registers */
-REG32(GICINT128_EN,         0x1000)
-REG32(GICINT128_STATUS,     0x1004)
-REG32(GICINT129_EN,         0x1100)
-REG32(GICINT129_STATUS,     0x1104)
-REG32(GICINT130_EN,         0x1200)
-REG32(GICINT130_STATUS,     0x1204)
-REG32(GICINT131_EN,         0x1300)
-REG32(GICINT131_STATUS,     0x1304)
-REG32(GICINT132_EN,         0x1400)
-REG32(GICINT132_STATUS,     0x1404)
-REG32(GICINT133_EN,         0x1500)
-REG32(GICINT133_STATUS,     0x1504)
-REG32(GICINT134_EN,         0x1600)
-REG32(GICINT134_STATUS,     0x1604)
-REG32(GICINT135_EN,         0x1700)
-REG32(GICINT135_STATUS,     0x1704)
-REG32(GICINT136_EN,         0x1800)
-REG32(GICINT136_STATUS,     0x1804)
-
-#define GICINT_STATUS_BASE     R_GICINT128_STATUS
+/* AST2700 INTC0 Registers */
+REG32(INTC0_GICINT128_EN,         0x1000)
+REG32(INTC0_GICINT128_STATUS,     0x1004)
+REG32(INTC0_GICINT129_EN,         0x1100)
+REG32(INTC0_GICINT129_STATUS,     0x1104)
+REG32(INTC0_GICINT130_EN,         0x1200)
+REG32(INTC0_GICINT130_STATUS,     0x1204)
+REG32(INTC0_GICINT131_EN,         0x1300)
+REG32(INTC0_GICINT131_STATUS,     0x1304)
+REG32(INTC0_GICINT132_EN,         0x1400)
+REG32(INTC0_GICINT132_STATUS,     0x1404)
+REG32(INTC0_GICINT133_EN,         0x1500)
+REG32(INTC0_GICINT133_STATUS,     0x1504)
+REG32(INTC0_GICINT134_EN,         0x1600)
+REG32(INTC0_GICINT134_STATUS,     0x1604)
+REG32(INTC0_GICINT135_EN,         0x1700)
+REG32(INTC0_GICINT135_STATUS,     0x1704)
+REG32(INTC0_GICINT136_EN,         0x1800)
+REG32(INTC0_GICINT136_STATUS,     0x1804)
+
+#define GICINT_STATUS_BASE     R_INTC0_GICINT128_STATUS
 
 static void aspeed_intc_update(AspeedINTCState *s, int irq, int level)
 {
@@ -153,15 +153,15 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     trace_aspeed_intc_write(offset, size, data);
 
     switch (addr) {
-    case R_GICINT128_EN:
-    case R_GICINT129_EN:
-    case R_GICINT130_EN:
-    case R_GICINT131_EN:
-    case R_GICINT132_EN:
-    case R_GICINT133_EN:
-    case R_GICINT134_EN:
-    case R_GICINT135_EN:
-    case R_GICINT136_EN:
+    case R_INTC0_GICINT128_EN:
+    case R_INTC0_GICINT129_EN:
+    case R_INTC0_GICINT130_EN:
+    case R_INTC0_GICINT131_EN:
+    case R_INTC0_GICINT132_EN:
+    case R_INTC0_GICINT133_EN:
+    case R_INTC0_GICINT134_EN:
+    case R_INTC0_GICINT135_EN:
+    case R_INTC0_GICINT136_EN:
         irq = (offset & 0x0f00) >> 8;
 
         if (irq >= aic->num_ints) {
@@ -202,15 +202,15 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
         }
         s->regs[addr] = data;
         break;
-    case R_GICINT128_STATUS:
-    case R_GICINT129_STATUS:
-    case R_GICINT130_STATUS:
-    case R_GICINT131_STATUS:
-    case R_GICINT132_STATUS:
-    case R_GICINT133_STATUS:
-    case R_GICINT134_STATUS:
-    case R_GICINT135_STATUS:
-    case R_GICINT136_STATUS:
+    case R_INTC0_GICINT128_STATUS:
+    case R_INTC0_GICINT129_STATUS:
+    case R_INTC0_GICINT130_STATUS:
+    case R_INTC0_GICINT131_STATUS:
+    case R_INTC0_GICINT132_STATUS:
+    case R_INTC0_GICINT133_STATUS:
+    case R_INTC0_GICINT134_STATUS:
+    case R_INTC0_GICINT135_STATUS:
+    case R_INTC0_GICINT136_STATUS:
         irq = (offset & 0x0f00) >> 8;
 
         if (irq >= aic->num_ints) {
@@ -336,26 +336,26 @@ static const TypeInfo aspeed_intc_info = {
     .abstract = true,
 };
 
-static void aspeed_2700_intc_class_init(ObjectClass *klass, void *data)
+static void aspeed_2700_intc0_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
 
-    dc->desc = "ASPEED 2700 INTC Controller";
+    dc->desc = "ASPEED 2700 INTC 0 Controller";
     aic->num_lines = 32;
     aic->num_ints = 9;
 }
 
-static const TypeInfo aspeed_2700_intc_info = {
-    .name = TYPE_ASPEED_2700_INTC,
+static const TypeInfo aspeed_2700_intc0_info = {
+    .name = TYPE_ASPEED_2700_INTC0,
     .parent = TYPE_ASPEED_INTC,
-    .class_init = aspeed_2700_intc_class_init,
+    .class_init = aspeed_2700_intc0_class_init,
 };
 
 static void aspeed_intc_register_types(void)
 {
     type_register_static(&aspeed_intc_info);
-    type_register_static(&aspeed_2700_intc_info);
+    type_register_static(&aspeed_2700_intc0_info);
 }
 
 type_init(aspeed_intc_register_types);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 689f52dae8..51e585e3e4 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -194,7 +194,7 @@ enum {
     ASPEED_DEV_EHCI1,
     ASPEED_DEV_EHCI2,
     ASPEED_DEV_VIC,
-    ASPEED_DEV_INTC,
+    ASPEED_DEV_INTC0,
     ASPEED_DEV_SDMC,
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 18cb43476c..10718ed4a1 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -13,7 +13,7 @@
 #include "hw/or-irq.h"
 
 #define TYPE_ASPEED_INTC "aspeed.intc"
-#define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
+#define TYPE_ASPEED_2700_INTC0 TYPE_ASPEED_INTC "0" "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
 #define ASPEED_INTC_NR_REGS (0x2000 >> 2)
-- 
2.34.1

