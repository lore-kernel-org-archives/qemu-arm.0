Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp516384wru;
        Fri, 27 Jul 2018 03:05:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpczs5JkZlMbXmEQLpHANX6XThVJXtTJOaoMk1lli+duByvEWBCmf5/Lu1B5Gxcl9aBP3rKm
X-Received: by 2002:a37:4904:: with SMTP id w4-v6mr5370603qka.85.1532685940367;
        Fri, 27 Jul 2018 03:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685940; cv=none;
        d=google.com; s=arc-20160816;
        b=Rop3A6XvwtJbp3nvG+2k3YijkgXK09y0AFh7lUblQqq4XFj2dj38t5SOk4HlM0DxB4
         OKcssQuxvg/b3ld1aAqeHi/l5u2MCLTOJx3uauQrr3Yafc0Z0f+dWCIAcnoFDvNJ4X6N
         nGBSiAUmfzuz8hr4NEkbcUvWd+UHOSMVClBbhv9I0BTNPGEUuVVsSh5I28uFs4jzG6jI
         8tkI5Acrstmn+qFngw4Hc7z7dxuQ16HvQzsyDvAcSaTQMG1m/TtDL6WY1unnOIhk1w91
         BnazybD8fK4/g5Jy0X/sU+9LKsmQrgiXj6viaBqvTAg8AzAs6nV29KR3XJVEnX0BA2Fq
         Bn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=F0+EA7NrPAd0yTbOC7lfGlBLoT/ALVnzYn/Wo5vQpVI=;
        b=zrxE0BoSbn49Zvh9rUYlaZzloUC3tj3NgUE9zwr5ltPSmvU7n3sboOpm+SbvqV6fFS
         7ocf5jqkTOH4aX01j35mTvJt4JYe8SZx2HaHdav/FIAUUIO5Txa+vLXHpua/YZ7bKOkA
         27nOj7xtLcZ/Jr3Y/Tf3B5HoMuC9ucpi3eRxvBvavcSjlzNenH7meBFWtxwPusX6llH9
         K79KpjSa5p4kN/d0uQWgYM2wPX9Sahx1gWGSfdOfVbCsII/fyofzJATvPmSotHrzsKbg
         92Gybuq1lLyWHkNrE/IlQAWv58psPsgCBbRC7MeOzmeh/MKyxinVqspzl2+wtEBQlVXy
         5sgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VjDmQLmi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5QB5ixxg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=klQVoQ+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t63-v6si3379201qke.282.2018.07.27.03.05.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 03:05:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=VjDmQLmi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5QB5ixxg;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=klQVoQ+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizcx-0004eu-RZ
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 06:05:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSi-0003jV-1t
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006BT-Hc
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:04 -0400
Received: from greensocs.com ([193.104.36.180]:47515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068i-SI; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CE48244355F;
	Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=Jq07xEg9LqMeplnQxAr0uswiMuKksesjMui5G5vpPK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VjDmQLmiNhWgcR5YG4nyHmyFzSu1/XjNu8tg59ZPlYyUFJ4aeEByT8fgX8aieaqMS
	ofdcILgN4wJXFSvZ8Z/7KknrVEi7c+eMGLJ0UvkRnbMDycxIG3DEWd4xyXrcEyn71m
	d6/5q39OZjI8+6ggplUhxptvenJGLhOqnvsdtqgU=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=5QB5ixxg;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=klQVoQ+y
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCziWB-3rlx4; Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2A5754434A7; Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=Jq07xEg9LqMeplnQxAr0uswiMuKksesjMui5G5vpPK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5QB5ixxgWDiSDukWZmNvCux7W1b5Y/PwGOVwm7DGo6Iw+KTENyGXSpa1ZRB/3Uz/N
	6BElHBwRvTYacrACHoVqnrGVYgUaj+doElmRuOel6Ud17rZPGmW5xFFi7xgffnfqwm
	/ZbPQ4p9ky+jaAcvIdwpGPq3FwHTDg0LQLPh1Bfw=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9EF47443485;
	Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=Jq07xEg9LqMeplnQxAr0uswiMuKksesjMui5G5vpPK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=klQVoQ+y77zrvaQgSBUu3rLdxXGyUyp2v6ycwpLYjGbyjzCV/8TQ1NlUqH/XTsdpa
	eYeXCL0Ph3g1OqublRqyJkk26Fb/VvhvJI6OV4LeU2j9nOp+DD1iXME3XE9u2kB2RY
	0zk0rvTjya04TD4L5O1biy0OMsSpksPOFhjwv8sU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:06 +0200
Message-Id: <20180727095421.386-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 05/20] intc/arm_gic: Add the virtualization
 extensions to the GIC state
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xbyb77rA1OKY

