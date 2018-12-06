Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp10869808wrt;
        Thu, 6 Dec 2018 09:10:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X2U61rsHZFUkd3T+w3XgGO0TduecWxJIy8OYKmQmxOCV9Gb5fd/MVGA+lfuMEO9eZoAEWu
X-Received: by 2002:a37:b581:: with SMTP id e123mr26770307qkf.183.1544116228543;
        Thu, 06 Dec 2018 09:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544116228; cv=none;
        d=google.com; s=arc-20160816;
        b=BmbpXB25ZqI4EBS311KVLggL1dQZ7BC8c6BuH+Q5tdmc8Ozyt8JE/hBohDOCI/5I5r
         vfGLtqS9s3Ej9CWjoer+q6293irBOrc/5td1b0qyrGJNrK60z7r5ImKF8KhnuN2Q1RAh
         iFM154QwxPO8OIND+UYzbIjS08c4smigDphIzYYuIaxxpQi6vqlz3QqLFglskv9+NabT
         f2z7Sqm5bacDucHKuZZJ8a+IazQBqJYbQFbnv9EF1N+zU9qbMyUz7G912YGM5djrNGCL
         LMYXkhkBydeD65e9fevxsCy9+PgFISKQLJhPfezDsdH0nRQmpjscQDZQPPCCLGH4WmJi
         OY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=4VVr06IzCtE3nQwMYJrNUwUn2A/ITCUXHgAoVqrVJlY=;
        b=uUoGtln/p71NsAEzzt7gJOG+9oaA6EhrSohHd8MUW1ZAixmRfQGutqWusdAWUU41TP
         CdCIIu4ZiHJYcAiNRsl/pJYINniPNZN26cog8oxdKAF6nscel3su8gyu+YTdFf1BOl/q
         UES1VvQM3zk+gWsGk2AZn3BBfNmdUDlBV48q0S9v3cc4BjkzFMg/NUOlz+UR8BDlwXME
         PCDbJQX2eRsBEkUp7oQKMHLNKRFpKXKF4bPj0CApZiHxiSkoLk+MWLy+NpbFIk4Hk+9t
         H6O3MLjpIPB7TIdAjDVzl0RKZcw73o2ut8Q779ps3x7Y7xyQKN1tXbnVXqb9+QPC/MQW
         msLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m93si541305qtd.270.2018.12.06.09.10.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Dec 2018 09:10:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUxAR-00029M-QH
	for alex.bennee@linaro.org; Thu, 06 Dec 2018 12:10:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx7r-0008Rh-Rk
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 12:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gUx7m-0002mX-Rk
	for qemu-arm@nongnu.org; Thu, 06 Dec 2018 12:07:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39588)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gUx7m-0002lx-JU; Thu, 06 Dec 2018 12:07:42 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D094B88E64;
	Thu,  6 Dec 2018 17:07:41 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.117.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 404E95D9CD;
	Thu,  6 Dec 2018 17:07:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, shannon.zhaosl@gmail.com
Date: Thu,  6 Dec 2018 18:07:33 +0100
Message-Id: <20181206170733.7469-3-eric.auger@redhat.com>
In-Reply-To: <20181206170733.7469-1-eric.auger@redhat.com>
References: <20181206170733.7469-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 06 Dec 2018 17:07:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.0 v2 2/2] hw/arm/virt-acpi-build: IORT
 Update for revision D
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OwxC48TKuZCA

Let's update the structs according to revision D of the IORT
specification and set the IORT node revision fields.

In IORT smmuv3 node: the new proximity field is not used as
the proximity domain valid flag is not set. The new DeviceId
mapping index is not used either as all the SMMU control
interrupts are GSIV based.

In IORT RC node: the new memory address size limit field is
set to 64 bits.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- separate patches for SMMUv3 DMA coherency issue and struct
  update to revision D.
- revision fields set
---
 hw/arm/virt-acpi-build.c    |  4 ++++
 include/hw/acpi/acpi-defs.h | 10 +++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index aa177ba64d..a34a0958a5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -423,6 +423,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
      */
     iort_node_offset = sizeof(*iort);
     iort->node_offset = cpu_to_le32(iort_node_offset);
+    iort->revision = 0;
 
     /* ITS group node */
     node_size =  sizeof(*its) + sizeof(uint32_t);
@@ -445,6 +446,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
         smmu->type = ACPI_IORT_NODE_SMMU_V3;
         smmu->length = cpu_to_le16(node_size);
+        smmu->revision = cpu_to_le32(2);
         smmu->mapping_count = cpu_to_le32(1);
         smmu->mapping_offset = cpu_to_le32(sizeof(*smmu));
         smmu->base_address = cpu_to_le64(vms->memmap[VIRT_SMMU].base);
@@ -470,6 +472,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     rc->type = ACPI_IORT_NODE_PCI_ROOT_COMPLEX;
     rc->length = cpu_to_le16(node_size);
+    rc->revision = cpu_to_le32(1);
     rc->mapping_count = cpu_to_le32(1);
     rc->mapping_offset = cpu_to_le32(sizeof(*rc));
 
@@ -477,6 +480,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     rc->memory_properties.cache_coherency = cpu_to_le32(1);
     rc->memory_properties.memory_flags = 0x3; /* CCA = CPM = DCAS = 1 */
     rc->pci_segment_number = 0; /* MCFG pci_segment */
+    rc->memory_address_limit = 64;
 
     /* Identity RID mapping covering the whole input RID range */
     idmap = &rc->id_mapping_array[0];
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 532eaf79bd..b4a5104367 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -628,7 +628,11 @@ struct AcpiIortItsGroup {
 } QEMU_PACKED;
 typedef struct AcpiIortItsGroup AcpiIortItsGroup;
 
-#define ACPI_IORT_SMMU_V3_COHACC_OVERRIDE 1
+enum {
+    ACPI_IORT_SMMU_V3_COHACC_OVERRIDE = 1 << 0,
+    ACPI_IORT_SMMU_V3_HTTU_OVERRIDE   = 3 << 1,
+    ACPI_IORT_SMMU_V3_PXM_VALID       = 1 << 3
+};
 
 struct AcpiIortSmmu3 {
     ACPI_IORT_NODE_HEADER_DEF
@@ -641,6 +645,8 @@ struct AcpiIortSmmu3 {
     uint32_t pri_gsiv;
     uint32_t gerr_gsiv;
     uint32_t sync_gsiv;
+    uint32_t pxm;
+    uint32_t id_mapping_index;
     AcpiIortIdMapping id_mapping_array[0];
 } QEMU_PACKED;
 typedef struct AcpiIortSmmu3 AcpiIortSmmu3;
@@ -650,6 +656,8 @@ struct AcpiIortRC {
     AcpiIortMemoryAccess memory_properties;
     uint32_t ats_attribute;
     uint32_t pci_segment_number;
+    uint8_t memory_address_limit;
+    uint8_t reserved2[3];
     AcpiIortIdMapping id_mapping_array[0];
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
-- 
2.17.2

