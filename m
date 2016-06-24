Received: by 10.25.21.96 with SMTP id l93csp858400lfi;
        Thu, 23 Jun 2016 22:00:02 -0700 (PDT)
X-Received: by 10.55.155.193 with SMTP id d184mr2464955qke.152.1466744401978;
        Thu, 23 Jun 2016 22:00:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j53si3601786qtj.9.2016.06.23.22.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 22:00:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJDl-0004Wu-CV
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 01:00:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDf-0004Rt-JI
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDZ-0001Wg-HD
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:54 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:56273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGJDX-0001Uv-72; Fri, 24 Jun 2016 00:59:49 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id EC2EEC03;
	Fri, 24 Jun 2016 00:59:38 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Fri, 24 Jun 2016 00:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=7RglFw396NpoVeO7Rb4EGiTiTPA
	=; b=kUWIjUvvYqRQJU+MfyBuAR9ueC6xLHfu94TUayk/TglnWdvqJKo+akjBUiX
	SHf3XvyGRICD2+Bd9ivBzVCzyX1PTDt8W9Vfsk7SfbqJBX+Ol7OWpfknqrzcIENs
	+VgBuK1s2VXYuMA0XTrLe0XfmsHhMrDFNYXI5wfzq0NwTbaw=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=7Rgl
	Fw396NpoVeO7Rb4EGiTiTPA=; b=cPxEW5yfe3CVht+i5r9R/HQZR6zsQzENRbJB
	ZSz5KikgntIiodbdJf89fq7G552onHlsNdARSUiVn5OxrV4ofrGXzwN3GGA1kLy6
	v6bqyAIAqXAmICiwbyRFBjFeKFl8JzfT2jTUpeCp23fWIF5/XzIUeij3J02gl8C8
	BDIsCgQ=
X-Sasl-enc: 43jw3q6WWY4vxqOaHGbNKENqXofOArNTF9Y83/JSKIJq 1466744372
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5F214F29F3;
	Fri, 24 Jun 2016 00:59:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 14:28:23 +0930
Message-Id: <1466744305-23163-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v3 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ooFvJIIylCut

The SCU is a collection of chip-level control registers that manage the
various functions supported by ASPEED SoCs. Typically the bits control
interactions with clocks, external hardware or reset behaviour, and we
can largly take a hands-off approach to reads and writes.

Firmware makes heavy use of the state to determine how to boot, but the
reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
property is exposed so that the integrating SoC model can configure the
silicon revision, which in-turn selects the appropriate reset values.
Further qdev properties are exposed so the board model can configure the
board-dependent hardware strapping.

Almost all provided AST2400 reset values are specified by the datasheet.
The notable exception is SOC_SCRATCH1, where we mark the DRAM as
successfully initialised to avoid unnecessary dark corners in the SoC's
u-boot support.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v2:

* Fix mixing of offsets and register indexes
* Sanity check device property values
* Move trace event definition to hw/misc/trace-events

Since v1:

* Move reset values into SCU implementation (also make register defines private)
* Expose silicon-rev property which is used to select appropriate reset values
* Expose hw-strap1/hw-strap2 properties for board-specific SoC configuration

 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 284 +++++++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events         |   3 +
 include/hw/misc/aspeed_scu.h |  34 ++++++
 4 files changed, 322 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ffb49c11aca6..54020aa06c00 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -52,3 +52,4 @@ obj-$(CONFIG_PVPANIC) += pvpanic.o
 obj-$(CONFIG_EDU) += edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
 obj-$(CONFIG_AUX) += aux.o
+obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
new file mode 100644
index 000000000000..ff231dbb3c17
--- /dev/null
+++ b/hw/misc/aspeed_scu.c
@@ -0,0 +1,284 @@
+/*
+ * ASPEED System Control Unit
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <inttypes.h>
+#include "hw/misc/aspeed_scu.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/bitops.h"
+#include "trace.h"
+
+#define TO_REG(offset) ((offset) >> 2)
+
+#define PROT_KEY             TO_REG(0x00)
+#define SYS_RST_CTRL         TO_REG(0x04)
+#define CLK_SEL              TO_REG(0x08)
+#define CLK_STOP_CTRL        TO_REG(0x0C)
+#define FREQ_CNTR_CTRL       TO_REG(0x10)
+#define FREQ_CNTR_EVAL       TO_REG(0x14)
+#define IRQ_CTRL             TO_REG(0x18)
+#define D2PLL_PARAM          TO_REG(0x1C)
+#define MPLL_PARAM           TO_REG(0x20)
+#define HPLL_PARAM           TO_REG(0x24)
+#define FREQ_CNTR_RANGE      TO_REG(0x28)
+#define MISC_CTRL1           TO_REG(0x2C)
+#define PCI_CTRL1            TO_REG(0x30)
+#define PCI_CTRL2            TO_REG(0x34)
+#define PCI_CTRL3            TO_REG(0x38)
+#define SYS_RST_STATUS       TO_REG(0x3C)
+#define SOC_SCRATCH1         TO_REG(0x40)
+#define SOC_SCRATCH2         TO_REG(0x44)
+#define MAC_CLK_DELAY        TO_REG(0x48)
+#define MISC_CTRL2           TO_REG(0x4C)
+#define VGA_SCRATCH1         TO_REG(0x50)
+#define VGA_SCRATCH2         TO_REG(0x54)
+#define VGA_SCRATCH3         TO_REG(0x58)
+#define VGA_SCRATCH4         TO_REG(0x5C)
+#define VGA_SCRATCH5         TO_REG(0x60)
+#define VGA_SCRATCH6         TO_REG(0x64)
+#define VGA_SCRATCH7         TO_REG(0x68)
+#define VGA_SCRATCH8         TO_REG(0x6C)
+#define HW_STRAP1            TO_REG(0x70)
+#define RNG_CTRL             TO_REG(0x74)
+#define RNG_DATA             TO_REG(0x78)
+#define SILICON_REV          TO_REG(0x7C)
+#define PINMUX_CTRL1         TO_REG(0x80)
+#define PINMUX_CTRL2         TO_REG(0x84)
+#define PINMUX_CTRL3         TO_REG(0x88)
+#define PINMUX_CTRL4         TO_REG(0x8C)
+#define PINMUX_CTRL5         TO_REG(0x90)
+#define PINMUX_CTRL6         TO_REG(0x94)
+#define WDT_RST_CTRL         TO_REG(0x9C)
+#define PINMUX_CTRL7         TO_REG(0xA0)
+#define PINMUX_CTRL8         TO_REG(0xA4)
+#define PINMUX_CTRL9         TO_REG(0xA8)
+#define WAKEUP_EN            TO_REG(0xC0)
+#define WAKEUP_CTRL          TO_REG(0xC4)
+#define HW_STRAP2            TO_REG(0xD0)
+#define FREE_CNTR4           TO_REG(0xE0)
+#define FREE_CNTR4_EXT       TO_REG(0xE4)
+#define CPU2_CTRL            TO_REG(0x100)
+#define CPU2_BASE_SEG1       TO_REG(0x104)
+#define CPU2_BASE_SEG2       TO_REG(0x108)
+#define CPU2_BASE_SEG3       TO_REG(0x10C)
+#define CPU2_BASE_SEG4       TO_REG(0x110)
+#define CPU2_BASE_SEG5       TO_REG(0x114)
+#define CPU2_CACHE_CTRL      TO_REG(0x118)
+#define UART_HPLL_CLK        TO_REG(0x160)
+#define PCIE_CTRL            TO_REG(0x180)
+#define BMC_MMIO_CTRL        TO_REG(0x184)
+#define RELOC_DECODE_BASE1   TO_REG(0x188)
+#define RELOC_DECODE_BASE2   TO_REG(0x18C)
+#define MAILBOX_DECODE_BASE  TO_REG(0x190)
+#define SRAM_DECODE_BASE1    TO_REG(0x194)
+#define SRAM_DECODE_BASE2    TO_REG(0x198)
+#define BMC_REV              TO_REG(0x19C)
+#define BMC_DEV_ID           TO_REG(0x1A4)
+
+#define PROT_KEY_UNLOCK 0x1688A8A8
+#define SCU_IO_REGION_SIZE 0x20000
+
+#define AST2400_A0_SILICON_REV     0x02000303U
+
+static const uint32_t ast2400_a0_resets[ASPEED_SCU_NR_REGS] = {
+     [SYS_RST_CTRL]    = 0xFFCFFEDCU,
+     [CLK_SEL]         = 0xF3F40000U,
+     [CLK_STOP_CTRL]   = 0x19FC3E8BU,
+     [D2PLL_PARAM]     = 0x00026108U,
+     [MPLL_PARAM]      = 0x00030291U,
+     [HPLL_PARAM]      = 0x00000291U,
+     [MISC_CTRL1]      = 0x00000010U,
+     [PCI_CTRL1]       = 0x20001A03U,
+     [PCI_CTRL2]       = 0x20001A03U,
+     [PCI_CTRL3]       = 0x04000030U,
+     [SYS_RST_STATUS]  = 0x00000001U,
+     [SOC_SCRATCH1]    = 0x000000C0U, /* SoC completed DRAM init */
+     [MISC_CTRL2]      = 0x00000023U,
+     [RNG_CTRL]        = 0x0000000EU,
+     [PINMUX_CTRL2]    = 0x0000F000U,
+     [PINMUX_CTRL3]    = 0x01000000U,
+     [PINMUX_CTRL4]    = 0x000000FFU,
+     [PINMUX_CTRL5]    = 0x0000A000U,
+     [WDT_RST_CTRL]    = 0x003FFFF3U,
+     [PINMUX_CTRL8]    = 0xFFFF0000U,
+     [PINMUX_CTRL9]    = 0x000FFFFFU,
+     [FREE_CNTR4]      = 0x000000FFU,
+     [FREE_CNTR4_EXT]  = 0x000000FFU,
+     [CPU2_BASE_SEG1]  = 0x80000000U,
+     [CPU2_BASE_SEG4]  = 0x1E600000U,
+     [CPU2_BASE_SEG5]  = 0xC0000000U,
+     [UART_HPLL_CLK]   = 0x00001903U,
+     [PCIE_CTRL]       = 0x0000007BU,
+     [BMC_DEV_ID]      = 0x00002402U
+};
+
+static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+    int reg = TO_REG(offset);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case WAKEUP_EN:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return s->regs[reg];
+}
+
+static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+    int reg = TO_REG(offset);
+
+    if (reg >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
+            s->regs[PROT_KEY] != PROT_KEY_UNLOCK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
+        return;
+    }
+
+    trace_aspeed_scu_write(offset, size, data);
+
+    switch (reg) {
+    case FREQ_CNTR_EVAL:
+    case VGA_SCRATCH1 ... VGA_SCRATCH8:
+    case RNG_DATA:
+    case SILICON_REV:
+    case FREE_CNTR4:
+    case FREE_CNTR4_EXT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[reg] = data;
+}
+
+static const MemoryRegionOps aspeed_scu_ops = {
+    .read = aspeed_scu_read,
+    .write = aspeed_scu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static void aspeed_scu_reset(DeviceState *dev)
+{
+    AspeedSCUState *s = ASPEED_SCU(dev);
+    const uint32_t *reset;
+
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+        reset = ast2400_a0_resets;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    memcpy(s->regs, reset, sizeof(s->regs));
+    s->regs[SILICON_REV] = s->silicon_rev;
+    s->regs[HW_STRAP1] = s->hw_strap1;
+    s->regs[HW_STRAP2] = s->hw_strap2;
+}
+
+static uint32_t aspeed_silicon_revs[] = { AST2400_A0_SILICON_REV, };
+
+static bool is_supported_silicon_rev(uint32_t silicon_rev)
+{
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(aspeed_silicon_revs); i++) {
+        if (silicon_rev == aspeed_silicon_revs[i]) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+static void aspeed_scu_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedSCUState *s = ASPEED_SCU(dev);
+
+    if (!is_supported_silicon_rev(s->silicon_rev)) {
+        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
+                s->silicon_rev);
+        return;
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_scu_ops, s,
+                          TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_scu = {
+    .name = "aspeed.scu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSCUState, ASPEED_SCU_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_scu_properties[] = {
+    DEFINE_PROP_UINT32("silicon-rev", AspeedSCUState, silicon_rev, 0),
+    DEFINE_PROP_UINT32("hw-strap1", AspeedSCUState, hw_strap1, 0),
+    DEFINE_PROP_UINT32("hw-strap2", AspeedSCUState, hw_strap1, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_scu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    dc->realize = aspeed_scu_realize;
+    dc->reset = aspeed_scu_reset;
+    dc->desc = "ASPEED System Control Unit";
+    dc->vmsd = &vmstate_aspeed_scu;
+    dc->props = aspeed_scu_properties;
+}
+
+static const TypeInfo aspeed_scu_info = {
+    .name = TYPE_ASPEED_SCU,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedSCUState),
+    .class_init = aspeed_scu_class_init,
+};
+
+static void aspeed_scu_register_types(void)
+{
+    type_register_static(&aspeed_scu_info);
+}
+
+type_init(aspeed_scu_register_types);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 16b6701cbf9a..ea52a14d787f 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -50,3 +50,6 @@ milkymist_pfpu_memory_read(uint32_t addr, uint32_t value) "addr %08x value %08x"
 milkymist_pfpu_memory_write(uint32_t addr, uint32_t value) "addr %08x value %08x"
 milkymist_pfpu_vectout(uint32_t a, uint32_t b, uint32_t dma_ptr) "a %08x b %08x dma_ptr %08x"
 milkymist_pfpu_pulse_irq(void) "Pulse IRQ"
+
+# hw/misc/aspeed_scu.c
+aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
new file mode 100644
index 000000000000..6b8e46f85fad
--- /dev/null
+++ b/include/hw/misc/aspeed_scu.h
@@ -0,0 +1,34 @@
+/*
+ * ASPEED System Control Unit
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_SCU_H
+#define ASPEED_SCU_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SCU "aspeed.scu"
+#define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_SCU)
+
+#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
+
+typedef struct AspeedSCUState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SCU_NR_REGS];
+    uint32_t silicon_rev;
+    uint32_t hw_strap1;
+    uint32_t hw_strap2;
+} AspeedSCUState;
+
+#endif /* ASPEED_SCU_H */
-- 
2.7.4

