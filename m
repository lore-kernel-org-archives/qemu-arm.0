Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4890314njc;
        Fri, 8 Nov 2024 04:57:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXR5u4T6yWZPbBRjC750nk6ZE5LBV8gTJDGvc1kc5rthFsVPrWSO+sTTv1h3l03ALhP/jJg6y9VBx/Kfg==@linaro.org
X-Google-Smtp-Source: AGHT+IH1GKQVB4cf0QyMzxd/wTG6T41vk1B1a6S7pYQO+MRAtnaudK6hJi/4tpfL4rd5EsKO+ozf
X-Received: by 2002:a05:620a:4515:b0:7ae:d2d0:190d with SMTP id af79cd13be357-7b331eaff0cmr337123685a.32.1731070654285;
        Fri, 08 Nov 2024 04:57:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731070654; cv=none;
        d=google.com; s=arc-20240605;
        b=YYg62dIorpWhYkxkoucrXs1dxoYt1hOgkR8OSZejfWyUKkOTz9kM1woL+qhgQSaFbS
         nDOl42n+tlZfLFqXg5uuquHJCaB+sampNKkL7BYqhW0B0znfqtHLyZbUx75oKwnj1GPe
         LC8FdmAtwSenRpeWGkbCzyLUzyQPhlaYBpGSrMz1aTT9AhAb/6uIu21u2dTzmIXqPsgH
         1CL1YsCb28at8VGdlkfX7mJQMj8mf6jYYQLHqcHRLOpheU8pSZndcibk+JNqlYSEl1qJ
         LI3/B8vyxRWzfz8dI8P9OFUpcJq/iwR+Y6+TsM+EhGkSPtXLYeqaB3Cd3qqSP1DrMk2V
         lZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=zYfjLUcCZrcX3KRe3r7yUavDTFpH1pcfdojWhmK6+9g=;
        fh=cBv4SKPzbf4CEhFYoUFnssX5GAjcCEGzof5+BStAs6s=;
        b=K5OWgUyqkYf/Dx1Is9+0ayL0YR94gOIvqYAVZE83hD4h1LAX60yrFVqvtO4iATIp6w
         PS+8Q2XQgKIM9/0v8cupVKEHWnhiDZvGjEEMWa0Xz1x2mSneg80lLq4AVuXmrK+BTtQl
         1RHoGpilaeS6KXpds0k37RQtZvl1W6dbm5CDXvLXcvpFrWmsXY5kwwfiFdztaFEwKc9D
         glc9Eb7lJty2fBO/CT9Z+iIcr1YkT10SRV8ivO2G2iBhosdrp62mHDjLt05Y8CLLZrl0
         wyRc9qjpVwo2xv7V41omhMBQ06FwuoL/LPKKDu+2cQQrrHSZ8x78x0SljhmOfjmPAotA
         KwoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ac59d78si416499185a.206.2024.11.08.04.57.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 04:57:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t9OXK-00054K-Ct; Fri, 08 Nov 2024 07:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OXI-00053s-Tt; Fri, 08 Nov 2024 07:56:24 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OXG-0006hf-Qf; Fri, 08 Nov 2024 07:56:24 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XlJlW3088z6J768;
 Fri,  8 Nov 2024 20:53:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 15B6D1400CA;
 Fri,  8 Nov 2024 20:56:21 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 13:56:15 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions to
 handle MSI nested binding
Date: Fri, 8 Nov 2024 12:52:42 +0000
Message-ID: <20241108125242.60136-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yD8T0Os8h7Nq

From: Eric Auger <eric.auger@redhat.com>

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
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 77 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 68 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ec4cdfb2d7..f327ca59ec 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -132,6 +132,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
         .bus    = vms->bus,
     };
 
+    /*
+     * Nested SMMU requires RMRs for MSI 1-1 mapping, which
+     * require _DSM for PreservingPCI Boot Configurations
+     */
+    if (vms->iommu == VIRT_IOMMU_SMMUV3_NESTED) {
+        cfg.preserve_config = true;
+    }
+
     if (vms->highmem_mmio) {
         cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
     }
