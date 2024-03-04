Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2470563eja;
        Mon, 4 Mar 2024 01:13:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCViCHKUWzriwWCVD39t0+Q2bwNHdUUbhztv75ac1IWqMlOy8cyNHHCrTTITjKY33qEwUIL+SLUXOhlxUKYqSs9N1Ph8+p7B
X-Google-Smtp-Source: AGHT+IHr1HN6TC8UzSSDHgdBCg+dgY5f97pmew4FEqJ3j3SDPivOUR+lncms54pB4EzjhzXHk2Xt
X-Received: by 2002:a25:69c4:0:b0:dcc:b719:4e4f with SMTP id e187-20020a2569c4000000b00dccb7194e4fmr5723262ybc.53.1709543634738;
        Mon, 04 Mar 2024 01:13:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709543634; cv=none;
        d=google.com; s=arc-20160816;
        b=IIkYrUZHJobZl1uHkNbkcBV1/SDvmOTV0tdrlyu5y7RvEI8rhEGzIUOR3xDGVDr/7N
         pSukLQVMh2YbfShxQA6fF7SInyugvsxHHjWJ+Ldaynd1a81sO8e4XJYPBjW4XC0W9/dT
         oFg3zP5Xd8vdMSSaR3WuInXj2AivSaMOiV3E4+2cK0sQGhL5DFygclFf6uQdBE12FT6f
         ucffNLqo3XjFiq4pObgZrixTMSu4FzY0gfEpNigAj9a+vIzn7sIe2j+OJRmZr5ZPSHMb
         cCvuWLdBlMk/OyuA5hK8dul61I8Hmwg9HnPDI/z50bmsesAa+V1CpaRmO6PVbzFahFgK
         l5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=veBlh2C90/Irw4XFal3N0j8E/CjV8zoHdGEvLL1EdQY=;
        fh=MGNs5MsPfS8GULtQe2qMcYQbAiZJSQuMQcVfuHK1z7k=;
        b=UHtjZeFWte0a0XoBZralVnBFfI6Pe5Vfcxf0VISjI/OJVLgkHvesqZZF3T/LhRJt/D
         ig0qL6A8IQ5K9DYG39srTTjeA9/aXoZRaTuVc3STXd08hZypPuHCWb3abhvBt32o2V/j
         YAOaPqyMJr4pvz18P4RZnQuOSR6MMSrKEvhgmFXfKFljGrFIs2tHkrVGjxhRQ02Wg6fL
         TZTz2Flf2bvCh2IavZibst7k9eofmz1ERF0kr/578F/p0Qjx/Le/fgAHW+41jnKqTbwN
         /xEheGoIyC78Ejj9LEInF/K9E/UdWRWdXpUzODmq6lWfSnLec+OKB16bKPKo6tfcNEd1
         VSnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bb40-20020a05622a1b2800b0042edea07354si4209741qtb.490.2024.03.04.01.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 01:13:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh4ND-0007LW-OE; Mon, 04 Mar 2024 04:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4NA-0007L5-TP; Mon, 04 Mar 2024 04:12:36 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX02.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1rh4N8-0003Bk-Lk; Mon, 04 Mar 2024 04:12:36 -0500
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Mar
 2024 17:12:24 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Mar 2024 17:12:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 2/9] aspeed/sli: Add AST2700 support
Date: Mon, 4 Mar 2024 17:12:14 +0800
Message-ID: <20240304091221.1855398-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
References: <20240304091221.1855398-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX02.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4HyKnvSo1CSD

AST2700 SLI engine is designed to accelerate the
throughput between cross-die connections.
It have CPU_SLI at CPU die and IO_SLI at IO die.

Introduce new ast2700_sli and ast2700_sliio class
with instance_init and realize handlers.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_sli.c         | 179 +++++++++++++++++++++++++++++++++++
 hw/misc/meson.build          |   3 +-
 hw/misc/trace-events         |   7 ++
 include/hw/misc/aspeed_sli.h |  32 +++++++
 4 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_sli.c
 create mode 100644 include/hw/misc/aspeed_sli.h

