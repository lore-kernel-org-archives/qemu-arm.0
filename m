Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp997166wrq;
        Fri, 15 Jun 2018 08:42:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQrLjDA8EAJmwwKoNydIi0u8MLXe/s1h0Ojrz3PfnBQdotvSuRdeEx4EyR/W7b0dB9Vrcq
X-Received: by 2002:a37:cbc8:: with SMTP id u69-v6mr1819202qkl.242.1529077325710;
        Fri, 15 Jun 2018 08:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529077325; cv=none;
        d=google.com; s=arc-20160816;
        b=lwL+UiFaOBUJP54fSTkwn0uYU0cfliPsbKhfluhfjKZ0ZtUPPutaVhQk97EGybZGcl
         ie0yxSBw5/xVroiuTWDcydYmRkVnhCPpNLd/VtZqeOzsn1w6i5/tZ/F1MtThTvukAUn0
         xbFLDVR1ezbocIU6bCJc0Ys/RyR9UTBPYLV5/s0mtoZYv2362b0luKqDYeExDmw31nLa
         JFORyqzD/8Q2pCzT9z7+PuRaM05EPqm1OKuuNT5ti8UOaXUk4z/G/voOvOQL7ASR/LPS
         QL3V8kTeMQlVGokrQlyY4HiOxhQ+GRLDw4mVKjSyi7vzYbwNd0iIpbVWUop2uaAcmalR
         Ji4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xbkboynXLIfoailDOCWnIC8GsJESlmO6WvxhmUyKM5Q=;
        b=PAQtLBvD06ngE3m4gmJvDGThbwxmstTKjtOCurcjrqAaPY9e+DmxwK0eI1KYugR8rR
         YcXoL3W6OhFvaXTARMMYvIBBy8WE4WdQbey2mwpge1tl7BZ0sEjfF0mwdEksR4yRnPVu
         PNult8AH7ROjU6dGg3tt1ARIyVryhh4qZ5XzhTWuzigYcno3zZcFsNZhkp6aj+kpRpLb
         9kdE+ZezHv28ePdipfA3wb+hkEfacE0u4H4ImmwagsnVoO+6jov9d5Mm0FPQ5PJfD0mb
         aQLTHqhx4Epo6FnnR2M2wRx5Zm+qBwhEF5qeDWHXuo+v6oPYqjZ4x39S6cC83sAb4RQI
         UJYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6-v6si3675422qkb.400.2018.06.15.08.42.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 08:42:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTqrV-000090-5f
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 11:42:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kieran@bingham.xyz>) id 1fTpuy-0007Wh-WC
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:41:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kieran@bingham.xyz>) id 1fTpux-0004tO-NO
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 10:41:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43468)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kieran@bingham.xyz>)
	id 1fTpur-0004kG-Nu; Fri, 15 Jun 2018 10:41:29 -0400
Received: from localhost.localdomain
	(cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E976D1A9A;
	Fri, 15 Jun 2018 16:41:26 +0200 (CEST)
From: Kieran Bingham <kieran@bingham.xyz>
To: linux-renesas-soc@vger.kernel.org,
	qemu-devel@nongnu.org
Date: Fri, 15 Jun 2018 15:41:23 +0100
Message-Id: <20180615144123.20844-1-kieran@bingham.xyz>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 213.167.242.64
X-Mailman-Approved-At: Fri, 15 Jun 2018 11:25:56 -0400
Subject: [Qemu-devel] [PATCH] [QEMU][RFC] hw/arm/sysbus-fdt: Enable
 rcar-gen3-scif dynamic instantiation
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
Cc: Kieran Bingham <kieran@bingham.xyz>, qemu-arm@nongnu.org, geert@glider.be,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCpfet7y2CrK

Allow the provision of a Renesas R-Car Gen3 (H)SCIF controller device
from the Qemu command line:

  -device vfio-platform,host=e6e68000.serial,manufacturer=renesas,model=rcar-gen3-scif

To support this, the serial device must be unbound from the host, and
rebound to the vfio-platform driver:

  echo 1 > /sys/module/vfio/parameters/enable_unsafe_noiommu_mode
  echo e6e68000.serial > /sys/bus/platform/drivers/sh-sci/unbind
  echo vfio-platform > /sys/bus/platform/devices/e6e68000.serial/driver_override
  echo e6e68000.serial > /sys/bus/platform/drivers/vfio-platform/bind

Ideally, this patch should be unnecessary and the FDT should be
generated automatically from the host, or perhaps with the provision of
a DTO, allowing the configuration to be provided externally from Q-Emu.

The functionality of this patch mostly duplicates the
add_rcar_gpio_fdt_node() with the exception of the gpio-controller node,
and #gpio-cells.

Not-Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

---

This patch supports testing of serial device passthrough on R-Car Gen3,
and is not meant to be upstreamed as is. This serves as a purpose for
ongoing development and investigation into para-virtualisation of the
R-Car Gen3 platforms, and highlights the extensions needed to support
passing through a basic serial device to a guest.

This patch and its dependencies is available at the following branch:

  https://github.com/kbingham/qemu.git rcar3/serial/passthrough

This builds upon existing work [0] done by Geert Uytterhoeven

 [0]  https://www.spinics.net/lists/kvm/msg163975.html
---
 hw/arm/sysbus-fdt.c | 61 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index a04e5b384c29..ec755e0f4652 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -477,6 +477,66 @@ static int add_rcar_gpio_fdt_node(SysBusDevice *sbdev, void *opaque)
     return 0;
 }
 
