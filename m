Received: by 10.28.71.27 with SMTP id u27csp851552wma;
        Fri, 19 Jan 2018 07:10:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBot4YIqPrEx7FrwpIpj2Cy86VrIMmhmXmvC8ITuUoWjaWk/sqC4zZsDfpbYwAyXFZ0tpTU4+
X-Received: by 10.37.15.86 with SMTP id 83mr6419729ybp.378.1516374633162;
        Fri, 19 Jan 2018 07:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374633; cv=none;
        d=google.com; s=arc-20160816;
        b=kZ5W03lSM2Kk3UiDAqplprGF9lOgx9WkVAUm3uVKoVKd2VizT3sC7LMyBb6tn0NXTR
         9vWf1m3lQfUZY+zi6PHBwHGdwDvQqfI0yPvnseXULJv3MqRftprtkcHe2X0VF1ATjYa+
         dCZ90btoHbrSBtq+PmzJNoYUwR5ovZzElIv3Hwp2jvb5Ut8erYTKJ7XnmHsHUfV+15jE
         IPfmmN9e1EjnyiSyJ23TBjTux74bX+oKXtTl1kQaYuhoKiMJC7ahRGoiOcSEIMFQXdQh
         TKXhrkNBLkfMjrkbLoGG87jtus1/dC7Gpkdg3EA8GrandUjparF3ZYRgpKrjWfFztjH5
         wRow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=OeRS6hK/FeWczAMKICY80d0/V1VlD+bxBgxjBGAb9D0=;
        b=NiOs6fPUsv7Ml11cEjS3wFnTOt6n0JtKx4XbU0r4CU0b5A5dS/qoohIbCZvXnjcFyp
         ZnnOcAbGMZ9I+SLXBTmXOTY2B8zkuN4BXUO8/TFFjOuwYGk1iPzwQj1UIEP9DpbPydKa
         f6fsEnWDVeJ/BQP7gAgTyN2Nfze4BbfyXXxwkgAwKK47RMbe+/McxIR33SdeaorYTP1h
         m0Z3/uMsWBPOlv7TCE+qUV9HXReDEZxOkg5NfHGv1Zn8cG2sIufqdKo/awiTqrvizPpK
         3KufxNTSo2qpTgvjux64ORMkLQRGlMuULMrk/IhVaVL/k9EUdLKyFOfn6lSzM08Pvxs5
         CIAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h127si636328ybc.408.2018.01.19.07.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:10:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYJM-0004xg-GJ
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:10:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYF3-00013H-4C
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:06:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYEz-00022F-OV
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:06:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYEz-0001z9-GU; Fri, 19 Jan 2018 10:06:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E75AA4531;
	Fri, 19 Jan 2018 15:06:00 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1A595C25E;
	Fri, 19 Jan 2018 15:05:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:10 +0000
Message-Id: <1516373355-305-18-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 19 Jan 2018 15:06:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 17/22] hw/arm/virt: Add virtio-iommu to the virt
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXm2TiNZeeok

The specific virtio-mmio node is inconditionally added on
machine init while the binding between this latter and the
PCIe host bridge is done on machine init done notifier, only
if -device virtio-iommu-device was added to the qemu command
line.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5:
- VirtMachineClass no_iommu added in this patch
- Use object_resolve_path_type
---
 hw/arm/virt.c         | 83 +++++++++++++++++++++++++++++++++++++++++++++++----
 include/hw/arm/virt.h |  5 ++++
 2 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7844311..5584109 100644
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
+    [VIRT_IOMMU] =              { 0x09050000, 0x00000200 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -159,6 +161,7 @@ static const int a15irqmap[] = {
     [VIRT_SECURE_UART] = 8,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_IOMMU] = 74,
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
@@ -999,6 +1002,69 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
+static void virtio_iommu_notifier(Notifier *notifier, void *data)
+{
+    VirtMachineState *vms = container_of(notifier, VirtMachineState,
+                                         virtio_iommu_done);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    struct arm_boot_info *info = &vms->bootinfo;
+    bool ambiguous;
+    Object *obj = object_resolve_path_type("", TYPE_VIRTIO_IOMMU, &ambiguous);
+    int dtb_size;
+    void *fdt = info->get_dtb(info, &dtb_size);
+
+    if (!obj) {
+        return;
+    }
+
+    if (vmc->no_iommu) {
+        error_setg(&error_fatal, "this machine version does not support iommu");
+    }
+
+    if (ambiguous) {
+        error_setg(&error_fatal, "a single virtio-iommu device is supported!");
+    }
+
+    object_property_set_bool(obj, false, "msi_bypass", &error_fatal);
+
+    qemu_fdt_setprop_cells(fdt, vms->pcie_host_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, 0x10000);
+}
+
+static void create_virtio_iommu(VirtMachineState *vms, qemu_irq *pic)
+{
+    char *node;
+    const char compat[] = "virtio,mmio";
+    int irq =  vms->irqmap[VIRT_IOMMU];
+    hwaddr base = vms->memmap[VIRT_IOMMU].base;
+    hwaddr size = vms->memmap[VIRT_IOMMU].size;
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    if (vmc->no_iommu) {
+        return;
+    }
+
+    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
+    sysbus_create_simple("virtio-mmio", base, pic[irq]);
+
+    node = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
+    qemu_fdt_add_subnode(vms->fdt, node);
+    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg", 2, base, 2, size);
+
+    qemu_fdt_setprop_cells(vms->fdt, node, "interrupts",
+            GIC_FDT_IRQ_TYPE_SPI, irq, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+
+    qemu_fdt_setprop(vms->fdt, node, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    g_free(node);
+
+    vms->virtio_iommu_done.notify = virtio_iommu_notifier;
+    qemu_add_machine_init_done_notifier(&vms->virtio_iommu_done);
+}
+
 static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1074,7 +1140,8 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
         }
     }
 
-    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    vms->pcie_host_nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    nodename = vms->pcie_host_nodename;
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
@@ -1113,7 +1180,6 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     qemu_fdt_setprop_cell(vms->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vms, vms->gic_phandle, irq, nodename);
 
-    g_free(nodename);
 }
 
 static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
@@ -1429,16 +1495,16 @@ static void machvirt_init(MachineState *machine)
 
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
 
@@ -1463,6 +1529,7 @@ static void machvirt_init(MachineState *machine)
      * Notifiers are executed in registration reverse order.
      */
     create_platform_bus(vms, pic);
+    create_virtio_iommu(vms, pic);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
@@ -1702,8 +1769,12 @@ static void virt_2_11_instance_init(Object *obj)
 
 static void virt_machine_2_11_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_12_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
+
+    vmc->no_iommu = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 7e31e99..a13b895 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -59,6 +59,7 @@ enum {
     VIRT_GIC_V2M,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
+    VIRT_IOMMU,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
@@ -84,12 +85,14 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool no_iommu;
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
 typedef struct {
     MachineState parent;
     Notifier machine_done;
+    Notifier virtio_iommu_done;
     FWCfgState *fw_cfg;
     bool secure;
     bool highmem;
@@ -105,6 +108,8 @@ typedef struct {
     uint32_t clock_phandle;
     uint32_t gic_phandle;
     uint32_t msi_phandle;
+    uint32_t iommu_phandle;
+    char *pcie_host_nodename;
     int psci_conduit;
     PCIBus *pci_bus;
 } VirtMachineState;
-- 
1.9.1