Add the necessary parts of the virtualization extensions state to the
GIC state. We choose to increase the size of the CPU interfaces state to
add space for the vCPU interfaces (the GIC_NCPU_VCPU macro). This way,
we'll be able to reuse most of the CPU interface code for the vCPUs.

The only exception is the APR value, which is stored in h_apr in the
virtual interface state for vCPUs. This is due to some complications
with the GIC VMState, for which we don't want to break backward
compatibility. APRs being stored in 2D arrays, increasing the second
dimension would lead to some ugly VMState description. To avoid
that, we keep it in h_apr for vCPUs.

The vCPUs are numbered from GIC_NCPU to (GIC_NCPU * 2) - 1. The
`gic_is_vcpu` function help to determine if a given CPU id correspond to
a physical CPU or a virtual one.

For the in-kernel KVM VGIC, since the exposed VGIC does not implement
the virtualization extensions, we report an error if the corresponding
property is set to true.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c                |   2 +-
 hw/intc/arm_gic_common.c         | 148 ++++++++++++++++++++++++++-----
 hw/intc/arm_gic_kvm.c            |   8 +-
 hw/intc/gic_internal.h           |   5 ++
 include/hw/intc/arm_gic_common.h |  43 +++++++--
 5 files changed, 173 insertions(+), 33 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b8eba6e594..5231579985 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1495,11 +1495,11 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
                          "host kernel supports KVM_CAP_ARM_USER_IRQ");
         return;
     }
 
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
+    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
 
     /* Extra core-specific regions for the CPU interfaces. This is
      * necessary for "franken-GIC" implementations, for example on
      * Exynos 4.
      * NB that the memory region size of 0x100 applies for the 11MPCore
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 295ee9cc5e..547dc41185 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -44,10 +44,17 @@ static int gic_post_load(void *opaque, int version_id)
         c->post_load(s);
     }
     return 0;
 }
 
+static bool gic_virt_state_needed(void *opaque)
+{
+    GICState *s = (GICState *)opaque;
+
+    return s->virt_extn;
+}
+
 static const VMStateDescription vmstate_gic_irq_state = {
     .name = "arm_gic_irq_state",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
@@ -60,38 +67,67 @@ static const VMStateDescription vmstate_gic_irq_state = {
         VMSTATE_UINT8(group, gic_irq_state),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static const VMStateDescription vmstate_gic_virt_state = {
+    .name = "arm_gic_virt_state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gic_virt_state_needed,
+    .fields = (VMStateField[]) {
+        /* Virtual interface */
+        VMSTATE_UINT32_ARRAY(h_hcr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_ARRAY(h_misr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_2DARRAY(h_lr, GICState, GIC_MAX_LR, GIC_NCPU),
+        VMSTATE_UINT32_ARRAY(h_apr, GICState, GIC_NCPU),
+
+        /* Virtual CPU interfaces */
+        VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, GIC_NCPU, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(priority_mask, GICState, GIC_NCPU, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(running_priority, GICState, GIC_NCPU, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(current_pending, GICState, GIC_NCPU, GIC_NCPU),
+        VMSTATE_UINT8_SUB_ARRAY(bpr, GICState, GIC_NCPU, GIC_NCPU),
+        VMSTATE_UINT8_SUB_ARRAY(abpr, GICState, GIC_NCPU, GIC_NCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gic = {
     .name = "arm_gic",
     .version_id = 12,
     .minimum_version_id = 12,
     .pre_save = gic_pre_save,
     .post_load = gic_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICState),
-        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_SUB_ARRAY(cpu_ctlr, GICState, 0, GIC_NCPU),
         VMSTATE_STRUCT_ARRAY(irq_state, GICState, GIC_MAXIRQ, 1,
                              vmstate_gic_irq_state, gic_irq_state),
         VMSTATE_UINT8_ARRAY(irq_target, GICState, GIC_MAXIRQ),
         VMSTATE_UINT8_2DARRAY(priority1, GICState, GIC_INTERNAL, GIC_NCPU),
         VMSTATE_UINT8_ARRAY(priority2, GICState, GIC_MAXIRQ - GIC_INTERNAL),
         VMSTATE_UINT8_2DARRAY(sgi_pending, GICState, GIC_NR_SGIS, GIC_NCPU),
-        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU),
-        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU),
-        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU),
-        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU),
-        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(priority_mask, GICState, 0, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(running_priority, GICState, 0, GIC_NCPU),
+        VMSTATE_UINT16_SUB_ARRAY(current_pending, GICState, 0, GIC_NCPU),
+        VMSTATE_UINT8_SUB_ARRAY(bpr, GICState, 0, GIC_NCPU),
+        VMSTATE_UINT8_SUB_ARRAY(abpr, GICState, 0, GIC_NCPU),
         VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU),
         VMSTATE_UINT32_2DARRAY(nsapr, GICState, GIC_NR_APRS, GIC_NCPU),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription * []) {
+        &vmstate_gic_virt_state,
+        NULL
     }
 };
 
 void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
