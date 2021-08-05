Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp203227lff;
        Thu, 5 Aug 2021 05:40:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxORby0o6uFooqJiIHvDSYtoU3DO6YuX0Z6bD1mVTVWBYl2jVY9mOsNS39JG9k0KXLOgokN
X-Received: by 2002:a1f:1fcb:: with SMTP id f194mr3514486vkf.18.1628167236748;
        Thu, 05 Aug 2021 05:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628167236; cv=none;
        d=google.com; s=arc-20160816;
        b=ppkdZDRTlR6W4uaYkdttROPzF4pFtVmsjEOZYhN0xtdL86H1M3viygYU4ZJBTz3Vgt
         pU9hy+7wlp/6MUj72twbon62LGbgVgpeKadVCM9tQssq5FAbpn3pYBRH1YqGwtrbBOvL
         4FQGq6WOLG3Unf0o6Jh/iM19HoUGuGAI2XaJUrY8c81xkF3H27o9QYVqhj3bKNYBV1AU
         BVKWcATCw/dz+ZWdR0CFIall1TWXZnm0V0VY4fpjLoS2c9/TGaTwdV4k40BUm534+0oP
         I0oCGLo1OtRTonGB8Ip+CcZ2+RXRPzH2U7Ow+hKUhXyeCbweVtFT3+yqpHiyqjF7MFQG
         IQMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=wflX1SibfcNQuY+nd8TVQNankgRRC/rHM0s5H4weZnI=;
        b=kMX22N5fhBRxRO8uI9t3DyabZ1l71I22GzxWJSszVtxqooFM0Rl0fW/G4i4jJwYHc1
         Zax+tLbqGxWGcPypxmW/ls0XzByX/WI40ltGjtuS35jfBzttKdlAQud8Rbefb8k4M7LL
         FWyqVC2Iyr5fpkr1DTGsZMKweY6QjMOfYIPP8xkGoH2L7H2ZZnZ3JgvQDlncJ9CoH6TK
         +LHtum3sob8NpE7zDw21YE6FPN63AafaKOob1yf1MLF1IWUSenUqAoplvFxNPMqa4sCP
         1IdquNe/5IEYr3OJluqwd3VQjOdUZbHXT91T8D+VK3mChxknt19Uz4iQ+XeFfHv55XRI
         9DNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k11si3143611uad.147.2021.08.05.05.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 05:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBcfs-00052o-1V
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 08:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcf1-00045S-MZ; Thu, 05 Aug 2021 08:39:43 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mBcex-00064a-48; Thu, 05 Aug 2021 08:39:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GgSq45CXszYkDK;
 Thu,  5 Aug 2021 20:39:28 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:36 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 20:39:35 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH for-6.2 v5 5/5] hw/acpi/aml-build: Generate PPTT table
Date: Thu, 5 Aug 2021 20:39:21 +0800
Message-ID: <20210805123921.62540-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210805123921.62540-1-wangyanan55@huawei.com>
References: <20210805123921.62540-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/ZlM1mSdIOt

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
 hw/acpi/aml-build.c         | 50 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |  8 +++++-
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 9fa5024414..aa61c9651e 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1946,6 +1946,56 @@ void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
     }
 }
 
+/* ACPI 6.2: 5.2.29 Processor Properties Topology Table (PPTT) */
+void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
+                const char *oem_id, const char *oem_table_id)
+{
+    int pptt_start = table_data->len;
+    int uid = 0;
+    int socket;
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
+            if (ms->smp.threads > 1) {
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
+            } else {
+                build_processor_hierarchy_node(
+                    table_data,
+                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                    socket_offset, uid++, NULL, 0);
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
index 037cc1fd82..db23306a06 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -790,13 +790,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (!vmc->no_cpu_topology) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, ms,
+                   vms->oem_id, vms->oem_table_id);
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
2.19.1

