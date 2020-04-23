Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1657331lfm;
        Thu, 23 Apr 2020 02:05:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypL3r8QLWqhtJG/Qo5mEoiAuV7HSQgxLyvCmU548Z3YlAU6v+WcpCvJBa4zySu0njx+NvKPg
X-Received: by 2002:ac8:23cd:: with SMTP id r13mr2892160qtr.5.1587632714632;
        Thu, 23 Apr 2020 02:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587632714; cv=none;
        d=google.com; s=arc-20160816;
        b=iCHScLQF+i3SarbLQ6yTf7vGSSkbhRvgpnDD4wn1iLu3ZeJZy6VrrzUfxuYQfIorCW
         Ra3HCbFndM0i/5VNr4rWQJ2v74WIPLNTN0hLpTWz9F/n5ZXBuQB44lg2LFClNyaAGB6u
         Kl8eqS5zDo7PyJVOgS7u8/9a3wURAmVo2Qw+OOoLcGECcXxXzODsMfJPZ1LuTOPbbOnP
         t4UixtCVYruVUJDdNBktvbEwikC3069sD/26QJQ9mCFPKKl/wA7NSoL/DQ6Z5IEA/rgm
         feOHA4t6sbrO3CcHHMo+HeITr6ebvk46LICX/pvwNCAVwR169iioPwftDCjgu7fYDDJf
         s9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=gQPourwy+wV4VFITxOhJ666uE3wNjxV0i241sx+iekM=;
        b=cmlv822y/HVnolue2sWSM38tJsPc6zFVO2bfzi3k/kqnR4DtxNvgKwtolJDrPGjF2n
         YF9KCaPXt1JWZy3Xh1zlpV2GCoYnf5HXQlGbplPgZAN0aTPKrDfoxHBrE6bLocbtT3iH
         9qyXucCvBh412ySUyQu88E45C8qN4Gm3qzKGF6TxgR7UtDzDhS7WebvCTI1n3nJmyt98
         Jyo34EVd+vdm6oejsQYooifgS2A/gWeVHJ27Tz1XINNnb1GMw7q+UDQSou0Q7UTbEa8i
         ZnU0jyDLPSYt2INococP1PxZrEPKMuJIs1Shg1NBPOngpmp8qMo3/xGQsWGrJhozjlqr
         QiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk5si1184464qvb.4.2020.04.23.02.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRXnF-0005O0-UJ
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXjr-00010g-G7
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1jRXjb-0001DW-DZ
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:43 -0400
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geert@linux-m68k.org>)
 id 1jRXja-0001BZ-4z
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:01:26 -0400
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:89cc:efc7:85ce:4669])
 by xavier.telenet-ops.be with bizsmtp
 id W91L2200P1RvcFS0191LFD; Thu, 23 Apr 2020 11:01:21 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0006k9-Al; Thu, 23 Apr 2020 11:01:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1jRXjU-0002vW-9V; Thu, 23 Apr 2020 11:01:20 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH QEMU v2 2/5] ARM: PL061: Extract pl061_create_fdt()
Date: Thu, 23 Apr 2020 11:01:15 +0200
Message-Id: <20200423090118.11199-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200423090118.11199-1-geert+renesas@glider.be>
References: <20200423090118.11199-1-geert+renesas@glider.be>
Received-SPF: none client-ip=2a02:1800:120:4::f00:14;
 envelope-from=geert@linux-m68k.org; helo=xavier.telenet-ops.be
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a02:1800:120:4::f00:14
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mMGRWDvy2szb

Move the code to create the DT node for the PL061 GPIO controller from
hw/arm/virt.c to the PL061 driver, so it can be reused.

While at it, make the created node comply with the PL061 Device Tree
bindings:
  - Use generic node name "gpio" instead of "pl061",
  - Add missing "#interrupt-cells" and "interrupt-controller"
    properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 hw/arm/virt.c           | 20 +++-----------------
 hw/gpio/pl061.c         | 42 +++++++++++++++++++++++++++++++++++++++++
 include/hw/gpio/pl061.h |  7 +++++++
 3 files changed, 52 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7dc96abf72cf2b9a..c88c8850fbe00bdb 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -40,6 +40,7 @@
 #include "hw/arm/primecell.h"
 #include "hw/arm/virt.h"
 #include "hw/block/flash.h"
+#include "hw/gpio/pl061.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
 #include "hw/vfio/vfio-amd-xgbe.h"
 #include "hw/display/ramfb.h"
