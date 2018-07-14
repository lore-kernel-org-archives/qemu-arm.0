Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp652362wrq;
        Sat, 14 Jul 2018 10:20:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgper302HGnYwVmStAGgWxk73U7tDPVDEDq8o6tHdP7U65BL+z9aHB9wVsechQn7K9m/evWwu
X-Received: by 2002:ac8:8af:: with SMTP id v44-v6mr10188530qth.33.1531588853954;
        Sat, 14 Jul 2018 10:20:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588853; cv=none;
        d=google.com; s=arc-20160816;
        b=AWlvLMj6qgqw5MOJXurHb1Or4PtycmDWIc2FUFKpuo3o8JcTiqx3kKdjEIpllL1Jfb
         BeyFIurny9ge6pMkTFs1t8A8n1qKVDIN1k6gvMuyf7ACXPyhWWi57qriO+R24hP8G998
         xOSdpd7FNGYA+x9s/UQj2I0Op8+0Lh6h9/9c1p2FKaA/3EkLmxBbl9q5C7Xs6lxOctxT
         adis59jlGyCWWO6NGG/NM5obrlfHCQWnKywGANDWFZ1VTUk9E0SoWzzuGsIRQf1nV1CW
         wI14E5ADYp1upox8kFGueOkXov7YM/qDQGt3x8k31F+UZDWMI53e2UtisSpHfIXX9Pg7
         Iy7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=mPLkZV+67y/2jYx44y8xE+eQi1cyQAeM63fQmWKWC6w=;
        b=Kwj75bQ9kmu0Fr5PGxk/TZPYbg3KsTcezbypUE6CUfOIKxumHfOkcGsC+Qc6gis5pd
         q0DSFKSvLKoP2QlX3yhAJ+hh5T348ZiEX9ZnFjKukaZEM04uKaAheosAv6TxZGPDegd1
         lcVFXnnliuDrFdPKgPELqgRvvbBvgbh53xkVLLCgjgM6OAPT5M1hmuUvdQ6YHgGly0tR
         +o60y4IDBoPstpqiyUUqRjscU9LbYp4ceIlDGWQrTUPkIBXsuP+qos4XxiO/2MBN0Ja9
         wWfiC1gmDjMX+zoLNWOaL5wXs3MXBocBsGA6yIRf6T0vu6BeKSoask4cuBkZ/PPBQbp7
         nlUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7Pci2fGy;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="eHUZ/HLy";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="eHUZ/HLy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7-v6si9612059qkd.0.2018.07.14.10.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:20:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7Pci2fGy;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="eHUZ/HLy";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="eHUZ/HLy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOE1-0000VY-An
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:20:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9q-0005mS-OF
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004SC-Us
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:34 -0400
Received: from greensocs.com ([193.104.36.180]:57312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004QJ-Dx; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 598C7319FCA;
	Sat, 14 Jul 2018 19:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588581;
	bh=okdUC6xHm2ykstp8lt4YTXKVivpndZ3Q+S3qmgUI6+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7Pci2fGy12DySQ7mtM/8ikH1xnUKoZuQk2LZ0C0AHVcNfKaNpkimr5SUnnMiT3oRZ
	8DOYj+Q84uFZGvcTMNKWUwSSs/C6pgIZLS+1NCnX+C4jVuyuAmycY/d1fr7Jexe9n5
	DERvKj+xzsOFtk7d+Mfdkk6Ehpgpu6C2G1FXoqqE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=eHUZ/HLy;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=eHUZ/HLy
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C6N9ZyDMiwuh; Sat, 14 Jul 2018 19:16:20 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 65115C7AF0; Sat, 14 Jul 2018 19:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588579;
	bh=okdUC6xHm2ykstp8lt4YTXKVivpndZ3Q+S3qmgUI6+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eHUZ/HLy+oX7AHXsb0Ece+EOHgfUirwhhZY6COU379RpV4qgUwltsoibPbpngpo1S
	y4dfm/lwdAdcLUxjU2/J7zKwIwwcH1u4dAscwUrTB8Jb08zfXP+C67goFjdxIsl26k
	JMg3Q0KYFSznPbWLaoiFag/V/0DgNyP60R8OxmqY=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 6BD9AC7ADD;
	Sat, 14 Jul 2018 19:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588579;
	bh=okdUC6xHm2ykstp8lt4YTXKVivpndZ3Q+S3qmgUI6+w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eHUZ/HLy+oX7AHXsb0Ece+EOHgfUirwhhZY6COU379RpV4qgUwltsoibPbpngpo1S
	y4dfm/lwdAdcLUxjU2/J7zKwIwwcH1u4dAscwUrTB8Jb08zfXP+C67goFjdxIsl26k
	JMg3Q0KYFSznPbWLaoiFag/V/0DgNyP60R8OxmqY=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:46 +0200
Message-Id: <20180714171601.5734-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 05/20] intc/arm_gic: Add the virtualization
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
X-TUID: 76m/FHQfGxX7

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
index 9fe70e5519..aaa34426a1 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1481,7 +1481,7 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
     }
 
     /* This creates distributor and main CPU interface (s->cpuiomem[0]) */
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
+    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops, NULL);
 
     /* Extra core-specific regions for the CPU interfaces. This is
      * necessary for "franken-GIC" implementations, for example on
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 295ee9cc5e..547dc41185 100644
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
@@ -62,6 +69,30 @@ static const VMStateDescription vmstate_gic_irq_state = {
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
@@ -70,26 +101,31 @@ static const VMStateDescription vmstate_gic = {
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
@@ -116,6 +152,11 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
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
@@ -127,6 +168,17 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
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
@@ -163,6 +215,48 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
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
@@ -185,24 +279,15 @@ static void arm_gic_common_reset(DeviceState *dev)
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
@@ -226,6 +311,19 @@ static void arm_gic_common_reset(DeviceState *dev)
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
 
@@ -255,6 +353,8 @@ static Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("revision", GICState, revision, 1),
     /* True if the GIC should implement the security extensions */
     DEFINE_PROP_BOOL("has-security-extensions", GICState, security_extn, 0),
+    /* True if the GIC should implement the virtualization extensions */
+    DEFINE_PROP_BOOL("has-virtualization-extensions", GICState, virt_extn, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 4b611c8d6d..a611e8ee12 100644
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
index af3ca18e2f..b5585fec45 100644
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
@@ -100,6 +115,15 @@ typedef struct GICState {
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
@@ -108,9 +132,13 @@ typedef struct GICState {
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
@@ -134,6 +162,7 @@ typedef struct ARMGICCommonClass {
 } ARMGICCommonClass;
 
 void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
-                            const MemoryRegionOps *ops);
+                            const MemoryRegionOps *ops,
+                            const MemoryRegionOps *virt_ops);
 
 #endif
-- 
2.18.0

