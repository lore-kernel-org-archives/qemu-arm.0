Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4647055lfr;
        Tue, 13 Apr 2021 01:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbAHV2ph2TPpr8+oKt6D+ehzIzW1NGR9LdSjdHG16+hcbVF5dgw99KteI4J4dhMWACxc4s
X-Received: by 2002:ab0:2456:: with SMTP id g22mr4478347uan.81.1618301464705;
        Tue, 13 Apr 2021 01:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618301464; cv=none;
        d=google.com; s=arc-20160816;
        b=jYTYU1GupOij1U2t4qS9hzLbJZb8iaFZ6Udd5wmckSOa/GHEhkYEhm74Bdedg3EHvA
         E/uv9oDm0fsVGj9XUFITaj6l3Hv5X+PNQCIV+3lNHzkrDmmVJkK1al6uIKF2SPSzJwVS
         jc4NOiixIuudXnyITrX5tlshLv38V/6FhfKH81vElVrpnqXYBwDKy5TK2Ol1iYSyhJBj
         nZOFY+JYfYZSD0I7NB6iZTDV40D5L3axdV7aadEinT1gauGD3KFGFNtzmL80+HxPF6AI
         aiMd5xY1WubnOCZE8B822P1Wlb5J0EY/dRkcjGJXDIynM7DDQrfQOea/DiJDei+HN/RJ
         gJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=dp9f41L2KQ6bSgapyQUPNDUtxn44ml5XMPfF4TMh5mU=;
        b=V00Du14FmKIcdG0NT4891FAYc8VEh6LQW98xkAnQgq5sMFOV2c7IWmeAs/9Vs95Sik
         7BwCG0bf9w0b5Vhq7IK2crQLPEDNO6nONWoY+pAzUiRT2Bgs2EdlmNua1QbwobqR9irj
         2+QBupQFyKEt8Jf0vbzee+Gz6cMrODEojdppx2ESHuvrmikByQBLM07zY2p/FwsXQUQV
         IdygnewqjPvLXdhl1WJCgD5M2OEU0GIjGFqTXrqFkoylw4IS1l3/Vq6p65R7hA5YZysq
         rlMCGSCKDmN+NNWCQPmrwrMz7FYG2aPoMp7kVzGGt7sQRkBEV00aHuohrLsNqFDlIZQi
         N1OA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si5826960uap.191.2021.04.13.01.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWE8V-00006F-W3
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5p-0004He-Kw; Tue, 13 Apr 2021 04:08:17 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5m-0006Yi-Jk; Tue, 13 Apr 2021 04:08:17 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKJ8N30PtzlXdW;
 Tue, 13 Apr 2021 16:06:12 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:07:55 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Date: Tue, 13 Apr 2021 16:07:44 +0800
Message-ID: <20210413080745.33004-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413080745.33004-1-wangyanan55@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NTh1y6i80HaE

Add the Processor Properties Topology Table (PPTT) to present
CPU topology information to ACPI guests. Note, while a DT boot
Linux guest with a non-flat CPU topology will see socket and
core IDs being sequential integers starting from zero, e.g.
with -smp 4,sockets=2,cores=2,threads=1

a DT boot produces

 cpu:  0 package_id:  0 core_id:  0
 cpu:  1 package_id:  0 core_id:  1
 cpu:  2 package_id:  1 core_id:  0
 cpu:  3 package_id:  1 core_id:  1

an ACPI boot produces

 cpu:  0 package_id: 36 core_id:  0
 cpu:  1 package_id: 36 core_id:  1
 cpu:  2 package_id: 96 core_id:  2
 cpu:  3 package_id: 96 core_id:  3

This is due to several reasons:

 1) DT cpu nodes do not have an equivalent field to what the PPTT
    ACPI Processor ID must be, i.e. something equal to the MADT CPU
    UID or equal to the UID of an ACPI processor container. In both
    ACPI cases those are platform dependant IDs assigned by the
    vendor.

 2) While QEMU is the vendor for a guest, if the topology specifies
    SMT (> 1 thread), then, with ACPI, it is impossible to assign a
    core-id the same value as a package-id, thus it is not possible
    to have package-id=0 and core-id=0. This is because package and
    core containers must be in the same ACPI namespace and therefore
    must have unique UIDs.

 3) ACPI processor containers are not required for PPTT tables to
    be used and, due to the limitations of which IDs are selected
    described above in (2), they are not helpful for QEMU, so we
    don't build them with this patch. In the absence of them, Linux
    assigns its own unique IDs. The maintainers have chosen not to use
    counters from zero, but rather ACPI table offsets, which explains
    why the numbers are so much larger than with DT.

 4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
    match the logical CPU IDs, because these IDs must be equal to the
    MADT CPU UID (as no processor containers are present), and QEMU
    uses the logical CPU ID for these MADT IDs.

Tested-by: Jiajie Li <lijiajie11@huawei.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2ad5dad1bf..03fd812d5a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
+/* PPTT */
+static void
+build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+{
+    int pptt_start = table_data->len;
+    int uid = 0, cpus = 0, socket = 0;
+    MachineState *ms = MACHINE(vms);
+    unsigned int smp_cores = ms->smp.cores;
+    unsigned int smp_threads = ms->smp.threads;
+
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
+        uint32_t socket_offset = table_data->len - pptt_start;
+        int core;
+
+        build_processor_hierarchy_node(
+            table_data, 1, /* Physical package */
+            0, socket, /* No parent */
+            NULL, 0);  /* No private resources */
+
+        for (core = 0; core < smp_cores; core++) {
+            uint32_t core_offset = table_data->len - pptt_start;
+            int thread;
+
+            if (smp_threads <= 1) {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI Processor ID valid */
+                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                    socket_offset, uid++, /* Parent is a Socket */
+                    NULL, 0);  /* No private resources */
+            } else {
+                build_processor_hierarchy_node(
+                    table_data, 0,
+                    socket_offset, core, /* Parent is a Socket */
+                    NULL, 0); /* No private resources */
+
+                for (thread = 0; thread < smp_threads; thread++) {
+                    build_processor_hierarchy_node(
+                        table_data,
+                        (1 << 1) | /* ACPI Processor ID valid */
+                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                        core_offset, uid++, /* Parent is a Core */
+                        NULL, 0);  /* No private resources */
+                }
+            }
+        }
+        cpus += smp_cores * smp_threads;
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + pptt_start), "PPTT",
+                 table_data->len - pptt_start, 2,
+                 vms->oem_id, vms->oem_table_id);
+}
+
 /* GTDT */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, vms);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-- 
2.19.1

