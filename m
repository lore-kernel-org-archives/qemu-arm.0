Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp579617wrw;
        Fri, 9 Nov 2018 03:44:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5fjVnFQu9bPX5pM6gVgxd+jit3awuXDmDXE0eiOGeUNiWZSSoZ8DrrUNyuP9t3lmid35hMF
X-Received: by 2002:ac8:4086:: with SMTP id p6mr7931340qtl.378.1541763897676;
        Fri, 09 Nov 2018 03:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763897; cv=none;
        d=google.com; s=arc-20160816;
        b=L748Ml7ppIJsa/pRq1Zyt7d+FCtixv6/lWqiVKf8Vr53aFw+cygPTk4p4Rt8HmnELI
         5gp2tqx8BAJ+xNjYpodeSa2Uiaeh4qxxT7aQKlbRbceKj3JhOGgYFkOEzYQ9VFi0ZAZF
         KoJf0MmSs2t9jN0900VjEGrvWevYwtfzmXfqNQsprHAkn5axWDYdk1mfUobvdeEF/8J5
         b1TAgTwzQFuAJg7OEXQr314WUq/YXrVNNvYNE28NAOw2YtibHvU2L18sDt6YQuRAlHo3
         sfb37GPcs6k7ezD8l+a/9HHmwYm/a/cP6F9tvupf1I2sfLBNU4n/DGFWB0bdxf+Ivcj5
         Sv3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=nFMOop1Bdo3I//px6FYiaGlEuarZXNlrC1gLzXGpOdI=;
        b=wE7osJEK+n7frt3aekPKMNPR5FNGUHhD29gtH4zRJITp8cAQcC8pPDvapTgu0cjkoz
         uvJwfcvFKrB8YCmfLrX6KJa2YJHaSZCqriqPO8jU5up5laXOV9Kt9b2V+/TKITDZIK/s
         z2kOuYmzmB9Xw642IsfydzYvPtkfpvMsNPKrNiIWG6w8e9yDYRsOXUUuAQa/mZVANMu+
         U58homY7Gj09Hrb1438/JTH8KV7MvWorHz1fWc21YEH30ocTz5ZuDSJMXF6cDY3RPS/9
         ywL1PG9UqEZ8s5cLkM8M/JtZK7a7ex3huXaipJBydnKJWRfWPUj9k+ZT/EwE06nXmHuX
         HiWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b15si5836320qka.263.2018.11.09.03.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL5Dd-0006VV-6A
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:44:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50R-00073J-Ma
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50Q-0002lv-HF
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51790)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL50P-0002cl-29; Fri, 09 Nov 2018 06:31:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24B54308339B;
	Fri,  9 Nov 2018 11:31:16 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D68915C220;
	Fri,  9 Nov 2018 11:31:13 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:55 +0100
Message-Id: <20181109112957.10067-17-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 09 Nov 2018 11:31:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 16/18] hw/arm/virt-acpi-build: Introduce
 fill_iort_idmap helper
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
X-TUID: y/yy7+DbsQsM

To avoid code duplication, let's introduce an helper that
fills one IORT ID mappings array index.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v8: new
---
 hw/arm/virt-acpi-build.c | 43 ++++++++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5785fb697c..ec7c4835fe 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -396,6 +396,17 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
     return rsdp_table;
 }
 
+static inline void
+fill_iort_idmap(AcpiIortIdMapping *idmap, int i,
+                uint32_t input_base, uint32_t id_count,
+                uint32_t output_base, uint32_t output_reference)
+{
+    idmap[i].input_base = cpu_to_le32(input_base);
+    idmap[i].id_count = cpu_to_le32(id_count);
+    idmap[i].output_base = cpu_to_le32(output_base);
+    idmap[i].output_reference = cpu_to_le32(output_reference);
+}
+
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
@@ -453,13 +464,12 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         smmu->gerr_gsiv = cpu_to_le32(irq + 2);
         smmu->sync_gsiv = cpu_to_le32(irq + 3);
 
-        /* Identity RID mapping covering the whole input RID range */
-        idmap = &smmu->id_mapping_array[0];
-        idmap->input_base = 0;
-        idmap->id_count = cpu_to_le32(0xFFFF);
-        idmap->output_base = 0;
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        /*
+         * Identity RID mapping covering the whole input RID range.
+         * The output IORT node is the ITS group node (the first node).
+         */
+        fill_iort_idmap(smmu->id_mapping_array, 0, 0, 0xffff, 0,
+                        iort_node_offset);
     }
 
     /* Root Complex Node */
@@ -477,18 +487,17 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
 
-    /* Identity RID mapping covering the whole input RID range */
-    idmap = &rc->id_mapping_array[0];
-    idmap->input_base = 0;
-    idmap->id_count = cpu_to_le32(0xFFFF);
-    idmap->output_base = 0;
-
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
-        /* output IORT node is the smmuv3 node */
-        idmap->output_reference = cpu_to_le32(smmu_offset);
+        /* Identity RID mapping and output IORT node is the iommu node */
+        fill_iort_idmap(rc->id_mapping_array, 0, 0, 0xFFFF, 0,
+                        smmu_offset);
     } else {
-        /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort_node_offset);
+        /*
+         * Identity RID mapping and the output IORT node is the ITS group
+         * node (the first node).
+         */
+        fill_iort_idmap(rc->id_mapping_array, 0, 0, 0xFFFF, 0,
+                        iort_node_offset);
     }
 
     /*
-- 
2.17.2

