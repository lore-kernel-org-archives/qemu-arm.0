Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294394lfc;
        Wed, 11 Mar 2020 15:19:09 -0700 (PDT)
X-Received: by 2002:a1c:e257:: with SMTP id z84mr862987wmg.91.1583965149877;
        Wed, 11 Mar 2020 15:19:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965149; cv=none;
        d=google.com; s=arc-20160816;
        b=C0qaLFUBk7LboPJJ3rMvVyPAJAF4QpSGmb9xNao/5tfBC+x1tf+/YAzKl7mMEpH8SP
         sCVvssYzTSpR/CsJSQk+cI2tfk6sFunGAkJXu8V1DEI978msm6ROHQBlFEpG69TNx35Y
         3Ry76F5sdk8glvgQy+pbtR8so5znCzODEOifo5wwkRmM+bP1gdsWx2zsiENhb2xb3qHA
         pFdYqbsesS68U5k+im7Vl4000CZO21bMVaEaxbX0JF7RBnaYe4X42wbhr5wubBHK00f4
         +zNSOjvvame8wPsLKm0i46RJG6sZZ0zyHxIbhF0goMwwceeqxygYLBy9sMsunJuTa4j6
         1oWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=olOQfY+z4JjU4ozsbvmt0379Cr5uf2fcjmNWeoE+97k=;
        b=IdVh1l5fvSGbh8KTN/3w3jz56FexL1scn/LpZrSFNzeYp8lYkrlaPyHXAi63ALG53w
         1Nd25vXxFd5n3KSkn63OtMhUKfN0ctuh2pYnCmI06IOMPSnvus/rkzd2YtvweJoQg/qm
         B1/qhEkGhF4oWWa9AVdou+0hQwKe5xI5FvT2cbTsCUuuJjVH9InYnoANYbCf/ZfPiql3
         1UewHssUJH87SgG8PvZr7CkbhnEY155z3CDWrbMMt6CB56rolT/wosPX7XoNGSb03mpx
         HRMzyFTV/RN9x9QkitqXwaoVru0dcv02Bpfz3al8jGwTQ/8TpsmjDn02ze2xTzEHSPUv
         6/IQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tQUcVtis;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k186sor2041801wma.18.2020.03.11.15.19.09
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=tQUcVtis;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=olOQfY+z4JjU4ozsbvmt0379Cr5uf2fcjmNWeoE+97k=;
        b=tQUcVtisIPFkKPKxerrgu74SOAwt/zJxw31i+QzREI4Ehr/G8/qBBuKPAqGtA4e79y
         cGDSuFI+0M9N4EJ3MB58x8TJ8/0bs12Df1Usb+7ovHBNFehNDta6QIqWOF7O13nSGho7
         HBoW6HJ6iL8TXZv5+RDHgXKw9CFmf/aQNEHr3h6Tc5wsiLYVx6bYYlzdI+wNc84FxG6G
         U7/RRlJCx098S3aa7+yFNICZGZzgEkbXYtUyGGtJvHbgC17DrT1+jEVaEx3/67m7ub6m
         4ZgeKol6hEpbd2urclY1JVcliWR32Ir1bsqgp1nhvUxqmD+uLwdeKz5YyLoEcZ8xdoxq
         Im7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olOQfY+z4JjU4ozsbvmt0379Cr5uf2fcjmNWeoE+97k=;
        b=hHgQ2fddncIqEsZkTZJebdqSz1Ruwhxt2dthkfynhU/FMZ0dsPyea8r975WOZN9qmF
         OuvIc5sqA0IYzKK7zg6AWc7rAdfRL9EkEBJxe3EVyMBKOTZkJrfWBoKRZkHbT95aFDlZ
         mMTUuanqhBSxK3VqIts0pYchfT9epQeW/fub1r8lJ81Megl8SPpe39vMqF2Ry8eqWNgE
         ASCTrfpDqmL/gY+aDbggMBdno1awkkBH/ZcBXUW2YuR06ER1WEmMpSdmBmmlKBoNWcH9
         Q7sRn32va634xIen52EfCdlFyIdx62A0Xhi2GtdAKcrp96kkOI2uKhoa+cPkdR728Lbl
         FpWw==
