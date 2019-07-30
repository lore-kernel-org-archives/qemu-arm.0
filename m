Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4628939wrv;
        Tue, 30 Jul 2019 10:27:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzvlspEgttZ0Ew9lJxaWhyN2UbK3pNzdaVXJnPAaWc3LShLJK9Ph8nTsTAJf4boD7BEG79f
X-Received: by 2002:ab0:70b1:: with SMTP id q17mr7827664ual.100.1564507635140;
        Tue, 30 Jul 2019 10:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564507635; cv=none;
        d=google.com; s=arc-20160816;
        b=F4oqSg6uxG6Ia8KuW6TlOXwlrgMdbr8kZvJJ9gJ5zlICLhklPN0qGorholUhU/nz3u
         9zoj5cmB/Km4TW6lF1/X8GyMr0H29pZlqYgDSZ6xxsWmHEyoYF4vcx4U63eNTcPI9t4e
         PCUavjFnQPO15Uy16fmGePOTW5CcRxC0WE9UgfHy02OSfEEzjxs4HveyerhEM0l1RzfQ
         aDajC8VoBp3lqv1eVfesXNl24t8EwBZDNOE2s/6900Pvf/i9KSIEQOcZeBL9HmHUt7Wz
         CEq5pL6nJxo8LoXYiof3YR7tufiXJx00l9cW6+48N9JU/pXsWbDeKt2TXZqD3sPvQ5h9
         Pw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pig5FUK6/GuchRZBYdrGOzDFSTAzItYuWWYRvJDJTPQ=;
        b=U+n6+VTRIpiSBMpy4lZeMzlbEjJoYJKObrJVw0r/WrZGNb7sKLkpesNVHJrmupdm/c
         xnIOgfQ6IkVydpmzwOZKwoXHQokCrAsqESwd3tyaerHmZaDpknFlPA5yHpNgsMVN3q3v
         Akh0IwykuvvpDoF47vnOOoe+AqCk8+Vm1wna4pM3cqwg2k9VahaPE5EiQjlb3HlPQ+sv
         DkMCnOBAkHmtUW7v7dtMToDOS/OKPs8CtjIv2a8fEBqluJjcN2TiNPnz4Tq11FphS5v2
         zAAmVWFyqjcuLtRcVfZRrCB/6m439CbGgFk/zQVAnk7UBBRZqhPTp8isgzw3tJ/o3Gog
         qOGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67si12862476vkg.21.2019.07.30.10.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2019 10:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsVu6-0001Fe-M2
	for alex.bennee@linaro.org; Tue, 30 Jul 2019 13:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33007)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqr-0002vp-JG
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hsVqp-0001Wv-Kb
 for qemu-arm@nongnu.org; Tue, 30 Jul 2019 13:23:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hsVqn-0001VT-Ls; Tue, 30 Jul 2019 13:23:50 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3E154E924;
 Tue, 30 Jul 2019 17:23:48 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F288160BE5;
 Tue, 30 Jul 2019 17:23:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 alex.williamson@redhat.com, jean-philippe@linaro.org, kevin.tian@intel.com
Date: Tue, 30 Jul 2019 19:21:37 +0200
Message-Id: <20190730172137.23114-16-eric.auger@redhat.com>
In-Reply-To: <20190730172137.23114-1-eric.auger@redhat.com>
References: <20190730172137.23114-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 30 Jul 2019 17:23:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.2 v10 15/15] hw/arm/virt: Add the
 virtio-iommu device tree mappings
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
Cc: tn@semihalf.com, bharat.bhushan@nxp.com, peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9yMXwHCa9Gr6

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
 hw/arm/virt.c         | 54 +++++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h |  2 ++
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index d9496c9363..8f6bcba99e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -32,6 +32,7 @@
 #include "qemu-common.h"
 #include "qemu/units.h"
 #include "qemu/option.h"
+#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
@@ -52,6 +53,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "hw/pci-host/gpex.h"
+#include "hw/virtio/virtio-pci.h"
 #include "hw/arm/sysbus-fdt.h"
 #include "hw/platform-bus.h"
 #include "hw/arm/fdt.h"
@@ -64,6 +66,7 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
 #include "target/arm/internals.h"
+#include "hw/virtio/virtio-iommu.h"
=20
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1147,6 +1150,30 @@ static void create_smmu(const VirtMachineState *vm=
s, qemu_irq *pic,
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
+    node =3D g_strdup_printf("%s/virtio_iommu@%d", vms->pciehb_nodename,=
 bdf);
+    qemu_fdt_add_subnode(vms->fdt, node);
+    qemu_fdt_setprop(vms->fdt, node, "compatible", compat, sizeof(compat=
));
+    qemu_fdt_setprop_sized_cells(vms->fdt, node, "reg",
+                                 1, bdf << 8, 1, 0, 1, 0,
+                                 1, 0, 1, 0);
+
+    qemu_fdt_setprop_cell(vms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(vms->fdt, node, "phandle", vms->iommu_phandle)=
;
+    g_free(node);
+
+    qemu_fdt_setprop_cells(vms->fdt, vms->pciehb_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, bdf,
+                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff =
- bdf);
+}
+
 static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio =3D vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1224,7 +1251,7 @@ static void create_pcie(VirtMachineState *vms, qemu=
_irq *pic)
         }
     }
=20
-    nodename =3D g_strdup_printf("/pcie@%" PRIx64, base);
+    nodename =3D vms->pciehb_nodename =3D g_strdup_printf("/pcie@%" PRIx=
64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
     qemu_fdt_setprop_string(vms->fdt, nodename,
                             "compatible", "pci-host-ecam-generic");
@@ -1267,13 +1294,17 @@ static void create_pcie(VirtMachineState *vms, qe=
mu_irq *pic)
     if (vms->iommu) {
         vms->iommu_phandle =3D qemu_fdt_alloc_phandle(vms->fdt);
=20
-        create_smmu(vms, pic, pci->bus);
+        switch (vms->iommu) {
+        case VIRT_IOMMU_SMMUV3:
+            create_smmu(vms, pic, pci->bus);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                                   0x0, vms->iommu_phandle, 0x0, 0x10000=
);
+            break;
+        default:
+            g_assert_not_reached();
+        }
=20
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
-                               0x0, vms->iommu_phandle, 0x0, 0x10000);
     }
-
-    g_free(nodename);
 }
=20
 static void create_platform_bus(VirtMachineState *vms, qemu_irq *pic)
@@ -1882,12 +1913,21 @@ static void virt_machine_device_plug_cb(HotplugHa=
ndler *hotplug_dev,
                                      SYS_BUS_DEVICE(dev));
         }
     }
+    if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
+        PCIDevice *pdev =3D PCI_DEVICE(dev);
+
+        vms->iommu =3D VIRT_IOMMU_VIRTIO;
+        vms->virtio_iommu_bdf =3D pci_get_bdf(pdev);
+        object_property_set_bool(OBJECT(dev), false, "msi-bypass", errp)=
;
+        create_virtio_iommu(vms, errp);
+    }
 }
=20
 static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *ma=
chine,
                                                         DeviceState *dev=
)
 {
-    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE)) {
+    if (object_dynamic_cast(OBJECT(dev), TYPE_SYS_BUS_DEVICE) ||
+        object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         return HOTPLUG_HANDLER(machine);
     }
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a72094204e..abdee94f3a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -121,8 +121,10 @@ typedef struct {
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

