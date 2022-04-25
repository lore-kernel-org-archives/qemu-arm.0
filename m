Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2095594lfk;
        Sun, 24 Apr 2022 20:31:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWDaOxjM7On5o9q4ne47Kxak2aEb2WMnVcE0/TTSRTRp4tNfcXLX94RHuBFbAeoNOTbQxs
X-Received: by 2002:a05:620a:280e:b0:680:d1b9:6b0 with SMTP id f14-20020a05620a280e00b00680d1b906b0mr9052571qkp.391.1650857507431;
        Sun, 24 Apr 2022 20:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650857507; cv=none;
        d=google.com; s=arc-20160816;
        b=zcUw1tIV3rYdeaYreHuupbhIlI5r9yyaGuv/8eoWyOM9xaRSddXMNPS1HXkEqWpYKO
         JoZGxaZ5h7PnEgDrdyS1DRw7jtTNwnm5fg5W+PqML/qmgdrB37gFdbPqDdmbEXvR8wWy
         /g+kN34QdV5YXxd4gysTsJCde6rq9t9IH+E6l7kkHiKaAWTTT1ntFqrqBshfsIdDQZbD
         Mcjt97t0rNcRwF5I7Khj2H08djC25WBRmmEikJ8C8ZNHLV3sDW4w6qBcOuRZcWFcBUJJ
         1a4t8jD3GYY9Evs8SgrDuEIdDuOFkfUw5z2ThfxZe91qX5dDK75lK8nMnfF4e+ogjJsw
         uTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ij22TRKHMBWJRY8XZ1BtVkL5983598AMxqypVYRPyC0=;
        b=tsvTWwy0CwEF/3njpzVtJcx1pobgkHHpdigccmmRYNCbk2kPb6XI3EMcMCzdoda5dp
         13JTltb/BlTu6kXqo/FAPwxGzIlKGaEfS9LkaQATVmj7Pkn90LBDf6nXl0TWgQVq5lIq
         Y5LAUrUz3kQYlJVNZKtQnBwKsLEauH4Q1vOeaYEfr/X7PCq6BA0Crd+0PVjrgCJIgIgg
         BCzhRmODonA25bzOkkqyhhA76CDMQ63OCEPmumn14QB/djPcpHlDoyqOCYhcTYfVwUJh
         1ehHjeVwu9TpUCgvZsLj5LSGaZE0ZlCVjMRv0JM6vm/LMF5LfJYZLZlx3jHTzmtB+O0r
         MJZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JUvOWBGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8-20020ad443c8000000b004443f623904si251200qvs.326.2022.04.24.20.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Apr 2022 20:31:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JUvOWBGR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nipRy-00069o-Tu
	for alex.bennee@linaro.org; Sun, 24 Apr 2022 23:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQY-0003xh-7Y
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nipQW-0002et-Fj
 for qemu-arm@nongnu.org; Sun, 24 Apr 2022 23:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650857415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ij22TRKHMBWJRY8XZ1BtVkL5983598AMxqypVYRPyC0=;
 b=JUvOWBGRCoaeEejd2IENBHvA8rkEjDGZsJMYxD/4TjFS937LCv0QEW0TcX5HznHAIDKDem
 Hi0tXkTm2x0/J9gch/KAEnB/Q0S/WYI/sL/LGXHHwybdEBZzWvEcQo3nJab9Gdg1DjUgdp
 tD67U1sV5EwyDv5Lv0nxZAwC9fWpo2M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-s86hHvr-OnWliHqRwyydJg-1; Sun, 24 Apr 2022 23:30:10 -0400
X-MC-Unique: s86hHvr-OnWliHqRwyydJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2989C1C0514D;
 Mon, 25 Apr 2022 03:30:10 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F5081468940;
 Mon, 25 Apr 2022 03:30:01 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v8 5/5] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Mon, 25 Apr 2022 11:28:02 +0800
