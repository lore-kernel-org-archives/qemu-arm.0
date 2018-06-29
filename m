Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730928wrq;
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcOnWr/7REIYX3tkhSdUfYW0xcNtGey6++eWBNEu0oWPaIJoNEnHGLIQownQKOUXnSG5gRy
X-Received: by 2002:a37:40d3:: with SMTP id n202-v6mr13296632qka.365.1530279122516;
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279122; cv=none;
        d=google.com; s=arc-20160816;
        b=La/W3To0IZq0ignpTwT8sXZhPaDg8vLdRwIKPqHNawcXjUxO/Hdqv6/SJmavOBVfyI
         rGQBsQSmBLa7mdFvYXWzExDqGZ8ic8ANaEZCGdQaQ0hLAh7bdwzDMv5be9H6NnigHRii
         oZMrUt8mjDoIZDhz4F8N0PZOU67C0fxgUivQys9UMr/WBsNV/ZpoFLAO+wpMdugXKlQX
         R7+vT8upJX/eYxutMbyDzeqEyAgYB3pPkg5EMkGrFBqXt3ga5Zr14PrGhjEVCfyziGWp
         sGEr1jE0ndt6dlGb/dvbGgMvWzxK2xjoNCboiavVUW4iAHDugirpn9ltbUpHom/Hz/xD
         YrQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=kuDCfjjBO77ziuinudeuTMIlI+tPcu2oq0DnG/BpS84=;
        b=kkV05vPnRJstK17gtk41dvjgKZR2TaxGCJN0YO68Tvb9e90c76ia0jkAAQIViReBHq
         EYHaGXtIbTc2ZiZvUTk+DzPU9Zj/T7p8ZcxKJJgMN5twOwr3HfunpkGumYkWS+R3/2uG
         mcrh3Uum7BgxM80pl/5CZERGRxboyNzwTuEq5ioGRUN2p0Wwbe7fanlp9DF+Mm3YH/aN
         jW+lLyAOedY4fBqW05mFjYPvm+yfy0h/s4b4DjSVw/JcxeHM/bYkQNlDNOE1/OHtW1MN
         qk3v3T4/SrABIQvFenNJseDQdnd50w5oF45hgLw75a2Pq2u7R7sbpkD6Rdg9+KbuW5zj
         DsQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=X74LQXq5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sQ6J4Ovi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sQ6J4Ovi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r185-v6si7198688qkf.310.2018.06.29.06.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=X74LQXq5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sQ6J4Ovi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=sQ6J4Ovi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVJ-0008Ns-Rl
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtUE-0007f6-SM
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU4-0006xX-VU
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:54 -0400
Received: from greensocs.com ([193.104.36.180]:58658)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU4-0006v9-JD; Fri, 29 Jun 2018 09:30:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 054B4443496;
	Fri, 29 Jun 2018 15:30:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279044;
	bh=Hcm6iL2d/lKqBaMAJY5X4I3zo8s+b1ZDK/eC0Gwqqm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X74LQXq5cKH6n5ko6ejMCYxgEctVvYcv8lOFPsRXWBlCdcTI0KckdIQuDIqOWSZCY
	GONIliY58Gb4ZmO6R1MwbvRjONBAn2q6RqMz6wPIvIJeVnibjvTMnHGRUZ2cQh4PKo
	m2km4+gLOrGzWAPVUQeoxuQ9DaK6u8HlvumyG+zI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sQ6J4Ovi;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=sQ6J4Ovi
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gkue42HIsZWZ; Fri, 29 Jun 2018 15:30:43 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EA6D64434AB; Fri, 29 Jun 2018 15:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279042;
	bh=Hcm6iL2d/lKqBaMAJY5X4I3zo8s+b1ZDK/eC0Gwqqm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sQ6J4OvioQ3L+ZtrgTtKhPx6/D8vDBwNv3l2u72F9wDrb0DjwFDmJnbQiUUoarFHM
	yEFYHJ5/BkjbbHhma84yXOa20naNQvmSPrCGMsDquIax6QitZf8Q8sTWpB1u4m7szp
	KlYqDXmAbq9E2Bq8T/qdgmthzUudpzbEdsa6ar34=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 702444434A8;
	Fri, 29 Jun 2018 15:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279042;
	bh=Hcm6iL2d/lKqBaMAJY5X4I3zo8s+b1ZDK/eC0Gwqqm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sQ6J4OvioQ3L+ZtrgTtKhPx6/D8vDBwNv3l2u72F9wDrb0DjwFDmJnbQiUUoarFHM
	yEFYHJ5/BkjbbHhma84yXOa20naNQvmSPrCGMsDquIax6QitZf8Q8sTWpB1u4m7szp
	KlYqDXmAbq9E2Bq8T/qdgmthzUudpzbEdsa6ar34=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:54 +0200
