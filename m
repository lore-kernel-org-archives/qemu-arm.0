Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4688296lfp;
        Tue, 5 Oct 2021 02:03:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKjRacO2cLj4d2jFrE0LzhOYsHznYcY4RP0rU5VJfz5viTOSu2hwBROclej07zdJRiWwnU
X-Received: by 2002:a9f:384f:: with SMTP id q15mr10465101uad.136.1633424581145;
        Tue, 05 Oct 2021 02:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633424581; cv=none;
        d=google.com; s=arc-20160816;
        b=nlEdndkPgkwR/DJbo7ptj6dlkI4LtibUTg7JQT0lt3UIjYWm3QOBoE/4oPt179abtu
         oBpiHY1u1cqbDIQZwd88Y5y2nx0ghEF34ShOvFKxQ7lrLaXfTqFTogp/9JUJU6lDA1hz
         W/UOn9xi56VFkbYWKm8L1Unbf8359O7X4Go8gLOBj5lYpjFihq+HWkfXg265y/AZxFWY
         AXZUPVs6EIANkdveR2FHWsZ2EcueXWmsGPWSUYREAWbJ/Ei+J9VAmdlhnF3UTdI2VBON
         2PLYR5vnxMs/oa1SgnYV2wRboJfQlcs7nrIuj1yrwyLfnAKboDBVazQKRHccUSLl5Sr2
         Op1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Zo/avjgEO+kgqlLXIvhQvoMzovaLg8TIkxTOLsrCIy0=;
        b=HyUT9SLfCIzOXPNA3rSnKnkrbJQ5piYq9bFvaRLonpZygJySUbeu6dt2MJdoVFFKJY
         R4ovkx+mZcOOMmZvxBdbtMql3YfXoYrnxEUes5RPTuMNSQZKjnjqchI2as9V/TZdnX4+
         6eLJ3H7pmxumfaA0Vjp8D8bWo1YFaPTywy8MJB660F/jFEyVGYxGM6ViHJO+HqQZLA9C
         Rock3waKKcEHP48c+wfK87v85YuucnpEAaikxR7kWc+7dSizZEWPdAgU+MzBi+XKZydJ
         yBbbjS9COZD1Sa3lqsK7e/zwwMIVss4MEkTt2xnpFQKEAkS4pMAkT4Baa5hzTB8FxAg7
         mGBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhWIOm0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17si8955713uar.85.2021.10.05.02.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 02:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LhWIOm0t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXgLk-0002tv-D2
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 05:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCe-0007kp-Nj
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:53:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mXgCc-0007Vf-IM
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 04:53:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633424014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zo/avjgEO+kgqlLXIvhQvoMzovaLg8TIkxTOLsrCIy0=;
 b=LhWIOm0tsMCNFxDYYYMZD9ClftMpI1XYQNHX72tknu/MZTxXDVwTMA5RRIB9k6g4b6V3Zw
 Ra073ZJH3xNC0XZN0gbRqc05wbuDndN0FBEZG+U+MqtemHMaXVTvJSjS08fRXs9pkBMXJ0
 0MjYn+55NolcLrWOUqeo5M+hEJZiqvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-aFJnMD9eO1yd3WCkASznIg-1; Tue, 05 Oct 2021 04:53:33 -0400
X-MC-Unique: aFJnMD9eO1yd3WCkASznIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C9FF19057A0;
 Tue,  5 Oct 2021 08:53:31 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B632460843;
 Tue,  5 Oct 2021 08:53:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 philmd@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 shameerali.kolothum.thodi@huawei.com, ardb@kernel.org,
 jean-philippe@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 drjones@redhat.com
Subject: [RFC v2 2/2] hw/arm/virt-acpi-build: Add IORT RMR regions to handle
 MSI nested binding
Date: Tue,  5 Oct 2021 10:53:13 +0200
Message-Id: <20211005085313.493858-3-eric.auger@redhat.com>
In-Reply-To: <20211005085313.493858-1-eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UBlV4K0kLvgp

To handle SMMUv3 nested stage support it is practical to
expose the guest with reserved memory regions (RMRs)
covering the IOVAs used by the host kernel to map
physical MSI doorbells.

Those IOVAs belong to [0x8000000, 0x8100000] matching
MSI_IOVA_BASE and MSI_IOVA_LENGTH definitions in kernel
arm-smmu-v3 driver. This is the window used to allocate
IOVAs matching physical MSI doorbells.

