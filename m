Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp960415wrt;
        Thu, 22 Nov 2018 09:29:32 -0800 (PST)
X-Google-Smtp-Source: AJdET5dqXtIFL9Tki/FNwOjBI+QrkXMesrfpjNtQFAJbT5x/7Wgxg0sCHMyV5OVGPHFhlhd68XIW
X-Received: by 2002:a81:5113:: with SMTP id f19mr12407437ywb.122.1542907772622;
        Thu, 22 Nov 2018 09:29:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542907772; cv=none;
        d=google.com; s=arc-20160816;
        b=eGkH8/SVm0Pm8kuw1N8pMGtYJprkppJUwep6BCrhBXF1nvjq8jVB9LF7sOHVqq+a17
         M5ZGW84uAo5SNWgmuz514qGvvs8rRaU2bdjxp4mswdI/MRUsv/G43Uuxr6XN4yI+li+7
         KcT0YFg4bBIKJ6UHrGJVi886CCHhy1Ykp1m9XsocZvXEyOYWbgY6A6Un1I+vkSP6A2gl
         oIazz875cv4keWqjopDVZuQvEATzosLlM9Hmqn4ITdksDBYmDMSWagCDnIw29Uv4sLZ2
         QrV53P2DgBMVusxCyX0D1hElkI0jDtT2rvJ7nDTLhdB9yUntG/XccwTm8CFl3pUSb8V9
         x8Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=nFMOop1Bdo3I//px6FYiaGlEuarZXNlrC1gLzXGpOdI=;
        b=UO3IVNbL6Ho54WVg4ZoyMEHgmRfkpRlSUxQXOHyovkzGot+OuP686Ah3KxJjZ2eSqE
         rfbA3TsBtg1q3D5WFnoCZZjoO8mHxGWu0fp2+NdAkC3NIm6lwEyJpZlAc40MRjNC4y+7
         pk5UvRO2Bq1AGhp4Y039oaP+ifYmj2BtVvlDBNgvgmkcuEcmELOBs/BnRykCexJYBTE7
         c2k2ZFaEgGaepSK4NZmJPsoi+YF7a/Wi8chSfWL6ZsMTrLHVCmfWCtnnrxCKqKjQytXp
         RPPgWBhLLD/QgEzpUE3qUocWTII+Av9NKHddUM1WyPIl7ngUVd2KFsIzBUG77uGrFqXw
         wW6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h198-v6si30772806ybg.264.2018.11.22.09.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 09:29:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPsnD-00010P-Kp
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 12:29:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsbE-0005XT-9i
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:17:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gPsbB-0006mO-P1
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 12:17:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:6707)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gPsbB-0006if-8F; Thu, 22 Nov 2018 12:17:05 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB5D53084026;
	Thu, 22 Nov 2018 17:17:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86A416061E;
	Thu, 22 Nov 2018 17:17:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Thu, 22 Nov 2018 18:15:37 +0100
Message-Id: <20181122171538.12359-17-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-1-eric.auger@redhat.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 22 Nov 2018 17:17:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v9 16/17] hw/arm/virt-acpi-build: Introduce
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
X-TUID: +kEl7Dxzhn/0

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

