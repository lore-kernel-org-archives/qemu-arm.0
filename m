Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp567244lfc;
        Mon, 2 Dec 2019 13:38:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqzTIEQJbJqClPX3DvNln6lQcDg8IjpbzeLVRbIizu3YRlIhzi9UoININdNkn5xh7W7IDH85
X-Received: by 2002:a17:906:68d9:: with SMTP id y25mr1756538ejr.136.1575322702701;
        Mon, 02 Dec 2019 13:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575322702; cv=none;
        d=google.com; s=arc-20160816;
        b=RHMGFiU5Bgmy2rcz8VCXGKZYPCMEXgJD2e/oGiOFW5yFAqFHrf2LsZqRZ6STyM+8KV
         2NdBInUy1V50FFLdGtt80YiRFTq3y9P7Z2u4EtFRLntXfwXGNhmugSp6UNPAkuNP85Ar
         twPcWrE+FmiAPEb4+BNRFO8AaygZJcXqNa46Hqm8V0QmyLeJ8BnaxqoStq9nd6OfGm1K
         bsE57UFIWxW1JFRpoVPlNJga9TyBe4ZYLuBBmO1JfkzLzUEknjQz4KmcqUFn11dA2f7V
         JukykdxpXntJehUUfAtkYMZM7Ix+LyPmG0ehZOtby+NzFcVG9/hK7e4sW5R4Y1+wg0HT
         mCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=83StbJO9vc/PtHWWasIgmXL+LHo+Q8gv4+RVzsR74VQ=;
        b=DRZyQQ+7px2oqpL0egn2l0FWF73V4WJxVwsupXh4SDRRGoE1IdQvMLiLZjS5lHTjmn
         SzCZS34WS+Ngo13/c+Yn7KSKit78a2UuKVo7tTIrbpQ4sN/YnkBBCsltQbjUXeEiXXIp
         75gEQXXMZjnRFLIOHzZ+VfhmHhGHjxL5GhbTd6JVNL5Yyqjm0mtssu6u7cNkAyO+Y8sr
         2nn9I/HLriOFvtdMZbTVafEGXkJjetgCe5cNVMndNBz97Kf3PethzYoUso5363uutIZT
         QwGA+9VuS0XLvo1M5qtumLDqL5c7/frrufF9MWFidTpwvP/mf8wzWIlxtwKn1cD0U8jj
         m3gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gCiXGfOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si614926ejf.205.2019.12.02.13.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 13:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gCiXGfOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibtOd-0003w8-3Q
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 16:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38334)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxj-0002kD-T5
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 16:10:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1ibsxg-0000mI-7w
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 16:10:31 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38630)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1ibsxK-0000Z6-MT; Mon, 02 Dec 2019 16:10:06 -0500
Received: by mail-wm1-x341.google.com with SMTP id p17so1104421wmi.3;
 Mon, 02 Dec 2019 13:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=83StbJO9vc/PtHWWasIgmXL+LHo+Q8gv4+RVzsR74VQ=;
 b=gCiXGfOnKPgloIuyHuMaCPhD8S9iAMudxA9AQQt/u5v4kMTdj4vptn1OEHUBcKCCHQ
 csbBJqPb02EJBK4Uy433GrSxvySd0Cf1d7YqWPz7DzewkEQeBxkAIr+z27hFmPwcRfWn
 hg7doU9HUzUPHWUdhb4wwijTF7xp/1ugQuZ8rjz6A26yu8Cok860KBsd52bKoTu6w3oQ
 LdDdSzS7zCPpNQLHD0icoAlVEaTukdiiRW1VDkdxvgXoUBbctfM8cIpMfmlAtTKGTcQY
 DUa+yeH2V1y0Tw4azB0rArbR9zuafu+0xotqNxk15Z4iyV+l1CeYI34OfpSneJlsOYSS
 FrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=83StbJO9vc/PtHWWasIgmXL+LHo+Q8gv4+RVzsR74VQ=;
 b=ORpjx6ZpvxQDj+HHO/ryPpvFud+WyK71h/7+gSzpna6lc+YI46US2Q3lfByDC1dKzz
 +mtUYkjYBNykboGNTcfwaFKV9weW5dWvajvzOPAAUbdsOWyEBnyoOgjHJaso3TP1GpjX
 0Eo8lHJTSSPJgPa8ve4iLFRRrZgG5oGwAhDWCD7GfazIZxZgA6XvFB2MvB347knX8jwQ
 jfdKv9pqaVohX9kF3yCwVAUDdT53ssCKsgAr+uKNtkUbKjugrjboVlaRJ9c9kYyGnTop
 idaLNZIPc8N6bC2gSKCct1CCcsFpz1aHuhugV4PZG5monH3vatuPFryyBRLP+E+Ut35w
 Wtaw==
