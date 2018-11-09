Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp573309wrw;
        Fri, 9 Nov 2018 03:37:52 -0800 (PST)
X-Google-Smtp-Source: AJdET5epS7T09k9MQG7v3gdMUvSDojeGBBc0DPjfat2eK+WPBHJxNZvvxasHJyYNGGhzuHpPZjze
X-Received: by 2002:a37:2a48:: with SMTP id q69mr7658447qkh.287.1541763472281;
        Fri, 09 Nov 2018 03:37:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763472; cv=none;
        d=google.com; s=arc-20160816;
        b=jI9h2YnmyaTMLsxn9Pc38aNBS7BxZrLdHNR6RVc64sL65g9GOmym7q4x/dH7suQLqN
         +g21Qs/8Sceft75+4CVcmLIn0qpzE1cQ+KkD4ei8IBmviTygDW1LDZGwVmrJ4eCzHUyG
         jkJcVd+yedjC5iaRTAwqiFsAmzPIWPnoB7/DMYRFt9wAHN2w6+Xr/KlcqQqOc9q0pAGv
         LIWFlTX+AKTHkNVJu838lArfumKub8Ju793BooKYpq0chJWItjZnXuhL/OAYiqzLcEU3
         Sls+F+3g/gXLTAHEejBclEQE8se73jMPKEYTG9YupIJXAgrQb+SKyKbyxUUl0SZffqRp
         mGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Q+j5jRpRMGGlajhGCQB2YUNdtHenVwPIXfJ5cDJpEJE=;
        b=q/CNzOYrDL79wlpCy2PsitnoOSyivvZNPDIgZ30R5zIbAoOrX3Rv17lkTT8ESSVhQP
         bJuV6hjaJ5nUBZN1aIG70W6q6T5pWloOa/cTQS102hYfS94xg4ZR5tocc3VhHypPkQHn
         d6cDJK/o99YnrQOVkWLmqZd8+Ty0TI26tsb2T2xVWc8Renvvs5b5P2vv7lJ5Vp2ccWB4
         zz6CJQnfV5qmU54WGidLCWdawJ9PWLMuxUH1XQBehAgufEGechXhdqmTBRMUtEG949Ww
         ny1cEwZDrb1oiH13jxWVg2hjeWGNLpTGX2zJR41/EWdLH3i7bPRZ10XmdUiTXLxp6hrp
         4lBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184-v6si52948qkh.171.2018.11.09.03.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:37:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL56l-0004dM-L2
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:37:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50R-00073I-LP
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50Q-0002ks-Eb
	for qemu-devel@nongnu.org; Fri, 09 Nov 2018 06:31:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL50M-0002Su-Ll; Fri, 09 Nov 2018 06:31:15 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 918473098453;
	Fri,  9 Nov 2018 11:31:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4E2DE5C21F;
	Fri,  9 Nov 2018 11:31:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:54 +0100
Message-Id: <20181109112957.10067-16-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 09 Nov 2018 11:31:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v8 15/18] hw/arm/virt: Add virtio-iommu to the
 virt board
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E2gt+G4w93wX

Both the virtio-iommu device and its dedicated mmio
transport get instantiated when requested.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- align to the smmu instantiation code

v4 -> v5:
- VirtMachineClass no_iommu added in this patch
- Use object_resolve_path_type
---
 hw/arm/virt.c | 48 +++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a2b8d8f7c2..f2994c4359 100644
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
 
+static void create_virtio_iommu(VirtMachineState *vms,
+                                const char *pciehb_nodename, PCIBus *bus)
+{
+    const char compat[] = "virtio,pci-iommu";
+    uint16_t bdf = 0x8; /* 00:01.0 */
+    DeviceState *dev;
+    char *node;
+
+    dev = qdev_create(BUS(bus), TYPE_VIRTIO_IOMMU_PCI);
+    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
+
+    node = g_strdup_printf("%s/virtio_iommu@%d", pciehb_nodename, bdf);
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
+}
+
+
 static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1205,10 +1235,22 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     if (vms->iommu) {
         vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
 
-        create_smmu(vms, pic, pci->bus);
+        switch (vms->iommu) {
+        case VIRT_IOMMU_SMMUV3:
+            create_smmu(vms, pic, pci->bus);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
+            break;
+        case VIRT_IOMMU_VIRTIO:
+            create_virtio_iommu(vms, nodename, pci->bus);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
+                                   0x0, vms->iommu_phandle, 0x0, 0x8,
+                                   0x9, vms->iommu_phandle, 0x9, 0xfff7);
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
-        qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
-                               0x0, vms->iommu_phandle, 0x0, 0x10000);
     }
 
     g_free(nodename);
-- 
2.17.2

