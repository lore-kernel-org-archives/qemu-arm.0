Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp443541wrt;
        Thu, 3 Jan 2019 01:42:45 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XPajdWPHrf9MQ/6y0QfqGk2mHFIFTTw47G9TqbGicyrGaUpXQlf9e7jghfHb/knrhDr4Mr
X-Received: by 2002:ac8:3ae5:: with SMTP id x92mr46974720qte.370.1546508565137;
        Thu, 03 Jan 2019 01:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546508565; cv=none;
        d=google.com; s=arc-20160816;
        b=u+y6+pRTEY3dQGRxPZxPs4KCrfEllpv4eJQXi5z3NRCeU1xT4Hk/CtOyPOQEXgQc+F
         abVEI2l6bZ/rIhwV6QuF0uob2GwJOBWM0pA2BIgsR33fmk6oK1z5tRrvv/3gTHDPjF8u
         9kz41pXX3hNdbPbkmTnZBZ75g+lOmF/PQSrwte3/4FDa0N2HwFN+9SImQl1wMjW38PQB
         t1rp3lmS8/IBGRFvvqytYGenxt4JQHsktVQG/YWe6K6p1WFM536oz26nKXGJ9CfZmNXs
         1omo02oWhw4ChBp9pdise0jd6s55KD6m/1QTHz95wL13yE6nEbB7TzDTRhSylSwqeAnh
         95fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=Jfjr2MKf0bAh+UaNA6TxCaR34fhJLXIWMjtP6zIVixo=;
        b=JB6aysxAI2IbyPOoWYPZ3fbW3cWnQfIFEhyTlGvDuHQYXVlYsNq2AdjUEvD5WXzHVS
         hhF+CD8hjb7cURXquHKVEWJC/0UwDFyr3z9gG8Q0aAM6y2+ShedtP/usNziQYO1u8bIs
         jsitFKzTOcyUNpeUU3lDs4/L6obhQSj8DgjYu29bITc8mRg2C+c/tti9dcyMpvodzosU
         3vCRk2h0FxniBrRfYB37a6OG6pPDJja5YOK5Zl7DDQqIHfFU2vyvBV2suuzU3mG8qdS+
         K0Xm+BOvqTJnHjVoD7a/SnOsQjJZeml3CYevyI+dsX983kMwRkdHcqXV0QbT2K7StHg2
         g62g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from listsout.gnu.org (listsout.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h35si2750439qvh.191.2019.01.03.01.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:50164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gezWW-0007pi-Ly
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:42:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:32775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1gezWH-0007n3-9V
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:42:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <geert@linux-m68k.org>) id 1gezWE-0001BO-Fc
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:42:29 -0500
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a]:41730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <geert@linux-m68k.org>)
	id 1gezWC-00016G-Di
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:42:26 -0500
Received: from ramsan ([84.194.111.163]) by albert.telenet-ops.be with bizsmtp
	id KliH1z0023XaVaC06liHMx; Thu, 03 Jan 2019 10:42:19 +0100
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1gezW4-00011F-UN; Thu, 03 Jan 2019 10:42:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1gezW4-0007Q0-Rp; Thu, 03 Jan 2019 10:42:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>
Date: Thu,  3 Jan 2019 10:42:11 +0100
Message-Id: <20190103094211.28473-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:1800:110:4::f00:1a
Subject: [Qemu-arm] [PATCH QEMU v5] hw/arm/sysbus-fdt: Add support for
 instantiating generic devices
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>, qemu-devel@nongnu.org,
	linux-renesas-soc@vger.kernel.org,
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nDq/yAK8y4/C

Add a fallback for instantiating generic devices without a type-specific
or compatible-specific instantiation method.  This will be used when no
other match is found.

Generic device instantiation avoids having to write device-specific
instantiation methods for each and every "simple" device using only a
set of generic properties.  Devices that need more specialized handling
can still provide their own instantiation methods.

The generic instantiation method creates a device node with remapped
"reg" and (optional) "interrupts" properties, and copies properties from
the host, if deemed appropriate:
  - In general, properties without phandles are safe to be copied.
    Unfortunately, the FDT does not carry type information, hence an
    explicit whitelist is used, which can be extended when needed.
  - Properties related to power management (power and/or clock domain),
    isolation, and pin control, are handled by the host, and must not to
    be copied.

Devices nodes with subnodes are rejected, as subnodes cannot easily be
handled in a generic way.

This has been tested on a Renesas Salvator-XS board (R-Car H3 ES2.0)
with SATA, using:

    -device vfio-platform,host=ee300000.sata

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note: Also tested with GPIO, which needs "vfio: No-IOMMU mode support":

    -device vfio-platform,host=e6055400.gpio

