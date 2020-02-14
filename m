Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1917771lfp;
        Fri, 14 Feb 2020 05:35:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqzp/BnqFqY4r2oLu4MWV8gDy2od7jqTKhVy+mRjdTA9iPN6SpoScJ7XiI6Cg2eVdEzIVidX
X-Received: by 2002:a05:620a:1279:: with SMTP id b25mr2025818qkl.385.1581687317493;
        Fri, 14 Feb 2020 05:35:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581687317; cv=none;
        d=google.com; s=arc-20160816;
        b=Mp3wFtftqxIqMrsKp6YhAtKxRCFgUUujUhMN4GBFsmMGy8rETxnzFveCyJkR1Caw9d
         3vmXERFpE1St7qR0iBObNdXxoLi69s5y4l/edIKKOIMJ8qszRh+fKGC1Tzu8O+BRzTJi
         ZYqYQPT2OTQhMm9zwRGFwAqvr44FEh9EaHfql1wAAuGA8I1kCVzfrZuGdmavLW3w73Fg
         eqpijEKdUVQSrDiIpK7qBfZNOFIRm7ZhjPHI0RxUsXMnLVJhMBr654FJPFADpuNPaHTZ
         lfVSDACjnaEVzZ2IUOS/DfBuzYCePxhU1w6gOG118inkz7nIsSXkftfwmHkl77UVEPhd
         +0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UsqorQ5AgfbunbUBcdlUU/gqRKtwpqkatB0STexBchg=;
        b=ooI4GO7zvq0R0l9bHNhyhecRFA8QehyxRpDj2Y7IAqCr7I1B0ft0kv9gEu8SG07PF5
         wy2qqq2GRIScATQjA39wG5pIOBB+QXdHsx/d5EA1qnKP09bh7KcmrTdPKOCV08xIR9OI
         F8DrHH3HTpFZpk2+neVRilU2TRpOizxdFfI6LIKg0w+TLOElDbliRDT+3lCtZzvTgJNU
         yqYbFqCqoW1oWAD1qdJBHiaIv/d8VwK9jT5URNYqkzONGqwcYi6ZOCGrpW3oO9hdDqy2
         F04DUQjrOUsqxb1Mp0pjDoqO/FRNTH27dVHI/htljXu+ULqzcwfnMqvDZy/f5+i5BDie
         6q6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wgzgw3se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si2801754qtm.365.2020.02.14.05.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Wgzgw3se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b7k-0004UM-PT
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:35:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52438)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2M-0002rH-5M
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:29:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2K-0002c0-Lo
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:29:41 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54514
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b2K-0002am-F3
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 08:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsqorQ5AgfbunbUBcdlUU/gqRKtwpqkatB0STexBchg=;
 b=Wgzgw3seU2cSgZ4ntAS7o7zSLxz28q9l+YC2ekTDIcU5Zy2kBg6CsOYhfo13YZUHEc1xLv
 sY4W4jXHUlTmKoI6DP/SQ7sysxeb5945uxsPHIxvKXFNyF+espX34rs3VxjsiRzdCmL/+o
 GXyW8XOwdgFdG2QUdmGvxiprH4YQoLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-GIISC-KNOmSdItGpTPrz2w-1; Fri, 14 Feb 2020 08:29:38 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC522107B0E1;
 Fri, 14 Feb 2020 13:29:36 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AEA75DA7D;
 Fri, 14 Feb 2020 13:29:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 09/10] hw/arm/virt: Add the virtio-iommu device tree
 mappings
Date: Fri, 14 Feb 2020 14:27:44 +0100
Message-Id: <20200214132745.23392-10-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: GIISC-KNOmSdItGpTPrz2w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1TaXjZCSyPd

Adds the "virtio,pci-iommu" node in the host bridge node and
the RID mapping, excluding the IOMMU RID.

