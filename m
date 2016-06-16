Received: by 10.25.21.96 with SMTP id l93csp181913lfi;
        Thu, 16 Jun 2016 00:48:35 -0700 (PDT)
X-Received: by 10.140.98.174 with SMTP id o43mr2971169qge.73.1466063315794;
        Thu, 16 Jun 2016 00:48:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si25394142qgt.101.2016.06.16.00.48.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 00:48:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDS2V-0002ht-6t
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 03:48:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bDS2O-0002gO-Qp
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 03:48:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bDS2H-0006rb-Ov
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 03:48:28 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:59890
	helo=homiemail-a19.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bDS2H-0006rO-EO; Thu, 16 Jun 2016 03:48:21 -0400
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 7AC6D604078;
	Thu, 16 Jun 2016 00:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding; s=aj.id.au; bh=06O2A0Nc
	6Z75ObyyXg3Zt0XJ5xk=; b=Ye4O8uoN81PXMZ7qZdddWTRTEENaVIEw5zU0hBgD
	IVPLqRtMj6xUABcI1dZRbkS3oBKbKPEQDusGdQ46BzlI4CQSD87XuKUFdKj7KQ5D
	2nizuIuvlsOcZPOznOrIc4oRW8AzHarK8nv1CAg2G6YMkCC+Lwc7WZXcNlb9Ls6Q
	2M8=
Received: from keelia.au.ibm.com (orion.jms.id.au [119.9.53.35])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 9F0FC604069; 
	Thu, 16 Jun 2016 00:48:18 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jun 2016 17:48:06 +1000
Message-Id: <1466063287-19350-2-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Subject: [Qemu-arm] [PATCH 1/2] hw/misc: Add a model for the ASPEED System
 Control Unit
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
X-TUID: gGXmpBE6MOXl

The SCU is a collection of chip-level control registers that manage the
various functions supported by the AST2400. Typically the bits control
interactions with clocks, external hardware or reset behaviour, and we
can largly take a hands-off approach to reads and writes.

Firmware makes heavy use of the state to determine how to boot, but the
reset values vary from SoC to SoC. qdev properties are exposed so that
the integrating SoC model can configure the appropriate reset values.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 147 +++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/misc/aspeed_scu.h | 108 +++++++++++++++++++++++++++++++
 trace-events                 |   3 +
 4 files changed, 259 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ffb49c11aca6..54020aa06c00 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -52,3 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
 obj-$(CONFIG_EDU) +=3D edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
 obj-$(CONFIG_AUX) +=3D aux.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
