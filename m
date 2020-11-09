Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3263309lfb;
        Sun, 8 Nov 2020 19:09:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycfv8gqy5knWxth2Nw/PiAoT7UncRjAeqLBR7sccjUlWoqSsKfaHTj60uSLRtx53HtLn94
X-Received: by 2002:ad4:5387:: with SMTP id i7mr12011952qvv.43.1604891357941;
        Sun, 08 Nov 2020 19:09:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891357; cv=none;
        d=google.com; s=arc-20160816;
        b=HfuDw9ThHPrEcVz/EK8xEHZmQmAc+mbTcGMO5xUG7xokSHssQv1wh9RJDi4ykJ5XBF
         KOB4uc04GBRyV5BqZlihAe8haG/k5z1Ho6YXpRMWYYa78bOqkt5sA/69AFI5Yo+wUJhg
         oEpU54nnBVKLEqaZvq/JzYRfpYR6UpqsBvcOHlDdXZgfi+wrxC9QxRZE8hLNdGp/2jsK
         O8sESZBp5slJmvkYyea54onDFNJa6FPAc6rnFaSmVyNRt1R2+zWBk3CmV3voNfSZTSgr
         kUOeydxE0Pa4fHcrjlMZXFAq93ApBCzVlDz0XEEDly571H7FNNoRkJf2Ot7Cv6rWflbA
         KbDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=GH+ibQ2576qOP1kBNTtEm74Ke+Cz6piaTaaNiBV+ex8=;
        b=OTh32CFYF9unqopOEkf3wPdnVNm+f+mPN9Rg6XPV2r6OOYw9LI/F/1AWwanO/an4hm
         xnkkkUOdXkagCylIMMIK/w/1mocLGU8X/0ZnoRuBFIoh7oAwPADGB8nP0etCegp11vNT
         IvmnURyn59dn3FhWZXVPK3Dssu7phzPonjIDpvyMdTAd50i7JIOLvyKYeAIP5L2hsNbE
         K5EkqjTkgD7B6FNfU+oojQecCVwz9A5fxQqr+ub7V7amSIN0PtoSBf9o/ZSNPAmKTd6H
         7PNTXOAYHU2au6WjrvG0y4/5MlpTXNq/OLe9A4oa49U8+tBPbqhfd7GLKuz11LecgEFA
         LZ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p6si4443685qti.237.2020.11.08.19.09.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:09:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxYT-0006W5-EV
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUt-0001d0-Hm; Sun, 08 Nov 2020 22:05:35 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUo-0006hT-1b; Sun, 08 Nov 2020 22:05:35 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpf2ZGkzkgtG;
 Mon,  9 Nov 2020 11:05:14 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:15 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 09/13] hw/arm/virt-acpi-build: add PPTT table
Date: Mon, 9 Nov 2020 11:04:48 +0800
Message-ID: <20201109030452.2197-10-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mZ0uraYkpJ2+

Add the Processor Properties Topology Table (PPTT) to present cpu topology
information to the guest.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9edd6385dc..5784370257 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -429,6 +429,42 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
+static void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+{
+    int pptt_start = table_data->len;
+    int uid = 0, cpus = 0, socket;
+    unsigned int smp_cores = ms->smp.cores;
+    unsigned int smp_threads = ms->smp.threads;
+
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
+        uint32_t socket_offset = table_data->len - pptt_start;
+        int core;
+
+        build_socket_hierarchy(table_data, 0, socket);
+
+        for (core = 0; core < smp_cores; core++) {
+            uint32_t core_offset = table_data->len - pptt_start;
+            int thread;
+
+            if (smp_threads <= 1) {
+                build_processor_hierarchy(table_data, 2, socket_offset, uid++);
+             } else {
+                build_processor_hierarchy(table_data, 0, socket_offset, core);
+                for (thread = 0; thread < smp_threads; thread++) {
+                    build_smt_hierarchy(table_data, core_offset, uid++);
+                }
+             }
+        }
+        cpus += smp_cores * smp_threads;
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + pptt_start), "PPTT",
+                 table_data->len - pptt_start, 2, NULL, NULL);
+}
+
 /* GTDT */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
@@ -669,6 +705,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
     MachineState *ms = MACHINE(vms);
+    bool cpu_topology_enabled = !vmc->ignore_cpu_topology;
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
@@ -688,6 +725,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (cpu_topology_enabled) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, ms);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-- 
2.23.0

