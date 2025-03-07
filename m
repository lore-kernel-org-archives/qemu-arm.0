Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1940105njm;
        Thu, 6 Mar 2025 20:06:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2zasELB7OUr0LIWx52M1+sTyUltX+1mORTjScbXN1inpeqR7u56iNrkg9g00/8IG2BB9JmYNk1qB9RA==@linaro.org
X-Google-Smtp-Source: AGHT+IF5JW0inopZmOnIoQHOWMDmIsUWg/W8/A8Ivs/OpFpfyIiTBIBYkDlFZxHy8ywU30PrOvDs
X-Received: by 2002:a05:622a:1819:b0:467:6b6b:fc1 with SMTP id d75a77b69052e-475bb8c5e63mr30601281cf.16.1741320402155;
        Thu, 06 Mar 2025 20:06:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741320402; cv=none;
        d=google.com; s=arc-20240605;
        b=UindLXzQA0WpqpFczicqQh83FFQMt7RY28ImyZqjRBmZ/VTwvENqZNT9WMQ/k/1QyR
         P9OTFV4vNnVN/wak82QLxC77C/N9G9L/lUfh7VCTtrkVnAbEtOsU+w8hzose3pQ3aLn5
         PCxHaz8AhIbtHLTpk7bUZUQOTPQ260N/ZEE5TbP8v8wAGi4wCfJrDvkDnDotmIhdV1dM
         EwL5VnDK8pvivCYs1BT8yed6mFLmNLGp26NcS7iu9WhhlXVS+qw3Rv0TaE0SJwSZ2uZ/
         eakBm+WL5tMcY1CpWehLVAxJt0aS805J7/Y84KwPPwk4agwGBYrxTf3HvqAlLniPbohk
         zAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=hjrDVLChr52KO7D4oVI90dAAw3yb5uChcGaQWLgffVI=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=L5OKPWVPG/wuVx7U+GK1rSctv4QbtqoXciZl9HdB7j4Kb70Fc1nsaB9TUyxufWjrSY
         x6ExfbdsBDm5z1ieT7TBJ/MYvUsIaEYt/lOzzY4XtdM81zQWHt3LORjUofR8l3Ie8IwF
         27wZhUFpI8DwiWPtAw9AD9Vrw1f3b/5QzEHAEoIQ36T5L2le2UZmMtUAidFXZIUJe2lm
         DJ4KY7JDSexQ5Fcrvu9c3/fl3iQZCorcF6gNFheVfCFgZeTvcUcssPdxef5P7QOnS1gD
         kqxf2HvSp0GgAVBOErRh/Z0QchIbsZhGy6FboSRzJmhYJnAge9E6i8FkW5pbo6A4jSk/
         6XEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751daf8cc1si25384621cf.288.2025.03.06.20.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 20:06:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqOtj-0001BR-MD; Thu, 06 Mar 2025 23:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOtc-0000s7-JC; Thu, 06 Mar 2025 23:01:14 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tqOta-00050B-It; Thu, 06 Mar 2025 23:01:12 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 7 Mar
 2025 11:59:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 7 Mar 2025 11:59:52 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v6 17/29] hw/intc/aspeed: Add Support for AST2700 INTCIO
 Controller
Date: Fri, 7 Mar 2025 11:59:26 +0800
Message-ID: <20250307035945.3698802-18-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
References: <20250307035945.3698802-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 1PQk+cOel52y

Introduce a new ast2700 INTCIO class to support AST2700 INTCIO.
Added new register definitions for INTCIO, including enable and status
registers for IRQs GICINT192 through GICINT197.
Created a dedicated IRQ array for INTCIO, supporting six input pins and six
output pins, aligning with the newly defined registers.
Implemented "aspeed_intcio_read" and "aspeed_intcio_write" to handle
INTCIO-specific register access.

 To GICINT196                                                                                |

       ETH1    |-----------|                    |--------------------------|
      -------->|0          |                    |         INTCIO           |
       ETH2    |          4|   orgates[0]------>|inpin[0]-------->outpin[0]|
      -------->|1         5|   orgates[1]------>|inpin[1]-------->outpin[1]|
       ETH3    |          6|   orgates[2]------>|inpin[2]-------->outpin[2]|
      -------->|2        19|   orgates[3]------>|inpin[3]-------->outpin[3]|
       UART0   |         20|-->orgates[4]------>|inpin[4]-------->outpin[4]|
      -------->|7        21|   orgates[5]------>|inpin[5]-------->outpin[5]|
       UART1   |         22|                    |--------------------------|
      -------->|8        23|
       UART2   |         24|
      -------->|9        25|
       UART3   |         26|
      ---------|10       27|
       UART5   |         28|
      -------->|11       29|
       UART6   |           |
      -------->|12       30|
       UART7   |         31|
      -------->|13         |
       UART8   |  OR[0:31] |
      -------->|14         |
       UART9   |           |
      -------->|15         |
       UART10  |           |
      -------->|16         |
       UART11  |           |
      -------->|17         |
       UART12  |           |
      -------->|18         |
               |-----------|

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/intc/aspeed_intc.h |   1 +
 hw/intc/aspeed_intc.c         | 112 ++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/include/hw/intc/aspeed_intc.h b/include/hw/intc/aspeed_intc.h
index 85df8c6be9..3727ba24be 100644
--- a/include/hw/intc/aspeed_intc.h
+++ b/include/hw/intc/aspeed_intc.h
@@ -14,6 +14,7 @@
 
 #define TYPE_ASPEED_INTC "aspeed.intc"
 #define TYPE_ASPEED_2700_INTC TYPE_ASPEED_INTC "-ast2700"