X-Gm-Message-State: ANhLgQ30p8b0NYA2m2OveDtrGcgp8g1626yYkNMPsWrkEjiXeciBokkE
	SfF/LkyjcADOPCOwWw0gnq8=
X-Google-Smtp-Source: ADFU+vsmPP9DxU6PjJeE7JlhUmw8RBqBCDQQ2P2UcTzCbReYvx4h5JLlb+WwHuCdyVyRBV8cvgMzqg==
X-Received: by 2002:a7b:cc95:: with SMTP id p21mr773397wma.184.1583965149185;
        Wed, 11 Mar 2020 15:19:09 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:08 -0700 (PDT)
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
Subject: [PATCH v8 06/18] hw/arm/allwinner: add CPU Configuration module
Date: Wed, 11 Mar 2020 23:18:42 +0100
Message-Id: <20200311221854.30370-7-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 64kwN63g+Jg0

Various Allwinner System on Chip designs contain multiple processors
that can be configured and reset using the generic CPU Configuration
module interface. This commit adds support for the Allwinner CPU
configuration interface which emulates the following features:

 * CPU reset
 * CPU status

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/arm/allwinner-h3.h      |   3 +
 include/hw/misc/allwinner-cpucfg.h |  52 ++++++
 hw/arm/allwinner-h3.c              |   9 +-
 hw/misc/allwinner-cpucfg.c         | 282 +++++++++++++++++++++++++++++
 hw/misc/Makefile.objs              |   1 +
 hw/misc/trace-events               |   5 +
 6 files changed, 351 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/misc/allwinner-cpucfg.h
 create mode 100644 hw/misc/allwinner-cpucfg.c

diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 43500c4262..dc729176ab 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -40,6 +40,7 @@
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/misc/allwinner-h3-ccu.h"
+#include "hw/misc/allwinner-cpucfg.h"
 #include "hw/misc/allwinner-h3-sysctrl.h"
 #include "target/arm/cpu.h"
 
@@ -76,6 +77,7 @@ enum {
     AW_H3_GIC_CPU,
     AW_H3_GIC_HYP,
     AW_H3_GIC_VCPU,
+    AW_H3_CPUCFG,
     AW_H3_SDRAM
 };
 
@@ -110,6 +112,7 @@ typedef struct AwH3State {
     const hwaddr *memmap;
     AwA10PITState timer;
     AwH3ClockCtlState ccu;
+    AwCpuCfgState cpucfg;
     AwH3SysCtrlState sysctrl;
     GICState gic;
     MemoryRegion sram_a1;
diff --git a/include/hw/misc/allwinner-cpucfg.h b/include/hw/misc/allwinner-cpucfg.h
new file mode 100644
index 0000000000..2c3693a8be
--- /dev/null
+++ b/include/hw/misc/allwinner-cpucfg.h
@@ -0,0 +1,52 @@
+/*
+ * Allwinner CPU Configuration Module emulation
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
+#ifndef HW_MISC_ALLWINNER_CPUCFG_H
+#define HW_MISC_ALLWINNER_CPUCFG_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * Object model
+ * @{
+ */
+
+#define TYPE_AW_CPUCFG   "allwinner-cpucfg"
+#define AW_CPUCFG(obj) \
+    OBJECT_CHECK(AwCpuCfgState, (obj), TYPE_AW_CPUCFG)
+
+/** @} */
+
+/**
+ * Allwinner CPU Configuration Module instance state
+ */
+typedef struct AwCpuCfgState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    MemoryRegion iomem;
+    uint32_t gen_ctrl;
+    uint32_t super_standby;
+    uint32_t entry_addr;
+
+} AwCpuCfgState;
+
+#endif /* HW_MISC_ALLWINNER_CPUCFG_H */
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 0aa46712db..b9a5597f2a 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -56,6 +56,7 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_GIC_CPU]    = 0x01c82000,
     [AW_H3_GIC_HYP]    = 0x01c84000,
     [AW_H3_GIC_VCPU]   = 0x01c86000,
+    [AW_H3_CPUCFG]     = 0x01f01c00,
     [AW_H3_SDRAM]      = 0x40000000
 };
 
