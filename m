Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3112315wme;
        Sun, 13 May 2018 07:39:28 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqI/YQuI3yXqoN9R8qNHUHTHQown1lafL7mmouRmPzIZcN8J9pHeQCzgeE+bMcx3Uk/3naY
X-Received: by 2002:ac8:2e04:: with SMTP id r4-v6mr5436323qta.266.1526222368180;
        Sun, 13 May 2018 07:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222368; cv=none;
        d=google.com; s=arc-20160816;
        b=FomSIorjaoSXLW+OiaLEvqLIzisV0zgMrab4O83WZVgKx9JLgGnrHbljVvYL34ofH7
         P3G6HZ4obB/V6d4bORHZTm/TegwSSUIv9DkKBXLxr+a6/vaMTPxJDnucYU8z0JYfK3bw
         JMn2naO4+Nf/UL6LwxkCC6LTMQNcRt3QlLnNushUcFWZ7vezZKfLkhaJoCBmHICt0JZe
         oLtmbnBqHlmfJcb0BpECQodNVwBS8iK5NDh/T6zMTnWx+dF6AVuhrW7aBC/fxRNfdZsX
         /eFly6UdoHtEbH97vSxtqOU4xwHt6fdYsqHWeyPoWjy5we+KzTNAKTlSA+xgjxpSBDDN
         ytXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=emwm0AseH2yFBZcqyafNusVfRREo6il2t12n/hAwk3s=;
        b=TbXIciAavlbCwzjd/imus7dQFkamAOsK2/YdSGcbj3LBWKsArKrJJGf3tLQc1FM24p
         0nc/Clp/7dl5sjs8OExdf3x7gw+o4KPmsCRi/ngGqsFMbjnSGB8+GXI6gQfYj1+8e/sy
         wismFXpR3o1nFepSAnwMSKCGhW+8capS6GEaNEEiAmg4/CcY1tKaaklG5kyFucmlC/YP
         UUGayQWx77aGZr64PSe/YNyr6YFZyfMOaq5cRi4otoyXzszOyJy6qlZLSm/dDvts84F2
         U/Ioe1AeJu8m/sCWCY7xmysYvv5aZ2xAokuPecneZkVB8iLjeGjpGavLOusFbHVAf8U4
         NfHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a12-v6si7162440qtj.370.2018.05.13.07.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs9n-00031e-JD
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs62-00083v-Rp
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs61-0006Qx-Qi
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41556 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs61-0006QC-L4; Sun, 13 May 2018 10:35:33 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1FFB4407572E;
	Sun, 13 May 2018 14:35:33 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77DF88445F;
	Sun, 13 May 2018 14:35:31 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:12 +0200
Message-Id: <1526222114-5324-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Sun, 13 May 2018 14:35:33 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 5/7] hw/arm/virt: GICv3 DT node with one or two
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6IjPBPe7t3OR

This patch allows the creation of a GICv3 node with 1 or 2
redistributor regions depending on the number of smu_cpus.
The second redistributor region is located just after the
existing RAM region, at 256GB and contains up to (512 - 123) vcpus.

Please refer to kernel documentation for further node details:
Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 29 ++++++++++++++++++++++++-----
 include/hw/arm/virt.h | 12 ++++++++++++
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c9d842d..f35962a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -151,6 +151,8 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
     [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
+    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
+    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },
     /* Second PCIe window, 512GB wide at the 512GB boundary */
     [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
 };
@@ -404,13 +406,30 @@ static void fdt_add_gic_node(VirtMachineState *vms)
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
index 886372c..ba52716 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -35,6 +35,7 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
+#include "sysemu/kvm.h"
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
@@ -60,6 +61,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
@@ -129,4 +131,14 @@ typedef struct {
 
 void virt_acpi_setup(VirtMachineState *vms);
 
+/* Return the number of used redistributor regions  */
+static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
+{
+    uint32_t rdist1_count = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
+
+    assert(vms->gic_version == 3);
+
+    return kvm_irqchip_in_kernel() && vms->smp_cpus > rdist1_count ? 2 : 1;
+}
+
 #endif /* QEMU_ARM_VIRT_H */
-- 
2.5.5

