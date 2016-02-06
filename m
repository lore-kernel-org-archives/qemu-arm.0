Received: by 10.25.159.19 with SMTP id i19csp574183lfe;
        Sat, 6 Feb 2016 11:28:46 -0800 (PST)
X-Received: by 10.140.157.214 with SMTP id d205mr26747363qhd.3.1454786926116;
        Sat, 06 Feb 2016 11:28:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l34si19356526qgf.84.2016.02.06.11.28.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 11:28:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56201 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS8XF-000595-H0
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 14:28:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aS8Jp-0004lF-Mv
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 14:14:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aS8Jl-0002w5-Py
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 14:14:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aS8Jl-0002vs-9l; Sat, 06 Feb 2016 14:14:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 26C278E67A;
	Sat,  6 Feb 2016 19:14:48 +0000 (UTC)
Received: from redhat.com (vpn1-5-159.ams2.redhat.com [10.36.5.159])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u16JEeb0012561; Sat, 6 Feb 2016 14:14:41 -0500
Date: Sat, 6 Feb 2016 21:14:39 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1454784308-21177-39-git-send-email-mst@redhat.com>
References: <1454784308-21177-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454784308-21177-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Aleksei Kovura <alex3kov@zoho.com>,
	Steven Newbury <steve@snewbury.org.uk>, Michael Tokarev <mjt@tls.msk.ru>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PULL v2 38/45] acpi: take oem_id in build_header(),
	optionally
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
X-TUID: Swo/iZv7aSv/

From: Laszlo Ersek <lersek@redhat.com>

This patch is the continuation of commit 8870ca0e94f2 ("acpi: support
specified oem table id for build_header"). It will allow us to control the
OEM ID field too in the SDT header.

Cc: "Michael S. Tsirkin" <mst@redhat.com> (supporter:ACPI/SMBIOS)
Cc: Igor Mammedov <imammedo@redhat.com> (supporter:ACPI/SMBIOS)
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com> (maintainer:NVDIMM)
Cc: Shannon Zhao <zhaoshenglong@huawei.com> (maintainer:ARM ACPI Subsystem)
Cc: Paolo Bonzini <pbonzini@redhat.com> (maintainer:X86)
Cc: Richard W.M. Jones <rjones@redhat.com>
Cc: Aleksei Kovura <alex3kov@zoho.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Steven Newbury <steve@snewbury.org.uk>
RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1248758
LP: https://bugs.launchpad.net/qemu/+bug/1533848
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 include/hw/acpi/aml-build.h |  2 +-
 hw/acpi/aml-build.c         | 11 ++++++++---
 hw/acpi/nvdimm.c            |  4 ++--
 hw/arm/virt-acpi-build.c    | 12 ++++++------
 hw/i386/acpi-build.c        | 18 +++++++++---------
 5 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6d6f705..c460bdd 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -357,7 +357,7 @@ Aml *aml_sizeof(Aml *arg);
 void
 build_header(GArray *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_table_id);
+             const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 21d2ea0..e4b6c0c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1426,12 +1426,17 @@ Aml *aml_alias(const char *source_object, const char *alias_object)
 void
 build_header(GArray *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
-             const char *oem_table_id)
+             const char *oem_id, const char *oem_table_id)
 {
     memcpy(&h->signature, sig, 4);
     h->length = cpu_to_le32(len);
     h->revision = rev;
-    memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);
+
+    if (oem_id) {
+        strncpy((char *)h->oem_id, oem_id, sizeof h->oem_id);
+    } else {
+        memcpy(h->oem_id, ACPI_BUILD_APPNAME6, 6);
+    }
 
     if (oem_table_id) {
         strncpy((char *)h->oem_table_id, oem_table_id, sizeof(h->oem_table_id));
@@ -1506,5 +1511,5 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets)
                                        sizeof(uint32_t));
     }
     build_header(linker, table_data,
-                 (void *)rsdt, "RSDT", rsdt_len, 1, NULL);
+                 (void *)rsdt, "RSDT", rsdt_len, 1, NULL, NULL);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 7ee7e16..49ee68e 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -366,7 +366,7 @@ static void nvdimm_build_nfit(GSList *device_list, GArray *table_offsets,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + header), "NFIT",
-                 sizeof(NvdimmNfitHeader) + structures->len, 1, NULL);
+                 sizeof(NvdimmNfitHeader) + structures->len, 1, NULL, NULL);
     g_array_free(structures, true);
 }
 
@@ -471,7 +471,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
     g_array_append_vals(table_data, ssdt->buf->data, ssdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - ssdt->buf->len),