-                            const MemoryRegionOps *ops)
+                            const MemoryRegionOps *ops,
+                            const MemoryRegionOps *virt_ops)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(s);
     int i = s->num_irq - GIC_INTERNAL;
 
     /* For the GIC, also expose incoming GPIO lines for PPIs for each CPU.
@@ -114,10 +150,15 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
         sysbus_init_irq(sbd, &s->parent_virq[i]);
     }
     for (i = 0; i < s->num_cpu; i++) {
         sysbus_init_irq(sbd, &s->parent_vfiq[i]);
     }
+    if (s->virt_extn) {
+        for (i = 0; i < s->num_cpu; i++) {
+            sysbus_init_irq(sbd, &s->maintenance_irq[i]);
+        }
+    }
 
     /* Distributor */
     memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
 
@@ -125,10 +166,21 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
      * present because it is required by both software emulation and KVM.
      */
     memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
                           s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
     sysbus_init_mmio(sbd, &s->cpuiomem[0]);
+
+    if (s->virt_extn) {
+        memory_region_init_io(&s->vifaceiomem[0], OBJECT(s), virt_ops,
+                              s, "gic_viface", 0x1000);
+        sysbus_init_mmio(sbd, &s->vifaceiomem[0]);
+
+        memory_region_init_io(&s->vcpuiomem, OBJECT(s),
+                              virt_ops ? &virt_ops[1] : NULL,
+                              s, "gic_vcpu", 0x2000);
+        sysbus_init_mmio(sbd, &s->vcpuiomem);
+    }
 }
 
 static void arm_gic_common_realize(DeviceState *dev, Error **errp)
 {
     GICState *s = ARM_GIC_COMMON(dev);
@@ -161,10 +213,52 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
         (s->revision == REV_11MPCORE)) {
         error_setg(errp, "this GIC revision does not implement "
                    "the security extensions");
         return;
     }
