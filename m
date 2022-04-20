Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp3041497lfk;
        Wed, 20 Apr 2022 04:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyApzYG/tg8F/SF7b3rKFZ1+YXEBW/XTV/0erPgpZvj39hnyf/52jrcx9Jh/1RwzGM7XR+s
X-Received: by 2002:a05:622a:1349:b0:2f1:fd01:64cf with SMTP id w9-20020a05622a134900b002f1fd0164cfmr9637959qtk.127.1650452780663;
        Wed, 20 Apr 2022 04:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650452780; cv=none;
        d=google.com; s=arc-20160816;
        b=d8S2fO95HoRDeFZzkVea7kMspmjYkW/1AAbc4BgyVf2IDM/4cL0UDw0PgpgpJQPck9
         RxQp3KmMxDi5ENykcn1pG0yyIg58W3r0f/Oi4xqbAwB5nMtv2TM278kQ6A2YLtUeYFy7
         R0XUsj7POjm2P0MeKQWytgq7YbWanAs7xvK7pKB0t/fJCfJLVKzFEyPqOYKSmCYduJUv
         z3veAC9MkuMwhqcxrZyuEfn7Oka89T0LVD+uber2posJZAEjeVf8oZkViCRFQjcPNTB7
         CoRtoAGemXvPFkYI53ga9U3gBodHuhl9fbUi5O5Yb075lp7YX06URlA6j7DZcAYGcWsz
         60Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YBDf492ElLhkh/EEmJKRz3bQzpMcRsw7lDRtLxNhPJ8=;
        b=dlRqrkiCkQzz2VOpIy/e9t/FRdFKXLQ4BWNXpc+h6u4Ul9bEeLOooEUCTvQAm5KWpN
         QN7V5YrAsqazHtbAGnbctk2ZVYUBCzTlNgxqE0jX8xK+nnTnTnrwQ6DjUvQZWggCczrM
         CU9R7KpmHw+ODNOEeNw5tmBBreEy6RNOywQ0PG4buygwHf+qe0SaEbTYiyzUJ1PbQ0R4
         U8+drVVnUF+u04azQlD33YKG314FsI50rHL/4xBsHZT4OznvWwSOGSF+Cus0HBej2ekh
         VTz1hKb/G+gutZDImWzsr06jBYCEV0yniPButZAbWP08bRZE4zRPEMi1WPxayPAJGFz/
         hp8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RoCV516T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2-20020a05620a448200b0067e4be23a96si476110qkp.731.2022.04.20.04.06.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Apr 2022 04:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RoCV516T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh8A7-0004or-TK
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 07:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wp-0005n5-9G
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh7wm-0001Nc-5b
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 06:52:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650451951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBDf492ElLhkh/EEmJKRz3bQzpMcRsw7lDRtLxNhPJ8=;
 b=RoCV516TMglfn6cnueCYpNKSryK7XeEj0fZOOPEAJsGN79YOG02UFC1eyyzEXCyzcSpgmK
 rlgPV9Dr9hNkrEjWmUCqLB6b4SfKPuVVVgBbZqr+vW5J3xwzDb2nfDvOiM4rqRH1MMtsIR
 6Jw2Kz3rmrMr6J2z/CG9w1O/hitCA/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-GTvjL7I7Ow232l3ZGXFn5Q-1; Wed, 20 Apr 2022 06:52:27 -0400
X-MC-Unique: GTvjL7I7Ow232l3ZGXFn5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D703F802C16;
 Wed, 20 Apr 2022 10:52:26 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AAC840470C2;
 Wed, 20 Apr 2022 10:52:17 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v7 4/4] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Wed, 20 Apr 2022 18:49:09 +0800
Message-Id: <20220420104909.233058-5-gshan@redhat.com>
In-Reply-To: <20220420104909.233058-1-gshan@redhat.com>
References: <20220420104909.233058-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 berrange@redhat.com, shan.gavin@gmail.com, peter.maydell@linaro.org,
 Jonathan.Cameron@Huawei.com, zhenyzha@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, wangyanan55@huawei.com,
 marcel.apfelbaum@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, drjones@redhat.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7OX+U0qTs/+a

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This reworks build_pptt() to avoid by reusing the existing IDs in
ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 109 +++++++++++++++++++-------------------------
 1 file changed, 47 insertions(+), 62 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..73f4e69c29 100644
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
+    /*
+     * This works with the assumption that cpus[n].props.*_id has been
+     * sorted from top to down levels in mc->possible_cpu_arch_ids().
+     * Otherwise, the unexpected and duplicate containers will be
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
-        int core;
-
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
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

