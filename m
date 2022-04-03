Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2107099lfb;
        Sun, 3 Apr 2022 04:02:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjoXj5NjwB0+aOATxnPTZl8QhnjVRM9r0SvUiuh3a5KCcR5XcX3afc2FJxwTeFNumYDvrT
X-Received: by 2002:a0c:d688:0:b0:42c:3cb0:3923 with SMTP id k8-20020a0cd688000000b0042c3cb03923mr13443768qvi.69.1648983728999;
        Sun, 03 Apr 2022 04:02:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648983728; cv=none;
        d=google.com; s=arc-20160816;
        b=iQybrkn0kaiv3S2rHbvoGKQFBVRZhr0FiI8krmuzenyAp9TM1QBmvM/YiwijVv2gJv
         KhoUWsW2nl59u5ZuI+WzB1ytdRZVuO+z7dqZg14I0eJMkj/oOS+P8/Lq56TgN/0AbRpQ
         WXRG/WKTTRpGXD85tx4r2Qu4bUo3O5+UDtKfAuj18f/8m1nOkTa4ro3hnGoFuxbil80r
         EAKoAWiRwn/O0dJcbQDQZ9YnG23nmI3Nzey2c2J9Ccn2fS+cwyM5Kf7fZhbwBx2uxF+m
         lH1UBoLW1icp5buLoxm5E86hHnasT4yK3pfb5OADvrfK5sZVX+l1N3lH21mvbE34f7/E
         btsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8G8Nl6MZf3VVH9ZCvbUbaF5oTOPujTdMGvRxFBthl+A=;
        b=1ISpmOPfRxWqZ4UcGz5zWXj+YkBz+g5YnV+JvCecZP5BlD3AVOEO0pIzhK/KRmuvUj
         SQy5EeG9/vbGgZj9V5yK256QKfwV6AtpVUxAr5OsmOOgCvAXD7CnLoSqmGf3LvfOVfUj
         iERXvhK5gqu5gpDQoal6U7NNZJg5BUZH+ozCiMOum5Lr4HIaBiqiGlv0shMymAVBfGxw
         Kju9gjVwW6aeiQncUX3K/1ls1qF6dajT91JjT0I5uMtPodEkRAAFbVhEhLLaCGs34GJv
         82vowZu+DpY72TnIWFuUmLA/+L+1YdQCozGomcY3xpbLttlr+Q0rRLVsNIisiuSWmHMd
         MIPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyQM3gFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r30-20020a0cb29e000000b00440e46a7ca2si2294474qve.320.2022.04.03.04.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 04:02:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iyQM3gFw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1naxzk-0005Zo-FD
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 07:02:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxyu-0004ml-8F
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1naxys-0001WP-Em
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 07:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8G8Nl6MZf3VVH9ZCvbUbaF5oTOPujTdMGvRxFBthl+A=;
 b=iyQM3gFwl705uDFDDKeDcbQsGVvgKT8sD5l1P0N4HqLuYiNjSDFxZvSbm+254v/lxvbm0y
 MfCoTmKII/+18/B8f6ZZ9Ke/l14yTCSj5coCstUFeSEBQkwlLPTQTm0cAbKujRMvzxtQxW
 k1Aj4Q+5E1j+gmoLr4HtFh5RVFWvv6A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-1SnMN7ZpN2K-9h-T7AWR2w-1; Sun, 03 Apr 2022 07:01:12 -0400
X-MC-Unique: 1SnMN7ZpN2K-9h-T7AWR2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68EE9801585;
 Sun,  3 Apr 2022 11:01:12 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDD3B40D02E1;
 Sun,  3 Apr 2022 11:01:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v4 3/3] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Sun,  3 Apr 2022 19:00:36 +0800
Message-Id: <20220403110036.5531-4-gshan@redhat.com>
In-Reply-To: <20220403110036.5531-1-gshan@redhat.com>
References: <20220403110036.5531-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3IF87nrcSdgS

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This avoids to re-calculate the CPU topology by reusing the existing
one in ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 95 +++++++++++++++++++++++++++++++++------------
 1 file changed, 71 insertions(+), 24 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..8f02d77375 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2002,18 +2002,27 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
