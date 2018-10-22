Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3351851wrt;
        Mon, 22 Oct 2018 10:38:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63doRMyiL78BIv/yCLgn5pRj7F0GI9OjrR+ey8QgOItEmxEftG+LeARPchJTYBYd01VZ5GH
X-Received: by 2002:aed:3e94:: with SMTP id n20-v6mr14991352qtf.196.1540229910223;
        Mon, 22 Oct 2018 10:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540229910; cv=none;
        d=google.com; s=arc-20160816;
        b=s9uV4e88W2Xo9Io4CVYwSzxVcHmMMFMu9Y/FU4ZnN77pu2TtaYa99FkWV77KK7vCK3
         BFEo43l+Bb+7QnBZpGSPm3EBw9mtXPrAc1cwKdhjXS4aj/5mRHXHK7DowvOzTj5EUb2e
         ANvAcrpuVzv8OyoEpZ38PAF1IY2GKr+CS5oe2gEt/EAhUVCQahGYtkHmh9eNCnCtgecn
         1Mf8hxeitgP9gcnXsZG7C3xKPXtgarZOP3Og+zT5bQg93cUgkPDok8pusJKM+ZazBjmp
         iOI8zl7woGzkQ7ujA/QvRToIg/V6CuNOs9hprcgOE6Oi5/VkrGFZMCeb0YkUASY2ceYd
         2Iug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=djmsePH6rAyh5m37yoU5ms6GIAPLfXFgYGS04hVFiAY=;
        b=mMAmgLoYgtOvHpn+9tH51i+oBWWm/wePX6LSV42qGgmN1IyhibMml69tP0ZfJnc1tw
         v2jLOaDfjgnTVKbbkYlaRQucMxoAW0rY8oXoz/k0MdLX+egogsJXS3AzTjxaNSP/AZvO
         ADLJz7RAlOr/7FqTxaOexNWPoOuwXwe+tPSQJptO6R6QE2I08xZAV/1ux61FTm3M4kO3
         WeMI2bZ+aL0krtcfHqC9fbt0i/9/G9yoRz3Cjip5Wjxy3Q7C37SEBL61rP8GsuQtrvU1
         ZvjV7A7bqJSNfeu7MeQ6TLOvvZp7DHQMc3DpPxQh3a+LYaKO0YhoUYSN1XyqYxdj/6dn
         eEWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tfiR4GaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c15-v6si1625314qkm.252.2018.10.22.10.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Oct 2018 10:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tfiR4GaN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gEe9t-00072a-Mt
	for alex.bennee@linaro.org; Mon, 22 Oct 2018 13:38:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7q-00060j-Ei
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 13:36:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gEe7k-0002fi-3E
	for qemu-devel@nongnu.org; Mon, 22 Oct 2018 13:36:22 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:43145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gEe7g-0002Za-3V; Mon, 22 Oct 2018 13:36:13 -0400
Received: by mail-lf1-x143.google.com with SMTP id p34-v6so31059319lfg.10;
	Mon, 22 Oct 2018 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=djmsePH6rAyh5m37yoU5ms6GIAPLfXFgYGS04hVFiAY=;
	b=tfiR4GaNAn2HAS6OCGAm5fnqoD/LYZGLLQmtGtCahQ7BGwbe6/CLcbcQQ3FagslW+4
	fz8lpRo88TXQBuwQucKNiJtDBZN0tv43Ju5gkE9mKEFhDZoZ2fUrBU+rYwG4x5DbZ88J
	/CNw81euFwkHnzJj+//GBPo+RFUFNEDxzHpPqLYo2dZwDSwMeas/VJ99xqKBuxmp1tRQ
	s5j2VF761oKxhy6JJShrum63xtDm8NZjUanjiaQ+bDSyDYL+a4EfRrA56H6tI+orppIo
	j0DWmtxDrJWr2mlVZ8UtFYUdwHI+A0LzaRL2Qft2HKz8NFR8rnmASpfkv35E8oUbIV/w
	I2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=djmsePH6rAyh5m37yoU5ms6GIAPLfXFgYGS04hVFiAY=;
	b=PXYeSepyPPs1ZK/q9W2TuBfORbIaXae6kwaGiSDdwnvkc8L4DXaio0Gq4zT9EEt5KB
	qyfLeTXvaqIxOT+fpAVStmumkQifrCz+q2qcKJ/y0ZSasD8/I9ORxW5cmEr2LjWB2Jog
	q7CMnJAPTm35i7FmDstsCvQmhxGFw8sCjR1q0SK/JN1/RhJZJJ7wVAOxuDGtNE6DuMl1
	tdC12QsLGKWCbj8NtdWtAlIXOMGJ/OfOPpGAqYaof+YkE2PFAPRdlQK/CAvydhVjDMll
	7ngaPeFxIDm18M1sY+aqVRj+MFwGdlVlOvH2Yr7rRoqlt1uhefV+hgzhUjwdw0/t85JZ
	urCw==
