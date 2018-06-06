Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp589554wrq;
        Wed, 6 Jun 2018 02:32:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIkJNA30jF0O2aAcwzGVxnBgmLUBuaQXXrcBKP2aVW0hbtX5+8r5rITzfZV0HYX2AIeGr2h
X-Received: by 2002:a0c:b98a:: with SMTP id v10-v6mr1883356qvf.175.1528277569739;
        Wed, 06 Jun 2018 02:32:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277569; cv=none;
        d=google.com; s=arc-20160816;
        b=k+2qAqyycl5w7JGkgvTYrpr08dR5+T9sVsp5N0vQy99Ltg538Xs1egSjzGFGbObjK0
         NQWPMERIAcXfhUpJb3IYsfxEmvuPE3cV72sC3qNbRSdac73f1usqs8oyRUx+jcSg76w0
         iJrFFgVFZqz/rGu17fi5VWxT/ej9MWzDqU9cMnPDJDlh5IhNxFxoNN0Z5lg8qCNwqj2A
         wqsO7Bk4bqJZmX8WoEJxINY0TTJzgVpqPEEX+MyVcZqqY7PCjdLTqZO4SLyc8VNW9eYj
         Ty6tcuy3fHKiZ4BOyG2VusUy2cmPBK174TJ/0AeRCCh3HKewSmHaGGQEUbDZn8wPmeha
         1Lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=ptQeJof7gsIMLfn+c3qDpTRzV9vx6MfGeo4w3EfQ5bI=;
        b=dwGz2q3pCqUY8GCfdfdHCFG4cgTiPlZztdt6sfZLU9FnmCxmFGNj014dCWrBSZNjPm
         z8z61Loz1tDA3mw/ZVJUYMnIKW/WiA+KxGtaOJjZCpY9nHMPF20nu/P5HPDdP9d6UzCj
         LbjehQWd1ip1Ha7rSFqNzoEi2IipXaL2iw//NMGyu1r9Jin/q1IlmiTGvC3rpHNKdZHw
         Ywka2HTvNw2xpPFoeFuiIips1PtkB7SpCSmDqAvy+bRGBpUXqeNnBQqIiJs2uy0h9Xov
         ylduCZSz8vMsjh7jDsnR3spVMKF6LUb1cB0qkMoWYDg3OopNP30Dm2F4L+9bPHu7pAq6
         QJaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hsgMjlhJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OeiHqcuQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QFZ372jY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p33-v6si14683997qtk.62.2018.06.06.02.32.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=hsgMjlhJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=OeiHqcuQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QFZ372jY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUoD-0002HQ-7B
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iO-A3
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003gu-1R
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnC-0003fW-II; Wed, 06 Jun 2018 05:31:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C2718443563;
	Wed,  6 Jun 2018 11:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277499;
	bh=GL5AGZQIVuUjzXKGI/fYmoMUlQP1tGWqJxsyOg26pAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hsgMjlhJtM8aij5k8QABJEkJUF5gQQM+lxPbZAC3hQnEH7frxVlYuFP6VDqkw7WiX
	ehfmie7onEuM80+OHTiz1wjg3ufLRPLutjePrwauH0O4HeQ2vpr3v1D68D33q2KB72
	A75GkRJ+hAUZ4H7m3TJBw54UYTadLktSFji1jGsM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=OeiHqcuQ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QFZ372jY
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-Yr-jCNRmJi; Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 1471D44355B; Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277498;
	bh=GL5AGZQIVuUjzXKGI/fYmoMUlQP1tGWqJxsyOg26pAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OeiHqcuQYO9Qph2WLb6Qtt5Ql2r0B0Ujh1T21PD8hOYb/lOXNRVgSaKoquwCqbh9U
	1pAdIsmQsnbdIS8ST2AIpP6BbwqbA7E5Tvk5zdEe+4Wnl1JXovwedVFMiDlbVIDXsi
	NyAKFfXHIUMnPM+MjKdoWmpwedi/ppFGHboNxmoQ=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9E043443557;
	Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=GL5AGZQIVuUjzXKGI/fYmoMUlQP1tGWqJxsyOg26pAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QFZ372jYHaEiwg1Nmp3RSdp9/73CpC7YaXTgzcHu1Zic9Cu7K05WyrFVw3/qGcIAs
	u3bJqworMQimUNHCAARAykydQwknrvDYjXS+DYnvfE7bwLSCPo82NFZkftFizhhXap
	wLhKjgxx3y47pXlABMPtIx7pD8w5Gr1OfmGmXUb4=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:30:58 +0200
