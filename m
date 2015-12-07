Received: by 10.182.158.201 with SMTP id ww9csp2608346obb;
        Mon, 7 Dec 2015 14:55:35 -0800 (PST)
X-Received: by 10.55.221.4 with SMTP id n4mr379591qki.5.1449528934463;
        Mon, 07 Dec 2015 14:55:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a192si331394qkb.70.2015.12.07.14.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Dec 2015 14:55:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56856 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a64gw-0004aX-67
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 17:55:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64fA-0001Rr-2a
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a64f7-000511-Ux
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 17:53:43 -0500
Received: from zose-mta05.web4all.fr ([185.49.20.50]:52361)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a64f7-00050u-Ma; Mon, 07 Dec 2015 17:53:41 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 292E2447AD;
	Mon,  7 Dec 2015 23:53:41 +0100 (CET)
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id q6kmyFTazw25; Mon,  7 Dec 2015 23:53:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 467DC447B0;
	Mon,  7 Dec 2015 23:53:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-05.w4a.fr
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id R_H_5SxrS_qb; Mon,  7 Dec 2015 23:53:40 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta05.web4all.fr (Postfix) with ESMTPSA id CE940447AD;
	Mon,  7 Dec 2015 23:53:39 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Mon,  7 Dec 2015 23:53:37 +0100
Message-Id: <2c0cf90be767bfc8520661eca891ab22c61f18fe.1449528242.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449528242.git.jcd@tribudubois.net>
References: <cover.1449528242.git.jcd@tribudubois.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.50
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-arm] [PATCH v6 4/5] i.MX: Add an i.MX25 specific CCM
	class/instance.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JwVy8+Q+mdaj

With this CCM, i.MX25 timer is accurate with "real world time".

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
Reviewed-by Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

Changes since v1:
 * rework loging to match other i.MX drivers

Changes since v2:
 * We moved to an inheritance QOM scheme

Changes since v3:
 * Rework logging based on comments.

Changes since v4:
 * Improve debug logging.

Changes since v5:
 * move object state to uint32 array.

 hw/arm/fsl-imx25.c          |   2 +-
 hw/misc/Makefile.objs       |   1 +
 hw/misc/imx25_ccm.c         | 341 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  79 ++++++++++
 5 files changed, 424 insertions(+), 3 deletions(-)
 create mode 100644 hw/misc/imx25_ccm.c
 create mode 100644 include/hw/misc/imx25_ccm.h

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 9f302ed..36818ee 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -38,7 +38,7 @@ static void fsl_imx25_init(Object *obj)
     object_initialize(&s->avic, sizeof(s->avic), TYPE_IMX_AVIC);
     qdev_set_parent_bus(DEVICE(&s->avic), sysbus_get_default());
 
