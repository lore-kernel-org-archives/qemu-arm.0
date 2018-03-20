Received: by 10.28.91.67 with SMTP id p64csp3782596wmb;
        Tue, 20 Mar 2018 05:44:10 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv8W6qf7md7dMtuoOEspdvMGBj/j7Uad5yq0Xti+EnJKNbiGkYGs+Xaz6dm+kRgTZl8qZoc
X-Received: by 10.200.57.228 with SMTP id v91mr23749619qte.16.1521549850393;
        Tue, 20 Mar 2018 05:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521549850; cv=none;
        d=google.com; s=arc-20160816;
        b=LiGuNLtAVwNTxjvK38iuSplyS2GdJ41nNPEP/SJkpatHN1SJ1SCGSMtClJpGuKJxJx
         4VLDJwhZ6/1e2Uf37l1prM7u6gwUMbzlodY55OKE7fEwwIyZJRG7HhsBVGlqEqefp9W8
         GXgeOg5qxbHX3UqpNDO1+0ca6K54mW1wzRgr+Vv+2PkxE+Lmm2lZ549ObqSul4wze1ww
         AfSf70Bu62vVqwOM5ndJpz/vzoH8/Y7JpRQPR+0i3mHdTNOJHJUV7r9qJG/fzfW6WLvq
         xHD/LclUGGri4/hAFTe7X8ArB6ojGEi+v0WDilS0O/U8RBHvE/W+qpJxg1s2Yz94Knho
         LKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=d6KEFLS/Agpclx2MCmWEzG9z2jTjZszG22tdeV+2JaQ=;
        b=Didvvx/o+Z31WYYpMhup8adtW43txMO57bzQ8rFaYmObneTr6V/QPIxAs26YtyrEPF
         qF5HZunNfPf64lGhAu4lxkQNe1pWlHprs1CNR2W2O/R2GaMuC1MdW4jn8xmRDJfV9fxE
         FqYew0VvOYxadcpq3TPuq/xyLec9tF5AF+XeehHPOFPE5918tfRMA2mb24WO+vrLCKWP
         8222hEzXHfI4OgzBBovkYKd1VwxOYTHfp0Rktr446jAXQWQ8byUx4mag0sCVq7Q57DkV
         La+wBgP7pKLMV6yvyq2K8UZIaxVjbCvjjq63veWNjYcnU509rokpbGGFuVkFxiv9whjs
         7pgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si2703332qkf.36.2018.03.20.05.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 05:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyGcb-0004LI-RL
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 08:44:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXX-00089W-DE
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1eyGXW-0003nZ-5J
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 08:38:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44274 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1eyGXW-0003nF-08; Tue, 20 Mar 2018 08:38:54 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 721FD8163C52;
	Tue, 20 Mar 2018 12:38:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B65D976FB;
	Tue, 20 Mar 2018 12:38:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Tue, 20 Mar 2018 13:37:34 +0100
Message-Id: <1521549456-14072-13-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
References: <1521549456-14072-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 12:38:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 20 Mar 2018 12:38:53 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v10 12/14] hw/arm/virt: Add SMMUv3 to the virt
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nls1PzVjD42Y

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
index 2c07245..cf83712 100644
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
index 33b0ff3..72ba998 100644
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
@@ -96,6 +104,7 @@ typedef struct {
     bool its;
     bool virt;
     int32_t gic_version;
+    VirtIOMMUType iommu;
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

