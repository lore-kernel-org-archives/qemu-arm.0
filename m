Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2503957njb;
        Mon, 3 Mar 2025 01:56:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWG1fI4WstXaOiaVLXuvzy+tE/nmezZ08Jfh/GJt2WZWXqpfVDSsfodpDEUPjKe8T7KLx0rUuyu+H38FQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEPl4oz+12mwkuhzVnE/QTAam3VU9JNrzGWOZIuKQRjIiN/edQxciVDpGRqwvMxrwL0JjiD
X-Received: by 2002:a05:6214:80b:b0:6e8:c713:321f with SMTP id 6a1803df08f44-6e8c7133844mr45898776d6.35.1740995817084;
        Mon, 03 Mar 2025 01:56:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740995817; cv=none;
        d=google.com; s=arc-20240605;
        b=TM0ayNoQvqFCF73t/zQahx88K4eOSZB9qOXFgBVfJ22CFEysBqwgoJAknBmyFLxPCJ
         gRtmhxOO21Pa/TxUxlwjcxLO8avy0xNS/DMZYbgocJwKsARjvEyhcBYc4p5M9lBBrnOF
         EPFFWNsxWSyqfU/bWFj2+JMIxhnk07WiIJ+rAf4sa3NRIkyvoUSBpdXJwDdAqZ0qAYVA
         XSEGK0LF8tHYwiOCmZvFO9QgT0094j6cuXu1fqADn//SVKDFBz5syxuEQd3z92wKL7EH
         Cw1hSx1AMkprfszQlw60oPqR+Y3pDHFGxSxjF3WLsQzcwi2zvft+++jt9q8l+iT+Yyfj
         oHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ETmwodSXyMnQMmgKxly8rdl7SqXBDRX16UBFYz831ao=;
        fh=08d/IJI4U+AnOjHRYBcV+/5HqY2oyeWSX1NtojG11zk=;
        b=k4mhIsCVbzFw4agBUvDuaWtU4Cf205ZHRGWTf/MUUVIWkNG6HeoijYTT5CusOXnEMo
         iBG3cTxGsSROQkhTHaNmkGfUm8MuKpBc6+EjwddA21OdNOtf8xSyoFE9R2qNol5u9LAa
         IMtvPq7cMTIx0Ug9vrwFw3poMDQjMUIlvrK7fOMkqLc+dhh/cKS0xuGggOG2h5VYKEdq
         ntvvvpChIidRAwxD1/iR4Mxx7FUfk64YjV5ZawQnne/87gXUYClzVlDzZo4G8uVrtx8r
         FX4tq0zntXcKJfI6+0+lg70VzxRfjipjrcyNC3ZvnuPYtjNIBKCOKfOHxzUfOrFZlNGs
         SRUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8975e743fsi84828386d6.7.2025.03.03.01.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 01:56:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp2XW-000118-NR; Mon, 03 Mar 2025 04:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2XO-0000al-JB; Mon, 03 Mar 2025 04:56:40 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tp2XJ-0001vN-G4; Mon, 03 Mar 2025 04:56:36 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 3 Mar
 2025 17:55:04 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 3 Mar 2025 17:55:04 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v4 18/23] hw/arm/aspeed_ast27x0: Support two levels of INTC
 controllers for AST2700 A1
Date: Mon, 3 Mar 2025 17:54:46 +0800
Message-ID: <20250303095457.2337631-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
References: <20250303095457.2337631-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uEGFCVMv5ND/

The design of INTC controllers has significantly changed in AST2700 A1.

There are a total of 480 interrupt sources in AST2700 A1. For interrupt numbers
from 0 to 127, they can route directly to PSP, SSP, and TSP. Due to the
limitation of interrupt numbers of processors, the interrupts are merged every
32 sources for interrupt numbers greater than 127.

There are two levels of interrupt controllers, INTC(CPUD Die) and INTCIO
(IO Die). The interrupt sources of INTC are the interrupt numbers from INTC_0 to
INTC_127 and interrupts from INTCIO. The interrupt sources of INTCIO are the
interrupt numbers greater than INTC_127. INTC_IO controls the interrupts
INTC_128 to INTC_319 only.

Currently, only GIC 192 to 201 are supported, and their source interrupts are
from INTCIO and connected to INTC at input pin 0 and output pins 0 to 9 for
GIC 192-201.

