Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp325864wre;
        Tue, 22 May 2018 20:55:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJzg1xm+6XWsWmYHoZSMKu7Ju9qN75wcEeHEXoOV8o2Q/EQtvu9L9/AQNxp9f+CxOH/X6kR
X-Received: by 2002:a37:34b:: with SMTP id 72-v6mr975253qkd.407.1527047751443;
        Tue, 22 May 2018 20:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527047751; cv=none;
        d=google.com; s=arc-20160816;
        b=QiEKv5p09yqGiEzma3/Ucdk3QkmU4A6pcLDv7G2cmbpfr968dbL37d064haMcvphlo
         V/4iQAdezO+U3Ps700IxbH5eSm9C+vX2h9SsjROBFvT/CL5sF9tWL8utPrntMV8KCVVm
         emGOQV/0RLb/EkhTnZyGg/alMS2sj3auZL4c/ibJAMlOR+pQlNQCYyyzX9oQ6I9i5yG0
         HO4L7MONUTYDNz5NfFKDP2ZHHyjVPo4LFgfBE1S8L14Iw1QiXUrOPDAnbJorDEe0f2YB
         TCpbZR1XBZqGnX+r8vfRFPKgaOfzjBnEYwKtvKlKOW5rz0fjkqFrWO4q+AtkeeqdJSix
         L5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=BbPl5NdJgtzmuv3EQOocQSaf291EWdhTPxSTkk6NFQU=;
        b=huVHSKw6Ym3j6Aze3rOKmfQCT880Kzk+vDsGSdJMrljUxlq9KwgSQbennc8fv6TX7Q
         eYXXa1CZbuilbzyeVtY8GuHOeeHckxjIV8+9A41pDjkGGrjFbeRqOyR/S5x7zX5yjVsr
         9s32QzIcszto9rsc6YVmUOtKXcIDHQck3PdwaQh3GdXWF7aRxxjoArrcYNCa9v3QBhIN
         dCpy8Ua5QW+DY4pNnWNYSl9cgafgdipMvbWvrPrQHFln+SjSfYUu0vqK4R6uC4sS4q8e
         090/d7EX7HnB7Nhpk/wPmo6gKQ2lhkr/6Cexrg9tXMqw0IQCRMK9SHoQ9nc9VaC1t0wp
         WCJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65-v6si2867738qkg.370.2018.05.22.20.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 20:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLKsQ-0000G4-Rb
	for alex.bennee@linaro.org; Tue, 22 May 2018 23:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLKs3-000093-O6
	for qemu-arm@nongnu.org; Tue, 22 May 2018 23:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fLKrz-0000Yh-Ae
	for qemu-arm@nongnu.org; Tue, 22 May 2018 23:55:27 -0400
Received: from [45.249.212.32] (port=46176 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fLKry-0000XU-Au; Tue, 22 May 2018 23:55:22 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 799241BE7B87F;
	Wed, 23 May 2018 11:55:17 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Wed, 23 May 2018 11:55:08 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Wed, 23 May 2018 11:53:53 +0800
Message-ID: <1527047633-12368-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
References: <1527047633-12368-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH V3 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip the
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
Cc: peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ddd4Y5LJ2c7

While we skip the GIC_INTERNAL irqs, we don't change the register offset
accordingly. This will overlap the GICR registers value and leave the
last GIC_INTERNAL irq's registers out of update.

Fix this by skipping the registers banked by GICR.

Also for migration compatibility if the migration source (old version
qemu) doesn't send gicd_no_shift_bug = 1 to destination, then we shift
the data of PPI to get the right data for SPI.

Fixes: 367b9f527becdd20ddf116e17a3c0c2bbc486920
Cc: qemu-stable@nongnu.org
Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
Changes in V3: add migration compatibility and fix code style
---
 hw/intc/arm_gicv3_common.c         | 36 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_kvm.c            | 56 +++++++++++++++++++++++++++++++++++++-
 include/hw/intc/arm_gicv3_common.h |  1 +
 3 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 7b54d52..f93e5d2 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -141,6 +141,38 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     }
 };
 
