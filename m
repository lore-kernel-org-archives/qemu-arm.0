Received: by 10.25.205.13 with SMTP id d13csp8536445lfg;
        Mon, 2 Jan 2017 12:02:10 -0800 (PST)
X-Received: by 10.55.174.135 with SMTP id x129mr62680227qke.133.1483387330751;
        Mon, 02 Jan 2017 12:02:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r9si25253650qte.176.2017.01.02.12.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8o4-0001Z1-3v
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:02:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8nz-0001Xp-Pb
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8ny-0003lJ-Lq
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43182)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8ny-0003ky-EJ; Mon, 02 Jan 2017 15:02:02 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C72937E64;
	Mon,  2 Jan 2017 20:02:02 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOe017390; Mon, 2 Jan 2017 15:02:00 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:39 +0100
Message-Id: <20170102200153.28864-3-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 02 Jan 2017 20:02:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 02/16] hw/arm/virt-acpi-build: name GIC CPU
 Interface Structure appropriately
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /zgfdnyi2xWg

Also move the enabled flag definition from mach-virt code to
acpi common.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c         | 8 ++++----
 include/hw/acpi/acpi-defs.h      | 9 ++++++---
 include/hw/arm/virt-acpi-build.h | 2 --
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f4b43562287a..0ed406cdd89c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -581,11 +581,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     gicd->version = guest_info->gic_version;
 
     for (i = 0; i < guest_info->smp_cpus; i++) {
-        AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
-                                                     sizeof *gicc);
+        AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
+                                                           sizeof(*gicc));
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
 
-        gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
+        gicc->type = ACPI_APIC_GENERIC_CPU_INTERFACE;
         gicc->length = sizeof(*gicc);
         if (guest_info->gic_version == 2) {
             gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
@@ -593,7 +593,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicc->cpu_interface_number = cpu_to_le32(i);
         gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
         gicc->uid = cpu_to_le32(i);
-        gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
+        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 154f3b82f6dc..510f23c93183 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -290,7 +290,7 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_XRUPT_SOURCE       8
 #define ACPI_APIC_LOCAL_X2APIC       9
 #define ACPI_APIC_LOCAL_X2APIC_NMI      10
-#define ACPI_APIC_GENERIC_INTERRUPT     11
+#define ACPI_APIC_GENERIC_CPU_INTERFACE 11
 #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
 #define ACPI_APIC_GENERIC_MSI_FRAME     13
 #define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
@@ -361,7 +361,7 @@ struct AcpiMadtLocalX2ApicNmi {
 } QEMU_PACKED;
 typedef struct AcpiMadtLocalX2ApicNmi AcpiMadtLocalX2ApicNmi;
 
-struct AcpiMadtGenericInterrupt {
+struct AcpiMadtGenericCpuInterface {
     ACPI_SUB_HEADER_DEF
     uint16_t reserved;
     uint32_t cpu_interface_number;
@@ -378,7 +378,10 @@ struct AcpiMadtGenericInterrupt {
     uint64_t arm_mpidr;
 } QEMU_PACKED;
 
-typedef struct AcpiMadtGenericInterrupt AcpiMadtGenericInterrupt;
+typedef struct AcpiMadtGenericCpuInterface AcpiMadtGenericCpuInterface;
+
+/* GICC CPU Interface Flags */
+#define ACPI_MADT_GICC_ENABLED 1
 
 struct AcpiMadtGenericDistributor {
     ACPI_SUB_HEADER_DEF
diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
index f5ec749b8fea..2bcd22265cfa 100644
--- a/include/hw/arm/virt-acpi-build.h
+++ b/include/hw/arm/virt-acpi-build.h
@@ -24,8 +24,6 @@
 #include "hw/arm/virt.h"
 #include "qemu/notify.h"
 
-#define ACPI_GICC_ENABLED 1
-
 typedef struct VirtGuestInfo {
     int smp_cpus;
     FWCfgState *fw_cfg;
-- 
2.9.3

