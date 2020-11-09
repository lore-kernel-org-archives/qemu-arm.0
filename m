Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3262665lfb;
        Sun, 8 Nov 2020 19:08:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbmOUfoD/HpJWoQAHAb4VKAMYj8TkyCfprcYLpukw292MHW3IMwCbK7X4Ug9MTsvmoyDSw
X-Received: by 2002:ac8:43d8:: with SMTP id w24mr11908553qtn.55.1604891285712;
        Sun, 08 Nov 2020 19:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891285; cv=none;
        d=google.com; s=arc-20160816;
        b=TDdMZAE3d7D3k+qM+YWg8wpacYBPsVeDvJ33tMJCXDqSUGxfJGpP1m32pvJJeLhG6n
         d44ehvFiVKLbvfCbGmNmOH4aCgmZ6cVnXRPFhIlaeik8Er3h9hhXjuyxWdh1KQmaWHDt
         vgJzv6ZCz+OuN7cO+TfECDdYtahkBSstuhpYAPr+EcmAeHU0CY+83LnawUGdENZ7OV8Z
         CjfoSFIQq54D5xj1k5voYnABFa+p4rvC3Qb06OZNGEvL3TvWUzuV1N6R7J6tdZqXp4Kq
         HP9b2L76A+R0x7cbKks7hBPsnS9ZLreDFVvxs7OxIkbwpc/hyt3+04sowiTB+kMGbhFW
         4AUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=m1dlFFlS8rafCOWIcHEUtgvuCuTeLeczu9Novz4RGZs=;
        b=oUo6Ts1JUOC8HQVqioFkfsmObIjfxJzttmLtHoOXJAvnuzYMaI5Pn/8BoXfZ9bkplM
         oNxEFt7xGHoY3nAA6ujnSFv2FytMGJMbHXuU4jUCPR9j4x2/RSP8F1d1NmUV77GUu39K
         hXFJhRIl1R3HZxgaR9DuNsLlppzVn7GgSeUMQ95nfPUbuDU2Ie1uNT+cbOy+ENSyIt7d
         RQYK6+VlyTkNhYobmDMxoMdr4fkWaK7tbMqT2FiHmUJQctp+OVRSCzXFAS94jZ3AMfWs
         IrNZRWI1WVTze+00CcZ69RSgj2+OxBhO4RZledtZGpcsWGEtCv99EoBxvBqbqyU/8Ipk
         hhIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si4305904qkg.331.2020.11.08.19.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxXI-0005d3-Un
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUu-0001gB-BI; Sun, 08 Nov 2020 22:05:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUo-0006aZ-1f; Sun, 08 Nov 2020 22:05:35 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpY5vJ8z15SgR;
 Mon,  9 Nov 2020 11:05:09 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:09 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 01/13] hw/arm/virt: Spell out smp.cpus and smp.max_cpus
Date: Mon, 9 Nov 2020 11:04:40 +0800
Message-ID: <20201109030452.2197-2-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1+LfpdeNCF67

From: Andrew Jones <drjones@redhat.com>

Prefer to spell out the smp.cpus and smp.max_cpus machine state
variables in order to make grepping easier and to avoid any
confusion as to what cpu count is being used where.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c |  8 +++----
 hw/arm/virt.c            | 51 +++++++++++++++++++---------------------
 include/hw/arm/virt.h    |  2 +-
 3 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9747a6458f..a222981737 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -57,11 +57,11 @@
 
 #define ARM_SPI_BASE 32
 
-static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
+static void acpi_dsdt_add_cpus(Aml *scope, int cpus)
 {
     uint16_t i;
 
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < cpus; i++) {
         Aml *dev = aml_device("C%.03X", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
@@ -480,7 +480,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = vms->gic_version;
 
-    for (i = 0; i < vms->smp_cpus; i++) {
+    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
         AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
                                                            sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -599,7 +599,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
+    acpi_dsdt_add_cpus(scope, ms->smp.cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     if (vmc->acpi_expose_flash) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e465a988d6..0069fa1298 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -322,7 +322,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << vms->smp_cpus) - 1);
+                             (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
     qemu_fdt_add_subnode(vms->fdt, "/timer");
@@ -363,7 +363,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
      *  The simplest way to go is to examine affinity IDs of all our CPUs. If
      *  at least one of them has Aff3 populated, we set #address-cells to 2.
      */
-    for (cpu = 0; cpu < vms->smp_cpus; cpu++) {
+    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
 
         if (armcpu->mp_affinity & ARM_AFF3_MASK) {
@@ -376,7 +376,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
 
-    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
+    for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
         CPUState *cs = CPU(armcpu);
@@ -387,7 +387,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                                     armcpu->dtb_compatible);
 
         if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
-            && vms->smp_cpus > 1) {
+            && ms->smp.cpus > 1) {
             qemu_fdt_setprop_string(vms->fdt, nodename,
                                         "enable-method", "psci");
         }
@@ -533,7 +533,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
     if (vms->gic_version == VIRT_GIC_VERSION_2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << vms->smp_cpus) - 1);
+                             (1 << MACHINE(vms)->smp.cpus) - 1);
     }
 
     qemu_fdt_add_subnode(vms->fdt, "/pmu");
@@ -622,14 +622,13 @@ static void create_gic(VirtMachineState *vms)
     SysBusDevice *gicbusdev;
     const char *gictype;
     int type = vms->gic_version, i;
-    unsigned int smp_cpus = ms->smp.cpus;
     uint32_t nb_redist_regions = 0;
 
     gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
 
     vms->gic = qdev_new(gictype);
     qdev_prop_set_uint32(vms->gic, "revision", type);
