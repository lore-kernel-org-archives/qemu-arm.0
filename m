Received: by 10.28.4.212 with SMTP id 203csp886935wme;
        Wed, 25 Apr 2018 07:30:21 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+GhQKnrgDsON+vSWVHLLsQ5UEjCRlWdDJMOqhYwiWlm60UCAwE7NavR2i0rIGCHPk+W5Dh
X-Received: by 2002:aed:3dbd:: with SMTP id i58-v6mr32953699qtf.34.1524666614623;
        Wed, 25 Apr 2018 07:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524666613; cv=none;
        d=google.com; s=arc-20160816;
        b=KnDocmIfdh5AxZ6BQctmeknR90LFKWWs9LwA8QjIBGruYqCSfdlcQlhu7QKPA3/WuX
         uulpdl6pTh8zQSSbR8vDWtBXvcLnrr06/gvKtrcclkviEX+oi5WqyqINWwIz081YOPeR
         2Kj0i4PL0Fl5Ux9ZmEaBemlewk0ZV32oHC/QFmixwPHcWh+FqsGIlx62QqcsoXTXFuXB
         /0p91psLbIxV3obbDGyHr31EedQKBkhBFkj8JohWsdM7Gdh2kzu3Ygvu4jLRe96TGe5P
         ZhW7TosOPesASCEX0trbOMCEHSaz1ukX6a3aeOjBE3Zon1dJPot+eUgA/UmsxCHkFrb3
         2KFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6lejLsyEmif0NQ2N/P6G11LLMElndtElCSGDRkuk2Jo=;
        b=ubni39bB6n1D8Ej3vTBIqVjKujQGqJg/OJ9qqfs8aoS7ZFTHmyzgJJU2hNL6z694Xd
         c4kZWdllWJO6bwcpTsiNQoQzWDfCjW+VKsHhRxMIBFEpWhqTT6FgaiPLFt3qCO3Ayht+
         SEOIfzepM/HpZgbVqTuwd+aRL3h9RHVTZH3pYwuDMkTQ1J3RIgXnZRQMSfT/8uQWSqX7
         aHyRIKBYvaruca994eaENEKJWK6sT6qaj/xZQRvwch7c0t9WfrgPR0vfWXatTmHvRrXL
         kCR3KQ9Ix6ZsJWyX8Eiyg5PrB0bvXDgUyhkDgsbIQ5gZDb2Oe9w+d6DzmH/zQ23uqIqW
         HYmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c42-v6si12477758qtc.107.2018.04.25.07.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 07:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fBLQz-0002la-1e
	for alex.bennee@linaro.org; Wed, 25 Apr 2018 10:30:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEG-00011W-S9
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fBLEB-0006AY-MJ
	for qemu-devel@nongnu.org; Wed, 25 Apr 2018 10:17:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:55304 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fBLE3-00066J-KD; Wed, 25 Apr 2018 10:16:51 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 337F0406C740;
	Wed, 25 Apr 2018 14:16:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-141.ams2.redhat.com
	[10.36.116.141])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 997682023239;
	Wed, 25 Apr 2018 14:16:48 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, prem.mallappa@gmail.com
Date: Wed, 25 Apr 2018 16:15:58 +0200
Message-Id: <1524665762-31355-14-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
References: <1524665762-31355-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:16:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 25 Apr 2018 14:16:51 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v12 13/17] hw/arm/virt-acpi-build: Add smmuv3
 node in IORT table
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
Cc: cdall@kernel.org, mst@redhat.com, jean-philippe.brucker@arm.com,
	tn@semihalf.com, peterx@redhat.com, alex.williamson@redhat.com,
	linuc.decode@gmail.com, bharat.bhushan@nxp.com, jintack@cs.columbia.edu
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LavOVutlLl+o

From: Prem Mallappa <prem.mallappa@broadcom.com>

This patch builds the smmuv3 node in the ACPI IORT table.

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in smmuv3, which in turn
maps to deviceid space 0x0-0x10000 in the ITS group.

The guest must feature the IOMMU probe deferral series
(https://lkml.org/lkml/2017/4/10/214) which fixes streamid
multiple lookup. This bug is not related to the SMMU emulation.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>

---

v9 -> v10:
- replaced vms->iommu tests by vms->iommu == VIRT_IOMMU_SMMUV3
- Added Shannon's R-b

v2 -> v3:
- integrate into the existing IORT table made up of ITS, RC nodes
- take into account vms->smmu
- match linux actbl2.h acpi_iort_smmu_v3 field names
---
 hw/arm/virt-acpi-build.c    | 55 +++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi-defs.h | 15 +++++++++++++
 2 files changed, 63 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c7c6a57..92ceee9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -393,19 +393,26 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
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
 
+    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
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
@@ -418,6 +425,34 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     its->its_count = cpu_to_le32(1);
     its->identifiers[0] = 0; /* MADT translation_id */
 
+    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        int irq =  vms->irqmap[VIRT_SMMU];
+
+        /* SMMUv3 node */
+        smmu_offset = iort->node_offset + node_size;
+        node_size = sizeof(*smmu) + sizeof(*idmap);
+        iort_length += node_size;
+        smmu = acpi_data_push(table_data, node_size);
+
+        smmu->type = ACPI_IORT_NODE_SMMU_V3;
+        smmu->length = cpu_to_le16(node_size);
+        smmu->mapping_count = cpu_to_le32(1);
+        smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
+        smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
+        smmu->event_gsiv = cpu_to_le32(irq);
+        smmu->pri_gsiv = cpu_to_le32(irq + 1);
+        smmu->gerr_gsiv = cpu_to_le32(irq + 2);
+        smmu->sync_gsiv = cpu_to_le32(irq + 3);
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
@@ -438,8 +473,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     idmap->input_base = 0;
     idmap->id_count = cpu_to_le32(0xFFFF);
     idmap->output_base = 0;
-    /* output IORT node is the ITS group node (the first node) */
-    idmap->output_reference = cpu_to_le32(iort->node_offset);
+
+    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        /* output IORT node is the smmuv3 node */
+        idmap->output_reference = cpu_to_le32(smmu_offset);
+    } else {
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort->node_offset);
+    }
 
     iort->length = cpu_to_le32(iort_length);
 
@@ -777,7 +818,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (its_class_name() && !vmc->no_its) {
         acpi_add_table(table_offsets, tables_blob);
-        build_iort(tables_blob, tables->linker);
+        build_iort(tables_blob, tables->linker, vms);
     }
 
     /* XSDT is pointed to by RSDP */
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 5955eb4..af8e023 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -628,6 +628,21 @@ struct AcpiIortItsGroup {
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
-- 
2.5.5

