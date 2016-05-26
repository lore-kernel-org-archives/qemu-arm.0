Received: by 10.25.30.65 with SMTP id e62csp549555lfe;
        Thu, 26 May 2016 08:24:55 -0700 (PDT)
X-Received: by 10.140.34.97 with SMTP id k88mr9107567qgk.85.1464276295210;
        Thu, 26 May 2016 08:24:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i62si13375902qtd.83.2016.05.26.08.24.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:24:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38963 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5x9a-0006gv-Gc
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:24:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9I-0006SL-7w
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9H-0004Wk-1Q
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9G-0004Uz-QV; Thu, 26 May 2016 11:24:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whN-00046Z-G6; Thu, 26 May 2016 15:55:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:26 +0100
Message-Id: <1464274540-19693-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 08/22] hw/intc/arm_gicv3: Add vmstate
 descriptors
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
X-TUID: Yyotinl0uSyq

From: Pavel Fedin <p.fedin@samsung.com>

Add state structure descriptors for the GICv3 state. We mark
the KVM GICv3 device as having a migration blocker until the
code to save and restore the state in the kernel is implemented.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
[PMM: Adjust to renamed struct fields; switched to using uint32_t
 array backed bitmaps; add migration blocker setting]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 50 +++++++++++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gicv3_kvm.c    |  7 +++++++
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 1557833..d1714e4 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -49,11 +49,59 @@ static int gicv3_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static const VMStateDescription vmstate_gicv3_cpu = {
+    .name = "arm_gicv3_cpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(level, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
+        VMSTATE_UINT32_ARRAY(gicr_statusr, GICv3CPUState, 2),
+        VMSTATE_UINT32(gicr_waker, GICv3CPUState),
+        VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
+        VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
+        VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_iactiver0, GICv3CPUState),
+        VMSTATE_UINT32(edge_trigger, GICv3CPUState),
+        VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
+        VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
+        VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
+        VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
+        VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 3),
+        VMSTATE_UINT64_2DARRAY(icc_apr, GICv3CPUState, 3, 4),
+        VMSTATE_UINT64_ARRAY(icc_igrpen, GICv3CPUState, 3),
+        VMSTATE_UINT64(icc_ctlr_el3, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
-    .unmigratable = 1,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .pre_save = gicv3_pre_save,
     .post_load = gicv3_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(gicd_ctlr, GICv3State),
+        VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
+        VMSTATE_UINT32_ARRAY(group, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(grpmod, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(enabled, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(pending, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(active, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(level, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT32_ARRAY(edge_trigger, GICv3State, GICV3_BMP_SIZE),
+        VMSTATE_UINT8_ARRAY(gicd_ipriority, GICv3State, GICV3_MAXIRQ),
+        VMSTATE_UINT64_ARRAY(gicd_irouter, GICv3State, GICV3_MAXIRQ),
+        VMSTATE_UINT32_ARRAY(gicd_nsacr, GICv3State,
+                             DIV_ROUND_UP(GICV3_MAXIRQ, 16)),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
+                                             vmstate_gicv3_cpu, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index acc1730..d08808d 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -119,6 +119,13 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
     kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
+
+    /* Block migration of a KVM GICv3 device: the API for saving and restoring
+     * the state in the kernel is not yet finalised in the kernel or
+     * implemented in QEMU.
+     */
+    error_setg(&s->migration_blocker, "vGICv3 migration is not implemented");
+    migrate_add_blocker(s->migration_blocker);
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
1.9.1

