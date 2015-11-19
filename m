Received: by 10.182.158.201 with SMTP id ww9csp2021002obb;
        Thu, 19 Nov 2015 07:23:23 -0800 (PST)
X-Received: by 10.31.52.68 with SMTP id b65mr5167992vka.112.1447946602452;
        Thu, 19 Nov 2015 07:23:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w184si4463909vkw.4.2015.11.19.07.23.22
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 19 Nov 2015 07:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:42403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZzR3R-0004nt-OF
	for alex.bennee@linaro.org; Thu, 19 Nov 2015 10:23:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2W-0003Qc-H7
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2V-0000kX-2E
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:24 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:35121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1ZzR2U-0000kF-PP
	for qemu-devel@nongnu.org; Thu, 19 Nov 2015 10:22:23 -0500
Received: by wmdw130 with SMTP id w130so244791182wmd.0
	for <qemu-devel@nongnu.org>; Thu, 19 Nov 2015 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tIFxbVuqPKc9oHqtCaN+21+zTAQmnwY9MCIvw9CB7wM=;
	b=EP01Y42nZ+qclYD1vPBuzwWAFfYXylq1+RA4uB6vEceVAoWp8lnfEf+WyvbeiAe8NB
	zPYapRmsLcwzouQyeOqRY9902nHccQXVXfEOQpit575qWc5GJWuVN61S/Q/QIlJRjpBi
	xGJ79DF8n41qZNCRXrFT1y+9TXNJhf0Lq+qlBK5siNz64osSMN1ZXmX3dGDekRKqcL2g
	DyqktQmp79g2MfTWHycE3wF4p953Yw6D2Ce2j3elnjWKqZMh2eZFpp4dNPk5ZpCgAloy
	c0inRXKODqRAMPZe5rKZQhILjXf9q3TxoaSeicScA2P7AQx7A8SBTYx40URTN/rvCraX
	VRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tIFxbVuqPKc9oHqtCaN+21+zTAQmnwY9MCIvw9CB7wM=;
	b=g7pYj3JMPhLJjr8Qo2Pw8BX14VnVNxQXoZPAtPkp00IwxshDWcjWi1SFwMNbpshNeF
	hJ9c/zD7zvlOSHGbrGLu5Olb6a51JgC3+uuzUF4h2q/dnNntKoy7e6ouyc4DAtGt+hQ1
	z+wamvogxpg7w2HIwNfo7wk349dnzL0QjeARGo+XjBZg8t2Iue9/L25H6Fo/KIRv1pp4
	exVN6d39zhjb0KNeP3CJLy2Da2AOCTLZSCKMtegh2x4FSEg9E330gthwg0FWczpxMvaX
	Iv0WmDFQ7baVpuAI5nkUCZzq+jP6ubCgcOBUtqwHwSiSfFyd44kbZdVPaquVcDIGudOi
	odng==
X-Gm-Message-State: ALoCoQkZTey6NiiSrfPkl1r4d+8ZAaoDubL0kAXLYrsDag8Eq2wCzAYnScQPos1q1Ok8nADf1acW
X-Received: by 10.28.137.194 with SMTP id l185mr10857935wmd.21.1447946542067; 
	Thu, 19 Nov 2015 07:22:22 -0800 (PST)
Received: from midway01-04-00.lavalab ([81.128.185.50])
	by smtp.gmail.com with ESMTPSA id
	vr10sm8367221wjc.38.2015.11.19.07.22.20
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 07:22:21 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, alex.williamson@redhat.com, peter.maydell@linaro.org
Date: Thu, 19 Nov 2015 15:22:08 +0000
Message-Id: <1447946528-1533-7-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
References: <1447946528-1533-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::236
Cc: thomas.lendacky@amd.com, b.reynal@virtualopensystems.com,
	patches@linaro.org, suravee.suthikulpanit@amd.com,
	pbonzini@redhat.com, christoffer.dall@linaro.org
Subject: [Qemu-devel] [RESEND RFC 6/6] hw/arm/sysbus-fdt: enable amd-xgbe
	dynamic instantiation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SNJ6mggypqT8

This patch allows the instantiation of the vfio-amd-xgbe device
from the QEMU command line (-device vfio-amd-xgbe,host="<device>").

The guest is exposed with a device tree node that combines the description
of both XGBE and PHY (representation supported from 4.2 onwards kernel):
Documentation/devicetree/bindings/net/amd-xgbe.txt.

There are 5 register regions, 6 interrupts including 4 optional
edge-sensitive per-channel interrupts.

Property values are inherited from host device tree. It is mandated
host uses device tree, dtc binary is installed, and the host also uses a
combined XGBE/PHY representation (>= 4.2 host kernel).

2 clock nodes (dma and ptp) also are created. It is mandated those clocks
are fixed on host side.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
---
 hw/arm/sysbus-fdt.c | 171 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 167 insertions(+), 4 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 22e5801..b13d380 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -22,6 +22,7 @@
  */
 
 #include <libfdt.h>
+#include <linux/vfio.h>
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -29,8 +30,10 @@
 #include "sysemu/sysemu.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
+#include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/arm/fdt.h"
 
+
 /*
  * internal struct that contains the information to create dynamic
  * sysbus device node
@@ -120,10 +123,7 @@ static HostProperty clock_inherited_properties[] = {
  * host_phandle: phandle of the clock in host device tree
  * guest_phandle: phandle to assign to the guest node
  */
