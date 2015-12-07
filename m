Received: by 10.182.158.201 with SMTP id ww9csp2608311obb;
        Mon, 7 Dec 2015 14:55:30 -0800 (PST)
X-Received: by 10.55.78.82 with SMTP id c79mr406088qkb.44.1449528930892;
        Mon, 07 Dec 2015 14:55:30 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11si334426qhg.74.2015.12.07.14.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Dec 2015 14:55:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56853 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a64gs-0004H5-I2
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 17:55:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64fC-0001Xx-46
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 17:53:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64f9-00051D-0Y
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 17:53:46 -0500
Received: from zose-mta05.web4all.fr ([185.49.20.50]:52343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a64f2-000505-1T; Mon, 07 Dec 2015 17:53:36 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 383F8447AF;
	Mon,  7 Dec 2015 23:53:35 +0100 (CET)
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id sfDhIZ7z2gbA; Mon,  7 Dec 2015 23:53:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id BA923447AE;
	Mon,  7 Dec 2015 23:53:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-05.w4a.fr
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id t9SFvuUdpP64; Mon,  7 Dec 2015 23:53:33 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta05.web4all.fr (Postfix) with ESMTPSA id 25703447B0;
	Mon,  7 Dec 2015 23:53:33 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Mon,  7 Dec 2015 23:53:32 +0100
Message-Id: <fd3c7f87b50f5ebc99ec91f01413db35017f116d.1449528242.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449528242.git.jcd@tribudubois.net>
References: <cover.1449528242.git.jcd@tribudubois.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.50
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-devel] [PATCH v6 3/5] i.MX: Split the CCM class into an
	abstact base class and a concrete class.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2mIQzSd689RE

The IMX_CCM class is now the base abstract class that is used by EPIT and GPT
timer implementation.

IMX31_CCM class is the concrete class implementing CCM for i.MX31 SOC.

For now the i.MX25 continues to use the i.MX31 CCM implementation.

An i.MX25 specific CCM will be introduced in a later patch.

We also rework initialization to stop using deprecated sysbus device init

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

Changes since v1:
 * None 
 
Changes since v2:
 * We moved to an inheritance QOM scheme
 
Changes since v3:
 * Rework logging based on comment on i.MX25 CCM patch.
 * Change abstract class function parameter to abstract class type instead
   of DEVICE type.
 * EPIT and GPT timers use abstract class instead of DEVICE class.

Changes sinve v4:
 * improve debug logging.
 * make IPG clk dependent on HCLK clk.

Changes since v5:
 * None

 hw/arm/fsl-imx25.c          |   6 +-
 hw/arm/fsl-imx31.c          |   6 +-
 hw/misc/Makefile.objs       |   1 +
 hw/misc/imx31_ccm.c         | 392 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/imx_ccm.c           | 231 +++-----------------------
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/arm/fsl-imx31.h  |   4 +-
 include/hw/misc/imx31_ccm.h |  66 ++++++++
 include/hw/misc/imx_ccm.h   |  69 +++-----
 include/hw/timer/imx_epit.h |   5 +-
 include/hw/timer/imx_gpt.h  |   5 +-
 11 files changed, 521 insertions(+), 268 deletions(-)
 create mode 100644 hw/misc/imx31_ccm.c
 create mode 100644 include/hw/misc/imx31_ccm.h

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index e1cadac..9f302ed 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -38,7 +38,7 @@ static void fsl_imx25_init(Object *obj)
     object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
     qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX_CCM);
+    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
     qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
 
     for (i = 0; i < FSL_IMX25_NUM_UARTS; i++) {
@@ -150,7 +150,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
             { FSL_IMX25_GPT4_ADDR, FSL_IMX25_GPT4_IRQ }
         };
 
-        s->gpt[i].ccm = DEVICE(&s->ccm);
+        s->gpt[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->gpt[i]), true, "realized", &err);
         if (err) {
@@ -173,7 +173,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
             { FSL_IMX25_EPIT2_ADDR, FSL_IMX25_EPIT2_IRQ }
         };
 
-        s->epit[i].ccm = DEVICE(&s->ccm);
+        s->epit[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->epit[i]), true, "realized", &err);
         if (err) {
diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
index 53d4473..abdea06 100644
--- a/hw/arm/fsl-imx31.c
+++ b/hw/arm/fsl-imx31.c
@@ -35,7 +35,7 @@ static void fsl_imx31_init(Object *obj)
     object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
     qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX_CCM);
