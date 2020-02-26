Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2798281lfg;
        Wed, 26 Feb 2020 01:07:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqx8qsg1hfe0W4HyPS2XAUY1gmoU5UcZFjv8KTPe/LZ8Bvj3tt8wvJLh6jaUyFSAmgW7vrLg
X-Received: by 2002:ac8:430c:: with SMTP id z12mr4103028qtm.299.1582708050941;
        Wed, 26 Feb 2020 01:07:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582708050; cv=none;
        d=google.com; s=arc-20160816;
        b=IZRnosXT7zlFeaKNh0UiQ5dWHhfLvfWErC+WqVCWwmmG20AiLX/tYs31joIIUjWQqz
         n7ZT1W9D59fgKXrMcDs1+I8Ywd8z9b11mtjiLwObWWBl1j1nlqo6mTbZ4VXAgL9dfb9N
         rhS7A0LGvnHlf8TDtBekQAlXNSzdZphKMtbmBNEjHSn8CGyc7QCbXv6EkuVrBWVJSPUm
         UY/66faOr1UBFCeQRwtq1MTLVaZlUDThBotTR9g9t0THz+e2wrZ7QKUvd6aF5f60jph/
         3JM/63gaq4PD2U5wDxrokFKYbn0k1Bfrc4W1RBpb1mSLzyGFvSY7a1zLux6B41cWKUsL
         4MRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=mH6Uh7KB+qDOlqySuiYCwzhwjo90oVgrXa4q2w401+k=;
        b=B+8RFxO8HilgnUnSGhlUBSTd+9ncac3V+71uyQJC4b3/A8MGkUbAU6ezajuuuqz+cW
         qDB2v1/DLsJJwnQCGHemcQg8jPbMIyOEHpZcROCD8zpNemxc+GLAPEG6qS7S39EnnVTZ
         8+i6M5Pjt7hPjgscOo4GjHrY410EZpZdYHUgsdl5yI63MRI1W6doLhRGdKpTL5C4npEz
         2nGWnoc3jGBLvchNtwSu4/jZjZktLcBmw7bkyfg7g69SPgm2AU2ixuwG6Wmh9BqKnatt
         zdguoHcKM4nBTjJhJxDPRwQ5w4kv0Ig4ThvioDlPruZSIg6BjedM9p3XwjyCUG4OVbmf
         yIXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z6uL71fM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si812442qtf.271.2020.02.26.01.07.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 01:07:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z6uL71fM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6sfC-0005WV-Am
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 04:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j6sf3-0005RB-Dp
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 04:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j6sf1-0000J2-UU
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 04:07:21 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42378
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j6sf1-0000IO-OV
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 04:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582708039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mH6Uh7KB+qDOlqySuiYCwzhwjo90oVgrXa4q2w401+k=;
 b=Z6uL71fMvs5cLOiq0lQVKPUe1u9IBzig5UrqRzKAF7fGgX90x/bh2CN8/ufz4cK3+QBH4H
 dbyb3Z6+0dFRBPWMRTFMXC1gI1eqLi3FmhFUf0VQRP9wYkd+5peuTsiRvAZ/PECDK4KpOU
 YG3kXejhjQ27SOFWoeH5nK6msFuL7Lw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-gDC5xE5HNLuBTDaPHgVk_g-1; Wed, 26 Feb 2020 04:07:17 -0500
X-MC-Unique: gDC5xE5HNLuBTDaPHgVk_g-1
Received: by mail-wm1-f72.google.com with SMTP id n17so470331wmk.1
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2020 01:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L8WBI983W+7RiE8lzDwmxcDHbYbc+B58tFNCqwSyA9I=;
 b=bxZtnfKvz4rY1LPb6v+TSzu49qW/qmleLgHBrrvxtS3+fPCBWM7zcxfFtgLqLn958Q
 cEh49bvTBYKLuM2FjoN2Ub8ssO8wJ5CObqnPJCQrW+jF68FmzLHbYKTLyu7bAoIp3VJa
 QH7FgaCRzI5vD8W27RsP5lmT//XkDvE7mM5ULYGkpy4khWv2AQei5175SEg0X1407OBf
 kQGkhOSaF2ghUW4pCx/NnXBEImj+bp2PHiPCYO9eXmt6+//zORhAbsVMc/61w8NwXCMc
 edaqQHwINd2PnJG32l87KDTUlTFNxIxfb47TK37IhijgIstaM9AoDLiuHTjZ5B71Ga7+
 sJrQ==
X-Gm-Message-State: APjAAAVvOr66tsQQ1+f8vFCIgxgL+UORMzIkIQ3gdtS399W9N06vp2qf
 phEEaBoII1LK1bXGz9APWnveenIuwdGHEBRSL+MTU8yb/eLPDLHULSy9Rm3kX9EVXjiK+AQ6KTj
 qkRjlo9topbW0
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr4344439wrs.386.1582708036183; 
 Wed, 26 Feb 2020 01:07:16 -0800 (PST)
X-Received: by 2002:adf:fe4c:: with SMTP id m12mr4344413wrs.386.1582708035947; 
 Wed, 26 Feb 2020 01:07:15 -0800 (PST)
Received: from redhat.com (bzq-79-178-2-214.red.bezeqint.net. [79.178.2.214])
 by smtp.gmail.com with ESMTPSA id
 y7sm7010112wmd.1.2020.02.26.01.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 01:07:15 -0800 (PST)
Date: Wed, 26 Feb 2020 04:07:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 20/30] hw/arm/virt: Add the virtio-iommu device tree mappings
Message-ID: <20200226090010.708934-21-mst@redhat.com>
References: <20200226090010.708934-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200226090010.708934-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: naHRZGPsB71m

From: Eric Auger <eric.auger@redhat.com>

Adds the "virtio,pci-iommu" node in the host bridge node and
the RID mapping, excluding the IOMMU RID.

This is done in the virtio-iommu-pci hotplug handler which
gets called only if no firmware is loaded or if -no-acpi is
passed on the command line. As non DT integration is
not yet supported by the kernel we must make sure we
are in DT mode. This limitation will be removed as soon
as the topology description feature gets supported.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

Message-Id: <20200214132745.23392-10-eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 57 +++++++++++++++++++++++++++++++++++++------
 2 files changed, 52 insertions(+), 7 deletions(-)

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
--=20
MST

