Received: by 10.223.188.70 with SMTP id a6csp1296169wrh;
        Fri, 1 Sep 2017 10:32:12 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4PNEGrBOtsYkmYREwY56JAcazyDAkeAo8K9TugRIrlLtqtmICAMflA0T6AD9YGY4I0zVrk
X-Received: by 10.200.53.247 with SMTP id l52mr4144717qtb.80.1504287132465;
        Fri, 01 Sep 2017 10:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504287132; cv=none;
        d=google.com; s=arc-20160816;
        b=Od/ptquHsVMgJ7H3TmLcl1iC+o8NB2Fug2gn4l6OG8ldT1WB5nV4CWdWHnQ4SRsjFE
         mqrp6OMR490ztZ89tu1DQQvSNKRYmuQmY24ISRXRxwbO8LQfOVtGq5fmfmREVulj6EA8
         GuWs93iky69H7VPa/Yeybq9/0KPEvURV3ZvT2M8BN44FbPQhGCLP8Rkl3TDEbSpG0J47
         ByTQVfiXPtPlpattbQwcqciP5cOl3KMXQ219paILlkuOuqc5wGRC6kzf5Uhoh19PavHI
         GaP+o01o6LJSUMnnNqdNvMLDuxv0SkxA9wHl1A80Co7sMKG8IaiR+HwTynYGlTHbL9jj
         Jxlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=QDDNGDX8v1to9hywVmQhocatIpK6unDuaQFVl4pZpFA=;
        b=aFffsXipaReho3//bwNcyjSOcV9YABXSFKoXDmBXIv9UtHCWJa7J9Mg1655i+F7yFX
         vyggKOZkAPrGNIQQiLoZMr+7QA+ernSZTr6V8pmt1F2oEUi8Lp0vrnr2km+BHolczB3G
         5xCr8uLTJC2VkfOpChl8XuozSM0psH1ZTqbRfiY5iw/OfbYL57TyP4H59YDNPvRsxmQ0
         PC7trapsmJnMUvACsBwoEQ2kY+Ss771aCp9hKVN2kqMTzHpGOm8RW03fxvVuqrj25bAR
         BSL2PaO+GSlg2twvU8iZjdOdlKyU1Wb99Dz6ltVa8NhAeObcMeoQaYhi/uDrjJ6B+zFz
         9fXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32si621172qtb.298.2017.09.01.10.32.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Sep 2017 10:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnpne-0006Zr-3U
	for alex.bennee@linaro.org; Fri, 01 Sep 2017 13:32:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgM-000718-Gm
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dnpgL-0004ND-5E
	for qemu-arm@nongnu.org; Fri, 01 Sep 2017 13:24:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dnpgK-0004MN-Qq; Fri, 01 Sep 2017 13:24:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC50691FD5;
	Fri,  1 Sep 2017 17:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CC50691FD5
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-241.ams2.redhat.com
	[10.36.117.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8041417100;
	Fri,  1 Sep 2017 17:24:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, prem.mallappa@gmail.com,
	alex.williamson@redhat.com
Date: Fri,  1 Sep 2017 19:21:21 +0200
Message-Id: <1504286483-23327-19-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Sep 2017 17:24:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7 18/20] hw/arm/virt-acpi-build: Add smmuv3 node
 in IORT table
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	bharat.bhushan@nxp.com, christoffer.dall@linaro.org, wtownsen@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sPd0J0pxy8hL

From: Prem Mallappa <prem.mallappa@broadcom.com>

This patch builds the smmuv3 node in the ACPI IORT table. As
the smmu is dynamically instantianted using the platform bus,
the dt node creation function fills the information used by
the IORT table generation function (base address, base irq,
type of the smmu).

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in smmuv3, which in turn
maps to deviceid space 0x0-0x10000 in the ITS group.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v6 -> v7:
- adapt to the fact the smmuv3 now is dynamically instantiated.
- inverse sync and gerror interrupts

v2 -> v3:
- integrate into the existing IORT table made up of ITS, RC nodes
- take into account vms->smmu
- match linux actbl2.h acpi_iort_smmu_v3 field names
---
 hw/arm/sysbus-fdt.c         |  5 ++++
 hw/arm/virt-acpi-build.c    | 58 +++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi-defs.h | 15 ++++++++++++
 include/hw/arm/virt.h       | 13 ++++++++++
 4 files changed, 84 insertions(+), 7 deletions(-)

diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
index 9bbfbde..4583acf 100644
--- a/hw/arm/sysbus-fdt.c
+++ b/hw/arm/sysbus-fdt.c
@@ -487,6 +487,11 @@ static int add_smmuv3_fdt_node(SysBusDevice *sbdev, void *opaque)
     qemu_fdt_setprop_cells(guest_fdt, node_path, "iommu-map",
                      0x0, smmu_phandle, 0x0, 0x10000);
 
