Received: by 10.223.188.70 with SMTP id a6csp1295834wrh;
        Fri, 1 Sep 2017 10:31:56 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb46qoIdye6iV3+UM2/wzRtKbUnI+uRsxXMxLWxfHDwaOxDpTTNYZqU2H4z3l7arEMTg1P96
X-Received: by 10.55.168.88 with SMTP id r85mr3618588qke.289.1504287116426;
        Fri, 01 Sep 2017 10:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287116; cv=none;
        d=google.com; s=arc-20160816;
        b=LH0446C1Hs+narLUxSC4iw9KzD3uvJ8bDvudjLeMGbkXkRaOHpGAtmCdHc2DsJoYbO
         m+FZYjJ8VdlPVMK7hXTSBq/maDm5UBTZrLHwxU5mf1SAdaB86H3X3OqZH51sm3idZXtm
         Q24mvLvGMSW/4SjS1pDLNyVmaTScPttXmQMZfn6OR8S3L7oJI7967/3mtuTk8766neqY
         qbnkyyhF9wdD7ipuDSa4W/BHWf2Mm7yhpdwWiDfH1m14Fiega/b6BhyN+eBX6xWJRZsw
         8eKoNYUAl9VNrVenJ1SM01LozybfumFNmvRM9QIjXLs7WmxuY+QFGLfvcKdEkK3Iwvzc
         cP7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=Uv83hKoIO1Gh/LezV/Jt+cnZzvRV+4UoWyeqIdqBxFs=;
        b=wwvrYRGtvrW+VH3RckFS/Nk8yRUwJpeL0Zvn6kk/x7TbUfdcPWovTPA65QC1rCNxie
         1EjyzQqP8jFxDy63ZhrvkHHReNVlc2Z9ndmua0z7A1gEkRKQI+2waoUMGZlCjUCBJf6e
         6G+A6MugZRZURp1j7rjsx6pkDj7cyjtd578UWPXJP1EPP0ncW0qUY32jSokFKjjmLFOf
         CJel97HQUmE+z9hLml0wR2OcfLUcalr+DGtwp+NyFqTIPFsyHOvH2Y5XZMkCLvrwM597
         XyR8+H3paZ9ENcHnlVJxL5ph9pZKihSmhHk26ppafT7vr2fIX9wU4yGH65rHIqwMEM4E
         mNnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si10993414qky.270.2017.09.01.10.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpnO-0006My-2H
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:31:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37848)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgB-0006r3-2L
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpg8-0004DZ-Fe
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46096)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpg8-0004DB-7V; Fri, 01 Sep 2017 13:24:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2990D91FD5;
	Fri,  1 Sep 2017 17:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2990D91FD5
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC27217100;
	Fri,  1 Sep 2017 17:24:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:20 +0200
Message-Id: <1504286483-23327-18-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Sep 2017 17:24:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 17/20] hw/arm/sysbus-fdt: Allow smmuv3 dynamic
 instantiation
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xeVyFkgfkXin

This patch adds a node creation function for the smmuv3. Using
"-device smmuv3" it is now possible to get the iommu instantiated
on ARM VIRT machine. The node creation function handles the creation
of the smmuv3 node and also add the iommu-map property on the generic
PCI host controller node.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c     |   2 +
 hw/arm/sysbus-fdt.c | 110 ++++++++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 96 insertions(+), 16 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index c43bd93..9c8640f 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1121,6 +1121,8 @@ static void smmuv3_class_init(ObjectClass *klass, void *data)
     dc->reset   = smmu_reset;
     dc->vmsd    = &vmstate_smmuv3;
     dc->realize = smmu_realize;
+    /* Supported by TYPE_VIRT_MACHINE */
+    dc->user_creatable = true;
 }
 
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index f8c4909..9bbfbde 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -36,6 +36,7 @@
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/arm/virt.h"
 #include "hw/arm/fdt.h"
 
@@ -126,6 +127,31 @@ static HostProperty clock_copied_properties[] = {
     {"clock-output-names", true},
 };
 
