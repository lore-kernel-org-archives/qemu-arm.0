Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp211811lfq;
        Wed, 16 Sep 2020 20:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGdRTFfqqKnYerBCjXyNv4/SP2WTOhRoLCNgi/DrUOxZ9w8bpuBEyzG4xkUKiajnQflmWK
X-Received: by 2002:a25:1f44:: with SMTP id f65mr40155496ybf.438.1600313233920;
        Wed, 16 Sep 2020 20:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313233; cv=none;
        d=google.com; s=arc-20160816;
        b=ddIxkgSKWv7QNmNsAWbhu6I4TFibCxT7WWrdk0jZb2/XndI3Zn6z2FzrYt8Vu9vERI
         45W36Yt9rUVMWCIQ6C6SRUeFsV4sSkUmMR7aeAClLPJ9eqfe75W3qKXptVv16f3lP6yN
         1nwbi6Fhuok/QocsYVqKeOCKC+YdjvKHiFOx/L6UbGoX6bd5+LUB9FjqjV17lcXtDGLN
         al0boH8pyA6Q8SjTLC6vKVVXZ0wMpX95Gyk9qc1GuM8hGYp3h0WfXRq/n7+MPLo1o5ap
         z36GZ0I7DfOotMmO+lTdyzIT9vdl6uSY40m66gis6GLGmKqtNl4k0bp2G2FMVeMt/Rkn
         bD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YKniKsudMBoLA3nciAz+s8XTk82AfEjwd6cK+BUPct8=;
        b=t1Sq+rt1QA5O7lPfG4qR7fqj4veOz4tpfSZ00lLAIQPCXSmCTVEg3uwg9Fg/JLHBVQ
         b3SgXxpO9suDIQZqWEzw5s7flpJz0kEcwSNjouLYcH3SVaz3vatlLSdcrnkZXcvcsF8b
         7tXtRzpNa63+0pcOKGPlQoL2/Wohkau1LXyHdzFAqVjsl7VFH+KvZpC3gVAhPLOXtnxQ
         SoV+VSTX+ds70DsHYDUnxZ8u0xPdzsrtqSdAtOOgxgHTNxYyfHLXx3yx0sor8yMO6MW+
         0nC0XTeM0XHPdvPExwZCm50mHfA2aSMYqSEvLrDNBz0ilhSTgUBQYa3OJeGJBOMtG4bs
         FjUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d61si14324723ybi.40.2020.09.16.20.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkZl-0005Gi-9P
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUT-0005AO-IL; Wed, 16 Sep 2020 23:21:45 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4749 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004RU-OT; Wed, 16 Sep 2020 23:21:45 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3B6E6BB3E86ED2AFA745;
 Thu, 17 Sep 2020 11:21:14 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:21:02 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 08/12] hw/arm/virt-acpi-build: add PPTT table
Date: Thu, 17 Sep 2020 11:20:29 +0800
Message-ID: <20200917032033.2020-9-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:21:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jYZDla3xIRiv

Add the Processor Properties Topology Table (PPTT) to present CPU topology
information to the guest.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f1d574b5d3..b5aa3d3c83 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -594,6 +594,42 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
@@ -834,6 +870,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
     MachineState *ms = MACHINE(vms);
+    bool cpu_topology_enabled = !vmc->ignore_cpu_topology;
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
@@ -853,6 +890,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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

