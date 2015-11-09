Received: by 10.182.105.169 with SMTP id gn9csp1006151obb;
        Sun, 8 Nov 2015 23:08:01 -0800 (PST)
X-Received: by 10.140.233.211 with SMTP id e202mr29444334qhc.37.1447052881180;
        Sun, 08 Nov 2015 23:08:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u21si3577871qgu.96.2015.11.08.23.08.01
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:08:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50518 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvgYa-00064m-T7
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgYX-00060H-L5
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgYV-0007h7-FW
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:07:57 -0500
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:33508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvgYO-0007gT-IY; Mon, 09 Nov 2015 02:07:48 -0500
Received: by pabfh17 with SMTP id fh17so190068019pab.0;
	Sun, 08 Nov 2015 23:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mDbGJNpSxyO49yOpLD/plmj4juda7mXng5bO7G1FGCY=;
	b=CbpCu1UuoiKFgp0iSxIx+Hx1JiUkSENLRZR9d0G2UGNhU0FxF7TaxsDl8396Luk6BY
	n73Pjp65SYwBlwWnGf0qLSl3UmhmS3VlZhK2s0sTj8zJ+LvteDv3Yw9xGblBZ0xOHMa1
	r8d9j2Nk1E5nqhhHML4+X7df1zGs3LxwCC54QHsquTVJU8GoK2TegKZrawGs6Z20gNmt
	aMcC50svV0HpPwX9PKqxNc6vWw5etk7AO8np0RJi0lUYQ6fK+wqyycJBwFSiHLV1qRXe
	TJ86eWz6wBNgxJItRqsojvnzwD11thpxyx7JcO09qSPSPqPQB2rxI9A+MzFNvq237jXi
	45nA==
X-Received: by 10.68.200.66 with SMTP id jq2mr18498216pbc.4.1447052867529;
	Sun, 08 Nov 2015 23:07:47 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-248-219.mycingular.net.
	[166.171.248.219])
	by smtp.gmail.com with ESMTPSA id p11sm4287284par.9.2015.11.08.23.07.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 23:07:45 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 23:07:29 -0800
Message-Id: <57f84029331603f30f01511915e6b202e8424e7c.1447004487.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, linux@roeck-us.net,
	alistair.francis@xilinx.com
Subject: [Qemu-arm] [PATCH for-2.5 v4 1/1] hw/misc: Add support for ADC
	controller in Xilinx Zynq 7000
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
X-TUID: vXb2hajF7Mvq

From: Guenter Roeck <linux@roeck-us.net>

Add support for the Xilinx XADC core used in Zynq 7000.

References:
- Zynq-7000 All Programmable SoC Technical Reference Manual
- 7 Series FPGAs and Zynq-7000 All Programmable SoC XADC
  Dual 12-Bit 1 MSPS Analog-to-Digital Converter

Tested with Linux using QEMU machine xilinx-zynq-a9 with devicetree
files zynq-zc702.dtb and zynq-zc706.dtb, and kernel configuration
multi_v7_defconfig.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
[ PC changes:
  * Changed macro names to match TRM where possible
  * Made programmers model macro scheme consistent
  * Dropped XADC_ZYNQ_ prefix on local macros
  * Fix ALM field width
  * Update threshold-comparison interrupts in _update_ints()
  * factored out DFIFO pushes into helper. Renamed to "push/pop"
  * Changed xadc_reg to 10 bits and added OOB check.
  * Reduced scope of MCTL reset to just stop channel coms.
  * Added dummy read data to write commands
  * Changed _ to - seperators in string names and filenames
  * Dropped ------------ in header comment
  * Catchall'ed _update_ints() in _write handler.
  * Minor whitespace changes.
  * Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
]
Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
v4:
    Addressed Alistair review
    Minor whitespace changes
    Use ZYNQ_XADC_FIFO_DEPTH instead of ARRAY_SIZE()
v3:
    See [PC changes] in commit message
v2:
    Use extract32()
    Merge zynq_xadc_reset() and _zynq_xadc_reset() into one function
    Use "xlnx,zynq_xadc"
    Move device model to include/hw/misc/zynq_xadc.h
    irq -> qemu_irq
    xadc_dfifo_depth -> xadc_dfifo_entries
    Dropped unnecessary comments
    Merged zynq_xadc_realize() into zynq_xadc_init()

 hw/arm/xilinx_zynq.c        |   6 +
 hw/misc/Makefile.objs       |   1 +
 hw/misc/zynq-xadc.c         | 302 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/zynq-xadc.h |  46 +++++++
 4 files changed, 355 insertions(+)
 create mode 100644 hw/misc/zynq-xadc.c
 create mode 100644 include/hw/misc/zynq-xadc.h

diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 82a9db8..1c1a445 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -24,6 +24,7 @@
 #include "hw/block/flash.h"
 #include "sysemu/block-backend.h"
 #include "hw/loader.h"
+#include "hw/misc/zynq-xadc.h"
 #include "hw/ssi.h"
 #include "qemu/error-report.h"
 
@@ -264,6 +265,11 @@ static void zynq_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xE0101000);
     sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[79-IRQ_OFFSET]);
 
+    dev = qdev_create(NULL, TYPE_ZYNQ_XADC);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 0xF8007100);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[39-IRQ_OFFSET]);
+
     dev = qdev_create(NULL, "pl330");
     qdev_prop_set_uint8(dev, "num_chnls",  8);
     qdev_prop_set_uint8(dev, "num_periph_req",  4);
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 4aa76ff..aeb6b7d 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -36,6 +36,7 @@ obj-$(CONFIG_OMAP) += omap_sdrc.o
 obj-$(CONFIG_OMAP) += omap_tap.o
 obj-$(CONFIG_SLAVIO) += slavio_misc.o
 obj-$(CONFIG_ZYNQ) += zynq_slcr.o
+obj-$(CONFIG_ZYNQ) += zynq-xadc.o
 obj-$(CONFIG_STM32F2XX_SYSCFG) += stm32f2xx_syscfg.o
 
 obj-$(CONFIG_PVPANIC) += pvpanic.o
