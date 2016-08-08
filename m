Received: by 10.25.21.156 with SMTP id 28csp2952866lfv;
        Mon, 8 Aug 2016 00:29:20 -0700 (PDT)
X-Received: by 10.55.68.81 with SMTP id r78mr10393249qka.119.1470641360273;
        Mon, 08 Aug 2016 00:29:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19si19210673qtc.40.2016.08.08.00.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 00:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWezv-0006pL-K2
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 03:29:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWezl-0006l6-Dm
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:29:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bWezj-0006nW-2Z
	for qemu-arm@nongnu.org; Mon, 08 Aug 2016 03:29:08 -0400
Received: from mga09.intel.com ([134.134.136.24]:45321)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bWeza-0006kd-RU; Mon, 08 Aug 2016 03:28:59 -0400
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2016 00:28:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,488,1464678000"; d="scan'208";a="745657241"
Received: from lvzheng-z530.sh.intel.com ([10.239.159.23])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2016 00:28:53 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Date: Mon,  8 Aug 2016 15:28:33 +0800
Message-Id: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-arm] [PATCH] ACPI: Add -acpifadt to allow FADT revision
 changes
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: usVsHNYLUXbJ

This patch allows FADT to be built with different revisions. When the revision
is greater than 1.0, 64-bit address fields may also be filled.

Note that FADT revision 2 has never been defined by the ACPI specification. So
this patch only adds an option -acpifadt to allow revision 1,3,5 to be
configured by the users.

1. Tested by booting a linux image, the 64-bit addresses are correctly filled
   in the dumped FADT.
2. Tested by booting a Windows image, no boot failure can be seen.

Signed-off-by: Lv Zheng <lv.zheng@intel.com>
---
 hw/i386/acpi-build.c   |   62 ++++++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi.h |    1 +
 qemu-options.hx        |    9 +++++++
 vl.c                   |   18 ++++++++++++++
 4 files changed, 83 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce7cbc5..1f664de 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -276,8 +276,22 @@ build_facs(GArray *table_data, BIOSLinker *linker)
     facs->length = cpu_to_le32(sizeof(*facs));
 }
 
+/* GAS */
+static void
+build_gas(struct AcpiGenericAddress *gas, uint8_t space_id,
+	  uint8_t bit_width, uint8_t bit_offset,
+	  uint8_t access_width, uint64_t address)
+{
+    gas->space_id = space_id;
+    gas->bit_width = bit_width;
+    gas->bit_offset = bit_offset;
+    gas->access_width= access_width;
+    gas->address = address;
+}
+
 /* Load chipset information in FADT */
-static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
+static void fadt_setup(AcpiFadtDescriptorRev5_1 *fadt, AcpiPmInfo *pm,
+                       uint8_t revision)
 {
     fadt->model = 1;
     fadt->reserved1 = 0;
@@ -309,6 +323,25 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
         fadt->flags |= cpu_to_le32(1 << ACPI_FADT_F_FORCE_APIC_CLUSTER_MODEL);
     }
     fadt->century = RTC_CENTURY;
+
+    /* Build ACPI 2.0 (FADT version 3+) GAS fields */
+    if (revision >= 3) {
+        /* EVT, CNT, TMR register matches hw/acpi/core.c */
+        build_gas(&fadt->xpm1a_event_block, AML_SYSTEM_IO,
+                  32, 0, 0, cpu_to_le64(pm->io_base));
+        build_gas(&fadt->xpm1a_control_block, AML_SYSTEM_IO,
+                  16, 0, 0, cpu_to_le64(pm->io_base + 0x04));
+        build_gas(&fadt->xpm_timer_block, AML_SYSTEM_IO,
+                  32, 0, 0, cpu_to_le64(pm->io_base + 0x08));
+        build_gas(&fadt->xgpe0_block, AML_SYSTEM_IO,
+                  pm->gpe0_blk_len << 3, 0, 0, cpu_to_le64(pm->gpe0_blk));
+    }
+
+    /* Build dummy ACPI 5.0 fields */
+    if (revision >= 5) {
+        build_gas(&fadt->sleep_control, AML_SYSTEM_MEMORY, 0, 0, 0, 0);
+        build_gas(&fadt->sleep_status, AML_SYSTEM_MEMORY, 0, 0, 0, 0);
+    }
 }
 
 
@@ -316,9 +349,9 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
 static void
 build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
            unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