new file mode 100644
index 000000000000..492cf82af425
--- /dev/null
+++ b/hw/misc/aspeed_scu.c
@@ -0,0 +1,147 @@
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
+#define SCU_KEY 0x1688A8A8
+#define SCU_IO_REGION_SIZE 0x20000
+
+static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned si=
ze)
+{
+    AspeedSCUState *s =3D ASPEED_SCU(opaque);
+
+    if (ASPEED_SCU_TO_REG(offset) >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx=
 "\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case ASPEED_SCU_WAKEUP_EN:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Read of write-only offset 0x%" HWADDR_PRIx "\=
n",
+                      __func__, offset);
+        break;
+    }
+
+    return s->regs[ASPEED_SCU_TO_REG(offset)];
+}
+
+static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
+                             unsigned size)
+{
+    AspeedSCUState *s =3D ASPEED_SCU(opaque);
+
+    if (ASPEED_SCU_TO_REG(offset) >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
+                      __func__, offset);
+        return;
+    }
+
+    if (offset > ASPEED_SCU_PROT_KEY && offset < ASPEED_SCU_CPU2_BASE_SE=
G1 &&
+            s->regs[ASPEED_SCU_TO_REG(ASPEED_SCU_PROT_KEY)] !=3D SCU_KEY=
) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__)=
;
+        return;
+    }
+
+    trace_aspeed_scu_write(offset, size, data);
+
+    switch (offset) {
+    case ASPEED_SCU_FREQ_CNTR_EVAL:
+    case ASPEED_SCU_VGA_SCRATCH1 ... ASPEED_SCU_VGA_SCRATCH8:
+    case ASPEED_SCU_RNG_DATA:
+    case ASPEED_SCU_REV_ID:
+    case ASPEED_SCU_FREE_CNTR4:
+    case ASPEED_SCU_FREE_CNTR4_EXT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\=
n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[ASPEED_SCU_TO_REG(offset)] =3D (uint32_t) data;
+}
+
+static const MemoryRegionOps aspeed_scu_ops =3D {
+    .read =3D aspeed_scu_read,
+    .write =3D aspeed_scu_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+    .valid.unaligned =3D false,
+};
+
+static void aspeed_scu_reset(DeviceState *dev)
+{
+    AspeedSCUState *s =3D ASPEED_SCU(dev);
+
+    memcpy(s->regs, s->reset, sizeof(s->regs));
+}
+
+static void aspeed_scu_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedSCUState *s =3D ASPEED_SCU(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_scu_ops, s,
+                          TYPE_ASPEED_SCU, SCU_IO_REGION_SIZE);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_scu =3D {
+    .name =3D "aspeed.new-vic",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSCUState, ASPEED_SCU_NR_REGS),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_scu_properties[] =3D {
+    DEFINE_PROP_ARRAY("reset", AspeedSCUState, num_resets, reset,
+                      qdev_prop_uint32, uint32_t),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_scu_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D aspeed_scu_realize;
+    dc->reset =3D aspeed_scu_reset;
+    dc->desc =3D "ASPEED System Control Unit";
+    dc->vmsd =3D &vmstate_aspeed_scu;
+    dc->props =3D aspeed_scu_properties;
+}
+
+static const TypeInfo aspeed_scu_info =3D {
+    .name =3D TYPE_ASPEED_SCU,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedSCUState),
+    .class_init =3D aspeed_scu_class_init,
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
index 000000000000..f95c5c8a7d74
--- /dev/null
+++ b/include/hw/misc/aspeed_scu.h
@@ -0,0 +1,108 @@
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
+#define ASPEED_SCU(obj) OBJECT_CHECK(AspeedSCUState, (obj), TYPE_ASPEED_=
SCU)
+
+#define ASPEED_SCU_NR_REGS (0x1A8 >> 2)
+
+#define ASPEED_SCU_PROT_KEY             0x00
+#define ASPEED_SCU_SYS_RST_CTRL         0x04
+#define ASPEED_SCU_CLK_SEL              0x08
+#define ASPEED_SCU_CLK_STOP_CTRL        0x0C
+#define ASPEED_SCU_FREQ_CNTR_CTRL       0x10
+#define ASPEED_SCU_FREQ_CNTR_EVAL       0x14
+#define ASPEED_SCU_IRQ_CTRL             0x18
+#define ASPEED_SCU_D2PLL_PARAM          0x1C
+#define ASPEED_SCU_MPLL_PARAM           0x20
+#define ASPEED_SCU_HPLL_PARAM           0x24
+#define ASPEED_SCU_FREQ_CNTR_RANGE      0x28
+#define ASPEED_SCU_MISC_CTRL1           0x2C
+#define ASPEED_SCU_PCI_CTRL1            0x30
+#define ASPEED_SCU_PCI_CTRL2            0x34
+#define ASPEED_SCU_PCI_CTRL3            0x38
+#define ASPEED_SCU_SYS_RST_STATUS       0x3C
+#define ASPEED_SCU_SOC_SCRATCH1         0x40
+#define ASPEED_SCU_SOC_SCRATCH2         0x44
+#define ASPEED_SCU_MAC_CLK_DELAY        0x48
+#define ASPEED_SCU_MISC_CTRL2           0x4C
+#define ASPEED_SCU_VGA_SCRATCH1         0x50
+#define ASPEED_SCU_VGA_SCRATCH2         0x54
+#define ASPEED_SCU_VGA_SCRATCH3         0x58
+#define ASPEED_SCU_VGA_SCRATCH4         0x5C
+#define ASPEED_SCU_VGA_SCRATCH5         0x60
+#define ASPEED_SCU_VGA_SCRATCH6         0x64
+#define ASPEED_SCU_VGA_SCRATCH7         0x68
+#define ASPEED_SCU_VGA_SCRATCH8         0x6C
+#define ASPEED_SCU_HW_STRAP1            0x70
+#define ASPEED_SCU_RNG_CTRL             0x74
+#define ASPEED_SCU_RNG_DATA             0x78
+#define ASPEED_SCU_REV_ID               0x7C
+#define ASPEED_SCU_PINMUX_CTRL1         0x80
+#define ASPEED_SCU_PINMUX_CTRL2         0x84
+#define ASPEED_SCU_PINMUX_CTRL3         0x88
+#define ASPEED_SCU_PINMUX_CTRL4         0x8C
+#define ASPEED_SCU_PINMUX_CTRL5         0x90
+#define ASPEED_SCU_PINMUX_CTRL6         0x94
+#define ASPEED_SCU_WDT_RST_CTRL         0x9C
+#define ASPEED_SCU_PINMUX_CTRL7         0xA0
+#define ASPEED_SCU_PINMUX_CTRL8         0xA4
+#define ASPEED_SCU_PINMUX_CTRL9         0xA8
+#define ASPEED_SCU_WAKEUP_EN            0xC0
+#define ASPEED_SCU_WAKEUP_CTRL          0xC4
+#define ASPEED_SCU_HW_STRAP2            0xD0
+#define ASPEED_SCU_FREE_CNTR4           0xE0
+#define ASPEED_SCU_FREE_CNTR4_EXT       0xE4
+#define ASPEED_SCU_CPU2_CTRL            0x100
+#define ASPEED_SCU_CPU2_BASE_SEG1       0x104
+#define ASPEED_SCU_CPU2_BASE_SEG2       0x108
+#define ASPEED_SCU_CPU2_BASE_SEG3       0x10C
+#define ASPEED_SCU_CPU2_BASE_SEG4       0x110
+#define ASPEED_SCU_CPU2_BASE_SEG5       0x114
+#define ASPEED_SCU_CPU2_CACHE_CTRL      0x118
+#define ASPEED_SCU_UART_HPLL_CLK        0x160
+#define ASPEED_SCU_PCIE_CTRL            0x180
+#define ASPEED_SCU_BMC_MMIO_CTRL        0x184
+#define ASPEED_SCU_RELOC_DECODE_BASE1   0x188
+#define ASPEED_SCU_RELOC_DECODE_BASE2   0x18C
+#define ASPEED_SCU_MAILBOX_DECODE_BASE  0x190
+#define ASPEED_SCU_SRAM_DECODE_BASE1    0x194
+#define ASPEED_SCU_SRAM_DECODE_BASE2    0x198
+#define ASPEED_SCU_BMC_REV_ID           0x19C
+#define ASPEED_SCU_BMC_DEV_ID           0x1A4
+
+#define ASPEED_SCU_TO_REG(offset) ((offset) >> 2)
+
+typedef struct AspeedSCUState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SCU_NR_REGS];
+    uint32_t *reset;
+    uint32_t num_resets;
+} AspeedSCUState;
+
+typedef struct AspeedSCUResetCfg {
+    uint32_t offset;
+    uint32_t val;
+} AspeedSCUResetCfg;
+
+void aspeed_scu_configure_reset(AspeedSCUState *scu,
+        const struct AspeedSCUResetCfg vals[], int n, Error **errp);
+
+#endif /* ASPEED_SCU_H */
diff --git a/trace-events b/trace-events
index 2f14205de047..24749c414ee7 100644
--- a/trace-events
+++ b/trace-events
@@ -2164,3 +2164,6 @@ e1000e_cfg_support_virtio(bool support) "Virtio hea=
der supported: %d"
=20
 e1000e_vm_state_running(void) "VM state is running"
 e1000e_vm_state_stopped(void) "VM state is stopped"
+
+# hw/misc/aspeed_scu.c
+aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%"=
 PRIx64 " of size %u: 0x%" PRIx32
--=20
2.7.4