+    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
     qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
 
     for (i = 0; i < FSL_IMX31_NUM_UARTS; i++) {
@@ -128,7 +128,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
                                             serial_table[i].irq));
     }
 
-    s->gpt.ccm = DEVICE(&s->ccm);
+    s->gpt.ccm = IMX_CCM(&s->ccm);
 
     object_property_set_bool(OBJECT(&s->gpt), true, "realized", &err);
     if (err) {
@@ -150,7 +150,7 @@ static void fsl_imx31_realize(DeviceState *dev, Error **errp)
             { FSL_IMX31_EPIT2_ADDR, FSL_IMX31_EPIT2_IRQ },
         };
 
-        s->epit[i].ccm = DEVICE(&s->ccm);
+        s->epit[i].ccm = IMX_CCM(&s->ccm);
 
         object_property_set_bool(OBJECT(&s->epit[i]), true, "realized", &err);
         if (err) {
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index aeb6b7d..c77f3e3 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -26,6 +26,7 @@ obj-$(CONFIG_NSERIES) += cbus.o
 obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o
 obj-$(CONFIG_IMX) += imx_ccm.o
+obj-$(CONFIG_IMX) += imx31_ccm.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx31_ccm.c b/hw/misc/imx31_ccm.c
new file mode 100644
index 0000000..b92d2e0
--- /dev/null
+++ b/hw/misc/imx31_ccm.c
@@ -0,0 +1,392 @@
+/*
+ * IMX31 Clock Control Module
+ *
+ * Copyright (C) 2012 NICTA
+ * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * To get the timer frequencies right, we need to emulate at least part of
+ * the i.MX31 CCM.
+ */
+
+#include "hw/misc/imx31_ccm.h"
+
+#define CKIH_FREQ 26000000 /* 26MHz crystal input */
+
+#ifndef DEBUG_IMX31_CCM
+#define DEBUG_IMX31_CCM 0
+#endif
+
+#define DPRINTF(fmt, args...) \
+    do { \
+        if (DEBUG_IMX31_CCM) { \
+            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX31_CCM, \
+                                             __func__, ##args); \
+        } \
+    } while (0)
+
+static char const *imx31_ccm_reg_name(uint32_t reg)
+{
+    switch (reg) {
+    case 0:
+        return "CCMR";
+    case 1:
+        return "PDR0";
+    case 2:
+        return "PDR1";
+    case 3:
+        return "RCSR";
+    case 4:
+        return "MPCTL";
+    case 5:
+        return "UPCTL";
+    case 6:
+        return "SPCTL";
+    case 7:
+        return "COSR";
+    case 8:
+        return "CGR0";
+    case 9:
+        return "CGR1";
+    case 10:
+        return "CGR2";
+    case 11:
+        return "WIMR";
+    case 12:
+        return "LDC";
+    case 13:
+        return "DCVR0";
+    case 14:
+        return "DCVR1";
+    case 15:
+        return "DCVR2";
+    case 16:
+        return "DCVR3";
+    case 17:
+        return "LTR0";
+    case 18:
+        return "LTR1";
+    case 19:
+        return "LTR2";
+    case 20:
+        return "LTR3";
+    case 21:
+        return "LTBR0";
+    case 22:
+        return "LTBR1";
+    case 23:
+        return "PMCR0";
+    case 24:
+        return "PMCR1";
+    case 25:
+        return "PDR2";
+    default:
+        return "???";
+    }
+}
+
+static const VMStateDescription vmstate_imx31_ccm = {
+    .name = TYPE_IMX31_CCM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ccmr, IMX31CCMState),
+        VMSTATE_UINT32(pdr0, IMX31CCMState),
+        VMSTATE_UINT32(pdr1, IMX31CCMState),
+        VMSTATE_UINT32(mpctl, IMX31CCMState),
+        VMSTATE_UINT32(spctl, IMX31CCMState),
+        VMSTATE_UINT32_ARRAY(cgr, IMX31CCMState, 3),
+        VMSTATE_UINT32(pmcr0, IMX31CCMState),
+        VMSTATE_UINT32(pmcr1, IMX31CCMState),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static uint32_t imx31_ccm_get_pll_ref_clk(IMXCCMState *dev)
+{
+    uint32_t freq = 0;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    if ((s->ccmr & CCMR_PRCS) == 2) {
+        if (s->ccmr & CCMR_FPME) {
+            freq = CKIL_FREQ;
+            if (s->ccmr & CCMR_FPMF) {
+                freq *= 1024;
+            }
+        } 
+    } else {
+        freq = CKIH_FREQ;
+    }
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_mpll_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    freq = imx_ccm_calc_pll(s->mpctl, imx31_ccm_get_pll_ref_clk(dev));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_mcu_main_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    if ((s->ccmr & CCMR_MDS) || !(s->ccmr & CCMR_MPE)) {
+        freq = imx31_ccm_get_pll_ref_clk(dev);
+    } else {
+        freq = imx31_ccm_get_mpll_clk(dev);
+    }
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_mcu_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, MCU));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_hsp_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, HSP));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_hclk_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    freq = imx31_ccm_get_mcu_main_clk(dev) / (1 + EXTRACT(s->pdr0, MAX));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_ipg_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    freq = imx31_ccm_get_hclk_clk(dev) / (1 + EXTRACT(s->pdr0, IPG));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx31_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
+{
+    uint32_t freq = 0;
+
+    switch (clock) {
+    case NOCLK:
+        break;
+    case CLK_MCU:
+        freq = imx31_ccm_get_mcu_clk(dev);
+        break;
+    case CLK_HSP:
+        freq = imx31_ccm_get_hsp_clk(dev);
+        break;
+    case CLK_IPG:
+        freq = imx31_ccm_get_ipg_clk(dev);
+        break;
+    case CLK_32k:
+        freq = CKIL_FREQ;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
+                      TYPE_IMX31_CCM, __func__, clock);
+        break;
+    }
+
+    DPRINTF("Clock = %d) = %d\n", clock, freq);
+
+    return freq;
+}
+
+static void imx31_ccm_reset(DeviceState *dev)
+{
+    IMX31CCMState *s = IMX31_CCM(dev);
+
+    DPRINTF("()\n");
+
+    s->ccmr   = 0x074b0b7d;
+    s->pdr0   = 0xff870b48;
+    s->pdr1   = 0x49fcfe7f;
+    s->mpctl  = 0x04001800;
+    s->cgr[0] = s->cgr[1] = s->cgr[2] = 0xffffffff;
+    s->spctl  = 0x04043001;
+    s->pmcr0  = 0x80209828;
+    s->pmcr1  = 0x00aa0000;
+}
+
+static uint64_t imx31_ccm_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint32 value = 0;
+    IMX31CCMState *s = (IMX31CCMState *)opaque;
+
+    switch (offset >> 2) {
+    case 0: /* CCMR */
+        value = s->ccmr;
+        break;
+    case 1:
+        value = s->pdr0;
+        break;
+    case 2:
+        value = s->pdr1;
+        break;
+    case 4:
+        value = s->mpctl;
+        break;
+    case 6:
+        value = s->spctl;
+        break;
+    case 8:
+        value = s->cgr[0];
+        break;
+    case 9:
+        value = s->cgr[1];
+        break;
+    case 10:
+        value = s->cgr[2];
+        break;
+    case 18: /* LTR1 */
+        value = 0x00004040;
+        break;
+    case 23:
+        value = s->pmcr0;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_IMX31_CCM, __func__, offset);
+        break;
+    }
+
+    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx31_ccm_reg_name(offset >> 2),
+            value);
+
+    return (uint64_t)value;
+}
+
+static void imx31_ccm_write(void *opaque, hwaddr offset, uint64_t value,
+                            unsigned size)
+{
+    IMX31CCMState *s = (IMX31CCMState *)opaque;
+
+    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx31_ccm_reg_name(offset >> 2),
+            (uint32_t)value);
+
+    switch (offset >> 2) {
+    case 0:
+        s->ccmr = CCMR_FPMF | (value & 0x3b6fdfff);
+        break;
+    case 1:
+        s->pdr0 = value & 0xff9f3fff;
+        break;
+    case 2:
+        s->pdr1 = value;
+        break;
+    case 4:
+        s->mpctl = value & 0xbfff3fff;
+        break;
+    case 6:
+        s->spctl = value & 0xbfff3fff;
+        break;
+    case 8:
+        s->cgr[0] = value;
+        break;
+    case 9:
+        s->cgr[1] = value;
+        break;
+    case 10:
+        s->cgr[2] = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_IMX31_CCM, __func__, offset);
+        break;
+    }
+}
+
+static const struct MemoryRegionOps imx31_ccm_ops = {
+    .read = imx31_ccm_read,
+    .write = imx31_ccm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the real
+         * device but in practice there is no reason for a guest to access
+         * this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+
+};
+
+static void imx31_ccm_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX31CCMState *s = IMX31_CCM(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &imx31_ccm_ops, s,
+                          TYPE_IMX31_CCM, 0x1000);
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static void imx31_ccm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc  = DEVICE_CLASS(klass);
+    IMXCCMClass *ccm = IMX_CCM_CLASS(klass);
+
+    dc->reset = imx31_ccm_reset;
+    dc->vmsd  = &vmstate_imx31_ccm;
+    dc->desc  = "i.MX31 Clock Control Module";
+
+    ccm->get_clock_frequency = imx31_ccm_get_clock_frequency;
+}
+
+static const TypeInfo imx31_ccm_info = {
+    .name          = TYPE_IMX31_CCM,
+    .parent        = TYPE_IMX_CCM,
+    .instance_size = sizeof(IMX31CCMState),
+    .instance_init = imx31_ccm_init,
+    .class_init    = imx31_ccm_class_init,
+};
+
+static void imx31_ccm_register_types(void)
+{
+    type_register_static(&imx31_ccm_info);
+}
+
+type_init(imx31_ccm_register_types)
diff --git a/hw/misc/imx_ccm.c b/hw/misc/imx_ccm.c
index 1ac697a..0c9740b 100644
--- a/hw/misc/imx_ccm.c
+++ b/hw/misc/imx_ccm.c
@@ -7,15 +7,12 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  *
- * To get the timer frequencies right, we need to emulate at least part of
- * the CCM.
+ * This is an abstract base class used to get a common interface to
+ * retrieve the CCM frequencies from the various i.MX SOC.
  */
 
 #include "hw/misc/imx_ccm.h"
 
