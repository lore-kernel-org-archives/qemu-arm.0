Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp407745wrq;
        Wed, 13 Jun 2018 01:54:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIv9AkDhpuJFzMNm98yC4l1ubDCxCI1y7vPc6LIHzl7W+cAsoqjwFIw2HyM30fmk660M1KL
X-Received: by 2002:a0c:b25b:: with SMTP id k27-v6mr3545384qve.231.1528880050455;
        Wed, 13 Jun 2018 01:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528880050; cv=none;
        d=google.com; s=arc-20160816;
        b=ccWtk9J08oMys5EVn2dsDJXLJ3gyHSbRFCNjP1zOqTpOd5Ohr4oEhF3RjdTIRWLUKU
         DHKr835QCBJGiXwp+8Qi42Q2WsixWIGAEX8W6VDK4Lv18ilidIxountNx/hrZ7pMquCd
         LoTVehN0h5aKWicHDyU8KNrytQpkB75pWfs0S28iJT1jRcl+AiM3bqnI496yWUh4Ts4q
         oHWi6YDtpYUuSMlbAnmvHBXPeVC21xlOuL1spdaaOiwNNmLYGE1tyNBYOUJVqDZQ7l/5
         JFsMITdV5u660lnod7WaILczB/emv2DYBl+JXJLEJvsg6XnMs7Crz4AsliXa896RthJ6
         CoQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=IbZHwmNkDelMcCQ8cmi4h3U3o0cDUHZDhbulBnbJ5pI=;
        b=KEPhn1IEJhCzqo0kbzZwzCyy1GUSzbH50nPbY38p6WJPzEJbkwwxQzfQ7qmaS6XZSF
         O9OGGJENdM9h2YU5T3jpiXD5Ifn4uFCf5oyTaD/LUMb0x3Ymq5bSVy/TSOOXFxjFV5B7
         iEeLqT5D0cIHxWhf1Lmz860ksnXEWf1+VUZyGVOGl3enzaQTaaWnrZPomE4981XHGR5Z
         xMftipj3WLD5LUGSMy2zTEiCsiZJuXG4UOG5oF48oLDwRpi0bPsjVR8Gb0ZMVAQl3EYF
         mv4Unwcb4Lb9XmYnk1eZz483YjOAx+Sc5XP9gSDH/FmClsQ6ZbrUG22U8t4Zmecq2Ecy
         2Egg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t3-v6si2172323qvb.80.2018.06.13.01.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jun 2018 01:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fT1Xe-0006P4-03
	for alex.bennee@linaro.org; Wed, 13 Jun 2018 04:54:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sl-0002Cv-C6
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fT1Sj-0003tn-Ip
	for qemu-arm@nongnu.org; Wed, 13 Jun 2018 04:49:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38392 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fT1Sj-0003tX-9x; Wed, 13 Jun 2018 04:49:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 892147D84D;
	Wed, 13 Jun 2018 08:49:04 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4FEC1116703;
	Wed, 13 Jun 2018 08:49:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 13 Jun 2018 10:48:39 +0200
Message-Id: <1528879723-24675-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 08:49:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Wed, 13 Jun 2018 08:49:04 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 5/9] hw/arm/virt: GICv3 DT node with one or two
 redistributor regions
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, zhaoshenglong@huawei.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LK0uLdMtHQY1

This patch allows the creation of a GICv3 node with 1 or 2
redistributor regions depending on the number of smu_cpus.
The second redistributor region is located just after the
existing RAM region, at 256GB and contains up to up to 512 vcpus.

Please refer to kernel documentation for further node details:
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- VIRT_GIC_REDIST2 is now 64MB large, ie. 512 redistributor capacity
- virt_gicv3_redist_region_count does not test kvm_irqchip_in_kernel
  anymore
---
 hw/arm/virt.c         | 29 ++++++++++++++++++++++++-----
 include/hw/arm/virt.h | 14 ++++++++++++++
 2 files changed, 38 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2885d18..5c02cc5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -148,6 +148,8 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
+    /* Additional 64 MB redist region (can contain up to 512 redistributors) */
+    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x4000000ULL },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
     [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
 };
@@ -401,13 +403,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/intc", "#size-cells", 0x2);
     qemu_fdt_setprop(vms->fdt, "/intc", "ranges", NULL, 0);
     if (vms->gic_version == 3) {
+        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
+
         qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
                                 "arm,gic-v3");
-        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
-                                     2, vms->memmap[VIRT_GIC_DIST].base,
-                                     2, vms->memmap[VIRT_GIC_DIST].size,
-                                     2, vms->memmap[VIRT_GIC_REDIST].base,
-                                     2, vms->memmap[VIRT_GIC_REDIST].size);
+
+        qemu_fdt_setprop_cell(vms->fdt, "/intc",
+                              "#redistributor-regions", nb_redist_regions);
+
+        if (nb_redist_regions == 1) {
+            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_REDIST].base,
+                                         2, vms->memmap[VIRT_GIC_REDIST].size);
+        } else {
+            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_REDIST].base,
+                                         2, vms->memmap[VIRT_GIC_REDIST].size,
+                                         2, vms->memmap[VIRT_GIC_REDIST2].base,
+                                         2, vms->memmap[VIRT_GIC_REDIST2].size);
+        }
+
         if (vms->virt) {
             qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
                                    GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4ac7ef6..308156f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,8 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "sysemu/kvm.h"
+#include "hw/intc/arm_gicv3_common.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -60,6 +62,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
@@ -130,4 +133,15 @@ typedef struct {
 
 void virt_acpi_setup(VirtMachineState *vms);
 
+/* Return the number of used redistributor regions  */
+static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
+{
+    uint32_t redist0_capacity =
+                vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
+
+    assert(vms->gic_version == 3);
+
+    return vms->smp_cpus > redist0_capacity ? 2 : 1;
+}
+
 #endif /* QEMU_ARM_VIRT_H */
-- 
2.5.5

