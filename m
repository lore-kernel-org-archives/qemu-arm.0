Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp78486wre;
        Thu, 31 May 2018 18:40:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQvB2NQmc9CxAR+Bir3F2D+iStxhQS/4AKq4dOXPcj7BO5RBePHWzh5AOLNavnbv0TACTd
X-Received: by 2002:ac8:3854:: with SMTP id r20-v6mr9074267qtb.190.1527817235570;
        Thu, 31 May 2018 18:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527817235; cv=none;
        d=google.com; s=arc-20160816;
        b=gCaWZv4pLnrxpWPlVzw5BW9Hy9a7mLzXiVEAzGnOYF6/DrJOn3GyI1C9/+MsyaR9j1
         X9f6Az8Mm4Ale/XZw1TnBPvJc8SVQesRPmWBw44fi50Vdhw+u1xjQiMTBUFpwWzVejx5
         8PJgWzwEy0wkeDx5k+LqdZL2Vq2yChrQpOO4imkyqzDg3lqOT1YB/AHUC/5cJg119wEU
         XVoxrbKNmEvdwLGDenWFGyjtDFPDPcdMZv+nExi4IZ+vWMfbFFAb4cbTIrjwix1sHhRu
         6m/2ACzmCVfkK2ITeZmC4NZ7Yvl+kIb4qrB3x+xj8Sx12na2nugFiUdyN/essXilh4TN
         7ArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=9FMmTGwdx7CQ0hHQeigHc6Fu++sw1HSOeKvWA0TQWmQ=;
        b=dY+M6rceQ4fGatCNE8AIpAgJI4WDVP9tElxq/Cs+MKt7pl0wsvfGn9QQIN/lVMPe/H
         QNo+hFcEGptiJrFd8J+xQD/Qbb95Ck14C5YKcPOWhq09wggCWeBGBtwK/vaQMG0MSq0B
         X0ncYL6SRTelq0BiF/Sw3P9xJ2V2xcV9F8fvMSksIoWMRs4LVP1pM96DAj3UFmhIXwWs
         ksY9GkMuPToWwHGxzKl2LW5RhxLoMmtX9FJMSZwg4Ov+vNkcdlQ9MasH56U37dsQOiNZ
         NyuGT/Kf/qCdtKFIUKqLHAEy4Lac3m5WHytF5ECu6uSUSUz1U5a6P1QnQypwi/NVr9LH
         UTBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w32-v6si1117107qtj.301.2018.05.31.18.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 May 2018 18:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOZ3S-0004C7-Us
	for alex.bennee@linaro.org; Thu, 31 May 2018 21:40:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOZ0E-0001mt-UK
	for qemu-arm@nongnu.org; Thu, 31 May 2018 21:37:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOZ0A-00068y-St
	for qemu-arm@nongnu.org; Thu, 31 May 2018 21:37:14 -0400
Received: from [45.249.212.32] (port=49498 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOZ0A-000654-8U; Thu, 31 May 2018 21:37:10 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 50A0B5B1BD474;
	Fri,  1 Jun 2018 09:37:04 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.382.0; Fri, 1 Jun 2018 09:36:58 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Fri, 1 Jun 2018 09:36:27 +0800
Message-ID: <1527816987-16108-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v6] arm_gicv3_kvm: kvm_dist_get/put: skip the
 registers banked by GICR
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, qemu-stable@nongnu.org,
	qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
	Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AMGgAPArxk9Q

While we skip the GIC_INTERNAL irqs, we don't change the register offset
accordingly. This will overlap the GICR registers value and leave the
last GIC_INTERNAL irq's registers out of update.

Fix this by skipping the registers banked by GICR.

Also for migration compatibility if the migration source (old version
qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
we shift the data of PPI to get the right data for SPI.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
V6: Fix typos and keep same with offset for clroffset 
---
 hw/intc/arm_gicv3_common.c         | 79 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 38 ++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 118 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..864b7c6 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -27,6 +27,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
+#include "sysemu/kvm.h"
 
 static int gicv3_pre_save(void *opaque)
 {
@@ -141,6 +142,79 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     }
 };
 
