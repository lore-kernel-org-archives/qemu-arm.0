Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp960184wrt;
        Thu, 22 Nov 2018 09:29:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U3odqMApXkvp7eT2XGlEzJFqrfgMXn2sFoueUvdjSdl1fIKDb5BJxw80Fs5tQ40/mU/wLY
X-Received: by 2002:a25:ad4a:: with SMTP id l10-v6mr11902935ybe.10.1542907756163;
        Thu, 22 Nov 2018 09:29:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907756; cv=none;
        d=google.com; s=arc-20160816;
        b=cBRWP3K4lMRIH/Uti6gHdSYt9ahq4cq+EN8XnZu6jbGAdobRJV8xV4nIvxwCtglxPe
         Hp3MWspaiUwi+iDVBR6X10h/xJ+9yUU59hIf4ckuTURhsJcrmk1E0aKn6KgxHS2EriT9
         kcDIXTbqsR2eA4v956RMfwVNCV8ab4sLTZ7sXQxAuVs5vVJzJbLW8iJWkChoIdWHpUvC
         UnWMboBIn1kRI5e3N+G3VAZ+WwQA4xPCv7qFpXIGVEvsdu7uAvMeQM6dAlBVJ7fxQt49
         fhpkEuu1AxfVcy83Inwj4FablbyloSnVu7meH7nToKgJJWgrbNnkQOkfy3OYUxPLl3EF
         dEbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=cLqNL/fWnDm8COUx3jovKO7sqsUW58VEB8fAVjAVdv4=;
        b=y5r3mWuh5IpLDGAxhaohFlboI73RX5owPijAxmx74B1w1rtbbgGkXz8YzFvM0AHPBa
         Z+hREObIKvIMn+kOqtc39aGk6taws1id+YTSxKCM8s5AeGFvwfiTB8PjeuQynZ5xHXsq
         4Gb+i2/7l4w/JLr10b5c1e9x/KHmcCBI3ZKS1OOZjsfk5oXRVjYMQ1rngx0n0d2vkB9L
         O66mTWM7+7bRa9+roxCEgJfUP7Da0xJ6nYB13RL2E96peQxq2gm/ZQKNVWsy2lYk0pYI
         b7D8HaB7Qgzm9iiDO/nncSOkzz1IAb5TyD124kpH/ebcDWnoY3IfOTgyuOGYZbjWRE5T
         g1zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r6-v6si31812393ywl.458.2018.11.22.09.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:29:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsmx-0000mQ-HI
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:29:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsbC-0005W1-9H
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsb9-0006gi-5I
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:17:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47250)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsb8-0006dl-Py; Thu, 22 Nov 2018 12:17:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 413DCC049D79;
	Thu, 22 Nov 2018 17:17:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D75D96061E;
	Thu, 22 Nov 2018 17:16:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:36 +0100
Message-Id: <20181122171538.12359-16-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 22 Nov 2018 17:17:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 15/17] hw/arm/virt: Add the virtio-iommu device
 tree mappings
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BA0h2NqvugVz

Adds the "virtio,pci-iommu" node in the host bridge node and
the RID mapping, excluding the IOMMU RID.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8 -> v9:
- disable msi-bypass property
- addition of the subnode is handled is the hotplug handler
  and IOMMU RID is notimposed anymore

v6 -> v7:
- align to the smmu instantiation code

v4 -> v5:
- VirtMachineClass no_iommu added in this patch
- Use object_resolve_path_type
---
 hw/arm/virt.c         | 57 +++++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h |  2 ++
 2 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f7c2..b2bbb0ef49 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
@@ -49,6 +50,7 @@
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/arm/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/arm/fdt.h"
@@ -59,6 +61,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/virtio/virtio-iommu.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1085,6 +1088,33 @@ static void create_smmu(const VirtMachineState *vms, qemu_irq *pic,
     g_free(node);
 }
 
+static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
+{
+    const char compat[] = "virtio,pci-iommu";
+    uint16_t bdf = vms->virtio_iommu_bdf;
+    char *node;
+
+    vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
+    node = g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, bdf);
+    qemu_fdt_add_subnode(vms->fdt, node);
+    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
+                                 1, bdf << 8 /* phys.hi */,
+                                 1, 0        /* phys.mid */,
+                                 1, 0        /* phys.lo  */,
+                                 1, 0        /* size.hi  */,
+                                 1, 0        /* size.low */);
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    g_free(node);
+
+    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, bdf,
+                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
+}
+
 static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1162,7 +1192,7 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
         }
     }
 
-    nodename = g_strdup_printf("/pcie@%" PRIx64, base);
+    nodename = vms->pciehb_nodename = g_strdup_printf("/pcie@%" PRIx64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
@@ -1205,13 +1235,17 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     if (vms->iommu) {
         vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
 
-        create_smmu(vms, pic, pci->bus);
+        switch (vms->iommu) {
+        case VIRT_IOMMU_SMMUV3:
+            create_smmu(vms, pic, pci->bus);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
-                               0x0, vms->iommu_phandle, 0x0, 0x10000);
     }
-
-    g_free(nodename);
 }
 
 static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
@@ -1736,12 +1770,21 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCIDevice *pdev = PCI_DEVICE(dev);
+
+        vms->iommu = VIRT_IOMMU_VIRTIO;
+        vms->virtio_iommu_bdf = pci_get_bdf(pdev);
+        object_property_set_bool(OBJECT(dev), false, "msi-bypass", errp);
+        create_virtio_iommu(vms, errp);
+    }
 }
 
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
                                                         DeviceState *dev)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 4cc57a7ef6..c330f6f4b7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -115,7 +115,9 @@ typedef struct {
     bool virt;
     int32_t gic_version;
     VirtIOMMUType iommu;
+    uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
+    char *pciehb_nodename;
     const MemMapEntry *memmap;
     const int *irqmap;
     int smp_cpus;
-- 
2.17.2