-int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
-                                uint32_t host_phandle,
-                                uint32_t guest_phandle);
-int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+static int fdt_build_clock_node(void *host_fdt, void *guest_fdt,
                                 uint32_t host_phandle,
                                 uint32_t guest_phandle)
 {
@@ -166,6 +166,21 @@ out:
     return ret;
 }
 
+/**
+ * sysfs_to_dt_name
+ *
+ * convert the name found in sysfs into the node name
+ * for instance e0900000.xgmac is converted into xgmac@e0900000
+ */
+static char *sysfs_to_dt_name(const char *sysfs_name)
+{
+    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
+    char *dt_name;
+
+    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);
+    return dt_name;
+}
+
 /* Device Specific Code */
 
 /**
@@ -233,9 +248,157 @@ fail_reg:
     return ret;
 }
 
+
+/* AMD xgbe properties whose values are copied/pasted from host */
+static HostProperty amd_xgbe_inherited_properties[] = {
+    {"compatible", 0},
+    {"dma-coherent", 1},
+    {"amd,per-channel-interrupt", 1},
+    {"phy-mode", 0},
+    {"mac-address", 1},
+    {"amd,speed-set", 0},
+    {"amd,serdes-blwc", 1},
+    {"amd,serdes-cdr-rate", 1},
+    {"amd,serdes-pq-skew", 1},
+    {"amd,serdes-tx-amp", 1},
+    {"amd,serdes-dfe-tap-config", 1},
+    {"amd,serdes-dfe-tap-enable", 1},
+    {"clock-names", 0},
+};
+
+/**
+ * add_amd_xgbe_fdt_node
+ *
+ * Generates the combined xgbe/phy node following kernel >=4.2
+ * binding documentation:
+ * Documentation/devicetree/bindings/net/amd-xgbe.txt:
+ * Also 2 clock nodes are created (dma and ptp)
+ */
+static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    PlatformBusDevice *pbus = data->pbus;
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOINTp *intp;
+    const char *parent_node = data->pbus_node_name;
+    char *node_path, *nodename, *dt_name;
+    void *guest_fdt = data->fdt, *host_fdt;
+    const void *r;
+    int i, ret = -1, prop_len;
+    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
+    uint64_t mmio_base, irq_number;
+    uint32_t guest_clock_phandles[2];
+
+    host_fdt = load_device_tree_from_sysfs();
+    if (!host_fdt) {
+        goto stop;
+    }
+    dt_name = sysfs_to_dt_name(vbasedev->name);
+    ret = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat, &node_path);
+    g_free(dt_name);
+
+    if (ret) {
+        goto stop;
+    }
+
+    /* generate nodes for DMA_CLK and PTP_CLK */
+    r = qemu_fdt_getprop(host_fdt, node_path, "clocks", &prop_len);
+    if (prop_len != 8) {
+        goto stop;
+    }
+    host_clock_phandles = (uint32_t *)r;
+    host_clock_phandles[0] = be32_to_cpu(host_clock_phandles[0]);
+    host_clock_phandles[1] = be32_to_cpu(host_clock_phandles[1]);
+    guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
+    guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
+
+    ret = fdt_build_clock_node(host_fdt, guest_fdt,
+                               host_clock_phandles[0],
+                               guest_clock_phandles[0]);
+    if (ret) {
+        goto stop;
+    }
+
+    ret = fdt_build_clock_node(host_fdt, guest_fdt,
+                               host_clock_phandles[1],
+                               guest_clock_phandles[1]);
+    if (ret) {
+        goto stop;
+    }
+
+    /* combined XGBE/PHY node */
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    qemu_fdt_add_subnode(guest_fdt, nodename);
+
+    inherit_properties(amd_xgbe_inherited_properties,
+                       ARRAY_SIZE(amd_xgbe_inherited_properties),
+                       host_fdt, guest_fdt,
+                       node_path, nodename);
+
+    qemu_fdt_setprop_cells(guest_fdt, nodename, "clocks",
+                           guest_clock_phandles[0],
+                           guest_clock_phandles[1]);
+
+    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
+        reg_attr[2 * i] = cpu_to_be32(mmio_base);
+        reg_attr[2 * i + 1] = cpu_to_be32(
+                                memory_region_size(&vdev->regions[i]->mem));
+    }
+    ret = qemu_fdt_setprop(guest_fdt, nodename, "reg", reg_attr,
+                           vbasedev->num_regions * 2 * sizeof(uint32_t));
+    if (ret) {
+        error_report("could not set reg property of node %s", nodename);
+        goto fail_reg;
+    }
+
+    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
+    for (i = 0; i < vbasedev->num_irqs; i++) {
+        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
+                         + data->irq_start;
+        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+        /*
+          * General device interrupt and PCS auto-negociation interrupts are
+          * level-sensitive while the 4 per-channel interrupts are edge
+          * sensitive
+          */
+        QLIST_FOREACH(intp, &vdev->intp_list, next) {
+            if (intp->pin == i) {
+                break;
+            }
+        }
+        if (intp->flags & VFIO_IRQ_INFO_AUTOMASKED) {
+            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        } else {
+            irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+        }
+    }
+    ret = qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
+                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+    if (ret) {
+        error_report("could not set interrupts property of node %s",
+                     nodename);
+    }
+    g_free(host_fdt);
+    g_free(node_path);
+    g_free(irq_attr);
+fail_reg:
+    g_free(reg_attr);
+    g_free(nodename);
+    return ret;
+stop:
+    exit(1);
+}
+
 /* list of supported dynamic sysbus devices */
 static const NodeCreationPair add_fdt_node_functions[] = {
     {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
+    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
     {"", NULL}, /* last element */
 };
 
-- 
1.8.3.2

