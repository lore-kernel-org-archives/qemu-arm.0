Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5351267lfk;
        Sun, 21 Nov 2021 04:33:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxr+VKe7F7MXXbBKj7K81rpBkJuQNWERJ298BOvC4wFmdlDAqqvbb3dtEn3Mbn0olFEDUr
X-Received: by 2002:a67:cb92:: with SMTP id h18mr118496229vsl.7.1637498039666;
        Sun, 21 Nov 2021 04:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637498039; cv=none;
        d=google.com; s=arc-20160816;
        b=iWl+4rwLlPpY18m0tAUjQOiPd+W+kIRKgvI1Hm2NKYmz4T+AgY6Ijan8HBpesh4ZsM
         Kr+AeY/6hhqJmEi6MPWQCQ14hZa6jO4+qxcxyooZaN5I/L2nEl4A/i166rEc242d+RBP
         Dp1Nz9sHvb9GgaN6qtOAH0u0nkbR6pTBmwxJsUuq/tuoqBYSiYo6/u9mStQ5j8ExsXSh
         ERf91YqNMBLy23cZhwGt04XrMuVPtj71DQNKNHmFfjJn/WjjB0GdQBnR5oXXkwPj5rBo
         rUpsrp+w7l+EnRSxdBSgTLLaxX89PdEQj4mmj30Iifhx97HeTKgsbvoRCoKoY3V2YhLM
         HHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=FwkhvndTg31owIAVU/F5C5UCe7VnKP2xCeCj2IjpJbk=;
        b=ArcmDPuI0tFs9PBYc9rItmbpZFiWCx8HEHYSwzfDA1yw3v+xIpnZHDYPtseHNAflhG
         1bdGlcF8DIbHbT2DFGRIvNZCz9mY8LhRogyowKubix5g5UBUcuu5IOTopws58lCsgxmw
         D4YXhmnAKFK3HMYKPWCSU+Gl6dYfgjGZz0YrH6QX8PB0Z7RL5tWQjqruguHfO1hm52mJ
         RF2XvlXnlHgSkhiMUIOU8hdCZJIgA2f+EXDcxTSbSde7FbRWw5gs3S2tDD1q6EP6lBkz
         EgCtJV9VG5FtDMgi2sqzS4oIGFLi6byPac1HYnrAA6k5KKYicbsdeztqI5NUSchJa5BJ
         BKSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21si16502906vso.201.2021.11.21.04.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:33:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:44876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mom2h-00044X-3v
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:33:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluO-0003r3-Gt; Sun, 21 Nov 2021 07:25:24 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluJ-0005mN-57; Sun, 21 Nov 2021 07:25:24 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxqKx3pWyzZd1j;
 Sun, 21 Nov 2021 20:22:45 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:13 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 06/10] hw/acpi/aml-build: Improve scalability of PPTT
 generation
Date: Sun, 21 Nov 2021 20:24:58 +0800
Message-ID: <20211121122502.9844-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: sQlFOyANuYFl

Currently we generate a PPTT table of n-level processor hierarchy
with n-level loops in build_pptt(). It works fine as now there are
only three CPU topology parameters. But the code may become less
scalable with the processor hierarchy levels increasing.

This patch only improves the scalability of build_pptt by reducing
the loops, and intends to make no functional change.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df3..be3851be36 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
-    int pptt_start = table_data->len;
+    GQueue *list = g_queue_new();
+    guint pptt_start = table_data->len;
+    guint father_offset;
+    guint length, i;
     int uid = 0;
     int socket;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
@@ -2010,9 +2013,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
     acpi_table_begin(&table, table_data);
 
     for (socket = 0; socket < ms->smp.sockets; socket++) {
-        uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
-
+        g_queue_push_tail(list,
+            GUINT_TO_POINTER(table_data->len - pptt_start));
         build_processor_hierarchy_node(
             table_data,
             /*
@@ -2021,35 +2023,47 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
              */
             (1 << 0),
             0, socket, NULL, 0);
+    }
 
-        for (core = 0; core < ms->smp.cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int core;
 
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (core = 0; core < ms->smp.cores; core++) {
             if (ms->smp.threads > 1) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
                 build_processor_hierarchy_node(
                     table_data,
                     (0 << 0), /* not a physical package */
-                    socket_offset, core, NULL, 0);
-
-                for (thread = 0; thread < ms->smp.threads; thread++) {
-                    build_processor_hierarchy_node(
-                        table_data,
-                        (1 << 1) | /* ACPI Processor ID valid */
-                        (1 << 2) | /* Processor is a Thread */
-                        (1 << 3),  /* Node is a Leaf */
-                        core_offset, uid++, NULL, 0);
-                }
+                    father_offset, core, NULL, 0);
             } else {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
+                    father_offset, uid++, NULL, 0);
             }
         }
     }
 
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int thread;
+
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (thread = 0; thread < ms->smp.threads; thread++) {
+            build_processor_hierarchy_node(
+                table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 2) | /* Processor is a Thread */
+                (1 << 3),  /* Node is a Leaf */
+                father_offset, uid++, NULL, 0);
+        }
+    }
+
+    g_queue_free(list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.19.1

