Received: by 10.25.0.23 with SMTP id 23csp1977598lfa;
        Wed, 7 Jun 2017 01:37:31 -0700 (PDT)
X-Received: by 10.200.10.71 with SMTP id f7mr37126223qti.226.1496824651164;
        Wed, 07 Jun 2017 01:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496824651; cv=none;
        d=google.com; s=arc-20160816;
        b=GEXT99PrNBvIp4pW3GML7TRw/GjAHiNQHh8dJz+UyDIzRV+meVsrVDnfTxEQpBYe5f
         +yXwl45XUPBPFoXRja6c4PLvBnWeJr6lMExvFVfrlUPDJSIrcc8SszHSHtvxz10AHfLL
         9HcHADThGdCC2Ox2zWLqbTXXB1kyhhkoatil4g3lBeE8vS+8AfGNRAmTyJdxX4laqiMz
         CS5gQFoZCH2RFZ6BoAxrYC+4QbdQUxsvcNfEsOX0d12lRT974+yoF2rItF8ev86Cc86X
         /xvEdSIx8PYxoyUHhbvJqp6hKSNAVW9CP7fcMsuiMfqUSA6r5a4uiHAl+Q39pW2yYM9t
         /Fmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=5NElO9e70K2s/liwGumUFVPMEVIMRWWKUFnZHRfs1tU=;
        b=OJpcfNdeslnQE28amZvJb36SwuJMksKE4nKTOFkgVcaLAiDlSS4c0wTOAt8WtCal6K
         xo/Kz6oyD8uGCeq8lTZlSSf1YYIfoLTZcOZ3nd3XaVDs2T08KPjAx0Lidq2Yt3cA2MaG
         WR3hPWY7BiN4ge4oz2g364TuRXfT2ShY6zmajh2dbGzZawdrhbLtMXK6lJmF2udhkFIQ
         IVFouEJ/T60/NL57sk+4zWNbgtm1cDrWYWTNLsQ+RDukwInBRnlWddLY1GB70RXR3kbE
         LPC8Zrr0hLUnn4XUywab+1O6fIKvmOt2bCe6y+nLJYBKRSwd2ZLlPq08nJJqVbobSBD3
         euYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j44si1297369qtc.63.2017.06.07.01.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Jun 2017 01:37:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41973 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIWT2-00040f-BE
	for alex.bennee@linaro.org; Wed, 07 Jun 2017 04:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSv-0003yE-2P
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:37:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIWSr-0001EM-1X
	for qemu-arm@nongnu.org; Wed, 07 Jun 2017 04:37:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIWSq-0001Dw-OV; Wed, 07 Jun 2017 04:37:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A42CC61B8A;
	Wed,  7 Jun 2017 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A42CC61B8A
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A42CC61B8A
Received: from localhost.localdomain.com (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FCE818364;
	Wed,  7 Jun 2017 08:37:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Wed,  7 Jun 2017 10:35:56 +0200
Message-Id: <1496824556-1883-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
References: <1496824556-1883-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 07 Jun 2017 08:37:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 8/8] hw/arm/virt: Add virtio-iommu the virt board
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
Cc: kevin.tian@intel.com, bharat.bhushan@nxp.com, marc.zyngier@arm.com,
	tn@semihalf.com, will.deacon@arm.com, drjones@redhat.com,
	robin.murphy@arm.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WQPziwFRqM0U

The specific virtio-mmio node is inconditionally added on
machine init while the binding between this latter and the
PCIe host bridge is done on machine init done notifier, only
if -device virtio-iommu-device was added to the qemu command
line.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/arm/virt.c         | 92 +++++++++++++++++++++++++++++++++++++++++++++++----
 include/hw/arm/virt.h |  4 +++
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6eb0d2a..6bcfbcd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -52,6 +52,7 @@
 #include "hw/arm/fdt.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "kvm_arm.h"
 #include "hw/smbios/smbios.h"
 #include "qapi/visitor.h"
