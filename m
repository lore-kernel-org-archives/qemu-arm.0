Received: by 10.25.21.156 with SMTP id 28csp1921256lfv;
        Tue, 19 Jul 2016 19:48:49 -0700 (PDT)
X-Received: by 10.200.52.193 with SMTP id x1mr67106851qtb.65.1468982929594;
        Tue, 19 Jul 2016 19:48:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si385056qkm.83.2016.07.19.19.48.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 19:48:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPhZ2-0007S0-VU
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 22:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfid-0000Z1-6T
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>) id 1bPfib-0006dN-Dt
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 20:50:35 -0400
Received: from exvmail3.skhynix.com ([166.125.252.90]:59112
	helo=invmail3.skhynix.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwangwoo.lee@sk.com>)
	id 1bPfia-0006bM-PL; Tue, 19 Jul 2016 20:50:33 -0400
X-AuditID: a67dfc59-f790b6d000004b07-be-578ecad3509f
From: Kwangwoo Lee <kwangwoo.lee@sk.com>
To: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhao@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Jul 2016 09:49:03 +0900
Message-Id: <1468975744-12587-3-git-send-email-kwangwoo.lee@sk.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKLMWRmVeSWpSXmKPExsXCNUdUWffyqb5wg5ZL7BYN90ItFq5axmxx
	+mgHs8X/X69YLfZv+8dqMefMAxaLBd0L2SyO9+5gsZh26g6rxdNlv1kt5m14weTA7dFy5C2r
	x51re9g85p0M9HhybTOTx/t9V9k8+qZ/YA5gi+KySUnNySxLLdK3S+DKWDhhHlvBEsuKjrUz
	2BoYp2h3MXJySAiYSFx+cZgFwhaTuHBvPRtM/P62/0wgNpuAhsSpDfeBarg4RARWM0s8br0G
	lmAWKJbo3v6UFcQWFnCX+Pp1CnMXIwcHi4CqRM/RfJAwr4CzxJ8HL1hBwhICchILLqSDhDkF
	XCS61m8CWyUEVPLm9zNWkPESAlvYJCZv/8MEcYOkxMEVN1gmMPItYGRYxSiSmVeWm5iZY6xX
	nJ1RmZdZoZecn7uJERiYy2r/RO5g7GnVP8QowMGoxMPLcawvXIg1say4MvcQowQHs5IIr9B+
	oBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeJQtywoUE0hNLUrNTUwtSi2CyTBycUg2M14VvfHWO
	ezThK9fH9+UdlkveBExXl1t4uO/3prZM2425T6ry/6ZVHkxQv8JzNm9jHv+muEscRxe9XKpn
	X3RDO/n+5yPR5XfK9UWfXpu6p/G/5fdZns0dX6fsYLTJrNV0j+8yKj/6sHpygJbaNbVZ0cJL
	JVjz5yn3iYYsPvHg+4ZLR1OfFiVlKLEUZyQaajEXFScCAORYCAdIAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMLMWRmVeSWpSXmKPExsXCFdOSpnvpVF+4QVuXjUXDvVCLhauWMVtM
	XdXCZHH6aAezxbzPp9gt/v96xWqxf9s/Vos5Zx6wWCzoXshmcbx3B4vFtFN3WC2eLvvNajFv
	+VoWi3kbXjA58Hm0HHnL6nHn2h42j3knAz2eXNvM5PF+31U2j2+3PTz6pn9gDmCP4rJJSc3J
	LEst0rdL4MpYOGEeW8ESy4qOtTPYGhinaHcxcnJICJhI3N/2nwnCFpO4cG89G4jNJqAhcWrD
	fZYuRi4OEYHVzBKPW6+BFTELFEt0b3/KCmILC7hLfP06hbmLkYODRUBVoudoPkiYV8BZ4s+D
	F6wgYQkBOYkFF9JBwpwCLhJd6zeBjRcCKnnz+xnrBEbuBYwMqxhFMvPKchMzc8z0irMzKvMy
	K/SS83M3MQKDblntn0k7GL9ddj/EKMDBqMTDy3GsL1yINbGsuDL3EKMEB7OSCK/QfqAQb0pi
	ZVVqUX58UWlOavEhRmkOFiVx3uMflcKFBNITS1KzU1MLUotgskwcnFINjHlzu4NOs6Xt5Z4+
	SfNVM88kJXbm5O0MfpZWit3NPNdjZ5ldnhb8s0JWS6mmmbG2/N8l/to5Nm9OBU46OX3Z/dRv
	nPO233WsiU+XaLhwa8eH6i3ustNLggzmHJA/WFWxe1Hzh+u8UU/22KU4uHY7eLo6ZZYumxYf
	2eziyP/2rUbXx7T33rLnlViKMxINtZiLihMBuvY5WDYCAAA=
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 166.125.252.90
X-Mailman-Approved-At: Tue, 19 Jul 2016 22:48:44 -0400
Subject: [Qemu-arm] [RFC PATCH 2/3] nvdimm: use configurable ACPI IO base
 and size
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
Cc: Hyunchul Kim <hyunchul3.kim@sk.com>, Kwangwoo Lee <kwangwoo.lee@sk.com>,
	Woosuk Chung <woosuk.chung@sk.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fxWnEKLTW+Lk

