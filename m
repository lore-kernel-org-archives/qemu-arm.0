Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2886186lfg;
        Tue, 22 Jun 2021 02:36:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFqNzVjhJwQQIeH3Y/x2vHajxs8nOlKcGny4eQC9xiGBPF8vuNnY/LKGfjuucV5d8axh/Y
X-Received: by 2002:ac8:5ad5:: with SMTP id d21mr2504163qtd.166.1624354568641;
        Tue, 22 Jun 2021 02:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354568; cv=none;
        d=google.com; s=arc-20160816;
        b=Ft2AFrLQoj/eKXtAdNHOqzsmKyGmnPS6HoyT3/ESPaGnnwCbiXWL9/92B14IXfycln
         TrK5uDP6iEcyg1gtl0F0aGVjEcLY97c6lSwN+LMUDeGu03OHnf1s/DhnDCg+6mRweLgQ
         atbcj+MdAlwv5+GDzDoVw3kFkHyYZoxRCEZZ5D+WRvPqIneUgL42p2HZ10nVXQ2fwPCD
         Xf5IFRCJ5QisXpnKhCo8JrUnzFDC9HjVFi8rPpPDk7DbDOgt3ilmVw3IRbce3mz1+hDT
         4tBMxnbfVwUXpRapd+8bg0dp31/3mVWwAxpdKX3Kg1F4i2CHrGCwPQZMuP06D8ROATkn
         g/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ylTe/pevqgxKHN1XVwGri7xs6BgI2XOSmgs8VzXWf4o=;
        b=V3WVQc5RA68EG5CVmttfm6r0WFmPRKLmE/tvvC5vmAnNUb/l/dBGunNhFe/EVMm4xp
         HTVKG+klH3txBD0fRThLbEz+mcD18dcwybqTE4SPMxddoBUrZ94wHbO/997sGZlXMidn
         dpOu2YHpdbNdM3lssh6ZvuiEjDnc3S9lojdB9bOA8OJsuc6MU+UGIQxJhRzV5NosmUkx
         5JirNcecqlYXl23qxfNWByWLSRBURPBCJ/EXnnqAi0gBim9w3CuJgBrAYxxpZS29H/bc
         06rRV2SdHN6JlwpCpVh2XE0orAN2OJ13s2gHaMN78jkPugsqP0qmaq5Bfp7XGd4gRLzD
         845Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si1398120qtg.203.2021.06.22.02.36.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcpD-0005XL-Vd
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnk-0002wC-5p; Tue, 22 Jun 2021 05:34:36 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-000343-1q; Tue, 22 Jun 2021 05:34:35 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G8LkV23vDzZh1N;
 Tue, 22 Jun 2021 17:31:30 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:30 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:29 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 7/7] hw/acpi/aml-build: Generate PPTT table
Date: Tue, 22 Jun 2021 17:34:13 +0800
Message-ID: <20210622093413.13360-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dv3mQ3xTk8oZ

From: Andrew Jones <drjones@redhat.com>

Add the Processor Properties Topology Table (PPTT) to expose
CPU topology information defined by users to ACPI guests.

Note, a DT-boot Linux guest with a non-flat CPU topology will
see socket and core IDs being sequential integers starting
from zero, which is different from ACPI-boot Linux guest,
e.g. with -smp 4,sockets=2,cores=2,threads=1

a DT boot produces:

 cpu:  0 package_id:  0 core_id:  0
 cpu:  1 package_id:  0 core_id:  1
 cpu:  2 package_id:  1 core_id:  0
 cpu:  3 package_id:  1 core_id:  1

an ACPI boot produces:

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

 3) ACPI processor containers are not mandatorily required for PPTT
    tables to be used and, due to the limitations of which IDs are
    selected described above in (2), they are not helpful for QEMU,
    so we don't build them with this patch. In the absence of them,
    Linux assigns its own unique IDs. The maintainers have chosen not
    to use counters from zero, but rather ACPI table offsets, which
    explains why the numbers are so much larger than with DT.

 4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
    match the logical CPU IDs, because these IDs must be equal to the
    MADT CPU UID (as no processor containers are present), and QEMU
    uses the logical CPU ID for these MADT IDs.

So in summary, with QEMU as vender for the guest, we use sequential
integers starting from zero for non-leaf nodes without valid ID flag,
so that guest will ignore them and use table offsets as unique IDs.
And we use logical CPU IDs for leaf nodes to be consistent with MADT.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c         | 49 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |  8 +++++-
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 9fa5024414..a92c7d8123 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1946,6 +1946,55 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id)
+{
+    int pptt_start = table_data->len;
+    int uid = 0, socket;
+
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    for (socket = 0; socket < ms->smp.sockets; socket++) {
+        uint32_t socket_offset = table_data->len - pptt_start;
+        int core;
+
+        build_processor_hierarchy_node(
+            table_data,
+            (1 << 0), /* ACPI 6.2 - Physical package */
+            0, socket, NULL, 0);
+
+        for (core = 0; core < ms->smp.cores; core++) {
+            uint32_t core_offset = table_data->len - pptt_start;
+            int thread;
+
+            if (ms->smp.threads == 1) {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                    socket_offset, uid++, NULL, 0);
+            } else {
+                build_processor_hierarchy_node(table_data, 0, socket_offset,
+                                               core, NULL, 0);
+
+                for (thread = 0; thread < ms->smp.threads; thread++) {
+                    build_processor_hierarchy_node(
+                        table_data,
+                        (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                        core_offset, uid++, NULL, 0);
+                }
+            }
+        }
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + pptt_start), "PPTT",
+                 table_data->len - pptt_start, 2, oem_id, oem_table_id);
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f1024843dd..90d2176b35 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -698,13 +698,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (ms->expose_cpu_topology) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, ms, vms->oem_id,
+                   vms->oem_table_id);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index ea74b8f6ed..6c29f853cd 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -466,6 +466,9 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
                                     uint32_t parent, uint32_t id,
                                     uint32_t *priv_rsrc, uint32_t priv_num);
 
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-- 
2.23.0

