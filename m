Received: by 10.25.21.156 with SMTP id 28csp22568lfv;
        Thu, 11 Aug 2016 02:08:29 -0700 (PDT)
X-Received: by 10.237.38.35 with SMTP id z32mr9660404qtc.69.1470906509159;
        Thu, 11 Aug 2016 02:08:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j88si997755qtd.51.2016.08.11.02.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:08:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXlyW-0007qa-HJ
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwx-0006i5-Ls
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 05:06:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwt-0005Br-CG
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 05:06:50 -0400
Received: from mga11.intel.com ([192.55.52.93]:43604)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bXlwt-0005Bj-0m; Thu, 11 Aug 2016 05:06:47 -0400
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2016 02:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,504,1464678000"; d="scan'208";a="1023576473"
Received: from unknown (HELO lvzheng-z530.sh.intel.com) ([10.239.159.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2016 02:06:43 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 11 Aug 2016 17:06:37 +0800
Message-Id: <62b8ac568507432ae55a1e70e7e25c4a729372d9.1470905888.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1470905888.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
	<cover.1470905888.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH v3 2/2] ACPI: Add -acpitable fadt= to allow
 FADT revision changes
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hhyzcrdy+3QT

This patch allows FADT to be built with different revisions. When the revision
is greater than 1.0, 64-bit address fields may also be filled.

Note that FADT revision 2 has never been defined by the ACPI specification. So
this patch only adds an option -acpitable fadt= to allow revision 1,3,5 to be
configured by the users.

1. Tested by booting a linux image, the 64-bit addresses are correctly filled
   in the dumped FADT.
2. Tested by booting a Windows image, no boot failure can be seen.

Signed-off-by: Lv Zheng <lv.zheng@intel.com>
---
 hw/acpi/core.c         |   26 ++++++++++++++---
 hw/i386/acpi-build.c   |   76 ++++++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi.h |    1 +
 qemu-options.hx        |    8 ++++-
 4 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index cd1f9e4..832c86b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -19,6 +19,7 @@
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "sysemu/sysemu.h"
 #include "hw/hw.h"
 #include "hw/i386/pc.h"
@@ -54,6 +55,7 @@ static const char unsigned dfl_hdr[ACPI_TABLE_HDR_SIZE - ACPI_TABLE_PFX_SIZE] =
 
 char unsigned *acpi_tables;
 size_t acpi_tables_len;
+uint8_t acpi_fadt_rev = 1;
 
 static QemuOptsList qemu_acpi_opts = {
     .name = "acpi",
@@ -228,7 +230,7 @@ static void acpi_table_install(const char unsigned *blob, size_t bloblen,
 }
 
 static void acpi_table_from_file(bool has_header, const char *file,
-                                 AcpiTableOptions *hdrs, Error **errp)
+                                 const QemuOpts *opts, Error **errp)
 {
     AcpiTableOptions *hdrs = NULL;
     Error *err = NULL;
@@ -302,17 +304,33 @@ void acpi_table_add(const QemuOpts *opts, Error **errp)
 
     val = qemu_opt_get((QemuOpts *)opts, "file");
     if (val) {
-        acpi_table_from_file(true, val, hdrs, errp);
+        acpi_table_from_file(true, val, opts, errp);
         return;
     }
 
     val = qemu_opt_get((QemuOpts *)opts, "data");
     if (val) {
-        acpi_table_from_file(false, val, hdrs, errp);
+        acpi_table_from_file(false, val, opts, errp);
         return;
     }
 
-    error_setg(errp, "'-acpitable' requires one of 'data' or 'file'");
+    val = qemu_opt_get((QemuOpts *)opts, "fadt");
+    if (val) {
+        unsigned long rev;
+        int err;
+
+        err = qemu_strtoul(val, NULL, 10, &rev);
+        if (err ||
+            (rev != 1 && rev != 3 && rev != 5)) {
+            error_setg(errp, "Unsupported FADT revision %s, "
+                       "please specify 1,3,5", val);
+            return;
+        }
+        acpi_fadt_rev = rev;
+        return;
+    }
+
+    error_setg(errp, "'-acpitable' requires one of 'data','file' or 'fadt'");
 }
 
 static bool acpi_table_builtin = false;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index ce7cbc5..e5a711a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -276,8 +276,22 @@ build_facs(GArray *table_data, BIOSLinker *linker)
     facs->length = cpu_to_le32(sizeof(*facs));
 }
 
+/* GAS */
+static void
+build_gas(struct AcpiGenericAddress *gas, uint8_t space_id,
+          uint8_t bit_width, uint8_t bit_offset,
+          uint8_t access_width, uint64_t address)
+{
+    gas->space_id = space_id;
+    gas->bit_width = bit_width;
+    gas->bit_offset = bit_offset;
+    gas->access_width = access_width;
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
 
 
@@ -316,11 +349,21 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
 static void
 build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
            unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
-           const char *oem_id, const char *oem_table_id)
+           const char *oem_id, const char *oem_table_id, uint8_t revision)
 {
-    AcpiFadtDescriptorRev1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
-    unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
-    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
+    AcpiFadtDescriptorRev5_1 *fadt;
+    unsigned fw_ctrl_offset;
+    unsigned dsdt_entry_offset;
+    unsigned fadt_len;
+
+    if (revision == 1) {
+        fadt_len = sizeof (AcpiFadtDescriptorRev1);
+    } else {
+        fadt_len = sizeof (AcpiFadtDescriptorRev5_1);
+    }
+    fadt = acpi_data_push(table_data, fadt_len);
+    fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
+    dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
 
     /* FACS address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker,
@@ -328,13 +371,28 @@ build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
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
+    build_header(linker, table_data, (void *)fadt, "FACP", fadt_len,
+                 revision, oem_id, oem_table_id);
 }
 
 void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
@@ -2681,7 +2739,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
index 5fe7f87..d61dd92 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1497,7 +1497,10 @@ DEF("acpitable", HAS_ARG, QEMU_OPTION_acpitable,
     "             [,sig=str][,rev=n]\n"
     "             [,oem_id=str][,oem_table_id=str][,oem_rev=n]\n"
     "             [,asl_compiler_id=str][,asl_compiler_rev=n]\n"
-    "                ACPI table description\n", QEMU_ARCH_I386)
+    "                ACPI table description\n"
+    "-acpitable fadt=n\n"
+    "                Configure FADT revision\n",
+    QEMU_ARCH_I386)
 STEXI
 @item -acpitable data=@var{file1}[:@var{file2}]...[,sig=@var{str}][,rev=@var{n}][,oem_id=@var{str}][,oem_table_id=@var{str}][,oem_rev=@var{n}] [,asl_compiler_id=@var{str}][,asl_compiler_rev=@var{n}]
 @findex -acpitable
@@ -1511,6 +1514,9 @@ If a SLIC table is supplied to QEMU, then the SLIC's oem_id and oem_table_id
 fields will override the same in the RSDT and the FADT (a.k.a. FACP), in order
 to ensure the field matches required by the Microsoft SLIC spec and the ACPI
 spec.
+
+@item -acpitable fadt=@var{n}
+Configure FADT revision to 1, 3, 5, default 1.
 ETEXI
 
 DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
-- 
1.7.10