Message-Id: <20220425032802.365061-6-gshan@redhat.com>
In-Reply-To: <20220425032802.365061-1-gshan@redhat.com>
References: <20220425032802.365061-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, eduardo@habkost.net, thuth@redhat.com,
 berrange@redhat.com, peter.maydell@linaro.org, armbru@redhat.com,
 mst@redhat.com, qemu-devel@nongnu.org, zhenyzha@redhat.com, drjones@redhat.com,
 pbonzini@redhat.com, shan.gavin@gmail.com, Jonathan.Cameron@Huawei.com,
 ani@anisinha.ca, imammedo@redhat.com, wangyanan55@huawei.com,
 eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdvnJ6BD74k5

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This reworks build_pptt() to avoid by reusing the existing IDs in
ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Tested-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c | 111 +++++++++++++++++++-------------------------
 1 file changed, 48 insertions(+), 63 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..e6bfac95c7 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2002,86 +2002,71 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
-    GQueue *list = g_queue_new();
-    guint pptt_start = table_data->len;
-    guint parent_offset;
-    guint length, i;
-    int uid = 0;
-    int socket;
+    CPUArchIdList *cpus = ms->possible_cpus;
+    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
+    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
+    uint32_t pptt_start = table_data->len;
+    int n;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
 
-    for (socket = 0; socket < ms->smp.sockets; socket++) {
-        g_queue_push_tail(list,
-            GUINT_TO_POINTER(table_data->len - pptt_start));
-        build_processor_hierarchy_node(
-            table_data,
-            /*
-             * Physical package - represents the boundary
-             * of a physical package
-             */
-            (1 << 0),
-            0, socket, NULL, 0);
-    }
-
-    if (mc->smp_props.clusters_supported) {
-        length = g_queue_get_length(list);
-        for (i = 0; i < length; i++) {
-            int cluster;
-
-            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    parent_offset, cluster, NULL, 0);
-            }
+    /*
+     * This works with the assumption that cpus[n].props.*_id has been
+     * sorted from top to down levels in mc->possible_cpu_arch_ids().
+     * Otherwise, the unexpected and duplicated containers will be
+     * created.
+     */
+    for (n = 0; n < cpus->len; n++) {
+        if (cpus->cpus[n].props.socket_id != socket_id) {
+            assert(cpus->cpus[n].props.socket_id > socket_id);
+            socket_id = cpus->cpus[n].props.socket_id;
+            cluster_id = -1;
+            core_id = -1;
+            socket_offset = table_data->len - pptt_start;
+            build_processor_hierarchy_node(table_data,
+                (1 << 0), /* Physical package */
+                0, socket_id, NULL, 0);
         }
-    }
 
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int core;
-
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    parent_offset, core, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* Node is a Leaf */
-                    parent_offset, uid++, NULL, 0);
+        if (mc->smp_props.clusters_supported) {
+            if (cpus->cpus[n].props.cluster_id != cluster_id) {
+                assert(cpus->cpus[n].props.cluster_id > cluster_id);
+                cluster_id = cpus->cpus[n].props.cluster_id;
+                core_id = -1;
+                cluster_offset = table_data->len - pptt_start;
+                build_processor_hierarchy_node(table_data,
+                    (0 << 0), /* Not a physical package */
+                    socket_offset, cluster_id, NULL, 0);
             }
+        } else {
+            cluster_offset = socket_offset;
         }
-    }
 
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int thread;
+        if (ms->smp.threads == 1) {
+            build_processor_hierarchy_node(table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 3),  /* Node is a Leaf */
+                cluster_offset, n, NULL, 0);
+        } else {
+            if (cpus->cpus[n].props.core_id != core_id) {
+                assert(cpus->cpus[n].props.core_id > core_id);
+                core_id = cpus->cpus[n].props.core_id;
+                core_offset = table_data->len - pptt_start;
+                build_processor_hierarchy_node(table_data,
+                    (0 << 0), /* Not a physical package */
+                    cluster_offset, core_id, NULL, 0);
+            }
 
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (thread = 0; thread < ms->smp.threads; thread++) {
-            build_processor_hierarchy_node(
-                table_data,
+            build_processor_hierarchy_node(table_data,
                 (1 << 1) | /* ACPI Processor ID valid */
                 (1 << 2) | /* Processor is a Thread */
                 (1 << 3),  /* Node is a Leaf */
-                parent_offset, uid++, NULL, 0);
+                core_offset, n, NULL, 0);
         }
     }
 
-    g_queue_free(list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.23.0

