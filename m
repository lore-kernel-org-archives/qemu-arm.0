Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294379lfc;
        Wed, 11 Mar 2020 15:19:08 -0700 (PDT)
X-Received: by 2002:adf:b19e:: with SMTP id q30mr6514015wra.163.1583965148606;
        Wed, 11 Mar 2020 15:19:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965148; cv=none;
        d=google.com; s=arc-20160816;
        b=qmGmzyHSIRrMEJRI/P3+hVi8oE8F62JxfGsSHOpGA6+rTRnU9qQc8uR2RiGlcLv8Pi
         QO2syZ7YRClv87KvQt1Y01UwNyziaButYzpVJiyY5+1HZFMYrS74W3o3pceIK4PdFyJm
         orDNRMnAfWwRsv+L1gOIa7n430QztJejcLj4RkoQiKCcWUybtt1N77SVIPscAsjUQOX+
         CUMtQC49TB6S8s0MOoui+jU3GCu13kjZ76v/TMmoTgkHAFbtCHaFa7UJH1xMHbVlJVQw
         S89SxMA09o0jQHENkTTYfChuUmboH3Jenjnqo7n7SNqI6aIQe3dau+dn9H7RHn64H2Q1
         I73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=He2szfmh8JbQUMzDcVW0sJU0dWkWjFF+NLSeMV0Ef1w=;
        b=aTjR6mdJGGUfMEDztImciE0WmnLniTc4MUiDexDtq/Z4iHeyoW0Hj7mKv15hyQ6PNg
         gXXkCMyCX6Zogou7HAKtH8I8bbeoatcUHLDQQoT/lQCB50ByjiZEGcndNvjmc+VtLrZJ
         apTuAPm8glVH2gVwSeO85/yDNP+kUi3mIkqi+45le6DKq52jFI7UgGU6TXFaFvmMFVS7
         mKqLbVSeO9I5ma331HkU7LyPjpqwWVhVIrTn84TfGeO30ZQeKEJdj/QgHXVif3FHhG8V
         dDQ2uDHa8LVQzhKhBKxm8Z6JRCuMqKe20xiGXiWjouUtExFT5ChQcAEg/6xD0Vst93Nn
         xN9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AfzXd2Xw;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 19sor2128891wmo.7.2020.03.11.15.19.08
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=AfzXd2Xw;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=He2szfmh8JbQUMzDcVW0sJU0dWkWjFF+NLSeMV0Ef1w=;
        b=AfzXd2XwmQZISRz2l9xpa+TpledNZOzGqCcMDYQO/eCqsdWzK/rlRogHLU0i6KJbv2
         DuJaFNnwOTYGuGJie7/TC+Bq6rsVUbLcNVHNdj5HdcMHzBCI+Ji0HRgc5AFiw5VJGdna
         pYCAfNheYAQkCfL5U8ZqgkPL1nFrE5wAdcoRCNsWsVXEhM+UWD7VpNRKPYzuKiVzmDh7
         0/8/jMZbRnzoVsHjtbfrz6K9owrz7ruAyH5c+AdLmBtKtgMHIUO81jzYlAlhkuv7IeiC
         o0pLHq0h6qs1FiIRMCzFNKU+HL6rxbqPk6dnUZO4AbZsuP6wbnG712WNdsF698m37mTq
         xgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=He2szfmh8JbQUMzDcVW0sJU0dWkWjFF+NLSeMV0Ef1w=;
        b=f+RR1OzpaEIxSTjts0Fs2y5iaQ22XcdCOI5l7pjn4NUB+UY1zNEFBnUTAg2KjrfqdU
         Q1C1SpNIBVn5ITgQeEOqNj0lreHjgioz+5La2frxuY7sTcoGCSKLtnwzRQS0tAM0FYVw
         /+/zYmUs+9FF8zrZl+XcKWgGx7ZYO+0ha9pKem6jruiPLiRxk7RYbZNJLLt6MlPjAUtX
         CaqmRcqzaCpyk1jF9LgnN2aFsUh+xaJmBUK2NUgMJy1gq11xZhcOfpvhV8yW0xx4INEu
         1mJAPjmEL8kiFKE2ueO6pipHa8Eg9XAn53DBLZzO1NtEvQthn2hk6NniYLXO9yssUibo
         BEmw==
X-Gm-Message-State: ANhLgQ0XqExeH/WCmSWyL3H45SGlmcmFsWO+G20V3EIxgfq3Eg40jS/H
	Z7viotLIIRwgqRcxWhbtNWQ=