X-Gm-Message-State: ABuFfoiylYv52/FILWEhtke3KD23k/NAnhhxwQvBfbyyH08g0qSL3AtZ
	7PlFcnMzBisCFK7LkfVjToEMDCnc
X-Received: by 2002:a19:a501:: with SMTP id o1-v6mr9704987lfe.41.1540229769965;
	Mon, 22 Oct 2018 10:36:09 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	p14-v6sm739032lfh.72.2018.10.22.10.36.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 10:36:08 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 22 Oct 2018 19:35:59 +0200
Message-Id: <20181022173559.17111-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181022173559.17111-1-edgar.iglesias@gmail.com>
References: <20181022173559.17111-1-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: [Qemu-devel] [PATCH v4 4/4] hw/arm: versal: Add a virtual Xilinx
 Versal board
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xKD9rbTEI5QH

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a virtual Xilinx Versal board.

This board is based on the Xilinx Versal SoC. The exact
details of what peripherals are attached to this board
will remain in control of QEMU. QEMU will generate an
FDT on the fly for Linux and other software to auto-discover
peripherals.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/Makefile.objs      |   2 +-
 hw/arm/xlnx-versal-virt.c | 494 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 495 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/xlnx-versal-virt.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ec21d9bc1f..50c7b4a927 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -26,7 +26,7 @@ obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
 obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zynqmp.o xlnx-zcu102.o
-obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o
+obj-$(CONFIG_XLNX_VERSAL) += xlnx-versal.o xlnx-versal-virt.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
new file mode 100644
index 0000000000..1ae125b174
--- /dev/null
+++ b/hw/arm/xlnx-versal-virt.c
@@ -0,0 +1,494 @@
+/*
+ * Xilinx Versal Virtual board.
+ *
+ * Copyright (c) 2018 Xilinx Inc.
+ * Written by Edgar E. Iglesias
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 or
+ * (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "sysemu/device_tree.h"
+#include "exec/address-spaces.h"
+#include "hw/boards.h"
+#include "hw/sysbus.h"
+#include "hw/arm/sysbus-fdt.h"
+#include "hw/arm/fdt.h"
+#include "cpu.h"
+#include "hw/arm/xlnx-versal.h"
+
+#define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
+#define XLNX_VERSAL_VIRT_MACHINE(obj) \
+    OBJECT_CHECK(VersalVirt, (obj), TYPE_XLNX_VERSAL_VIRT_MACHINE)
+
+typedef struct VersalVirt {
+    MachineState parent_obj;
+
+    Versal soc;
+    MemoryRegion mr_ddr;
+
+    void *fdt;
+    int fdt_size;
+    struct {
+        uint32_t gic;
+        uint32_t ethernet_phy[2];
+        uint32_t clk_125Mhz;
+        uint32_t clk_25Mhz;
+    } phandle;
+    struct arm_boot_info binfo;
+
+    struct {
+        bool secure;
+    } cfg;
+} VersalVirt;
+
+static void fdt_create(VersalVirt *s)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(s);
+    int i;
+
+    s->fdt = create_device_tree(&s->fdt_size);
+    if (!s->fdt) {
+        error_report("create_device_tree() failed");
+        exit(1);
+    }
+
+    /* Allocate all phandles.  */
+    s->phandle.gic = qemu_fdt_alloc_phandle(s->fdt);
+    for (i = 0; i < ARRAY_SIZE(s->phandle.ethernet_phy); i++) {
+        s->phandle.ethernet_phy[i] = qemu_fdt_alloc_phandle(s->fdt);
+    }
+    s->phandle.clk_25Mhz = qemu_fdt_alloc_phandle(s->fdt);
+    s->phandle.clk_125Mhz = qemu_fdt_alloc_phandle(s->fdt);
+
+    /* Create /chosen node for load_dtb.  */
+    qemu_fdt_add_subnode(s->fdt, "/chosen");
+
+    /* Header */
+    qemu_fdt_setprop_cell(s->fdt, "/", "interrupt-parent", s->phandle.gic);
+    qemu_fdt_setprop_cell(s->fdt, "/", "#size-cells", 0x2);
+    qemu_fdt_setprop_cell(s->fdt, "/", "#address-cells", 0x2);
+    qemu_fdt_setprop_string(s->fdt, "/", "model", mc->desc);
+    qemu_fdt_setprop_string(s->fdt, "/", "compatible", "xlnx-versal-virt");
+}
+
+static void fdt_add_clk_node(VersalVirt *s, const char *name,
+                             unsigned int freq_hz, uint32_t phandle)
+{
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
+    qemu_fdt_setprop_cell(s->fdt, name, "clock-frequency", freq_hz);
+    qemu_fdt_setprop_cell(s->fdt, name, "#clock-cells", 0x0);
+    qemu_fdt_setprop_string(s->fdt, name, "compatible", "fixed-clock");
+    qemu_fdt_setprop(s->fdt, name, "u-boot,dm-pre-reloc", NULL, 0);
+}
+
+static void fdt_add_cpu_nodes(VersalVirt *s, uint32_t psci_conduit)
+{
+    int i;
+
+    qemu_fdt_add_subnode(s->fdt, "/cpus");
+    qemu_fdt_setprop_cell(s->fdt, "/cpus", "#size-cells", 0x0);
+    qemu_fdt_setprop_cell(s->fdt, "/cpus", "#address-cells", 1);
+
+    for (i = XLNX_VERSAL_NR_ACPUS - 1; i >= 0; i--) {
+        char *name = g_strdup_printf("/cpus/cpu@%d", i);
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop_cell(s->fdt, name, "reg", armcpu->mp_affinity);
+        if (psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
+            qemu_fdt_setprop_string(s->fdt, name, "enable-method", "psci");
+        }
+        qemu_fdt_setprop_string(s->fdt, name, "device_type", "cpu");
+        qemu_fdt_setprop_string(s->fdt, name, "compatible",
+                                armcpu->dtb_compatible);
+        g_free(name);
+    }
+}
+
+static void fdt_add_gic_nodes(VersalVirt *s)
+{
+    char *nodename;
+
+    nodename = g_strdup_printf("/gic@%x", MM_GIC_APU_DIST_MAIN);
+    qemu_fdt_add_subnode(s->fdt, nodename);
+    qemu_fdt_setprop_cell(s->fdt, nodename, "phandle", s->phandle.gic);
+    qemu_fdt_setprop_cells(s->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_PPI, VERSAL_GIC_MAINT_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop(s->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_sized_cells(s->fdt, nodename, "reg",
+                                 2, MM_GIC_APU_DIST_MAIN,
+                                 2, MM_GIC_APU_DIST_MAIN_SIZE,
+                                 2, MM_GIC_APU_REDIST_0,
+                                 2, MM_GIC_APU_REDIST_0_SIZE);
+    qemu_fdt_setprop_cell(s->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop_string(s->fdt, nodename, "compatible", "arm,gic-v3");
+}
+
+static void fdt_add_timer_nodes(VersalVirt *s)
+{
+    const char compat[] = "arm,armv8-timer";
+    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+
+    qemu_fdt_add_subnode(s->fdt, "/timer");
+    qemu_fdt_setprop_cells(s->fdt, "/timer", "interrupts",
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_S_EL1_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_NS_EL1_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_VIRT_IRQ, irqflags,
+            GIC_FDT_IRQ_TYPE_PPI, VERSAL_TIMER_NS_EL2_IRQ, irqflags);
+    qemu_fdt_setprop(s->fdt, "/timer", "compatible",
+                     compat, sizeof(compat));
+}
+
+static void fdt_add_uart_nodes(VersalVirt *s)
+{
+    uint64_t addrs[] = { MM_UART1, MM_UART0 };
+    unsigned int irqs[] = { VERSAL_UART1_IRQ_0, VERSAL_UART0_IRQ_0 };
+    const char compat[] = "arm,pl011\0arm,sbsa-uart";
+    const char clocknames[] = "uartclk\0apb_pclk";
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        char *name = g_strdup_printf("/uart@%" PRIx64, addrs[i]);
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop_cell(s->fdt, name, "current-speed", 115200);
+        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_125Mhz, s->phandle.clk_125Mhz);
+        qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addrs[i], 2, 0x1000);
+        qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat, sizeof(compat));
+        qemu_fdt_setprop(s->fdt, name, "u-boot,dm-pre-reloc", NULL, 0);
+
+        if (addrs[i] == MM_UART0) {
+            /* Select UART0.  */
+            qemu_fdt_setprop_string(s->fdt, "/chosen", "stdout-path", name);
+        }
+        g_free(name);
+    }
+}
+
+static void fdt_add_fixed_link_nodes(VersalVirt *s, char *gemname,
+                                     uint32_t phandle)
+{
+    char *name = g_strdup_printf("%s/fixed-link", gemname);
+
+    qemu_fdt_add_subnode(s->fdt, name);
+    qemu_fdt_setprop_cell(s->fdt, name, "phandle", phandle);
+    qemu_fdt_setprop_cells(s->fdt, name, "full-duplex");
+    qemu_fdt_setprop_cell(s->fdt, name, "speed", 1000);
+    g_free(name);
+}
+
+static void fdt_add_gem_nodes(VersalVirt *s)
+{
+    uint64_t addrs[] = { MM_GEM1, MM_GEM0 };
+    unsigned int irqs[] = { VERSAL_GEM1_IRQ_0, VERSAL_GEM0_IRQ_0 };
+    const char clocknames[] = "pclk\0hclk\0tx_clk\0rx_clk";
+    const char compat_gem[] = "cdns,zynqmp-gem\0cdns,gem";
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(addrs); i++) {
+        char *name = g_strdup_printf("/ethernet@%" PRIx64, addrs[i]);
+        qemu_fdt_add_subnode(s->fdt, name);
+
+        fdt_add_fixed_link_nodes(s, name, s->phandle.ethernet_phy[i]);
+        qemu_fdt_setprop_string(s->fdt, name, "phy-mode", "rgmii-id");
+        qemu_fdt_setprop_cell(s->fdt, name, "phy-handle",
+                              s->phandle.ethernet_phy[i]);
+        qemu_fdt_setprop_cells(s->fdt, name, "clocks",
+                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz,
+                               s->phandle.clk_25Mhz, s->phandle.clk_25Mhz);
+        qemu_fdt_setprop(s->fdt, name, "clock-names",
+                         clocknames, sizeof(clocknames));
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI,
+                               GIC_FDT_IRQ_TYPE_SPI, irqs[i],
+                               GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, addrs[i], 2, 0x1000);
+        qemu_fdt_setprop(s->fdt, name, "compatible",
+                         compat_gem, sizeof(compat_gem));
+        qemu_fdt_setprop_cell(s->fdt, name, "#address-cells", 1);
+        qemu_fdt_setprop_cell(s->fdt, name, "#size-cells", 0);
+        g_free(name);
+    }
+}
+
+static void fdt_nop_memory_nodes(void *fdt, Error **errp)
+{
+    Error *err = NULL;
+    char **node_path;
+    int n = 0;
+
+    node_path = qemu_fdt_node_unit_path(fdt, "memory", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    while (node_path[n]) {
+        if (g_str_has_prefix(node_path[n], "/memory")) {
+            qemu_fdt_nop_node(fdt, node_path[n]);
+        }
+        n++;
+    }
+    g_strfreev(node_path);
+}
+
+static void fdt_add_memory_nodes(VersalVirt *s, void *fdt, uint64_t ram_size)
+{
+    /* Describes the various split DDR access regions.  */
+    static const struct {
+        uint64_t base;
+        uint64_t size;
+    } addr_ranges[] = {
+        { MM_TOP_DDR, MM_TOP_DDR_SIZE },
+        { MM_TOP_DDR_2, MM_TOP_DDR_2_SIZE },
+        { MM_TOP_DDR_3, MM_TOP_DDR_3_SIZE },
+        { MM_TOP_DDR_4, MM_TOP_DDR_4_SIZE }
+    };
+    uint64_t mem_reg_prop[8] = {0};
+    uint64_t size = ram_size;
+    Error *err = NULL;
+    char *name;
+    int i;
+
+    fdt_nop_memory_nodes(fdt, &err);
+    if (err) {
+        error_report_err(err);
+        return;
+    }
+
+    name = g_strdup_printf("/memory@%x", MM_TOP_DDR);
+    for (i = 0; i < ARRAY_SIZE(addr_ranges) && size; i++) {
+        uint64_t mapsize;
+
+        mapsize = size < addr_ranges[i].size ? size : addr_ranges[i].size;
+
+        mem_reg_prop[i * 2] = addr_ranges[i].base;
+        mem_reg_prop[i * 2 + 1] = mapsize;
+        size -= mapsize;
+    }
+    qemu_fdt_add_subnode(fdt, name);
+    qemu_fdt_setprop_string(fdt, name, "device_type", "memory");
+
+    switch (i) {
+    case 1:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1]);
+        break;
+    case 2:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3]);
+        break;
+    case 3:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3],
+                                     2, mem_reg_prop[4],
+                                     2, mem_reg_prop[5]);
+        break;
+    case 4:
+        qemu_fdt_setprop_sized_cells(fdt, name, "reg",
+                                     2, mem_reg_prop[0],
+                                     2, mem_reg_prop[1],
+                                     2, mem_reg_prop[2],
+                                     2, mem_reg_prop[3],
+                                     2, mem_reg_prop[4],
+                                     2, mem_reg_prop[5],
+                                     2, mem_reg_prop[6],
+                                     2, mem_reg_prop[7]);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    g_free(name);
+}
+
+static void versal_virt_modify_dtb(const struct arm_boot_info *binfo,
+                                    void *fdt)
+{
+    VersalVirt *s = container_of(binfo, VersalVirt, binfo);
+
+    fdt_add_memory_nodes(s, fdt, binfo->ram_size);
+}
+
+static void *versal_virt_get_dtb(const struct arm_boot_info *binfo,
+                                  int *fdt_size)
+{
+    const VersalVirt *board = container_of(binfo, VersalVirt, binfo);
+
+    *fdt_size = board->fdt_size;
+    return board->fdt;
+}
+
+#define NUM_VIRTIO_TRANSPORT 32
+static void create_virtio_regions(VersalVirt *s)
+{
+    int virtio_mmio_size = 0x200;
+    int i;
+
+    for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
+        char *name = g_strdup_printf("virtio%d", i);;
+        hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
+        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        MemoryRegion *mr;
+        DeviceState *dev;
+        qemu_irq pic_irq;
+
+        pic_irq = qdev_get_gpio_in(DEVICE(&s->soc.fpd.apu.gic), irq);
+        dev = qdev_create(NULL, "virtio-mmio");
+        object_property_add_child(OBJECT(&s->soc), name, OBJECT(dev),
+                                  &error_fatal);
+        qdev_init_nofail(dev);
+        sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic_irq);
+        mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
+        memory_region_add_subregion(&s->soc.mr_ps, base, mr);
+        sysbus_create_simple("virtio-mmio", base, pic_irq);
+    }
+
+    for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
+        hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
+        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
+        char *name = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
+
+        qemu_fdt_add_subnode(s->fdt, name);
+        qemu_fdt_setprop(s->fdt, name, "dma-coherent", NULL, 0);
+        qemu_fdt_setprop_cells(s->fdt, name, "interrupts",
+                               GIC_FDT_IRQ_TYPE_SPI, irq,
+                               GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+        qemu_fdt_setprop_sized_cells(s->fdt, name, "reg",
+                                     2, base, 2, virtio_mmio_size);
+        qemu_fdt_setprop_string(s->fdt, name, "compatible", "virtio,mmio");
+        g_free(name);
+    }
+}
+
+static void versal_virt_init(MachineState *machine)
+{
+    VersalVirt *s = XLNX_VERSAL_VIRT_MACHINE(machine);
+    int psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
+
+    /*
+     * If the user provides an Operating System to be loaded, we expect them
+     * to use the -kernel command line option.
+     *
+     * Users can load firmware or boot-loaders with the -device loader options.
+     *
+     * When loading an OS, we generate a dtb and let arm_load_kernel() select
+     * where it gets loaded. This dtb will be passed to the kernel in x0.
+     *
+     * If there's no -kernel option, we generate a DTB and place it at 0x1000
+     * for the bootloaders or firmware to pick up.
+     *
+     * If users want to provide their own DTB, they can use the -dtb option.
+     * These dtb's will have their memory nodes modified to match QEMU's
+     * selected ram_size option before they get passed to the kernel or fw.
+     *
+     * When loading an OS, we turn on QEMU's PSCI implementation with SMC
+     * as the PSCI conduit. When there's no -kernel, we assume the user
+     * provides EL3 firmware to handle PSCI.
+     */
+    if (machine->kernel_filename) {
+        psci_conduit = QEMU_PSCI_CONDUIT_SMC;
+    }
+
+    memory_region_allocate_system_memory(&s->mr_ddr, NULL, "ddr",
+                                         machine->ram_size);
+
+    sysbus_init_child_obj(OBJECT(machine), "xlnx-ve", &s->soc,
+                          sizeof(s->soc), TYPE_XLNX_VERSAL);
+    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->mr_ddr),
+                             "ddr", &error_abort);
+    object_property_set_int(OBJECT(&s->soc), psci_conduit,
+                            "psci-conduit", &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_fatal);
+
+    fdt_create(s);
+    create_virtio_regions(s);
+    fdt_add_gem_nodes(s);
+    fdt_add_uart_nodes(s);
+    fdt_add_gic_nodes(s);
+    fdt_add_timer_nodes(s);
+    fdt_add_cpu_nodes(s, psci_conduit);
+    fdt_add_clk_node(s, "/clk125", 125000000, s->phandle.clk_125Mhz);
+    fdt_add_clk_node(s, "/clk25", 25000000, s->phandle.clk_25Mhz);
+
+    /* Make the APU cpu address space visible to virtio and other
+     * modules unaware of muliple address-spaces.  */
+    memory_region_add_subregion_overlap(get_system_memory(),
+                                        0, &s->soc.fpd.apu.mr, 0);
+
+    s->binfo.ram_size = machine->ram_size;
+    s->binfo.kernel_filename = machine->kernel_filename;
+    s->binfo.kernel_cmdline = machine->kernel_cmdline;
+    s->binfo.initrd_filename = machine->initrd_filename;
+    s->binfo.loader_start = 0x0;
+    s->binfo.get_dtb = versal_virt_get_dtb;
+    s->binfo.modify_dtb = versal_virt_modify_dtb;
+    if (machine->kernel_filename) {
+        arm_load_kernel(s->soc.fpd.apu.cpu[0], &s->binfo);
+    } else {
+        AddressSpace *as = arm_boot_address_space(s->soc.fpd.apu.cpu[0],
+                                                  &s->binfo);
+        /* Some boot-loaders (e.g u-boot) don't like blobs at address 0 (NULL).
+         * Offset things by 4K.  */
+        s->binfo.loader_start = 0x1000;
+        s->binfo.dtb_limit = 0x1000000;
+        if (arm_load_dtb(s->binfo.loader_start,
+                         &s->binfo, s->binfo.dtb_limit, as) < 0) {
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
+static void versal_virt_machine_instance_init(Object *obj)
+{
+}
+
+static void versal_virt_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "Xilinx Versal Virtual development board";
+    mc->init = versal_virt_init;
+    mc->max_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->default_cpus = XLNX_VERSAL_NR_ACPUS;
+    mc->no_cdrom = true;
+}
+
+static const TypeInfo versal_virt_machine_init_typeinfo = {
+    .name       = TYPE_XLNX_VERSAL_VIRT_MACHINE,
+    .parent     = TYPE_MACHINE,
+    .class_init = versal_virt_machine_class_init,
+    .instance_init = versal_virt_machine_instance_init,
+    .instance_size = sizeof(VersalVirt),
+};
+
+static void versal_virt_machine_init_register_types(void)
+{
+    type_register_static(&versal_virt_machine_init_typeinfo);
+}
+
+type_init(versal_virt_machine_init_register_types)
+
-- 
2.17.1

