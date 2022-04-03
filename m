Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp2222035lfb;
        Sun, 3 Apr 2022 08:04:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzThO3paMOL9CKmxvDPkLXHecQKlJcF4SYhnU4DQUJ3YQHsj/Om5zqPQLgcPJvsK/xiEFV/
X-Received: by 2002:a05:620a:5e:b0:67d:323c:a1fc with SMTP id t30-20020a05620a005e00b0067d323ca1fcmr11535495qkt.675.1648998271998;
        Sun, 03 Apr 2022 08:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648998271; cv=none;
        d=google.com; s=arc-20160816;
        b=rSZ1+xoZFPWLPiPPkcQmAVnK5X1xE17wSxl1IB+v/2llySX/f814J8t9HtbhJF9tHK
         81Y4mVS8jbtfa/0xXRyqldEALkvdWRhKMeLOzzGVsM9pMdK7uvlPPRo97XYtDAKqYmJb
         /d13muUsWguEnDJtxOooIay7sqk0o/maZ4VEd70yQlH+oDKIZQkVVeKvKEqHubGc2uFW
         3zER9qLDqVFkWZs301lVBFQlwOyIiE3TWh+/bgbkP6F96pP/VTFgEDDbqm7JzUZkw1aP
         qI3Enw6JX2uCgHP046E4r17rKzTwgCjleGgHkts/gZUKt062UrEHwGxgz7s9irdHwiAU
         C16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BP1UZmEJRdG0qO600zS0e099WtSs+NeUswO3w+7HbJU=;
        b=XZDXEL4YPph221yiY2UW24GjS3/NCtYKMjvfxqSdOT4o2FNAvu8qR4Vl4OzfdJs9Fl
         XrObD78uBXd6g+Z7rzOwimuAomFpM9SvS2ww1aUSD0208OvMhSlGImr66nULz3uBbpas
         d37jnMnlCNHUB+iRQyjh9HKlh9RGI12egA+DwZ3uZybWohrkhXEp3aDEtzbSF4iQqWn1
         qqMuk5sEpL9jB6yCKKjox4hJb1hKwUQK1hvqL5o43oUZR19v6CD8rqSS3zIx8yt/kPJo
         /u1O7TLcV7fJARclmCZuDU/8bmocMrBa4qldjCN90QTzaTXS/XvPTKXgfQHFQcC+wr+h
         Tn4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gk221K9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020ac87491000000b002e1fbf3c0d3si2224041qtq.708.2022.04.03.08.04.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Apr 2022 08:04:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Gk221K9J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nb1mJ-0004Ul-HJ
	for alex.bennee@linaro.org; Sun, 03 Apr 2022 11:04:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iW-0005LX-6A
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nb1iU-0003J5-Es
 for qemu-arm@nongnu.org; Sun, 03 Apr 2022 11:00:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648998032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BP1UZmEJRdG0qO600zS0e099WtSs+NeUswO3w+7HbJU=;
 b=Gk221K9J/MKVpzKrHinElBBB7hLfIMV1mGuB9JjxuRfV91xToYUbRpa9XB7SuN902X3FT4
 aSQizz07o2IgKW3u2XPwRbW7/vozbkZhLfakLAnYdoSI3poPO9MPodiDGJpesrK+p2tJQJ
 DAd1bfP2RUe3N274sPgge7QWTGQgcDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-q7Y7FAZtMgalS3KotEvHKg-1; Sun, 03 Apr 2022 11:00:29 -0400
X-MC-Unique: q7Y7FAZtMgalS3KotEvHKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19F2C1C04B4D;
 Sun,  3 Apr 2022 15:00:29 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-82.pek2.redhat.com [10.72.12.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E26DC15E73;
 Sun,  3 Apr 2022 15:00:24 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to build
 PPTT table
Date: Sun,  3 Apr 2022 22:59:53 +0800
Message-Id: <20220403145953.10522-5-gshan@redhat.com>
In-Reply-To: <20220403145953.10522-1-gshan@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k8u6L2hDWxKx

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This reworks build_pptt() to avoid by reusing the existing one in
ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
 1 file changed, 38 insertions(+), 62 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..4b0f9df3e3 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
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
+    uint32_t socket_offset, cluster_offset, core_offset;
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