+#define TYPE_ASPEED_2700_INTCIO TYPE_ASPEED_INTC "io-ast2700"
 OBJECT_DECLARE_TYPE(AspeedINTCState, AspeedINTCClass, ASPEED_INTC)
 
 #define ASPEED_INTC_MAX_INPINS 10
diff --git a/hw/intc/aspeed_intc.c b/hw/intc/aspeed_intc.c
index f2ca9237ea..3fd417084f 100644
--- a/hw/intc/aspeed_intc.c
+++ b/hw/intc/aspeed_intc.c
@@ -42,6 +42,26 @@ REG32(GICINT136_STATUS,     0x804)
 REG32(GICINT192_201_EN,         0xB00)
 REG32(GICINT192_201_STATUS,     0xB04)
 
+/*
+ * INTCIO Registers
+ *
+ * values below are offset by - 0x100 from datasheet
+ * because its memory region is start at 0x100
+ *
+ */
+REG32(GICINT192_EN,         0x00)
+REG32(GICINT192_STATUS,     0x04)
+REG32(GICINT193_EN,         0x10)
+REG32(GICINT193_STATUS,     0x14)
+REG32(GICINT194_EN,         0x20)
+REG32(GICINT194_STATUS,     0x24)
+REG32(GICINT195_EN,         0x30)
+REG32(GICINT195_STATUS,     0x34)
+REG32(GICINT196_EN,         0x40)
+REG32(GICINT196_STATUS,     0x44)
+REG32(GICINT197_EN,         0x50)
+REG32(GICINT197_STATUS,     0x54)
+
 static const AspeedINTCIRQ *aspeed_intc_get_irq(AspeedINTCClass *aic,
                                                 uint32_t reg)
 {
@@ -432,6 +452,55 @@ static void aspeed_intc_write(void *opaque, hwaddr offset, uint64_t data,
     return;
 }
 
+static uint64_t aspeed_intcio_read(void *opaque, hwaddr offset,
+                                   unsigned int size)
+{
+    AspeedINTCState *s = ASPEED_INTC(opaque);
+    const char *name = object_get_typename(OBJECT(s));
+    uint32_t reg = offset >> 2;
+    uint32_t value = 0;
+
+    value = s->regs[reg];
+    trace_aspeed_intc_read(name, offset, size, value);
+
+    return value;
+}
+
+static void aspeed_intcio_write(void *opaque, hwaddr offset, uint64_t data,
+                                unsigned size)
+{
+    AspeedINTCState *s = ASPEED_INTC(opaque);
+    const char *name = object_get_typename(OBJECT(s));
+    uint32_t reg = offset >> 2;
+
+    trace_aspeed_intc_write(name, offset, size, data);
+
+    switch (reg) {
+    case R_GICINT192_EN:
+    case R_GICINT193_EN:
+    case R_GICINT194_EN:
+    case R_GICINT195_EN:
+    case R_GICINT196_EN:
+    case R_GICINT197_EN:
+        aspeed_intc_enable_handler(s, offset, data);
+        break;
+    case R_GICINT192_STATUS:
+    case R_GICINT193_STATUS:
+    case R_GICINT194_STATUS:
+    case R_GICINT195_STATUS:
+    case R_GICINT196_STATUS:
+    case R_GICINT197_STATUS:
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
+
 static const MemoryRegionOps aspeed_intc_ops = {
     .read = aspeed_intc_read,
     .write = aspeed_intc_write,
@@ -442,6 +511,16 @@ static const MemoryRegionOps aspeed_intc_ops = {
     }
 };
 
+static const MemoryRegionOps aspeed_intcio_ops = {
+    .read = aspeed_intcio_read,
+    .write = aspeed_intcio_write,
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
@@ -567,10 +646,43 @@ static const TypeInfo aspeed_2700_intc_info = {
     .class_init = aspeed_2700_intc_class_init,
 };
 
+static AspeedINTCIRQ aspeed_2700_intcio_irqs[ASPEED_INTC_MAX_INPINS] = {
+    {0, 0, 1, R_GICINT192_EN, R_GICINT192_STATUS},
+    {1, 1, 1, R_GICINT193_EN, R_GICINT193_STATUS},
+    {2, 2, 1, R_GICINT194_EN, R_GICINT194_STATUS},
+    {3, 3, 1, R_GICINT195_EN, R_GICINT195_STATUS},
+    {4, 4, 1, R_GICINT196_EN, R_GICINT196_STATUS},
+    {5, 5, 1, R_GICINT197_EN, R_GICINT197_STATUS},
+};
+
+static void aspeed_2700_intcio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedINTCClass *aic = ASPEED_INTC_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 INTC IO Controller";
+    aic->num_lines = 32;
+    aic->num_inpins = 6;
+    aic->num_outpins = 6;
+    aic->mem_size = 0x400;
+    aic->nr_regs = 0x58 >> 2;
+    aic->reg_offset = 0x100;
+    aic->reg_ops = &aspeed_intcio_ops;
+    aic->irq_table = aspeed_2700_intcio_irqs;
+    aic->irq_table_count = ARRAY_SIZE(aspeed_2700_intcio_irqs);
+}
+
+static const TypeInfo aspeed_2700_intcio_info = {
+    .name = TYPE_ASPEED_2700_INTCIO,
+    .parent = TYPE_ASPEED_INTC,
+    .class_init = aspeed_2700_intcio_class_init,
+};
+
 static void aspeed_intc_register_types(void)
 {
     type_register_static(&aspeed_intc_info);
     type_register_static(&aspeed_2700_intc_info);
+    type_register_static(&aspeed_2700_intcio_info);
 }
 
 type_init(aspeed_intc_register_types);
-- 
2.43.0