+static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+   /*
+    * The gicd_no_migration_shift_bug flag is used for migration compatibility
+    * for old version QEMU which may have the GICD bmp shift bug under KVM mode.
+    * Strictly, what we want to know is whether the migration source is using
+    * KVM. Since we don't have any way to determine that, we look at whether the
+    * destination is using KVM; this is close enough because for the older QEMU
+    * versions with this bug KVM -> TCG migration didn't work anyway. If the
+    * source is a newer QEMU without this bug it will transmit the migration
+    * subsection which sets the flag to true; otherwise it will remain set to
+    * the value we select here.
+    */
+    if (kvm_enabled()) {
+        cs->gicd_no_migration_shift_bug = false;
+    }
+
+    return 0;
+}
+
+static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
+                                                       int version_id)
+{
+    GICv3State *cs = opaque;
+
+    if (cs->gicd_no_migration_shift_bug) {
+        return 0;
+    }
+
+    /* Older versions of QEMU had a bug in the handling of state save/restore
+     * to the KVM GICv3: they got the offset in the bitmap arrays wrong,
+     * so that instead of the data for external interrupts 32 and up
+     * starting at bit position 32 in the bitmap, it started at bit
+     * position 64. If we're receiving data from a QEMU with that bug,
+     * we must move the data down into the right place.
+     */
+    memmove(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
+            sizeof(cs->group) - GIC_INTERNAL / 8);
+    memmove(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
+            sizeof(cs->grpmod) - GIC_INTERNAL / 8);
+    memmove(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
+            sizeof(cs->enabled) - GIC_INTERNAL / 8);
+    memmove(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
+            sizeof(cs->pending) - GIC_INTERNAL / 8);
+    memmove(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
+            sizeof(cs->active) - GIC_INTERNAL / 8);
+    memmove(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
+            sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
+
+    /*
+     * While this new version QEMU doesn't have this kind of bug as we fix it,
+     * so it needs to set the flag to true to indicate that and it's necessary
+     * for next migration to work from this new version QEMU.
+     */
+    cs->gicd_no_migration_shift_bug = true;
+
+    return 0;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
+    .name = "arm_gicv3/gicd_no_migration_shift_bug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
+    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -165,6 +239,10 @@ static const VMStateDescription vmstate_gicv3 = {
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
                                              vmstate_gicv3_cpu, GICv3CPUState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gicv3_gicd_no_migration_shift_bug,
+        NULL
     }
 };
 
@@ -364,6 +442,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
             gicv3_gicd_group_set(s, i);
         }
     }
+    s->gicd_no_migration_shift_bug = true;
 }
 
 static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 147e691..bc6fa41 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -178,6 +178,14 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     * This matches the for_each_dist_irq_reg() macro which also skips the
+     * first GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 2) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         kvm_gicd_access(s, offset, &reg, false);
         reg = half_unshuffle32(reg >> 1);
@@ -195,6 +203,14 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     * This matches the for_each_dist_irq_reg() macro which also skips the
+     * first GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 2) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         reg = *gic_bmp_ptr32(bmp, irq);
         if (irq % 32 != 0) {
@@ -236,6 +252,15 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
+     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
+     * functionality is replaced by the GICR registers. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     * This matches the for_each_dist_irq_reg() macro which also skips the
+     * first GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 1) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         kvm_gicd_access(s, offset, &reg, false);
         *gic_bmp_ptr32(bmp, irq) = reg;
@@ -249,6 +274,19 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
+     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
+     * functionality is replaced by the GICR registers. It doesn't need to sync
+     * them. So it should increase the offset and clroffset to skip GIC_INTERNAL
+     * irqs. This matches the for_each_dist_irq_reg() macro which also skips the
+     * first GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 1) / 8;
+    if (clroffset != 0) {
+        clroffset += (GIC_INTERNAL * 1) / 8;
+    }
+
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         /* If this bitmap is a set/clear register pair, first write to the
          * clear-reg to clear all bits before using the set-reg to write
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index bccdfe1..d75b49d 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -217,6 +217,7 @@ struct GICv3State {
     uint32_t revision;
     bool security_extn;
     bool irq_reset_nonsecure;
+    bool gicd_no_migration_shift_bug;
 
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
-- 
2.0.4


