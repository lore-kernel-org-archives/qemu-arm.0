Received: by 10.25.208.211 with SMTP id h202csp1150316lfg;
        Fri, 19 Feb 2016 05:17:43 -0800 (PST)
X-Received: by 10.28.34.139 with SMTP id i133mr9639731wmi.3.1455887855627;
        Fri, 19 Feb 2016 05:17:35 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com. [2a00:1450:400c:c09::236])
        by mx.google.com with ESMTPS id l11si12721881wmd.29.2016.02.19.05.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 05:17:35 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) client-ip=2a00:1450:400c:c09::236;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::236 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x236.google.com with SMTP id g62so75706073wme.1
        for <alex.bennee@linaro.org>; Fri, 19 Feb 2016 05:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1WzZdRdlW7VWySiVG1f1iY9cZOhhlu66d0IgIazJ8vM=;
        b=Ls1yZQDLMoEqAYd1+n4Xr+z3lI/K4Mqzxita5Jpf0TKEjauU7N0Rja8NLVO6f/2fih
         HNMwsnVIfb177Kaw6ctNLfx1DRJMaQRNflyCo4m65ws0colMB3qDwlFOp28Ckkef1Hi9
         DYUd4tW0ew2XARwAPchRLbQWshkl1Ii/s5J6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1WzZdRdlW7VWySiVG1f1iY9cZOhhlu66d0IgIazJ8vM=;
        b=RVStZX/6eYQLFk8pHSxePvzD0gi1aGPOHpCZrNxDWOTuSz3oBNy57GmNBNFWJ9025g
         CyAyBRuH5oMYp9/IyeThiW11kAdDe6QAOmcfzVrQQA5bpk640uHikcoS76nBRamqTc2L
         ru0zYBxS7GFw2v4HXUFq0iT+BCs781fCRwiR7B0LqXiYsqYdjXGlTWNkuZ9UR3n5j638
         QMV4gFkEdF8k6KuD/uHnfuHvibeu7c9MPvTZO8t21C1lkUsWpDhspdR580GXNFywHqd0
         5QwPH9BK1TWQekMJedj/ctsKqqSe5ba1F+O4wEukEGpsnGAp1/FWRmLThL/2XmEFiIMb
         69nA==
X-Gm-Message-State: AG10YOSl9elnLdL+B3hAI4GZQMLmuuDVEtZQlZwYEPbbLtui0WcnViDdW3wrV4DRe/xLnosIEsc=
X-Received: by 10.194.76.72 with SMTP id i8mr12919298wjw.117.1455887855358;
        Fri, 19 Feb 2016 05:17:35 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from midway01-04-00.lavalab ([81.128.185.50])
        by smtp.gmail.com with ESMTPSA id bg1sm11229846wjc.27.2016.02.19.05.17.33
        (version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 05:17:33 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.williamson@redhat.com,
	david@gibson.dropbear.id.au
Cc: christoffer.dall@linaro.org,
	suravee.suthikulpanit@amd.com,
	alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	thomas.lendacky@amd.com
Subject: [PATCH v8 7/8] hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
Date: Fri, 19 Feb 2016 13:17:12 +0000
Message-Id: <1455887833-7306-8-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
References: <1455887833-7306-1-git-send-email-eric.auger@linaro.org>
X-TUID: dvQTzeWgnIvG

This patch allows the instantiation of the vfio-amd-xgbe device
from the QEMU command line (-device vfio-amd-xgbe,host="<device>").

The guest is exposed with a device tree node that combines the description
of both XGBE and PHY (representation supported from 4.2 onwards kernel):
Documentation/devicetree/bindings/net/amd-xgbe.txt.

There are 5 register regions, 6 interrupts including 4 optional
edge-sensitive per-channel interrupts.

Some property values are inherited from host device tree. Host device tree
must feature a combined XGBE/PHY representation (>= 4.2 host kernel).

2 clock nodes (dma and ptp) also are created. It is checked those clocks
are fixed on host side.

AMD XGBE node creation function has a dependency on vfio Linux header and
more generally node creation function for VFIO platform devices only make
sense with CONFIG_LINUX so let's protect this code with #ifdef CONFIG_LINUX.

Signed-off-by: Eric Auger <eric.auger@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

---

v6 -> v7:
- add Peter's R-b

v5 -> v6:
- in sysfs_to_dt_name check substrings[0] before substrings[1]
- on qemu_fdt_node_path, check the returned value is not null
  (new dt parsing error case)

v4 -> v5:
- use new proto for qemu_fdt_node_path, check there is only 1 node
  matching the name/compat.
- renamed inherit_properties*

v3 -> v4:
- add_amd_xgbe_fdt_node explicitly returns 0. Reword comment to emphasize
  the fact the function asserts in case of error
v1 -> v2:
- add CONFIG_LINUX protection
- improves robustness in sysfs_to_dt_name
- output messages to end-user on misc failures and self-exits:
  error management becomes more violent than before assuming if
  the end-user wants passthrough we must exit if the device cannot
  be instantiated
- fix misc style issues
- remove qemu_fdt_setprop returned value check since it asserts

RFC -> v1:
- use qemu_fdt_getprop with Error **
- free substrings in sysfs_to_dt_name
- add some comments related to endianess in add_amd_xgbe_fdt_node
- reword commit message (dtc binary dependency has disappeared)
- check the host device has 5 regions meaning this is a combined
  XGBE/PHY device
---
 hw/arm/sysbus-fdt.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 188 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 8575cfe..9920388 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -23,6 +23,10 @@
 
 #include "qemu/osdep.h"
 #include <libfdt.h>
+#include "qemu-common.h"
+#ifdef CONFIG_LINUX
+#include <linux/vfio.h>
+#endif
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -30,6 +34,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
+#include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -65,6 +70,8 @@ typedef struct HostProperty {
     bool optional;
 } HostProperty;
 
