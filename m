Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1604508lfb;
        Fri, 7 Jan 2022 00:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4FFKocvsiGweEckRXN0x8Fp4rLbEQ3Or/4b77k0s3C62iKzLjEOY6uFVZUhf35lrWNMTU
X-Received: by 2002:a37:27c5:: with SMTP id n188mr43431806qkn.715.1641544378520;
        Fri, 07 Jan 2022 00:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544378; cv=none;
        d=google.com; s=arc-20160816;
        b=Lwt2NDJ2jGcd2qgzr5IbWXlUvLRy54fe4TT89GB38a82OkFHsY6e7fLezTqgLWruqB
         0MNMkl14WK01cLBrQKuAku2R7DKMU17xRPMju6QCWFamlfk/hWB8oBqB1AszlaPfRPtq
         fsGBZJF1OHQ8FRoe1RTRaVfOQ3hKaCqmtIDorqzpViieXERRJT3lcvWwswR2rV3UdXOb
         LtYeoNyf8R6cmvbeE/8qbU0vjvYqHkcuiWBFHe1/LTNi7UTs2JmG88SGDgGJSbnZ02O6
         eCEYTNWfJq/VHSE646wfb6tLHIX3lRu9FPNpsCbSawgR2d6nrLp4S/8N29ps9pMcC4M9
         glaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=XIU4nfqJMNmvOtSiiIRTeTsf9dWgqArd4IsExcT764s=;
        b=VLIObnIv2bt3iQCugyuoA/WgYoFjYaDa0P3jicEM3qJhu3SeHVLr1XV5pqCrmSJ09j
         Z9borT1VFHHnuxk8yuxyAbQr6j+Q95SIdnElgXHk9dI+c2PCCvGYx+ryWksQy4TeTNFt
         YX/VQ/qHbj1ynEKdkzgrHjiqaKg8+MdHhvSyMmjEU60cAnxcwB1DAW+01k6DdTRo3/tB
         gOux4GHWoFaW8rYzWHRz2m5TE3x2PxX4ppE3TjhdDu6584CquNtkryl/M3H5QFxHJ5mT
         NG8t7j+3zdYjxOI9uWeTK/FVaQ0NIyzKu+Vsm0kyFQbkqhRpfHNYznegjfpezRtChdP7
         bfmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si1751352qta.20.2022.01.07.00.32.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:32:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kgE-0000Oh-0E
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg3-0000NK-75; Fri, 07 Jan 2022 03:32:47 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg0-0001f8-8o; Fri, 07 Jan 2022 03:32:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JVbxh6YgDzbbjT;
 Fri,  7 Jan 2022 16:30:00 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:37 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 3/6] hw/acpi/aml-build: Improve scalability of PPTT
 generation
Date: Fri, 7 Jan 2022 16:32:29 +0800
Message-ID: <20220107083232.16256-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: c+cbMwLTZvHH

Use g_queue APIs to reduce the nested loops and code indentation
with the processor hierarchy levels increasing. Consenquently,
it's more scalable to add new topology level to build_pptt.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/acpi/aml-build.c | 50 +++++++++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df3..6aaedca2e5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,7 +2001,10 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
-    int pptt_start = table_data->len;
+    GQueue *list = g_queue_new();
+    guint pptt_start = table_data->len;
+    guint parent_offset;
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
 
+        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
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
+                    parent_offset, core, NULL, 0);
             } else {
                 build_processor_hierarchy_node(
                     table_data,
                     (1 << 1) | /* ACPI Processor ID valid */
                     (1 << 3),  /* Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
+                    parent_offset, uid++, NULL, 0);
             }
         }
     }
 
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int thread;
+
+        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (thread = 0; thread < ms->smp.threads; thread++) {
+            build_processor_hierarchy_node(
+                table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 2) | /* Processor is a Thread */
+                (1 << 3),  /* Node is a Leaf */
+                parent_offset, uid++, NULL, 0);
+        }
+    }
+
+    g_queue_free(list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.27.0

