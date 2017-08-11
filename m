Received: by 10.25.221.202 with SMTP id w71csp967391lfi;
        Fri, 11 Aug 2017 07:36:01 -0700 (PDT)
X-Received: by 10.55.99.133 with SMTP id x127mr19482280qkb.219.1502462161327;
        Fri, 11 Aug 2017 07:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462161; cv=none;
        d=google.com; s=arc-20160816;
        b=lpbxOh1PSFgVersvaFeWHhRk4rZdmxLpijSgUXgWTFnfKGcglMr//Ag++jbnP8dYok
         9nvGuF5TkWjbN2jx9Bob/1EdLCTqV8xwlb+zeTWDwiIgbzY7hlu0Wjnp03G0qRxaVZYm
         4ejnt2ktvpXvH6DYsFT6w5Mgi+GEwx6XzwOkg/j3lgpkvEUbqdNX6P7xTeKiBV2PPsvb
         nkOVQCAz/aJTcLNtdAc+0MnUuWJKAcZ55+U1b/l7ovp77KhhF0Wvps28TyU8Zq7Ik1iI
         v5BUs7VlI6LzU0Rb8rO0VImaSjjooQvCdue30uVWoGYaKRaItAwa6YLxZTexR4+6o84x
         6HWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=EE+RPTQVxiIGPna2lBNlIn6XZbghzpD8dYS2+d4hE68=;
        b=JFSA79XDgo2hLu+b5KpXvCw9cdD8cuSGCe6czW/5UZt7HFRI8AYbch7+iIYFSNTavt
         tKh9/HzZdJZRd1xyNzIhGdsdulw5c82RxnfuAflRiVPBbDpXE7uHs54LsJLOCsyOj8GE
         33JtdKkoI0lY8cg3x1eo4hidLcS3I0/juBbsjZMKXCwdqWKsqCpFakdjTRJ2xsAd505F
         0pGalMJKzeZXM/JwEDVDV+ylAgea4LeaGFWltyOLtBOtS8B2CyifV80SGLKoFPB4I3yR
         bDuT2IPmGa5FHBLyfGfsLYyl0TFfreoTRsFK7SGXc0T0f+SCoX0wS7kKO6TBSwyzpfOT
         IYBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a14si930662qta.93.2017.08.11.07.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB2c-0002Ez-L6
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgAru-000110-4n
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dgArs-0002VR-Mi
	for qemu-devel@nongnu.org; Fri, 11 Aug 2017 10:24:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45358)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dgArm-0002Rc-CA; Fri, 11 Aug 2017 10:24:46 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48B3660145;
	Fri, 11 Aug 2017 14:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 48B3660145
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-162.ams2.redhat.com
	[10.36.116.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E100B99DD7;
	Fri, 11 Aug 2017 14:24:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
	prem.mallappa@gmail.com
Date: Fri, 11 Aug 2017 16:22:30 +0200
Message-Id: <1502461354-11327-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
References: <1502461354-11327-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 11 Aug 2017 14:24:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v6 5/9] hw/arm/virt-acpi-build: Add smmuv3 node
 in IORT table
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
Cc: mohun106@gmail.com, drjones@redhat.com, tcain@qti.qualcomm.com,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	mst@redhat.com, jean-philippe.brucker@arm.com, tn@semihalf.com,
	will.deacon@arm.com, robin.murphy@arm.com, peterx@redhat.com,
	edgar.iglesias@gmail.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kNsJdETgKr+V

From: Prem Mallappa <prem.mallappa@broadcom.com>

This patch builds the smmuv3 node in the ACPI IORT table.

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in smmuv3, which in turn
maps to deviceid space 0x0-0x10000 in the ITS group.

The guest must feature the IOMMU probe deferral series
(https://lkml.org/lkml/2017/4/10/214) wich fixes streamid
multiple lookup. This bug is not related to the SMMU emulation.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- integrate into the existing IORT table made up of ITS, RC nodes
- take into account vms->smmu
- match linux actbl2.h acpi_iort_smmu_v3 field names
---
 hw/arm/virt-acpi-build.c    | 56 +++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi-defs.h | 15 ++++++++++++
 2 files changed, 64 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff6..ac2cd3e 100644
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
 
+    if (vms->smmu) {
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
@@ -418,6 +425,35 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     its->its_count = cpu_to_le32(1);
     its->identifiers[0] = 0; /* MADT translation_id */
 
+    if (vms->smmu) {
+        int irq =  vms->irqmap[VIRT_SMMU];
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
@@ -438,8 +474,14 @@ build_iort(GArray *table_data, BIOSLinker *linker)
     idmap->input_base = 0;
     idmap->id_count = cpu_to_le32(0xFFFF);
     idmap->output_base = 0;
-    /* output IORT node is the ITS group node (the first node) */
-    idmap->output_reference = cpu_to_le32(iort->node_offset);
+
+    if (vms->smmu) {
+        /* output IORT node is the smmuv3 node */
+        idmap->output_reference = cpu_to_le32(smmu_offset);
+    } else {
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort->node_offset);
+    }
 
     iort->length = cpu_to_le32(iort_length);
 
@@ -782,7 +824,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
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
-- 
2.5.5