X-Google-Smtp-Source: ADFU+vubgCByle7M3BHt2m8/E/Pm2sq14zhcjasHZoRC/5kXnbcse2bFX6G4Kon6xukqYOKmq72UVA==
X-Received: by 2002:a1c:cc11:: with SMTP id h17mr878437wmb.154.1583965148082;
        Wed, 11 Mar 2020 15:19:08 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:07 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v8 05/18] hw/arm/allwinner-h3: add System Control module
Date: Wed, 11 Mar 2020 23:18:41 +0100
Message-Id: <20200311221854.30370-6-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Oxc/X/pghSvq

The Allwinner H3 System on Chip has an System Control
module that provides system wide generic controls and
device information. This commit adds support for the
Allwinner H3 System Control module.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/arm/allwinner-h3.h          |   3 +
 include/hw/misc/allwinner-h3-sysctrl.h |  67 ++++++++++++
 hw/arm/allwinner-h3.c                  |   9 +-
 hw/misc/allwinner-h3-sysctrl.c         | 140 +++++++++++++++++++++++++
 hw/misc/Makefile.objs                  |   1 +
 5 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/allwinner-h3-sysctrl.h
 create mode 100644 hw/misc/allwinner-h3-sysctrl.c

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 4f4dcbcd17..43500c4262 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -40,6 +40,7 @@
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-ccu.h"
+#include "hw/misc/allwinner-h3-sysctrl.h"
 #include "target/arm/cpu.h"
 
 /**
@@ -56,6 +57,7 @@ enum {
     AW_H3_SRAM_A1,
     AW_H3_SRAM_A2,
     AW_H3_SRAM_C,
+    AW_H3_SYSCTRL,
     AW_H3_EHCI0,
     AW_H3_OHCI0,
     AW_H3_EHCI1,
@@ -108,6 +110,7 @@ typedef struct AwH3State {
     const hwaddr *memmap;
     AwA10PITState timer;
     AwH3ClockCtlState ccu;
+    AwH3SysCtrlState sysctrl;
     GICState gic;
     MemoryRegion sram_a1;
     MemoryRegion sram_a2;
diff --git a/include/hw/misc/allwinner-h3-sysctrl.h b/include/hw/misc/allwinner-h3-sysctrl.h
new file mode 100644
index 0000000000..af4119e026
--- /dev/null
+++ b/include/hw/misc/allwinner-h3-sysctrl.h
@@ -0,0 +1,67 @@
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
+#ifndef HW_MISC_ALLWINNER_H3_SYSCTRL_H
+#define HW_MISC_ALLWINNER_H3_SYSCTRL_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * @name Constants
+ * @{
+ */
+
+/** Highest register address used by System Control device */
+#define AW_H3_SYSCTRL_REGS_MAXADDR   (0x30)
+
+/** Total number of known registers */
+#define AW_H3_SYSCTRL_REGS_NUM       ((AW_H3_SYSCTRL_REGS_MAXADDR / \
+                                      sizeof(uint32_t)) + 1)
+
+/** @} */
+
+/**
+ * @name Object model
+ * @{
+ */
+
+#define TYPE_AW_H3_SYSCTRL    "allwinner-h3-sysctrl"
+#define AW_H3_SYSCTRL(obj) \
+    OBJECT_CHECK(AwH3SysCtrlState, (obj), TYPE_AW_H3_SYSCTRL)
+
+/** @} */
+
+/**
+ * Allwinner H3 System Control object instance state
+ */
+typedef struct AwH3SysCtrlState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[AW_H3_SYSCTRL_REGS_NUM];
+
+} AwH3SysCtrlState;
+
+#endif /* HW_MISC_ALLWINNER_H3_SYSCTRL_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index c205f06738..0aa46712db 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -37,6 +37,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_SRAM_A1]    = 0x00000000,
     [AW_H3_SRAM_A2]    = 0x00044000,
     [AW_H3_SRAM_C]     = 0x00010000,
+    [AW_H3_SYSCTRL]    = 0x01c00000,
     [AW_H3_EHCI0]      = 0x01c1a000,
     [AW_H3_OHCI0]      = 0x01c1a400,
     [AW_H3_EHCI1]      = 0x01c1b000,
