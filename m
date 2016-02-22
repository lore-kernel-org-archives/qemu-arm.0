Received: by 10.25.208.211 with SMTP id h202csp1392499lfg;
        Mon, 22 Feb 2016 13:07:45 -0800 (PST)
X-Received: by 10.55.201.81 with SMTP id q78mr6585877qki.98.1456175263739;
        Mon, 22 Feb 2016 13:07:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b75si31111404qhb.42.2016.02.22.13.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxhm-00009C-Sn
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:07:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgA-0005LX-SG
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxg9-0004Ds-S1
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:02 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXxg7-0004CT-AB; Mon, 22 Feb 2016 16:05:59 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2u-0001RN-FC; Mon, 22 Feb 2016 20:25:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:20 +0000
Message-Id: <1456172720-12650-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-arm] [RFC 5/5] hw/intc/arm_gicv3_common: Add vmstate
	descriptors
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
X-TUID: LV5i0UhNx6b4

From: Pavel Fedin <p.fedin@samsung.com>

Add state structure descriptors and actually enable live migration.

In order to describe fixed-size bitmaps, VMSTATE_BITMAP_STATIC() macro is
introduced.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
[PMM: Adjust to renamed struct fields]
---
 hw/intc/arm_gicv3_common.c  | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 include/migration/vmstate.h |  9 +++++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index a1ce4c1..e1078a5 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -48,11 +48,54 @@ static int gicv3_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static const VMStateDescription vmstate_gicv3_cpu = {
+    .name = "arm_gicv3_cpu",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(level, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
+        VMSTATE_UINT32(gicr_waker, GICv3CPUState),
+        VMSTATE_UINT64(gicr_propbaser, GICv3CPUState),
+        VMSTATE_UINT64(gicr_pendbaser, GICv3CPUState),
+        VMSTATE_UINT32(gicr_igroupr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_iactiver0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_icfgr0, GICv3CPUState),
+        VMSTATE_UINT32(gicr_icfgr1, GICv3CPUState),
+        VMSTATE_UINT8_ARRAY(gicr_ipriorityr, GICv3CPUState, GIC_INTERNAL),
+        VMSTATE_UINT64_ARRAY(icc_ctlr_el1, GICv3CPUState, 2),
+        VMSTATE_UINT64(icc_pmr_el1, GICv3CPUState),
+        VMSTATE_UINT64_ARRAY(icc_bpr, GICv3CPUState, 2),
+        VMSTATE_UINT64_2DARRAY(icc_ap1r, GICv3CPUState, 4, 2),
+        VMSTATE_UINT64(icc_igrpen0_el1, GICv3CPUState),
+        VMSTATE_UINT64(icc_igrpen1_el1, GICv3CPUState),
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
+        VMSTATE_BITMAP_STATIC(group, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_BITMAP_STATIC(enabled, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_BITMAP_STATIC(pending, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_BITMAP_STATIC(active, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_BITMAP_STATIC(level, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_BITMAP_STATIC(edge_trigger, GICv3State , 0, GICV3_MAXSPI),
+        VMSTATE_UINT8_ARRAY(gicd_ipriority, GICv3State, GICV3_MAXSPI),
+        VMSTATE_UINT8_ARRAY(gicd_itargetsr, GICv3State, GICV3_MAXSPI),
+        VMSTATE_UINT64_ARRAY(gicd_irouter, GICv3State, GICV3_MAXSPI),
+        VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
+                                             vmstate_gicv3_cpu, GICv3CPUState),
+        VMSTATE_END_OF_LIST()
+    }
 };
 
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ecc4992..934809a 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -564,6 +564,15 @@ extern const VMStateInfo vmstate_info_bitmap;
     .offset       = offsetof(_state, _field),                        \
 }
 
+#define VMSTATE_BITMAP_STATIC(_field, _state, _version, _size) {     \
+    .name         = (stringify(_field)),                             \
+    .version_id   = (_version),                                      \
+    .size         = (_size),                                         \
+    .info         = &vmstate_info_bitmap,                            \
+    .flags        = VMS_BUFFER,                                      \
+    .offset       = offsetof(_state, _field),                        \
+}
+
 /* _f : field name
    _f_n : num of elements field_name
    _n : num of elements
-- 
1.9.1