With those RMRs, the guest is forced to use a flat mapping
for this range. Hence the assigned device is programmed
with one IOVA from this range. Stage 1, owned by the guest
has a flat mapping for this IOVA. Stage2, owned by the VMM
then enforces a mapping from this IOVA to the physical
MSI doorbell.

At IORT table level, due to the single mapping flag being
set on the ID mapping, 256 IORT RMR nodes need to be
created per bus. This looks awkward from a specification
and implementation point of view.

This may also produce a warning at execution time:
qemu-system-aarch64: warning: ACPI table size 114709 exceeds
65536 bytes, migration may not work
(here with 5 pcie root ports, ie. 256 * 6 = 1536 RMR nodes!).

The creation of those RMR nodes only is relevant if nested
stage SMMU is in use, along with VFIO. As VFIO devices can be
hotplugged, all RMRs need to be created in advance. Hence
the patch introduces a new arm virt "nested-smmuv3" iommu type.

ARM DEN 0049E.b IORT specification also mandates that when
RMRs are present, the OS must preserve PCIe configuration
performed by the boot FW. So along with the RMR IORT nodes,
a _DSM function #5, as defined by PCI FIRMWARE SPECIFICATION
EVISION 3.3, chapter 4.6.5 is added to PCIe host bridge
and PCIe expander bridge objects.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

---

v1 -> v2:
- add DSM #5
- use identifier increment

Instead of introducing a new IOMMU type, we could introduce
an array of qdev_prop_reserved_region(s).

Guest can parse the IORT RMR nodes with Shammer's series:
[PATCH v7 0/9] ACPI/IORT: Support for IORT RMR node

The patch applies on Igor's v4 series [1]+ IORT E.b upgrade [2]
[1] [PATCH v4 00/35] acpi: refactor error prone build_header()
    and packed structures usage in ACPI tables
[2] [PATCH 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table
    up to revision E.b
---
 include/hw/arm/virt.h    |  7 ++++
 hw/arm/virt-acpi-build.c | 84 ++++++++++++++++++++++++++++++++++------
 hw/arm/virt.c            |  7 +++-
 3 files changed, 85 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b461b8d261..f2f8aee219 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -99,6 +99,7 @@ enum {
 typedef enum VirtIOMMUType {
     VIRT_IOMMU_NONE,
     VIRT_IOMMU_SMMUV3,
+    VIRT_IOMMU_NESTED_SMMUV3,
     VIRT_IOMMU_VIRTIO,
 } VirtIOMMUType;
 
@@ -190,4 +191,10 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
     return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
 }
 
+static inline bool virt_has_smmuv3(const VirtMachineState *vms)
+{
+    return vms->iommu == VIRT_IOMMU_SMMUV3 ||
+           vms->iommu == VIRT_IOMMU_NESTED_SMMUV3;
+}
+
 #endif /* QEMU_ARM_VIRT_H */
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 789bac3134..7260e47c83 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -169,6 +169,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .bus    = vms->bus,
     };
 
+    /*
+     * Nested SMMU requires RMRs for MSI 1-1 mapping, which
+     * require _DSM for PreservingPCI Boot Configurations
+     */
+    if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
+        cfg.preserve_config = true;
+    }
+
     if (use_highmem) {
         cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
     }
@@ -245,16 +253,16 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
-static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
-                                  uint32_t id_count, uint32_t out_ref)
+static void
+build_iort_id_mapping(GArray *table_data, uint32_t input_base,
+                      uint32_t id_count, uint32_t out_ref, uint32_t flags)
 {
     /* Table 4 ID mapping format */
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
     build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
-    /* Flags */
-    build_append_int_noprefix(table_data, 0 /* Single mapping */, 4);
+    build_append_int_noprefix(table_data, flags, 4); /* Flags */
 }
 
 struct AcpiIortIdMapping {
@@ -296,6 +304,50 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
     return idmap_a->input_base - idmap_b->input_base;
 }
 
