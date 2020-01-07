Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24411788lff;
        Tue, 7 Jan 2020 01:30:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzbBWxMF/VNfLEqoRXH7yFrqeBhA7efpE5LGMDyWAeM18UsUH/89+/HmkoCLofnJy1bJM+5
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr87196744qke.212.1578389401430;
        Tue, 07 Jan 2020 01:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578389401; cv=none;
        d=google.com; s=arc-20160816;
        b=SVk9884XKnsEG5kn7zpuhbmkf10aCS1KjBGbSUD7io/EbsK6DhIjoWrT2pZWfVr86Y
         nM5Us28CPnDVzcA97t5DZOhMlTA75DLGVmPTYoOKe0ULXMuHIq5LP6tQ9PsSd5GxXypK
         lvmhi6xrRcjsonUDYr968sf/r5WRoujFJSwPO+G7h7T4zg+gb+x9Y5NYzDZayceprjA4
         lysDGN6ckypcIh+JsOJC3xl6bNPK5DjmRvrgn0xIZzuZRVUDfKounvxFTzRpjmdVcgg+
         NeI3XeIwbbS99Lqcnacdyf5PlNPIjo/jTQBTaPSIdcmA717oJGfnF3v3QoAO1ERjbGr6
         0pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=uS4qR1Tw1wdi3vGqrTMWUw6YM2bvTtk3EbN0ewMEPfE=;
        b=IK1VGnSjbnBwog9P0UCVZjygleieikMJUMm7VKUlqWQqdWWw041zcnOXjRINdoYUhU
         zda5H8Ld+yuRiC9KviVCUtUbtGfv3dtaJbxLZTSVzR1s7qF6k3y8wLHM2EwfRAYgY9t+
         TWLzkepvBv20XdYoPOLk+kKa40tBUPGLqhzsSIflotfXoBHhxhX+k1zX4/06zfCESzWd
         kKg3z0pP08uBNwuT7yew59/RGkHTlhhIW5z016rvBtdPtm6jo++21yhRlSLG7DQntobh
         3MLaXutxsuEoWx7q3/ROhgLfgXdnz9BMW+XjflVenoxLysqjc9h4AizAQmVD7Tjjxq9k
         05Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si28793135qvp.4.2020.01.07.01.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 01:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iolBX-0004T2-G5
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 04:29:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prime.zeng@hisilicon.com>) id 1iol5C-0005Xe-9z
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:23:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prime.zeng@hisilicon.com>) id 1iol52-00080o-Pu
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:23:19 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2229 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prime.zeng@hisilicon.com>)
 id 1iol4x-0007kv-Qa; Tue, 07 Jan 2020 04:23:12 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B80F5282A2F41FAD5E84;
 Tue,  7 Jan 2020 17:23:03 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.439.0; Tue, 7 Jan 2020 17:22:55 +0800
From: Zeng Tao <prime.zeng@hisilicon.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] hw/arm/acpi: Pack the SRAT processors structure by node_id
 ascending order
Date: Tue, 7 Jan 2020 17:18:49 +0800
Message-ID: <1578388729-55540-1-git-send-email-prime.zeng@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org, Shannon
 Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Zeng Tao <prime.zeng@hisilicon.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2qZ5GNRNtCAF

When booting the guest linux with the following numa configuration:
-numa node,node_id=1,cpus=0-3
-numa node,node_id=0,cpus=4-7
We can get the following numa topology in the guest system:
Architecture:          aarch64
Byte Order:            Little Endian
CPU(s):                8
On-line CPU(s) list:   0-7
Thread(s) per core:    1
Core(s) per socket:    8
Socket(s):             1
NUMA node(s):          2
L1d cache:             unknown size
L1i cache:             unknown size
L2 cache:              unknown size
NUMA node0 CPU(s):     0-3
NUMA node1 CPU(s):     4-7
The Cpus 0-3 is assigned with NUMA node 1 in QEMU while it get NUMA node
0 in the guest.

In fact, In the linux kernel, numa_node_id is allocated per the ACPI
SRAT processors structure order,so the cpu 0 will be the first one to
allocate its NUMA node id, so it gets the NUMA node 0.

To fix this issue, we pack the SRAT processors structure in numa node id
order but not the default cpu number order.

Signed-off-by: Zeng Tao <prime.zeng@hisilicon.com>
---
 hw/arm/virt-acpi-build.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bd5f771..497192b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -520,7 +520,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorGiccAffinity *core;
     AcpiSratMemoryAffinity *numamem;
-    int i, srat_start;
+    int i, j, srat_start;
+    uint32_t node_id;
     uint64_t mem_base;
     MachineClass *mc = MACHINE_GET_CLASS(vms);
     MachineState *ms = MACHINE(vms);
@@ -530,13 +531,19 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     srat = acpi_data_push(table_data, sizeof(*srat));
     srat->reserved1 = cpu_to_le32(1);
 
-    for (i = 0; i < cpu_list->len; ++i) {
-        core = acpi_data_push(table_data, sizeof(*core));
-        core->type = ACPI_SRAT_PROCESSOR_GICC;
-        core->length = sizeof(*core);
-        core->proximity = cpu_to_le32(cpu_list->cpus[i].props.node_id);
-        core->acpi_processor_uid = cpu_to_le32(i);
-        core->flags = cpu_to_le32(1);
+    for (i = 0; i < ms->numa_state->num_nodes; ++i) {
+        for (j = 0; j < cpu_list->len; ++j) {
+            node_id = cpu_to_le32(cpu_list->cpus[j].props.node_id);
+            if (node_id != i) {
+                continue;
+            }
+            core = acpi_data_push(table_data, sizeof(*core));
+            core->type = ACPI_SRAT_PROCESSOR_GICC;
+            core->length = sizeof(*core);
+            core->proximity = node_id;
+            core->acpi_processor_uid = cpu_to_le32(j);
+            core->flags = cpu_to_le32(1);
+        }
     }
 
     mem_base = vms->memmap[VIRT_MEM].base;
-- 
2.8.1

