Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp174252lfg;
        Thu, 25 Feb 2021 00:57:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPmKeC2M84oN2zF6FHDvKI65XC+9N7oIzSY0Bg3kGdu+0su9gq7X+pbclrV4gA71o0/okd
X-Received: by 2002:a05:6e02:1ca8:: with SMTP id x8mr1556461ill.139.1614243443220;
        Thu, 25 Feb 2021 00:57:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614243443; cv=none;
        d=google.com; s=arc-20160816;
        b=A/rIk+i28CsqcJnSuhHvuPpigX1a6A2wV5vySbeBtBITkI8yeZplCQi8EL5lwfqZvl
         +iBgtExYF9M34oY0FZ+Ad+KzRhz57g0mfQe93reIoh7950jaHsqJOYNM8/ikKkasoYDn
         1KuH63wedQgonw4/B3zcUb2GN9+XLdoDHCI9kRXJ4eBmiRL05GUUscV0p2vDFnxE7ZDm
         PBSKOyXBoTnqEdrraXkUfWi0SBriSoG8v+F9bPmbY3Z2/EVX4ow+kwWH46+9kldTI0wZ
         pr7QZvYhbFtlibnUs/0+o6Lm9DDfVyUA4OZAhYOfparl4lvbT11NVUZMmkzqes78kuAc
         KPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ad1xNhF40BhhaRvNPqvUtzejb1IodUFz3YNbOw9MugI=;
        b=ZPEBeafgMoXR9bZ2DOjLOwIbO9eOVqHlm1ivnKY9D0/JvqkTXqnHCKRoIdBkCwpuwi
         lsQaVjIkvOUdgBPunAElnnTud1fQs1/Rhs+DlYNkceuUFVBoryspJdBLg7wOEZEEAPIc
         TzAmOQc95tEe9w60qdhxiiCrlc3btysZF23YycjmaU2kHr96pHRW4m2K9lUH7oVYpJTR
         OfnajwhSuKWpxceAqS2knBHKs8+RUaqLADqBHO03pk6iaLvWlomTE0+YmQD9sK9cLDCl
         nPA7RpdVOrN6zBaR6PQHNhlpwY9g5iSiRi9J394tpRyVYlZlgd0CkpqLUI4igPmnbuLB
         HhKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f11si3818074jam.89.2021.02.25.00.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 00:57:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCSY-0007fB-EL
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 03:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSG-0007Z8-8q; Thu, 25 Feb 2021 03:57:04 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSB-0003vu-RD; Thu, 25 Feb 2021 03:57:04 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DmRT56R5vzjRGQ;
 Thu, 25 Feb 2021 16:55:37 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:46 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 5/5] hw/arm/virt-acpi-build: add PPTT table
Date: Thu, 25 Feb 2021 16:56:27 +0800
Message-ID: <20210225085627.2263-6-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XowLRQ2RVNEb

Add the Processor Properties Topology Table (PPTT) to present
CPU topology information to the guest. A three-level cpu
topology is built in accord with the linux kernel currently does.

Tested-by: Jiajie Li <lijiajie11@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bb91152fe2..38d50ce66c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -436,6 +436,50 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  vms->oem_table_id);
 }
 
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
+        build_socket_hierarchy(table_data, 0, socket);
+
+        for (core = 0; core < smp_cores; core++) {
+            uint32_t core_offset = table_data->len - pptt_start;
+            int thread;
+
+            if (smp_threads <= 1) {
+                build_processor_hierarchy(table_data,
+                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
+                                          ACPI_PPTT_ACPI_LEAF_NODE,
+                                          socket_offset, uid++);
+             } else {
+                build_processor_hierarchy(table_data,
+                                          ACPI_PPTT_ACPI_PROCESSOR_ID_VALID,
+                                          socket_offset, core);
+                for (thread = 0; thread < smp_threads; thread++) {
+                    build_thread_hierarchy(table_data, core_offset, uid++);
+                }
+             }
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
@@ -688,6 +732,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
     MachineState *ms = MACHINE(vms);
+    bool cpu_topology_enabled = !vmc->no_cpu_topology;
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
@@ -707,6 +752,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (ms->smp.cpus > 1 && cpu_topology_enabled) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, vms);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-- 
2.23.0

