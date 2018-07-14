Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp656380wrq;
        Sat, 14 Jul 2018 10:27:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc7ibn4+rkKZNlFyVruqPuwr7nS1SarjRKn4UgO7mA9ufM2xhYjCvJsFjse1nrczVuDS5eA
X-Received: by 2002:a37:434c:: with SMTP id q73-v6mr9257483qka.339.1531589225069;
        Sat, 14 Jul 2018 10:27:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589225; cv=none;
        d=google.com; s=arc-20160816;
        b=Wcy0NTy8vYoWXNaxiOYEbLhQcl54Hg9nN09VFQAM1YZe+Qj2/VknCasYlzwWzFKkAw
         hOlDcQ4TNM/40CEaAZLKkq63nu/0zNP56ubT2QEtbxbNAAPZufnsMa6OwuxJ9J2e/8D+
         t8/70i536VSqOYoihGH2FMpmNrcaXVlevWfvHo3POsMBM9qAdlM9HPTpcQjDTVLrzv51
         9DWVX72s7xkND6KovhIQ8vJwJr8QWkKRyGKOk88e3ir0uHQXaWhhkmj8FUyzcNoI39uV
         xLU3b+6sQP4IC0lG6Fgr0BhneJQlxcrYi2GUbzgfuQ6/9jnQdtcYKhKXAuIMMdK+v1dL
         bUvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=oOmH5NMAWgbzlxwdpVKVO/68/Tb/7cUfm9Exz63x1ME=;
        b=zWEVfOlbxahbX92pfQbhhxSl8C5UCK3X9iExd+JJ0kozUyxXaqJj5HbF/BJe72jJOM
         Xhmv78T80/TWSA9d/4J+vEoHx0I09793Kd0GVCIEMGdJvcTdio7sUOlUSCCxChzHF7Mp
         OxQQ/EJdyicbOeYpWB2axtoHIOHpDcNvmbeIKvfvQZ2PU7O6ufc7zytqx9DNesn52J28
         ZqjpxQ3A3Bl523GQVn+9v/hMEcw6ytT5IETQvvNOxAPHjuTT7EvY1miJbGrctVZQgRSV
         GGrNvYmCvKCdkVrQd93NUwrwyAjCZLPKd8S2cftHYw7QE0+9sRNht2NPZjIZ/uyTspsU
         UEkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BQZejTEA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zr720Jp7;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zr720Jp7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r124-v6si16280264qkc.191.2018.07.14.10.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:27:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BQZejTEA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zr720Jp7;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zr720Jp7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOK0-0005aq-Jp
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9z-0005uZ-SM
	for qemu-devel@nongnu.org; Sat, 14 Jul 2018 13:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9y-0004kv-6A
	for qemu-devel@nongnu.org; Sat, 14 Jul 2018 13:16:43 -0400
Received: from greensocs.com ([193.104.36.180]:57416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9r-0004cD-Jh; Sat, 14 Jul 2018 13:16:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 14815C7ADD;
	Sat, 14 Jul 2018 19:16:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588595;
	bh=esp1nOyziMiRlTKv5G+V138lxt+39GJFnBP+noIkr2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BQZejTEAWduDMNB0UQXCIIPNbnkMBvnn7nURXvJnbzYx00WMpxqxof4bdROd50fF9
	y0solfs2UrYsuM9dbYesg8tpRAXH4DSx3e/2LdSJIB1Ttu4oUUZ3BzQDXRAg9guGMl
	pnOc9yB3yP4JjtJYJveoyvUeNX+GbB5S3ourqsAQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zr720Jp7;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zr720Jp7
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kTOvSzRLzl1R; Sat, 14 Jul 2018 19:16:34 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D20EAC7AF4; Sat, 14 Jul 2018 19:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588593;
	bh=esp1nOyziMiRlTKv5G+V138lxt+39GJFnBP+noIkr2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zr720Jp7T2iVeCWfj0au9CDN3AmlzWSzw+Rf5/FfY2GfDZYS4S62tJ3mql1Bk9oCX
	NTzKc8xhBqoGn708mV2E2+trg4ITOhHXA3tt8DZeNpXXgb/XhRe5o4XdbgOHHhgTfH
	4XWcN+esmSzBhE+qM4wEkjXr+xiXOP/Y5hvJNB/o=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 11F6EC7AFC;
	Sat, 14 Jul 2018 19:16:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588593;
	bh=esp1nOyziMiRlTKv5G+V138lxt+39GJFnBP+noIkr2s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zr720Jp7T2iVeCWfj0au9CDN3AmlzWSzw+Rf5/FfY2GfDZYS4S62tJ3mql1Bk9oCX
	NTzKc8xhBqoGn708mV2E2+trg4ITOhHXA3tt8DZeNpXXgb/XhRe5o4XdbgOHHhgTfH
	4XWcN+esmSzBhE+qM4wEkjXr+xiXOP/Y5hvJNB/o=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:16:01 +0200
Message-Id: <20180714171601.5734-21-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v4 20/20] arm/virt: Add support for GICv2
 virtualization extensions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xNE9gp8jm9K+

