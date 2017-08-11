Received: by 10.25.221.202 with SMTP id w71csp953264lfi;
        Fri, 11 Aug 2017 07:24:11 -0700 (PDT)
X-Received: by 10.55.92.199 with SMTP id q190mr20916266qkb.127.1502461451591;
        Fri, 11 Aug 2017 07:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502461451; cv=none;
        d=google.com; s=arc-20160816;
        b=na3DQrqPQY9Rzo6Gw+IdKX0VsIPkpDBHTc3HypXWjtTdGBQhfC5LUaEj/BdneGBNLb
         7ORdl8JSgTFH3O0BUo/6+UouOx92nk/HRb6BTVDMU/UTUToZQl4r6svy1mcfESJPDbdB
         WlU/lGtjJDcoenK+4yZuToGqyumjePf+cDBriV/oN6A1YCNLBVMZ7u9QGOnB6N3SsIsJ
         INN5zixZGw24QGYi0Ug7d4UzxLZESexK8IbAXMQz2EzicmLMLC0AVtX0bIqzLlHwoLIZ
         6JQoE87qfcXgvGNwjIiu90fRoMZOstAUFP8TteoHO+XxaNDvM32pfbuZ52MGMaqCyOJ8
         RtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=5U4pgZSIm8o8vhElK7QENoU1Cjni9nzH2FwaqfudINY=;
        b=P7ibMuFBI2fRHrPVtsNA5iRq7zuK3nzPN6LhrvZMwD63SbE/pUrbg8H4TEd/V5hFLr
         B42IW4TeLlD8xR/1xrQlfodUOaOoRpxgu289X4mmSzKnmL8owaMqkAixzjBDBoLOHTTo
         pXLMVcJhVt50UmSqXeBEBQb1STvMI6mOgJOncV17nyfWBuOrx0JbGEEk7aYjtgOeZQBX
         9HR1rjGPNFEldPoLQtgIGvCsVR5Ge1YFxaPI1ZFCq99nc4ZUiCbjXfgyJ7uFus4tedsI
         dDiufwCchSfDGzf3I2qo+GBjSt0XkMXq8Dc1b7gBSu4Czljm0nyCB08jaa+ODQn8OZgk
         oP5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j195si897078qke.166.2017.08.11.07.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:24:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgArA-0000JH-RR
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:24:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAr5-0000H9-8B
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:24:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAr1-00029n-3e
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:24:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dgAr0-00029I-Qb; Fri, 11 Aug 2017 10:23:59 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90297C050CDA;
	Fri, 11 Aug 2017 14:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 90297C050CDA
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-162.ams2.redhat.com
	[10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97625A21B0;
	Fri, 11 Aug 2017 14:23:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Fri, 11 Aug 2017 16:22:28 +0200
Message-Id: <1502461354-11327-4-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Aug 2017 14:23:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v6 3/9] hw/arm/virt: Add SMMUv3 to the virt board
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qGFUa1g9cxw0

From: Prem Mallappa <prem.mallappa@broadcom.com>

Add code to instantiate an smmu-v3 in mach-virt. A new boolean flag
is introduced in VirtMachineState to allow this instantiation. It
is currently false.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v4 -> v5:
- add dma-coherent property

