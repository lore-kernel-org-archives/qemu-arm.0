Received: by 10.182.158.201 with SMTP id ww9csp659484obb;
        Thu, 7 Jan 2016 07:50:47 -0800 (PST)
X-Received: by 10.28.60.68 with SMTP id j65mr17267616wma.33.1452181838588;
        Thu, 07 Jan 2016 07:50:38 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id b126si20547889wmh.108.2016.01.07.07.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2016 07:50:38 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=eric.auger@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-wm0-x235.google.com with SMTP id f206so130121534wmf.0
        for <alex.bennee@linaro.org>; Thu, 07 Jan 2016 07:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hgJXLRyY/LGI8Hjj0vXr3wjTdcZPIeZr1Y/DDEkCLuQ=;
        b=JuRIdp5CQbefrCjEzrmSmyDamMeIGXG3ooX52GuDOYJv9jIB3kSriy53l3z2i2ryCs
         cvR+WdBV+fZspDaLvmmLPo4myx495HLae+aTtFsBBwH/AgrnU3DVoRHd+CoH0dDI941V
         /BTux83ddBNVm0ABopXTRNiQ7zrQ2ddVjeN2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hgJXLRyY/LGI8Hjj0vXr3wjTdcZPIeZr1Y/DDEkCLuQ=;
        b=W3jHlAGDN4ze9zaidKaM2podL89vvAaEiucN/jgsv/wXhKS0zHe7X2EOW5myn71s2V
         4RDPigoQrBkReA2DSFNeJslWHaz0fqNoojEg0cTFN5JZ2Koba0sWcdvOaG/Gqo12Q4+e
         A6rKG0PRxdGMN7/XVkeKA2LRAGYGF38i5OcvATO6ZyAOOVNUEcDykRjwy/9jN6dPh8uu
         yaoxSbjbkLzTOJtHfBI9m2gimKsoAzQbXV8yzC3eqKL/tD9DZ3ny75f95QtsEDjU0ppj
         8fgj7rI+cZlYqKvvbMtsPZ0Qh7bZ0/8Eea92ZFHMAXH0MH7eRPwbXfkjS+WCVmperBMb
         DruQ==
X-Gm-Message-State: ALoCoQkykUltoXanVdIaYFR5Vgpg50D/MVIfONBKfZw4oXoWof4D0XGG5fr6dA/JKN3Q3xbCgOZJLQOdFp+mHBbriX4iM++bDw==
X-Received: by 10.28.172.193 with SMTP id v184mr9822354wme.94.1452181838206;
        Thu, 07 Jan 2016 07:50:38 -0800 (PST)
Return-Path: <eric.auger@linaro.org>
Received: from new-host-8.home (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
        by smtp.gmail.com with ESMTPSA id e198sm14267576wmd.0.2016.01.07.07.50.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 07:50:37 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com,
	eric.auger@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	david@gibson.dropbear.id.au,
	alex.williamson@redhat.com
Cc: alex.bennee@linaro.org,
	thuth@redhat.com,
	crosthwaitepeter@gmail.com,
	patches@linaro.org,
	christoffer.dall@linaro.org,
	pbonzini@redhat.com,
	b.reynal@virtualopensystems.com,
	suravee.suthikulpanit@amd.com,
	thomas.lendacky@amd.com
Subject: [PATCH v3 7/8] hw/arm/sysbus-fdt: enable amd-xgbe dynamic instantiation
Date: Thu,  7 Jan 2016 15:50:14 +0000
Message-Id: <1452181815-1948-8-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
References: <1452181815-1948-1-git-send-email-eric.auger@linaro.org>
X-TUID: h2RZN+/J8ZAn

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

---
v1 -> v2:
- add CONFIG_LINUX protection
- improves robustness in sysfs_to_dt_name
- output messages to end-user on misc failures and self-exits:
  error management becomes more violent than before assuming if
  the end-user wants passthrough we must exit if the device cannot
  be instantiated
- fix misc style issues
- remove qemu_fdt_setprop returned value check since it self-asserts

RFC -> v1:
- use qemu_fdt_getprop with Error **
- free substrings in sysfs_to_dt_name
- add some comments related to endianess in add_amd_xgbe_fdt_node
- reword commit message (dtc binary dependency has disappeared)
- check the host device has 5 regions meaning this is a combined
  XGBE/PHY device
---
 hw/arm/sysbus-fdt.c | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 181 insertions(+), 6 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index a1cf57b..66fa766 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -22,6 +22,10 @@
  */
 
 #include <libfdt.h>
+#include "qemu-common.h"
+#ifdef CONFIG_LINUX
+#include <linux/vfio.h>
+#endif
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -29,6 +33,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
+#include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/arm/fdt.h"
 
 /*
@@ -64,6 +69,8 @@ typedef struct HostProperty {
     bool optional;
 } HostProperty;
 
+#ifdef CONFIG_LINUX
+
 /**
  * inherit_properties
  *
@@ -126,12 +133,9 @@ static HostProperty clock_inherited_properties[] = {
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
@@ -176,6 +180,28 @@ void fdt_build_clock_node(void *host_fdt, void *guest_fdt,
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
+    if (!substrings || !substrings[1] || !substrings[0]) {
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
@@ -243,9 +269,158 @@ fail_reg:
     return ret;
 }
 
+
+/* AMD xgbe properties whose values are copied/pasted from host */
+static HostProperty amd_xgbe_inherited_properties[] = {
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
+
+    dt_name = sysfs_to_dt_name(vbasedev->name);
+    if (!dt_name) {
+        error_setg(&error_fatal, "%s incorrect sysfs device name %s",
+                    __func__, vbasedev->name);
+    }
+    ret = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat, &node_path);
+    g_free(dt_name);
+
+    if (ret) {
+        error_setg(&error_fatal, "%s unable to retrieve node path for %s",
+                   __func__, dt_name);
+    }
+
+    if (vbasedev->num_regions != 5) {
+        error_setg(&error_fatal, "%s Does the host dt node combine XGBE/PHY?",
+                   __func__);
+    }
+
+    /* generate nodes for DMA_CLK and PTP_CLK */
+    r = qemu_fdt_getprop(host_fdt, node_path, "clocks",
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
+    qemu_fdt_setprop(guest_fdt, nodename, "interrupts",
+                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+
+    g_free(host_fdt);
+    g_free(node_path);
+    g_free(irq_attr);
+    g_free(reg_attr);
+    g_free(nodename);
+    return ret;
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
1.9.1