+/**
+ * add_rcar_scif_fdt_node
+ *
+ * Generates a simple node with following properties:
+ * compatible string, regs, #gpio-cells, gpio-controller
+ */
+static int add_rcar_scif_fdt_node(SysBusDevice *sbdev, void *opaque)
+{
+    PlatformBusFDTData *data = opaque;
+    VFIOPlatformDevice *vdev = VFIO_PLATFORM_DEVICE(sbdev);
+    const char *parent_node = data->pbus_node_name;
+    VFIODevice *vbasedev = &vdev->vbasedev;
+    PlatformBusDevice *pbus = data->pbus;
+    int compat_str_len, i, irq_number;
+    uint32_t *reg_attr, *irq_attr;
+    void *fdt = data->fdt;
+    uint64_t mmio_base;
+    char *nodename;
+
+    mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    nodename = g_strdup_printf("%s/%s@%" PRIx64, parent_node,
+                               vbasedev->name, mmio_base);
+    qemu_fdt_add_subnode(fdt, nodename);
+
+    printf("%s - using nodename :%s\n", __func__, nodename);
+
+    /* Add compatible */
+    compat_str_len = strlen(vdev->compat) + 1;
+    qemu_fdt_setprop(fdt, nodename, "compatible",
+                          vdev->compat, compat_str_len);
+
+    /* Copy reg */
+    reg_attr = g_new(uint32_t, vbasedev->num_regions * 2);
+    for (i = 0; i < vbasedev->num_regions; i++) {
+        mmio_base = platform_bus_get_mmio_addr(pbus, sbdev, i);
+        reg_attr[2 * i] = cpu_to_be32(mmio_base);
+        reg_attr[2 * i + 1] = cpu_to_be32(
+                                memory_region_size(vdev->regions[i]->mem));
+    }
+    qemu_fdt_setprop(fdt, nodename, "reg", reg_attr,
+                     vbasedev->num_regions * 2 * sizeof(uint32_t));
+
+    /* Copy interrupts */
+    irq_attr = g_new(uint32_t, vbasedev->num_irqs * 3);
+    for (i = 0; i < vbasedev->num_irqs; i++) {
+        irq_number = platform_bus_get_irqn(pbus, sbdev , i)
+                         + data->irq_start;
+        irq_attr[3 * i] = cpu_to_be32(GIC_FDT_IRQ_TYPE_SPI);
+        irq_attr[3 * i + 1] = cpu_to_be32(irq_number);
+        irq_attr[3 * i + 2] = cpu_to_be32(GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    }
+    qemu_fdt_setprop(fdt, nodename, "interrupts",
+                     irq_attr, vbasedev->num_irqs * 3 * sizeof(uint32_t));
+
+    g_free(irq_attr);
+    g_free(reg_attr);
+    g_free(nodename);
+    return 0;
+}
+
 /* manufacturer/model matching */
 static bool vfio_platform_match(SysBusDevice *sbdev,
                                 const BindingEntry *entry)
@@ -516,6 +576,7 @@ static const BindingEntry bindings[] = {
     TYPE_BINDING(TYPE_VFIO_AMD_XGBE, add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("amd", "xgbe-seattle-v1a", add_amd_xgbe_fdt_node),
     VFIO_PLATFORM_BINDING("renesas", "rcar-gen3-gpio", add_rcar_gpio_fdt_node),
+    VFIO_PLATFORM_BINDING("renesas", "rcar-gen3-scif", add_rcar_scif_fdt_node),
 #endif
     TYPE_BINDING("", NULL), /* last element */
 };
-- 
2.17.1