The design of the orgates for GICINT 196 is as follows:
It has interrupt sources ranging from 0 to 31, with its output pin connected to
INTCIO "T0 GICINT_196". The output pin is then connected to INTC "GIC_192_201"
at bit 4, and its bit 4 output should be connected to GIC 196.
The design of INTC GIC_192_201 have 10 output pins, mapped as following:
Bit 0 -> GIC 192
Bit 1 -> GIC 193
Bit 2 -> GIC 194
Bit 3 -> GIC 195
Bit 4 -> GIC 196

To support both AST2700 A1 and A0, INTC input pins 1 to 9 and output pins
10 to 18 remain to support GIC 128-136, which source interrupts from INTC.
These will be removed if we decide not to support AST2700 A0 in the future.

|-------------------------------------------------------------------------------------------------------|
|                                                   AST2700 A1 Design                                   |
|           To GICINT196                                                                                |
|                                                                                                       |
|   ETH1    |-----------|                    |--------------------------|        |--------------|       |
|  -------->|0          |                    |         INTCIO           |        |  orgates[0]  |       |
|   ETH2    |          4|   orgates[0]------>|inpin[0]-------->outpin[0]|------->| 0            |       |
|  -------->|1         5|   orgates[1]------>|inpin[1]-------->outpin[1]|------->| 1            |       |
|   ETH3    |          6|   orgates[2]------>|inpin[2]-------->outpin[2]|------->| 2            |       |
|  -------->|2        19|   orgates[3]------>|inpin[3]-------->outpin[3]|------->| 3  OR[0:9]   |-----| |
|   UART0   |         20|-->orgates[4]------>|inpin[4]-------->outpin[4]|------->| 4            |     | |
|  -------->|7        21|   orgates[5]------>|inpin[5]-------->outpin[5]|------->| 5            |     | |
|   UART1   |         22|   orgates[6]------>|inpin[6]-------->outpin[6]|------->| 6            |     | |
|  -------->|8        23|   orgates[7]------>|inpin[7]-------->outpin[7]|------->| 7            |     | |
|   UART2   |         24|   orgates[8]------>|inpin[8]-------->outpin[8]|------->| 8            |     | |
|  -------->|9        25|   orgates[9]------>|inpin[9]-------->outpin[9]|------->| 9            |     | |
|   UART3   |         26|                    |--------------------------|        |--------------|     | |
|  ---------|10       27|                                                                             | |
|   UART5   |         28|                                                                             | |
|  -------->|11       29|                                                                             | |
|   UART6   |           |                                                                             | |
|  -------->|12       30|     |-----------------------------------------------------------------------| |
|   UART7   |         31|     |                                                                         |
|  -------->|13         |     |                                                                         |
|   UART8   |  OR[0:31] |     |                |------------------------------|           |----------|  |
|  -------->|14         |     |                |            INTC              |           |     GIC  |  |
|   UART9   |           |     |                |inpin[0:0]--------->outpin[0] |---------->|192       |  |
|  -------->|15         |     |                |inpin[0:1]--------->outpin[1] |---------->|193       |  |
|   UART10  |           |     |                |inpin[0:2]--------->outpin[2] |---------->|194       |  |
|  -------->|16         |     |                |inpin[0:3]--------->outpin[3] |---------->|195       |  |
|   UART11  |           |     |--------------> |inpin[0:4]--------->outpin[4] |---------->|196       |  |
|  -------->|17         |                      |inpin[0:5]--------->outpin[5] |---------->|197       |  |
|   UART12  |           |                      |inpin[0:6]--------->outpin[6] |---------->|198       |  |
|  -------->|18         |                      |inpin[0:7]--------->outpin[7] |---------->|199       |  |
|           |-----------|                      |inpin[0:8]--------->outpin[8] |---------->|200       |  |
|                                              |inpin[0:9]--------->outpin[9] |---------->|201       |  |
|-------------------------------------------------------------------------------------------------------|
|-------------------------------------------------------------------------------------------------------|
|  ETH1    |-----------|     orgates[1]------->|inpin[1]----------->outpin[10]|---------->|128       |  |
| -------->|0          |     orgates[2]------->|inpin[2]----------->outpin[11]|---------->|129       |  |
|  ETH2    |          4|     orgates[3]------->|inpin[3]----------->outpin[12]|---------->|130       |  |
| -------->|1         5|     orgates[4]------->|inpin[4]----------->outpin[13]|---------->|131       |  |
|  ETH3    |          6|---->orgates[5]------->|inpin[5]----------->outpin[14]|---------->|132       |  |
| -------->|2        19|     orgates[6]------->|inpin[6]----------->outpin[15]|---------->|133       |  |
|  UART0   |         20|     orgates[7]------->|inpin[7]----------->outpin[16]|---------->|134       |  |
| -------->|7        21|     orgates[8]------->|inpin[8]----------->outpin[17]|---------->|135       |  |
|  UART1   |         22|     orgates[9]------->|inpin[9]----------->outpin[18]|---------->|136       |  |
| -------->|8        23|                       |------------------------------|           |----------|  |
|  UART2   |         24|                                                                                |
| -------->|9        25|                       AST2700 A0 Design                                        |
|  UART3   |         26|                                                                                |
| -------->|10       27|                                                                                |
|  UART5   |         28|                                                                                |
| -------->|11       29| GICINT132                                                                      |
|  UART6   |           |                                                                                |
| -------->|12       30|                                                                                |
|  UART7   |         31|                                                                                |
| -------->|13         |                                                                                |
|  UART8   |  OR[0:31] |                                                                                |
| -------->|14         |                                                                                |
|  UART9   |           |                                                                                |
| -------->|15         |                                                                                |
|  UART10  |           |                                                                                |
| -------->|16         |                                                                                |
|  UART11  |           |                                                                                |
| -------->|17         |                                                                                |
|  UART12  |           |                                                                                |
| -------->|18         |                                                                                |
|          |-----------|                                                                                |
|                                                                                                       |
|-------------------------------------------------------------------------------------------------------|

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/arm/aspeed_soc.h |  3 +-
 hw/arm/aspeed_ast27x0.c     | 84 ++++++++++++++++++++++++++++---------
 2 files changed, 66 insertions(+), 21 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 689f52dae8..62f75c33dc 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -128,7 +128,7 @@ struct Aspeed27x0SoCState {
     AspeedSoCState parent;
 
     ARMCPU cpu[ASPEED_CPUS_NUM];
-    AspeedINTCState intc;
+    AspeedINTCState intc[2];
     GICv3State gic;
     MemoryRegion dram_empty;
 };
