Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507706wru;
        Fri, 27 Jul 2018 02:56:19 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdujBc7JoJZJNNaMcADA6VWUWas5otJgGQimXnsukrnIp9z7ZjpxqxS1kL7+GI5zAV+5++7
X-Received: by 2002:a37:4f4b:: with SMTP id d72-v6mr5188569qkb.17.1532685379246;
        Fri, 27 Jul 2018 02:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685379; cv=none;
        d=google.com; s=arc-20160816;
        b=GiMgXCd3yZPYhX13ThjpgPWUtFC77tSUtdKKhBkzV+vrHJfA/8w9jMf9cVLdlytENV
         QetfMWVF9Nk+JLbCFvMWExRwpUfJS51m35jEbn7gUqbi3KRLhYBM06aWmWhdpDT1AB85
         UrjkVk3FRXc4s8+iqq8ZfhZO2qvEv5ZOWujORjgIIqFNMop+o04g06oDQ1Niy5kZFt3/
         gY1VGF/gZGvEJ8A92DP70YPrP/0v+btiYADKIJjvKqfLCWD3vSmT83W/j8S9T7mvyUWz
         qNLzgIr3rjOhmaFdl5aHUioHzIjXMk7W+MZfobxMTAH35T61Pvlp7x879gH7VRL9zRNN
         Tgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=8nD3b0RP7rZBu5oZf1z73Bfn4XIj9qiI2aZMeX/vLSk=;
        b=C8+h4md8YMciUowzz0T2yEU5IPptxiccxAGwWp2vxep+4Vp065IEi876bbYhwRs07v
         p18j0Uvvkckw8ws+NzhuzsagG4Bl/rfHLUZfKRd6jtJGTPHxjmKpOzrVJVShgp+6qtHz
         9xBMd6qpNouXnPUX7HM5TvAW0JIGHbdSD5bBcqlztrHkbkezTQa68VwdeD2gdFj/kcdL
         Iaf1Jd/oQe54qXB1lU1JT3/Q7BHjaN/WRULl2nbm5dJk8aKRjIrwf9OvT+KSUGm4Vwkb
         DeGWCG5xuUwCSf+hATFHITdGOihE5Q13FRho9LmiT4CwJAnA9GxhBdCy5G83nqRgZDSI
         Yb7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="5Nt/BstQ";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=o4AOi6QW;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOojs2vF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q39-v6si3573638qtk.363.2018.07.27.02.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="5Nt/BstQ";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=o4AOi6QW;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=JOojs2vF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTu-000535-Mm
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSf-0003d8-Jq
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Cj-W2
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from greensocs.com ([193.104.36.180]:47535)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-0006B0-Kk; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A1732443572;
	Fri, 27 Jul 2018 11:54:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685293;
	bh=uZEKjMi5WZD5BNpHU2rDoZN/EycDavakkg6gt1G4ncg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5Nt/BstQM//qrzpDMhPn3Hv+GUyEKIaMQvD/SSpIzQ+ZmOJ8KOipeFZlLo0RPCbNK
	p4df/vzGKZrMP8KoS3rbjWpkQ7PSafYcePMbu971C1tiR3l+vQIjQMaMJwFwJyaBME
	a/zU0zRzjPSGX0a/Y5k71bEl+vgbjJ9D8kzGn4Q4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=o4AOi6QW;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=JOojs2vF
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHXmSf6Yr7mv; Fri, 27 Jul 2018 11:54:52 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 115A94434A7; Fri, 27 Jul 2018 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685291;
	bh=uZEKjMi5WZD5BNpHU2rDoZN/EycDavakkg6gt1G4ncg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=o4AOi6QWxrzISVlhfkMe23tIvM5TN837lDKFsFfM0+Nt0tB7q2vo0zRRloTq0gJdb
	T9ICQKoA/+zGt+ZJYvo8hUgJsjCw2EgoUORH6P8q+HycI0OVoyq1W5SvHhUfHWygxv
	DRMYjH6mbxkgp03eE2Vh2IJDq7qHXwihd/OzEibw=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9FF92400DC8;
	Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=uZEKjMi5WZD5BNpHU2rDoZN/EycDavakkg6gt1G4ncg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JOojs2vFMlGcXXJn0Hs6RTAnRHZfaQ5IbMXY+dBRRWxnN1VKcvRWPzvQkxRk3JUU2
	8l5ZsR1RlskSkmM98dNP6KQw7BKRuAtVnhYo1iL5i/87LRpIE9tNIPPmGJ3mjXBt/1
	D/Q4eW/izRwfSxifw2MMzchptU0kpLpFXXeMNJV0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:21 +0200
