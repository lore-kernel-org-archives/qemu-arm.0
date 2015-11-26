Received: by 10.182.158.201 with SMTP id ww9csp450622obb;
        Wed, 25 Nov 2015 23:18:10 -0800 (PST)
X-Received: by 10.140.81.71 with SMTP id e65mr31476138qgd.27.1448522290036;
        Wed, 25 Nov 2015 23:18:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si25074321qka.44.2015.11.25.23.18.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2015 23:18:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a1qoj-00064L-Qm
	for alex.bennee@linaro.org; Thu, 26 Nov 2015 02:18:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1qnA-0003Zl-Ru
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:16:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a1qn7-0005Hz-JG
	for qemu-devel@nongnu.org; Thu, 26 Nov 2015 02:16:32 -0500
Received: from zose-mta03.web4all.fr ([185.49.20.44]:59072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a1qn2-0005Ep-BS; Thu, 26 Nov 2015 02:16:24 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id 6A77D4186F;
	Thu, 26 Nov 2015 08:16:23 +0100 (CET)
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id z0ecm4SWGb_W; Thu, 26 Nov 2015 08:16:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta03.web4all.fr (Postfix) with ESMTP id 93B4441889;
	Thu, 26 Nov 2015 08:16:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-03.w4a.fr
Received: from zose-mta03.web4all.fr ([127.0.0.1])
	by localhost (zose-mta03.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id cQ4ce90UjB4E; Thu, 26 Nov 2015 08:16:22 +0100 (CET)
Received: from localhost.localdomain (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta03.web4all.fr (Postfix) with ESMTPSA id 2AA684186F;
	Thu, 26 Nov 2015 08:16:22 +0100 (CET)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org
Date: Thu, 26 Nov 2015 08:16:20 +0100
Message-Id: <d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1448521064.git.jcd@tribudubois.net>
References: <cover.1448521064.git.jcd@tribudubois.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.44
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [Qemu-devel] [PATCH v4 3/3] i.MX: Add an i.MX25 specific CCM
	class/instance.
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
X-TUID: UvAnVIdKOjAI

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---

Changes since v1:
 * rework loging to match other i.MX drivers

Changes since v2:
 * We moved to an inheritance QOM scheme

Changes since v3:
 * Rework logging based on comments.

 hw/arm/fsl-imx25.c          |   2 +-
 hw/misc/Makefile.objs       |   1 +
 hw/misc/imx25_ccm.c         | 276 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  59 ++++++++++
 5 files changed, 339 insertions(+), 3 deletions(-)
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
index 0000000..d0fe017
--- /dev/null
+++ b/hw/misc/imx25_ccm.c
@@ -0,0 +1,276 @@
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
+#define CKIH_FREQ 24000000 /* 24MHz crystal input */
+
+static const VMStateDescription vmstate_imx25_ccm = {
+    .name = TYPE_IMX25_CCM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(mpctl, IMX25CCMState),
+        VMSTATE_UINT32(upctl, IMX25CCMState),
+        VMSTATE_UINT32(cctl, IMX25CCMState),
+        VMSTATE_UINT32_ARRAY(cgcr, IMX25CCMState, 3),
+        VMSTATE_UINT32_ARRAY(pcdr, IMX25CCMState, 4),
+        VMSTATE_UINT32(rcsr, IMX25CCMState),
+        VMSTATE_UINT32(crdr, IMX25CCMState),
+        VMSTATE_UINT32_ARRAY(dcvr, IMX25CCMState, 4),
+        VMSTATE_UINT32_ARRAY(ltr, IMX25CCMState, 4),
+        VMSTATE_UINT32_ARRAY(ltbr, IMX25CCMState, 2),
+        VMSTATE_UINT32_ARRAY(pmcr, IMX25CCMState, 3),
+        VMSTATE_UINT32(mcr, IMX25CCMState),
+        VMSTATE_UINT32_ARRAY(lpimr, IMX25CCMState, 2),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static uint32_t imx25_ccm_get_mpll_clk(IMXCCMState *dev)
+{
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    DPRINTF("()\n");
+
+    if (EXTRACT(s->cctl, MPLL_BYPASS)) {
+        return CKIH_FREQ;
+    } else {
+        return imx_ccm_calc_pll(s->mpctl, CKIH_FREQ);
+    }
+}
+
+static uint32_t imx25_ccm_get_upll_clk(IMXCCMState *dev)
+{
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    DPRINTF("()\n");
+
+    return imx_ccm_calc_pll(s->upctl, CKIH_FREQ);
+}
+
+static uint32_t imx25_ccm_get_mcu_clk(IMXCCMState *dev)
+{
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    DPRINTF("()\n");
+
+    if (EXTRACT(s->cctl, ARM_SRC)) {
+        return (imx25_ccm_get_mpll_clk(dev) * 3 / 4) /
+               (1 + EXTRACT(s->cctl, ARM_CLK_DIV));
+    } else {
+        return imx25_ccm_get_mpll_clk(dev) /
+               (1 + EXTRACT(s->cctl, ARM_CLK_DIV));
+    }
+}
+
+static uint32_t imx25_ccm_get_ahb_clk(IMXCCMState *dev)
+{
+    IMX25CCMState *s = IMX25_CCM(dev);
+
+    DPRINTF("()\n");
+
+    return imx25_ccm_get_mcu_clk(dev) / (1 + EXTRACT(s->cctl, AHB_CLK_DIV));
+}
+
+static uint32_t imx25_ccm_get_ipg_clk(IMXCCMState *dev)
+{
+    DPRINTF("()\n");
+
+    return imx25_ccm_get_ahb_clk(dev) / 2;
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
+    s->mpctl = 0x800b2c01;
+    s->upctl = 0x84002800;
+    s->cctl = 0x40030000;
+    s->cgcr[0] = 0x028A0100;
+    s->cgcr[1] = 0x04008100;
+    s->cgcr[2] = 0x00000438;
+    s->pcdr[0] = 0x01010101;
+    s->pcdr[1] = 0x01010101;
+    s->pcdr[2] = 0x01010101;
+    s->pcdr[3] = 0x01010101;
+    s->rcsr = 0;
+    s->crdr = 0;
+    s->dcvr[0] = 0;
+    s->dcvr[1] = 0;
+    s->dcvr[2] = 0;
+    s->dcvr[3] = 0;
+    s->ltr[0] = 0;
+    s->ltr[1] = 0;
+    s->ltr[2] = 0;
+    s->ltr[3] = 0;
+    s->ltbr[0] = 0;
+    s->ltbr[1] = 0;
+    s->pmcr[0] = 0x00A00000;
+    s->pmcr[1] = 0x0000A030;
+    s->pmcr[2] = 0x0000A030;
+    s->mcr = 0x43000000;
+    s->lpimr[0] = 0;
+    s->lpimr[1] = 0;
+
+    /* default ROM boot will change the reset values */
+    s->cctl |= INSERT(1, ARM_SRC);
+    s->cctl |= INSERT(1, AHB_CLK_DIV);
+}
+
+static uint64_t imx25_ccm_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint32 value = 0;
+    IMX25CCMState *s = (IMX25CCMState *)opaque;
+    uint32_t *reg = &s->mpctl;
+
+    DPRINTF("(offset=0x%" HWADDR_PRIx ")\n", offset);
+
+    if (offset < 0x70) {
+        value = reg[offset >> 2];
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Bad register at offset 0x%"
+                      HWADDR_PRIx "\n", TYPE_IMX25_CCM, __func__, offset);
+    }
+
+    DPRINTF("reg[0x%" HWADDR_PRIx "] => 0x%" PRIx32 "\n", offset, value);
+
+    return value;
+}
+
+static void imx25_ccm_write(void *opaque, hwaddr offset, uint64_t value,
+                            unsigned size)
+{
+    IMX25CCMState *s = (IMX25CCMState *)opaque;
+    uint32_t *reg = &s->mpctl;
+
+    DPRINTF("reg[0x%" HWADDR_PRIx "] <= 0x%" PRIx32 "\n", offset,
+            (uint32_t)value);
+
+    if (offset < 0x70) {
+        /*
+         * We will do a better implementation later. In particular some bits
+         * cannot be written to.
+         */
+        reg[offset >> 2] = value;
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
index 0000000..80d7c38
--- /dev/null
+++ b/include/hw/misc/imx25_ccm.h
@@ -0,0 +1,59 @@
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
+/* CCTL */
+#define CCTL_ARM_CLK_DIV_SHIFT (30)
+#define CCTL_ARM_CLK_DIV_MASK  (0x3)
+#define CCTL_AHB_CLK_DIV_SHIFT (28)
+#define CCTL_AHB_CLK_DIV_MASK  (0x3)
+#define CCTL_MPLL_BYPASS_SHIFT (22)
+#define CCTL_MPLL_BYPASS_MASK  (0x1)
+#define CCTL_USB_DIV_SHIFT (16)
+#define CCTL_USB_DIV_MASK  (0x3F)
+#define CCTL_ARM_SRC_SHIFT (13)
+#define CCTL_ARM_SRC_MASK  (0x1)
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
+    uint32_t mpctl;
+    uint32_t upctl;
+    uint32_t cctl;
+    uint32_t cgcr[3];
+    uint32_t pcdr[4];
+    uint32_t rcsr;
+    uint32_t crdr;
+    uint32_t dcvr[4];
+    uint32_t ltr[4];
+    uint32_t ltbr[2];
+    uint32_t pmcr[3];
+    uint32_t mcr;
+    uint32_t lpimr[2];
+
+} IMX25CCMState;
+
+#endif /* IMX25_CCM_H */
-- 
2.5.0