Message-Id: <20180606093101.30518-4-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 3/6] intc/arm_gic: Add the virtualization
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
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gEtdGt7XUR2h

From: Luc MICHEL <luc.michel@greensocs.com>

Add the necessary parts of the virtualization extensions state to the
GIC state. We choose to increase the size of the CPU interfaces state to
add space for the vCPU interfaces (the GIC_NCPU_VCPU macro). This way,
we'll be able to reuse most of the CPU interface code for the vCPUs.

The vCPUs are numbered from GIC_NCPU to (GIC_NCPU * 2) - 1. The
`gic_is_vcpu` function help to determine if a given CPU id correspond to
a physical CPU or a virtual one.

The GIC VMState is updated to account for this modification. We add a
subsection for the virtual interface state. The virtual CPU interfaces
state however cannot be put in the subsection because of some 2D arrays
in the GIC state. This implies an increase in the VMState version id.

For the in-kernel KVM VGIC, since the exposed VGIC does not implement
the virtualization extensions, we report an error if the corresponding
property is set to true.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c                |   2 +-
 hw/intc/arm_gic_common.c         | 153 +++++++++++++++++++++++++------
 hw/intc/arm_gic_kvm.c            |   8 +-
 hw/intc/gic_internal.h           |   5 +
 include/hw/intc/arm_gic_common.h |  52 +++++++++--
 5 files changed, 183 insertions(+), 37 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 679b19fb94..e96f195997 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1427,7 +1427,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
     }
 
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
+    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
 
     /* Extra core-specific regions for the CPU interfaces. This is
      * necessary for "franken-GIC" implementations, for example on
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 295ee9cc5e..e75823c56d 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -46,6 +46,13 @@ static int gic_post_load(void *opaque, int version_id)
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
@@ -62,34 +69,58 @@ static const VMStateDescription vmstate_gic_irq_state = {
     }
 };
 
+/* Note: We cannot put the vCPUs state in this subsection because of some 2D
+ * arrays that mix CPU and vCPU states. */
+static const VMStateDescription vmstate_gic_virt_state = {
+    .name = "arm_gic_virt_state",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = gic_virt_state_needed,
+    .fields = (VMStateField[]) {
+        /* Virtual interface */
+        VMSTATE_UINT32_ARRAY(h_hcr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_ARRAY(h_misr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_2DARRAY(h_lr, GICState, GIC_NR_LR, GIC_NCPU),
+        VMSTATE_UINT64_ARRAY(h_eisr, GICState, GIC_NCPU),
+        VMSTATE_UINT64_ARRAY(h_elrsr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_ARRAY(h_apr, GICState, GIC_NCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_gic = {
     .name = "arm_gic",
-    .version_id = 12,
-    .minimum_version_id = 12,
+    .version_id = 13,
+    .minimum_version_id = 13,
     .pre_save = gic_pre_save,
     .post_load = gic_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(ctlr, GICState),
-        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU),
+        VMSTATE_UINT32_ARRAY(cpu_ctlr, GICState, GIC_NCPU_VCPU),
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
-        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU),
+        VMSTATE_UINT16_ARRAY(priority_mask, GICState, GIC_NCPU_VCPU),
+        VMSTATE_UINT16_ARRAY(running_priority, GICState, GIC_NCPU_VCPU),
+        VMSTATE_UINT16_ARRAY(current_pending, GICState, GIC_NCPU_VCPU),
+        VMSTATE_UINT8_ARRAY(bpr, GICState, GIC_NCPU_VCPU),
+        VMSTATE_UINT8_ARRAY(abpr, GICState, GIC_NCPU_VCPU),
+        VMSTATE_UINT32_2DARRAY(apr, GICState, GIC_NR_APRS, GIC_NCPU_VCPU),
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
@@ -116,6 +147,11 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
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
@@ -127,6 +163,17 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
     memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
                           s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
     sysbus_init_mmio(sbd, &s->cpuiomem[0]);
+
+    if (s->virt_extn) {
+        memory_region_init_io(&s->vifaceiomem, OBJECT(s), virt_ops,
+                              s, "gic_viface", 0x200);
+        sysbus_init_mmio(sbd, &s->vifaceiomem);
+
+        memory_region_init_io(&s->vcpuiomem[0], OBJECT(s),
+                              virt_ops ? &virt_ops[1] : NULL,
+                              s, "gic_vcpu", 0x2000);
+        sysbus_init_mmio(sbd, &s->vcpuiomem[0]);
+    }
 }
 
 static void arm_gic_common_realize(DeviceState *dev, Error **errp)
@@ -163,6 +210,40 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
                    "the security extensions");
         return;
     }
+
+    if (s->virt_extn && (s->revision != 2)) {
+        error_setg(errp, "GIC virtualization extensions are only "
+                   "supported by revision 2");
+        return;
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
@@ -185,24 +266,14 @@ static void arm_gic_common_reset(DeviceState *dev)
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
+         * The exposed vCPU interface does not have security extensions. */
+        arm_gic_common_reset_irq_state(s, GIC_NCPU, 0);
     }
+
     for (i = 0; i < GIC_NR_SGIS; i++) {
         GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
         GIC_DIST_SET_EDGE_TRIGGER(i);
@@ -226,6 +297,32 @@ static void arm_gic_common_reset(DeviceState *dev)
         }
     }
 
+    if (s->virt_extn) {
+        for (i = 0; i < GIC_MAXIRQ; i++) {
+            for (j = 0; j < s->num_cpu; j++) {
+                s->virq_lr_entry[i][j] = GIC_NR_LR;
+            }
+        }
+
+        for (i = 0; i < GIC_NR_LR; i++) {
+            for (j = 0; j < s->num_cpu; j++) {
+                s->h_lr[i][j] = 0;
+            }
+        }
+
+        for (i = 0; i < s->num_cpu; i++) {
+            s->h_hcr[i] = 0;
+            s->h_eisr[i] = 0;
+#if GIC_NR_LR == 64
+            s->h_elrsr[i] = UINT64_MAX;
+#else
+            /* Bits corresponding to non-implemented LRs in ELRSR are RAZ */
+            s->h_elrsr[i] = (1ull << GIC_NR_LR) - 1;
+#endif
+            s->pending_lrs[i] = 0;
+        }
+    }
+
     s->ctlr = 0;
 }
 
