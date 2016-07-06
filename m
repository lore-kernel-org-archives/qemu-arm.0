Received: by 10.25.21.96 with SMTP id l93csp753337lfi;
        Wed, 6 Jul 2016 02:46:43 -0700 (PDT)
X-Received: by 10.55.156.7 with SMTP id f7mr29352662qke.123.1467798403716;
        Wed, 06 Jul 2016 02:46:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z21si1712317qta.67.2016.07.06.02.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jul 2016 02:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bKjPn-0000Ye-0w
	for alex.bennee@linaro.org; Wed, 06 Jul 2016 05:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPe-0000Kg-6J
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 05:46:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bKjPb-0006zk-8O
	for qemu-arm@nongnu.org; Wed, 06 Jul 2016 05:46:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bKjPa-0006zN-W3; Wed, 06 Jul 2016 05:46:31 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B6DB3F724;
	Wed,  6 Jul 2016 09:46:30 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-81.ams2.redhat.com
	[10.36.6.81])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u669kPEG013861; Wed, 6 Jul 2016 05:46:28 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Wed,  6 Jul 2016 11:45:59 +0200
Message-Id: <1467798364-9049-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
References: <1467798364-9049-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 06 Jul 2016 09:46:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 1/6] hw/intc/arm_gicv3_its: Implement ITS base
 class
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
Cc: diana.craciun@freescale.com, shlomopongratz@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wFfTNg8BIMCJ

From: Pavel Fedin <p.fedin@samsung.com>

This is the basic skeleton for both KVM and software-emulated ITS.
Since we already prepare status structure, we also introduce complete
VMState description. But, because we currently have no migratable
implementations, we also set unmigratable flag.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- fix compilation error
- msi_supported -> msi_nonbroken
- streamid -> requester_id
- use PRIx64
- read ops uses _with_attrs form
- 16/32b write access allowed to GITS_TRANSLATER
- move its_class_name in kvm_arm.h and remove #ifdef TARGET_AARCH64
- add new kvm device dev_fd field
- add new gits_translater_gpa field in GICv3ITSState
---
 hw/intc/Makefile.objs                  |   1 +
 hw/intc/arm_gicv3_its_common.c         | 155 +++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_its_common.h |  75 ++++++++++++++++
 target-arm/kvm_arm.h                   |  19 ++++
 4 files changed, 250 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_its_common.c
 create mode 100644 include/hw/intc/arm_gicv3_its_common.h

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 530df2e..2f04792 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -16,6 +16,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_dist.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_redist.o
+common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_its_common.o
 common-obj-$(CONFIG_OPENPIC) += openpic.o
 
 obj-$(CONFIG_APIC) += apic.o apic_common.o
diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
new file mode 100644
index 0000000..346e37d
--- /dev/null
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -0,0 +1,155 @@
+/*
+ * ITS base class for a GICv3-based system
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Written by Pavel Fedin
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/pci/msi.h"
+#include "hw/intc/arm_gicv3_its_common.h"
+#include "qemu/log.h"
+
+static void gicv3_its_pre_save(void *opaque)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
+
+    if (c->pre_save) {
+        c->pre_save(s);
+    }
+}
+
+static int gicv3_its_post_load(void *opaque, int version_id)
+{
+    GICv3ITSState *s = (GICv3ITSState *)opaque;
+    GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
+
+    if (c->post_load) {
+        c->post_load(s);
+    }
+    return 0;
+}
+
+static const VMStateDescription vmstate_its = {
+    .name = "arm_gicv3_its",
+    .pre_save = gicv3_its_pre_save,
+    .post_load = gicv3_its_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctlr, GICv3ITSState),
+        VMSTATE_UINT64(cbaser, GICv3ITSState),
+        VMSTATE_UINT64(cwriter, GICv3ITSState),
+        VMSTATE_UINT64(creadr, GICv3ITSState),
+        VMSTATE_UINT64_ARRAY(baser, GICv3ITSState, 8),
+        VMSTATE_END_OF_LIST()
+    },
+    .unmigratable = true,
+};
+
+static MemTxResult gicv3_its_trans_read(void *opaque, hwaddr offset,
+                                        uint64_t *data, unsigned size,
+                                        MemTxAttrs attrs)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "ITS read at offset 0x%"PRIx64"\n", offset);
+    return MEMTX_ERROR;
+}
+
+static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
+                                         uint64_t value, unsigned size,
+                                         MemTxAttrs attrs)
+{
+    if (offset == 0x0040 && ((size == 2) || (size == 4))) {
+        GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
+        GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
+        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
+
+        if (ret) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "ITS: Error sending MSI: %s\n", strerror(-ret));
+            return MEMTX_DECODE_ERROR;
+        }
+
+        return MEMTX_OK;
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS write at bad offset 0x%jX\n", offset);
+        return MEMTX_DECODE_ERROR;
+    }
+}
+
+static const MemoryRegionOps gicv3_its_trans_ops = {
+    .read_with_attrs = gicv3_its_trans_read,
+    .write_with_attrs = gicv3_its_trans_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
+
+    memory_region_init_io(&s->iomem_its_cntrl, OBJECT(s), ops, s,
+                          "control", ITS_CONTROL_SIZE);
+    memory_region_init_io(&s->iomem_its, OBJECT(s), &gicv3_its_trans_ops, s,
+                          "translation", ITS_TRANS_SIZE);
+
+    /* Our two regions are always adjacent, therefore we now combine them
+     * into a single one in order to make our users' life easier.
+     */
+    memory_region_init(&s->iomem_main, OBJECT(s), "gicv3_its", ITS_SIZE);
+    memory_region_add_subregion(&s->iomem_main, 0, &s->iomem_its_cntrl);
+    memory_region_add_subregion(&s->iomem_main, ITS_CONTROL_SIZE,
+                                &s->iomem_its);
+    sysbus_init_mmio(sbd, &s->iomem_main);
+
+    msi_nonbroken = true;
+}
+
+static void gicv3_its_common_reset(DeviceState *dev)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+
+    s->ctlr = 0;
+    s->cbaser = 0;
+    s->cwriter = 0;
+    s->creadr = 0;
+    memset(&s->baser, 0, sizeof(s->baser));
+
+    gicv3_its_post_load(s, 0);
+}
+
+static void gicv3_its_common_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = gicv3_its_common_reset;
+    dc->vmsd = &vmstate_its;
+}
+
+static const TypeInfo gicv3_its_common_info = {
+    .name = TYPE_ARM_GICV3_ITS_COMMON,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(GICv3ITSState),
+    .class_size = sizeof(GICv3ITSCommonClass),
+    .class_init = gicv3_its_common_class_init,
+    .abstract = true,
+};
+
+static void gicv3_its_common_register_types(void)
+{
+    type_register_static(&gicv3_its_common_info);
+}
+
+type_init(gicv3_its_common_register_types)
diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
new file mode 100644
index 0000000..b590f90
--- /dev/null
+++ b/include/hw/intc/arm_gicv3_its_common.h
@@ -0,0 +1,75 @@
+/*
+ * ITS support for ARM GICv3
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Written by Pavel Fedin
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_ARM_GICV3_ITS_COMMON_H
+#define QEMU_ARM_GICV3_ITS_COMMON_H
+
+#include "hw/sysbus.h"
+#include "hw/intc/arm_gicv3_common.h"
+
+#define ITS_CONTROL_SIZE 0x10000
+#define ITS_TRANS_SIZE   0x10000
+#define ITS_SIZE         (ITS_CONTROL_SIZE + ITS_TRANS_SIZE)
+
+struct GICv3ITSState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem_main;
+    MemoryRegion iomem_its_cntrl;
+    MemoryRegion iomem_its;
+
+    GICv3State *gicv3;
+
+    int dev_fd; /* kvm device fd if backed by kvm vgic support */
+    uint64_t gits_translater_gpa;
+
+    /* Registers */
+    uint32_t ctlr;
+    uint64_t cbaser;
+    uint64_t cwriter;
+    uint64_t creadr;
+    uint64_t baser[8];
+};
+
+typedef struct GICv3ITSState GICv3ITSState;
+
+void gicv3_its_init_mmio(GICv3ITSState *s, const MemoryRegionOps *ops);
+
+#define TYPE_ARM_GICV3_ITS_COMMON "arm-gicv3-its-common"
+#define ARM_GICV3_ITS_COMMON(obj) \
+     OBJECT_CHECK(GICv3ITSState, (obj), TYPE_ARM_GICV3_ITS_COMMON)
+#define ARM_GICV3_ITS_COMMON_CLASS(klass) \
+     OBJECT_CLASS_CHECK(GICv3ITSCommonClass, (klass), TYPE_ARM_GICV3_ITS_COMMON)
+#define ARM_GICV3_ITS_COMMON_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(GICv3ITSCommonClass, (obj), TYPE_ARM_GICV3_ITS_COMMON)
+
+struct GICv3ITSCommonClass {
+    /*< private >*/
+    SysBusDeviceClass parent_class;
+    /*< public >*/
+
+    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
+    void (*pre_save)(GICv3ITSState *s);
+    void (*post_load)(GICv3ITSState *s);
+};
+
+typedef struct GICv3ITSCommonClass GICv3ITSCommonClass;
+
+#endif
diff --git a/target-arm/kvm_arm.h b/target-arm/kvm_arm.h
index a419368..544e404 100644
--- a/target-arm/kvm_arm.h
+++ b/target-arm/kvm_arm.h
@@ -255,4 +255,23 @@ struct kvm_guest_debug_arch;
 
 void kvm_arm_copy_hw_debug_data(struct kvm_guest_debug_arch *ptr);
 
+/**
+ * its_class_name
+ *
+ * Return the ITS class name to use depending on whether KVM acceleration
+ * and KVM CAP_SIGNAL_MSI are supported
+ *
+ * Returns: class name to use or NULL
+ */
+static inline const char *its_class_name(void)
+{
+    if (kvm_irqchip_in_kernel()) {
+        /* KVM implementation requires this capability */
+        return kvm_direct_msi_enabled() ? "arm-its-kvm" : NULL;
+    } else {
+        /* Software emulation is not implemented yet */
+        return NULL;
+    }
+}
+
 #endif
-- 
2.5.5