+static char *fdt_get_node_path(void *fdt, int phandle)
+{
+    char *node_path = NULL;
+    int ret, node_offset, path_len = 16;;
+
+    node_offset = fdt_node_offset_by_phandle(fdt, phandle);
+    if (node_offset <= 0) {
+        error_setg(&error_fatal,
+                   "not able to locate clock handle %d in device tree",
+                   phandle);
+    }
+
+    node_path = g_malloc(path_len);
+    while ((ret = fdt_get_path(fdt, node_offset, node_path, path_len))
+            == -FDT_ERR_NOSPACE) {
+        path_len += 16;
+        node_path = g_realloc(node_path, path_len);
+    }
+    if (ret < 0) {
+        g_free(node_path);
+        node_path = NULL;
+    }
+    return node_path;
+}
+
 /**
  * fdt_build_clock_node
  *
@@ -142,24 +168,12 @@ static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
                                 uint32_t host_phandle,
                                 uint32_t guest_phandle)
 {
-    char *node_path = NULL;
-    char *nodename;
+    char *node_path, *nodename;
     const void *r;
-    int ret, node_offset, prop_len, path_len = 16;
+    int prop_len;
 
-    node_offset = fdt_node_offset_by_phandle(host_fdt, host_phandle);
-    if (node_offset <= 0) {
-        error_setg(&error_fatal,
-                   "not able to locate clock handle %d in host device tree",
-                   host_phandle);
-    }
-    node_path = g_malloc(path_len);
-    while ((ret = fdt_get_path(host_fdt, node_offset, node_path, path_len))
-            == -FDT_ERR_NOSPACE) {
-        path_len += 16;
-        node_path = g_realloc(node_path, path_len);
-    }
-    if (ret < 0) {
+    node_path = fdt_get_node_path(host_fdt, host_phandle);
+    if (!node_path) {
         error_setg(&error_fatal,
                    "not able to retrieve node path for clock handle %d",
                    host_phandle);
@@ -416,6 +430,69 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+static int add_smmuv3_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+    const char compat[] = "arm,smmu-v3";
+    uint32_t reg_attr[2], irq_attr[12], smmu_phandle;
+    uint64_t mmio_base, irq_number;
+    PlatformBusFDTData *data = opaque;
+    const char *parent_node = data->pbus_node_name;
+    PlatformBusDevice *pbus = data->pbus;
+    VirtMachineState *vms = data->vms;
+    void *guest_fdt = data->fdt;
+    char *nodename, *node_path;
+    int i;
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               "smmuv3", mmio_base);
+    qemu_fdt_add_subnode(guest_fdt, nodename);
+
+    qemu_fdt_setprop(guest_fdt, nodename, "compatible", compat, sizeof(compat));
+
+    reg_attr[0] = cpu_to_be32(mmio_base);
+    reg_attr[1] = cpu_to_be32(0x20000);
+    qemu_fdt_setprop(guest_fdt, nodename, "reg",
+                     reg_attr, 2 * sizeof(uint32_t));
+
+    for (i = 0; i < 4; i++) {
+        irq_number = platform_bus_get_irqn(pbus, sbdev , i) + data->irq_start;
+        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+        irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+    }
+    qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
+                     irq_attr, 4 * 3 * sizeof(uint32_t));
+    qemu_fdt_setprop(guest_fdt, nodename, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop_cell(guest_fdt, nodename, "clocks", vms->clock_phandle);
+    qemu_fdt_setprop_string(guest_fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop(guest_fdt, nodename, "dma-coherent", NULL, 0);
+
+    qemu_fdt_setprop_cell(guest_fdt, nodename, "#iommu-cells", 1);
+
+    smmu_phandle = qemu_fdt_alloc_phandle(vms->fdt);
+
+    qemu_fdt_setprop_cell(guest_fdt, nodename, "phandle", smmu_phandle);
+
+    node_path = fdt_get_node_path(guest_fdt, vms->pcihost_phandle);
+    if (!node_path) {
+        error_setg(&error_fatal,
+                   "not able to retrieve node path for pci ctlr phandle %d",
+                   vms->pcihost_phandle);
+    }
+
+    qemu_fdt_setprop_cells(guest_fdt, node_path, "iommu-map",
+                     0x0, smmu_phandle, 0x0, 0x10000);
+
+    g_free(nodename);
+    g_free(node_path);
+
+    return 0;
+}
+
 #endif /* CONFIG_LINUX */
 
 /* list of supported dynamic sysbus devices */
@@ -423,6 +500,7 @@ static const NodeCreationPair add_fdt_node_functions[] = {
 #ifdef CONFIG_LINUX
     {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
     {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
+    {TYPE_SMMU_V3_DEV, add_smmuv3_fdt_node},
 #endif
     {"", NULL}, /* last element */
 };
-- 
2.5.5