This patch uses configurable IO base and size to create NPIO AML for
ACPI NFIT. Since a different architecture like AArch64 does not use
port-mapped IO, a configurable IO base is required to create correct
mapping of ACPI IO address and size.

Signed-off-by: Kwangwoo Lee <kwangwoo.lee@sk.com>
---
 hw/acpi/nvdimm.c        | 23 +++++++++++++++--------
 hw/i386/acpi-build.c    |  2 +-
 hw/i386/pc_piix.c       |  8 +++++++-
 hw/i386/pc_q35.c        |  8 +++++++-
 include/hw/mem/nvdimm.h | 17 ++++++++++++++++-
 5 files changed, 46 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e486128..57e03ee 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -765,8 +765,8 @@ void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner)
 {
     memory_region_init_io(&state->io_mr, owner, &nvdimm_dsm_ops, state,
-                          "nvdimm-acpi-io", NVDIMM_ACPI_IO_LEN);
-    memory_region_add_subregion(io, NVDIMM_ACPI_IO_BASE, &state->io_mr);
+                          "nvdimm-acpi-io", state->dsm_io.size);
+    memory_region_add_subregion(io, state->dsm_io.base, &state->io_mr);
 
     state->dsm_mem = g_array_new(false, true /* clear */, 1);
     acpi_data_push(state->dsm_mem, sizeof(NvdimmDsmIn));
@@ -912,9 +912,10 @@ static void nvdimm_build_nvdimm_devices(GSList *device_list, Aml *root_dev)
 
 static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
                               GArray *table_data, BIOSLinker *linker,