@@ -216,16 +224,16 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
  *
  * Note that @id_count gets internally subtracted by one, following the spec.
  */
-static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
-                                  uint32_t id_count, uint32_t out_ref)
+static void
+build_iort_id_mapping(GArray *table_data, uint32_t input_base,
+                      uint32_t id_count, uint32_t out_ref, uint32_t flags)
 {
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
     /* Number of IDs - The number of IDs in the range minus one */
     build_append_int_noprefix(table_data, id_count - 1, 4);
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
-    /* Flags */
-    build_append_int_noprefix(table_data, 0 /* Single mapping (disabled) */, 4);
+    build_append_int_noprefix(table_data, flags, 4); /* Flags */
 }
 
 struct AcpiIortIdMapping {
@@ -267,6 +275,50 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
     return idmap_a->input_base - idmap_b->input_base;
 }
 
+static void
+build_iort_rmr_nodes(GArray *table_data, GArray *smmu_idmaps,
+                     size_t *smmu_offset, uint32_t *id)
+{
+    AcpiIortIdMapping *range;
+    int i;
+
+    for (i = 0; i < smmu_idmaps->len; i++) {
+        range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
+        int bdf = range->input_base;
+
+        /* Table 18 Reserved Memory Range Node */
+
+        build_append_int_noprefix(table_data, 6 /* RMR */, 1); /* Type */
+        /* Length */
+        build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE + 20, 2);
+        build_append_int_noprefix(table_data, 3, 1); /* Revision */
+        build_append_int_noprefix(table_data, *id, 4); /* Identifier */
+        /* Number of ID mappings */
+        build_append_int_noprefix(table_data, 1, 4);
+        /* Reference to ID Array */
+        build_append_int_noprefix(table_data, 28, 4);
+
+        /* RMR specific data */
+
+        /* Flags */
+        build_append_int_noprefix(table_data, 0 /* Disallow remapping */, 4);
+        /* Number of Memory Range Descriptors */
+        build_append_int_noprefix(table_data, 1 , 4);
+        /* Reference to Memory Range Descriptors */
+        build_append_int_noprefix(table_data, 28 + ID_MAPPING_ENTRY_SIZE, 4);
+        build_iort_id_mapping(table_data, bdf, range->id_count, smmu_offset[i], 1);
+
+        /* Table 19 Memory Range Descriptor */
+
+        /* Physical Range offset */
+        build_append_int_noprefix(table_data, 0x8000000, 8);
+        /* Physical Range length */
+        build_append_int_noprefix(table_data, 0x100000, 8);
+        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+        *id += 1;
+    }
+}
+
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
@@ -284,7 +336,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
-    AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "IORT", .rev = 5, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
@@ -325,6 +377,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             }
 
             next_range.input_base = idmap->input_base + idmap->id_count;
+            if (vms->iommu == VIRT_IOMMU_SMMUV3_NESTED) {
+                nb_nodes++; /* RMR node per SMMU */
+            }
         }
 
         /* Append the last RC -> ITS ID mapping */
@@ -386,7 +441,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET, 0);
     }
 
     /* Table 17 Root Complex Node */
@@ -427,7 +482,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the smmuv3 node */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, smmu_offset[i]);
+                                  range->id_count, smmu_offset[i], 0);
         }
 
         /* bypassed RIDs connect to ITS group node directly: RC -> ITS */
@@ -435,11 +490,15 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             range = &g_array_index(its_idmaps, AcpiIortIdMapping, i);
             /* output IORT node is the ITS group node (the first node) */
             build_iort_id_mapping(table_data, range->input_base,
-                                  range->id_count, IORT_NODE_OFFSET);
+                                  range->id_count, IORT_NODE_OFFSET, 0);
         }
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET);
+        build_iort_id_mapping(table_data, 0, 0x10000, IORT_NODE_OFFSET, 0);
+    }
+
+    if (vms->iommu == VIRT_IOMMU_SMMUV3_NESTED) {
+        build_iort_rmr_nodes(table_data, smmu_idmaps, smmu_offset, &id);
     }
 
     acpi_table_end(linker, &table);
-- 
2.34.1

