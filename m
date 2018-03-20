Received: by 10.28.91.67 with SMTP id p64csp3505100wmb;
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
X-Google-Smtp-Source: AG47ELuKJMc0l8fQsqRsV2qu1CV6mUHuDATNhb7sURL0NA/Zq2Gr6G0illtt90FjZdgVmGH6Yu74
X-Received: by 10.55.23.101 with SMTP id i98mr22380788qkh.91.1521530880708;
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521530880; cv=none;
        d=google.com; s=arc-20160816;
        b=f/zyJZINBukUm3+1OxIzmcOS79bX2kbXhYfwBQ+hikufOOJ4zHeYhgomodp7FpwYr2
         rj24Ubwa5bKleHL6zM+IItYyzRBFL9evk+DMaS0pyOtGcI4gj55v+k3Bkx/FOrg6Wz67
         AB/sQDWi7v0neWMJYB9c6YHOWmqpsTzOGR6NQY+C3W/xOcAeaALbJMjqJZiLJ8m3/6UG
         5mTEMsBlK3XU3e7MNxJGEU00/5Oc7MLI4wDy2Ii/ks7kOrfzntVpvj3XW0FTVh3EtbpG
         VuH+KZyEbosx+i76ZhNIZrVFbUTanDCjnJw+1rjMQ2Xc7HdfqjF6FkcZT+IYLb+oRaF0
         79OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=NYVCd4NQtbCWZEXx3Jud+x1DgxI4uzGjqNfISLbfAWM=;
        b=woVYqzkiZCPHOwI6XX0pg6PBBLqV5g/rFTCLGHQFnEZyao/8Yy434qVAImYmQPxB1A
         JirEemN0zGyVX9u6TIWP+h/hnVxv9cnnm6koggrCxVm2MxrMgOE+mjaNJbOHU74vGJBS
         AJfVxK0ArgdUIbI183dhEbqrGXAXF2vUqhoZRMailQ3mTEvGIA4piy18pBpDgfxRBFZQ
         ScMBOEmYsBZfBGVTv6X9xd1cLaXxg9urJFRLdEuYtcT3SRpAGz9aSZrBTk4YQoGVpNmj
         7ncrVdg4Z+/nGnQIZFxeFQhquz1Cvk0RhmxE8yQnQ1vqkZaf5TrBlzFiFRdxg8/ZRLmt
         2FKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w35si1347322qtb.316.2018.03.20.00.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 00:28:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyBge-0001By-6l
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 03:28:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgU-0001BR-Ho
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eyBgQ-0008Sl-Kg
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 03:27:50 -0400
Received: from [45.249.212.35] (port=43374 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1eyBgQ-0008Pa-9H; Tue, 20 Mar 2018 03:27:46 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 52051C37BED46;
	Tue, 20 Mar 2018 15:27:41 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server
	id 14.3.361.1; Tue, 20 Mar 2018 15:27:36 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Tue, 20 Mar 2018 15:26:49 +0800
Message-ID: <1521530809-11780-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
References: <1521530809-11780-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.35
Subject: [Qemu-arm] [PATCH v2 2/2] arm_gicv3_kvm: kvm_dist_get/put: skip the
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6i0D4lxc5Lrr

While we skip the GIC_INTERNAL irqs, we don't change the register offset
accordingly. This will overlap the GICR registers value and leave the
last GIC_INTERNAL irq's registers out of update.

Fix this by skipping the registers banked by GICR.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/intc/arm_gicv3_kvm.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 3536795..d423cba 100644
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
@@ -150,6 +156,12 @@ static void kvm_dist_put_priority(GICv3State *s, uint32_t offset, uint8_t *bmp)
     int irq;
 
     field = (uint32_t *)bmp;
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 8
+     * GICD_IPRIORITYR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_IPRIORITYR<n>. So it doesn't need to
+     * sync them.
+     */
+    offset += (8 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 8) {
         reg = *field;
         kvm_gicd_access(s, offset, &reg, true);
@@ -164,6 +176,12 @@ static void kvm_dist_get_edge_trigger(GICv3State *s, uint32_t offset,
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
@@ -181,6 +199,12 @@ static void kvm_dist_put_edge_trigger(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the first 2
+     * GICD_ICFGR<n> registers are always RAZ/WI. The corresponding
+     * functionality is replaced by GICR_ICFGR<n>. So it doesn't need to sync
+     * them.
+     */
+    offset += (2 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 2) {
         reg = *gic_bmp_ptr32(bmp, irq);
         if (irq % 32 != 0) {
@@ -222,6 +246,12 @@ static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
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
@@ -235,6 +265,14 @@ static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
     uint32_t reg;
     int irq;
 
+    /* For the KVM GICv3, affinity routing is always enabled, and the
+     * GICD_IGROUPR0/GICD_ISENABLER0/GICD_ISPENDR0/GICD_ISACTIVER0 registers
+     * are always RAZ/WI. The corresponding functionality is replaced by the
+     * GICR registers. So it doesn't need to sync them.
+     */
+    offset += (1 * sizeof(uint32_t));
+    if (clroffset != 0)
+        clroffset += (1 * sizeof(uint32_t));
     for_each_dist_irq_reg(irq, s->num_irq, 1) {
         /* If this bitmap is a set/clear register pair, first write to the
          * clear-reg to clear all bits before using the set-reg to write
-- 
2.0.4


