Received: by 10.25.21.96 with SMTP id l93csp289435lfi;
        Wed, 22 Jun 2016 19:16:51 -0700 (PDT)
X-Received: by 10.55.19.27 with SMTP id d27mr6193329qkh.151.1466648211615;
        Wed, 22 Jun 2016 19:16:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w30si3195467qtd.46.2016.06.22.19.16.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 19:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFuCI-0003PX-Ur
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 22:16:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC8-0003Hb-9F
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC0-000736-Ob
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:39 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:33144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFuBy-00070v-Ez; Wed, 22 Jun 2016 22:16:32 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id EF053A56;
	Wed, 22 Jun 2016 22:16:17 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 22 Jun 2016 22:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=7LeTPY/9iEGv9aV4rlVcCEu/nc4
	=; b=Ei4CrYTrrPq7KoNR9IWrPlmFfFDSQxD9WzMwYziR2rGR9iKkAOFvYn0zM0S
	NEN+cX2BpI3gINnQ+xgrwtTI+rcbv0vd3FiWmHMSu1fZQsn6GxNvppK40wUai7pk
	QO67iqRuiUv2elckELYlxCRre5GRwPsjqS0yHAUPsC4X8LL0=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=7LeT
	PY/9iEGv9aV4rlVcCEu/nc4=; b=EqtYRHi3whp3I4XqMPmOgJ7GZaOTElRvKSY3
	mEY4/rqHHZV4nr0xFY0+eKlMP+ocTVw8jvnd/SB8Cdw88Ljq+2BpIG4oLfY90pzv
	QNF7mXWWkJ4+sZjtiNUgOJcWhvU0rZ+MAXGhNZTXx6RgEmBXdfJ0+0kh/PDuqIpE
	xihxKHk=
X-Sasl-enc: aKqbyfv4HR79mOa1ojwdSzKnUJ5Bq9AJar0Zg2TWFY+G 1466648173
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 923C4F29F3;
	Wed, 22 Jun 2016 22:16:11 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 11:45:13 +0930
Message-Id: <1466648115-17015-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v2 1/3] hw/misc: Add a model for the ASPEED
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
X-TUID: AHE+m5MYV1qw

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

Since v1:

* Move reset values into SCU implementation (also make register defines private)
* Expose silicon-rev property which is used to select appropriate reset values
* Expose hw-strap1/hw-strap2 properties for board-specific SoC configuration

 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 258 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/aspeed_scu.h |  34 ++++++
 trace-events                 |   3 +
 4 files changed, 296 insertions(+)
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
index 000000000000..a714431c45c5
--- /dev/null
+++ b/hw/misc/aspeed_scu.c
@@ -0,0 +1,258 @@
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
+#define SCU_KEY 0x1688A8A8
+#define SCU_IO_REGION_SIZE 0x20000
+
+static const uint32_t ast2400_resets[ASPEED_SCU_NR_REGS] = {
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
+     [SILICON_REV]     = 0x02000303U,
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
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case WAKEUP_EN:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+
+    return s->regs[TO_REG(offset)];
+}
+
+static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+
+    if (TO_REG(offset) >= ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    if (offset > PROT_KEY && offset < CPU2_BASE_SEG1 &&
+            s->regs[TO_REG(PROT_KEY)] != SCU_KEY) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
+        return;
+    }
+
+    trace_aspeed_scu_write(offset, size, data);
+
+    switch (offset) {
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
+    s->regs[TO_REG(offset)] = (uint32_t) data;
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
+    case 0x02000303U:
+        reset = ast2400_resets;
+        break;
+    }
+
+    memcpy(s->regs, reset, sizeof(s->regs));
+    s->regs[SILICON_REV] = s->silicon_rev;
+    s->regs[HW_STRAP1] = s->hw_strap1;
+    s->regs[HW_STRAP2] = s->hw_strap2;
+}
+
+static void aspeed_scu_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedSCUState *s = ASPEED_SCU(dev);
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
diff --git a/trace-events b/trace-events
index 9d76de85749d..1b5fd602903c 100644
--- a/trace-events
+++ b/trace-events
@@ -156,3 +156,6 @@ memory_region_tb_write(int cpu_index, uint64_t addr, uint64_t value, unsigned si
 #
 # Targets: TCG(all)
 disable vcpu tcg guest_mem_before(TCGv vaddr, uint8_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"
+
+# hw/misc/aspeed_scu.c
+aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
-- 
2.7.4

