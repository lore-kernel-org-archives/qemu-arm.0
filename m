Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp729683njc;
        Wed, 12 Mar 2025 22:49:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUZOVN4+WJjVYQzGecfb/hYEbIEj1seqiiWUVikM9cBtK7AdZJPKS2CYbdwrzr5H9u5iZ3EmPxqzeaopA==@linaro.org
X-Google-Smtp-Source: AGHT+IENVumEeq0zWapSOpPty6Tx7rFMrur1HmD3bGfAckTZ8/NF2m8BvImhmzIQmM63HAjyPuq5
X-Received: by 2002:a05:622a:41cb:b0:476:6b20:2cea with SMTP id d75a77b69052e-4766b20410bmr248118251cf.39.1741844969347;
        Wed, 12 Mar 2025 22:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844969; cv=none;
        d=google.com; s=arc-20240605;
        b=SaOEXauhd1zwqs3mW9qz6kFmwf4Id36/dyKt3kxyQfU/jahXVZJizlaVvgSvlMXIW+
         rmv+ls9hSGZYCsIbdI6Fi/VzHZ1oSRIGxULxPVJHWk/lFwi5c5S6SBX2/XAUEYXdtBgX
         UprDukPnudjtlvbgUlqt0Iztb9FUZeTwkIC/MmgAmnnTYWdDMDb/vYHaFj9Fak0+z8qS
         GhDXh5AruYzSlxGpM1MC4yNV+eWYsat+KlFTb3oRkK/YrXE5/zPLb9wYZdsJV7v3GtKX
         YFI85toyPuVtav6Cl5fuRuznPB6dWbH3+X9Uivtq8pU406fv1sQMfhYYJLvFTzQKxEqB
         tSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=TY/Zaq5mTMTp4VXY7V2QnC0N0AtFIU+MYDTFNxJVxoU=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=Bv978o7emIEijODrBHRh7g39+iugO8SSZ02ecPRg9OS9aXlyaWKBdOVLEj9f+z7Orq
         u1IN1Y7tzqLicrs8Ye6XCj2+iS+oktAfqd+VSRZUPBEjG5B4EpR2rzn9Ak/v5ZkMhoyT
         MPuuCSyavqGK3SghrkNmabnhwDl2Ftw4bjbBOSb3OXsA1Q588AXujsnouQk3/XuQNRUC
         Z5LuboIXaNm76P7UGz/a/YE8mKJlayQqCNhCGZmauE9D9MnIpzUtwofdvvqJH3nX0hn0
         3tlHK/Ur7RlYna3xcPvxOPmUXpnsYndZoei6VUCM8hF9KrwyvjY3haCZdHY0FLSsMUu4
         DBjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb619c27si9025641cf.55.2025.03.12.22.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOo-0004zY-BB; Thu, 13 Mar 2025 01:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOI-0004pD-4g; Thu, 13 Mar 2025 01:46:02 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbOG-0005Ve-3n; Thu, 13 Mar 2025 01:45:57 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:22 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH 04/13] hw/intc/aspeed: Add support for AST2700 TSP INTC
Date: Thu, 13 Mar 2025 13:40:08 +0800
Message-ID: <20250313054020.2583556-5-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lhglSBA6w2CM

- Define new types for ast2700tsp INTC and INTCIO
- Add register definitions for TSP INTC and INTCIO
- Implement write handlers for TSP INTC and INTCIO
- Register new types in aspeed_intc_register_types

The design of the TSP INTC and INTCIO controllers is similar to
AST2700, with the following differences:

- AST2700
  Support GICINT128 to GICINT136 in INTC
  The INTCIO GIC_192_201 has 10 output pins, mapped as follows:
    Bit 0 -> GIC 192
    Bit 1 -> GIC 193
    Bit 2 -> GIC 194
    Bit 3 -> GIC 195
    Bit 4 -> GIC 196

