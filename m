Received: by 10.28.71.27 with SMTP id u27csp846875wma;
        Fri, 19 Jan 2018 07:06:47 -0800 (PST)
X-Google-Smtp-Source: ACJfBouCW8L1slLO2BHFkMAdtZX9Vr0vRa1u/hjnEfGmNAzD0ggJaaHwVTz/rtaoWtcvz7g+/oVq
X-Received: by 10.37.217.144 with SMTP id q138mr42688857ybg.519.1516374407169;
        Fri, 19 Jan 2018 07:06:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516374407; cv=none;
        d=google.com; s=arc-20160816;
        b=OSxodHFENXhA0GIK7pEAfDt9kGGyyWqw7z1W7fd57ccOYD1tzo6D/1m2mid3frm48K
         YHv/brAgf+/hnLseQh7c7qTF+Mn9xfJp24iNtdm6/drsr01kB+VVoisEmd5W0J1OMw/V
         Hz6aXSRsEQ+oWTGQZVv93252gPxVPee9UNFsZtZFlmLCjIxgwztqno2zqz3OSx45KPIS
         EYYjLZtBh/jNOxv1Tc2956QG/a6fn2mDlEMdsa6s1gbPhtwNt244tAfttjd/PBvGLejN
         PLYYRgo8v7H6ky21CkI9Xwt2S6g8rbvobqhu0Bp2i8fFpxshiOiyuCLoUe4hpSF0L3o0
         OL9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=HGbO2QFoXOeZtTcLdOsxf9eidR3zm/sgpmtMxEJmFE0=;
        b=YcMIC2oMNgb4ghICYLu4udLJZrOvllK1+r+DGsLzDYpiOkVJl20JVm5s8OtvaQY+Og
         HnzgaxRGwYip5ObyUC8KUWVCW2kMqGT97M9IJ/5ks38pclZFzD8dlTcF9v4WtgNUks2Q
         POrY2MXpJI7kcl1mNRzuREfietsUC4ItlQLZP1Jge1zRLh87pK6H5yT8Bmvi3I3p8up5
         Q7At03YbTwi74SxmfLpCEUOPUmt62eNQ05NjG/TBvMG21hzgUNxrkN+iSt3WGOUJQyxL
         mVb0FTRKooVAXv1Ff21yLNkWdUMQdq6uQDmyAbciFQkag9Z0zUJMiaaZ3QaIb5GnWRFA
         lj9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h2si767315ywa.668.2018.01.19.07.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Jan 2018 07:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54231 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ecYFi-0001Rc-I7
	for alex.bennee@linaro.org; Fri, 19 Jan 2018 10:06:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYFQ-0001Oa-Rr
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:06:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ecYFO-0002lC-MM
	for qemu-arm@nongnu.org; Fri, 19 Jan 2018 10:06:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ecYFO-0002iC-DG; Fri, 19 Jan 2018 10:06:26 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C93E80478;
	Fri, 19 Jan 2018 15:06:25 +0000 (UTC)
Received: from AMD.redhat.com (ovpn-116-129.ams2.redhat.com [10.36.116.129])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F27635C1B7;
	Fri, 19 Jan 2018 15:06:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	alex.williamson@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, jean-philippe.brucker@arm.com
Date: Fri, 19 Jan 2018 14:49:11 +0000
Message-Id: <1516373355-305-19-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
References: <1516373355-305-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 19 Jan 2018 15:06:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 18/22] hw/arm/virt-acpi-build: Add virtio-iommu
 node in IORT table
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
Cc: kevin.tian@intel.com, marc.zyngier@arm.com, tn@semihalf.com,
	will.deacon@arm.com, drjones@redhat.com, peterx@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwF9nBkkoeB8

This patch builds the virtio-iommu node in the ACPI IORT table.
The dt node creation function fills the information used by
the IORT table generation function (base address, base irq,
type of the smmu).

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in smmuv3, which in turn
maps to deviceid space 0x0-0x10000 in the ITS group.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 55 +++++++++++++++++++++++++++++++++++++++------
 hw/arm/virt.c               |  5 +++++
 include/hw/acpi/acpi-defs.h | 21 ++++++++++++++++-
 include/hw/arm/virt.h       | 13 +++++++++++
 4 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f7fa795..371edde 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/arm/virt.h"
 #include "sysemu/numa.h"
 #include "kvm_arm.h"
@@ -393,18 +394,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
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
+    AcpiIortPVIommu *iommu;
+    size_t node_size, iort_length, iommu_offset = 0;
     AcpiIortRC *rc;
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
+    if (vms->iommu_info.type) {
+        nb_nodes = 3; /* RC, ITS, IOMMU */
+    } else {
+        nb_nodes = 2; /* RC, ITS */
+    }
+
     iort_length = sizeof(*iort);