Message-Id: <20180727095421.386-21-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 20/20] arm/virt: Add support for GICv2
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
X-TUID: vp16W8UB7kjA

Add support for GICv2 virtualization extensions by mapping the necessary
I/O regions and connecting the maintenance IRQ lines.

Declare those additions in the device tree and in the ACPI tables.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c |  6 +++--
 hw/arm/virt.c            | 52 +++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h    |  4 +++-
 3 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2588..ce31abd62c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -657,21 +657,23 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
         gicc->length = sizeof(*gicc);
         if (vms->gic_version == 2) {
             gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
+            gicc->gich_base_address = cpu_to_le64(memmap[VIRT_GIC_HYP].base);
+            gicc->gicv_base_address = cpu_to_le64(memmap[VIRT_GIC_VCPU].base);
         }
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
         gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
-        if (vms->virt && vms->gic_version == 3) {
-            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
+        if (vms->virt) {
+            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GIC_MAINT_IRQ));
         }
     }
 
     if (vms->gic_version == 3) {
         AcpiMadtGenericTranslator *gic_its;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 281ddcdf6e..0807be985c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -129,10 +129,12 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_CPUPERIPHS] =         { 0x08000000, 0x00020000 },
     /* GIC distributor and CPU interfaces sit inside the CPU peripheral space */
     [VIRT_GIC_DIST] =           { 0x08000000, 0x00010000 },
     [VIRT_GIC_CPU] =            { 0x08010000, 0x00010000 },
     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 },
+    [VIRT_GIC_HYP] =            { 0x08030000, 0x00010000 },
+    [VIRT_GIC_VCPU] =           { 0x08040000, 0x00010000 },
     /* The space in between here is reserved for GICv3 CPU/vCPU/HYP */
     [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
     /* This redistributor space allows up to 2*64kB*123 CPUs */
     [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
@@ -438,22 +440,37 @@ static void fdt_add_gic_node(VirtMachineState *vms)
                                          2, vms->memmap[VIRT_GIC_REDIST2].size);
         }
 
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
     g_free(nodename);
 }
@@ -571,10 +588,15 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
                         vms->memmap[VIRT_GIC_REDIST2].size / GICV3_REDIST_SIZE;
 
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
     sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
     if (type == 3) {
@@ -582,10 +604,14 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
         if (nb_redist_regions == 2) {
             sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].base);
         }
     } else {
         sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
+        if (vms->virt) {
+            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_HYP].base);
+            sysbus_mmio_map(gicbusdev, 3, vms->memmap[VIRT_GIC_VCPU].base);
+        }
     }
 
     /* Wire the outputs from each CPU's generic timer and the GICv3
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
@@ -608,13 +634,21 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
             qdev_connect_gpio_out(cpudev, irq,
                                   qdev_get_gpio_in(gicdev,
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
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9a870ccb6a..4cc57a7ef6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -40,11 +40,11 @@
 
 #define NUM_GICV2M_SPIS       64
 #define NUM_VIRTIO_TRANSPORTS 32
 #define NUM_SMMU_IRQS          4
 
-#define ARCH_GICV3_MAINT_IRQ  9
+#define ARCH_GIC_MAINT_IRQ  9
 
 #define ARCH_TIMER_VIRT_IRQ   11
 #define ARCH_TIMER_S_EL1_IRQ  13
 #define ARCH_TIMER_NS_EL1_IRQ 14
 #define ARCH_TIMER_NS_EL2_IRQ 10
@@ -58,10 +58,12 @@ enum {
     VIRT_MEM,
     VIRT_CPUPERIPHS,
     VIRT_GIC_DIST,
     VIRT_GIC_CPU,
     VIRT_GIC_V2M,
+    VIRT_GIC_HYP,
+    VIRT_GIC_VCPU,
     VIRT_GIC_ITS,
     VIRT_GIC_REDIST,
     VIRT_GIC_REDIST2,
     VIRT_SMMU,
     VIRT_UART,
-- 
2.18.0

