Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp351294lfm;
        Sun, 16 May 2021 03:39:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqWVjX6HQt5mzXWQkBFmeu2jHwYh9KjOryFxRBxxZ19e1BNv1ziTmOguEn5onWgCzLOyqE
X-Received: by 2002:a05:6638:3708:: with SMTP id k8mr51373021jav.24.1621161591049;
        Sun, 16 May 2021 03:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161591; cv=none;
        d=google.com; s=arc-20160816;
        b=i7lIUK75vtC2T3rBGYrFb8RoPNRNnZZi00xtjwSERY+gzx0GmA5rSc3et1VAt4Nh75
         Mpdf2m1Mk6iWUBJB6xNx34oNnj7LmZj186yoC6RHYkGo4lBtmFWnBeA3tJALj1NUj2y5
         2t3FZLGJswNfAO9Ccf6LZP+MgKI+mEcW+xeBBgeYdByD3bPQP7Paku28zDrrX1rBlfAR
         d+3qDyWI3/Bo+RofcMuC5eAq6CJPsWeOx9fLgU0K4faDSd/JPw6IzKp+vX78lV/AEZMf
         0cVOK5gB7lNQcEtd5g22qXhvtoPMuLbuYntajXP1QvO/nphFWBSUpilRErsfKI17FWpk
         F6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Sf4M6FcSTIJuIKC8kRbcse2NY5lkaHuabc+e9POxFsg=;
        b=SHhwCrzHtOCYjdwwxJbbcW5kRWrJXEih3p6LDKphubhGhL48Q4km8p2BTSmk/2Ixk5
         se+fhQ+iHUnoedM8z/PbUzHKrCT8i4URgqqER8alf/OngMK1C2NiEXEzd/kpuZ65EvWR
         0EQMKPbbc7xXe3ET70HHYTtuejcp4c/FFsjc4JJFidsRCfpJkhXQowQQvC7/um4+FYm2
         ounchjjOOWgtfT8dSsYvsN75XCljv1Zj2jZmhn3c7io/RnTQ8lKdwF7tXvqHv6NCUsTz
         XuwYwmvVJ7nni7WM2ycq8BQTNztBsLDAkdvb2Rea/pI8HEPLBAbkx8pjaYeH+SF9zk1z
         QokA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si13549636jaa.53.2021.05.16.03.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liEBa-0007Xa-BL
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4h-0008Ul-Qp; Sun, 16 May 2021 06:32:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4b-0000mP-7V; Sun, 16 May 2021 06:32:43 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdmv0v76z16QXG;
 Sun, 16 May 2021 18:29:51 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:34 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:33 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 3/4] hw/arm/virt-acpi-build: Add cluster level to PPTT
 table
Date: Sun, 16 May 2021 18:32:27 +0800
Message-ID: <20210516103228.37792-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516103228.37792-1-wangyanan55@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BK7ylnn8tRvD

Add a Processor Hierarchy Node of cluster level between core level
and socket level to ARM PPTT table.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 45 ++++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b03d57745a..4d09b51bb0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -447,34 +447,43 @@ static void build_pptt(GArray *table_data, BIOSLinker *linker,
 
     for (socket = 0; socket < ms->smp.sockets; socket++) {
         uint32_t socket_offset = table_data->len - pptt_start;
-        int core;
+        int cluster;
 
         build_processor_hierarchy_node(
             table_data,
             (1 << 0), /* ACPI 6.2 - Physical package */
             0, socket, NULL, 0);
 
-        for (core = 0; core < ms->smp.cores; core++) {
-            uint32_t core_offset = table_data->len - pptt_start;
-            int thread;
-
-            if (ms->smp.threads <= 1) {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
-                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                    socket_offset, uid++, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(table_data, 0, socket_offset,
-                                               core, NULL, 0);
-
-                for (thread = 0; thread < ms->smp.threads; thread++) {
+        for (cluster = 0; cluster < vms->smp_clusters; cluster++) {
+            uint32_t cluster_offset = table_data->len - pptt_start;
+            int core;
+
+            build_processor_hierarchy_node(table_data, 0, socket_offset,
+                                           cluster, NULL, 0);
+
+            for (core = 0; core < ms->smp.cores; core++) {
+                uint32_t core_offset = table_data->len - pptt_start;
+                int thread;
+
+                if (ms->smp.threads <= 1) {
                     build_processor_hierarchy_node(
                         table_data,
                         (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
-                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
                         (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
-                        core_offset, uid++, NULL, 0);
+                        cluster_offset, uid++, NULL, 0);
+                } else {
+                    build_processor_hierarchy_node(table_data, 0,
+                                                   cluster_offset,
+                                                   core, NULL, 0);
+
+                    for (thread = 0; thread < ms->smp.threads; thread++) {
+                        build_processor_hierarchy_node(
+                            table_data,
+                            (1 << 1) | /* ACPI 6.2 - ACPI Processor ID valid */
+                            (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
+                            (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
+                            core_offset, uid++, NULL, 0);
+                    }
                 }
             }
         }
-- 
2.19.1