v2 -> v3:
- vbi was removed. Use vms instead
- migrate to new smmu binding format (iommu-map)
- don't use appendprop anymore
- add vms->smmu and guard instantiation with this latter
- interrupts type changed to edge
---
 hw/arm/smmuv3.c         |  5 +++--
 hw/arm/virt.c           | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/smmuv3.h |  2 +-
 include/hw/arm/virt.h   |  4 ++++
 4 files changed, 67 insertions(+), 3 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index a3199f1..e195a0e 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1026,8 +1026,9 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
 
     sdev = sbus->pbdev[devfn];
     if (!sdev) {
-        char *name = g_strdup_printf("%s-%d-%d", TYPE_SMMU_V3_DEV,
-                                      pci_bus_num(bus), devfn);
+        char *name = g_strdup_printf("%s-%d-%d",
+                                     TYPE_SMMUV3_IOMMU_MEMORY_REGION,
+                                     pci_bus_num(bus), devfn);
         sdev = sbus->pbdev[devfn] = g_malloc0(sizeof(SMMUDevice));
 
         sdev->smmu = s;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6b7a0fe..b9246b9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,6 +56,7 @@
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
+#include "hw/arm/smmuv3.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -139,6 +140,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_SMMU] =               { 0x09050000, 0x00020000 }, /* 128K, needed */
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -159,6 +161,7 @@ static const int a15irqmap[] = {
     [VIRT_SECURE_UART] = 8,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
@@ -991,6 +994,53 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
+static void alloc_smmu_phandle(VirtMachineState *vms)
+{
+    if (vms->smmu && !vms->smmu_phandle) {
+        vms->smmu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+    }
+}
+
+static void create_smmu(const VirtMachineState *vms, qemu_irq *pic)
+{
+    char *smmu;
+    const char compat[] = "arm,smmu-v3";
+    int irq =  vms->irqmap[VIRT_SMMU];
+    hwaddr base = vms->memmap[VIRT_SMMU].base;
+    hwaddr size = vms->memmap[VIRT_SMMU].size;
+    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+
+    if (!vms->smmu) {
+        return;
+    }
+
+    sysbus_create_varargs("smmuv3", base, pic[irq], pic[irq + 1],
+                          pic[irq + 2], pic[irq + 3], NULL);
+
+    smmu = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, smmu);
+    qemu_fdt_setprop(vms->fdt, smmu, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, smmu, "reg", 2, base, 2, size);
+
+    qemu_fdt_setprop_cells(vms->fdt, smmu, "interrupts",
+            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+
+    qemu_fdt_setprop(vms->fdt, smmu, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(vms->fdt, smmu, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(vms->fdt, smmu, "clock-names", "apb_pclk");
+    qemu_fdt_setprop(vms->fdt, smmu, "dma-coherent", NULL, 0);
+
+    qemu_fdt_setprop_cell(vms->fdt, smmu, "#iommu-cells", 1);
+
+    qemu_fdt_setprop_cell(vms->fdt, smmu, "phandle", vms->smmu_phandle);
+    g_free(smmu);
+}
+
 static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1103,6 +1153,11 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
 
+    if (vms->smmu) {
+        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                               0x0, vms->smmu_phandle, 0x0, 0x10000);
+    }
+
     g_free(nodename);
 }
 
@@ -1448,8 +1503,12 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vms, pic);
 
+    alloc_smmu_phandle(vms);
+
     create_pcie(vms, pic);
 
+    create_smmu(vms, pic);
+
     create_gpio(vms, pic);
 
     /* Create mmio transports, so the user can create virtio backends
diff --git a/include/hw/arm/smmuv3.h b/include/hw/arm/smmuv3.h
index bdeea1b..dbc5a57 100644
--- a/include/hw/arm/smmuv3.h
+++ b/include/hw/arm/smmuv3.h
@@ -22,7 +22,7 @@
 
 #include "hw/arm/smmu-common.h"
 
-#define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-iommu-memory-region"
+#define TYPE_SMMUV3_IOMMU_MEMORY_REGION "smmuv3-iommu-memory-region"
 
 #define SMMU_NREGS            0x200
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..164a531 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -38,6 +38,7 @@
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
+#define NUM_SMMU_IRQS          4
 
 #define ARCH_GICV3_MAINT_IRQ  9
 
@@ -59,6 +60,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
@@ -95,6 +97,7 @@ typedef struct {
     bool highmem;
     bool its;
     bool virt;
+    bool smmu;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
@@ -105,6 +108,7 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t smmu_phandle;
     int psci_conduit;
 } VirtMachineState;
 
-- 
2.5.5

