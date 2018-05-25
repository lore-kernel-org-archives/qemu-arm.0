Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2924806wre;
        Fri, 25 May 2018 04:23:43 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ/Ba6/DKpW1Hb/KWv0p1Iz9MfdxmRFPMeuTXMnqoHnNyNy5dwFzysWzxYexoBle2hFvj/y
X-Received: by 2002:ac8:3f23:: with SMTP id c32-v6mr1685824qtk.286.1527247423335;
        Fri, 25 May 2018 04:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527247423; cv=none;
        d=google.com; s=arc-20160816;
        b=c12xLK/+2u5l6N3rqAqNB1xKtfBNu+gUZbTu3PwBphpvrhliGhUHyXY4yvtx6xldMn
         pjpT1lywDqvjHsh0XBPOjU5kTF6hHc4o3T6UGS0BxaPuQTxW9lOC4BWYAGrz1lnPwvws
         JZwpWRWnRxPXgrkeRO6/zrVPEp39VCjWgF1835EJJ2KYGpPabjUaqegpH15OHLO3i5z4
         7MCGmuh4ybq9yQmGEiHouLBVQi5SkFz5DczXx1wcHVq0jOtUBHm0YYm83mKrz/nCMtwR
         SPHmlZcoXPHXzuFJQNRdJxf62b54FNi25UJmwJADUfap3p0WCpdQXM0nlp4p9wIkONwS
         3dkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=oI/wIKsq2quu2TVRgDkMCuAwaqPW9Vf6l6oqNAc7ekE=;
        b=lY+uEjBFESvgJWMRjg0ei9ynTdU8Gu+6KJyr2/anKKjBQq7e2PwYbpFPwV/LRZyVPy
         s6bcDyLbwAksIKoEpJu1CpR4/gfMAfiVamQLO8eK1Qdq5fpvSzOGDufOWgfrvSpBH3hq
         oDw2m8AnN7j2keb2XwSWDEI1EJaHROQY0ZSUZRW2ruGLGQKc8Afen3tVlXj0icXAwqe5
         SVsDDNCzov3a63kQvFjrnwRABSNj1vLwk88T/sDGLX5boctcjso7YdSSrtbhhkxiuzhb
         G1wbxcpGNg3E1GTEITJmQvrzOD9tnmblzKB2S1xJDtr/5G2wR9bwmdQxpoCqa4Wp/BpY
         0wOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z19-v6si2283674qtm.214.2018.05.25.04.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 May 2018 04:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43057 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fMAow-0003N6-PJ
	for alex.bennee@linaro.org; Fri, 25 May 2018 07:23:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAod-0003IL-NV
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fMAoZ-0002vI-AC
	for qemu-arm@nongnu.org; Fri, 25 May 2018 07:23:23 -0400
Received: from [45.249.212.35] (port=42617 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fMAoY-0002td-Lv; Fri, 25 May 2018 07:23:19 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id D411E7B375D7D;
	Fri, 25 May 2018 19:23:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server
	id 14.3.382.0; Fri, 25 May 2018 19:23:07 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Fri, 25 May 2018 19:22:51 +0800
Message-ID: <1527247371-10592-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527247371-10592-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v4 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip the
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
X-TUID: 9p6JR7Qx0gXA

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
 hw/intc/arm_gicv3_common.c         | 66 ++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 30 +++++++++++++++++
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 97 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..f72a6f7 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -27,6 +27,7 @@
 #include "hw/intc/arm_gicv3_common.h"
 #include "gicv3_internal.h"
 #include "hw/arm/linux-boot-if.h"
+#include "sysemu/kvm.h"
 
 static int gicv3_pre_save(void *opaque)
 {
@@ -141,6 +142,66 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     }
 };
 
+static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+   /*
+    * The gicd_no_migration_shift_bug flag is used for migration compatibilty
+    * for old version QEMU which may have the GICD bmp shift bug under KVM mode.
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
+    if (gicd_no_migration_shift_bug) {
+        return 0;
+    }
+
+    memcpy(cs->group, (uint8_t *)cs->group + GIC_INTERNAL / 8,
+           sizeof(cs->group) - GIC_INTERNAL / 8);
+    memcpy(cs->grpmod, (uint8_t *)cs->grpmod + GIC_INTERNAL / 8,
+           sizeof(cs->grpmod) - GIC_INTERNAL / 8);
+    memcpy(cs->enabled, (uint8_t *)cs->enabled + GIC_INTERNAL / 8,
+           sizeof(cs->enabled) - GIC_INTERNAL / 8);
+    memcpy(cs->pending, (uint8_t *)cs->pending + GIC_INTERNAL / 8,
+           sizeof(cs->pending) - GIC_INTERNAL / 8);
+    memcpy(cs->active, (uint8_t *)cs->active + GIC_INTERNAL / 8,
+           sizeof(cs->active) - GIC_INTERNAL / 8);
+    memcpy(cs->edge_trigger, (uint8_t *)cs->edge_trigger + GIC_INTERNAL / 8,
+           sizeof(cs->edge_trigger) - GIC_INTERNAL / 8);
+
+    return 0;
+}
+
+static bool gicv3_gicd_no_migration_shift_bug_needed(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+    return cs->gicd_no_migration_shift_bug;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
+    .name = "arm_gicv3/gicd_no_migration_shift_bug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
+    .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
+    .needed = gicv3_gicd_no_migration_shift_bug_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -165,6 +226,10 @@ static const VMStateDescription vmstate_gicv3 = {
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
                                              vmstate_gicv3_cpu, GICv3CPUState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gicv3_gicd_no_migration_shift_bug,
+        NULL
     }
 };
 
@@ -364,6 +429,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
             gicv3_gicd_group_set(s, i);
         }
     }
+    s->gicd_no_migration_shift_bug = true;
 }
 
 static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 147e691..1068444 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -178,6 +178,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 2) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         kvm_gicd_access(s, offset, &reg, false);
         reg = half_unshuffle32(reg >> 1);
@@ -195,6 +201,12 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 2) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         reg = *gic_bmp_ptr32(bmp, irq);
         if (irq % 32 != 0) {
@@ -236,6 +248,13 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
+     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
+     * functionality is replaced by the GICR registers. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
+     */
+    offset += (GIC_INTERNAL * 1) / 8;
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         kvm_gicd_access(s, offset, &reg, false);
         *gic_bmp_ptr32(bmp, irq) = reg;
@@ -249,6 +268,17 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_IGRPMODR0/GICD_ISENABLER0/GICD_ISPENDR0/
+     * GICD_ISACTIVER0 registers are always RAZ/WI. The corresponding
+     * functionality is replaced by the GICR registers. It doesn't need to sync
+     * them. So it should increase the offset to skip GIC_INTERNAL irqs.
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


