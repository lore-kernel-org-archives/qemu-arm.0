Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp575137wrw;
        Fri, 9 Nov 2018 03:40:01 -0800 (PST)
X-Google-Smtp-Source: AJdET5cehHshQnmh9FrhVdEjzPPUIc9IYWaaIQ2QsFtxE55XlqO8WaH9fu6uwbfBDivKEqHh/BS+
X-Received: by 2002:aed:2c47:: with SMTP id f65mr8071327qtd.340.1541763601262;
        Fri, 09 Nov 2018 03:40:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763601; cv=none;
        d=google.com; s=arc-20160816;
        b=I3k0iT+ZoWDGC3EsDuMlbmZorz2N4QEvrpkRmWY8dKlCOOrLsm+ufIqw/UipVPpc15
         ac5FwTdXJuoJi3fWwuBclGgnPqWMkxwdZYoJF9Qu+bG05jNjIAqNX7ntyGKVrl7GIfAl
         QwDPKyvnYiIkS0B7psH44cWGJrbbw+Q/MaPpCEmxVJ/0utgRZFybhWrUT34TJ7zj1iHt
         joCwP88+BDoZgaGECml561YU2EzZko66Ru6zbsP/ed2gdHT2M2QyC9Ka36f98B1R2LJa
         EM5VoscJYz4rTYdhx/i9+GdLDOjAUFqnnMIVOowEE7/B4tsgZy7v54Buz1oUkhnK9yvg
         7MAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=omtbXZNNRj50pXY9mu0NlfAS4CWzyd6r7vDLO2gJ7Gg=;
        b=FU80Kg//oiz9B7Wo+Qh+IfNQtCn6CCLDfdPd6/DIpBbGPAgwoyfh5XSQz/jxHhCCrV
         nkMf0o5ODdDXw6QagOj/wSjq6WzhE7crFkAMJBIxeS6EHvEPJL5cvN0wswAqp4yejD7z
         0PXB+PD/gFybzZF1oQxrTcMj/d5EYH3Uh/kj34tFshIsEJevlYaj8vdCoCEuHnMLpBA2
         GLDSuBzejJiJH8D7yi9fSa057xfxn3q2jkCW/bbKVv5v1xzeU2aCnjJ3+uWsbD3LNMXI
         u42SeXiQYaDqLuab5+OY1pynD7NhlmPyp5pD/OGTixmUHMkz/B/GkLLAP8fF5b00mpbF
         ouVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j23si824009qtq.0.2018.11.09.03.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:40:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL58q-0000Ic-MX
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:40:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50U-00074Z-6R
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50S-0002zf-7Y
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38948)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL50R-0002qX-Ol; Fri, 09 Nov 2018 06:31:20 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AFA4E307D91D;
	Fri,  9 Nov 2018 11:31:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CC305C219;
	Fri,  9 Nov 2018 11:31:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:56 +0100
Message-Id: <20181109112957.10067-18-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 09 Nov 2018 11:31:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 17/18] hw/arm/virt-acpi-build: Add virtio-iommu
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WbboDgyNvPL/

This patch builds the virtio-iommu node in the ACPI IORT table.

The RID space of the root complex, which spans 0x0-0x10000
maps to streamid space 0x0-0x10000 in the virtio-iommu which in
turn maps to deviceid space 0x0-0x10000 in the ITS group.

The iommu RID (0x8) is excluded as described in virtio-iommu
specification.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v7 -> v8:
- exclude the iommu RID (0x8) in the root complex ID mapping
---
 hw/arm/virt-acpi-build.c    | 49 ++++++++++++++++++++++++++++++-------
 include/hw/acpi/acpi-defs.h | 21 +++++++++++++++-
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ec7c4835fe..4e62731aaf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -414,14 +414,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiIortIdMapping *idmap;
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
-    AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
+    size_t node_size, iort_node_offset, iort_length, iommu_offset = 0;
     AcpiIortRC *rc;
+    int nb_rc_idmappings = 1;
 
     iort = acpi_data_push(table_data, sizeof(*iort));
 