Message-Id: <20180629132954.24269-21-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: px1KCiOvexMS

Add support for GICv2 virtualization extensions by mapping the necessary
I/O regions and connecting the maintenance IRQ lines.

Declare those additions in the device tree and in the ACPI tables.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/arm/virt-acpi-build.c |  4 ++++
 hw/arm/virt.c            | 50 +++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |  3 +++
 3 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2588..3b74bf0372 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -659,6 +659,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         gicc->length = sizeof(*gicc);
         if (vms->gic_version == 2) {
             gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
+            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
+            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
         }
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
@@ -670,6 +672,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         }
         if (vms->virt && vms->gic_version == 3) {
             gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
+        } else if (vms->virt && vms->gic_version == 2) {
+            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV2_MAINT_IRQ));
         }
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 742f68afca..e45b9de3be 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
     [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
+    [VIRT_GIC_HYP] =            { 0x08030000, 0x00001000 },
+    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00001000 },
     /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
     [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
     /* This redistributor space allows up to 2*64kB*123 CPUs */
@@ -438,11 +440,26 @@ static void fdt_add_gic_node(VirtMachineState *vms)
         /* 'cortex-a15-gic' means 'GIC v2' */
         qemu_fdt_setprop_string(vms->fdt, "/intc", "compatible",
                                 "arm,cortex-a15-gic");
-        qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
-                                      2, vms->memmap[VIRT_GIC_DIST].base,
-                                      2, vms->memmap[VIRT_GIC_DIST].size,
-                                      2, vms->memmap[VIRT_GIC_CPU].base,
-                                      2, vms->memmap[VIRT_GIC_CPU].size);
+        if (!vms->virt) {
+            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_CPU].base,
+                                         2, vms->memmap[VIRT_GIC_CPU].size);
+        } else {
+            qemu_fdt_setprop_sized_cells(vms->fdt, "/intc", "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_CPU].base,
+                                         2, vms->memmap[VIRT_GIC_CPU].size,
+                                         2, vms->memmap[VIRT_GIC_HYP].base,
+                                         2, vms->memmap[VIRT_GIC_HYP].size,
+                                         2, vms->memmap[VIRT_GIC_VCPU].base,
+                                         2, vms->memmap[VIRT_GIC_VCPU].size);
+            qemu_fdt_setprop_cells(vms->fdt, "/intc", "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV2_MAINT_IRQ,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        }
     }
 
     qemu_fdt_setprop_cell(vms->fdt, "/intc", "phandle", vms->gic_phandle);
@@ -563,6 +580,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
             qdev_prop_set_uint32(gicdev, "redist-region-count[1]",
                 MIN(smp_cpus - redist0_count, redist1_capacity));
         }
+    } else {
+        if (!kvm_irqchip_in_kernel()) {
+            qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
+                              vms->virt);
+        }
     }
     qdev_init_nofail(gicdev);
     gicbusdev = SYS_BUS_DEVICE(gicdev);
@@ -574,6 +596,10 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
+        if (vms->virt) {
+            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
+            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
+        }
     }
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
@@ -600,9 +626,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
                                                    ppibase + timer_irq[irq]));
         }
 
-        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
-                                    qdev_get_gpio_in(gicdev, ppibase
-                                                     + ARCH_GICV3_MAINT_IRQ));
+        if (type == 3) {
+            qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                            ppibase + ARCH_GICV3_MAINT_IRQ);
+            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                        0, irq);
+        } else if (vms->virt) {
+            qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                            ppibase + ARCH_GICV2_MAINT_IRQ);
+            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+        }
+
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
                                     qdev_get_gpio_in(gicdev, ppibase
                                                      + VIRTUAL_PMU_IRQ));
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870ccb6a..9e2f33f2d1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -42,6 +42,7 @@
 #define NUM_VIRTIO_TRANSPORTS 32
 #define NUM_SMMU_IRQS          4
 
+#define ARCH_GICV2_MAINT_IRQ  9
 #define ARCH_GICV3_MAINT_IRQ  9
 
 #define ARCH_TIMER_VIRT_IRQ   11
@@ -60,6 +61,8 @@ enum {
     VIRT_GIC_DIST,
     VIRT_GIC_CPU,
     VIRT_GIC_V2M,
+    VIRT_GIC_HYP,
+    VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
     VIRT_GIC_REDIST2,
-- 
2.17.1