-                              GArray *dsm_dma_arrea)
+                              AcpiNVDIMMState *acpi_nvdimm_state)
 {
     Aml *ssdt, *sb_scope, *dev, *field;
+    AmlRegionSpace rs;
     int mem_addr_offset, nvdimm_ssdt;
 
     acpi_add_table(table_offsets, table_data);
@@ -940,8 +941,14 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
     aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0012")));
 
     /* map DSM memory and IO into ACPI namespace. */
-    aml_append(dev, aml_operation_region("NPIO", AML_SYSTEM_IO,
-               aml_int(NVDIMM_ACPI_IO_BASE), NVDIMM_ACPI_IO_LEN));
+    if (acpi_nvdimm_state->dsm_io.type == NVDIMM_ACPI_IO_PORT) {
+        rs = AML_SYSTEM_IO;
+    } else {
+        rs = AML_SYSTEM_MEMORY;
+    }
+    aml_append(dev, aml_operation_region("NPIO", rs,
+               aml_int(acpi_nvdimm_state->dsm_io.base),
+               acpi_nvdimm_state->dsm_io.size));
     aml_append(dev, aml_operation_region("NRAM", AML_SYSTEM_MEMORY,
                aml_name(NVDIMM_ACPI_MEM_ADDR), sizeof(NvdimmDsmIn)));
 
@@ -1014,7 +1021,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
                                                NVDIMM_ACPI_MEM_ADDR);
 
     bios_linker_loader_alloc(linker,
-                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
+                             NVDIMM_DSM_MEM_FILE, acpi_nvdimm_state->dsm_mem,
                              sizeof(NvdimmDsmIn), false /* high memory */);
     bios_linker_loader_add_pointer(linker,
         ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
@@ -1026,7 +1033,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker, GArray *dsm_dma_arrea)
+                       BIOSLinker *linker, AcpiNVDIMMState *acpi_nvdimm_state)
 {
     GSList *device_list;
 
@@ -1037,6 +1044,6 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
     }
     nvdimm_build_nfit(device_list, table_offsets, table_data, linker);
     nvdimm_build_ssdt(device_list, table_offsets, table_data, linker,
-                      dsm_dma_arrea);
+                      acpi_nvdimm_state);
     g_slist_free(device_list);
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fbba461..54b09a9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2632,7 +2632,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     }
     if (pcms->acpi_nvdimm_state.is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
-                          pcms->acpi_nvdimm_state.dsm_mem);
+                          &pcms->acpi_nvdimm_state);
     }
 
     /* Add tables supplied by user (if any) */
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index a07dc81..b624f59 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -298,7 +298,13 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index c0b9961..779ac32 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -263,7 +263,13 @@ static void pc_q35_init(MachineState *machine)
     }
 
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_init_acpi_state(&pcms->acpi_nvdimm_state, system_io,
+        AcpiNVDIMMState *acpi_nvdimm_state = &pcms->acpi_nvdimm_state;
+
+        acpi_nvdimm_state->dsm_io.type = NVDIMM_ACPI_IO_PORT;
+        acpi_nvdimm_state->dsm_io.base = NVDIMM_ACPI_IO_BASE;
+        acpi_nvdimm_state->dsm_io.size = NVDIMM_ACPI_IO_LEN;
+
+        nvdimm_init_acpi_state(acpi_nvdimm_state, system_io,
                                pcms->fw_cfg, OBJECT(pcms));
     }
 }
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 1cfe9e0..8c917c3 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -98,10 +98,25 @@ typedef struct NVDIMMClass NVDIMMClass;
 #define NVDIMM_ACPI_IO_BASE     0x0a18
 #define NVDIMM_ACPI_IO_LEN      4
 
+typedef enum {
+    NVDIMM_ACPI_IO_PORT = 0X00,
+    NVDIMM_ACPI_IO_MEMORY = 0X01,
+} AcpiNVDIMMIOType;
+
+struct AcpiNVDIMMIOEntry {
+    AcpiNVDIMMIOType type;
+    hwaddr base;
+    hwaddr size;
+};
+typedef struct AcpiNVDIMMIOEntry AcpiNVDIMMIOEntry;
+
 struct AcpiNVDIMMState {
     /* detect if NVDIMM support is enabled. */
     bool is_enabled;
 
+    /* NVDIMM IO Type, Address, and Size */
+    AcpiNVDIMMIOEntry dsm_io;
+
     /* the data of the fw_cfg file NVDIMM_DSM_MEM_FILE. */
     GArray *dsm_mem;
     /* the IO region used by OSPM to transfer control to QEMU. */
@@ -112,5 +127,5 @@ typedef struct AcpiNVDIMMState AcpiNVDIMMState;
 void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker, GArray *dsm_dma_arrea);
+                       BIOSLinker *linker, AcpiNVDIMMState *acpi_nvdimm_state);
 #endif
-- 
2.5.0

