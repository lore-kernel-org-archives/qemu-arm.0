Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3452019wru;
        Mon, 6 Aug 2018 13:27:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdq5GoP53JBW1FR+GnuxzwcPQGjaihdoaU8yihKicdql7ynkld9ooFab3Aiqji2QMRqYGqe
X-Received: by 2002:a0c:f90e:: with SMTP id v14-v6mr14021863qvn.207.1533587230928;
        Mon, 06 Aug 2018 13:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533587230; cv=none;
        d=google.com; s=arc-20160816;
        b=TzzJ7ALA7z7Gg1aUlBch4rvrB/79TXFk0vsvle8+e26xiInVnbwDHKn005JuVG7tR+
         5qKfKaimVVQQ80oAclb67LDr92qtefm3nlW59sxzESL9YnDW9Me5eba5GG9NS0TwsoX2
         qYwElqrGS375M6Bgb6YpF06mANxISi+BDC1kE0/MJLK5kJe0RE4fehlSF7B/ikwKXMGW
         xWI10CSfA5fSdVLsmSur3BGHg3rA+VhzMKH5hqd0k5JaYBQjD44NK2GnvKMnfC5lkCSX
         FNIIQsQquXt8z+INUvimPMTfL+K8ztoTe4mQLva4LlipDVihoGLjptjCpAKrIQ/cCiXG
         vxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=hRtVBDfj3nT9SKAD286OPAqTNBFeeiECancIS+5r+9o=;
        b=ZaU1gOKngAurroUezcsInz+pjW0WqB3DXeohVBan42k0GCZPTaRadWC5C5CTdeNIum
         x2+SgCKm2dinz3EiVc6YwYuDDzD3TRUlH7YZZTsMpDZ4W50tA301m8qXnt1q47VPBaw3
         B9iHXgjqgWISFUrC03QxWFoMwpuano7iEfxI18FX4mRrpOn0SSuwIHjN0qJI5V6HR7OM
         iKL0p4ENrhlqU2tQ08VDx49cIN/FWU6aB8giU5s4WvNXY9oQHSXtx5adPbdjj008CgLv
         gMsbxtMmYUpNgZwpPJ4IeFImY/bQG1gvl/DUP0VS+fXU6GAh1mRxUb1IPFmcqT12LEeE
         E3Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n56-v6si1018065qtn.196.2018.08.06.13.27.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 13:27:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmm5u-0008MX-F0
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 16:27:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlun-0006fy-GD
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fmlum-000764-7y
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 16:15:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38200 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fmlum-00075h-1B; Mon, 06 Aug 2018 16:15:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B6F540201A3;
	Mon,  6 Aug 2018 20:15:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA8E2156711;
	Mon,  6 Aug 2018 20:15:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	mst@redhat.com, jean-philippe.brucker@arm.com
Date: Mon,  6 Aug 2018 22:14:43 +0200
Message-Id: <1533586484-5737-16-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
References: <1533586484-5737-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 06 Aug 2018 20:15:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 06 Aug 2018 20:15:39 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v7 15/16] hw/arm/virt-acpi-build: Add virtio-iommu
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
Cc: kevin.tian@intel.com, tn@semihalf.com, will.deacon@arm.com,
	drjones@redhat.com, peterx@redhat.com, linuc.decode@gmail.com,
	bharat.bhushan@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/9eyge1vck9

This patch builds the virtio-iommu node in the ACPI IORT table.

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in smmuv3, which in turn
maps to deviceid space 0x0-0x10000 in the ITS group.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 39 ++++++++++++++++++++++++++++++++-------
 include/hw/acpi/acpi-defs.h | 21 ++++++++++++++++++++-
 2 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6ea47e2..a856a31 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -403,14 +403,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
-    AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
+    size_t node_size, iort_node_offset, iort_length, iommu_offset = 0;
     AcpiIortRC *rc;
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
+    if (vms->iommu) {
+        nb_nodes = 3; /* RC, ITS, IOMMU */
     } else {
         nb_nodes = 2; /* RC, ITS */
     }
@@ -435,10 +434,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     its->identifiers[0] = 0; /* MADT translation_id */
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        AcpiIortSmmu3 *smmu;
         int irq =  vms->irqmap[VIRT_SMMU];
 
         /* SMMUv3 node */
-        smmu_offset = iort_node_offset + node_size;
+        iommu_offset = iort_node_offset + node_size;
         node_size = sizeof(*smmu) + sizeof(*idmap);
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
@@ -460,6 +460,31 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         idmap->output_base = 0;
         /* output IORT node is the ITS group node (the first node) */
         idmap->output_reference = cpu_to_le32(iort_node_offset);
+    } else if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        AcpiIortPVIommu *iommu;
+        int irq = vms->irqmap[VIRT_VIRTIO_IOMMU];
+
+        /* Para-virtualized IOMMU node */
+        iommu_offset = iort_node_offset + node_size;
+        node_size = sizeof(*iommu) + sizeof(*idmap);
+        iort_length += node_size;
+        iommu = acpi_data_push(table_data, node_size);
+
+        iommu->type = ACPI_IORT_NODE_PARAVIRT;
+        iommu->length = cpu_to_le16(node_size);
+        iommu->base_address = cpu_to_le64(vms->memmap[VIRT_VIRTIO_IOMMU].base);
+        iommu->span = cpu_to_le64(vms->memmap[VIRT_VIRTIO_IOMMU].size);
+        iommu->model = ACPI_IORT_NODE_PV_VIRTIO_IOMMU;
+        iommu->flags = ACPI_IORT_NODE_PV_CACHE_COHERENT;
+        iommu->gsiv = cpu_to_le64(irq);
+
+        /* Identity RID mapping covering the whole input RID range */
+        idmap = &iommu->id_mapping_array[0];
+        idmap->input_base = 0;
+        idmap->id_count = cpu_to_le32(0xFFFF);
+        idmap->output_base = 0;
+        /* output IORT node is the ITS group node (the first node) */
+        idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
     /* Root Complex Node */
@@ -483,9 +508,9 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     idmap->id_count = cpu_to_le32(0xFFFF);
     idmap->output_base = 0;
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+    if (vms->iommu) {
         /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
+        idmap->output_reference = cpu_to_le32(iommu_offset);
     } else {
         /* output IORT node is the ITS group node (the first node) */
         idmap->output_reference = cpu_to_le32(iort_node_offset);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023..1046409 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -601,7 +601,8 @@ enum {
         ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
         ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
         ACPI_IORT_NODE_SMMU = 0x03,
-        ACPI_IORT_NODE_SMMU_V3 = 0x04
+        ACPI_IORT_NODE_SMMU_V3 = 0x04,
+        ACPI_IORT_NODE_PARAVIRT = 0x80
 };
 
 struct AcpiIortIdMapping {
@@ -628,6 +629,24 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
+struct AcpiIortPVIommu {
+    ACPI_IORT_NODE_HEADER_DEF
+    uint64_t base_address;
+    uint64_t span;
+    uint32_t model;
+    uint32_t flags;
+    uint64_t gsiv;
+    uint64_t reserved2;
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
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
     uint64_t base_address;
-- 
2.5.5