+
+    if (s->virt_extn) {
+        if (s->revision != 2) {
+            error_setg(errp, "GIC virtualization extensions are only "
+                       "supported by revision 2");
+            return;
+        }
+
+        /* For now, set the number of implemented LRs to 4, as found in most
+         * real GICv2. This could be promoted as a QOM property if we need to
+         * emulate a variant with another num_lrs.
+         */
+        s->num_lrs = 4;
+    }
+}
+
+static inline void arm_gic_common_reset_irq_state(GICState *s, int first_cpu,
+                                                  int resetprio)
+{
+    int i, j;
+
+    for (i = first_cpu; i < first_cpu + s->num_cpu; i++) {
+        if (s->revision == REV_11MPCORE) {
+            s->priority_mask[i] = 0xf0;
+        } else {
+            s->priority_mask[i] = resetprio;
+        }
+        s->current_pending[i] = 1023;
+        s->running_priority[i] = 0x100;
+        s->cpu_ctlr[i] = 0;
+        s->bpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+        s->abpr[i] = gic_is_vcpu(i) ? GIC_VIRT_MIN_ABPR : GIC_MIN_ABPR;
+
+        if (!gic_is_vcpu(i)) {
+            for (j = 0; j < GIC_INTERNAL; j++) {
+                s->priority1[j][i] = resetprio;
+            }
+            for (j = 0; j < GIC_NR_SGIS; j++) {
+                s->sgi_pending[j][i] = 0;
+            }
+        }
+    }
 }
 
 static void arm_gic_common_reset(DeviceState *dev)
 {
     GICState *s = ARM_GIC_COMMON(dev);
@@ -183,28 +277,19 @@ static void arm_gic_common_reset(DeviceState *dev)
     } else {
         resetprio = 0;
     }
 
     memset(s->irq_state, 0, GIC_MAXIRQ * sizeof(gic_irq_state));
-    for (i = 0 ; i < s->num_cpu; i++) {
-        if (s->revision == REV_11MPCORE) {
-            s->priority_mask[i] = 0xf0;
-        } else {
-            s->priority_mask[i] = resetprio;
-        }
-        s->current_pending[i] = 1023;
-        s->running_priority[i] = 0x100;
-        s->cpu_ctlr[i] = 0;
-        s->bpr[i] = GIC_MIN_BPR;
-        s->abpr[i] = GIC_MIN_ABPR;
-        for (j = 0; j < GIC_INTERNAL; j++) {
-            s->priority1[j][i] = resetprio;
-        }
-        for (j = 0; j < GIC_NR_SGIS; j++) {
-            s->sgi_pending[j][i] = 0;
-        }
+    arm_gic_common_reset_irq_state(s, 0, resetprio);
+
+    if (s->virt_extn) {
+        /* vCPU states are stored at indexes GIC_NCPU .. GIC_NCPU+num_cpu.
+         * The exposed vCPU interface does not have security extensions.
+         */
+        arm_gic_common_reset_irq_state(s, GIC_NCPU, 0);
     }
+
     for (i = 0; i < GIC_NR_SGIS; i++) {
         GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
         GIC_DIST_SET_EDGE_TRIGGER(i);
     }
 
@@ -224,10 +309,23 @@ static void arm_gic_common_reset(DeviceState *dev)
         for (i = 0; i < GIC_MAXIRQ; i++) {
             GIC_DIST_SET_GROUP(i, ALL_CPU_MASK);
         }
     }
 
+    if (s->virt_extn) {
+        for (i = 0; i < s->num_lrs; i++) {
+            for (j = 0; j < s->num_cpu; j++) {
+                s->h_lr[i][j] = 0;
+            }
+        }
+
+        for (i = 0; i < s->num_cpu; i++) {
+            s->h_hcr[i] = 0;
+            s->h_misr[i] = 0;
+        }
+    }
+
     s->ctlr = 0;
 }
 
 static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
                                       bool secure_boot)