Add support for GICv2 virtualization extensions by mapping the necessary
I/O regions and connecting the maintenance IRQ lines.

Declare those additions in the device tree and in the ACPI tables.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/arm/virt-acpi-build.c |  6 +++--
 hw/arm/virt.c            | 52 +++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |  4 +++-
 3 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2588..ce31abd62c 100644
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
@@ -668,8 +670,8 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
-        if (vms->virt && vms->gic_version == 3) {
-            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
+        if (vms->virt) {
+            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
         }
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e..0807be985c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -131,6 +131,8 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
     [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
+    [VIRT_GIC_HYP] =            { 0x08030000, 0x00010000 },
+    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00010000 },
     /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
     [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
     /* This redistributor space allows up to 2*64kB*123 CPUs */
@@ -440,18 +442,33 @@ static void fdt_add_gic_node(VirtMachineState *vms)
 
         if (vms->virt) {
             qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
-                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GICV3_MAINT_IRQ,
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
                                    GIC_FDT_IRQ_FLAGS_LEVEL_HI);
         }
     } else {
         /* 'cortex-a15-gic' means 'GIC v2' */
         qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
                                 "arm,cortex-a15-gic");
-        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
-                                      2, vms->memmap[VIRT_GIC_DIST].base,
-                                      2, vms->memmap[VIRT_GIC_DIST].size,
-                                      2, vms->memmap[VIRT_GIC_CPU].base,
-                                      2, vms->memmap[VIRT_GIC_CPU].size);
+        if (!vms->virt) {
+            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_CPU].base,
+                                         2, vms->memmap[VIRT_GIC_CPU].size);
+        } else {
+            qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
+                                         2, vms->memmap[VIRT_GIC_DIST].base,
+                                         2, vms->memmap[VIRT_GIC_DIST].size,
+                                         2, vms->memmap[VIRT_GIC_CPU].base,
+                                         2, vms->memmap[VIRT_GIC_CPU].size,
+                                         2, vms->memmap[VIRT_GIC_HYP].base,
+                                         2, vms->memmap[VIRT_GIC_HYP].size,
+                                         2, vms->memmap[VIRT_GIC_VCPU].base,
+                                         2, vms->memmap[VIRT_GIC_VCPU].size);
+            qemu_fdt_setprop_cells(vms->fdt, nodename, "interrupts",
+                                   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                                   GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+        }
     }
 
     qemu_fdt_setprop_cell(vms->fdt, nodename, "phandle", vms->gic_phandle);
@@ -573,6 +590,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
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
@@ -584,6 +606,10 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
+        if (vms->virt) {
+            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
+            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
+        }
     }
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
@@ -610,9 +636,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
                                                    ppibase + timer_irq[irq]));
         }
 
-        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
-                                    qdev_get_gpio_in(gicdev, ppibase
-                                                     + ARCH_GICV3_MAINT_IRQ));
+        if (type == 3) {
+            qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                            ppibase + ARCH_GIC_MAINT_IRQ);
+            qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt",
+                                        0, irq);
+        } else if (vms->virt) {
+            qemu_irq irq = qdev_get_gpio_in(gicdev,
+                                            ppibase + ARCH_GIC_MAINT_IRQ);
+            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+        }
+
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
                                     qdev_get_gpio_in(gicdev, ppibase
                                                      + VIRTUAL_PMU_IRQ));
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870ccb6a..4cc57a7ef6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -42,7 +42,7 @@
 #define NUM_VIRTIO_TRANSPORTS 32
 #define NUM_SMMU_IRQS          4
 
-#define ARCH_GICV3_MAINT_IRQ  9
+#define ARCH_GIC_MAINT_IRQ  9
 
 #define ARCH_TIMER_VIRT_IRQ   11
 #define ARCH_TIMER_S_EL1_IRQ  13
@@ -60,6 +60,8 @@ enum {
     VIRT_GIC_DIST,
     VIRT_GIC_CPU,
     VIRT_GIC_V2M,
+    VIRT_GIC_HYP,
+    VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
     VIRT_GIC_REDIST2,
-- 
2.18.0

