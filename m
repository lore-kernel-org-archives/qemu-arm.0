Received: by 10.28.71.27 with SMTP id u27csp2520902wma;
        Mon, 5 Feb 2018 05:52:35 -0800 (PST)
X-Google-Smtp-Source: AH8x224nLBfIjAnBbp5hZILAW34kYK46lQF1A/YRsWFaptgpNEqppi8vkXTLAF9gCMKsxH2E4eWm
X-Received: by 10.37.83.68 with SMTP id h65mr32524542ybb.280.1517838755176;
        Mon, 05 Feb 2018 05:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517838755; cv=none;
        d=google.com; s=arc-20160816;
        b=FuJQ7R1Q/KNJ0bWWQtxZiJiWQ3LUxsthfZ6AUgBAAFT/0IkU0igjow7z67s6Ma4Vys
         er4Gw4CDXJx2mlNeL5I+OvipJR3bvjt6u6S8YyKq29Jocgt9UNv+cgdvxG8xoatHO3qL
         DZRcRkT4gZlv4Bjv7e5I63zDtRjdIX0vMyjvYuEVAxx2zzZs7q9NvFMOZHsMC6t4rm+y
         5n69CPfZwtz4lYp2sgkmpXfx4SoLXeCkJWw2IqEOETLpfMnNBxPiMy3rHwOzqTy3NPTY
         urEZuK5E6OhB6YPpoCAV1J1phyZyiW6O+2j9GhY/1G/J2kexc0SKB3IwL5XD/ZH1/RbM
         W7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=GghOOYqpvSxi577yl8Sj0+5VnpThN3iM8vXCbAdll3o=;
        b=M3Bmpe9q362EsquM4lDdj/fpxwceZw32h1iat7rklzeCNktV2le2tlA0Ul6Nm+MAob
         /jTGZOUDRtsnAKZXIMQl1PyZBkQlZJMo6GQ3rar75hQID06dc3c1rPHa3ia1OZo3AoIx
         ofAs8bDJ7PzQOVsE31FMAKjsFUgLvTpbd0D2GMb52sIyW3Upx4ON+kgjkYPq1B7ssOxA
         lgp4Sdlqgupp9FlQH619shH8ZAH1toHbUllszE/gkobl5JOayyNfbVYH+2v9MMzi5mq2
         lEqbt0cbwggL7FL8/3TRILFXWMx2dTKFYDBBpX6repMfWNxlrOlYO2DjoF5Tnv6wOrG5
         jOMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l184si1428358ywf.252.2018.02.05.05.52.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 05:52:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45375 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eihCE-0006Ke-I1
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 08:52:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih32-0006w1-69
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:43:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eih30-0007pp-TQ
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 08:43:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eih30-0007p9-Ly; Mon, 05 Feb 2018 08:43:02 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D02CE7AE92;
	Mon,  5 Feb 2018 13:43:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-112.ams2.redhat.com
	[10.36.116.112])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22B8F5F70E;
	Mon,  5 Feb 2018 13:42:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Mon,  5 Feb 2018 14:39:30 +0100
Message-Id: <1517837972-1904-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
References: <1517837972-1904-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 05 Feb 2018 13:43:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v8 12/14] hw/arm/virt: Add SMMUv3 to the virt
 board
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
Cc: mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pdoVDIYfiUYA

From: Prem Mallappa <prem.mallappa@broadcom.com>

Add code to instantiate an smmuv3 in virt machine. A new iommu
integer member is introduced in VirtMachineState to store the type
of the iommu in use.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
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

Conflicts:
	hw/arm/smmuv3.c
---
 hw/arm/virt.c         | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h | 10 ++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b334c82..a760a68 100644
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
+    [VIRT_SMMU] =               { 0x09050000, 0x00020000 }, /* 128K, needed */
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
 
@@ -1001,7 +1004,57 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
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
@@ -1114,6 +1167,15 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
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
index 33b0ff3..13d3724 100644
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
 
+enum {
+    VIRT_IOMMU_NONE,
+    VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_VIRTIO,
+};
+
 typedef struct MemMapEntry {
     hwaddr base;
     hwaddr size;
@@ -96,6 +104,7 @@ typedef struct {
     bool its;
     bool virt;
     int32_t gic_version;
+    int32_t iommu;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
     const int *irqmap;
@@ -105,6 +114,7 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t iommu_phandle;
     int psci_conduit;
 } VirtMachineState;
 
-- 
2.5.5

