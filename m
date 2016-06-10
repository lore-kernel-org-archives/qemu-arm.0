Received: by 10.25.85.209 with SMTP id j200csp102312lfb;
        Fri, 10 Jun 2016 10:44:52 -0700 (PDT)
X-Received: by 10.55.171.75 with SMTP id u72mr3220007qke.114.1465580692236;
        Fri, 10 Jun 2016 10:44:52 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d81si6907783qkc.10.2016.06.10.10.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQUF-0001B1-I0
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:44:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQt-0006v7-Qh
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQp-0000XS-1u
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49130)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQZ-0000TU-S9; Fri, 10 Jun 2016 13:41:04 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BA6C65438;
	Fri, 10 Jun 2016 17:41:03 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPd032552; Fri, 10 Jun 2016 13:41:01 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:23 +0200
Message-Id: <1465580427-13596-13-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 10 Jun 2016 17:41:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 12/16] hw/arm/virt: rename *.smp_cpus to
 *.cpus
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Zd9zsgl+eR2

Use the name 'cpus' instead of 'smp_cpus' to be consistent with
MachineState.cpus. This also makes grepping for the global
smp_cpus easier.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c         | 14 +++++++-------
 hw/arm/virt.c                    | 14 +++++++-------
 include/hw/arm/virt-acpi-build.h |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 735ab864a03dd..95dccb2e0c3fa 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -48,11 +48,11 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
-static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
+static void acpi_dsdt_add_cpus(Aml *scope, int nr_cpus)
 {
     uint16_t i;
 
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < nr_cpus; i++) {
         Aml *dev = aml_device("C%03x", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
@@ -423,9 +423,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     AcpiSratMemoryAffinity *numamem;
     int i, j, srat_start;
     uint64_t mem_base;
-    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof(uint32_t));
+    uint32_t *cpu_node = g_malloc0(guest_info->cpus * sizeof(uint32_t));
 
-    for (i = 0; i < guest_info->smp_cpus; i++) {
+    for (i = 0; i < guest_info->cpus; i++) {
         for (j = 0; j < nb_numa_nodes; j++) {
             if (test_bit(i, numa_info[j].node_cpu)) {
                 cpu_node[i] = j;
@@ -438,7 +438,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     srat = acpi_data_push(table_data, sizeof(*srat));
     srat->reserved1 = cpu_to_le32(1);
 
-    for (i = 0; i < guest_info->smp_cpus; ++i) {
+    for (i = 0; i < guest_info->cpus; ++i) {
         core = acpi_data_push(table_data, sizeof(*core));
         core->type = ACPI_SRAT_PROCESSOR_GICC;
         core->length = sizeof(*core);
@@ -524,7 +524,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     gicd->length = sizeof(*gicd);
     gicd->base_address = memmap[VIRT_GIC_DIST].base;
 
-    for (i = 0; i < guest_info->smp_cpus; i++) {
+    for (i = 0; i < guest_info->cpus; i++) {
         AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
                                                      sizeof *gicc);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
@@ -606,7 +606,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
      * the RTC ACPI device at all when using UEFI.
      */
     scope = aml_scope("\\_SB");
-    acpi_dsdt_add_cpus(scope, guest_info->smp_cpus);
+    acpi_dsdt_add_cpus(scope, guest_info->cpus);
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73113cfc4d9c9..78d9aa996bafc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -69,7 +69,7 @@ typedef struct VirtBoardInfo {
     const char *cpu_model;
     const MemMapEntry *memmap;
     const int *irqmap;
-    int smp_cpus;
+    int cpus;
     void *fdt;
     int fdt_size;
     uint32_t clock_phandle;
@@ -304,7 +304,7 @@ static void fdt_add_timer_nodes(const VirtBoardInfo *vbi, int gictype)
     if (gictype == 2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
                              GIC_FDT_IRQ_PPI_CPU_WIDTH,
-                             (1 << vbi->smp_cpus) - 1);
+                             (1 << vbi->cpus) - 1);
     }
 
     qemu_fdt_add_subnode(vbi->fdt, "/timer");
@@ -345,7 +345,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
      *  The simplest way to go is to examine affinity IDs of all our CPUs. If
      *  at least one of them has Aff3 populated, we set #address-cells to 2.
      */
-    for (cpu = 0; cpu < vbi->smp_cpus; cpu++) {
+    for (cpu = 0; cpu < vbi->cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
 
         if (armcpu->mp_affinity & ARM_AFF3_MASK) {
@@ -358,7 +358,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
     qemu_fdt_setprop_cell(vbi->fdt, "/cpus", "#address-cells", addr_cells);
     qemu_fdt_setprop_cell(vbi->fdt, "/cpus", "#size-cells", 0x0);
 
-    for (cpu = vbi->smp_cpus - 1; cpu >= 0; cpu--) {
+    for (cpu = vbi->cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
 
@@ -367,7 +367,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
         qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible",
                                     armcpu->dtb_compatible);
 
-        if (vbi->using_psci && vbi->smp_cpus > 1) {
+        if (vbi->using_psci && vbi->cpus > 1) {
             qemu_fdt_setprop_string(vbi->fdt, nodename,
                                         "enable-method", "psci");
         }
@@ -1170,7 +1170,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    vbi->smp_cpus = smp_cpus;
+    vbi->cpus = smp_cpus;
 
     if (machine->ram_size > vbi->memmap[VIRT_MEM].size) {
         error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
@@ -1281,7 +1281,7 @@ static void machvirt_init(MachineState *machine)
     create_fw_cfg(vbi, &address_space_memory);
     rom_set_fw(fw_cfg_find());
 
-    guest_info->smp_cpus = smp_cpus;
+    guest_info->cpus = smp_cpus;
     guest_info->fw_cfg = fw_cfg_find();
     guest_info->memmap = vbi->memmap;
     guest_info->irqmap = vbi->irqmap;
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index e43330ad659b0..d6c5982960403 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -27,7 +27,7 @@
 #define ACPI_GICC_ENABLED 1
 
 typedef struct VirtGuestInfo {
-    int smp_cpus;
+    int cpus;
     FWCfgState *fw_cfg;
     const MemMapEntry *memmap;
     const int *irqmap;
-- 
2.4.11