-#define CKIH_FREQ 26000000 /* 26MHz crystal input */
-#define CKIL_FREQ    32768 /* nominal 32khz clock */
-
 #ifndef DEBUG_IMX_CCM
 #define DEBUG_IMX_CCM 0
 #endif
@@ -28,51 +25,27 @@
         } \
     } while (0)
 
-static int imx_ccm_post_load(void *opaque, int version_id);
-
-static const VMStateDescription vmstate_imx_ccm = {
-    .name = TYPE_IMX_CCM,
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(ccmr, IMXCCMState),
-        VMSTATE_UINT32(pdr0, IMXCCMState),
-        VMSTATE_UINT32(pdr1, IMXCCMState),
-        VMSTATE_UINT32(mpctl, IMXCCMState),
-        VMSTATE_UINT32(spctl, IMXCCMState),
-        VMSTATE_UINT32_ARRAY(cgr, IMXCCMState, 3),
-        VMSTATE_UINT32(pmcr0, IMXCCMState),
-        VMSTATE_UINT32(pmcr1, IMXCCMState),
-        VMSTATE_UINT32(pll_refclk_freq, IMXCCMState),
-        VMSTATE_END_OF_LIST()
-    },
-    .post_load = imx_ccm_post_load,
-};
 
-uint32_t imx_ccm_get_clock_frequency(DeviceState *dev, IMXClk clock)
+uint32_t imx_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
-    IMXCCMState *s = IMX_CCM(dev);
+    uint32_t freq = 0;
+    IMXCCMClass *klass = IMX_GET_CLASS(dev);
 
