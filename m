Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5444094wre;
        Wed, 30 May 2018 20:17:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIuufqhKtF4ar4qchQg+BVoYRQV2k8Jysj1A4m/t1m0VbAnPXd0eiW8SrIJje3s0lFe1lET
X-Received: by 2002:ac8:1bb7:: with SMTP id z52-v6mr4745139qtj.361.1527736625451;
        Wed, 30 May 2018 20:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527736625; cv=none;
        d=google.com; s=arc-20160816;
        b=soX7ut43QXz8b39mcSmd6YbeDI1nFkB4oEv0uFOWJ8r4wAUtJyjkphkJxbBxMuVhn4
         mMkKZvWctvTTUnAmplFDBwbtaapSEIVEIPRweNoE9xU8I+0XYGPaV25WGQqAKB0PBW4t
         RvfTVGu10Z9SRT8DpYvYvt0yQm/4kMzesbLX3GXrvCNfLxHf56QTQ/2ZXBUvjkD3Xc0S
         TPDuJQp+RRq9Wc6AcVurJa8nVRip9+ObXTgo/yp+Cd7CDUMe7CPtOenc8/5paxlkBCUR
         Po5+PF3JM4X+tkqE/6refvP3K70NEQtfrf4QJCIRAPG1TVfjIfSXFux5rXJb0BUpZoK3
         JfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=76xqzaOzWCM0bA753lhh4E7BgkuTs4E8ABweTtwkK1g=;
        b=BXrK1qMdEyJsYAQLkHfynkTBOiTQTJMk7VisMotmeXSDEhA8xcpoDjUAV5tNq1jvhf
         bEyUPzG4ia0TkT/LTIZdiDwL6dwqgCLBLCcdyjclyZZHtySRZMvCCZWeIUxvN5mJajkW
         Dw/rBt8O0ZFP7M5hmSluC0J8UEII8RZgaE4SO4JTp+wIQ/fBkTyb8ICNfXRq68cE5LtG
         WKkUHugsou2GBimfSsarMngvSGu/NsLG8CbEyvzIfv6yPjYjMr8HUiMobNJl+ZDOgdZQ
         R+/5r1n7PBqSss26ko9VbS3jyllyWqKDij82kAgGGaXHPUZjZSndprKaRt+bee1vyQex
         3a8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30-v6si8202398qtg.171.2018.05.30.20.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOE5I-0004R5-Qd
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:17:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE55-0004OD-5r
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fOE50-0004Wt-9L
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:16:50 -0400
Received: from [45.249.212.35] (port=40701 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fOE4z-0004Uu-LQ; Wed, 30 May 2018 23:16:46 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id D2FB980A5756E;
	Thu, 31 May 2018 11:16:39 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:16:33 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Thu, 31 May 2018 11:15:57 +0800
Message-ID: <1527736557-11084-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527736557-11084-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v5 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip the
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
X-TUID: 85pthBcJTrwO

While we skip the GIC_INTERNAL irqs, we don't change the register offset
accordingly. This will overlap the GICR registers value and leave the
last GIC_INTERNAL irq's registers out of update.

Fix this by skipping the registers banked by GICR.

Also for migration compatibility if the migration source (old version
qemu) doesn't send gicd_no_migration_shift_bug = 1 to destination, then
we shift the data of PPI to get the right data for SPI.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_common.c         | 79 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 38 ++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 118 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..68211a2 100644
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
+    * The gicd_no_migration_shift_bug flag is used for migration compatibilty
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
+     * so it's need to set the flag to true to indicate that and it's neccessary
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
index 147e691..001d82b 100644
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
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     * This matches the for_each_dist_irq_reg() macro which also skips the
+     * first GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 1) / 8;
+    if (clroffset != 0) {
+        clroffset += (1 * sizeof(uint32_t));
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