+static int gicv3_gicd_no_shift_bug_pre_load(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+   /*
+    * If the gicd_no_shift_bug subsection is not transferred this
+    * means gicd_no_shift_bug is 0x0 (which might not be the same as
+    * our reset value).
+    */
+    cs->gicd_no_shift_bug = 0x0;
+    return 0;
+}
+
+static bool gicv3_gicd_no_shift_bug_needed(void *opaque)
+{
+    GICv3State *cs = opaque;
+
+    return cs->gicd_no_shift_bug;
+}
+
+const VMStateDescription vmstate_gicv3_gicd_no_shift_bug = {
+    .name = "arm_gicv3/gicd_no_shift_bug",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .pre_load = gicv3_gicd_no_shift_bug_pre_load,
+    .needed = gicv3_gicd_no_shift_bug_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(gicd_no_shift_bug, GICv3State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
@@ -165,6 +197,10 @@ static const VMStateDescription vmstate_gicv3 = {
         VMSTATE_STRUCT_VARRAY_POINTER_UINT32(cpu, GICv3State, num_cpu,
                                              vmstate_gicv3_cpu, GICv3CPUState),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gicv3_gicd_no_shift_bug,
+        NULL
     }
 };
 
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3536795..bd961f1 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -136,6 +136,12 @@ static void kvm_dist_get_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     int irq;
 
     field = (uint32_t *)bmp;
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
+     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
+     * sync them.
+     */
+    offset += (8 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         kvm_gicd_access(s, offset, &reg, false);
         *field = reg;
@@ -149,7 +155,18 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     uint32_t reg, *field;
     int irq;
 
-    field = (uint32_t *)bmp;
+    if (!s->gicd_no_shift_bug) {
+        field = (uint32_t *)(bmp + 8 * sizeof(uint32_t));
+    } else {
+        field = (uint32_t *)bmp;
+    }
+
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
+     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
+     * sync them.
+     */
+    offset += (8 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         reg = *field;
         kvm_gicd_access(s, offset, &reg, true);
@@ -164,6 +181,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
+     * them.
+     */
+    offset += (2 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         kvm_gicd_access(s, offset, &reg, false);
         reg = half_unshuffle32(reg >> 1);
@@ -181,6 +204,16 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    if (!s->gicd_no_shift_bug) {
+        bmp += (2 * sizeof(uint32_t));
+    }
+
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
+     * them.
+     */
+    offset += (2 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         reg = *gic_bmp_ptr32(bmp, irq);
         if (irq % 32 != 0) {
@@ -222,6 +255,12 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
+     * are always RAZ/WI. The corresponding functionality is replaced by the
+     * GICR registers. So it doesn't need to sync them.
+     */
+    offset += (1 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         kvm_gicd_access(s, offset, &reg, false);
         *gic_bmp_ptr32(bmp, irq) = reg;
@@ -235,6 +274,20 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    if (!s->gicd_no_shift_bug) {
+        bmp += (1 * sizeof(uint32_t));
+    }
+
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
+     * are always RAZ/WI. The corresponding functionality is replaced by the
+     * GICR registers. So it doesn't need to sync them.
+     */
+    offset += (1 * sizeof(uint32_t));
+    if (clroffset != 0) {
+        clroffset += (1 * sizeof(uint32_t));
+    }
+
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         /* If this bitmap is a set/clear register pair, first write to the
          * clear-reg to clear all bits before using the set-reg to write
@@ -651,6 +704,7 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
         return;
     }
 
+    s->gicd_no_shift_bug = 1;
     kvm_arm_gicv3_put(s);
 }
 
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index bccdfe1..13c28c0 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -217,6 +217,7 @@ struct GICv3State {
     uint32_t revision;
     bool security_extn;
     bool irq_reset_nonsecure;
+    bool gicd_no_shift_bug;
 
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
-- 
2.0.4


