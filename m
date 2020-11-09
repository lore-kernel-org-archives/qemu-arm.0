Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3263064lfb;
        Sun, 8 Nov 2020 19:08:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7iELF7fHbGDctN5wDhGxC6CksOB89XlRDDZKvb5ia1zS+t2ksFT0hPBMbX45Q5wz0WLvy
X-Received: by 2002:ac8:e41:: with SMTP id j1mr9169109qti.43.1604891327292;
        Sun, 08 Nov 2020 19:08:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891327; cv=none;
        d=google.com; s=arc-20160816;
        b=feiG5ACmZNCy7XzCi2yGyTpkmq9Gv9JS62xFMEFLRR2N3xe7r96JlUmyTBZYb4YY44
         qseQdUL0cJ/hENvWQK5z/5D69SENTG9u3bKkUyupbVmMW3ILnPsMPLJsUax0KtBdp9xK
         TQZptmWyRZ3ov28FB0Vg0AKFyR+/MjpZlxznTGiQswL9EkUXg2+Ab3Y8gafNEEl5tig/
         /ZGXFDO2Edw7owz3di6U2FrHg/IjLLZjySYx5zqI/bxMU0lVjRiYO3hpHIvqbA33cAMe
         PXBMI0IobqiuOfULyNdolpmpXuKLu8r4vgRGrNhrDCaLPPk14ly3ZURDbUPT0VNNnzDv
         ig4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pqyMi1vIW0rmYZPRsi33jn1HU1jqeEVbEj9Y9YQzZ38=;
        b=Jh7EUidKM/CRkncA7oVdanNMeKeZKcSbxgWylxlC3jRnu7snj7Jai+B7eOwWZ6XxrN
         ZzSfhyjCz4I2UIp3ETUVWkA+VvjLEhAg8DEP6Uk23bgVSUJDWTBP5e7w7GSbpv9K8/dS
         Y8HvN49HDGJJDlIrT2nugOBcA+zsJPB6Xnex5SpW5ASooBQLJwU4sTqs5xqyPuN1iV+o
         Q1C1n4uGOVJ4QtTd+Yz+sOiCetxttuFnbUQ+U+jgd70LyO7hbwCppkcn/aBBzF60eGli
         SyLiNwun3wsZGMyHeV6THqqzb5P8PXZKZWf1CczRed5UCgnvCLSMstnKwWPDfyraIGh+
         4XrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m37si4331315qtb.401.2020.11.08.19.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:08:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxXy-00064X-Ng
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUu-0001gk-JO; Sun, 08 Nov 2020 22:05:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUo-0006i3-S5; Sun, 08 Nov 2020 22:05:36 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CTwpk0WHczhgSH;
 Mon,  9 Nov 2020 11:05:18 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:18 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 13/13] hw/arm/virt-acpi-build: Enable cpu and cache
 topology
Date: Mon, 9 Nov 2020 11:04:52 +0800
Message-ID: <20201109030452.2197-14-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:18
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: BEuRdsC86+h6

A helper struct AcpiCacheOffset is introduced to describe the offset
of three level caches. The cache hierarchy is built according to
ACPI spec v6.3 5.2.29.2. Let's enable CPU cache topology now.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 19 +++++++++-----
 hw/arm/virt-acpi-build.c    | 52 ++++++++++++++++++++++++++++++++-----
 include/hw/acpi/acpi-defs.h |  6 +++++
 include/hw/acpi/aml-build.h |  7 ++---
 4 files changed, 68 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1a38110149..93a81fbaf5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1799,27 +1799,32 @@ void build_cache_hierarchy(GArray *tbl,
 /*
  * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
  */
-void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+void build_socket_hierarchy(GArray *tbl, uint32_t parent,
+                            uint32_t offset, uint32_t id)
 {
     build_append_byte(tbl, 0);          /* Type 0 - processor */
-    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_byte(tbl, 24);         /* Length, with private resources */
     build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
     build_append_int_noprefix(tbl, 1, 4);  /* Flags: Physical package */
     build_append_int_noprefix(tbl, parent, 4);  /* Parent */
     build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
-    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, 1, 4);  /*  Number of private resources */
+    build_append_int_noprefix(tbl, offset, 4);  /* Private resources */
 }
 