-    qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(vms->gic, "num-cpu", ms->smp.cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -641,7 +640,7 @@ static void create_gic(VirtMachineState *vms)
     if (type == 3) {
         uint32_t redist0_capacity =
                     vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
-        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
+        uint32_t redist0_count = MIN(ms->smp.cpus, redist0_capacity);
 
         nb_redist_regions = virt_gicv3_redist_region_count(vms);
 
@@ -654,7 +653,7 @@ static void create_gic(VirtMachineState *vms)
                     vms->memmap[VIRT_HIGH_GIC_REDIST2].size / GICV3_REDIST_SIZE;
 
             qdev_prop_set_uint32(vms->gic, "redist-region-count[1]",
-                MIN(smp_cpus - redist0_count, redist1_capacity));
+                MIN(ms->smp.cpus - redist0_count, redist1_capacity));
         }
     } else {
         if (!kvm_irqchip_in_kernel()) {
@@ -683,7 +682,7 @@ static void create_gic(VirtMachineState *vms)
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < ms->smp.cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
@@ -711,7 +710,7 @@ static void create_gic(VirtMachineState *vms)
         } else if (vms->virt) {
             qemu_irq irq = qdev_get_gpio_in(vms->gic,
                                             ppibase + ARCH_GIC_MAINT_IRQ);
-            sysbus_connect_irq(gicbusdev, i + 4 * smp_cpus, irq);
+            sysbus_connect_irq(gicbusdev, i + 4 * ms->smp.cpus, irq);
         }
 
         qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
@@ -719,11 +718,11 @@ static void create_gic(VirtMachineState *vms)
                                                      + VIRTUAL_PMU_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + ms->smp.cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
-        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 2 * ms->smp.cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
-        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + 3 * ms->smp.cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VFIQ));
     }
 
@@ -1572,7 +1571,7 @@ static void virt_set_memmap(VirtMachineState *vms)
  */
 static void finalize_gic_version(VirtMachineState *vms)
 {
-    unsigned int max_cpus = MACHINE(vms)->smp.max_cpus;
+    MachineState *ms = MACHINE(vms);
 
     if (kvm_enabled()) {
         int probe_bitmap;
@@ -1613,7 +1612,8 @@ static void finalize_gic_version(VirtMachineState *vms)
             }
             return;
         case VIRT_GIC_VERSION_NOSEL:
-            if ((probe_bitmap & KVM_ARM_VGIC_V2) && max_cpus <= GIC_NCPU) {
+            if ((probe_bitmap & KVM_ARM_VGIC_V2) &&
+                ms->smp.max_cpus <= GIC_NCPU) {
                 vms->gic_version = VIRT_GIC_VERSION_2;
             } else if (probe_bitmap & KVM_ARM_VGIC_V3) {
                 /*
@@ -1622,7 +1622,7 @@ static void finalize_gic_version(VirtMachineState *vms)
                  * to v3. In any case defaulting to v2 would be broken.
                  */
                 vms->gic_version = VIRT_GIC_VERSION_3;
-            } else if (max_cpus > GIC_NCPU) {
+            } else if (ms->smp.max_cpus > GIC_NCPU) {
                 error_report("host only supports in-kernel GICv2 emulation "
                              "but more than 8 vcpus are requested");
                 exit(1);
@@ -1743,8 +1743,6 @@ static void machvirt_init(MachineState *machine)
     bool firmware_loaded;
     bool aarch64 = true;
     bool has_ged = !vmc->no_ged;
-    unsigned int smp_cpus = machine->smp.cpus;
-    unsigned int max_cpus = machine->smp.max_cpus;
 
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
@@ -1815,10 +1813,10 @@ static void machvirt_init(MachineState *machine)
         virt_max_cpus = GIC_NCPU;
     }
 
-    if (max_cpus > virt_max_cpus) {
+    if (machine->smp.max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
-                     max_cpus, virt_max_cpus);
+                     machine->smp.max_cpus, virt_max_cpus);
         exit(1);
     }
 
@@ -1843,7 +1841,7 @@ static void machvirt_init(MachineState *machine)
         Object *cpuobj;
         CPUState *cs;
 
-        if (n >= smp_cpus) {
+        if (n >= machine->smp.cpus) {
             break;
         }
 
@@ -2015,7 +2013,7 @@ static void machvirt_init(MachineState *machine)
     }
 
     vms->bootinfo.ram_size = machine->ram_size;
-    vms->bootinfo.nb_cpus = smp_cpus;
+    vms->bootinfo.nb_cpus = machine->smp.cpus;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
@@ -2208,17 +2206,16 @@ static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
 static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
 {
     int n;
-    unsigned int max_cpus = ms->smp.max_cpus;
     VirtMachineState *vms = VIRT_MACHINE(ms);
 
     if (ms->possible_cpus) {
-        assert(ms->possible_cpus->len == max_cpus);
+        assert(ms->possible_cpus->len == ms->smp.max_cpus);
         return ms->possible_cpus;
     }
 
     ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
-                                  sizeof(CPUArchId) * max_cpus);
-    ms->possible_cpus->len = max_cpus;
+                                  sizeof(CPUArchId) * ms->smp.max_cpus);
+    ms->possible_cpus->len = ms->smp.max_cpus;
     for (n = 0; n < ms->possible_cpus->len; n++) {
         ms->possible_cpus->cpus[n].type = ms->cpu_type;
         ms->possible_cpus->cpus[n].arch_id =
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index aad6d69841..953d94acc0 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -181,7 +181,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
 
     assert(vms->gic_version == VIRT_GIC_VERSION_3);
 
-    return vms->smp_cpus > redist0_capacity ? 2 : 1;
+    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
 }
 
 #endif /* QEMU_ARM_VIRT_H */
-- 
2.23.0

