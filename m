Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1429150lfk;
        Sun, 17 Apr 2022 19:11:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeqRHBwDdW2l7l1HPJoB+62k7z1QhXM1w4HsCAGIz6bjt20DC9DTDIcbG9mSvLdALQNB2v
X-Received: by 2002:a05:622a:1813:b0:2f1:fb18:3ea3 with SMTP id t19-20020a05622a181300b002f1fb183ea3mr2810900qtc.108.1650247905630;
        Sun, 17 Apr 2022 19:11:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650247905; cv=none;
        d=google.com; s=arc-20160816;
        b=rRXDzt2a9tkbHKcO7nPR7WudCNttpiW7uPqqiR1iDxrAb2zSZ9CJNPYWCgb6QGKPND
         GMJfoXhu6U8xkScyA3rJ4Z5gr6Y63ADmtntqamVLOSqDnbVDbclkEsz7zTunJGTW4iZ5
         32J7rKx0IhUHKuEHdlGqfnDRWE4wXG077patOoqlw7fj5wtwCSuWhCPX76XjU8MsGBOU
         1y49cVN+TWuJ9WapT6qWnhHCgJxP/LucD4ZwM+6TNETKNWmByqI4wfHUZrZjgFAJHyeE
         Gkto4o8d1DN9Dpfp1K616sUfOHiv7d/71WNsZHfCXVSNaFO2PDBBsRzEnWCpPeE6c9wg
         0XjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/Spvtr67Ky8pvQzdT7WFb/iOb0ALE3RXhJyn/vk8rwI=;
        b=pL0+X00JSUG6hDEdPryruPHpENd/Gs0S1eamAgnxFM8TPg8cnMkBmpNY4TWcoj4ZOi
         qzgL55yIO33lPeDGdgbYNg2N1D117OEGxGgTBoVE+kaemm4bar4BYXDqS6QJB1o8bbqs
         A7R/Px/WbGtdDAPyykyp4kwm3G+pa0qDpUnVSZN0h3WZ3WuMiRioJE83kwnmoshOoP67
         rfLZ0kY9JE0777VnU6CeaT9+x6g8Q+yK4VN74Gnm7OFCMqKaJi6aIKHF/ZVKZI0dEpjY
         AiaQSxfxgg2z6bfnuyDIqXhXh9AJQLy8+er/Umic4xhxLwe56ePuiVKO/ybTfvJc3afj
         +bLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QsBkFbas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020ac84115000000b002ebc910cfa6si2540696qtl.260.2022.04.17.19.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 19:11:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QsBkFbas;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ngGrh-0004nb-55
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 22:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGrV-0004if-IU
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 22:11:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ngGrT-00015c-Og
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 22:11:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650247891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Spvtr67Ky8pvQzdT7WFb/iOb0ALE3RXhJyn/vk8rwI=;
 b=QsBkFbas+uczEnpNa6M83JQCx9LznS6W/MFUcWoFgeMyjlaQqpYl+LHVDidnuqnrQV35p9
 wt2ajLSXXSp1YB28kVj3BzlpizmaeN9BjwQHugT27sDWRhecDF11vkx9krdtL3tjy5VQPf
 u0i/1eCQ1f1nBs59vm4EEi8LghQvyP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-40t5SJVwMJyj8mxmRdFjoA-1; Sun, 17 Apr 2022 22:11:28 -0400
X-MC-Unique: 40t5SJVwMJyj8mxmRdFjoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A29685A5BC;
 Mon, 18 Apr 2022 02:11:27 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 590F41121333;
 Mon, 18 Apr 2022 02:11:19 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v6 4/4] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Mon, 18 Apr 2022 10:09:20 +0800
Message-Id: <20220418020920.144263-5-gshan@redhat.com>
In-Reply-To: <20220418020920.144263-1-gshan@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, drjones@redhat.com,
 shan.gavin@gmail.com, mst@redhat.com, thuth@redhat.com, armbru@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 wangyanan55@huawei.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 Jonathan.Cameron@Huawei.com, ani@anisinha.ca, imammedo@redhat.com,
 lvivier@redhat.com, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GkzGoqEfXT8h

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This reworks build_pptt() to avoid by reusing the existing one in
ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 105 ++++++++++++++++++--------------------------
 1 file changed, 43 insertions(+), 62 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..2bd062a52b 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2002,86 +2002,67 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
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
+    /*
+     * This works with the assumption that cpus[n].props.*_id has been
+     * sorted from top to down levels in mc->possible_cpu_arch_ids().
+     * Otherwise, the unexpected and duplicate containers will be created.
+     */
+    for (n = 0; n < cpus->len; n++) {
+        if (cpus->cpus[n].props.socket_id != socket_id) {
+            socket_id = cpus->cpus[n].props.socket_id;
+            cluster_id = -1;
+            core_id = -1;
+            socket_offset = table_data->len - pptt_start;
+            build_processor_hierarchy_node(table_data,
+                (1 << 0), /* Physical package */
+                0, socket_id, NULL, 0);
+        }
 
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
+        if (mc->smp_props.clusters_supported) {
+            if (cpus->cpus[n].props.cluster_id != cluster_id) {
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
-        int core;
-
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
+        if (ms->smp.threads <= 1) {
+            build_processor_hierarchy_node(table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 3),  /* Node is a Leaf */
+                cluster_offset, n, NULL, 0);
+        } else {
+            if (cpus->cpus[n].props.core_id != core_id) {
+                core_id = cpus->cpus[n].props.core_id;
+                core_offset = table_data->len - pptt_start;
+                build_processor_hierarchy_node(table_data,
                     (0 << 0), /* not a physical package */
-                    parent_offset, core, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* Node is a Leaf */
-                    parent_offset, uid++, NULL, 0);
+                    cluster_offset, core_id, NULL, 0);
             }
-        }
-    }
-
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int thread;
 
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