-    switch (clock) {
-    case NOCLK:
-        return 0;
-    case CLK_MCU:
-        return s->mcu_clk_freq;
-    case CLK_HSP:
-        return s->hsp_clk_freq;
-    case CLK_IPG:
-        return s->ipg_clk_freq;
-    case CLK_32k:
-        return CKIL_FREQ;
+    if (klass->get_clock_frequency) {
+        freq = klass->get_clock_frequency(dev, clock);
     }
-    return 0;
+
+    DPRINTF("(clock = %d) = %d\n", clock, freq);
+
+    return freq;
 }
 
 /*
  * Calculate PLL output frequency
  */
-static uint32_t calc_pll(uint32_t pllreg, uint32_t base_freq)
+uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq)
 {
+    int32_t freq;
     int32_t mfn = MFN(pllreg);  /* Numerator */
     uint32_t mfi = MFI(pllreg); /* Integer part */
     uint32_t mfd = 1 + MFD(pllreg); /* Denominator */
@@ -81,186 +54,26 @@ static uint32_t calc_pll(uint32_t pllreg, uint32_t base_freq)
     if (mfi < 5) {
         mfi = 5;
     }
+
     /* mfn is 10-bit signed twos-complement */
     mfn <<= 32 - 10;
     mfn >>= 32 - 10;
 
-    return ((2 * (base_freq >> 10) * (mfi * mfd + mfn)) /
+    freq = ((2 * (base_freq >> 10) * (mfi * mfd + mfn)) /
             (mfd * pd)) << 10;
-}
-
-static void update_clocks(IMXCCMState *s)
-{
-    /*
-     * If we ever emulate more clocks, this should switch to a data-driven
-     * approach
-     */
-
-    if ((s->ccmr & CCMR_PRCS) == 2) {
-        s->pll_refclk_freq = CKIL_FREQ * 1024;
-    } else {
-        s->pll_refclk_freq = CKIH_FREQ;
-    }
-
-    /* ipg_clk_arm aka MCU clock */
-    if ((s->ccmr & CCMR_MDS) || !(s->ccmr & CCMR_MPE)) {
-        s->mcu_clk_freq = s->pll_refclk_freq;
-    } else {
-        s->mcu_clk_freq = calc_pll(s->mpctl, s->pll_refclk_freq);
-    }
-
-    /* High-speed clock */
-    s->hsp_clk_freq = s->mcu_clk_freq / (1 + EXTRACT(s->pdr0, HSP));
-    s->ipg_clk_freq = s->hsp_clk_freq / (1 + EXTRACT(s->pdr0, IPG));
-
-    DPRINTF("mcu %uMHz, HSP %uMHz, IPG %uHz\n",
-            s->mcu_clk_freq / 1000000,
-            s->hsp_clk_freq / 1000000,
-            s->ipg_clk_freq);
-}
-
-static void imx_ccm_reset(DeviceState *dev)
-{
-    IMXCCMState *s = IMX_CCM(dev);
-
-    s->ccmr = 0x074b0b7d;
-    s->pdr0 = 0xff870b48;
-    s->pdr1 = 0x49fcfe7f;
-    s->mpctl = PLL_PD(1) | PLL_MFD(0) | PLL_MFI(6) | PLL_MFN(0);
-    s->cgr[0] = s->cgr[1] = s->cgr[2] = 0xffffffff;
-    s->spctl = PLL_PD(1) | PLL_MFD(4) | PLL_MFI(0xc) | PLL_MFN(1);
-    s->pmcr0 = 0x80209828;
-
-    update_clocks(s);
-}
-
-static uint64_t imx_ccm_read(void *opaque, hwaddr offset,
-                                unsigned size)
-{
-    IMXCCMState *s = (IMXCCMState *)opaque;
 
-    DPRINTF("(offset=0x%" HWADDR_PRIx ")\n", offset);
-
-    switch (offset >> 2) {
-    case 0: /* CCMR */
-        DPRINTF(" ccmr = 0x%x\n", s->ccmr);
-        return s->ccmr;
-    case 1:
-        DPRINTF(" pdr0 = 0x%x\n", s->pdr0);
-        return s->pdr0;
-    case 2:
-        DPRINTF(" pdr1 = 0x%x\n", s->pdr1);
-        return s->pdr1;
-    case 4:
-        DPRINTF(" mpctl = 0x%x\n", s->mpctl);
-        return s->mpctl;
-    case 6:
-        DPRINTF(" spctl = 0x%x\n", s->spctl);
-        return s->spctl;
-    case 8:
-        DPRINTF(" cgr0 = 0x%x\n", s->cgr[0]);
-        return s->cgr[0];
-    case 9:
-        DPRINTF(" cgr1 = 0x%x\n", s->cgr[1]);
-        return s->cgr[1];
-    case 10:
-        DPRINTF(" cgr2 = 0x%x\n", s->cgr[2]);
-        return s->cgr[2];
-    case 18: /* LTR1 */
-        return 0x00004040;
-    case 23:
-        DPRINTF(" pcmr0 = 0x%x\n", s->pmcr0);
-        return s->pmcr0;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
-                      HWADDR_PRIx "\n", TYPE_IMX_CCM, __func__, offset);
-        return 0;
-    }
-}
-
-static void imx_ccm_write(void *opaque, hwaddr offset,
-                          uint64_t value, unsigned size)
-{
-    IMXCCMState *s = (IMXCCMState *)opaque;
-
-    DPRINTF("(offset=0x%" HWADDR_PRIx ", value = 0x%x)\n",
-            offset, (unsigned int)value);
-
-    switch (offset >> 2) {
-    case 0:
-        s->ccmr = CCMR_FPMF | (value & 0x3b6fdfff);
-        break;
-    case 1:
-        s->pdr0 = value & 0xff9f3fff;
-        break;
-    case 2:
-        s->pdr1 = value;
-        break;
-    case 4:
-        s->mpctl = value & 0xbfff3fff;
-        break;
-    case 6:
-        s->spctl = value & 0xbfff3fff;
-        break;
-    case 8:
-        s->cgr[0] = value;
-        return;
-    case 9:
-        s->cgr[1] = value;
-        return;
-    case 10:
-        s->cgr[2] = value;
-        return;
-
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
-                      HWADDR_PRIx "\n", TYPE_IMX_CCM, __func__, offset);
-        return;
-    }
-    update_clocks(s);
-}
-
-static const struct MemoryRegionOps imx_ccm_ops = {
-    .read = imx_ccm_read,
-    .write = imx_ccm_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static int imx_ccm_init(SysBusDevice *dev)
-{
-    IMXCCMState *s = IMX_CCM(dev);
-
-    memory_region_init_io(&s->iomem, OBJECT(dev), &imx_ccm_ops, s,
-                          TYPE_IMX_CCM, 0x1000);
-    sysbus_init_mmio(dev, &s->iomem);
-
-    return 0;
-}
-
-static int imx_ccm_post_load(void *opaque, int version_id)
-{
-    IMXCCMState *s = (IMXCCMState *)opaque;
-
-    update_clocks(s);
-    return 0;
-}
-
-static void imx_ccm_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *sbc = SYS_BUS_DEVICE_CLASS(klass);
+    DPRINTF("(pllreg = 0x%08x, base_freq = %d) = %d\n", pllreg, base_freq,
+            freq);
 
-    sbc->init = imx_ccm_init;
-    dc->reset = imx_ccm_reset;
-    dc->vmsd = &vmstate_imx_ccm;
-    dc->desc = "i.MX Clock Control Module";
+    return freq;
 }
 
 static const TypeInfo imx_ccm_info = {
-    .name = TYPE_IMX_CCM,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .name          = TYPE_IMX_CCM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(IMXCCMState),
-    .class_init = imx_ccm_class_init,
+    .class_size    = sizeof(IMXCCMClass),
+    .abstract      = true,
 };
 
 static void imx_ccm_register_types(void)
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 73f50c6..5c62fde 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -19,7 +19,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/imx_avic.h"
-#include "hw/misc/imx_ccm.h"
+#include "hw/misc/imx31_ccm.h"
 #include "hw/char/imx_serial.h"
 #include "hw/timer/imx_gpt.h"
 #include "hw/timer/imx_epit.h"
