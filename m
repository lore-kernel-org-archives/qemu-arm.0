Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4659794lfr;
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJLdEVgRgM7pJbSN6zJHSFkvpLObE5JsV6Kc5bp+eZrzP5/zNQYI4m3elIvitXp+y3FcIg
X-Received: by 2002:a67:eacf:: with SMTP id s15mr1134843vso.46.1618302747033;
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618302747; cv=none;
        d=google.com; s=arc-20160816;
        b=e44Y3IvPODThYRB+JrK1xC8u6HXD6uGCrMLkyI4plAWCY8KLWu/dq7h+HAC9pF+YXR
         SABuFnsnibHXisJbZbbQrheLfNLi/CQmD5DMyLGsdWUJ5wCQ5ANG3kE8vKCU2E23AgDM
         mNw5aanrCbxc6JX+oga8yYwtZ959QGpvWhlK/dqLNheyb26qIC8TX5W52XY6Kbu+9Eqt
         KgEejP/ihfNr4yLRFrLKkL8DgBBLrzrdp8uVaC0rvGE7wgQMyCvr7EC1bCWnNPks+zGK
         GkE1Ev9N3ORpYpT2r3svAT6XCQPVLc9WCRVUor6quivElLv4UjqjcKwbNQSAbQNPE91w
         FlmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=bRB60EnF1NT6WyiVHr5sl82zuH4DpC+/74HP5IqnhYI=;
        b=ezW8GoPCp9KFg2q2K96F7BgsH+G+lDcSzyVYeO9UsFd6oVZmIV30aEv9MMy/YansVW
         mkp8NpOMSLUrja/HtwpdDrMVPlfJSy0ZZKW56Yrh7s4kCLNnUSvWwTQaAd5yo4XYxw3O
         8Skl1RKooW5f3Kl6z7hO/TLhnFHB1YObf+EkH+hdGny8ozamK6sWZItNWcupiKdQGc0Z
         ANhTKf2fL7ByIdG1c5qqT6Fqp3gVZyl5d2FmpL22++KWrCvddNI1EywsNTDrw/0yO37P
         286Iys7xOpFk6q5sJvEUfZDd/nbFwocwJdx6wnhcZicEbFGT1X9npeHsf1cwRu5L10V8
         KPQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si4256675vsm.55.2021.04.13.01.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWETC-0008QH-6n
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESz-0008Pj-K6; Tue, 13 Apr 2021 04:32:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESw-0004tJ-MU; Tue, 13 Apr 2021 04:32:13 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKJgd1jVPz1BGYB;
 Tue, 13 Apr 2021 16:29:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:31:56 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 3/4] hw/arm/virt-acpi-build: Add cluster level for PPTT
 table
Date: Tue, 13 Apr 2021 16:31:46 +0800
Message-ID: <20210413083147.34236-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413083147.34236-1-wangyanan55@huawei.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, yangyicong@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oogWZ8CxIu5b

Add a Processor Hierarchy Node of cluster level between core level
and package level for ARM PPTT table.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 55 ++++++++++++++++++++++++----------------
 1 file changed, 33 insertions(+), 22 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 03fd812d5a..2b745711d1 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -443,6 +443,7 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int pptt_start = table_data->len;
     int uid = 0, cpus = 0, socket = 0;
     MachineState *ms = MACHINE(vms);
+    unsigned int smp_clusters = vms->smp_clusters;
     unsigned int smp_cores = ms->smp.cores;
     unsigned int smp_threads = ms->smp.threads;
 
@@ -450,42 +451,52 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
         uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
+        int cluster;
 
         build_processor_hierarchy_node(
             table_data, 1, /* Physical package */
             0, socket, /* No parent */
             NULL, 0);  /* No private resources */
 
-        for (core = 0; core < smp_cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
-            if (smp_threads <= 1) {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                    socket_offset, uid++, /* Parent is a Socket */
-                    NULL, 0);  /* No private resources */
-            } else {
-                build_processor_hierarchy_node(
-                    table_data, 0,
-                    socket_offset, core, /* Parent is a Socket */
-                    NULL, 0); /* No private resources */
-
-                for (thread = 0; thread < smp_threads; thread++) {
+        for (cluster = 0; cluster < smp_clusters; cluster++) {
+            uint32_t cluster_offset = table_data->len - pptt_start;
+            int core;
+
+            build_processor_hierarchy_node(
+                table_data, 0,
+                socket_offset, cluster, /* Parent is a Socket */
+                NULL, 0); /* No private resources */
+
+            for (core = 0; core < smp_cores; core++) {
+                uint32_t core_offset = table_data->len - pptt_start;
+                int thread;
+
+                if (smp_threads <= 1) {
                     build_processor_hierarchy_node(
                         table_data,
                         (1 << 1) | /* ACPI Processor ID valid */
-                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
                         (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                        core_offset, uid++, /* Parent is a Core */
+                        cluster_offset, uid++, /* Parent is a Cluster */
                         NULL, 0);  /* No private resources */
+                } else {
+                    build_processor_hierarchy_node(
+                        table_data, 0,
+                        cluster_offset, core, /* Parent is a Cluster */
+                        NULL, 0); /* No private resources */
+
+                    for (thread = 0; thread < smp_threads; thread++) {
+                        build_processor_hierarchy_node(
+                            table_data,
+                            (1 << 1) | /* ACPI Processor ID valid */
+                            (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                            (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                            core_offset, uid++, /* Parent is a Core */
+                            NULL, 0);  /* No private resources */
+                    }
                 }
             }
         }
-        cpus += smp_cores * smp_threads;
+        cpus += smp_clusters * smp_cores * smp_threads;
     }
 
     build_header(linker, table_data,
-- 
2.19.1