@@ -807,30 +808,16 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
 
 static void create_gpio(const VirtMachineState *vms)
 {
-    char *nodename;
     DeviceState *pl061_dev;
     hwaddr base = vms->memmap[VIRT_GPIO].base;
     hwaddr size = vms->memmap[VIRT_GPIO].size;
     int irq = vms->irqmap[VIRT_GPIO];
-    const char compat[] = "arm,pl061\0arm,primecell";
 
     pl061_dev = sysbus_create_simple("pl061", base,
                                      qdev_get_gpio_in(vms->gic, irq));
 
-    uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
-    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
-    qemu_fdt_add_subnode(vms->fdt, nodename);
-    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                 2, base, 2, size);
-    qemu_fdt_setprop(vms->fdt, nodename, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "#gpio-cells", 2);
-    qemu_fdt_setprop(vms->fdt, nodename, "gpio-controller", NULL, 0);
-    qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
-                           GIC_FDT_IRQ_TYPE_SPI, irq,
-                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "clocks", vms->clock_phandle);
-    qemu_fdt_setprop_string(vms->fdt, nodename, "clock-names", "apb_pclk");
-    qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", phandle);
+    uint32_t phandle = pl061_create_fdt(vms->fdt, "", 2, base, size, irq,
+                                        vms->clock_phandle);
 
     gpio_key_dev = sysbus_create_simple("gpio-key", -1,
                                         qdev_get_gpio_in(pl061_dev, 3));
@@ -846,7 +833,6 @@ static void create_gpio(const VirtMachineState *vms)
                           KEY_POWER);
     qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
                            "gpios", phandle, 3, 0);
-    g_free(nodename);
 }
 
 static void create_virtio_devices(const VirtMachineState *vms)
diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index e776c09e474216ef..74ba733a8a5e8ca5 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -9,12 +9,14 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/arm/fdt.h"
 #include "hw/gpio/pl061.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "sysemu/device_tree.h"
 
 //#define DEBUG_PL061 1
 
@@ -397,3 +399,43 @@ static void pl061_register_types(void)
 }
 
 type_init(pl061_register_types)
+
+/*
+ * pl061_create_fdt: Create a DT node for a PL061 GPIO controller
+ * @fdt: device tree blob
+ * @parent: name of the parent node
+ * @n_cells: value of #address-cells and #size-cells
+ * @base: base address of the controller's register block
+ * @size: size of the controller's register block
+ * @irq: interrupt number
+ * @clock: phandle of the apb-pclk clock
+ *
+ * Return value: a phandle referring to the created DT node.
+ *
+ * See the DT Binding Documentation in the Linux kernel source tree:
+ * Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+ */
+uint32_t pl061_create_fdt(void *fdt, const char *parent, unsigned int n_cells,
+                          hwaddr base, hwaddr size, int irq, uint32_t clock)
+{
+    char *nodename = g_strdup_printf("%s/gpio@%" PRIx64, parent, base);
+    static const char compat[] = "arm,pl061\0arm,primecell";
+    uint32_t phandle = qemu_fdt_alloc_phandle(fdt);
+
+    qemu_fdt_add_subnode(fdt, nodename);
+    qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", n_cells, base, n_cells,
+                                 size);
+    qemu_fdt_setprop(fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_cell(fdt, nodename, "#gpio-cells", 2);
+    qemu_fdt_setprop(fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cell(fdt, nodename, "#interrupt-cells", 2);
+    qemu_fdt_setprop(fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cells(fdt, nodename, "interrupts", GIC_FDT_IRQ_TYPE_SPI,
+                           irq, GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(fdt, nodename, "clocks", clock);
+    qemu_fdt_setprop_string(fdt, nodename, "clock-names", "apb_pclk");
+    qemu_fdt_setprop_cell(fdt, nodename, "phandle", phandle);
+    g_free(nodename);
+
+    return phandle;
+}
diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
index 78cc40c52679dc4e..f98c6e24e0e68662 100644
--- a/include/hw/gpio/pl061.h
+++ b/include/hw/gpio/pl061.h
@@ -11,6 +11,13 @@
 #ifndef PL061_GPIO_H
 #define PL061_GPIO_H
 
+#include <stdint.h>
+
+#include "exec/hwaddr.h"
+
 #define TYPE_PL061 "pl061"
 
+uint32_t pl061_create_fdt(void *fdt, const char *parent, unsigned int n_cells,
+                          hwaddr addr, hwaddr size, int irq, uint32_t clock);
+
 #endif /* PL061_GPIO_H */
-- 
2.17.1