@@ -253,10 +351,12 @@ static Property arm_gic_common_properties[] = {
      * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
      */
     DEFINE_PROP_UINT32("revision", GICState, revision, 1),
     /* True if the GIC should implement the security extensions */
     DEFINE_PROP_BOOL("has-security-extensions", GICState, security_extn, 0),
+    /* True if the GIC should implement the virtualization extensions */
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
 static void arm_gic_common_class_init(ObjectClass *klass, void *data)
 {
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 4b611c8d6d..a611e8ee12 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -509,10 +509,16 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "the in-kernel VGIC does not implement the "
                    "security extensions");
         return;
     }
 
+    if (s->virt_extn) {
+        error_setg(errp, "the in-kernel VGIC does not implement the "
+                   "virtualization extensions");
+        return;
+    }
+
     if (!kvm_arm_gic_can_save_restore(s)) {
         error_setg(&s->migration_blocker, "This operating system kernel does "
                                           "not support vGICv2 migration");
         migrate_add_blocker(s->migration_blocker, &local_err);
         if (local_err) {
@@ -520,11 +526,11 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
             error_free(s->migration_blocker);
             return;
         }
     }
 
-    gic_init_irqs_and_mmio(s, kvm_arm_gicv2_set_irq, NULL);
+    gic_init_irqs_and_mmio(s, kvm_arm_gicv2_set_irq, NULL, NULL);
 
     for (i = 0; i < s->num_irq - GIC_INTERNAL; i++) {
         qemu_irq irq = qdev_get_gpio_in(dev, i);
         kvm_irqchip_set_qemuirq_gsi(kvm_state, irq, i);
     }
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index a2075a94db..c85427c8e3 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -92,6 +92,11 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm)
         return (s->irq_state[irq].pending & cm) ||
             (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_LEVEL(irq, cm));
     }
 }
 