@@ -195,6 +195,7 @@ enum {
     ASPEED_DEV_EHCI2,
     ASPEED_DEV_VIC,
     ASPEED_DEV_INTC,
+    ASPEED_DEV_INTCIO,
     ASPEED_DEV_SDMC,
     ASPEED_DEV_SCU,
     ASPEED_DEV_ADC,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index eab9674b6c..028bf08d0e 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -57,6 +57,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ETH3]      =  0x14070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
     [ASPEED_DEV_INTC]      =  0x12100000,
+    [ASPEED_DEV_INTCIO]    =  0x14C18000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
     [ASPEED_GIC_DIST]      =  0x12200000,
@@ -178,32 +179,48 @@ static const int ast2700_gic133_gic197_intcmap[] = {
 /* GICINT 192 ~ 201 */
 struct gic_intc_irq_info {
     int irq;
+    int intc_idx;
+    int orgate_idx;
     const int *ptr;
 };
 
 static const struct gic_intc_irq_info ast2700_gic_intcmap[] = {
-    {128,  ast2700_gic128_gic192_intcmap},
-    {129,  NULL},
-    {130,  ast2700_gic130_gic194_intcmap},
-    {131,  ast2700_gic131_gic195_intcmap},
-    {132,  ast2700_gic132_gic196_intcmap},
-    {133,  ast2700_gic133_gic197_intcmap},
-    {134,  NULL},
-    {135,  NULL},
-    {136,  NULL},
+    {192, 1, 0, ast2700_gic128_gic192_intcmap},
+    {193, 1, 1, NULL},
+    {194, 1, 2, ast2700_gic130_gic194_intcmap},
+    {195, 1, 3, ast2700_gic131_gic195_intcmap},
+    {196, 1, 4, ast2700_gic132_gic196_intcmap},
+    {197, 1, 5, ast2700_gic133_gic197_intcmap},
+    {198, 1, 6, NULL},
+    {199, 1, 7, NULL},
+    {200, 1, 8, NULL},
+    {201, 1, 9, NULL},
+    {128, 0, 1, ast2700_gic128_gic192_intcmap},
+    {129, 0, 2, NULL},
+    {130, 0, 3, ast2700_gic130_gic194_intcmap},
+    {131, 0, 4, ast2700_gic131_gic195_intcmap},
+    {132, 0, 5, ast2700_gic132_gic196_intcmap},
+    {133, 0, 6, ast2700_gic133_gic197_intcmap},
+    {134, 0, 7, NULL},
+    {135, 0, 8, NULL},
+    {136, 0, 9, NULL},
 };
 
 static qemu_irq aspeed_soc_ast2700_get_irq(AspeedSoCState *s, int dev)
 {
     Aspeed27x0SoCState *a = ASPEED27X0_SOC(s);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int or_idx;
+    int idx;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(ast2700_gic_intcmap); i++) {
         if (sc->irqmap[dev] == ast2700_gic_intcmap[i].irq) {
             assert(ast2700_gic_intcmap[i].ptr);
-            return qdev_get_gpio_in(DEVICE(&a->intc.orgates[i]),
-                ast2700_gic_intcmap[i].ptr[dev]);
+            or_idx = ast2700_gic_intcmap[i].orgate_idx;
+            idx = ast2700_gic_intcmap[i].intc_idx;
+            return qdev_get_gpio_in(DEVICE(&a->intc[idx].orgates[or_idx]),
+                                    ast2700_gic_intcmap[i].ptr[dev]);
         }
     }
 
@@ -215,12 +232,16 @@ static qemu_irq aspeed_soc_ast2700_get_irq_index(AspeedSoCState *s, int dev,
 {
     Aspeed27x0SoCState *a = ASPEED27X0_SOC(s);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int or_idx;
+    int idx;
     int i;
 
     for (i = 0; i < ARRAY_SIZE(ast2700_gic_intcmap); i++) {
         if (sc->irqmap[dev] == ast2700_gic_intcmap[i].irq) {
             assert(ast2700_gic_intcmap[i].ptr);
-            return qdev_get_gpio_in(DEVICE(&a->intc.orgates[i]),
+            or_idx = ast2700_gic_intcmap[i].orgate_idx;
+            idx = ast2700_gic_intcmap[i].intc_idx;
+            return qdev_get_gpio_in(DEVICE(&a->intc[idx].orgates[or_idx]),
                                     ast2700_gic_intcmap[i].ptr[dev] + index);
         }
     }
@@ -390,7 +411,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
     object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
-    object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC);
+    object_initialize_child(obj, "intc", &a->intc[0], TYPE_ASPEED_2700_INTC);
+    object_initialize_child(obj, "intcio", &a->intc[1],
+                            TYPE_ASPEED_2700_INTCIO);
 
     snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
     object_initialize_child(obj, "adc", &s->adc, typename);
@@ -532,27 +555,48 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     }
 
     /* INTC */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intc), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intc[0]), errp)) {
         return;
     }
 
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc), 0,
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc[0]), 0,
                     sc->memmap[ASPEED_DEV_INTC]);
 
