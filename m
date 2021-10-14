Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3958341lfc;
        Thu, 14 Oct 2021 04:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDSUwM65ncBggLfdzeFXM5dyfTatzAFzTUcTmCB+JBYNqfhCcVvjERM12i/xzu4+VPudxw
X-Received: by 2002:a05:6102:cd2:: with SMTP id g18mr6337874vst.25.1634212794226;
        Thu, 14 Oct 2021 04:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634212794; cv=none;
        d=google.com; s=arc-20160816;
        b=L//Zx/vHrOWCOTDIxtR+Xsp6ynVmz4qIMjgaRqMD+Zt/yCIM9NzAJh1nw4v9Ue4rph
         0FOmKZI0Ht9OG0Xs19cffYUJhRu6A5VHbWUeAayTFSsTqAZlMZ1Rt8pSapNt6+gHMt0l
         jkpOVZFhc6dQQbd5NA3lFr7FGeGE87RZkg/hi95gOp3Tsp0ujc2HLSN721KwiJqkbDgt
         BI3l4YfIg1B+9vnMAfMct0BK9jD879ftc0Ff99yUr6RCm5KoIWz9zISlcHQI78Y18Fcq
         L7aa6wF5DzabaIOUuaAs7UhraMIog7gM3h6KTFxUWA6OMwfmQxfe/zk+NEZevId49nGB
         AfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VRtl7hsCOPdKbLBV8sxGp/OqYOvYsdKEPq56xWBsmTM=;
        b=C+yTOlHtY3M7iwr4Fxu8aU8Bycnunl2FMxova5/EZk9GATuJwgsRzU/nmMeLgyGUzy
         D2m7dFFhMGkxecdLPZafLYVgdVsZ+3xAQfalNgHON2dbiQVnoiUStMzlBvv5D5KRnJtF
         ZNcFWnfjvoJDRmbntdj9rvpiTQAgUCk8pWiV80/tmdxht8iVH/uaI/TZ5KZcuf2IcF46
         xl7CCLKEQh+pipWcwN3W64jpO0wm6YnOSwr8HPcFF4jXeYTGUoD05CI0Pnr5t4eri/oA
         iINpq/rwtVDClE8gdCaaImh2aGnws7dOIelBVTxphESiGkUCMPWXQ+H4DH24az8RuCG+
         53Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4HumreA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si2726946vsp.113.2021.10.14.04.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 04:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f4HumreA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mazOr-00067Z-Gk
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 07:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMS-0001Dq-Ct
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMQ-0006De-Dm
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634212641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRtl7hsCOPdKbLBV8sxGp/OqYOvYsdKEPq56xWBsmTM=;
 b=f4HumreA5ryRcJ+hwgaSBQHe/hHWgIreghyGCOnGvfOIN63HwrkFmfeSKd77JGMb3hR9+f
 Ijl4NkvoQVCBLXvC17VuC5pBUeCFeRdvJrzSIwTrcGhEkrt19PYzFmM3ZzTTVemPa2bc+u
 VeCzmDXnro0ygJ8p+EFL5/4uFZ8S4lQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-XYESvK9pM7OQ1vbaQ0AKUg-1; Thu, 14 Oct 2021 07:57:18 -0400
X-MC-Unique: XYESvK9pM7OQ1vbaQ0AKUg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00DBB801AA7;
 Thu, 14 Oct 2021 11:57:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1863E19D9F;
 Thu, 14 Oct 2021 11:57:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 mst@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, shameerali.kolothum.thodi@huawei.com,
 ardb@kernel.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v3 2/3] hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
Date: Thu, 14 Oct 2021 13:56:42 +0200
Message-Id: <20211014115643.756977-3-eric.auger@redhat.com>
In-Reply-To: <20211014115643.756977-1-eric.auger@redhat.com>
References: <20211014115643.756977-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/E6eDSfNbYH

Upgrade the IORT table from B to E.b specification
revision (ARM DEN 0049E.b).

The SMMUv3 and root complex node have additional
fields. Also unique IORT node identifiers are
introduced: they are generated in sequential order.
They are not cross-referenced though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---

v2 -> v3:
- added Jean and Igor's R-b
- added comment about node IDs in the commit msg (Igor)
---
 hw/arm/virt-acpi-build.c | 48 ++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 19 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index dd17a48c00e..d3bb4cba3ed 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -241,19 +241,20 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #endif
 
 #define ID_MAPPING_ENTRY_SIZE 20