+#ifdef CONFIG_LINUX
+
 /**
  * copy_properties_from_host
  *
@@ -127,12 +134,9 @@ static HostProperty clock_copied_properties[] = {
  * @host_phandle: phandle of the clock in host device tree
  * @guest_phandle: phandle to assign to the guest node
  */
-void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
-                         uint32_t host_phandle,
-                         uint32_t guest_phandle);
-void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
-                         uint32_t host_phandle,
-                         uint32_t guest_phandle)
+static void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
+                                uint32_t host_phandle,
+                                uint32_t guest_phandle)
 {
     char *node_path = NULL;
     char *nodename;
@@ -177,6 +181,28 @@ void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
     g_free(node_path);
 }
 
+/**
+ * sysfs_to_dt_name: convert the name found in sysfs into the node name
+ * for instance e0900000.xgmac is converted into xgmac@e0900000
+ * @sysfs_name: directory name in sysfs
+ *
+ * returns the device tree name upon success or NULL in case the sysfs name
+ * does not match the expected format
+ */
+static char *sysfs_to_dt_name(const char *sysfs_name)
+{
+    gchar **substrings =  g_strsplit(sysfs_name, ".", 2);
+    char *dt_name = NULL;
+
+    if (!substrings || !substrings[0] || !substrings[1]) {
+        goto out;
+    }
+    dt_name = g_strdup_printf("%s@%s", substrings[1], substrings[0]);
+out:
+    g_strfreev(substrings);
+    return dt_name;
+}
+
 /* Device Specific Code */
 
 /**
@@ -244,9 +270,165 @@ fail_reg:
     return ret;
 }
 
+/* AMD xgbe properties whose values are copied/pasted from host */
+static HostProperty amd_xgbe_copied_properties[] = {
+    {"compatible", false},
+    {"dma-coherent", true},
+    {"amd,per-channel-interrupt", true},
+    {"phy-mode", false},
+    {"mac-address", true},
+    {"amd,speed-set", false},
+    {"amd,serdes-blwc", true},
+    {"amd,serdes-cdr-rate", true},
+    {"amd,serdes-pq-skew", true},
+    {"amd,serdes-tx-amp", true},
+    {"amd,serdes-dfe-tap-config", true},
+    {"amd,serdes-dfe-tap-enable", true},
+    {"clock-names", false},
+};
+
+/**
+ * add_amd_xgbe_fdt_node
+ *
+ * Generates the combined xgbe/phy node following kernel >=4.2
+ * binding documentation:
+ * Documentation/devicetree/bindings/net/amd-xgbe.txt:
+ * Also 2 clock nodes are created (dma and ptp)
+ *
+ * Asserts in case of error
+ */
+static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    PlatformBusDevice *pbus = data->pbus;
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOINTp *intp;
+    const char *parent_node = data->pbus_node_name;
+    char **node_path, *nodename, *dt_name;
+    void *guest_fdt = data->fdt, *host_fdt;
+    const void *r;
+    int i, prop_len;
+    uint32_t *irq_attr, *reg_attr, *host_clock_phandles;
+    uint64_t mmio_base, irq_number;
+    uint32_t guest_clock_phandles[2];
+
+    host_fdt = load_device_tree_from_sysfs();
+
+    dt_name = sysfs_to_dt_name(vbasedev->name);
+    if (!dt_name) {
+        error_setg(&error_fatal, "%s incorrect sysfs device name %s",
+                    __func__, vbasedev->name);
+    }
+    node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
+                                   &error_fatal);
+    if (!node_path || !node_path[0]) {
+        error_setg(&error_fatal, "%s unable to retrieve node path for %s/%s",
+                   __func__, dt_name, vdev->compat);
+    }
+
+    if (node_path[1]) {
+        error_setg(&error_fatal, "%s more than one node matching %s/%s!",
+                   __func__, dt_name, vdev->compat);
+    }
+
+    g_free(dt_name);
+
+    if (vbasedev->num_regions != 5) {
+        error_setg(&error_fatal, "%s Does the host dt node combine XGBE/PHY?",
+                   __func__);
+    }
+
+    /* generate nodes for DMA_CLK and PTP_CLK */
+    r = qemu_fdt_getprop(host_fdt, node_path[0], "clocks",
+                         &prop_len, &error_fatal);
+    if (prop_len != 8) {
+        error_setg(&error_fatal, "%s clocks property should contain 2 handles",
+                   __func__);
+    }
+    host_clock_phandles = (uint32_t *)r;
+    guest_clock_phandles[0] = qemu_fdt_alloc_phandle(guest_fdt);
+    guest_clock_phandles[1] = qemu_fdt_alloc_phandle(guest_fdt);
+
+    /**
+     * clock handles fetched from host dt are in be32 layout whereas
+     * rest of the code uses cpu layout. Also guest clock handles are
+     * in cpu layout.
+     */
+    fdt_build_clock_node(host_fdt, guest_fdt,
+                         be32_to_cpu(host_clock_phandles[0]),
+                         guest_clock_phandles[0]);
+
+    fdt_build_clock_node(host_fdt, guest_fdt,
+                         be32_to_cpu(host_clock_phandles[1]),
+                         guest_clock_phandles[1]);
+
+    /* combined XGBE/PHY node */
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    qemu_fdt_add_subnode(guest_fdt, nodename);
+
+    copy_properties_from_host(amd_xgbe_copied_properties,
+                       ARRAY_SIZE(amd_xgbe_copied_properties),
+                       host_fdt, guest_fdt,
+                       node_path[0], nodename);
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
+    qemu_fdt_setprop(guest_fdt, nodename, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
+
+    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
+    for (i = 0; i < vbasedev->num_irqs; i++) {
+        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
+                         + data->irq_start;
+        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+        /*
+          * General device interrupt and PCS auto-negotiation interrupts are
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
+    qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
+                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+
+    g_free(host_fdt);
+    g_strfreev(node_path);
+    g_free(irq_attr);
+    g_free(reg_attr);
+    g_free(nodename);
+    return 0;
+}
+
+#endif /* CONFIG_LINUX */
+
 /* list of supported dynamic sysbus devices */
 static const NodeCreationPair add_fdt_node_functions[] = {
+#ifdef CONFIG_LINUX
     {TYPE_VFIO_CALXEDA_XGMAC, add_calxeda_midway_xgmac_fdt_node},
+    {TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node},
+#endif
     {"", NULL}, /* last element */
 };
 
-- 
1.8.3.2