@@ -255,6 +352,8 @@ static Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICState, revision, 1),
     /* True if the GIC should implement the security extensions */
     DEFINE_PROP_BOOL("has-security-extensions", GICState, security_extn, 0),
+    /* True if the GIC should implement the virtualization extensions */
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 799136732a..6e562411cc 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -511,6 +511,12 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
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
@@ -522,7 +528,7 @@ static void kvm_arm_gic_realize(DeviceState *dev, Error **errp)
         }
     }
 
-    gic_init_irqs_and_mmio(s, kvm_arm_gicv2_set_irq, NULL);
+    gic_init_irqs_and_mmio(s, kvm_arm_gicv2_set_irq, NULL, NULL);
 
     for (i = 0; i < s->num_irq - GIC_INTERNAL; i++) {
         qemu_irq irq = qdev_get_gpio_in(dev, i);
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index a2075a94db..c85427c8e3 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -94,4 +94,9 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm)
     }
 }
 
+static inline bool gic_is_vcpu(int cpu)
+{
+    return cpu >= GIC_NCPU;
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index af3ca18e2f..3f19ea3cb9 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -30,6 +30,8 @@
 #define GIC_NR_SGIS 16
 /* Maximum number of possible CPU interfaces, determined by GIC architecture */
 #define GIC_NCPU 8
+/* Maximum number of possible CPU interfaces with their respective vCPU */
+#define GIC_NCPU_VCPU (GIC_NCPU * 2)
 
 #define MAX_NR_GROUP_PRIO 128
 #define GIC_NR_APRS (MAX_NR_GROUP_PRIO / 32)
@@ -37,6 +39,17 @@
 #define GIC_MIN_BPR 0
 #define GIC_MIN_ABPR (GIC_MIN_BPR + 1)
 
+/* Number of list registers in the virtual interface */
+#define GIC_NR_LR 64
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
@@ -57,6 +70,8 @@ typedef struct GICState {
     qemu_irq parent_fiq[GIC_NCPU];
     qemu_irq parent_virq[GIC_NCPU];
     qemu_irq parent_vfiq[GIC_NCPU];
+    qemu_irq maintenance_irq[GIC_NCPU];
+
     /* GICD_CTLR; for a GIC with the security extensions the NS banked version
      * of this register is just an alias of bit 1 of the S banked version.
      */
@@ -64,7 +79,7 @@ typedef struct GICState {
     /* GICC_CTLR; again, the NS banked version is just aliases of bits of
      * the S banked register, so our state only needs to store the S version.
      */
-    uint32_t cpu_ctlr[GIC_NCPU];
+    uint32_t cpu_ctlr[GIC_NCPU_VCPU];
 
     gic_irq_state irq_state[GIC_MAXIRQ];
     uint8_t irq_target[GIC_MAXIRQ];
@@ -78,9 +93,9 @@ typedef struct GICState {
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
@@ -88,8 +103,8 @@ typedef struct GICState {
      * For a GIC with Security Extensions we use use bpr for the
      * secure copy and abpr as storage for the non-secure copy of the register.
      */
-    uint8_t  bpr[GIC_NCPU];
-    uint8_t  abpr[GIC_NCPU];
+    uint8_t  bpr[GIC_NCPU_VCPU];
+    uint8_t  abpr[GIC_NCPU_VCPU];
 
     /* The APR is implementation defined, so we choose a layout identical to
      * the KVM ABI layout for QEMU's implementation of the gic:
@@ -97,9 +112,25 @@ typedef struct GICState {
      *   APRn[X mod 32] == 0b1,  where n = X / 32
      * otherwise the bit is clear.
      */
-    uint32_t apr[GIC_NR_APRS][GIC_NCPU];
+    uint32_t apr[GIC_NR_APRS][GIC_NCPU_VCPU];
     uint32_t nsapr[GIC_NR_APRS][GIC_NCPU];
 
+    /* Virtual interface control registers */
+    uint32_t h_hcr[GIC_NCPU];
+    uint32_t h_misr[GIC_NCPU];
+    uint32_t h_lr[GIC_NR_LR][GIC_NCPU];
+    uint64_t h_eisr[GIC_NCPU];
+    uint64_t h_elrsr[GIC_NCPU];
+    uint32_t h_apr[GIC_NCPU];
+
+    /* For a vIRQ, gives its LR entry number,
+     * or GIC_NR_LR if it has no entry. */
+    size_t virq_lr_entry[GIC_MAXIRQ][GIC_NCPU];
+
+    /* LR entries in the pending state. Used to compute NP maintenance
+     * interrupt */
+    uint64_t pending_lrs[GIC_NCPU];
+
     uint32_t num_cpu;
 
     MemoryRegion iomem; /* Distributor */
@@ -108,9 +139,13 @@ typedef struct GICState {
      */
     struct GICState *backref[GIC_NCPU];
     MemoryRegion cpuiomem[GIC_NCPU + 1]; /* CPU interfaces */
+    MemoryRegion vifaceiomem; /* Virtual interface */
+    MemoryRegion vcpuiomem[GIC_NCPU + 1]; /* vCPU interface */
+
     uint32_t num_irq;
     uint32_t revision;
     bool security_extn;
+    bool virt_extn;
     bool irq_reset_nonsecure; /* configure IRQs as group 1 (NS) on reset? */
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
     Error *migration_blocker;
@@ -134,6 +169,7 @@ typedef struct ARMGICCommonClass {
 } ARMGICCommonClass;
 
 void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
-                            const MemoryRegionOps *ops);
+                            const MemoryRegionOps *ops,
+                            const MemoryRegionOps *virt_ops);
 
 #endif
-- 
2.17.0