-           const char *oem_id, const char *oem_table_id)
+           const char *oem_id, const char *oem_table_id, uint8_t revision)
 {
-    AcpiFadtDescriptorRev1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
+    AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
     unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
     unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
 
@@ -328,13 +361,28 @@ build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
         ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
 
     /* DSDT address to be filled by Guest linker */
-    fadt_setup(fadt, pm);
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
         ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
 
-    build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 1, oem_id, oem_table_id);
+    if (revision > 2) {
+        fw_ctrl_offset = (char *)&fadt->Xfacs - table_data->data;
+        dsdt_entry_offset = (char *)&fadt->Xdsdt - table_data->data;
+
+        /* FACS address to be filled by Guest linker */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->Xfacs),
+            ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
+
+        /* DSDT address to be filled by Guest linker */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->Xdsdt),
+            ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
+    }
+
+    fadt_setup(fadt, pm, revision);
+    build_header(linker, table_data, (void *)fadt, "FACP", sizeof(*fadt),
+                 revision, oem_id, oem_table_id);
 }
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
@@ -2681,7 +2729,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     fadt = tables_blob->len;
     acpi_add_table(table_offsets, tables_blob);
     build_fadt(tables_blob, tables->linker, &pm, facs, dsdt,
-               slic_oem.id, slic_oem.table_id);
+               slic_oem.id, slic_oem.table_id, acpi_fadt_rev);
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 7b3d93c..63df38d 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -173,6 +173,7 @@ void acpi_update_sci(ACPIREGS *acpi_regs, qemu_irq irq);
 
 /* acpi.c */
 extern int acpi_enabled;
+extern uint8_t acpi_fadt_rev;
 extern char unsigned *acpi_tables;
 extern size_t acpi_tables_len;
 
diff --git a/qemu-options.hx b/qemu-options.hx
index a71aaf8..cff34f6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1492,6 +1492,15 @@ STEXI
 Disable HPET support.
 ETEXI
 
+DEF("acpifadt", HAS_ARG, QEMU_OPTION_acpifadt, \
+    "-acpifadt  n    configure FADT revision number (1, 3, 5)\n",
+    QEMU_ARCH_ALL)
+STEXI
+@item -acpifadt @var{n}
+@findex -acpifadt
+Configure FADT revision number, default is 1.
+ETEXI
+
 DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
     "-acpitable [sig=str][,rev=n][,oem_id=str][,oem_table_id=str][,oem_rev=n][,asl_compiler_id=str][,asl_compiler_rev=n][,{data|file}=file1[:file2]...]\n"
     "                ACPI table description\n", QEMU_ARCH_I386)
diff --git a/vl.c b/vl.c
index e7c2c62..5fe2414 100644
--- a/vl.c
+++ b/vl.c
@@ -64,6 +64,7 @@ int main(int argc, char **argv)
 #include "hw/bt.h"
 #include "sysemu/watchdog.h"
 #include "hw/smbios/smbios.h"
+#include "hw/acpi/acpi.h"
 #include "hw/xen/xen.h"
 #include "hw/qdev.h"
 #include "hw/loader.h"
@@ -158,6 +159,7 @@ int max_cpus = 1;
 int smp_cores = 1;
 int smp_threads = 1;
 int acpi_enabled = 1;
+uint8_t acpi_fadt_rev = 1;
 int no_hpet = 0;
 int fd_bootchk = 1;
 static int no_reboot;
@@ -2301,6 +2303,19 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static void fadt_parse(const char *arg)
+{
+    uint32_t rev;
+
+    rev = strtoul(arg, NULL, 0);
+    if (rev != 1 && rev != 3 && rev != 5) {
+        error_printf("Unsupported FADT revision %d,"
+                     "please specify 1,3,5.\n", rev);
+        exit(1);
+    }
+    acpi_fadt_rev = rev;
+}
+
 static int device_help_func(void *opaque, QemuOpts *opts, Error **errp)
 {
     return qdev_device_help(opts);
@@ -3622,6 +3637,9 @@ int main(int argc, char **argv, char **envp)
                 qdev_prop_register_global(&slew_lost_ticks);
                 break;
             }
+            case QEMU_OPTION_acpifadt:
+                fadt_parse(optarg);
+                break;
             case QEMU_OPTION_acpitable:
                 opts = qemu_opts_parse_noisily(qemu_find_opts("acpi"),
                                                optarg, true);
-- 
1.7.10