- AST2700-tsp
  Support TSPINT128 to TSPINT136 in INTC
  The INTCIO TSPINT_160_169 has 10 output pins, mapped as follows:
    Bit 0 -> TSPINT 160
    Bit 1 -> TSPINT 161
    Bit 2 -> TSPINT 162
    Bit 3 -> TSPINT 163
    Bit 4 -> TSPINT 164

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: I9e71a8aac400c0cdbd5b78073d0ada79d12a1350
---
 include/hw/intc/aspeed_intc.h |   2 +
 hw/intc/aspeed_intc.c         | 213 ++++++++++++++++++++++++++++++++++
 2 files changed, 215 insertions(+)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 746f159bf3..51288384a5 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -17,6 +17,8 @@
 #define TYPE_ASPEED_2700_INTCIO TYPE_ASPEED_INTC "io-ast2700"
 #define TYPE_ASPEED_2700SSP_INTC TYPE_ASPEED_INTC "-ast2700ssp"
 #define TYPE_ASPEED_2700SSP_INTCIO TYPE_ASPEED_INTC "io-ast2700ssp"
+#define TYPE_ASPEED_2700TSP_INTC TYPE_ASPEED_INTC "-ast2700tsp"
+#define TYPE_ASPEED_2700TSP_INTCIO TYPE_ASPEED_INTC "io-ast2700tsp"
 
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index 1f8b4d4d36..9e3bee993f 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -106,6 +106,51 @@ REG32(SSPINT164_STATUS,     0x1C4)
 REG32(SSPINT165_EN,         0x1D0)
 REG32(SSPINT165_STATUS,     0x1D4)
 