+    vms->smmu_info.type = VIRT_IOMMU_SMMUV3;
+    vms->smmu_info.reg.base = data->base + mmio_base;
+    vms->smmu_info.reg.size = 0x20000;
+    vms->smmu_info.irq_base = irq_number;
+
     g_free(nodename);
     g_free(node_path);
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..8395898 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
+#include "hw/arm/smmuv3.h"
 #include "sysemu/numa.h"
 #include "kvm_arm.h"
 
@@ -393,19 +394,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 }
 
 static void
-build_iort(GArray *table_data, BIOSLinker *linker)
+build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-    int iort_start = table_data->len;
+    int nb_nodes, iort_start = table_data->len;
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
-    size_t node_size, iort_length;
+    AcpiIortSmmu3 *smmu;
+    size_t node_size, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
+    if (vms->smmu_info.type) {
+        nb_nodes = 3; /* RC, ITS, SMMUv3 */
+    } else {
+        nb_nodes = 2; /* RC, ITS */
+    }
+
     iort_length = sizeof(*iort);
-    iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
+    iort->node_count = cpu_to_le32(nb_nodes);
     iort->node_offset = cpu_to_le32(sizeof(*iort));
 
     /* ITS group node */
@@ -418,6 +426,36 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     its->its_count = cpu_to_le32(1);
     its->identifiers[0] = 0; /* MADT translation_id */
 
+    if (vms->smmu_info.type == VIRT_IOMMU_SMMUV3) {
+        int irq =  vms->smmu_info.irq_base;
+
+        /* SMMUv3 node */
+        smmu_offset = cpu_to_le32(iort->node_offset + node_size);
+        node_size = sizeof(*smmu) + sizeof(*idmap);
+        iort_length += node_size;
+        smmu = acpi_data_push(table_data, node_size);
+
+
+        smmu->type = ACPI_IORT_NODE_SMMU_V3;
+        smmu->length = cpu_to_le16(node_size);
+        smmu->mapping_count = cpu_to_le32(1);
+        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
+        smmu->base_address = cpu_to_le64(vms->smmu_info.reg.base);
+        smmu->event_gsiv = cpu_to_le32(irq);
+        smmu->pri_gsiv = cpu_to_le32(irq + 1);
+        smmu->sync_gsiv = cpu_to_le32(irq + 2);
+        smmu->gerr_gsiv = cpu_to_le32(irq + 3);
+        smmu->flags = 0x1; /* COHACC Override */
+
+        /* Identity RID mapping covering the whole input RID range */
+        idmap = &smmu->id_mapping_array[0];
+        idmap->input_base = 0;
+        idmap->id_count = cpu_to_le32(0xFFFF);
+        idmap->output_base = 0;
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort->node_offset);
+    }
+
     /* Root Complex Node */
     node_size = sizeof(*rc) + sizeof(*idmap);
     iort_length += node_size;
@@ -438,8 +476,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     idmap->input_base = 0;
     idmap->id_count = cpu_to_le32(0xFFFF);
     idmap->output_base = 0;
-    /* output IORT node is the ITS group node (the first node) */
-    idmap->output_reference = cpu_to_le32(iort->node_offset);
+
+    if (vms->smmu_info.type) {
+        /* output IORT node is the smmuv3 node */
+        idmap->output_reference = cpu_to_le32(smmu_offset);
+    } else {
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort->node_offset);
+    }
 
     iort->length = cpu_to_le32(iort_length);
 
@@ -782,7 +826,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
-        build_iort(tables_blob, tables->linker);
+        build_iort(tables_blob, tables->linker, vms);
     }
 
     /* XSDT is pointed to by RSDP */
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 72be675..69307b7 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -697,6 +697,21 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+struct AcpiIortSmmu3 {
+    ACPI_IORT_NODE_HEADER_DEF
+    uint64_t base_address;
+    uint32_t flags;
+    uint32_t reserved2;
+    uint64_t vatos_address;
+    uint32_t model;
+    uint32_t event_gsiv;
+    uint32_t pri_gsiv;
+    uint32_t gerr_gsiv;
+    uint32_t sync_gsiv;
+    AcpiIortIdMapping id_mapping_array[0];
+} QEMU_PACKED;
+typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
+
 struct AcpiIortRC {
     ACPI_IORT_NODE_HEADER_DEF
     AcpiIortMemoryAccess memory_properties;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ae2bf2c..fd6f34f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -87,6 +87,18 @@ typedef struct {
     bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
+typedef enum VirtIOMMUType {
+    VIRT_IOMMU_NONE,
+    VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_VIRTIO,
+} VirtIOMMUType;
+
+typedef struct VirtIOMMUInfo {
+    VirtIOMMUType type;
+    MemMapEntry reg;
+    int irq_base;
+} VirtIOMMUInfo;
+
 typedef struct {
     MachineState parent;
     Notifier machine_done;
@@ -95,6 +107,7 @@ typedef struct {
     bool highmem;
     bool its;
     bool virt;
+    VirtIOMMUInfo smmu_info;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
-- 
2.5.5

