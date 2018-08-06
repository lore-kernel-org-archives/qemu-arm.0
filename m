Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3450293wru;
        Mon, 6 Aug 2018 13:24:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpezrFK5ljbHsgNgs5LxSjz3oV15prnalMdMThcdQCMFp2xo0AUoX/WMCfa4aYnTeMbbbueh
X-Received: by 2002:ac8:709:: with SMTP id g9-v6mr15996773qth.110.1533587093767;
        Mon, 06 Aug 2018 13:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587093; cv=none;
        d=google.com; s=arc-20160816;
        b=j2HSAZYktjnSWVk8uBi90MDkQBT+sRnPtnH4J+d5niaG61PafoG0Zy5YhgWoDff4+6
         DUTk/gw0/+HYG6fkwO0BNOHD/8mogDZ8NhqsdmEwZYChzQ1KOrlMKaXi7VM7En9exz0X
         f73rG3DSZpr7gP+qKAJfi6+u161Lzak+DHexT951fALlshygPdwBnwGdAEFfpK5YTLEz
         VGW0rbLMkDCeMdXPtZuZhAECEx1AeHPtmgzeehYgxUCvwcMqPlfC27w7TKEmzG11KQ3y
         A5AZGtGlBMELV5BSkz22TnULxEaBCNNEYnw6oHL5KOsIl5YrWJ3ew+dtp9Q8OIvG1h3B
         qhhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=k4am5+U/XLvXaLQ6TpK9RrfI1kbyahTctjocCcCdJx8=;
        b=caOll2haymZ1iYgKuCy104OxXxSJj8m1Bs7XDtHCXLwthIYHXeQ68/zTrRgJ03PNNx
         xnqzp/at2JD0GYu46rmgGaiEqSseN6h/sXvBDdJF3q5p305QhaSfkeKCKo8agV/N1bDX
         7JdSCTzOuerOuqbnU+NQFH1jOZPdaxp6HMBt1qhwqNIZtnBIqL2rg5fZVicbQ817NSE1
         XSa4Fjw4q44Fdn8EGot2IOT/OuDBSsvMTBQ0W+zw0QfkI87FAHEElXc+Sp2/Rz0L5Zug
         DLe9ZWHIlr6yLZsOGqZlpjX/Owr/xNxO8CKimsKtEOZ/eOuxcqAxVuMxMN48ayhbkR2s
         SzCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u52-v6si3123521qtb.234.2018.08.06.13.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm3h-0005tK-5r
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:24:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluk-0006ch-Iq
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmluj-000743-EC
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:38 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40576 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmluj-00073n-8D; Mon, 06 Aug 2018 16:15:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6EB840214E2;
	Mon,  6 Aug 2018 20:15:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 584422156711;
	Mon,  6 Aug 2018 20:15:34 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:42 +0200
Message-Id: <1533586484-5737-15-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 06 Aug 2018 20:15:36 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 14/16] hw/arm/virt: Add virtio-iommu to the virt
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JAyUACZZhlSO

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
 hw/arm/virt.c         | 51 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/arm/virt.h |  1 +
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcd..dd3cc71 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -29,6 +29,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
@@ -59,6 +60,7 @@
 #include "qapi/visitor.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
+#include "hw/virtio/virtio-iommu.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -141,6 +143,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
+    [VIRT_VIRTIO_IOMMU] =       { 0x09070000, 0x00000200 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -165,6 +168,7 @@ static const int a15irqmap[] = {
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_SMMU] = 74,    /* ...to 74 + NUM_SMMU_IRQS - 1 */
+    [VIRT_VIRTIO_IOMMU] = 75,
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
@@ -1047,6 +1051,42 @@ static void create_smmu(const VirtMachineState *vms, qemu_irq *pic,
     g_free(node);
 }
 
+static void create_virtio_iommu(VirtMachineState *vms, qemu_irq *pic,
+                                PCIBus *bus)
+{
+    const char compat[] = "virtio,mmio";
+    int irq =  vms->irqmap[VIRT_VIRTIO_IOMMU];
+    hwaddr base = vms->memmap[VIRT_VIRTIO_IOMMU].base;
+    hwaddr size = vms->memmap[VIRT_VIRTIO_IOMMU].size;
+    DeviceState *dev;
+    BusState *virtio_bus;
+    char *node;
+
+    sysbus_create_simple("virtio-mmio", base, pic[irq]);
+
+    virtio_bus = qbus_find_recursive(sysbus_get_default(), NULL, "virtio-bus");
+    dev = DEVICE(object_new("virtio-iommu-device"));
+    qdev_set_parent_bus(dev, virtio_bus);
+    object_property_set_link(OBJECT(dev), OBJECT(bus), "primary-bus",
+                             &error_abort);
+    object_property_set_bool(OBJECT(dev), false, "msi_bypass", &error_fatal);
+    object_property_set_bool(OBJECT(dev), true, "realized", &error_abort);
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
+}
+
+
 static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
@@ -1167,7 +1207,16 @@ static void create_pcie(VirtMachineState *vms, qemu_irq *pic)
     if (vms->iommu) {
         vms->iommu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
 
-        create_smmu(vms, pic, pci->bus);
+        switch (vms->iommu) {
+        case VIRT_IOMMU_SMMUV3:
+            create_smmu(vms, pic, pci->bus);
+            break;
+        case VIRT_IOMMU_VIRTIO:
+            create_virtio_iommu(vms, pic, pci->bus);
+            break;
+        default:
+            g_assert_not_reached();
+        }
 
         qemu_fdt_setprop_cells(vms->fdt, nodename, "iommu-map",
                                0x0, vms->iommu_phandle, 0x0, 0x10000);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870cc..837c135 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -64,6 +64,7 @@ enum {
     VIRT_GIC_REDIST,
     VIRT_GIC_REDIST2,
     VIRT_SMMU,
+    VIRT_VIRTIO_IOMMU,
     VIRT_UART,
     VIRT_MMIO,
     VIRT_RTC,
-- 
2.5.5

