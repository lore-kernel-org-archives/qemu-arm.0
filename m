Received: by 10.182.158.201 with SMTP id ww9csp3554147obb;
        Tue, 22 Dec 2015 09:09:16 -0800 (PST)
X-Received: by 10.140.254.69 with SMTP id z66mr35795551qhc.5.1450804156865;
        Tue, 22 Dec 2015 09:09:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d193si35315557qka.54.2015.12.22.09.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Dec 2015 09:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aBQR2-0007mZ-Bc
	for alex.bennee@linaro.org; Tue, 22 Dec 2015 12:09:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQCU-0007gh-SI
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:54:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aBQCT-0000t9-Bu
	for qemu-arm@nongnu.org; Tue, 22 Dec 2015 11:54:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aBQCT-0000t5-40; Tue, 22 Dec 2015 11:54:13 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id A919D8E25A;
	Tue, 22 Dec 2015 16:54:12 +0000 (UTC)
Received: from redhat.com (vpn1-5-205.ams2.redhat.com [10.36.5.205])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id tBMGs95k013082; Tue, 22 Dec 2015 11:54:09 -0500
Date: Tue, 22 Dec 2015 18:54:08 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1450803119-4223-32-git-send-email-mst@redhat.com>
References: <1450803119-4223-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450803119-4223-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PULL 31/55] acpi: support specified oem table id for
	build_header
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
X-TUID: gygmk6JG02zN

From: Xiao Guangrong <guangrong.xiao@linux.intel.com>

Let build_header() support specified OEM table id so that we can build
multiple SSDT later

If the oem table id is not specified (aka, NULL), we use the default id
instead as the previous behavior

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Xiao Guangrong <guangrong.xiao@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h |  3 ++-
 hw/acpi/aml-build.c         | 15 +++++++++++----
 hw/arm/virt-acpi-build.c    | 13 +++++++------
 hw/i386/acpi-build.c        | 20 ++++++++++----------
 4 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 0d36453..9fa61a3 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -310,7 +310,8 @@ Aml *aml_unicode(const char *str);
 
 void
 build_header(GArray *linker, GArray *table_data,
-             AcpiTableHeader *h, const char *sig, int len, uint8_t rev);
+             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
+             const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 302cf01..363e83b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1242,14 +1242,21 @@ Aml *aml_unicode(const char *str)
 
 void
 build_header(GArray *linker, GArray *table_data,
-             AcpiTableHeader *h, const char *sig, int len, uint8_t rev)
+             AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
+             const char *oem_table_id)
 {
     memcpy(&h->signature, sig, 4);
     h->length = cpu_to_le32(len);
     h->revision = rev;
     memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);
-    memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);
-    memcpy(h->oem_table_id + 4, sig, 4);
+
+    if (oem_table_id) {
+        strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
+    } else {
+        memcpy(h->oem_table_id, ACPI_BUILD_APPNAME4, 4);
+        memcpy(h->oem_table_id + 4, sig, 4);
+    }
+
     h->oem_revision = cpu_to_le32(1);
     memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME4, 4);
     h->asl_compiler_revision = cpu_to_le32(1);
@@ -1316,5 +1323,5 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets)
                                        sizeof(uint32_t));
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1);
+                 (void *)rsdt, "RSDT", rsdt_len, 1, NULL);
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 32ec19e..7aa0ab3 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -423,7 +423,8 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     spcr->pci_device_id = 0xffff;  /* PCI Device ID: not a PCI device */
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
-    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2);
+    build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
+                 NULL);
 }
 
 static void
@@ -442,7 +443,7 @@ build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
                                           / PCIE_MMCFG_SIZE_MIN) - 1;
 
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL);
 }
 
 /* GTDT */
@@ -468,7 +469,7 @@ build_gtdt(GArray *table_data, GArray *linker)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2);
+                 table_data->len - gtdt_start, 2, NULL);
 }
 
 /* MADT */
@@ -530,7 +531,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3);
+                 table_data->len - madt_start, 3, NULL);
 }
 
 /* FADT */
@@ -555,7 +556,7 @@ build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
                                    sizeof fadt->dsdt);
 
     build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 5);
+                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL);
 }
 
 /* DSDT */
@@ -591,7 +592,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2);
+        "DSDT", dsdt->buf->len, 2, NULL);
     free_aml_allocator();
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a60436b..27d2caf 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -361,7 +361,7 @@ build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
     fadt_setup(fadt, pm);
 
     build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 1);
+                 (void *)fadt, "FACP", sizeof(*fadt), 1, NULL);
 }
 
 static void
@@ -431,7 +431,7 @@ build_madt(GArray *table_data, GArray *linker, AcpiCpuInfo *cpu,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1);
+                 table_data->len - madt_start, 1, NULL);
 }
 
 /* Assign BSEL property to all buses.  In the future, this can be changed
@@ -1374,7 +1374,7 @@ build_ssdt(GArray *table_data, GArray *linker,
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1);
+        "SSDT", ssdt->buf->len, 1, NULL);
     free_aml_allocator();
 }
 
@@ -1390,7 +1390,7 @@ build_hpet(GArray *table_data, GArray *linker)
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1);
+                 (void *)hpet, "HPET", sizeof(*hpet), 1, NULL);
 }
 
 static void
@@ -1413,7 +1413,7 @@ build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
                                    sizeof(tcpa->log_area_start_address));
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2);
+                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL);
 
     acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
 }
@@ -1430,7 +1430,7 @@ build_tpm2(GArray *table_data, GArray *linker)
     tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
 
     build_header(linker, table_data,
-                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4);
+                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL);
 }
 
 typedef enum {
@@ -1544,7 +1544,7 @@ build_srat(GArray *table_data, GArray *linker, PcGuestInfo *guest_info)
     build_header(linker, table_data,
                  (void *)(table_data->data + srat_start),
                  "SRAT",
-                 table_data->len - srat_start, 1);
+                 table_data->len - srat_start, 1, NULL);
 }
 
 static void
@@ -1573,7 +1573,7 @@ build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
     } else {
         sig = "MCFG";
     }
-    build_header(linker, table_data, (void *)mcfg, sig, len, 1);
+    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL);
 }
 
 static void
@@ -1597,7 +1597,7 @@ build_dmar_q35(GArray *table_data, GArray *linker)
     drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
 
     build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1);
+                 "DMAR", table_data->len - dmar_start, 1, NULL);
 }
 
 static void
@@ -1612,7 +1612,7 @@ build_dsdt(GArray *table_data, GArray *linker, AcpiMiscInfo *misc)
 
     memset(dsdt, 0, sizeof *dsdt);
     build_header(linker, table_data, dsdt, "DSDT",
-                 misc->dsdt_size, 1);
+                 misc->dsdt_size, 1, NULL);
 }
 
 static GArray *
-- 
MST