@@ -44,7 +44,7 @@ typedef struct FslIMX25State {
     /*< public >*/
     ARMCPU         cpu;
     IMXAVICState   avic;
-    IMXCCMState    ccm;
+    IMX31CCMState  ccm;
     IMXSerialState uart[FSL_IMX25_NUM_UARTS];
     IMXGPTState    gpt[FSL_IMX25_NUM_GPTS];
     IMXEPITState   epit[FSL_IMX25_NUM_EPITS];
diff --git a/include/hw/arm/fsl-imx31.h b/include/hw/arm/fsl-imx31.h
index 5e8f795..d408abb 100644
--- a/include/hw/arm/fsl-imx31.h
+++ b/include/hw/arm/fsl-imx31.h
@@ -19,7 +19,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/imx_avic.h"
-#include "hw/misc/imx_ccm.h"
+#include "hw/misc/imx31_ccm.h"
 #include "hw/char/imx_serial.h"
 #include "hw/timer/imx_gpt.h"
 #include "hw/timer/imx_epit.h"
@@ -42,7 +42,7 @@ typedef struct FslIMX31State {
     /*< public >*/
     ARMCPU         cpu;
     IMXAVICState   avic;
-    IMXCCMState    ccm;
+    IMX31CCMState  ccm;
     IMXSerialState uart[FSL_IMX31_NUM_UARTS];
     IMXGPTState    gpt;
     IMXEPITState   epit[FSL_IMX31_NUM_EPITS];
diff --git a/include/hw/misc/imx31_ccm.h b/include/hw/misc/imx31_ccm.h
new file mode 100644
index 0000000..fcae36d
--- /dev/null
+++ b/include/hw/misc/imx31_ccm.h
@@ -0,0 +1,66 @@
+/*
+ * IMX31 Clock Control Module
+ *
+ * Copyright (C) 2012 NICTA
+ * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX31_CCM_H
+#define IMX31_CCM_H
+
+#include "hw/misc/imx_ccm.h"
+
+/* CCMR */
+#define CCMR_FPME    (1<<0)
+#define CCMR_MPE     (1<<3)
+#define CCMR_MDS     (1<<7)
+#define CCMR_FPMF    (1<<26)
+#define CCMR_PRCS    (3<<1)
+
+#define PMCR0_DFSUP1 (1<<31)
+
+/* PDR0 */
+#define PDR0_MCU_PODF_SHIFT (0)
+#define PDR0_MCU_PODF_MASK (0x7)
+#define PDR0_MAX_PODF_SHIFT (3)
+#define PDR0_MAX_PODF_MASK (0x7)
+#define PDR0_IPG_PODF_SHIFT (6)
+#define PDR0_IPG_PODF_MASK (0x3)
+#define PDR0_NFC_PODF_SHIFT (8)
+#define PDR0_NFC_PODF_MASK (0x7)
+#define PDR0_HSP_PODF_SHIFT (11)
+#define PDR0_HSP_PODF_MASK (0x7)
+#define PDR0_PER_PODF_SHIFT (16)
+#define PDR0_PER_PODF_MASK (0x1f)
+#define PDR0_CSI_PODF_SHIFT (23)
+#define PDR0_CSI_PODF_MASK (0x1ff)
+
+#define EXTRACT(value, name) (((value) >> PDR0_##name##_PODF_SHIFT) \
+                              & PDR0_##name##_PODF_MASK)
+#define INSERT(value, name) (((value) & PDR0_##name##_PODF_MASK) << \
+                             PDR0_##name##_PODF_SHIFT)
+
+#define TYPE_IMX31_CCM "imx31.ccm"
+#define IMX31_CCM(obj) OBJECT_CHECK(IMX31CCMState, (obj), TYPE_IMX31_CCM)
+
+typedef struct IMX31CCMState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+    uint32_t ccmr;
+    uint32_t pdr0;
+    uint32_t pdr1;
+    uint32_t mpctl;
+    uint32_t spctl;
+    uint32_t cgr[3];
+    uint32_t pmcr0;
+    uint32_t pmcr1;
+} IMX31CCMState;
+
+#endif /* IMX31_CCM_H */
diff --git a/include/hw/misc/imx_ccm.h b/include/hw/misc/imx_ccm.h
index 09f6248..5c4b795 100644
--- a/include/hw/misc/imx_ccm.h
+++ b/include/hw/misc/imx_ccm.h
@@ -1,5 +1,5 @@
 /*
- * IMX31 Clock Control Module
+ * IMX Clock Control Module base class
  *
  * Copyright (C) 2012 NICTA
  * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
@@ -13,33 +13,7 @@
 
 #include "hw/sysbus.h"
 
-/* CCMR */
-#define CCMR_FPME (1<<0)
-#define CCMR_MPE  (1<<3)
-#define CCMR_MDS  (1<<7)
-#define CCMR_FPMF (1<<26)
-#define CCMR_PRCS (3<<1)
-
-/* PDR0 */
-#define PDR0_MCU_PODF_SHIFT (0)
-#define PDR0_MCU_PODF_MASK (0x7)
-#define PDR0_MAX_PODF_SHIFT (3)
-#define PDR0_MAX_PODF_MASK (0x7)
-#define PDR0_IPG_PODF_SHIFT (6)
-#define PDR0_IPG_PODF_MASK (0x3)
-#define PDR0_NFC_PODF_SHIFT (8)
-#define PDR0_NFC_PODF_MASK (0x7)
-#define PDR0_HSP_PODF_SHIFT (11)
-#define PDR0_HSP_PODF_MASK (0x7)
-#define PDR0_PER_PODF_SHIFT (16)
-#define PDR0_PER_PODF_MASK (0x1f)
-#define PDR0_CSI_PODF_SHIFT (23)
-#define PDR0_CSI_PODF_MASK (0x1ff)
-
-#define EXTRACT(value, name) (((value) >> PDR0_##name##_PODF_SHIFT) \
-                              & PDR0_##name##_PODF_MASK)
-#define INSERT(value, name) (((value) & PDR0_##name##_PODF_MASK) << \
-                             PDR0_##name##_PODF_SHIFT)
+#define CKIL_FREQ 32768 /* nominal 32khz clock */
 
 /* PLL control registers */
 #define PD(v) (((v) >> 26) & 0xf)
@@ -53,39 +27,44 @@
 #define PLL_MFN(x)              (((x) & 0x3ff) << 0)
 
 #define TYPE_IMX_CCM "imx.ccm"
-#define IMX_CCM(obj) OBJECT_CHECK(IMXCCMState, (obj), TYPE_IMX_CCM)
+#define IMX_CCM(obj) \
+     OBJECT_CHECK(IMXCCMState, (obj), TYPE_IMX_CCM)
+#define IMX_CCM_CLASS(klass) \
+     OBJECT_CLASS_CHECK(IMXCCMClass, (klass), TYPE_IMX_CCM)
+#define IMX_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(IMXCCMClass, (obj), TYPE_IMX_CCM)
 
 typedef struct IMXCCMState {
     /* <private> */
     SysBusDevice parent_obj;
 
     /* <public> */
-    MemoryRegion iomem;
 
-    uint32_t ccmr;
-    uint32_t pdr0;
-    uint32_t pdr1;
-    uint32_t mpctl;
-    uint32_t spctl;
-    uint32_t cgr[3];
-    uint32_t pmcr0;
-    uint32_t pmcr1;
-
-    /* Frequencies precalculated on register changes */
-    uint32_t pll_refclk_freq;
-    uint32_t mcu_clk_freq;
-    uint32_t hsp_clk_freq;
-    uint32_t ipg_clk_freq;
 } IMXCCMState;
 
 typedef enum  {
     NOCLK,
+    CLK_MPLL,
+    CLK_UPLL,
     CLK_MCU,
     CLK_HSP,
+    CLK_MAX,
+    CLK_AHB,
     CLK_IPG,
+    CLK_PER,
     CLK_32k
 } IMXClk;
 
-uint32_t imx_ccm_get_clock_frequency(DeviceState *s, IMXClk clock);
+typedef struct IMXCCMClass {
+    /* <private> */
+    SysBusDeviceClass parent_class;
+
+    /* <public> */
+    uint32_t (*get_clock_frequency)(IMXCCMState *s, IMXClk clk);
+} IMXCCMClass;
+
+uint32_t imx_ccm_calc_pll(uint32_t pllreg, uint32_t base_freq);
+
+uint32_t imx_ccm_get_clock_frequency(IMXCCMState *s, IMXClk clock);
 
 #endif /* IMX_CCM_H */
diff --git a/include/hw/timer/imx_epit.h b/include/hw/timer/imx_epit.h
index c5328ae..0730ac3 100644
--- a/include/hw/timer/imx_epit.h
+++ b/include/hw/timer/imx_epit.h
@@ -31,6 +31,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/misc/imx_ccm.h"
 
 /*
  * EPIT: Enhanced periodic interrupt timer
@@ -63,8 +64,8 @@ typedef struct IMXEPITState{
     /*< public >*/
     ptimer_state *timer_reload;
     ptimer_state *timer_cmp;
-    MemoryRegion iomem;
-    DeviceState *ccm;
+    MemoryRegion  iomem;
+    IMXCCMState  *ccm;
 
     uint32_t cr;
     uint32_t sr;
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index 3f02d3b..461adbe 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -31,6 +31,7 @@
 
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/misc/imx_ccm.h"
 
 /*
  * GPT : General purpose timer
@@ -82,8 +83,8 @@ typedef struct IMXGPTState{
 
     /*< public >*/
     ptimer_state *timer;
-    MemoryRegion iomem;
-    DeviceState *ccm;
+    MemoryRegion  iomem;
+    IMXCCMState  *ccm;
 
     uint32_t cr;
     uint32_t pr;
-- 
2.5.0

