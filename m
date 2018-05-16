Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1248900wme;
        Wed, 16 May 2018 08:27:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoZ0U6p4Afq2b2QwTkMQsAW1TzzJfKBzdqjrPVM6dJqTfIcZL4ThWX6qK6O4uAj9+Lm/Xwu
X-Received: by 2002:a0c:f94d:: with SMTP id i13-v6mr1373275qvo.93.1526484462542;
        Wed, 16 May 2018 08:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526484462; cv=none;
        d=google.com; s=arc-20160816;
        b=M3uxqFlHFU/BSgqwqaxe/VjTNdrqPTQep0fVBCPvR/eFmZXX00PajhAgFY0vSRU3YL
         nUxH/a7OJew0WU7IsvLsAS2kUUwdw1fAqmIqulUYxY/bgI5OhhkylECvfQco7qhtdZfj
         kmN2yzIqeViMcrk8eDzwrI8e7g5ul8i29FdtqcW/Yz8DTMvPxUkGHXWjEbD1e+zHTVYe
         MtahQrxirR4j0NOY4j7qNkByGQ7hj3e4dMnkJpfKk9mvyx0lwpMBDIzdpAddmpDHoAGM
         8/ukgiLoGFu0UT7aIG7q16n9EUh8djr0RY/tKm6JGB5ZMhUPLtCUJqs1PqM5xOn/WLj+
         xriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from:arc-authentication-results;
        bh=jMVykAtftxhHfjtXcd1NgkJxs0XvF2WnZvFkcjKhBU0=;
        b=m9GTCUC+t5obUrXZYYdGe8/DBYZjvf4nTn48S7UPwnjjUMW9PyUVIe+QbN2Mo9lgrx
         4XurVP8GuLw3FYAwCH5P+MuofP41Fbr6MIrBeVXVYY1PpXUnDyRQXgBWV2oZfxn/Sif2
         HRclRhh7LNwHa0J8+pHbGjKUgGuXv1h0rfXiy+/sDLQJukWm7w3p3SCQUhovdCPMWbkn
         6M8nG8ccUzyIL3rBO/7tmBEfPP5j6n43pArQT28yDEPpcZM3SNE7/woQU0oTkaWkt/wk
         UHosdx097+lez/cOQYGuRNFqa0oImE5gfrQaBR8SxNyZwxHdF0sTp0DA7DtmRDfDDjP4
         n99A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l2-v6si2728007qvo.196.2018.05.16.08.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 08:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIyL8-0003EG-3z
	for alex.bennee@linaro.org; Wed, 16 May 2018 11:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54273)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyG3-00083D-B8
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFy-0005uM-Hu
	for qemu-arm@nongnu.org; Wed, 16 May 2018 11:22:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2097 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fIyFy-0005sq-4E; Wed, 16 May 2018 11:22:22 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 274CED4DEFF90;
	Wed, 16 May 2018 23:22:06 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.361.1; Wed, 16 May 2018 23:21:57 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Wed, 16 May 2018 16:20:25 +0100
Message-ID: <20180516152026.2920-6-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [RFC v2 5/6] hw/arm: ACPI SRAT changes to accommodate
 non-contiguous mem
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jonathan.cameron@huawei.com,
	linuxarm@huawei.com,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	eric.auger@redhat.com, alex.williamson@redhat.com,
	zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMgu1sWIJBO8

This is in preparation for the next patch where initial ram is split
into a non-pluggable chunk and a pc-dimm modeled mem if  the vaild
iova regions are non-contiguous.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index c7c6a57..8d17b40 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -488,7 +488,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiSratProcessorGiccAffinity *core;
     AcpiSratMemoryAffinity *numamem;
     int i, srat_start;
-    uint64_t mem_base;
+    uint64_t mem_base, mem_sz, mem_len;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
@@ -505,12 +505,28 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         core->flags = cpu_to_le32(1);
     }
 
-    mem_base = vms->memmap[VIRT_MEM].base;
+    mem_base = vms->bootinfo.loader_start;
+    mem_sz = vms->bootinfo.loader_start;
     for (i = 0; i < nb_numa_nodes; ++i) {
         numamem = acpi_data_push(table_data, sizeof(*numamem));
-        build_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
+        mem_len = MIN(numa_info[i].node_mem, mem_sz);
+        build_srat_memory(numamem, mem_base, mem_len, i,
                           MEM_AFFINITY_ENABLED);
-        mem_base += numa_info[i].node_mem;
+        mem_base += mem_len;
+        mem_sz -= mem_len;
+        if (!mem_sz) {
+            break;
+        }
+    }
+
+    /* Create table for initial pc-dimm ram, if any */
+    if (vms->bootinfo.dimm_mem) {
+        numamem = acpi_data_push(table_data, sizeof(*numamem));
+        build_srat_memory(numamem, vms->bootinfo.dimm_mem->base,
+                          vms->bootinfo.dimm_mem->size,
+                          vms->bootinfo.dimm_mem->node,
+                          MEM_AFFINITY_ENABLED);
+
     }
 
     build_header(linker, table_data, (void *)(table_data->data + srat_start),
-- 
2.7.4


