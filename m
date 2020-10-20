Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4786518lfa;
        Tue, 20 Oct 2020 06:25:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/tssZ+vlOikOviJEkhwWhiwy7EyLuiBL9V4JPFWs9wVYEtnkamEsFEzOr54YV4qGzP3sr
X-Received: by 2002:a25:bd0c:: with SMTP id f12mr3744272ybk.392.1603200305998;
        Tue, 20 Oct 2020 06:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200305; cv=none;
        d=google.com; s=arc-20160816;
        b=NIuNXIVVR573gVjj1WENp8RPVTTaILH9C9pQ1MwU+FEr8J1RLXEyzlBhJfsJ6j/g8y
         4Rs9zilAG0Pk8YNa1Ph99q1zvUq60sI0Hm8MXhBrs4D1xTEBkeqQxXYfi2zP4VSpWysa
         PdJMwqxrQHHebV/3QJAYz/dKi3VnIC/BBsvvjYhRidI774RMCB/mHNjK5FttQOvcdKCO
         uPoKAF79lCpryGa/AQAZYMcxlTZd6BgQ56tLKM8tjrnQUl1lqI2oJakOClYE5ccr/9eN
         R8olqr2fSS9VQigw7C6RjfoDxWfQd7OaYgxBJYcioKC28DvrYACZTJOVveGAT8yiX0tt
         JTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=UlzFWyC2/8iQbmIB1tH8igpDPORz5t/IQSqj1TOs5Us=;
        b=Ig9gRFAUyrA38xk/WqwvH4wLUImazTjDoZ0b9IueXjzOLpx+iqFaQY3gzVr1whkoDc
         xCHafzhwqiJFqmrYAxprquusS0rVl8N1+GZGvb5izAvklO7pf6HH9bQHeCh/eRxQxA3Y
         cstz5NhX+Fq0+KdVi+zJOlkwCN+IlGv7nCp08CfvPnUfZMjd0NTnV8Zn3mpU8Gc0Gqf0
         k42wm0nS+AusgQ1gbOn8UX6nOXGZbnouBOHnVeaNwEqyeh4veUKnb5IA8fqsUjOUgG58
         XhJaDa0k6uojBVHq0q+9E1WCxL6uRM8DRNxb4+8dPAk8IAYW9LMYuI48nOl/r/12xfMr
         tMVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si1718631ybp.485.2020.10.20.06.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUrdR-0004qH-9X
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU9-0000OR-Sj; Tue, 20 Oct 2020 09:15:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5268 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00077Q-Op; Tue, 20 Oct 2020 09:15:29 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5270886DE4E3BFBC85C7;
 Tue, 20 Oct 2020 21:15:13 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:03 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 09/13] hw/arm/virt-acpi-build: add PPTT table
Date: Tue, 20 Oct 2020 21:14:36 +0800
Message-ID: <20201020131440.1090-10-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WAZU8MMvkkyu

Add the Processor Properties Topology Table (PPTT) to present CPU topology
information to the guest.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/arm/virt-acpi-build.c | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fae5a26741..e1f3ea50ad 100644
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

