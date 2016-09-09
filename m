Received: by 10.80.163.71 with SMTP id 65csp212130edn;
        Fri, 9 Sep 2016 10:31:16 -0700 (PDT)
X-Received: by 10.237.42.165 with SMTP id t34mr5481446qtd.106.1473442276062;
        Fri, 09 Sep 2016 10:31:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c134si2720600qkg.168.2016.09.09.10.31.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPdz-0001Zh-Dt
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:31:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdt-0001WY-OB
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdr-0005Qs-8U
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPdr-0005Qj-04; Fri, 09 Sep 2016 13:31:07 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86C3289C2C;
	Fri,  9 Sep 2016 17:31:06 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQt024546; Fri, 9 Sep 2016 13:31:03 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:34 +0200
Message-Id: <1473442237-3746-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 09 Sep 2016 17:31:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 5/8] hw/intc/arm_gicv3_its: Implement support
 for in-kernel ITS emulation
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sbg9sILo6Ke7

From: Pavel Fedin <p.fedin@samsung.com>

The ITS control frame is in-kernel emulated while accesses to the
GITS_TRANSLATER are mediated through the KVM_SIGNAL_MSI ioctl (MSI
direct MSI injection advertised by the CAP_SIGNAL_MSI capability)

the kvm_gsi_direct_mapping is explicitly set to false to emphasize the
difference with GICv2M. Direct mapping cannot work with ITS since
the content of the MSI data is not the target interrupt ID but an
eventd id.

GSI routing is advertised (kvm_gsi_routing_allowed) as well as
msi/irqfd signaling (kvm_msi_via_irqfd_allowed).

A machine init done notifier still is used to compute the MSI frame
(GITS_TRANSLATER) GPA, which is passed through KVM_SIGNAL_MSI ioctl.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v5 -> v6:
- now the kernel ITS init sequence has changed let's use the
  kvm_arm_register_device to set the CTRL frame base address
- use extract64()
- add migration blocker
- remove kvm_gsi_routing_allowed setting which is set in GICv3
  KVM device realize
- add migration_blocker

v3 -> v4:
- include "qemu/osdep.h" and  "qapi/error.h"
- rename KVM_VGIC_V3_ADDR_TYPE_ITS into KVM_VGIC_ITS_ADDR_TYPE
- reword commit message
- change kvm_msi_via_irqfd_allowed definition (attached to irqfd dynamic
  availability + MSI controller availability)
- create the ITS KVM device (previously abstracted by the GICv3 KVM device)
- init sequence changed
- absolute GITS_TRANSLATER GPA stored

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/Makefile.objs       |   1 +
 hw/intc/arm_gicv3_its_kvm.c | 136 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_its_kvm.c

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 23a39f7..9cca280 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -22,6 +22,7 @@ common-obj-$(CONFIG_OPENPIC) += openpic.o
 obj-$(CONFIG_APIC) += apic.o apic_common.o
 obj-$(CONFIG_ARM_GIC_KVM) += arm_gic_kvm.o
 obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_kvm.o
+obj-$(call land,$(CONFIG_ARM_GIC_KVM),$(TARGET_AARCH64)) += arm_gicv3_its_kvm.o
 obj-$(CONFIG_STELLARIS) += armv7m_nvic.o
 obj-$(CONFIG_EXYNOS4) += exynos4210_gic.o exynos4210_combiner.o
 obj-$(CONFIG_GRLIB) += grlib_irqmp.o
diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
new file mode 100644
index 0000000..b9d10dc
--- /dev/null
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -0,0 +1,136 @@
+/*
+ * KVM-based ITS implementation for a GICv3-based system
+ *
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Written by Pavel Fedin <p.fedin@samsung.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/intc/arm_gicv3_its_common.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/kvm.h"
+#include "kvm_arm.h"
+#include "migration/migration.h"
+
+#define TYPE_KVM_ARM_ITS "arm-its-kvm"
+#define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
+
+static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
+{
+    struct kvm_msi msi;
+
+    msi.address_lo = extract64(s->gits_translater_gpa, 0, 32);
+    msi.address_hi = extract64(s->gits_translater_gpa, 32, 32);
+    msi.data = le32_to_cpu(value);
+    msi.flags = KVM_MSI_VALID_DEVID;
+    msi.devid = devid;
+    memset(msi.pad, 0, sizeof(msi.pad));
+
+    return kvm_vm_ioctl(kvm_state, KVM_SIGNAL_MSI, &msi);
+}
+
+typedef struct ItsInitNotifierParams {
+    Notifier notifier;
+    GICv3ITSState *s;
+} ItsInitNotifierParams;
+
+/* this notifier computes and stores the ITS MSI frame GPA */
+static void its_notify(Notifier *notifier, void *data)
+{
+    ItsInitNotifierParams *p = DO_UPCAST(ItsInitNotifierParams,
+                                         notifier, notifier);
+    GICv3ITSState *s = p->s;
+    MemoryRegion *mr = &s->iomem_its_translation;
+    MemoryRegionSection mrs;
+    uint64_t addr;
+
+    mrs = memory_region_find(mr, 0, 1);
+    addr = mrs.offset_within_address_space;
+    s->gits_translater_gpa = addr + 0x40;
+}
+
+static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
+{
+    GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
+    ItsInitNotifierParams *p = g_new(ItsInitNotifierParams, 1);
+
+    s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
+    if (s->dev_fd < 0) {
+        error_setg_errno(errp, -s->dev_fd, "error creating in-kernel ITS");
+        return;
+    }
+
+    /* explicit init if the ITS */
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true);
+
+    /* register the base address */
+    kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
+                            KVM_VGIC_ITS_ADDR_TYPE, s->dev_fd);
+
+    gicv3_its_init_mmio(s, NULL);
+
+    p->notifier.notify = its_notify;
+    p->s = s;
+    qemu_add_machine_init_done_notifier(&p->notifier);
+
+    /*
+     * Block migration of a KVM GICv3 ITS device: the API for saving and
+     * restoring the state in the kernel is not yet available
+     */
+    error_setg(&s->migration_blocker, "vITS migration is not implemented");
+    migrate_add_blocker(s->migration_blocker);
+
+    kvm_msi_use_devid = true;
+    kvm_gsi_direct_mapping = false;
+    kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
+}
+
+static void kvm_arm_its_init(Object *obj)
+{
+    GICv3ITSState *s = KVM_ARM_ITS(obj);
+
+    object_property_add_link(obj, "parent-gicv3",
+                             "kvm-arm-gicv3", (Object **)&s->gicv3,
+                             object_property_allow_set_link,
+                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
+                             &error_abort);
+}
+
+static void kvm_arm_its_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    GICv3ITSCommonClass *icc = ARM_GICV3_ITS_COMMON_CLASS(klass);
+
+    dc->realize = kvm_arm_its_realize;
+    icc->send_msi = kvm_its_send_msi;
+}
+
+static const TypeInfo kvm_arm_its_info = {
+    .name = TYPE_KVM_ARM_ITS,
+    .parent = TYPE_ARM_GICV3_ITS_COMMON,
+    .instance_size = sizeof(GICv3ITSState),
+    .instance_init = kvm_arm_its_init,
+    .class_init = kvm_arm_its_class_init,
+};
+
+static void kvm_arm_its_register_types(void)
+{
+    type_register_static(&kvm_arm_its_info);
+}
+
+type_init(kvm_arm_its_register_types)
-- 
2.5.5