v5:
  - Replace copying of a fixed list of properties (and ignoring all
    others), by scanning all properties on the host, and deciding if
    they need to be ignored, copied, or rejected,
  - Reject device nodes with subnodes,
  - Handle edge interrupts,

v3:
  - New.
---
 hw/arm/sysbus-fdt.c | 238 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index ad698d4832c694be..52de8c9a040c282a 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -28,6 +28,9 @@
 #ifdef CONFIG_LINUX
 #include <linux/vfio.h>
 #endif
+#ifdef CONFIG_FNMATCH
+#include <fnmatch.h>
+#endif
 #include "hw/arm/sysbus-fdt.h"
 #include "qemu/error-report.h"
 #include "sysemu/device_tree.h"
@@ -415,6 +418,232 @@ static int add_amd_xgbe_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+enum GenericPropertyAction {
+    PROP_IGNORE,
+    PROP_WARN,
+    PROP_COPY,
+    PROP_REJECT,
+};
+
+static struct {
+    const char *name;
+    enum GenericPropertyAction action;
+} generic_properties[] = {
+    { "name",            PROP_IGNORE }, /* handled automatically */
+    { "phandle",         PROP_IGNORE }, /* not needed for the generic case */
+
+    /* The following are copied and remapped by dedicated code */
+    { "reg",             PROP_IGNORE },
+    { "interrupts",      PROP_IGNORE },
+
+    /* The following are handled by the host */
+    { "power-domains",   PROP_IGNORE }, /* power management (+ opt. clocks) */
+    { "iommus",          PROP_IGNORE }, /* isolation */
+    { "resets",          PROP_IGNORE }, /* isolation */
+    { "pinctrl-*",       PROP_IGNORE }, /* pin control */
+
+    /* Ignoring the following may or may not work, hence the warning */
+    { "gpio-ranges",     PROP_WARN },   /* no support for pinctrl yet */
+    { "dmas",            PROP_WARN },   /* no support for external DMACs yet */
+
+    /* The following are irrelevant, as corresponding specifiers are ignored */
+    { "clock-names",     PROP_IGNORE },
+    { "reset-names",     PROP_IGNORE },
+    { "dma-names",       PROP_IGNORE },
+
+    /* Whitelist of properties not taking phandles, and thus safe to copy */
+    { "compatible",      PROP_COPY },
+    { "status",          PROP_COPY },
+    { "reg-names",       PROP_COPY },
+    { "interrupt-names", PROP_COPY },
+    { "#*-cells",        PROP_COPY },
+};
+
+#ifndef CONFIG_FNMATCH
+/* Fall back to exact string matching instead of allowing wildcards */
+static inline int fnmatch(const char *pattern, const char *string, int flags)
+{
+        return strcmp(pattern, string);
+}
+#endif
+
+static enum GenericPropertyAction get_generic_property_action(const char *name)
+{
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(generic_properties); i++) {
+        if (!fnmatch(generic_properties[i].name, name, 0)) {
+            return generic_properties[i].action;
+        }
+    }
+
+    /*
+     * Unfortunately DT properties do not carry type information,
+     * so we have to assume everything else contains a phandle,
+     * and must be rejected
+     */
+    return PROP_REJECT;
+}
+
+/**
+ * copy_generic_node
+ *
+ * Copy the generic part of a DT node from the host
+ */
+static void copy_generic_node(void *host_fdt, void *guest_fdt, char *host_path,
+                              char *guest_path)
+{
+    int node, prop, len;
+    const void *data;
+    const char *name;
+    enum GenericPropertyAction action;
+
+    node = fdt_path_offset(host_fdt, host_path);
+    if (node < 0) {
+        error_report("Cannot find node %s: %s", host_path, fdt_strerror(node));
+        exit(1);
+    }
+
+    /* Submodes are not yet supported */
+    if (fdt_first_subnode(host_fdt, node) >= 0) {
+        error_report("%s has unsupported subnodes", host_path);
+        goto unsupported;
+    }
+
+    /* Copy generic properties */
+    fdt_for_each_property_offset(prop, host_fdt, node) {
+        data = fdt_getprop_by_offset(host_fdt, prop, &name, &len);
+        if (!data) {
+            error_report("Cannot get property of %s: %s", host_path,
+                         fdt_strerror(len));
+            exit(1);
+        }
+
+        if (!len) {
+            /* Zero-sized properties are safe to copy */
+            action = PROP_COPY;
+        } else if (!strcmp(name, "clocks")) {
+            /* Reject "clocks" if "power-domains" is not present */
+            action = fdt_getprop(host_fdt, node, "power-domains", NULL)
+                     ? PROP_WARN : PROP_REJECT;
+        } else {
+            action = get_generic_property_action(name);
+        }
+
+        switch (action) {
+        case PROP_WARN:
+            warn_report("%s: Ignoring %s property", host_path, name);
+        case PROP_IGNORE:
+            break;
+
+        case PROP_COPY:
+            qemu_fdt_setprop(guest_fdt, guest_path, name, data, len);
+            break;
+
+        case PROP_REJECT:
+            error_report("%s has unsupported %s property", host_path, name);
+            goto unsupported;
+        }
+    }
+    return;
+
+unsupported:
+    error_report("You can ask a wizard to enhance me");
+    exit(1);
+}
+
+/**
+ * add_generic_fdt_node
+ *
+ * Generates a generic DT node by copying properties from the host
+ */
+static int add_generic_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    const char *parent_node = data->pbus_node_name;
+    void *guest_fdt = data->fdt, *host_fdt;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    char **node_path, *node_name, *dt_name;
+    PlatformBusDevice *pbus = data->pbus;
+    uint32_t *reg_attr, *irq_attr;
+    uint64_t mmio_base;
+    int i, irq_number;
+    VFIOINTp *intp;
+
+    host_fdt = load_device_tree_from_sysfs();
+
+    dt_name = sysfs_to_dt_name(vbasedev->name);
+    if (!dt_name) {
+        error_report("%s incorrect sysfs device name %s", __func__,
+                     vbasedev->name);
+        exit(1);
+    }
+    node_path = qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
+                                   &error_fatal);
+    if (!node_path || !node_path[0]) {
+        error_report("%s unable to retrieve node path for %s/%s", __func__,
+                     dt_name, vdev->compat);
+        exit(1);
+    }
+
+    if (node_path[1]) {
+        error_report("%s more than one node matching %s/%s!", __func__,
+                     dt_name, vdev->compat);
+        exit(1);
+    }
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    node_name = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    qemu_fdt_add_subnode(guest_fdt, node_name);
+
+    /* Copy generic parts from host */
+    copy_generic_node(host_fdt, guest_fdt, node_path[0], node_name);
+
+    /* Copy reg (remapped) */
+    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
+        reg_attr[2 * i] = cpu_to_be32(mmio_base);
+        reg_attr[2 * i + 1] = cpu_to_be32(
+                                memory_region_size(vdev->regions[i]->mem));
+    }
+    qemu_fdt_setprop(guest_fdt, node_name, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
+
+    /* Copy interrupts (remapped) */
+    if (vbasedev->num_irqs) {
+        irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
+        for (i = 0; i < vbasedev->num_irqs; i++) {
+            irq_number = platform_bus_get_irqn(pbus, sbdev, i) +
+                         data->irq_start;
+            irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+            irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+            QLIST_FOREACH(intp, &vdev->intp_list, next) {
+                if (intp->pin == i) {
+                    break;
+                }
+            }
+            if (intp->flags & VFIO_IRQ_INFO_AUTOMASKED) {
+                irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+            } else {
+                irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+            }
+        }
+        qemu_fdt_setprop(guest_fdt, node_name, "interrupts",
+                         irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+        g_free(irq_attr);
+    }
+
+    g_free(reg_attr);
+    g_free(node_name);
+    g_strfreev(node_path);
+    g_free(dt_name);
+    g_free(host_fdt);
+    return 0;
+}
+
 /* DT compatible matching */
 static bool vfio_platform_match(SysBusDevice *sbdev,
                                 const BindingEntry *entry)
@@ -423,6 +652,11 @@ static bool vfio_platform_match(SysBusDevice *sbdev,
     const char *compat;
     unsigned int n;
 
+    if (!entry->compat) {
+        /* Generic DT fallback */
+        return true;
+    }
+
     for (n = vdev->num_compat, compat = vdev->compat; n > 0;
          n--, compat += strlen(compat) + 1) {
         if (!strcmp(entry->compat, compat)) {
@@ -459,6 +693,10 @@ static const BindingEntry bindings[] = {
     VFIO_PLATFORM_BINDING("amd,xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
 #endif
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
+#ifdef CONFIG_LINUX
+    /* Generic DT fallback must be last */
+    VFIO_PLATFORM_BINDING(NULL, add_generic_fdt_node),
+#endif
     TYPE_BINDING("", NULL), /* last element */
 };
 
-- 
2.17.1

