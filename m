Received: by 10.25.208.137 with SMTP id h131csp1684270lfg;
        Mon, 9 May 2016 10:32:58 -0700 (PDT)
X-Received: by 10.140.99.109 with SMTP id p100mr29337805qge.97.1462815168183;
        Mon, 09 May 2016 10:32:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si7272849qkh.246.2016.05.09.10.32.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp31-0000Ni-Ma
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:32:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0q-0004OJ-Aa
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0j-0000Kw-G4
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0j-00005k-4d; Mon, 09 May 2016 13:30:25 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0E-0001Sq-QQ; Mon, 09 May 2016 18:29:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:35 +0100
Message-Id: <1462814989-24360-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/23] hw/intc/arm_gicv3: ARM GICv3 device
 framework
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BAmKEH4e9Vk+

From: Shlomo Pongratz <shlomo.pongratz@huawei.com>

This patch includes the device class itself, some ID register
value functions which will be needed by both distributor
and redistributor, and some skeleton functions for handling
interrupts coming in and going out, which will be filled in
in a subsequent patch.

Signed-off-by: Shlomo Pongratz <shlomo.pongratz@huawei.com>
[PMM: pulled this patch earlier in the sequence, and left
 some code out of it for a later patch]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Makefile.objs       |  1 +
 hw/intc/arm_gicv3.c         | 74 +++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h    | 24 +++++++++++++++
 include/hw/intc/arm_gicv3.h | 32 ++++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 hw/intc/arm_gicv3.c
 create mode 100644 include/hw/intc/arm_gicv3.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 0e47f0f..4e94fdd 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -13,6 +13,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gic_common.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gic.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv2m.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
+common-obj-$(CONFIG_ARM_GIC) += arm_gicv3.o
 common-obj-$(CONFIG_OPENPIC) += openpic.o
 
 obj-$(CONFIG_APIC) += apic.o apic_common.o
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
new file mode 100644
index 0000000..96e0d2f
--- /dev/null
+++ b/hw/intc/arm_gicv3.c
@@ -0,0 +1,74 @@
+/*
+ * ARM Generic Interrupt Controller v3
+ *
+ * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2016 Linaro Limited
+ * Written by Shlomo Pongratz, Peter Maydell
+ *
+ * This code is licensed under the GPL, version 2 or (at your option)
+ * any later version.
+ */
+
+/* This file contains implementation code for an interrupt controller
+ * which implements the GICv3 architecture. Specifically this is where
+ * the device class itself and the functions for handling interrupts
+ * coming in and going out live.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/sysbus.h"
+#include "hw/intc/arm_gicv3.h"
+#include "gicv3_internal.h"
+
+/* Process a change in an external IRQ input. */
+static void gicv3_set_irq(void *opaque, int irq, int level)
+{
+    /* Meaning of the 'irq' parameter:
+     *  [0..N-1] : external interrupts
+     *  [N..N+31] : PPI (internal) interrupts for CPU 0
+     *  [N+32..N+63] : PPI (internal interrupts for CPU 1
+     *  ...
+     */
+    /* Do nothing for now */
+}
+
+static void arm_gic_realize(DeviceState *dev, Error **errp)
+{
+    /* Device instance realize function for the GIC sysbus device */
+    GICv3State *s = ARM_GICV3(dev);
+    ARMGICv3Class *agc = ARM_GICV3_GET_CLASS(s);
+    Error *local_err = NULL;
+
+    agc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    gicv3_init_irqs_and_mmio(s, gicv3_set_irq, NULL);
+}
+
+static void arm_gicv3_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ARMGICv3Class *agc = ARM_GICV3_CLASS(klass);
+
+    agc->parent_realize = dc->realize;
+    dc->realize = arm_gic_realize;
+}
+
+static const TypeInfo arm_gicv3_info = {
+    .name = TYPE_ARM_GICV3,
+    .parent = TYPE_ARM_GICV3_COMMON,
+    .instance_size = sizeof(GICv3State),
+    .class_init = arm_gicv3_class_init,
+    .class_size = sizeof(ARMGICv3Class),
+};
+
+static void arm_gicv3_register_types(void)
+{
+    type_register_static(&arm_gicv3_info);
+}
+
+type_init(arm_gicv3_register_types)
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index d23524b..97c9d75 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -159,6 +159,30 @@
 #define ICC_CTLR_EL3_A3V (1U << 15)
 #define ICC_CTLR_EL3_NDS (1U << 17)
 
+static inline uint32_t gicv3_iidr(void)
+{
+    /* Return the Implementer Identification Register value
+     * for the emulated GICv3, as reported in GICD_IIDR and GICR_IIDR.
+     *
+     * We claim to be an ARM r0p0 with a zero ProductID.
+     * This is the same as an r0p0 GIC-500.
+     */
+    return 0x43b;
+}
+
+static inline uint32_t gicv3_idreg(int regoffset)
+{
+    /* Return the value of the CoreSight ID register at the specified
+     * offset from the first ID register (as found in the distributor
+     * and redistributor register banks).
+     * These values indicate an ARM implementation of a GICv3.
+     */
+    static const uint8_t gicd_ids[] = {
+        0x44, 0x00, 0x00, 0x00, 0x92, 0xB4, 0x3B, 0x00, 0x0D, 0xF0, 0x05, 0xB1
+    };
+    return gicd_ids[regoffset / 4];
+}
+
 /**
  * gicv3_redist_affid:
  *
diff --git a/include/hw/intc/arm_gicv3.h b/include/hw/intc/arm_gicv3.h
new file mode 100644
index 0000000..4a6fd85
--- /dev/null
+++ b/include/hw/intc/arm_gicv3.h
@@ -0,0 +1,32 @@
+/*
+ * ARM Generic Interrupt Controller v3
+ *
+ * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2016 Linaro Limited
+ * Written by Shlomo Pongratz, Peter Maydell
+ *
+ * This code is licensed under the GPL, version 2 or (at your option)
+ * any later version.
+ */
+
+#ifndef HW_ARM_GICV3_H
+#define HW_ARM_GICV3_H
+
+#include "arm_gicv3_common.h"
+
+#define TYPE_ARM_GICV3 "arm-gicv3"
+#define ARM_GICV3(obj) OBJECT_CHECK(GICv3State, (obj), TYPE_ARM_GICV3)
+#define ARM_GICV3_CLASS(klass) \
+     OBJECT_CLASS_CHECK(ARMGICv3Class, (klass), TYPE_ARM_GICV3)
+#define ARM_GICV3_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(ARMGICv3Class, (obj), TYPE_ARM_GICV3)
+
+typedef struct ARMGICv3Class {
+    /*< private >*/
+    ARMGICv3CommonClass parent_class;
+    /*< public >*/
+
+    DeviceRealize parent_realize;
+} ARMGICv3Class;
+
+#endif
-- 
1.9.1