-#define SMMU_V3_ENTRY_SIZE 60
-#define ROOT_COMPLEX_ENTRY_SIZE 32
+#define SMMU_V3_ENTRY_SIZE 68
+#define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
 static void build_iort_id_mapping(GArray *table_data, uint32_t input_base,
                                   uint32_t id_count, uint32_t out_ref)
 {
-    /* Identity RID mapping covering the whole input RID range */
+    /* Table 4 ID mapping format */
     build_append_int_noprefix(table_data, input_base, 4); /* Input base */
     build_append_int_noprefix(table_data, id_count, 4); /* Number of IDs */
     build_append_int_noprefix(table_data, input_base, 4); /* Output base */
     build_append_int_noprefix(table_data, out_ref, 4); /* Output Reference */
-    build_append_int_noprefix(table_data, 0, 4); /* Flags */
+    /* Flags */
+    build_append_int_noprefix(table_data, 0 /* Single mapping (disabled) */, 4);
 }
 
 struct AcpiIortIdMapping {
@@ -298,7 +299,7 @@ static int iort_idmap_compare(gconstpointer a, gconstpointer b)
 /*
  * Input Output Remapping Table (IORT)
  * Conforms to "IO Remapping Table System Software on ARM Platforms",
- * Document number: ARM DEN 0049B, October 2015
+ * Document number: ARM DEN 0049E.b, Feb 2021
  */
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -307,10 +308,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const uint32_t iort_node_offset = IORT_NODE_OFFSET;
     size_t node_size, smmu_offset = 0;
     AcpiIortIdMapping *idmap;
+    uint32_t id = 0;
     GArray *smmu_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
     GArray *its_idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
 
-    AcpiTable table = { .sig = "IORT", .rev = 0, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "IORT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
     /* Table 2 The IORT */
     acpi_table_begin(&table, table_data);
@@ -358,12 +360,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     build_append_int_noprefix(table_data, IORT_NODE_OFFSET, 4);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
 
-    /* 3.1.1.3 ITS group node */
+    /* Table 12 ITS Group Format */
     build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
     node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
     build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 0, 1); /* Revision */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 1, 1); /* Revision */
+    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
     build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
     build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
     build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
@@ -374,19 +376,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
 
         smmu_offset = table_data->len - table.table_offset;
-        /* 3.1.1.2 SMMUv3 */
+        /* Table 9 SMMUv3 Format */
         build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
         node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
         build_append_int_noprefix(table_data, node_size, 2); /* Length */
-        build_append_int_noprefix(table_data, 0, 1); /* Revision */
-        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+        build_append_int_noprefix(table_data, 4, 1); /* Revision */
+        build_append_int_noprefix(table_data, id++, 4); /* Identifier */
         build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
         /* Reference to ID Array */
         build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
         /* Base address */
         build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
         /* Flags */
-        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
+        build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
         build_append_int_noprefix(table_data, 0, 4); /* Reserved */
         build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
         /* Model */
@@ -395,35 +397,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
         build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
         build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
+        build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
+        /* DeviceID mapping index (ignored since interrupts are GSIV based) */
+        build_append_int_noprefix(table_data, 0, 4);
 
         /* output IORT node is the ITS group node (the first node) */
         build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
     }
 
-    /* Table 16 Root Complex Node */
+    /* Table 17 Root Complex Node */
     build_append_int_noprefix(table_data, 2 /* Root complex */, 1); /* Type */
     node_size =  ROOT_COMPLEX_ENTRY_SIZE +
                  ID_MAPPING_ENTRY_SIZE * rc_mapping_count;
     build_append_int_noprefix(table_data, node_size, 2); /* Length */
-    build_append_int_noprefix(table_data, 0, 1); /* Revision */
-    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
+    build_append_int_noprefix(table_data, 3, 1); /* Revision */
+    build_append_int_noprefix(table_data, id++, 4); /* Identifier */
     /* Number of ID mappings */
     build_append_int_noprefix(table_data, rc_mapping_count, 4);
     /* Reference to ID Array */
     build_append_int_noprefix(table_data, ROOT_COMPLEX_ENTRY_SIZE, 4);
 
-    /* Table 13 Memory access properties */
+    /* Table 14 Memory access properties */
     /* CCA: Cache Coherent Attribute */
     build_append_int_noprefix(table_data, 1 /* fully coherent */, 4);
     build_append_int_noprefix(table_data, 0, 1); /* AH: Note Allocation Hints */
     build_append_int_noprefix(table_data, 0, 2); /* Reserved */
-    /* MAF: Note Memory Access Flags */
-    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DCAS = 1 */, 1);
+    /* Table 15 Memory Access Flags */
+    build_append_int_noprefix(table_data, 0x3 /* CCA = CPM = DACS = 1 */, 1);
 
     build_append_int_noprefix(table_data, 0, 4); /* ATS Attribute */
     /* MCFG pci_segment */
     build_append_int_noprefix(table_data, 0, 4); /* PCI Segment number */
 
+    /* Memory address size limit */
+    build_append_int_noprefix(table_data, 64, 1);
+
+    build_append_int_noprefix(table_data, 0, 3); /* Reserved */
+
     /* Output Reference */
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping *range;
-- 
2.26.3