diff --git a/hw/misc/aspeed_sli.c b/hw/misc/aspeed_sli.c
new file mode 100644
index 0000000000..4af42f145c
--- /dev/null
+++ b/hw/misc/aspeed_sli.c
@@ -0,0 +1,179 @@
+/*
+ * ASPEED SLI Controller
+ *
+ * Copyright (C) 2024 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "hw/qdev-properties.h"
+#include "hw/misc/aspeed_sli.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+#define SLI_REGION_SIZE 0x500
+#define TO_REG(addr) ((addr) >> 2)
+
+static uint64_t aspeed_sli_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    AspeedSLIState *s = ASPEED_SLI(opaque);
+    int reg = TO_REG(addr);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    trace_aspeed_sli_read(addr, size, s->regs[reg]);
+    return s->regs[reg];
+}
+
+static void aspeed_sli_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned int size)
+{
+    AspeedSLIState *s = ASPEED_SLI(opaque);
+    int reg = TO_REG(addr);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    trace_aspeed_sli_write(addr, size, data);
+    s->regs[reg] = data;
+}
+
+static uint64_t aspeed_sliio_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    AspeedSLIState *s = ASPEED_SLI(opaque);
+    int reg = TO_REG(addr);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    trace_aspeed_sliio_read(addr, size, s->regs[reg]);
+    return s->regs[reg];
+}
+
+static void aspeed_sliio_write(void *opaque, hwaddr addr, uint64_t data,
+                              unsigned int size)
+{
+    AspeedSLIState *s = ASPEED_SLI(opaque);
+    int reg = TO_REG(addr);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, addr);
+        return;
+    }
+
+    trace_aspeed_sliio_write(addr, size, data);
+    s->regs[reg] = data;
+}
+
+static const MemoryRegionOps aspeed_sli_ops = {
+    .read = aspeed_sli_read,
+    .write = aspeed_sli_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static const MemoryRegionOps aspeed_sliio_ops = {
+    .read = aspeed_sliio_read,
+    .write = aspeed_sliio_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
+};
+
+static void aspeed_sli_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSLIState *s = ASPEED_SLI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sli_ops, s,
+                          TYPE_ASPEED_SLI, SLI_REGION_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_sliio_realize(DeviceState *dev, Error **errp)
+{
+    AspeedSLIState *s = ASPEED_SLI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sliio_ops, s,
+                          TYPE_ASPEED_SLI, SLI_REGION_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_sli_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Aspeed SLI Controller";
+    dc->realize = aspeed_sli_realize;
+}
+
+static const TypeInfo aspeed_sli_info = {
+    .name          = TYPE_ASPEED_SLI,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedSLIState),
+    .class_init    = aspeed_sli_class_init,
+    .class_size    = sizeof(AspeedSLIClass),
+    .abstract      = true,
+};
+
+static void aspeed_2700_sli_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "AST2700 SLI Controller";
+}
+
+static void aspeed_2700_sliio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "AST2700 I/O SLI Controller";
+    dc->realize = aspeed_sliio_realize;
+}
+
+static const TypeInfo aspeed_2700_sli_info = {
+    .name           = TYPE_ASPEED_2700_SLI,
+    .parent         = TYPE_ASPEED_SLI,
+    .class_init     = aspeed_2700_sli_class_init,
+};
+
+static const TypeInfo aspeed_2700_sliio_info = {
+    .name           = TYPE_ASPEED_2700_SLIIO,
+    .parent         = TYPE_ASPEED_SLI,
+    .class_init     = aspeed_2700_sliio_class_init,
+};
+
+static void aspeed_sli_register_types(void)
+{
+    type_register_static(&aspeed_sli_info);
+    type_register_static(&aspeed_2700_sli_info);
+    type_register_static(&aspeed_2700_sliio_info);
+}
+
+type_init(aspeed_sli_register_types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 746686835b..790f05525a 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -137,7 +137,8 @@ system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
-  'aspeed_peci.c'))
+  'aspeed_peci.c',
+  'aspeed_sli.c'))
 
 system_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 system_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5f5bc92222..07010a7ea6 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -341,3 +341,10 @@ djmemc_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRI
 # iosb.c
 iosb_read(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
 iosb_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
+
+# aspeed_sli.c
+aspeed_sli_write(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_sli_read(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_sliio_write(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_sliio_read(uint64_t offset, unsigned int size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+
diff --git a/include/hw/misc/aspeed_sli.h b/include/hw/misc/aspeed_sli.h
new file mode 100644
index 0000000000..15892950e2
--- /dev/null
+++ b/include/hw/misc/aspeed_sli.h
@@ -0,0 +1,32 @@
+/*
+ * ASPEED SLI Controller
+ *
+ * Copyright (C) 2024 ASPEED Technology Inc.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_SLI_H
+#define ASPEED_SLI_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SLI "aspeed.sli"
+#define TYPE_ASPEED_2700_SLI TYPE_ASPEED_SLI "-ast2700"
+#define TYPE_ASPEED_2700_SLIIO TYPE_ASPEED_SLI "io" "-ast2700"
+OBJECT_DECLARE_TYPE(AspeedSLIState, AspeedSLIClass, ASPEED_SLI)
+
+#define ASPEED_SLI_NR_REGS  (0x500 >> 2)
+
+struct AspeedSLIState {
+    SysBusDevice parent;
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SLI_NR_REGS];
+};
+
+struct AspeedSLIClass {
+    SysBusDeviceClass parent_class;
+};
+
+#endif /* ASPEED_SLI_H */
-- 
2.25.1

