Received: by 10.28.4.212 with SMTP id 203csp881478wme;
        Wed, 25 Apr 2018 07:25:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo471XhCUwsIMF+HhY/2VN5SlzZvUN7z8JEcFoPi27SkuPPMPBQLIkOCcorZH9kueF0ml+f
X-Received: by 2002:ac8:4057:: with SMTP id j23-v6mr18372103qtl.64.1524666312622;
        Wed, 25 Apr 2018 07:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666312; cv=none;
        d=google.com; s=arc-20160816;
        b=plOBviNFponXc7dcvd50xX6loOYim1i56arjvzVn+bUhRNcVhdl7fbj45zIqjl3cad
         fhxbxtqED1LqPr+nfjndIaP7gVbkZQGorw7h9mt7v8oFx3G2C498N7yQy4ADCj2u0I0d
         mrCprfBZKk7ERzYeZCyH9ytSEDtuo+4wFJh9V7eGO0iEk/QPVJpS3KKuxp5VCUGhCpjg
         TlTrig/ECAUlRELTzJMTxvSofcK/yqLFgtP569XmmGifnbWQFzozAQaqq7luPrw21F4/
         uptlHiHWff0tO1mlKMdZ+wCAZnKxM9qZH9WTD2C9vDSMlYMP9wpBsTJPV8l9VwRnyNYE
         zrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6+E6jizY2DYBpkikD6rgtECbvOqVUv7mgG9kZQpd5dI=;
        b=Nt0MT53UaOtMUpEABaatwj8Izec0koS6kpyIzJnhxRR9XIFIfzB7gnPVW0a1BzfyOz
         ut3RAtC/5rEP+7/H/hfaRI/qM+OOY1ztebWo0nXOkBV3CVVZGgeiOLgXYWArrh5EqhKH
         cfm6+jQfLIFiodvGBBVJjrMaoXVXoVTTrWNcheCFZae9ofZKL/3H713IswtuLA7bLSkV
         RUbeHkBcpXVWfy2voQ8AzzL1v7Z3WLJKn4VC/xafai56VOjKsV1XkcIiw0WzHX4xEhXL
         q466QvVadwCK0RE9LcEwVyg9tVIkhCLsa63CQwYU0q/pvljtPUDPQLdLFVj89fSWlJj4
         Fx+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o41-v6si1853617qtc.99.2018.04.25.07.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37214 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLM8-0006oh-1s
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLE8-0000vp-6D
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLE6-00068P-Rd
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:16:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43418 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLE0-00063U-NN; Wed, 25 Apr 2018 10:16:48 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 554FC87ABE;
	Wed, 25 Apr 2018 14:16:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A877B2023239;
	Wed, 25 Apr 2018 14:16:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:57 +0200
Message-Id: <1524665762-31355-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Wed, 25 Apr 2018 14:16:48 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 12/17] hw/arm/virt: Add SMMUv3 to the virt
 board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zMW/0uwwTqLa

From: Prem Mallappa <prem.mallappa@broadcom.com>

Add code to instantiate an smmuv3 in virt machine. A new iommu
integer member is introduced in VirtMachineState to store the type
of the iommu in use.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---
v9 -> v10:
- add VirtIOMMUType
- add Peter's R-b

v7 -> v8:
- integer iommu member
- add primary-bus property

v4 -> v5:
- add dma-coherent property

v2 -> v3:
- vbi was removed. Use vms instead
- migrate to new smmu binding format (iommu-map)
- don't use appendprop anymore
- add vms->smmu and guard instantiation with this latter
- interrupts type changed to edge
---
 hw/arm/virt.c         | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h | 10 ++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94dcb12..1799702 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -58,6 +58,7 @@
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
+#include "hw/arm/smmuv3.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -141,6 +142,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -161,6 +163,7 @@ static const int a15irqmap[] = {
     [VIRT_SECURE_UART] = 8,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
@@ -942,7 +945,57 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
+static void create_smmu(const VirtMachineState *vms, qemu_irq *pic,
+                        PCIBus *bus)
+{
+    char *node;
+    const char compat[] = "arm,smmu-v3";
+    int irq =  vms->irqmap[VIRT_SMMU];
+    int i;
+    hwaddr base = vms->memmap[VIRT_SMMU].base;
+    hwaddr size = vms->memmap[VIRT_SMMU].size;
+    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+    DeviceState *dev;
+
+    if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
+        return;
+    }
+
+    dev = qdev_create(NULL, "arm-smmuv3");
+
+    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
+                             &error_abort);
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+    for (i = 0; i < NUM_SMMU_IRQS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic[irq + i]);
+    }
+
+    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, node);
+    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg", 2, base, 2, size);
+
+    qemu_fdt_setprop_cells(vms->fdt, node, "interrupts",
+            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+
+    qemu_fdt_setprop(vms->fdt, node, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(vms->fdt, node, "clock-names", "apb_pclk");
+    qemu_fdt_setprop(vms->fdt, node, "dma-coherent", NULL, 0);
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    g_free(node);
+}
+
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1055,6 +1108,15 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
 
+    if (vms->iommu) {
+        vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
+        create_smmu(vms, pic, pci->bus);
+
+        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                               0x0, vms->iommu_phandle, 0x0, 0x10000);
+    }
+
     g_free(nodename);
 }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ba0c1a4..886372c 100644
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
@@ -74,6 +76,12 @@ enum {
     VIRT_SECURE_MEM,
 };
 
+typedef enum VirtIOMMUType {
+    VIRT_IOMMU_NONE,
+    VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_VIRTIO,
+} VirtIOMMUType;
+
 typedef struct MemMapEntry {
     hwaddr base;
     hwaddr size;
@@ -97,6 +105,7 @@ typedef struct {
     bool its;
     bool virt;
     int32_t gic_version;
+    VirtIOMMUType iommu;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
     const int *irqmap;
@@ -106,6 +115,7 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t iommu_phandle;
     int psci_conduit;
 } VirtMachineState;
 
-- 
2.5.5