+static void
+build_iort_rmr_nodes(GArray *table_data, GArray *smmu_idmaps, int smmu_offset, uint32_t *id) {
+    AcpiIortIdMapping *range;
+    int i, j;
+
+    for (i = 0; i < smmu_idmaps->len; i++) {
+        range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+        for (j = 0; j < range->id_count; j++) {
+            int bdf = range->input_base + j;
+
+            /* Table 18 Reserved Memory Range Node */
+
+            build_append_int_noprefix(table_data, 6 /* RMR */, 1); /* Type */
+            /* Length */
+            build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE + 20, 2);
+            build_append_int_noprefix(table_data, 1, 1); /* Revision */
+            build_append_int_noprefix(table_data, *id, 4); /* Identifier */
+            /* Number of ID mappings */
+            build_append_int_noprefix(table_data, 1, 4);
+            /* Reference to ID Array */
+            build_append_int_noprefix(table_data, 28, 4);
+
+            /* RMR specific data */
+
+            /* Flags */
+            build_append_int_noprefix(table_data, 0 /* Disallow remapping */, 4);
+            /* Number of Memory Range Descriptors */
+            build_append_int_noprefix(table_data, 1 , 4);
+            /* Reference to Memory Range Descriptors */
+            build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE, 4);
+            build_iort_id_mapping(table_data, bdf, 1, smmu_offset, 1);
+
+            /* Table 19 Memory Range Descriptor */
+
+            /* Physical Range offset */
+            build_append_int_noprefix(table_data, 0x8000000, 8);
+            /* Physical Range length */
+            build_append_int_noprefix(table_data, 0x100000, 8);
+            build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+	    *id += 1;
+        }
+    }
+}
+
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
@@ -317,12 +369,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+    if (virt_has_smmuv3(vms)) {
         AcpiIortIdMapping next_range = {0};
 
         object_child_foreach_recursive(object_get_root(),
                                        iort_host_bridges, smmu_idmaps);
 
+        nb_nodes = 3; /* RC, ITS, SMMUv3 */
+
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
 
@@ -339,6 +393,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             }
 
             next_range.input_base = idmap->input_base + idmap->id_count;
+            if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
+                nb_nodes += idmap->id_count;
+            }
         }
 
         /* Append the last RC -> ITS ID mapping */
@@ -347,7 +404,6 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             g_array_append_val(its_idmaps, next_range);
         }
 
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
         rc_mapping_count = smmu_idmaps->len + its_idmaps->len;
     } else {
         nb_nodes = 2; /* RC, ITS */
@@ -372,7 +428,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* GIC ITS Identifier Array */
     build_append_int_noprefix(table_data, 0 /* MADT translation_id */, 4);
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+    if (virt_has_smmuv3(vms)) {
         int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
 
         smmu_offset = table_data->len - table.table_offset;
@@ -402,7 +458,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET, 0);
     }
 
     /* Table 17 Root Complex Node */
@@ -435,7 +491,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, 0, 3); /* Reserved */
 
     /* Output Reference */
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+    if (virt_has_smmuv3(vms)) {
         AcpiIortIdMapping *range;
 
         /* translated RIDs connect to SMMUv3 node: RC -> SMMUv3 -> ITS */
@@ -443,7 +499,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the smmuv3 node */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, smmu_offset);
+                                  range->id_count, smmu_offset, 0);
         }
 
         /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
@@ -451,11 +507,15 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the ITS group node (the first node) */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, iort_node_offset);
+                                  range->id_count, iort_node_offset, 0);
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET, 0);
+    }
+
+    if (vms->iommu == VIRT_IOMMU_NESTED_SMMUV3) {
+        build_iort_rmr_nodes(table_data, smmu_idmaps, smmu_offset, &id);
     }
 
     acpi_table_end(linker, &table);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1d59f0e59f..f538611f4e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1251,7 +1251,7 @@ static void create_smmu(const VirtMachineState *vms,
     DeviceState *dev;
     MachineState *ms = MACHINE(vms);
 
-    if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
+    if (!virt_has_smmuv3(vms) || !vms->iommu_phandle) {
         return;
     }
 
@@ -1441,6 +1441,7 @@ static void create_pcie(VirtMachineState *vms)
 
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
+        case VIRT_IOMMU_NESTED_SMMUV3:
             create_smmu(vms, vms->bus);
             qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
                                    0x0, vms->iommu_phandle, 0x0, 0x10000);
@@ -2314,6 +2315,8 @@ static char *virt_get_iommu(Object *obj, Error **errp)
         return g_strdup("none");
     case VIRT_IOMMU_SMMUV3:
         return g_strdup("smmuv3");
+    case VIRT_IOMMU_NESTED_SMMUV3:
+        return g_strdup("nested-smmuv3");
     default:
         g_assert_not_reached();
     }
@@ -2325,6 +2328,8 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
 
     if (!strcmp(value, "smmuv3")) {
         vms->iommu = VIRT_IOMMU_SMMUV3;
+    } else if (!strcmp(value, "nested-smmuv3")) {
+        vms->iommu = VIRT_IOMMU_NESTED_SMMUV3;
     } else if (!strcmp(value, "none")) {
         vms->iommu = VIRT_IOMMU_NONE;
     } else {
-- 
2.26.3