-    if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        nb_nodes = 3; /* RC, ITS, SMMUv3 */
+    if (vms->iommu) {
+        nb_nodes = 3; /* RC, ITS, IOMMU */
     } else {
         nb_nodes = 2; /* RC, ITS */
     }
@@ -446,10 +446,10 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     its->identifiers[0] = 0; /* MADT translation_id */
 
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
+        AcpiIortSmmu3 *smmu;
         int irq =  vms->irqmap[VIRT_SMMU];
 
-        /* SMMUv3 node */
-        smmu_offset = iort_node_offset + node_size;
+        iommu_offset = iort_node_offset + node_size;
         node_size = sizeof(*smmu) + sizeof(*idmap);
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
@@ -470,16 +470,38 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
          */
         fill_iort_idmap(smmu->id_mapping_array, 0, 0, 0xffff, 0,
                         iort_node_offset);
+    } else if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        AcpiIortPVIommuPCI *iommu;
+
+        nb_rc_idmappings = 2;
+        iommu_offset = iort_node_offset + node_size;
+        node_size = sizeof(*iommu) + 2 * sizeof(*idmap);
+        iort_length += node_size;
+        iommu = acpi_data_push(table_data, node_size);
+
+        iommu->type = ACPI_IORT_NODE_PARAVIRT;
+        iommu->length = cpu_to_le16(node_size);
+        iommu->mapping_count = cpu_to_le32(2);
+        iommu->mapping_offset = cpu_to_le32(sizeof(*iommu));
+        iommu->devid = cpu_to_le32(0x8);
+        iommu->model = cpu_to_le32(ACPI_IORT_NODE_PV_VIRTIO_IOMMU_PCI);
+
+        /*
+         * Identity RID mapping covering the whole input RID range
+         * output IORT node is the ITS group node (the first node)
+         */
+        fill_iort_idmap(iommu->id_mapping_array, 0, 0, 0xffff, 0,
+                        iort_node_offset);
     }
 
     /* Root Complex Node */
-    node_size = sizeof(*rc) + sizeof(*idmap);
+    node_size = sizeof(*rc) + nb_rc_idmappings * sizeof(*idmap);
     iort_length += node_size;
     rc = acpi_data_push(table_data, node_size);
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
-    rc->mapping_count = cpu_to_le32(1);
+    rc->mapping_count = cpu_to_le32(nb_rc_idmappings);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
     /* fully coherent device */
@@ -490,7 +512,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         /* Identity RID mapping and output IORT node is the iommu node */
         fill_iort_idmap(rc->id_mapping_array, 0, 0, 0xFFFF, 0,
-                        smmu_offset);
+                        iommu_offset);
+    } else if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        /*
+         * Identity mapping with the IOMMU RID (0x8) excluded. The output
+         * IORT node is the iommu node.
+         */
+        fill_iort_idmap(rc->id_mapping_array, 0, 0, 0x8, 0,
+                        iommu_offset);
+        fill_iort_idmap(rc->id_mapping_array, 1, 0x9, 0xFFF7, 0x9,
+                        iommu_offset);
     } else {
         /*
          * Identity RID mapping and the output IORT node is the ITS group
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index af8e023968..b14aa95dc1 100644
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
 
+struct AcpiIortPVIommuPCI {
+    ACPI_IORT_NODE_HEADER_DEF
+    uint32_t devid;
+    uint8_t reserved2[12];
+    uint32_t model;
+    uint32_t flags;
+    uint8_t reserved3[16];
+    AcpiIortIdMapping id_mapping_array[0];
+} QEMU_PACKED;
+typedef struct AcpiIortPVIommuPCI AcpiIortPVIommuPCI;
+
+enum {
+    ACPI_IORT_NODE_PV_VIRTIO_IOMMU     = 0x0,
+    ACPI_IORT_NODE_PV_VIRTIO_IOMMU_PCI = 0x1,
+};
+
+#define ACPI_IORT_NODE_PV_CACHE_COHERENT    (1 << 0)
+
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
     uint64_t base_address;
-- 
2.17.2