+    iort->node_count = cpu_to_le32(nb_nodes);
     iort->node_count = cpu_to_le32(2); /* RC and ITS nodes */
     iort->node_offset = cpu_to_le32(sizeof(*iort));
 
@@ -418,6 +427,32 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     its->its_count = cpu_to_le32(1);
     its->identifiers[0] = 0; /* MADT translation_id */
 
+    if (vms->iommu_info.type == VIRT_IOMMU_VIRTIO) {
+
+        /* Para-virtualized IOMMU node */
+        iommu_offset = cpu_to_le32(iort->node_offset + node_size);
+        node_size = sizeof(*iommu) + sizeof(*idmap);
+        iort_length += node_size;
+        iommu = acpi_data_push(table_data, node_size);
+
+        iommu->type = ACPI_IORT_NODE_PARAVIRT;
+        iommu->length = cpu_to_le16(node_size);
+        iommu->base_address = cpu_to_le64(vms->iommu_info.reg.base);
+        iommu->span = cpu_to_le64(vms->iommu_info.reg.size);
+        iommu->model = ACPI_IORT_NODE_PV_VIRTIO_IOMMU;
+        iommu->flags = ACPI_IORT_NODE_PV_CACHE_COHERENT;
+        iommu->interrupt_count = 1;
+        iommu->interrupts[0] = cpu_to_le64(vms->iommu_info.irq_base);
+
+        /* Identity RID mapping covering the whole input RID range */
+        idmap = &iommu->id_mapping_array[0];
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
@@ -438,10 +473,16 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     idmap->input_base = 0;
     idmap->id_count = cpu_to_le32(0xFFFF);
     idmap->output_base = 0;
-    /* output IORT node is the ITS group node (the first node) */
-    idmap->output_reference = cpu_to_le32(iort->node_offset);
 
-    iort->length = cpu_to_le32(iort_length);
+    if (vms->iommu_info.type) {
+        /* output IORT node is the smmuv3 node */
+        idmap->output_reference = cpu_to_le32(iommu_offset);
+    } else {
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort->node_offset);
+    }
+
+   iort->length = cpu_to_le32(iort_length);
 
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
                  "IORT", table_data->len - iort_start, 0, NULL, NULL);
@@ -786,7 +827,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
-        build_iort(tables_blob, tables->linker);
+        build_iort(tables_blob, tables->linker, vms);
     }
 
     /* XSDT is pointed to by RSDP */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5584109..ad5d7ea 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1027,6 +1027,11 @@ static void virtio_iommu_notifier(Notifier *notifier, void *data)
 
     object_property_set_bool(obj, false, "msi_bypass", &error_fatal);
 
+    vms->iommu_info.type = VIRT_IOMMU_VIRTIO;
+    vms->iommu_info.reg.base = vms->memmap[VIRT_IOMMU].base;
+    vms->iommu_info.reg.size = vms->memmap[VIRT_IOMMU].size;
+    vms->iommu_info.irq_base = vms->irqmap[VIRT_IOMMU];
+
     qemu_fdt_setprop_cells(fdt, vms->pcie_host_nodename, "iommu-map",
                            0x0, vms->iommu_phandle, 0x0, 0x10000);
 }
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 80c8099..dd8f806 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -673,7 +673,8 @@ enum {
         ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
         ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
         ACPI_IORT_NODE_SMMU = 0x03,
-        ACPI_IORT_NODE_SMMU_V3 = 0x04
+        ACPI_IORT_NODE_SMMU_V3 = 0x04,
+        ACPI_IORT_NODE_PARAVIRT = 0x05
 };
 
 struct AcpiIortIdMapping {
@@ -700,6 +701,24 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+struct AcpiIortPVIommu {
+    ACPI_IORT_NODE_HEADER_DEF
+    uint64_t base_address;
+    uint64_t span;
+    uint32_t model;
+    uint32_t flags;
+    uint32_t interrupt_count;
+    uint64_t interrupts[1];
+    AcpiIortIdMapping id_mapping_array[0];
+} QEMU_PACKED;
+typedef struct AcpiIortPVIommu AcpiIortPVIommu;
+
+enum {
+    ACPI_IORT_NODE_PV_VIRTIO_IOMMU = 0x00,
+};
+
+#define ACPI_IORT_NODE_PV_CACHE_COHERENT    (1 << 0)
+
 struct AcpiIortRC {
     ACPI_IORT_NODE_HEADER_DEF
     AcpiIortMemoryAccess memory_properties;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index a13b895..2e1e907 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -89,6 +89,18 @@ typedef struct {
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
@@ -98,6 +110,7 @@ typedef struct {
     bool highmem;
     bool its;
     bool virt;
+    VirtIOMMUInfo iommu_info;
     int32_t gic_version;
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
-- 
1.9.1