-    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX31_CCM);
+    object_initialize(&s->ccm, sizeof(s->ccm), TYPE_IMX25_CCM);
     qdev_set_parent_bus(DEVICE(&s->ccm), sysbus_get_default());
 
     for (i = 0; i < FSL_IMX25_NUM_UARTS; i++) {
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index c77f3e3..8a235df 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -27,6 +27,7 @@ obj-$(CONFIG_ECCMEMCTL) += eccmemctl.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_pmu.o
 obj-$(CONFIG_IMX) += imx_ccm.o
 obj-$(CONFIG_IMX) += imx31_ccm.o
+obj-$(CONFIG_IMX) += imx25_ccm.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx25_ccm.c b/hw/misc/imx25_ccm.c
new file mode 100644
index 0000000..23759ca
--- /dev/null
+++ b/hw/misc/imx25_ccm.c
@@ -0,0 +1,341 @@
+/*
+ * IMX25 Clock Control Module
+ *
+ * Copyright (C) 2012 NICTA
+ * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ * To get the timer frequencies right, we need to emulate at least part of
+ * the CCM.
+ */
+
+#include "hw/misc/imx25_ccm.h"
+
+#ifndef DEBUG_IMX25_CCM
+#define DEBUG_IMX25_CCM 0
+#endif
+
+#define DPRINTF(fmt, args...) \
+    do { \
+        if (DEBUG_IMX25_CCM) { \
+            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX25_CCM, \
+                                             __func__, ##args); \
+        } \
+    } while (0)
+
+static char const *imx25_ccm_reg_name(uint32_t reg)
+{
+    static char unknown[20];
+
+    switch (reg) {
+    case IMX25_CCM_MPCTL_REG:
+        return "mpctl";
+    case IMX25_CCM_UPCTL_REG:
+        return "upctl";
+    case IMX25_CCM_CCTL_REG:
+        return "cctl";
+    case IMX25_CCM_CGCR0_REG:
+        return "cgcr0";
+    case IMX25_CCM_CGCR1_REG:
+        return "cgcr1";
+    case IMX25_CCM_CGCR2_REG:
+        return "cgcr2";
+    case IMX25_CCM_PCDR0_REG:
+        return "pcdr0";
+    case IMX25_CCM_PCDR1_REG:
+        return "pcdr1";
+    case IMX25_CCM_PCDR2_REG:
+        return "pcdr2";
+    case IMX25_CCM_PCDR3_REG:
+        return "pcdr3";
+    case IMX25_CCM_RCSR_REG:
+        return "rcsr";
+    case IMX25_CCM_CRDR_REG:
+        return "crdr";
+    case IMX25_CCM_DCVR0_REG:
+        return "dcvr0";
+    case IMX25_CCM_DCVR1_REG:
+        return "dcvr1";
+    case IMX25_CCM_DCVR2_REG:
+        return "dcvr2";
+    case IMX25_CCM_DCVR3_REG:
+        return "dcvr3";
+    case IMX25_CCM_LTR0_REG:
+        return "ltr0";
+    case IMX25_CCM_LTR1_REG:
+        return "ltr1";
+    case IMX25_CCM_LTR2_REG:
+        return "ltr2";
+    case IMX25_CCM_LTR3_REG:
+        return "ltr3";
+    case IMX25_CCM_LTBR0_REG:
+        return "ltbr0";
+    case IMX25_CCM_LTBR1_REG:
+        return "ltbr1";
+    case IMX25_CCM_PMCR0_REG:
+        return "pmcr0";
+    case IMX25_CCM_PMCR1_REG:
+        return "pmcr1";
+    case IMX25_CCM_PMCR2_REG:
+        return "pmcr2";
+    case IMX25_CCM_MCR_REG:
+        return "mcr";
+    case IMX25_CCM_LPIMR0_REG:
+        return "lpimr0";
+    case IMX25_CCM_LPIMR1_REG:
+        return "lpimr1";
+    default:
+        sprintf(unknown, "[%d ?]", reg);
+        return unknown;
+    }
+}
+#define CKIH_FREQ 24000000 /* 24MHz crystal input */
+
+static const VMStateDescription vmstate_imx25_ccm = {
+    .name = TYPE_IMX25_CCM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, IMX25CCMState, IMX25_CCM_MAX_REG),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    if (EXTRACT(s->reg[IMX25_CCM_CCTL_REG], MPLL_BYPASS)) {
+        freq = CKIH_FREQ;
+    } else {
+        freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_MPCTL_REG], CKIH_FREQ);
+    }
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx25_ccm_get_upll_clk(IMXCCMState *dev)
+{
+    uint32_t freq = 0;
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    if (!EXTRACT(s->reg[IMX25_CCM_CCTL_REG], UPLL_DIS)) {
+        freq = imx_ccm_calc_pll(s->reg[IMX25_CCM_UPCTL_REG], CKIH_FREQ);
+    }
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    freq = imx25_ccm_get_mpll_clk(dev);
+
+    if (EXTRACT(s->reg[IMX25_CCM_CCTL_REG], ARM_SRC)) {
+        freq = (freq * 3 / 4);
+    }
+
+    freq = freq / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], ARM_CLK_DIV));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx25_ccm_get_ahb_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    freq = imx25_ccm_get_mcu_clk(dev)
+           / (1 + EXTRACT(s->reg[IMX25_CCM_CCTL_REG], AHB_CLK_DIV));
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
+{
+    uint32_t freq;
+
+    freq = imx25_ccm_get_ahb_clk(dev) / 2;
+
+    DPRINTF("freq = %d\n", freq);
+
+    return freq;
+}
+
+static uint32_t imx25_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
+{
+    uint32_t freq = 0;
+    DPRINTF("Clock = %d)\n", clock);
+
+    switch (clock) {
+    case NOCLK:
+        break;
+    case CLK_MPLL:
+        freq = imx25_ccm_get_mpll_clk(dev);
+        break;
+    case CLK_UPLL:
+        freq = imx25_ccm_get_upll_clk(dev);
+        break;
+    case CLK_MCU:
+        freq = imx25_ccm_get_mcu_clk(dev);
+        break;
+    case CLK_AHB:
+        freq = imx25_ccm_get_ahb_clk(dev);
+        break;
+    case CLK_IPG:
+        freq = imx25_ccm_get_ipg_clk(dev);
+        break;
+    case CLK_32k:
+        freq = CKIL_FREQ;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
+                      TYPE_IMX25_CCM, __func__, clock);
+        break;
+    }
+
+    DPRINTF("Clock = %d) = %d\n", clock, freq);
+
+    return freq;
+}
+
+static void imx25_ccm_reset(DeviceState *dev)
+{
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    DPRINTF("\n");
+
+    memset(s->reg, 0, IMX25_CCM_MAX_REG * sizeof(uint32_t));
+    s->reg[IMX25_CCM_MPCTL_REG] = 0x800b2c01;
+    s->reg[IMX25_CCM_UPCTL_REG] = 0x84042800;
+    /* 
+     * The value below gives:
+     * CPU = 133 MHz, AHB = 66,5 MHz, IPG = 33 MHz. 
+     */
+    s->reg[IMX25_CCM_CCTL_REG]  = 0xd0030000;
+    s->reg[IMX25_CCM_CGCR0_REG] = 0x028A0100;
+    s->reg[IMX25_CCM_CGCR1_REG] = 0x04008100;
+    s->reg[IMX25_CCM_CGCR2_REG] = 0x00000438;
+    s->reg[IMX25_CCM_PCDR0_REG] = 0x01010101;
+    s->reg[IMX25_CCM_PCDR1_REG] = 0x01010101;
+    s->reg[IMX25_CCM_PCDR2_REG] = 0x01010101;
+    s->reg[IMX25_CCM_PCDR3_REG] = 0x01010101;
+    s->reg[IMX25_CCM_PMCR0_REG] = 0x00A00000;
+    s->reg[IMX25_CCM_PMCR1_REG] = 0x0000A030;
+    s->reg[IMX25_CCM_PMCR2_REG] = 0x0000A030;
+    s->reg[IMX25_CCM_MCR_REG]   = 0x43000000;
+
+    /*
+     * default boot will change the reset values to allow:
+     * CPU = 399 MHz, AHB = 133 MHz, IPG = 66,5 MHz. 
+     * For some reason, this doesn't work. With the value below, linux
+     * detects a 88 MHz IPG CLK instead of 66,5 MHz.
+    s->reg[IMX25_CCM_CCTL_REG]  = 0x20032000;
+     */
+}
+
+static uint64_t imx25_ccm_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint32 value = 0;
+    IMX25CCMState *s = (IMX25CCMState *)opaque;
+
+    if (offset < 0x70) {
+        value = s->reg[offset >> 2];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_IMX25_CCM, __func__, offset);
+    }
+
+    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
+            value);
+
+    return value;
+}
+
+static void imx25_ccm_write(void *opaque, hwaddr offset, uint64_t value,
+                            unsigned size)
+{
+    IMX25CCMState *s = (IMX25CCMState *)opaque;
+
+    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx25_ccm_reg_name(offset >> 2),
+            (uint32_t)value);
+
+    if (offset < 0x70) {
+        /*
+         * We will do a better implementation later. In particular some bits
+         * cannot be written to.
+         */
+        s->reg[offset >> 2] = value;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_IMX25_CCM, __func__, offset);
+    }
+}
+
+static const struct MemoryRegionOps imx25_ccm_ops = {
+    .read = imx25_ccm_read,
+    .write = imx25_ccm_write,
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
+};
+
+static void imx25_ccm_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX25CCMState *s = IMX25_CCM(obj);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &imx25_ccm_ops, s,
+                          TYPE_IMX25_CCM, 0x1000);
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static void imx25_ccm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    IMXCCMClass *ccm = IMX_CCM_CLASS(klass);
+
+    dc->reset = imx25_ccm_reset;
+    dc->vmsd = &vmstate_imx25_ccm;
+    dc->desc = "i.MX25 Clock Control Module";
+
+    ccm->get_clock_frequency = imx25_ccm_get_clock_frequency;
+}
+
+static const TypeInfo imx25_ccm_info = {
+    .name          = TYPE_IMX25_CCM,
+    .parent        = TYPE_IMX_CCM,
+    .instance_size = sizeof(IMX25CCMState),
+    .instance_init = imx25_ccm_init,
+    .class_init    = imx25_ccm_class_init,
+};
+
+static void imx25_ccm_register_types(void)
+{
+    type_register_static(&imx25_ccm_info);
+}
+
+type_init(imx25_ccm_register_types)
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 5c62fde..d0e8e9d 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -19,7 +19,7 @@
 
 #include "hw/arm/arm.h"
 #include "hw/intc/imx_avic.h"