This is done in the virtio-iommu-pci hotplug handler which
gets called only if no firmware is loaded or if -no-acpi is
passed on the command line. As non DT integration is
not yet supported by the kernel we must make sure we
are in DT mode. This limitation will be removed as soon
as the topology description feature gets supported.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v15 -> v16:
- rename create_virtio_iommu into create_virtio_iommu_dt_bindings

v14 -> v15:
- only support the hotplug handler for virtio-iommu-pci if
  dt can be guaranteed

v11 -> v12:
- Added Jean's R-b

v10 -> v11:
- remove msi_bypass

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
index f788fe27d6..cfe317922f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -32,6 +32,7 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
+#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/boards.h"
@@ -54,6 +55,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/arm/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/qdev-properties.h"
@@ -71,6 +73,7 @@
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 #include "hw/acpi/generic_event_device.h"
+#include "hw/virtio/virtio-iommu.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1180,6 +1183,30 @@ static void create_smmu(const VirtMachineState *vms,
     g_free(node);
 }
=20
+static void create_virtio_iommu_dt_bindings(VirtMachineState *vms, Error *=
*errp)
+{
+    const char compat[] =3D "virtio,pci-iommu";
+    uint16_t bdf =3D vms->virtio_iommu_bdf;
+    char *node;
+
+    vms->iommu_phandle =3D qemu_fdt_alloc_phandle(vms->fdt);
+
+    node =3D g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename, b=
df);
+    qemu_fdt_add_subnode(vms->fdt, node);
+    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat))=
;
+    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
+                                 1, bdf << 8, 1, 0, 1, 0,
+                                 1, 0, 1, 0);
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle);
+    g_free(node);
+
+    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, bdf,
+                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - =
bdf);
+}
+
 static void create_pcie(VirtMachineState *vms)
 {
     hwaddr base_mmio =3D vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1258,7 +1285,7 @@ static void create_pcie(VirtMachineState *vms)
         }
     }
=20
-    nodename =3D g_strdup_printf("/pcie@%" PRIx64, base);
+    nodename =3D vms->pciehb_nodename =3D g_strdup_printf("/pcie@%" PRIx64=
, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
@@ -1301,13 +1328,16 @@ static void create_pcie(VirtMachineState *vms)
     if (vms->iommu) {
         vms->iommu_phandle =3D qemu_fdt_alloc_phandle(vms->fdt);
=20
-        create_smmu(vms, pci->bus);
-
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
-                               0x0, vms->iommu_phandle, 0x0, 0x10000);
+        switch (vms->iommu) {
+        case VIRT_IOMMU_SMMUV3:
+            create_smmu(vms, pci->bus);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
-
-    g_free(nodename);
 }
=20
 static void create_platform_bus(VirtMachineState *vms)
@@ -1976,6 +2006,13 @@ static void virt_machine_device_plug_cb(HotplugHandl=
er *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_plug(hotplug_dev, dev, errp);
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCIDevice *pdev =3D PCI_DEVICE(dev);
+
+        vms->iommu =3D VIRT_IOMMU_VIRTIO;
+        vms->virtio_iommu_bdf =3D pci_get_bdf(pdev);
+        create_virtio_iommu_dt_bindings(vms, errp);
+    }
 }
=20
 static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_=
dev,
@@ -1992,7 +2029,13 @@ static HotplugHandler *virt_machine_get_hotplug_hand=
ler(MachineState *machine,
        (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
         return HOTPLUG_HANDLER(machine);
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        VirtMachineState *vms =3D VIRT_MACHINE(machine);
=20
+        if (!vms->bootinfo.firmware_loaded || !acpi_enabled) {
+            return HOTPLUG_HANDLER(machine);
+        }
+    }
     return NULL;
 }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 71508bf40c..02f500cb8e 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -125,8 +125,10 @@ typedef struct {
     bool virt;
     int32_t gic_version;
     VirtIOMMUType iommu;
+    uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
     MemMapEntry *memmap;
+    char *pciehb_nodename;
     const int *irqmap;
     int smp_cpus;
     void *fdt;
--=20
2.20.1