@@ -122,7 +123,6 @@ struct AwH3Unimplemented {
     { "r_wdog",    0x01f01000, 1 * KiB },
     { "r_prcm",    0x01f01400, 1 * KiB },
     { "r_twd",     0x01f01800, 1 * KiB },
-    { "r_cpucfg",  0x01f01c00, 1 * KiB },
     { "r_cir-rx",  0x01f02000, 1 * KiB },
     { "r_twi",     0x01f02400, 1 * KiB },
     { "r_uart",    0x01f02800, 1 * KiB },
@@ -195,6 +195,9 @@ static void allwinner_h3_init(Object *obj)
 
     sysbus_init_child_obj(obj, "sysctrl", &s->sysctrl, sizeof(s->sysctrl),
                           TYPE_AW_H3_SYSCTRL);
+
+    sysbus_init_child_obj(obj, "cpucfg", &s->cpucfg, sizeof(s->cpucfg),
+                          TYPE_AW_CPUCFG);
 }
 
 static void allwinner_h3_realize(DeviceState *dev, Error **errp)
@@ -308,6 +311,10 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     qdev_init_nofail(DEVICE(&s->sysctrl));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0, s->memmap[AW_H3_SYSCTRL]);
 
+    /* CPU Configuration */
+    qdev_init_nofail(DEVICE(&s->cpucfg));
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->cpucfg), 0, s->memmap[AW_H3_CPUCFG]);
+
     /* Universal Serial Bus */
     sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
                          qdev_get_gpio_in(DEVICE(&s->gic),
diff --git a/hw/misc/allwinner-cpucfg.c b/hw/misc/allwinner-cpucfg.c
new file mode 100644
index 0000000000..bbd33a7dac
--- /dev/null
+++ b/hw/misc/allwinner-cpucfg.c
@@ -0,0 +1,282 @@
+/*
+ * Allwinner CPU Configuration Module emulation
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
+#include "qemu/error-report.h"
+#include "qemu/timer.h"
+#include "hw/core/cpu.h"
+#include "target/arm/arm-powerctl.h"
+#include "target/arm/cpu.h"
+#include "hw/misc/allwinner-cpucfg.h"
+#include "trace.h"
+
+/* CPUCFG register offsets */
+enum {
+    REG_CPUS_RST_CTRL       = 0x0000, /* CPUs Reset Control */
+    REG_CPU0_RST_CTRL       = 0x0040, /* CPU#0 Reset Control */
+    REG_CPU0_CTRL           = 0x0044, /* CPU#0 Control */
+    REG_CPU0_STATUS         = 0x0048, /* CPU#0 Status */
+    REG_CPU1_RST_CTRL       = 0x0080, /* CPU#1 Reset Control */
+    REG_CPU1_CTRL           = 0x0084, /* CPU#1 Control */
+    REG_CPU1_STATUS         = 0x0088, /* CPU#1 Status */
+    REG_CPU2_RST_CTRL       = 0x00C0, /* CPU#2 Reset Control */
+    REG_CPU2_CTRL           = 0x00C4, /* CPU#2 Control */
+    REG_CPU2_STATUS         = 0x00C8, /* CPU#2 Status */
+    REG_CPU3_RST_CTRL       = 0x0100, /* CPU#3 Reset Control */
+    REG_CPU3_CTRL           = 0x0104, /* CPU#3 Control */
+    REG_CPU3_STATUS         = 0x0108, /* CPU#3 Status */
+    REG_CPU_SYS_RST         = 0x0140, /* CPU System Reset */
+    REG_CLK_GATING          = 0x0144, /* CPU Clock Gating */
+    REG_GEN_CTRL            = 0x0184, /* General Control */
+    REG_SUPER_STANDBY       = 0x01A0, /* Super Standby Flag */
+    REG_ENTRY_ADDR          = 0x01A4, /* Reset Entry Address */
+    REG_DBG_EXTERN          = 0x01E4, /* Debug External */
+    REG_CNT64_CTRL          = 0x0280, /* 64-bit Counter Control */
+    REG_CNT64_LOW           = 0x0284, /* 64-bit Counter Low */
+    REG_CNT64_HIGH          = 0x0288, /* 64-bit Counter High */
+};
+
+/* CPUCFG register flags */
+enum {
+    CPUX_RESET_RELEASED     = ((1 << 1) | (1 << 0)),
+    CPUX_STATUS_SMP         = (1 << 0),
+    CPU_SYS_RESET_RELEASED  = (1 << 0),
+    CLK_GATING_ENABLE       = ((1 << 8) | 0xF),
+};
+
+/* CPUCFG register reset values */
+enum {
+    REG_CLK_GATING_RST      = 0x0000010F,
+    REG_GEN_CTRL_RST        = 0x00000020,
+    REG_SUPER_STANDBY_RST   = 0x0,
+    REG_CNT64_CTRL_RST      = 0x0,
+};
+
+/* CPUCFG constants */
+enum {
+    CPU_EXCEPTION_LEVEL_ON_RESET = 3, /* EL3 */
+};
+
+static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_id)
+{
+    int ret;
+
+    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
+
+    ARMCPU *target_cpu = ARM_CPU(arm_get_cpu_by_id(cpu_id));
+    if (!target_cpu) {
+        /*
+         * Called with a bogus value for cpu_id. Guest error will
+         * already have been logged, we can simply return here.
+         */
+        return;
+    }
+    bool target_aa64 = arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64);
+
+    ret = arm_set_cpu_on(cpu_id, s->entry_addr, 0,
+                         CPU_EXCEPTION_LEVEL_ON_RESET, target_aa64);
+    if (ret != QEMU_ARM_POWERCTL_RET_SUCCESS) {
+        error_report("%s: failed to bring up CPU %d: err %d",
+                     __func__, cpu_id, ret);
+        return;
+    }
+}
+
+static uint64_t allwinner_cpucfg_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    const AwCpuCfgState *s = AW_CPUCFG(opaque);
+    uint64_t val = 0;
+
+    switch (offset) {
+    case REG_CPUS_RST_CTRL:     /* CPUs Reset Control */
+    case REG_CPU_SYS_RST:       /* CPU System Reset */
+        val = CPU_SYS_RESET_RELEASED;
+        break;
+    case REG_CPU0_RST_CTRL:     /* CPU#0 Reset Control */
+    case REG_CPU1_RST_CTRL:     /* CPU#1 Reset Control */
+    case REG_CPU2_RST_CTRL:     /* CPU#2 Reset Control */
+    case REG_CPU3_RST_CTRL:     /* CPU#3 Reset Control */
+        val = CPUX_RESET_RELEASED;
+        break;
+    case REG_CPU0_CTRL:         /* CPU#0 Control */
+    case REG_CPU1_CTRL:         /* CPU#1 Control */
+    case REG_CPU2_CTRL:         /* CPU#2 Control */
+    case REG_CPU3_CTRL:         /* CPU#3 Control */
+        val = 0;
+        break;
+    case REG_CPU0_STATUS:       /* CPU#0 Status */
+    case REG_CPU1_STATUS:       /* CPU#1 Status */
+    case REG_CPU2_STATUS:       /* CPU#2 Status */
+    case REG_CPU3_STATUS:       /* CPU#3 Status */
+        val = CPUX_STATUS_SMP;
+        break;
+    case REG_CLK_GATING:        /* CPU Clock Gating */
+        val = CLK_GATING_ENABLE;
+        break;
+    case REG_GEN_CTRL:          /* General Control */
+        val = s->gen_ctrl;
+        break;
+    case REG_SUPER_STANDBY:     /* Super Standby Flag */
+        val = s->super_standby;
+        break;
+    case REG_ENTRY_ADDR:        /* Reset Entry Address */
+        val = s->entry_addr;
+        break;
+    case REG_DBG_EXTERN:        /* Debug External */
+    case REG_CNT64_CTRL:        /* 64-bit Counter Control */
+    case REG_CNT64_LOW:         /* 64-bit Counter Low */
+    case REG_CNT64_HIGH:        /* 64-bit Counter High */
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented register at 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    }
+
+    trace_allwinner_cpucfg_read(offset, val, size);
+
+    return val;
+}
+
+static void allwinner_cpucfg_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    AwCpuCfgState *s = AW_CPUCFG(opaque);
+
+    trace_allwinner_cpucfg_write(offset, val, size);
+
+    switch (offset) {
+    case REG_CPUS_RST_CTRL:     /* CPUs Reset Control */
+    case REG_CPU_SYS_RST:       /* CPU System Reset */
+        break;
+    case REG_CPU0_RST_CTRL:     /* CPU#0 Reset Control */
+    case REG_CPU1_RST_CTRL:     /* CPU#1 Reset Control */
+    case REG_CPU2_RST_CTRL:     /* CPU#2 Reset Control */
+    case REG_CPU3_RST_CTRL:     /* CPU#3 Reset Control */
+        if (val) {
+            allwinner_cpucfg_cpu_reset(s, (offset - REG_CPU0_RST_CTRL) >> 6);
+        }
+        break;
+    case REG_CPU0_CTRL:         /* CPU#0 Control */
+    case REG_CPU1_CTRL:         /* CPU#1 Control */
+    case REG_CPU2_CTRL:         /* CPU#2 Control */
+    case REG_CPU3_CTRL:         /* CPU#3 Control */
+    case REG_CPU0_STATUS:       /* CPU#0 Status */
+    case REG_CPU1_STATUS:       /* CPU#1 Status */
+    case REG_CPU2_STATUS:       /* CPU#2 Status */
+    case REG_CPU3_STATUS:       /* CPU#3 Status */
+    case REG_CLK_GATING:        /* CPU Clock Gating */
+        break;
+    case REG_GEN_CTRL:          /* General Control */
+        s->gen_ctrl = val;
+        break;
+    case REG_SUPER_STANDBY:     /* Super Standby Flag */
+        s->super_standby = val;
+        break;
+    case REG_ENTRY_ADDR:        /* Reset Entry Address */
+        s->entry_addr = val;
+        break;
+    case REG_DBG_EXTERN:        /* Debug External */
+    case REG_CNT64_CTRL:        /* 64-bit Counter Control */
+    case REG_CNT64_LOW:         /* 64-bit Counter Low */
+    case REG_CNT64_HIGH:        /* 64-bit Counter High */
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented register at 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps allwinner_cpucfg_ops = {
+    .read = allwinner_cpucfg_read,
+    .write = allwinner_cpucfg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_cpucfg_reset(DeviceState *dev)
+{
+    AwCpuCfgState *s = AW_CPUCFG(dev);
+
+    /* Set default values for registers */
+    s->gen_ctrl = REG_GEN_CTRL_RST;
+    s->super_standby = REG_SUPER_STANDBY_RST;
+    s->entry_addr = 0;
+}
+
+static void allwinner_cpucfg_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwCpuCfgState *s = AW_CPUCFG(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_cpucfg_ops, s,
+                          TYPE_AW_CPUCFG, 1 * KiB);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_cpucfg_vmstate = {
+    .name = "allwinner-cpucfg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(gen_ctrl, AwCpuCfgState),
+        VMSTATE_UINT32(super_standby, AwCpuCfgState),
+        VMSTATE_UINT32(entry_addr, AwCpuCfgState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_cpucfg_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = allwinner_cpucfg_reset;
+    dc->vmsd = &allwinner_cpucfg_vmstate;
+}
+
+static const TypeInfo allwinner_cpucfg_info = {
+    .name          = TYPE_AW_CPUCFG,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_cpucfg_init,
+    .instance_size = sizeof(AwCpuCfgState),
+    .class_init    = allwinner_cpucfg_class_init,
+};
+
+static void allwinner_cpucfg_register(void)
+{
+    type_register_static(&allwinner_cpucfg_info);
+}
+
+type_init(allwinner_cpucfg_register)
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 63b2e528f9..f3788a5903 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) += macio/
 common-obj-$(CONFIG_IVSHMEM_DEVICE) += ivshmem.o
 
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-ccu.o
+obj-$(CONFIG_ALLWINNER_H3) += allwinner-cpucfg.o
 common-obj-$(CONFIG_ALLWINNER_H3) += allwinner-h3-sysctrl.o
 common-obj-$(CONFIG_REALVIEW) += arm_sysctl.o
 common-obj-$(CONFIG_NSERIES) += cbus.o
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 7f0f5dff3a..ede1650672 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -1,5 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
 
+# allwinner-cpucfg.c
+allwinner_cpucfg_cpu_reset(uint8_t cpu_id, uint32_t reset_addr) "id %u, reset_addr 0x%" PRIu32
+allwinner_cpucfg_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+allwinner_cpucfg_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %" PRIu32
+
 # eccmemctl.c
 ecc_mem_writel_mer(uint32_t val) "Write memory enable 0x%08x"
 ecc_mem_writel_mdr(uint32_t val) "Write memory delay 0x%08x"
-- 
2.17.1