-#include "hw/misc/imx31_ccm.h"
+#include "hw/misc/imx25_ccm.h"
 #include "hw/char/imx_serial.h"
 #include "hw/timer/imx_gpt.h"
 #include "hw/timer/imx_epit.h"
@@ -44,7 +44,7 @@ typedef struct FslIMX25State {
     /*< public >*/
     ARMCPU         cpu;
     IMXAVICState   avic;
-    IMX31CCMState  ccm;
+    IMX25CCMState  ccm;
     IMXSerialState uart[FSL_IMX25_NUM_UARTS];
     IMXGPTState    gpt[FSL_IMX25_NUM_GPTS];
     IMXEPITState   epit[FSL_IMX25_NUM_EPITS];
diff --git a/include/hw/misc/imx25_ccm.h b/include/hw/misc/imx25_ccm.h
new file mode 100644
index 0000000..296321c
--- /dev/null
+++ b/include/hw/misc/imx25_ccm.h
@@ -0,0 +1,79 @@
+/*
+ * IMX25 Clock Control Module
+ *
+ * Copyright (C) 2012 NICTA
+ * Updated by Jean-Christophe Dubois <jcd@tribudubois.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX25_CCM_H
+#define IMX25_CCM_H
+
+#include "hw/misc/imx_ccm.h"
+
+#define IMX25_CCM_MPCTL_REG  0
+#define IMX25_CCM_UPCTL_REG  1
+#define IMX25_CCM_CCTL_REG   2
+#define IMX25_CCM_CGCR0_REG  3
+#define IMX25_CCM_CGCR1_REG  4
+#define IMX25_CCM_CGCR2_REG  5
+#define IMX25_CCM_PCDR0_REG  6
+#define IMX25_CCM_PCDR1_REG  7
+#define IMX25_CCM_PCDR2_REG  8
+#define IMX25_CCM_PCDR3_REG  9
+#define IMX25_CCM_RCSR_REG   10
+#define IMX25_CCM_CRDR_REG   11
+#define IMX25_CCM_DCVR0_REG  12
+#define IMX25_CCM_DCVR1_REG  13
+#define IMX25_CCM_DCVR2_REG  14
+#define IMX25_CCM_DCVR3_REG  15
+#define IMX25_CCM_LTR0_REG   16
+#define IMX25_CCM_LTR1_REG   17
+#define IMX25_CCM_LTR2_REG   18
+#define IMX25_CCM_LTR3_REG   19
+#define IMX25_CCM_LTBR0_REG  20
+#define IMX25_CCM_LTBR1_REG  21
+#define IMX25_CCM_PMCR0_REG  22
+#define IMX25_CCM_PMCR1_REG  23
+#define IMX25_CCM_PMCR2_REG  24
+#define IMX25_CCM_MCR_REG    25
+#define IMX25_CCM_LPIMR0_REG 26
+#define IMX25_CCM_LPIMR1_REG 27
+#define IMX25_CCM_MAX_REG    28
+
+/* CCTL */
+#define CCTL_ARM_CLK_DIV_SHIFT (30)
+#define CCTL_ARM_CLK_DIV_MASK  (0x3)
+#define CCTL_AHB_CLK_DIV_SHIFT (28)
+#define CCTL_AHB_CLK_DIV_MASK  (0x3)
+#define CCTL_MPLL_BYPASS_SHIFT (22)
+#define CCTL_MPLL_BYPASS_MASK  (0x1)
+#define CCTL_USB_DIV_SHIFT     (16)
+#define CCTL_USB_DIV_MASK      (0x3F)
+#define CCTL_ARM_SRC_SHIFT     (13)
+#define CCTL_ARM_SRC_MASK      (0x1)
+#define CCTL_UPLL_DIS_SHIFT    (23)
+#define CCTL_UPLL_DIS_MASK     (0x1)
+
+#define EXTRACT(value, name) (((value) >> CCTL_##name##_SHIFT) \
+                              & CCTL_##name##_MASK)
+#define INSERT(value, name) (((value) & CCTL_##name##_MASK) << \
+                             CCTL_##name##_SHIFT)
+
+#define TYPE_IMX25_CCM "imx25.ccm"
+#define IMX25_CCM(obj) OBJECT_CHECK(IMX25CCMState, (obj), TYPE_IMX25_CCM)
+
+typedef struct IMX25CCMState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+    uint32_t reg[IMX25_CCM_MAX_REG];
+
+} IMX25CCMState;
+
+#endif /* IMX25_CCM_H */
-- 
2.5.0

