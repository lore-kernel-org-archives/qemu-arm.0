Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2235249wre;
        Mon, 28 May 2018 01:44:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI724CNXVg9jpJ0qHa5gTcu+uBwzn9BKYCVzGk5dOQnSMTdtOwjuvGzUUetgd0+hzd+vL5q
X-Received: by 2002:ac8:2ec7:: with SMTP id i7-v6mr11131130qta.157.1527497096614;
        Mon, 28 May 2018 01:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527497096; cv=none;
        d=google.com; s=arc-20160816;
        b=MaJwon7yWg7ugVQat9cMuRKMMQD7/40RCQkPNo8H8jbpZIAKNKHwQrq91jJd3BmxuR
         aXCDk9aabgDe2Qxv+Qu0CRel+rZc9nlzsid6//kLz3lI4uIaju7dToIY0wi8LZmIAUPY
         K7zgiA0B0bMB8TkorZUAB21dRAXm6hf44GY1qnjFM5zjx2t4gJ4A8Og7WRGqpreSMh6v
         BCqivthrPAv2KmMRw0t8pP7TiAqh1Y4R5M6Cjuih85dkDZQtUUYKkAmhLVkv8eFgIe3V
         Vsfb9Z9Nox7v42MIEv/P35XYGVmbLw8BnK0WmFbQX9fgBEFWbYWFU4EDfWDFTku4Ye7Y
         9o1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=vDPBJYOKouJ6FvIuwznbAPKSM29Wuzvf/K+we8OF2i8=;
        b=VYyjI4/vlgzwZCD/T1sO+Hmegxa3jbeWdfT32aga8YHEXJQAfAhbs7azfQw22ndsIX
         6Ex+Aj39Z5ijCkUy5re0F7gLB8QYOFslSLj9fAqzK26avdmE1rb8IVSj8ThL+A+s1btL
         0iAglBBFyMhaxVqYoxl7W7bFVcuVewrRM4z7PGLwgXem5ZnQJg+6VbbJoUNy0YpENYti
         XwRjQ104pNsFAxgSkXBERIpM2Oc2VcIOrz+CHjoirNPOG1VCtfTA8J5KXl1i0pLY+H3l
         E0UV+zDEefJiy6NaNtxeOqGW48tGPjyR313Al3jerRE8fbyS+HgDrLbW4yy3YUSY3W0I
         93mw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q18-v6si454692qvm.211.2018.05.28.01.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 May 2018 01:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNDlw-0008T8-5g
	for alex.bennee@linaro.org; Mon, 28 May 2018 04:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNDlo-0008T1-9l
	for qemu-arm@nongnu.org; Mon, 28 May 2018 04:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1fNDlk-0003qy-2Y
	for qemu-arm@nongnu.org; Mon, 28 May 2018 04:44:48 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2102 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhaoshenglong@huawei.com>)
	id 1fNDlj-0003pA-Ni; Mon, 28 May 2018 04:44:44 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4CCC44C3BC396;
	Mon, 28 May 2018 16:44:26 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server
	id 14.3.382.0; Mon, 28 May 2018 16:44:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>
Date: Mon, 28 May 2018 16:42:26 +0800
Message-ID: <1527496946-12036-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH] ARM: ACPI: Fix use-after-free due to memory
 realloc
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>, peter.maydell@linaro.org,
	shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sQzOQAI9Fu66

acpi_data_push uses g_array_set_size to resize the memory size. If there
is no enough contiguous memory, the address will be changed. So previous
pointer could not be used any more. It must update the pointer and use
the new one.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
---
 hw/arm/virt-acpi-build.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 92ceee9..30584ee 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -400,7 +400,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiIortItsGroup *its;
     AcpiIortTable *iort;
     AcpiIortSmmu3 *smmu;
-    size_t node_size, iort_length, smmu_offset = 0;
+    size_t node_size, iort_node_offset, iort_length, smmu_offset = 0;
     AcpiIortRC *rc;
 
     iort = acpi_data_push(table_data, sizeof(*iort));
@@ -414,6 +414,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     iort_length = sizeof(*iort);
     iort->node_count = cpu_to_le32(nb_nodes);
     iort->node_offset = cpu_to_le32(sizeof(*iort));
+    iort_node_offset = iort->node_offset;
 
     /* ITS group node */
     node_size =  sizeof(*its) + sizeof(uint32_t);
@@ -429,7 +430,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         int irq =  vms->irqmap[VIRT_SMMU];
 
         /* SMMUv3 node */
-        smmu_offset = iort->node_offset + node_size;
+        smmu_offset = iort_node_offset + node_size;
         node_size = sizeof(*smmu) + sizeof(*idmap);
         iort_length += node_size;
         smmu = acpi_data_push(table_data, node_size);
@@ -450,7 +451,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         idmap->id_count = cpu_to_le32(0xFFFF);
         idmap->output_base = 0;
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort->node_offset);
+        idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
     /* Root Complex Node */
@@ -479,9 +480,14 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         idmap->output_reference = cpu_to_le32(smmu_offset);
     } else {
         /* output IORT node is the ITS group node (the first node) */
-        idmap->output_reference = cpu_to_le32(iort->node_offset);
+        idmap->output_reference = cpu_to_le32(iort_node_offset);
     }
 
+    /*
+     * Update the pointer address in case table_data->data moved during above
+     * acpi_data_push operations.
+     */
+    iort = (AcpiIortTable *)(table_data->data + iort_start);
     iort->length = cpu_to_le32(iort_length);
 
     build_header(linker, table_data, (void *)(table_data->data + iort_start),
-- 
2.0.4


