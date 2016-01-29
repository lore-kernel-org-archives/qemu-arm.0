Received: by 10.25.159.19 with SMTP id i19csp977437lfe;
        Fri, 29 Jan 2016 06:25:00 -0800 (PST)
X-Received: by 10.140.81.211 with SMTP id f77mr10770547qgd.11.1454077500012;
        Fri, 29 Jan 2016 06:25:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y9si17271989qhb.79.2016.01.29.06.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 06:24:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34536 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aP9yt-0007Ry-7Q
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 09:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aP9yo-0007MA-45
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 09:24:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1aP9yj-00038F-14
	for qemu-arm@nongnu.org; Fri, 29 Jan 2016 09:24:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1aP9yi-00038B-SR; Fri, 29 Jan 2016 09:24:48 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 38DB0C057EC9;
	Fri, 29 Jan 2016 14:24:48 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0TEOkxA015673; Fri, 29 Jan 2016 09:24:46 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jan 2016 15:24:45 +0100
Message-Id: <1454077485-242598-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com
Subject: [Qemu-arm] [PATCH] arm: virt-acpi: each MADT.GICC entry as enabled
	unconditionally
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R+rvvQQq/1+F

in current impl. condition

build_madt() {
  ...
  if (test_bit(i, cpuinfo->found_cpus))

is always true since loop handles only present CPUs
in range [0..smp_cpus).
But to fill usless cpuinfo->found_cpus we do unnecessary
scan over QOM tree to find the same CPUs.
So mark GICC as present always and drop not needed
code that fills cpuinfo->found_cpus.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
It's just simple cleanup but I'm trying to generalize
a bit CPU related ACPI tables and as part of it get rid
of found_cpus bitmap and if possible cpu_index usage
in ACPI parts of code.
---
 hw/arm/virt-acpi-build.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 87fbe7c..3ed39fc 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -46,20 +46,6 @@
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
 
-typedef struct VirtAcpiCpuInfo {
-    DECLARE_BITMAP(found_cpus, VIRT_ACPI_CPU_ID_LIMIT);
-} VirtAcpiCpuInfo;
-
-static void virt_acpi_get_cpu_info(VirtAcpiCpuInfo *cpuinfo)
-{
-    CPUState *cpu;
-
-    memset(cpuinfo->found_cpus, 0, sizeof cpuinfo->found_cpus);
-    CPU_FOREACH(cpu) {
-        set_bit(cpu->cpu_index, cpuinfo->found_cpus);
-    }
-}
-
 static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 {
     uint16_t i;
@@ -458,8 +444,7 @@ build_gtdt(GArray *table_data, GArray *linker)
 
 /* MADT */
 static void
-build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
-           VirtAcpiCpuInfo *cpuinfo)
+build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 {
     int madt_start = table_data->len;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -489,9 +474,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
         gicc->cpu_interface_number = i;
         gicc->arm_mpidr = armcpu->mp_affinity;
         gicc->uid = i;
-        if (test_bit(i, cpuinfo->found_cpus)) {
-            gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
-        }
+        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
     }
 
     if (guest_info->gic_version == 3) {
@@ -599,11 +582,8 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
 {
     GArray *table_offsets;
     unsigned dsdt, rsdt;
-    VirtAcpiCpuInfo cpuinfo;
     GArray *tables_blob = tables->table_data;
 
-    virt_acpi_get_cpu_info(&cpuinfo);
-
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
 
@@ -630,7 +610,7 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
     build_fadt(tables_blob, tables->linker, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, guest_info, &cpuinfo);
+    build_madt(tables_blob, tables->linker, guest_info);
 
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker);
-- 
1.8.3.1

