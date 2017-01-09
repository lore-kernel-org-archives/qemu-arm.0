Received: by 10.25.205.13 with SMTP id d13csp11562736lfg;
        Mon, 9 Jan 2017 08:05:48 -0800 (PST)
X-Received: by 10.55.201.141 with SMTP id m13mr82910995qkl.247.1483977948322;
        Mon, 09 Jan 2017 08:05:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x93si39633769qte.247.2017.01.09.08.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:05:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcS9-0007sB-JK
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:05:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS2-0007nd-6e
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS1-0003iZ-07
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS0-0003hC-Ps; Mon, 09 Jan 2017 11:05:36 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRw-0001nx-QB; Mon, 09 Jan 2017 16:05:32 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:21 +0000
Message-Id: <1483977924-14522-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 15/18] hw/arm/virt-acpi-build: use SMC if
 booting in EL2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vG8396n9dSIN

From: Andrew Jones <drjones@redhat.com>

Signed-off-by: Andrew Jones <drjones@redhat.com>
[PMM: look at vms->psci_conduit rather than vms->virt
 to decide whether to use HVC or SMC, and report no
 PSCI support at all for the 'PSCI disabled' case]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 085a611..ec7f83b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -643,16 +643,30 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 /* FADT */
-static void
-build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt_tbl_offset)
+static void build_fadt(GArray *table_data, BIOSLinker *linker,
+                       VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
     unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
+    uint16_t bootflags;
+
+    switch (vms->psci_conduit) {
+    case QEMU_PSCI_CONDUIT_DISABLED:
+        bootflags = 0;
+        break;
+    case QEMU_PSCI_CONDUIT_HVC:
+        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT | ACPI_FADT_ARM_PSCI_USE_HVC;
+        break;
+    case QEMU_PSCI_CONDUIT_SMC:
+        bootflags = ACPI_FADT_ARM_PSCI_COMPLIANT;
+        break;
+    default:
+        g_assert_not_reached();
+    }
 
-    /* Hardware Reduced = 1 and use PSCI 0.2+ and with HVC */
+    /* Hardware Reduced = 1 and use PSCI 0.2+ */
     fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
-    fadt->arm_boot_flags = cpu_to_le16(ACPI_FADT_ARM_PSCI_COMPLIANT |
-                                       ACPI_FADT_ARM_PSCI_USE_HVC);
+    fadt->arm_boot_flags = cpu_to_le16(bootflags);
 
     /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
     fadt->minor_revision = 0x1;
@@ -738,7 +752,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
-    build_fadt(tables_blob, tables->linker, dsdt);
+    build_fadt(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
-- 
2.7.4

