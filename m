Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2223099lff;
        Thu, 9 Jan 2020 06:49:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHdfOtny6SXD9LC2yhq1ud8r+/T9TAJdAKKkU1+igk+hRA4PIHmESVwIDxWBXX69C2hv8k
X-Received: by 2002:aed:25a4:: with SMTP id x33mr8449393qtc.165.1578581369881;
        Thu, 09 Jan 2020 06:49:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578581369; cv=none;
        d=google.com; s=arc-20160816;
        b=n5SY0TsRp2Gu2XCrpRl/nYUTtpAc+LADNQzP33r6obz7VsOThYbMuTPxwJg4deo9U6
         aJcTrXVCzlZk5WNJVsCtgZTIzdT4gDgaWcEiw6fHaYSw1eN9K65KDb24WruNXO+JtyBR
         G4pBdg2gaegh1yJBDhLmTx8DzIah1uNd44ogOOPDy5lVfZE2CPRXGVH+E6BcvATzgo+w
         ltscf7EjrMskb39/KMu4d5zxVTXq8orJ33Uqqw00JSZ78pztHVtCSrgFantoOt0orMt7
         K0+ArrdKPmkAtEYuvJuXF5dJLpMRrDzUp1BXcKrAy2E1nlP/K6Wm8PRhX7PPT1MXnwD4
         LcDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GBs3GEjCZe5spJhv/qOveCF81Xk48mqI/sz4P00Onok=;
        b=fVZHTEK9pVY7/k39ifRnW1aW5WBYnvlZFFGhtma3vtlFO46Bli8t/Qdsf4IgonURJI
         soLa5nJ0pXfjMfcI9U1LA+49tNCFJj6XX3LK+jzOQ7O97IZSZf10RCV09sJK08rtOxHn
         zpPh/73tyJYzbk34JmeuW6xuxaWhXAH+i8YBoicDyh+alrAnJFmLHHTp/w7tC7g1UglV
         J5455CkB2sb44uJXaO3r9ODwZCm0ng/gx6HDnvYlEYtNKhpCbRqSgqlvnvqBVKnldR+r
         KQPEu4c0GA7dJt7FKdP07V42a4CmjSCUMl3FHm6G5KuxiYfCx9Gdiqp7hMX3BmhMiuPZ
         O4sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CfvMjgBV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si3514670qko.68.2020.01.09.06.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 06:49:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=CfvMjgBV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipZ7o-0005Nx-Jy
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 09:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43377)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ3m-0000Ir-Lm
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:45:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipZ3j-0003sg-GN
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:45:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28417
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipZ3j-0003qT-90
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 09:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578581114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBs3GEjCZe5spJhv/qOveCF81Xk48mqI/sz4P00Onok=;
 b=CfvMjgBVR6Yk30m654PP5qljKBo9pnlPN9Gy03KNanwr2PI7mGuo6RGrKRnau1kY+vt5xt
 fXbr41TY5ZPXZWHRlHBhdUQUD20iITYEtYxMl/t3qBd8Fru8oT/K8Gwxv0FzaqfLQf6502
 MP0fwgMSFhI4BGQ9N/7SIWmy5JQtxe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-KT9C13FqPJKrLSIN4L7F_w-1; Thu, 09 Jan 2020 09:45:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2720BDB63;
 Thu,  9 Jan 2020 14:45:12 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFB2160C88;
 Thu,  9 Jan 2020 14:45:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v12 11/13] hw/arm/virt: Add the virtio-iommu device tree
 mappings
Date: Thu,  9 Jan 2020 15:43:17 +0100
Message-Id: <20200109144319.15912-12-eric.auger@redhat.com>
In-Reply-To: <20200109144319.15912-1-eric.auger@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: KT9C13FqPJKrLSIN4L7F_w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-TUID: QamKXR+ejce2

Adds the "virtio,pci-iommu" node in the host bridge node and
the RID mapping, excluding the IOMMU RID.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

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
 hw/arm/virt.c         | 54 ++++++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h |  2 ++
 2 files changed, 48 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f47e0..689e5a3bd5 100644
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
+static void create_virtio_iommu(VirtMachineState *vms, Error **errp)
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
@@ -1971,6 +2001,13 @@ static void virt_machine_device_plug_cb(HotplugHandl=
er *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
         virt_memory_plug(hotplug_dev, dev, errp);
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCIDevice *pdev =3D PCI_DEVICE(dev);
+
+        vms->iommu =3D VIRT_IOMMU_VIRTIO;
+        vms->virtio_iommu_bdf =3D pci_get_bdf(pdev);
+        create_virtio_iommu(vms, errp);
+    }
 }
=20
 static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_=
dev,
@@ -1984,7 +2021,8 @@ static HotplugHandler *virt_machine_get_hotplug_handl=
er(MachineState *machine,
                                                         DeviceState *dev)
 {
     if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
-       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM))) {
+       (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) ||
+       (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI))) {
         return HOTPLUG_HANDLER(machine);
     }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 38f0c33c77..165035fa8f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -124,8 +124,10 @@ typedef struct {
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