-        "SSDT", ssdt->buf->len, 1, "NVDIMM");
+        "SSDT", ssdt->buf->len, 1, NULL, "NVDIMM");
     free_aml_allocator();
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 87fbe7c..8017b12 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -408,7 +408,7 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     spcr->pci_vendor_id = 0xffff;  /* PCI Vendor ID: not a PCI device */
 
     build_header(linker, table_data, (void *)spcr, "SPCR", sizeof(*spcr), 2,
-                 NULL);
+                 NULL, NULL);
 }
 
 static void
@@ -427,7 +427,7 @@ build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     mcfg->allocation[0].end_bus_number = (memmap[VIRT_PCIE_ECAM].size
                                           / PCIE_MMCFG_SIZE_MIN) - 1;
 
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL);
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
 
 /* GTDT */
@@ -453,7 +453,7 @@ build_gtdt(GArray *table_data, GArray *linker)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
-                 table_data->len - gtdt_start, 2, NULL);
+                 table_data->len - gtdt_start, 2, NULL, NULL);
 }
 
 /* MADT */
@@ -515,7 +515,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 3, NULL);
+                 table_data->len - madt_start, 3, NULL, NULL);
 }
 
 /* FADT */
@@ -540,7 +540,7 @@ build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
                                    sizeof fadt->dsdt);
 
     build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL);
+                 (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
 }
 
 /* DSDT */
@@ -579,7 +579,7 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 2, NULL);
+        "DSDT", dsdt->buf->len, 2, NULL, NULL);
     free_aml_allocator();
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 35582a7..061a9cb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -357,7 +357,7 @@ build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
     fadt_setup(fadt, pm);
 
     build_header(linker, table_data,
-                 (void *)fadt, "FACP", sizeof(*fadt), 1, NULL);
+                 (void *)fadt, "FACP", sizeof(*fadt), 1, NULL, NULL);
 }
 
 static void
@@ -427,7 +427,7 @@ build_madt(GArray *table_data, GArray *linker, AcpiCpuInfo *cpu)
 
     build_header(linker, table_data,
                  (void *)(table_data->data + madt_start), "APIC",
-                 table_data->len - madt_start, 1, NULL);
+                 table_data->len - madt_start, 1, NULL, NULL);
 }
 
 /* Assign BSEL property to all buses.  In the future, this can be changed
@@ -2286,7 +2286,7 @@ build_dsdt(GArray *table_data, GArray *linker,
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     build_header(linker, table_data,
         (void *)(table_data->data + table_data->len - dsdt->buf->len),
-        "DSDT", dsdt->buf->len, 1, NULL);
+        "DSDT", dsdt->buf->len, 1, NULL, NULL);
     free_aml_allocator();
 }
 
@@ -2302,7 +2302,7 @@ build_hpet(GArray *table_data, GArray *linker)
     hpet->timer_block_id = cpu_to_le32(0x8086a201);
     hpet->addr.address = cpu_to_le64(HPET_BASE);
     build_header(linker, table_data,
-                 (void *)hpet, "HPET", sizeof(*hpet), 1, NULL);
+                 (void *)hpet, "HPET", sizeof(*hpet), 1, NULL, NULL);
 }
 
 static void
@@ -2325,7 +2325,7 @@ build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
                                    sizeof(tcpa->log_area_start_address));
 
     build_header(linker, table_data,
-                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL);
+                 (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
 
     acpi_data_push(tcpalog, TPM_LOG_AREA_MINIMUM_SIZE);
 }
@@ -2342,7 +2342,7 @@ build_tpm2(GArray *table_data, GArray *linker)
     tpm2_ptr->start_method = cpu_to_le32(TPM2_START_METHOD_MMIO);
 
     build_header(linker, table_data,
-                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL);
+                 (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
 }
 
 typedef enum {
@@ -2456,7 +2456,7 @@ build_srat(GArray *table_data, GArray *linker)
     build_header(linker, table_data,
                  (void *)(table_data->data + srat_start),
                  "SRAT",
-                 table_data->len - srat_start, 1, NULL);
+                 table_data->len - srat_start, 1, NULL, NULL);
 }
 
 static void
@@ -2485,7 +2485,7 @@ build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
     } else {
         sig = "MCFG";
     }
-    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL);
+    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
 }
 
 static void
@@ -2509,7 +2509,7 @@ build_dmar_q35(GArray *table_data, GArray *linker)
     drhd->address = cpu_to_le64(Q35_HOST_BRIDGE_IOMMU_ADDR);
 
     build_header(linker, table_data, (void *)(table_data->data + dmar_start),
-                 "DMAR", table_data->len - dmar_start, 1, NULL);
+                 "DMAR", table_data->len - dmar_start, 1, NULL, NULL);
 }
 
 static GArray *
-- 
MST