diff --git a/hw/misc/zynq-xadc.c b/hw/misc/zynq-xadc.c
new file mode 100644
index 0000000..ae3df5e
--- /dev/null
+++ b/hw/misc/zynq-xadc.c
@@ -0,0 +1,302 @@
+/*
+ * ADC registers for Xilinx Zynq Platform
+ *
+ * Copyright (c) 2015 Guenter Roeck
+ * Based on hw/misc/zynq_slcr.c, written by Michal Simek
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "hw/hw.h"
+#include "hw/misc/zynq-xadc.h"
+#include "qemu/timer.h"
+#include "sysemu/sysemu.h"
+
+enum {
+    CFG                = 0x000 / 4,
+    INT_STS,
+    INT_MASK,
+    MSTS,
+    CMDFIFO,
+    RDFIFO,
+    MCTL,
+};
+
+#define CFG_ENABLE              BIT(31)
+#define CFG_CFIFOTH_SHIFT       20
+#define CFG_CFIFOTH_LENGTH      4
+#define CFG_DFIFOTH_SHIFT       16
+#define CFG_DFIFOTH_LENGTH      4
+#define CFG_WEDGE               BIT(13)
+#define CFG_REDGE               BIT(12)
+#define CFG_TCKRATE_SHIFT       8
+#define CFG_TCKRATE_LENGTH      2
+
+#define CFG_TCKRATE_DIV(x)      (0x1 << (x - 1))
+
+#define CFG_IGAP_SHIFT          0
+#define CFG_IGAP_LENGTH         5
+
+#define INT_CFIFO_LTH           BIT(9)
+#define INT_DFIFO_GTH           BIT(8)
+#define INT_OT                  BIT(7)
+#define INT_ALM_SHIFT           0
+#define INT_ALM_LENGTH          7
+#define INT_ALM_MASK            (((1 << INT_ALM_LENGTH) - 1) << INT_ALM_SHIFT)
+
+#define INT_ALL (INT_CFIFO_LTH | INT_DFIFO_GTH | INT_OT | INT_ALM_MASK)
+
+#define MSTS_CFIFO_LVL_SHIFT    16
+#define MSTS_CFIFO_LVL_LENGTH   4
+#define MSTS_DFIFO_LVL_SHIFT    12
+#define MSTS_DFIFO_LVL_LENGTH   4
+#define MSTS_CFIFOF             BIT(11)
+#define MSTS_CFIFOE             BIT(10)
+#define MSTS_DFIFOF             BIT(9)
+#define MSTS_DFIFOE             BIT(8)
+#define MSTS_OT                 BIT(7)
+#define MSTS_ALM_SHIFT          0
+#define MSTS_ALM_LENGTH         7
+
+#define MCTL_RESET              BIT(4)
+
+#define CMD_NOP                 0x00
+#define CMD_READ                0x01
+#define CMD_WRITE               0x02
+
+static void zynq_xadc_update_ints(ZynqXADCState *s)
+{
+
+    /* We are fast, commands are actioned instantly so the CFIFO is always
+     * empty (and below threshold).
+     */
+    s->regs[INT_STS] |= INT_CFIFO_LTH;
+
+    if (s->xadc_dfifo_entries >
+        extract32(s->regs[CFG], CFG_DFIFOTH_SHIFT, CFG_DFIFOTH_LENGTH)) {
+        s->regs[INT_STS] |= INT_DFIFO_GTH;
+    }
+
+    qemu_set_irq(s->qemu_irq, !!(s->regs[INT_STS] & ~s->regs[INT_MASK]));
+}
+
+static void zynq_xadc_reset(DeviceState *d)
+{
+    ZynqXADCState *s = ZYNQ_XADC(d);
+
+    s->regs[CFG] = 0x14 << CFG_IGAP_SHIFT |
+                   CFG_TCKRATE_DIV(4) << CFG_TCKRATE_SHIFT | CFG_REDGE;
+    s->regs[INT_STS] = INT_CFIFO_LTH;
+    s->regs[INT_MASK] = 0xffffffff;
+    s->regs[CMDFIFO] = 0;
+    s->regs[RDFIFO] = 0;
+    s->regs[MCTL] = MCTL_RESET;
+
+    memset(s->xadc_regs, 0, sizeof(s->xadc_regs));
+    memset(s->xadc_dfifo, 0, sizeof(s->xadc_dfifo));
+    s->xadc_dfifo_entries = 0;
+
+    zynq_xadc_update_ints(s);
+}
+
+static uint16_t xadc_pop_dfifo(ZynqXADCState *s)
+{
+    uint16_t rv = s->xadc_dfifo[0];
+    int i;
+
+    if (s->xadc_dfifo_entries > 0) {
+        s->xadc_dfifo_entries--;
+    }
+    for (i = 0; i < s->xadc_dfifo_entries; i++) {
+        s->xadc_dfifo[i] = s->xadc_dfifo[i + 1];
+    }
+    s->xadc_dfifo[s->xadc_dfifo_entries] = 0;
+    zynq_xadc_update_ints(s);
+    return rv;
+}
+
+static void xadc_push_dfifo(ZynqXADCState *s, uint16_t regval)
+{
+    if (s->xadc_dfifo_entries < ZYNQ_XADC_FIFO_DEPTH) {
+        s->xadc_dfifo[s->xadc_dfifo_entries++] = s->xadc_read_reg_previous;
+    }
+    s->xadc_read_reg_previous = regval;
+    zynq_xadc_update_ints(s);
+}
+
+static bool zynq_xadc_check_offset(hwaddr offset, bool rnw)
+{
+    switch (offset) {
+    case CFG:
+    case INT_MASK:
+    case INT_STS:
+    case MCTL:
+        return true;
+    case RDFIFO:
+    case MSTS:
+        return rnw;     /* read only */
+    case CMDFIFO:
+        return !rnw;    /* write only */
+    default:
+        return false;
+    }
+}
+
+static uint64_t zynq_xadc_read(void *opaque, hwaddr offset, unsigned size)
+{
+    ZynqXADCState *s = opaque;
+    int reg = offset / 4;
+    uint32_t rv;
+
+    if (!zynq_xadc_check_offset(reg, true)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "zynq_xadc: Invalid read access to "
+                      "addr %" HWADDR_PRIx "\n", offset);
+        return 0;
+    }
+
+    switch (reg) {
+    case CFG:
+    case INT_MASK:
+    case INT_STS:
+    case MCTL:
+        rv = s->regs[reg];
+        break;
+    case MSTS:
+        rv = MSTS_CFIFOE;
+        rv |= s->xadc_dfifo_entries << MSTS_DFIFO_LVL_SHIFT;
+        if (!s->xadc_dfifo_entries) {
+            rv |= MSTS_DFIFOE;
+        } else if (s->xadc_dfifo_entries == ZYNQ_XADC_FIFO_DEPTH) {
+            rv |= MSTS_DFIFOF;
+        }
+        break;
+    case RDFIFO:
+        rv = xadc_pop_dfifo(s);
+        break;
+    }
+    return rv;
+}
+
+static void zynq_xadc_write(void *opaque, hwaddr offset, uint64_t val,
+                            unsigned size)
+{
+    ZynqXADCState *s = (ZynqXADCState *)opaque;
+    int reg = offset / 4;
+    int xadc_reg;
+    int xadc_cmd;
+    int xadc_data;
+
+    if (!zynq_xadc_check_offset(reg, false)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "zynq_xadc: Invalid write access "
+                      "to addr %" HWADDR_PRIx "\n", offset);
+        return;
+    }
+
+    switch (reg) {
+    case CFG:
+        s->regs[CFG] = val;
+        break;
+    case INT_STS:
+        s->regs[INT_STS] &= ~val;
+        break;
+    case INT_MASK:
+        s->regs[INT_MASK] = val & INT_ALL;
+        break;
+    case CMDFIFO:
+        xadc_cmd  = extract32(val, 26,  4);
+        xadc_reg  = extract32(val, 16, 10);
+        xadc_data = extract32(val,  0, 16);
+
+        if (s->regs[MCTL] & MCTL_RESET) {
+            qemu_log_mask(LOG_GUEST_ERROR, "zynq_xadc: Sending command "
+                          "while comm channel held in reset: %" PRIx32 "\n",
+                          (uint32_t) val);
+            break;
+        }
+
+        if (xadc_reg > ZYNQ_XADC_NUM_ADC_REGS && xadc_cmd != CMD_NOP) {
+            qemu_log_mask(LOG_GUEST_ERROR, "read/write op to invalid xadc "
+                          "reg 0x%x\n", xadc_reg);
+            break;
+        }
+
+        switch (xadc_cmd) {
+        case CMD_READ:
+            xadc_push_dfifo(s, s->xadc_regs[xadc_reg]);
+            break;
+        case CMD_WRITE:
+            s->xadc_regs[xadc_reg] = xadc_data;
+            /* fallthrough */
+        case CMD_NOP:
+            xadc_push_dfifo(s, 0);
+            break;
+        }
+        break;
+    case MCTL:
+        s->regs[MCTL] = val & 0x00fffeff;
+        break;
+    }
+    zynq_xadc_update_ints(s);
+}
+
+static const MemoryRegionOps xadc_ops = {
+    .read = zynq_xadc_read,
+    .write = zynq_xadc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void zynq_xadc_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    ZynqXADCState *s = ZYNQ_XADC(obj);
+
+    memory_region_init_io(&s->iomem, obj, &xadc_ops, s, "zynq-xadc",
+                          ZYNQ_XADC_MMIO_SIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->qemu_irq);
+}
+
+static const VMStateDescription vmstate_zynq_xadc = {
+    .name = "zynq-xadc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, ZynqXADCState, ZYNQ_XADC_NUM_IO_REGS),
+        VMSTATE_UINT16_ARRAY(xadc_regs, ZynqXADCState,
+                             ZYNQ_XADC_NUM_ADC_REGS),
+        VMSTATE_UINT16_ARRAY(xadc_dfifo, ZynqXADCState,
+                             ZYNQ_XADC_FIFO_DEPTH),
+        VMSTATE_UINT16(xadc_read_reg_previous, ZynqXADCState),
+        VMSTATE_UINT16(xadc_dfifo_entries, ZynqXADCState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void zynq_xadc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_zynq_xadc;
+    dc->reset = zynq_xadc_reset;
+}
+
+static const TypeInfo zynq_xadc_info = {
+    .class_init = zynq_xadc_class_init,
+    .name  = TYPE_ZYNQ_XADC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(ZynqXADCState),
+    .instance_init = zynq_xadc_init,
+};
+
+static void zynq_xadc_register_types(void)
+{
+    type_register_static(&zynq_xadc_info);
+}
+
+type_init(zynq_xadc_register_types)
diff --git a/include/hw/misc/zynq-xadc.h b/include/hw/misc/zynq-xadc.h
new file mode 100644
index 0000000..f1a410a
--- /dev/null
+++ b/include/hw/misc/zynq-xadc.h
@@ -0,0 +1,46 @@
+/*
+ * Device model for Zynq ADC controller
+ *
+ * Copyright (c) 2015 Guenter Roeck <linux@roeck-us.net>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef ZYNQ_XADC_H
+#define ZYNQ_XADC_H
+
+#include "hw/sysbus.h"
+
+#define ZYNQ_XADC_MMIO_SIZE     0x0020
+#define ZYNQ_XADC_NUM_IO_REGS   (ZYNQ_XADC_MMIO_SIZE / 4)
+#define ZYNQ_XADC_NUM_ADC_REGS  128
+#define ZYNQ_XADC_FIFO_DEPTH    15
+
+#define TYPE_ZYNQ_XADC          "xlnx,zynq-xadc"
+#define ZYNQ_XADC(obj) \
+    OBJECT_CHECK(ZynqXADCState, (obj), TYPE_ZYNQ_XADC)
+
+typedef struct ZynqXADCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ZYNQ_XADC_NUM_IO_REGS];
+    uint16_t xadc_regs[ZYNQ_XADC_NUM_ADC_REGS];
+    uint16_t xadc_read_reg_previous;
+    uint16_t xadc_dfifo[ZYNQ_XADC_FIFO_DEPTH];
+    uint16_t xadc_dfifo_entries;
+
+    struct IRQState *qemu_irq;
+
+} ZynqXADCState;
+
+#endif /* ZYNQ_XADC_H */
-- 
1.9.1