@@ -139,6 +140,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_SMMU] =               { 0x09050000, 0x00000200 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -159,6 +161,7 @@ static const int a15irqmap[] = {
     [VIRT_SECURE_UART] = 8,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_SMMU] = 74,
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
@@ -991,7 +994,81 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
+static int bind_virtio_iommu_device(Object *obj, void *opaque)
+{
+    VirtMachineState *vms = (VirtMachineState *)opaque;
+    struct arm_boot_info *info = &vms->bootinfo;
+    int dtb_size;
+    void *fdt = info->get_dtb(info, &dtb_size);
+    Object *dev;
+
+    dev = object_dynamic_cast(obj, TYPE_VIRTIO_IOMMU);
+
+    if (!dev) {
+        /* Container, traverse it for children */
+        return object_child_foreach(obj, bind_virtio_iommu_device, opaque);
+    }
+
+    qemu_fdt_setprop_cells(fdt, vms->pcie_host_nodename, "iommu-map",
+                           0x0, vms->smmu_phandle, 0x0, 0x10000);
+
+    return true;
+}
+
+static
+void virtio_iommu_notifier(Notifier *notifier, void *data)
+{
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         virtio_iommu_done);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    Object *container;
+
+
+    if (vmc->no_iommu) {
+        return;
+    }
+
+    container = container_get(qdev_get_machine(), "/peripheral");
+    bind_virtio_iommu_device(container, vms);
+    container = container_get(qdev_get_machine(), "/peripheral-anon");
+    bind_virtio_iommu_device(container, vms);
+}
+
+static void create_virtio_iommu(VirtMachineState *vms, qemu_irq *pic)
+{
+    char *smmu;
+    const char compat[] = "virtio,mmio";
+    int irq =  vms->irqmap[VIRT_SMMU];
+    hwaddr base = vms->memmap[VIRT_SMMU].base;
+    hwaddr size = vms->memmap[VIRT_SMMU].size;
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    if (vmc->no_iommu) {
+        return;
+    }
+
+    vms->smmu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
+    sysbus_create_simple("virtio-mmio", base, pic[irq]);
+
+    smmu = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, smmu);
+    qemu_fdt_setprop(vms->fdt, smmu, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, smmu, "reg", 2, base, 2, size);
+
+    qemu_fdt_setprop_cells(vms->fdt, smmu, "interrupts",
+            GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+
+    qemu_fdt_setprop(vms->fdt, smmu, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cell(vms->fdt, smmu, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(vms->fdt, smmu, "phandle", vms->smmu_phandle);
+    g_free(smmu);
+
+    vms->virtio_iommu_done.notify = virtio_iommu_notifier;
+    qemu_add_machine_init_done_notifier(&vms->virtio_iommu_done);
+}
+
+static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1064,7 +1141,8 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
         }
     }
 
-    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    vms->pcie_host_nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    nodename = vms->pcie_host_nodename;
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
@@ -1103,7 +1181,6 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
 
-    g_free(nodename);
 }
 
 static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
@@ -1448,16 +1525,16 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vms, pic);
 
-    create_pcie(vms, pic);
-
-    create_gpio(vms, pic);
-
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
      */
     create_virtio_devices(vms, pic);
 
+    create_pcie(vms, pic);
+
+    create_gpio(vms, pic);
+
     vms->fw_cfg = create_fw_cfg(vms, &address_space_memory);
     rom_set_fw(vms->fw_cfg);
 
@@ -1482,6 +1559,7 @@ static void machvirt_init(MachineState *machine)
      * Notifiers are executed in registration reverse order.
      */
     create_platform_bus(vms, pic);
+    create_virtio_iommu(vms, pic);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ff27551..070cb39 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -59,6 +59,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_SMMU,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
@@ -91,6 +92,7 @@ typedef struct {
 typedef struct {
     MachineState parent;
     Notifier machine_done;
+    Notifier virtio_iommu_done;
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
@@ -106,6 +108,8 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t smmu_phandle;
+    char *pcie_host_nodename;
     int psci_conduit;
 } VirtMachineState;
 
-- 
2.5.5