+    CPUArchIdList *cpus = ms->possible_cpus;
+    GQueue *socket_list = g_queue_new();
+    GQueue *cluster_list = g_queue_new();
+    GQueue *core_list = g_queue_new();
     GQueue *list = g_queue_new();
     guint pptt_start = table_data->len;
     guint parent_offset;
     guint length, i;
-    int uid = 0;
-    int socket;
+    int n, socket_id, cluster_id, core_id;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
 
-    for (socket = 0; socket < ms->smp.sockets; socket++) {
+    for (n = 0; n < cpus->len; n++) {
+        socket_id = cpus->cpus[n].props.socket_id;
+        if (g_queue_find(socket_list, GUINT_TO_POINTER(socket_id))) {
+            continue;
+        }
+
+        g_queue_push_tail(socket_list, GUINT_TO_POINTER(socket_id));
         g_queue_push_tail(list,
             GUINT_TO_POINTER(table_data->len - pptt_start));
         build_processor_hierarchy_node(
@@ -2023,65 +2032,103 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
              * of a physical package
              */
             (1 << 0),
-            0, socket, NULL, 0);
+            0, socket_id, NULL, 0);
     }
 
     if (mc->smp_props.clusters_supported) {
         length = g_queue_get_length(list);
         for (i = 0; i < length; i++) {
-            int cluster;
-
             parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
+
+            for (n = 0; n < cpus->len; n++) {
+                if (cpus->cpus[n].props.socket_id != socket_id) {
+                    continue;
+                }
+
+                cluster_id = cpus->cpus[n].props.cluster_id;
+                if (g_queue_find(cluster_list, GUINT_TO_POINTER(cluster_id))) {
+                    continue;
+                }
+
+                g_queue_push_tail(cluster_list, GUINT_TO_POINTER(cluster_id));
                 g_queue_push_tail(list,
                     GUINT_TO_POINTER(table_data->len - pptt_start));
                 build_processor_hierarchy_node(
                     table_data,
                     (0 << 0), /* not a physical package */
-                    parent_offset, cluster, NULL, 0);
+                    parent_offset, cluster_id, NULL, 0);
             }
         }
     }
 
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
-        int core;
-
         parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    parent_offset, core, NULL, 0);
-            } else {
+        if (!mc->smp_props.clusters_supported) {
+            socket_id = GPOINTER_TO_UINT(g_queue_pop_head(socket_list));
+        } else {
+            cluster_id = GPOINTER_TO_UINT(g_queue_pop_head(cluster_list));
+        }
+
+        for (n = 0; n < cpus->len; n++) {
+            if (!mc->smp_props.clusters_supported &&
+                cpus->cpus[n].props.socket_id != socket_id) {
+                continue;
+            }
+
+            if (mc->smp_props.clusters_supported &&
+                cpus->cpus[n].props.cluster_id != cluster_id) {
+                continue;
+            }
+
+            if (ms->smp.threads <= 1) {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    parent_offset, uid++, NULL, 0);
+                    parent_offset, n, NULL, 0);
+                continue;
+            }
+
+            core_id = cpus->cpus[n].props.core_id;
+            if (g_queue_find(core_list, GUINT_TO_POINTER(core_id))) {
+                continue;
             }
+
+            g_queue_push_tail(core_list, GUINT_TO_POINTER(core_id));
+            g_queue_push_tail(list,
+                GUINT_TO_POINTER(table_data->len - pptt_start));
+            build_processor_hierarchy_node(
+                table_data,
+                (0 << 0), /* not a physical package */
+                parent_offset, core_id, NULL, 0);
         }
     }
 
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
-        int thread;
-
         parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (thread = 0; thread < ms->smp.threads; thread++) {
+        core_id = GPOINTER_TO_UINT(g_queue_pop_head(core_list));
+
+        for (n = 0; n < cpus->len; n++) {
+            if (cpus->cpus[n].props.core_id != core_id) {
+                continue;
+            }
+
             build_processor_hierarchy_node(
                 table_data,
                 (1 << 1) | /* ACPI Processor ID valid */
                 (1 << 2) | /* Processor is a Thread */
                 (1 << 3),  /* Node is a Leaf */
-                parent_offset, uid++, NULL, 0);
+                parent_offset, n, NULL, 0);
         }
     }
 
     g_queue_free(list);
+    g_queue_free(core_list);
+    g_queue_free(cluster_list);
+    g_queue_free(socket_list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.23.0