X-Gm-Message-State: APjAAAU8Uf6fdP1bcxF0G34GPFlRKZhEphT/Z5XjJ/EjiJeU46lqqUtQ
 i4ewYxxWpC+6KGG4PT1G2/tFdr6c
X-Received: by 2002:a1c:c906:: with SMTP id f6mr32010469wmb.14.1575321001109; 
 Mon, 02 Dec 2019 13:10:01 -0800 (PST)
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
 by smtp.gmail.com with ESMTPSA id f1sm770859wrp.93.2019.12.02.13.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 13:10:00 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] arm: allwinner-h3: add System Control module
Date: Mon,  2 Dec 2019 22:09:42 +0100
Message-Id: <20191202210947.3603-6-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202210947.3603-1-nieklinnenbank@gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
X-Mailman-Approved-At: Mon, 02 Dec 2019 16:38:01 -0500
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
Cc: b.galvani@gmail.com, peter.maydell@linaro.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3l3BdtI4ovy

The Allwinner H3 System on Chip has an System Control
module that provides system wide generic controls and
device information. This commit adds support for the
Allwinner H3 System Control module.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 hw/arm/allwinner-h3.c                 |  11 ++
 hw/misc/Makefile.objs                 |   1 +
 hw/misc/allwinner-h3-syscon.c         | 139 ++++++++++++++++++++++++++
 include/hw/arm/allwinner-h3.h         |   2 +
 include/hw/misc/allwinner-h3-syscon.h |  43 ++++++++
 5 files changed, 196 insertions(+)
 create mode 100644 hw/misc/allwinner-h3-syscon.c
 create mode 100644 include/hw/misc/allwinner-h3-syscon.h

diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index afeb49c0ac..ebd8fde412 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -41,6 +41,9 @@ static void aw_h3_init(Object *obj)
 
     sysbus_init_child_obj(obj, "ccu", &s->ccu, sizeof(s->ccu),
                           TYPE_AW_H3_CLK);
+
+    sysbus_init_child_obj(obj, "syscon", &s->syscon, sizeof(s->syscon),
+                          TYPE_AW_H3_SYSCON);
 }
 
 static void aw_h3_realize(DeviceState *dev, Error **errp)
@@ -184,6 +187,14 @@ static void aw_h3_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, AW_H3_CCU_BASE);
 
+    /* System Control */
+    object_property_set_bool(OBJECT(&s->syscon), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->syscon), 0, AW_H3_SYSCON_BASE);
+
     /* Universal Serial Bus */
     sysbus_create_simple(TYPE_AW_H3_EHCI, AW_H3_EHCI0_BASE,
                          s->irq[AW_H3_GIC_SPI_EHCI0]);
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 200ed44ce1..b234aefba5 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) += macio/
 common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-clk.o
+common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-syscon.o
 common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
 common-obj-$(CONFIG_NSERIES) += cbus.o
 common-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