+static inline bool gic_is_vcpu(int cpu)
+{
+    return cpu >= GIC_NCPU;
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index af3ca18e2f..b5585fec45 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -28,17 +28,30 @@
 /* First 32 are private to each CPU (SGIs and PPIs). */
 #define GIC_INTERNAL 32
 #define GIC_NR_SGIS 16
 /* Maximum number of possible CPU interfaces, determined by GIC architecture */
 #define GIC_NCPU 8
+/* Maximum number of possible CPU interfaces with their respective vCPU */
+#define GIC_NCPU_VCPU (GIC_NCPU * 2)
 
 #define MAX_NR_GROUP_PRIO 128
 #define GIC_NR_APRS (MAX_NR_GROUP_PRIO / 32)
 
 #define GIC_MIN_BPR 0
 #define GIC_MIN_ABPR (GIC_MIN_BPR + 1)
 
+/* Architectural maximum number of list registers in the virtual interface */
+#define GIC_MAX_LR 64
+
+/* Only 32 priority levels and 32 preemption levels in the vCPU interfaces */
+#define GIC_VIRT_MAX_GROUP_PRIO_BITS 5
+#define GIC_VIRT_MAX_NR_GROUP_PRIO (1 << GIC_VIRT_MAX_GROUP_PRIO_BITS)
+#define GIC_VIRT_NR_APRS (GIC_VIRT_MAX_NR_GROUP_PRIO / 32)
+
+#define GIC_VIRT_MIN_BPR 2
+#define GIC_VIRT_MIN_ABPR (GIC_VIRT_MIN_BPR + 1)
+
 typedef struct gic_irq_state {
     /* The enable bits are only banked for per-cpu interrupts.  */
     uint8_t enabled;
     uint8_t pending;
     uint8_t active;
@@ -55,18 +68,20 @@ typedef struct GICState {
 
     qemu_irq parent_irq[GIC_NCPU];
     qemu_irq parent_fiq[GIC_NCPU];
     qemu_irq parent_virq[GIC_NCPU];
     qemu_irq parent_vfiq[GIC_NCPU];
+    qemu_irq maintenance_irq[GIC_NCPU];
+
     /* GICD_CTLR; for a GIC with the security extensions the NS banked version
      * of this register is just an alias of bit 1 of the S banked version.
      */
     uint32_t ctlr;
     /* GICC_CTLR; again, the NS banked version is just aliases of bits of
      * the S banked register, so our state only needs to store the S version.
      */
-    uint32_t cpu_ctlr[GIC_NCPU];
+    uint32_t cpu_ctlr[GIC_NCPU_VCPU];
 
     gic_irq_state irq_state[GIC_MAXIRQ];
     uint8_t irq_target[GIC_MAXIRQ];
     uint8_t priority1[GIC_INTERNAL][GIC_NCPU];
     uint8_t priority2[GIC_MAXIRQ - GIC_INTERNAL];
@@ -76,43 +91,56 @@ typedef struct GICState {
      * the bytes in the GIC_SPENDSGIR* registers as
      * read by the target CPU.
      */
     uint8_t sgi_pending[GIC_NR_SGIS][GIC_NCPU];
 
-    uint16_t priority_mask[GIC_NCPU];
-    uint16_t running_priority[GIC_NCPU];
-    uint16_t current_pending[GIC_NCPU];
+    uint16_t priority_mask[GIC_NCPU_VCPU];
+    uint16_t running_priority[GIC_NCPU_VCPU];
+    uint16_t current_pending[GIC_NCPU_VCPU];
 
     /* If we present the GICv2 without security extensions to a guest,
      * the guest can configure the GICC_CTLR to configure group 1 binary point
      * in the abpr.
      * For a GIC with Security Extensions we use use bpr for the
      * secure copy and abpr as storage for the non-secure copy of the register.
      */
-    uint8_t  bpr[GIC_NCPU];
-    uint8_t  abpr[GIC_NCPU];
+    uint8_t  bpr[GIC_NCPU_VCPU];
+    uint8_t  abpr[GIC_NCPU_VCPU];
 
     /* The APR is implementation defined, so we choose a layout identical to
      * the KVM ABI layout for QEMU's implementation of the gic:
      * If an interrupt for preemption level X is active, then
      *   APRn[X mod 32] == 0b1,  where n = X / 32
      * otherwise the bit is clear.
      */
     uint32_t apr[GIC_NR_APRS][GIC_NCPU];
     uint32_t nsapr[GIC_NR_APRS][GIC_NCPU];
 
+    /* Virtual interface control registers */
+    uint32_t h_hcr[GIC_NCPU];
+    uint32_t h_misr[GIC_NCPU];
+    uint32_t h_lr[GIC_MAX_LR][GIC_NCPU];
+    uint32_t h_apr[GIC_NCPU];
+
+    /* Number of LRs implemented in this GIC instance */
+    uint32_t num_lrs;
+
     uint32_t num_cpu;
 
     MemoryRegion iomem; /* Distributor */
     /* This is just so we can have an opaque pointer which identifies
      * both this GIC and which CPU interface we should be accessing.
      */
     struct GICState *backref[GIC_NCPU];
     MemoryRegion cpuiomem[GIC_NCPU + 1]; /* CPU interfaces */
+    MemoryRegion vifaceiomem[GIC_NCPU + 1]; /* Virtual interfaces */
+    MemoryRegion vcpuiomem; /* vCPU interface */
+
     uint32_t num_irq;
     uint32_t revision;
     bool security_extn;
+    bool virt_extn;
     bool irq_reset_nonsecure; /* configure IRQs as group 1 (NS) on reset? */
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
 } GICState;
 
@@ -132,8 +160,9 @@ typedef struct ARMGICCommonClass {
     void (*pre_save)(GICState *s);
     void (*post_load)(GICState *s);
 } ARMGICCommonClass;
 
 void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
-                            const MemoryRegionOps *ops);
+                            const MemoryRegionOps *ops,
+                            const MemoryRegionOps *virt_ops);
 
 #endif
-- 
2.18.0