+    /* INTCIO */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&a->intc[1]), errp)) {
+        return;
+    }
+
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->intc[1]), 0,
+                    sc->memmap[ASPEED_DEV_INTCIO]);
+
     /* irq sources -> orgates -> INTC */
-    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc)->num_inpins; i++) {
-        qdev_connect_gpio_out(DEVICE(&a->intc.orgates[i]), 0,
-                              qdev_get_gpio_in(DEVICE(&a->intc), i));
+    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc[0])->num_inpins; i++) {
+        qdev_connect_gpio_out(DEVICE(&a->intc[0].orgates[i]), 0,
+                              qdev_get_gpio_in(DEVICE(&a->intc[0]), i));
     }
 
     /* INTC -> GIC192 - GIC201 */
     /* INTC -> GIC128 - GIC136 */
-    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc)->num_outpins; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc), i,
+    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc[0])->num_outpins; i++) {
+        assert(i < ARRAY_SIZE(ast2700_gic_intcmap));
+        sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc[0]), i,
                            qdev_get_gpio_in(DEVICE(&a->gic),
                                             ast2700_gic_intcmap[i].irq));
     }
 
+    /* irq source -> orgates -> INTCIO */
+    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc[1])->num_inpins; i++) {
+        qdev_connect_gpio_out(DEVICE(&a->intc[1].orgates[i]), 0,
+                              qdev_get_gpio_in(DEVICE(&a->intc[1]), i));
+    }
+
+    /* INTCIO -> INTC */
+    for (i = 0; i < ASPEED_INTC_GET_CLASS(&a->intc[1])->num_outpins; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(&a->intc[1]), i,
+                           qdev_get_gpio_in(DEVICE(&a->intc[0].orgates[0]), i));
+    }
+
     /* SRAM */
     sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
     if (!memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size,
-- 
2.34.1