diff --git a/hw/misc/allwinner-h3-syscon.c b/hw/misc/allwinner-h3-syscon.c
new file mode 100644
index 0000000000..66bd518a05
--- /dev/null
+++ b/hw/misc/allwinner-h3-syscon.c
@@ -0,0 +1,139 @@
+/*
+ * Allwinner H3 System Control emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/allwinner-h3-syscon.h"
+
+/* SYSCON register offsets */
+#define REG_VER                 (0x24)  /* Version */
+#define REG_EMAC_PHY_CLK        (0x30)  /* EMAC PHY Clock */
+#define REG_INDEX(offset)       (offset / sizeof(uint32_t))
+
+/* SYSCON register reset values */
+#define REG_VER_RST             (0x0)
+#define REG_EMAC_PHY_CLK_RST    (0x58000)
+
+static uint64_t allwinner_h3_syscon_read(void *opaque, hwaddr offset,
+                                         unsigned size)
+{
+    const AwH3SysconState *s = (AwH3SysconState *)opaque;
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_SYSCON_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad read offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    return s->regs[idx];
+}
+
+static void allwinner_h3_syscon_write(void *opaque, hwaddr offset,
+                                      uint64_t val, unsigned size)
+{
+    AwH3SysconState *s = (AwH3SysconState *)opaque;
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_SYSCON_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad write offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return;
+    }
+
+    switch (offset) {
+    case REG_VER:       /* Version */
+        break;
+    default:
+        s->regs[idx] = (uint32_t) val;
+        break;
+    }
+}
+
+static const MemoryRegionOps allwinner_h3_syscon_ops = {
+    .read = allwinner_h3_syscon_read,
+    .write = allwinner_h3_syscon_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false
+    }
+};
+
+static void allwinner_h3_syscon_reset(DeviceState *dev)
+{
+    AwH3SysconState *s = AW_H3_SYSCON(dev);
+
+    /* Set default values for registers */
+    s->regs[REG_INDEX(REG_VER)] = REG_VER_RST;
+    s->regs[REG_INDEX(REG_EMAC_PHY_CLK)] = REG_EMAC_PHY_CLK_RST;
+}
+
+static void allwinner_h3_syscon_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void allwinner_h3_syscon_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwH3SysconState *s = AW_H3_SYSCON(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_h3_syscon_ops, s,
+                          TYPE_AW_H3_SYSCON, AW_H3_SYSCON_REGS_MEM_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_h3_syscon_vmstate = {
+    .name = TYPE_AW_H3_SYSCON,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwH3SysconState, AW_H3_SYSCON_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_h3_syscon_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_h3_syscon_reset;
+    dc->realize = allwinner_h3_syscon_realize;
+    dc->vmsd = &allwinner_h3_syscon_vmstate;
+}
+
+static const TypeInfo allwinner_h3_syscon_info = {
+    .name          = TYPE_AW_H3_SYSCON,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_h3_syscon_init,
+    .instance_size = sizeof(AwH3SysconState),
+    .class_init    = allwinner_h3_syscon_class_init,
+};
+
+static void allwinner_h3_syscon_register(void)
+{
+    type_register_static(&allwinner_h3_syscon_info);
+}
+
+type_init(allwinner_h3_syscon_register)
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index e596516c5c..2bc526b77b 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -27,6 +27,7 @@
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-clk.h"
+#include "hw/misc/allwinner-h3-syscon.h"
 #include "target/arm/cpu.h"
 
 #define AW_H3_SRAM_A1_BASE     (0x00000000)
@@ -111,6 +112,7 @@ typedef struct AwH3State {
     qemu_irq irq[AW_H3_GIC_NUM_SPI];
     AwA10PITState timer;
     AwH3ClockState ccu;
+    AwH3SysconState syscon;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
diff --git a/include/hw/misc/allwinner-h3-syscon.h b/include/hw/misc/allwinner-h3-syscon.h
new file mode 100644
index 0000000000..22a2f2a11b
--- /dev/null
+++ b/include/hw/misc/allwinner-h3-syscon.h
@@ -0,0 +1,43 @@
+/*
+ * Allwinner H3 System Control emulation
+ *
+ * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MISC_ALLWINNER_H3_SYSCON_H
+#define HW_MISC_ALLWINNER_H3_SYSCON_H
+
+#include "hw/sysbus.h"
+
+#define AW_H3_SYSCON_REGS_MAX_ADDR  (0x30)
+#define AW_H3_SYSCON_REGS_NUM       ((AW_H3_SYSCON_REGS_MAX_ADDR / \
+                                      sizeof(uint32_t)) + 1)
+#define AW_H3_SYSCON_REGS_MEM_SIZE  (1024)
+
+#define TYPE_AW_H3_SYSCON    "allwinner-h3-syscon"
+#define AW_H3_SYSCON(obj)    OBJECT_CHECK(AwH3SysconState, (obj), \
+                                          TYPE_AW_H3_SYSCON)
+
+typedef struct AwH3SysconState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    uint32_t regs[AW_H3_SYSCON_REGS_NUM];
+} AwH3SysconState;
+
+#endif
-- 
2.17.1