+/*
+ * TSP INTC Registers
+ */
+REG32(TSPINT128_EN,             0x3000)
+REG32(TSPINT128_STATUS,         0x3004)
+REG32(TSPINT129_EN,             0x3100)
+REG32(TSPINT129_STATUS,         0x3104)
+REG32(TSPINT130_EN,             0x3200)
+REG32(TSPINT130_STATUS,         0x3204)
+REG32(TSPINT131_EN,             0x3300)
+REG32(TSPINT131_STATUS,         0x3304)
+REG32(TSPINT132_EN,             0x3400)
+REG32(TSPINT132_STATUS,         0x3404)
+REG32(TSPINT133_EN,             0x3500)
+REG32(TSPINT133_STATUS,         0x3504)
+REG32(TSPINT134_EN,             0x3600)
+REG32(TSPINT134_STATUS,         0x3604)
+REG32(TSPINT135_EN,             0x3700)
+REG32(TSPINT135_STATUS,         0x3704)
+REG32(TSPINT136_EN,             0x3800)
+REG32(TSPINT136_STATUS,         0x3804)
+REG32(TSPINT137_EN,             0x3900)
+REG32(TSPINT137_STATUS,         0x3904)
+REG32(TSPINT138_EN,             0x3A00)
+REG32(TSPINT138_STATUS,         0x3A04)
+REG32(TSPINT160_169_EN,         0x3B00)
+REG32(TSPINT160_169_STATUS,     0x3B04)
+
+/*
+ * TSP INTCIO Registers
+ */
+
+REG32(TSPINT160_EN,         0x200)
+REG32(TSPINT160_STATUS,     0x204)
+REG32(TSPINT161_EN,         0x210)
+REG32(TSPINT161_STATUS,     0x214)
+REG32(TSPINT162_EN,         0x220)
+REG32(TSPINT162_STATUS,     0x224)
+REG32(TSPINT163_EN,         0x230)
+REG32(TSPINT163_STATUS,     0x234)
+REG32(TSPINT164_EN,         0x240)
+REG32(TSPINT164_STATUS,     0x244)
+REG32(TSPINT165_EN,         0x250)
+REG32(TSPINT165_STATUS,     0x254)
+
 static const AspeedINTCIRQ *aspeed_intc_get_irq(AspeedINTCClass *aic,
                                                 uint32_t reg)
 {
@@ -540,6 +585,50 @@ static void aspeed_ssp_intc_write(void *opaque, hwaddr offset, uint64_t data,
     return;
 }
 
+static void aspeed_tsp_intc_write(void *opaque, hwaddr offset, uint64_t data,
+                                        unsigned size)
+{
+    AspeedINTCState *s = ASPEED_INTC(opaque);
+    const char *name = object_get_typename(OBJECT(s));
+    uint32_t reg = offset >> 2;
+
+    trace_aspeed_intc_write(name, offset, size, data);
+
+    switch (reg) {
+    case R_TSPINT128_EN:
+    case R_TSPINT129_EN:
+    case R_TSPINT130_EN:
+    case R_TSPINT131_EN:
+    case R_TSPINT132_EN:
+    case R_TSPINT133_EN:
+    case R_TSPINT134_EN:
+    case R_TSPINT135_EN:
+    case R_TSPINT136_EN:
+    case R_TSPINT160_169_EN:
+        aspeed_intc_enable_handler(s, offset, data);
+        break;
+    case R_TSPINT128_STATUS:
+    case R_TSPINT129_STATUS:
+    case R_TSPINT130_STATUS:
+    case R_TSPINT131_STATUS:
+    case R_TSPINT132_STATUS:
+    case R_TSPINT133_STATUS:
+    case R_TSPINT134_STATUS:
+    case R_TSPINT135_STATUS:
+    case R_TSPINT136_STATUS:
+        aspeed_intc_status_handler(s, offset, data);
+        break;
+    case R_TSPINT160_169_STATUS:
+        aspeed_intc_status_handler_multi_outpins(s, offset, data);
+        break;
+    default:
+        s->regs[reg] = data;
+        break;
+    }
+
+    return;
+}
+
 static uint64_t aspeed_intcio_read(void *opaque, hwaddr offset,
                                    unsigned int size)
 {
@@ -622,6 +711,40 @@ static void aspeed_ssp_intcio_write(void *opaque, hwaddr offset, uint64_t data,
     return;
 }
 
+static void aspeed_tsp_intcio_write(void *opaque, hwaddr offset, uint64_t data,
+                                unsigned size)
+{
+    AspeedINTCState *s = ASPEED_INTC(opaque);
+    const char *name = object_get_typename(OBJECT(s));
+    uint32_t reg = offset >> 2;
+
+    trace_aspeed_intc_write(name, offset, size, data);
+
+    switch (reg) {
+    case R_TSPINT160_EN:
+    case R_TSPINT161_EN:
+    case R_TSPINT162_EN:
+    case R_TSPINT163_EN:
+    case R_TSPINT164_EN:
+    case R_TSPINT165_EN:
+        aspeed_intc_enable_handler(s, offset, data);
+        break;
+    case R_TSPINT160_STATUS:
+    case R_TSPINT161_STATUS:
+    case R_TSPINT162_STATUS:
+    case R_TSPINT163_STATUS:
+    case R_TSPINT164_STATUS:
+    case R_TSPINT165_STATUS:
+        aspeed_intc_status_handler(s, offset, data);
+        break;
+    default:
+        s->regs[reg] = data;
+        break;
+    }
+
+    return;
+}
+
 static const MemoryRegionOps aspeed_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_intc_write,
@@ -662,6 +785,26 @@ static const MemoryRegionOps aspeed_ssp_intcio_ops = {
     }
 };
 
+static const MemoryRegionOps aspeed_tsp_intc_ops = {
+    .read = aspeed_intc_read,
+    .write = aspeed_tsp_intc_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    }
+};
+
+static const MemoryRegionOps aspeed_tsp_intcio_ops = {
+    .read = aspeed_intcio_read,
+    .write = aspeed_tsp_intcio_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    }
+};
+
 static void aspeed_intc_instance_init(Object *obj)
 {
     AspeedINTCState *s = ASPEED_INTC(obj);
@@ -887,6 +1030,74 @@ static const TypeInfo aspeed_2700ssp_intcio_info = {
     .class_init = aspeed_2700ssp_intcio_class_init,
 };
 
+static AspeedINTCIRQ aspeed_2700tsp_intc_irqs[ASPEED_INTC_MAX_INPINS] = {
+    {0, 0, 10, R_TSPINT160_169_EN, R_TSPINT160_169_STATUS},
+    {1, 10, 1, R_TSPINT128_EN, R_TSPINT128_STATUS},
+    {2, 11, 1, R_TSPINT129_EN, R_TSPINT129_STATUS},
+    {3, 12, 1, R_TSPINT130_EN, R_TSPINT130_STATUS},
+    {4, 13, 1, R_TSPINT131_EN, R_TSPINT131_STATUS},
+    {5, 14, 1, R_TSPINT132_EN, R_TSPINT132_STATUS},
+    {6, 15, 1, R_TSPINT133_EN, R_TSPINT133_STATUS},
+    {7, 16, 1, R_TSPINT134_EN, R_TSPINT134_STATUS},
+    {8, 17, 1, R_TSPINT135_EN, R_TSPINT135_STATUS},
+    {9, 18, 1, R_TSPINT136_EN, R_TSPINT136_STATUS},
+};
+
+static void aspeed_2700tsp_intc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 TSP INTC Controller";
+    aic->num_lines = 32;
+    aic->num_inpins = 10;
+    aic->num_outpins = 19;
+    aic->mem_size = 0x4000;
+    aic->nr_regs = 0x3B08 >> 2;
+    aic->reg_offset = 0;
+    aic->reg_ops = &aspeed_tsp_intc_ops;
+    aic->irq_table = aspeed_2700tsp_intc_irqs;
+    aic->irq_table_count = ARRAY_SIZE(aspeed_2700tsp_intc_irqs);
+}
+
+static const TypeInfo aspeed_2700tsp_intc_info = {
+    .name = TYPE_ASPEED_2700TSP_INTC,
+    .parent = TYPE_ASPEED_INTC,
+    .class_init = aspeed_2700tsp_intc_class_init,
+};
+
+static AspeedINTCIRQ aspeed_2700tsp_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
+    {0, 0, 1, R_TSPINT160_EN, R_TSPINT160_STATUS},
+    {1, 1, 1, R_TSPINT161_EN, R_TSPINT161_STATUS},
+    {2, 2, 1, R_TSPINT162_EN, R_TSPINT162_STATUS},
+    {3, 3, 1, R_TSPINT163_EN, R_TSPINT163_STATUS},
+    {4, 4, 1, R_TSPINT164_EN, R_TSPINT164_STATUS},
+    {5, 5, 1, R_TSPINT165_EN, R_TSPINT165_STATUS},
+};
+
+static void aspeed_2700tsp_intcio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 TSP INTC IO Controller";
+    aic->num_lines = 32;
+    aic->num_inpins = 6;
+    aic->num_outpins = 6;
+    aic->mem_size = 0x400;
+    aic->nr_regs = 0x258 >> 2;
+    aic->reg_offset = 0x0;
+    aic->reg_ops = &aspeed_tsp_intcio_ops;
+    aic->irq_table = aspeed_2700tsp_intcio_irqs;
+    aic->irq_table_count = ARRAY_SIZE(aspeed_2700tsp_intcio_irqs);
+}
+
+static const TypeInfo aspeed_2700tsp_intcio_info = {
+    .name = TYPE_ASPEED_2700TSP_INTCIO,
+    .parent = TYPE_ASPEED_INTC,
+    .class_init = aspeed_2700tsp_intcio_class_init,
+};
+
 static void aspeed_intc_register_types(void)
 {
     type_register_static(&aspeed_intc_info);
@@ -894,6 +1105,8 @@ static void aspeed_intc_register_types(void)
     type_register_static(&aspeed_2700_intcio_info);
     type_register_static(&aspeed_2700ssp_intc_info);
     type_register_static(&aspeed_2700ssp_intcio_info);
+    type_register_static(&aspeed_2700tsp_intc_info);
+    type_register_static(&aspeed_2700tsp_intcio_info);
 }
 
 type_init(aspeed_intc_register_types);
-- 
2.34.1