@@ -66,7 +67,6 @@ struct AwH3Unimplemented {
 } unimplemented[] = {
     { "d-engine",  0x01000000, 4 * MiB },
     { "d-inter",   0x01400000, 128 * KiB },
-    { "syscon",    0x01c00000, 4 * KiB },
     { "dma",       0x01c02000, 4 * KiB },
     { "nfdc",      0x01c03000, 4 * KiB },
     { "ts",        0x01c06000, 4 * KiB },
@@ -192,6 +192,9 @@ static void allwinner_h3_init(Object *obj)
 
     sysbus_init_child_obj(obj, "ccu", &s->ccu, sizeof(s->ccu),
                           TYPE_AW_H3_CCU);
+
+    sysbus_init_child_obj(obj, "sysctrl", &s->sysctrl, sizeof(s->sysctrl),
+                          TYPE_AW_H3_SYSCTRL);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -301,6 +304,10 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     qdev_init_nofail(DEVICE(&s->ccu));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
 
+    /* System Control */
+    qdev_init_nofail(DEVICE(&s->sysctrl));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0, s->memmap[AW_H3_SYSCTRL]);
+
     /* Universal Serial Bus */
     sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
                          qdev_get_gpio_in(DEVICE(&s->gic),
diff --git a/hw/misc/allwinner-h3-sysctrl.c b/hw/misc/allwinner-h3-sysctrl.c
new file mode 100644
index 0000000000..1d07efa880
--- /dev/null
+++ b/hw/misc/allwinner-h3-sysctrl.c
@@ -0,0 +1,140 @@
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
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/allwinner-h3-sysctrl.h"
+
+/* System Control register offsets */
+enum {
+    REG_VER               = 0x24,  /* Version */
+    REG_EMAC_PHY_CLK      = 0x30,  /* EMAC PHY Clock */
+};
+
+#define REG_INDEX(offset)   (offset / sizeof(uint32_t))
+
+/* System Control register reset values */
+enum {
+    REG_VER_RST           = 0x0,
+    REG_EMAC_PHY_CLK_RST  = 0x58000,
+};
+
+static uint64_t allwinner_h3_sysctrl_read(void *opaque, hwaddr offset,
+                                          unsigned size)
+{
+    const AwH3SysCtrlState *s = AW_H3_SYSCTRL(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_SYSCTRL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    return s->regs[idx];
+}
+
+static void allwinner_h3_sysctrl_write(void *opaque, hwaddr offset,
+                                       uint64_t val, unsigned size)
+{
+    AwH3SysCtrlState *s = AW_H3_SYSCTRL(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    if (idx >= AW_H3_SYSCTRL_REGS_NUM) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
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
+static const MemoryRegionOps allwinner_h3_sysctrl_ops = {
+    .read = allwinner_h3_sysctrl_read,
+    .write = allwinner_h3_sysctrl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_h3_sysctrl_reset(DeviceState *dev)
+{
+    AwH3SysCtrlState *s = AW_H3_SYSCTRL(dev);
+
+    /* Set default values for registers */
+    s->regs[REG_INDEX(REG_VER)] = REG_VER_RST;
+    s->regs[REG_INDEX(REG_EMAC_PHY_CLK)] = REG_EMAC_PHY_CLK_RST;
+}
+
+static void allwinner_h3_sysctrl_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwH3SysCtrlState *s = AW_H3_SYSCTRL(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_h3_sysctrl_ops, s,
+                           TYPE_AW_H3_SYSCTRL, 4 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_h3_sysctrl_vmstate = {
+    .name = "allwinner-h3-sysctrl",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwH3SysCtrlState, AW_H3_SYSCTRL_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_h3_sysctrl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_h3_sysctrl_reset;
+    dc->vmsd = &allwinner_h3_sysctrl_vmstate;
+}
+
+static const TypeInfo allwinner_h3_sysctrl_info = {
+    .name          = TYPE_AW_H3_SYSCTRL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_h3_sysctrl_init,
+    .instance_size = sizeof(AwH3SysCtrlState),
+    .class_init    = allwinner_h3_sysctrl_class_init,
+};
+
+static void allwinner_h3_sysctrl_register(void)
+{
+    type_register_static(&allwinner_h3_sysctrl_info);
+}
+
+type_init(allwinner_h3_sysctrl_register)
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 5e635b74d5..63b2e528f9 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) += macio/
 common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-ccu.o
+common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-sysctrl.o
 common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
 common-obj-$(CONFIG_NSERIES) += cbus.o
 common-obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
-- 
2.17.1