-void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-                               uint32_t parent, uint32_t id)
+void build_processor_hierarchy(GArray *tbl, uint32_t flags, uint32_t parent,
+                               AcpiCacheOffset offset, uint32_t id)
 {
     build_append_byte(tbl, 0);          /* Type 0 - processor */
-    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_byte(tbl, 32);         /* Length, with private resources */
     build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
     build_append_int_noprefix(tbl, flags, 4);  /* Flags */
     build_append_int_noprefix(tbl, parent, 4); /* Parent */
     build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
-    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, 3, 4);  /* Number of private resources */
+    build_append_int_noprefix(tbl, offset.l1d_offset, 4);/* Private resources */
+    build_append_int_noprefix(tbl, offset.l1i_offset, 4);/* Private resources */
+    build_append_int_noprefix(tbl, offset.l2_offset, 4); /* Private resources */
 }
 
 void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 5784370257..ad49006b42 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -429,29 +429,69 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
-static void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms)
+static inline void arm_acpi_cache_info(CPUCacheInfo *cpu_cache,
+                                       AcpiCacheInfo *acpi_cache)
 {
+    acpi_cache->size = cpu_cache->size;
+    acpi_cache->sets = cpu_cache->sets;
+    acpi_cache->associativity = cpu_cache->associativity;
+    acpi_cache->attributes = cpu_cache->attributes;
+    acpi_cache->line_size = cpu_cache->line_size;
+}
+
+static void build_pptt(GArray *table_data, BIOSLinker *linker,
+                       VirtMachineState *vms)
+{
+    MachineState *ms = MACHINE(vms);
     int pptt_start = table_data->len;
     int uid = 0, cpus = 0, socket;
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
+    AcpiCacheOffset offset;
+    ARMCPU *cpu = ARM_CPU(qemu_get_cpu(cpus));
+    AcpiCacheInfo cache_info;
 
     acpi_data_push(table_data, sizeof(AcpiTableHeader));
 
     for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
-        uint32_t socket_offset = table_data->len - pptt_start;
+        uint32_t l3_offset = table_data->len - pptt_start;
+        uint32_t socket_offset;
         int core;
 
-        build_socket_hierarchy(table_data, 0, socket);
+        /* L3 cache type structure */
+        arm_acpi_cache_info(cpu->caches.l3_cache, &cache_info);
+        build_cache_hierarchy(table_data, 0, &cache_info);
+
+        socket_offset = table_data->len - pptt_start;
+        build_socket_hierarchy(table_data, 0, l3_offset, socket);
 
         for (core = 0; core < smp_cores; core++) {
             uint32_t core_offset = table_data->len - pptt_start;
             int thread;
 
+            /* L2 cache tpe structure */
+            offset.l2_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l2_cache, &cache_info);
+            build_cache_hierarchy(table_data, 0, &cache_info);
+
+            /* L1d cache type structure */
+            offset.l1d_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l1d_cache, &cache_info);
+            build_cache_hierarchy(table_data, offset.l2_offset, &cache_info);
+
+            /* L1i cache type structure */
+            offset.l1i_offset = table_data->len - pptt_start;
+            arm_acpi_cache_info(cpu->caches.l1i_cache, &cache_info);
+            build_cache_hierarchy(table_data, offset.l2_offset, &cache_info);
+
+            core_offset = table_data->len - pptt_start;
             if (smp_threads <= 1) {
-                build_processor_hierarchy(table_data, 2, socket_offset, uid++);
+                build_processor_hierarchy(table_data, 2, socket_offset,
+                                          offset, uid++);
              } else {
-                build_processor_hierarchy(table_data, 0, socket_offset, core);
+
+                build_processor_hierarchy(table_data, 0, socket_offset,
+                                          offset, core);
                 for (thread = 0; thread < smp_threads; thread++) {
                     build_smt_hierarchy(table_data, core_offset, uid++);
                 }
@@ -727,7 +767,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (cpu_topology_enabled) {
         acpi_add_table(table_offsets, tables_blob);
-        build_pptt(tables_blob, tables->linker, ms);
+        build_pptt(tables_blob, tables->linker, vms);
     }
 
     acpi_add_table(table_offsets, tables_blob);
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 3df38ab449..e48b7fa506 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -626,4 +626,10 @@ typedef struct AcpiCacheInfo {
     uint16_t line_size;
 } AcpiCacheInfo;
 
+typedef struct AcpiCacheOffset {
+    uint32_t l1d_offset;
+    uint32_t l1i_offset;
+    uint32_t l2_offset;
+} AcpiCacheOffset;
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 01078753a8..a15ccb2c91 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -440,10 +440,11 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 void build_cache_hierarchy(GArray *tbl,
               uint32_t next_level, AcpiCacheInfo *cache_info);
 
-void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+void build_socket_hierarchy(GArray *tbl, uint32_t parent,
+                            uint32_t offset, uint32_t id);
 
-void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-                               uint32_t parent, uint32_t id);
+void build_processor_hierarchy(GArray *tbl, uint32_t flags, uint32_t parent,
+                               AcpiCacheOffset offset, uint32_t id);
 
 void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
-- 
2.23.0

