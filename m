Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp322777lfg;
        Wed, 31 Mar 2021 02:55:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJGQ3z69Y5G9hyMuhLr3Q8xz+izc5eeko1eInnZTSoaBnzPMl6AMHnczDuN8PEsFzLBqE7
X-Received: by 2002:a25:c68d:: with SMTP id k135mr2947895ybf.479.1617184503470;
        Wed, 31 Mar 2021 02:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617184503; cv=none;
        d=google.com; s=arc-20160816;
        b=ARtVNQ5SY21gXvgzB5eN40ivNHsJxRcVhrJnNJi8h7q6JxnOc1VzrwRo6wCFmmSVpo
         Nnqd6SStWJfCE9De1lFXC8eR8Hy0K2WANtpVbh1TwLGdZwFGjk5iCCg7F3i3kCt++EQG
         RUuv635oFPdZ+wOxSA67GkMMh8Tj0EoxL77D4yv43Y8eUHvpRlIEzv7NnBvYNz5IkX4k
         BkV/bCjdmpbYlEm75Z0WKBRlgMV6+YLAdG7iyTJnVch6FRef/pGXwuokkkD5SdwpShfL
         /JZT75shskbMlLMstjW8+2nQKDxQdFiNNmW+pac49c8za0D9snYUrpe/gz+uINVZyEvQ
         Mk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Ox3XmUot3xM8soF4nbj4ZVXUEgmy4Z3fpFG/7oz9ChM=;
        b=JFac3QEyc5od/zxIU10VsxLDL3A46WNYRiZIkq2ceWA8Gb1FBvdt3o7x+bsWY5WS7u
         SvkIxT523z6yORs2Yey/Idm33KmLX5YimCiBNl5BhLfUFcvfVDWRCp6MmZrNjKUr8G6p
         S1wRm/+9Z4EkKEBxV3XSAlFYTvQBzXe2Gy80cCeKwgSwWiATSOk0dNJDlgqdorTJQ/0f
         sjgHubXRYtmEQ9zPRTvE+0ZcQ/bkTko2F2trYhqczIY5t98f1BhPLeR4yX9hvxB3m7Yg
         YMpJAhafSKtXSJD27rN/hYhY5btMITzxurqKafEVdFh2MOyxZy8DZ6APyQeuAzfN9dBP
         Df9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y125si1751320yby.486.2021.03.31.02.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 02:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXZ0-0003Ef-R4
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 05:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYL-0002ku-In; Wed, 31 Mar 2021 05:54:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY5-0002av-Ci; Wed, 31 Mar 2021 05:54:18 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9M6p0JsbzlWlP;
 Wed, 31 Mar 2021 17:52:18 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:49 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 3/6] hw/arm/virt: Parse cluster cpu topology for ARM
 machines
Date: Wed, 31 Mar 2021 17:53:40 +0800
Message-ID: <20210331095343.12172-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bwErcWzUPWu4

There is a separate function virt_smp_parse() in hw/virt/arm.c used
to parse cpu topology for the ARM machines. And there are some ARM
implementations that have the concept of cluster, for example, ARM64
server chip Kunpeng 920 has 6 or 8 clusters in each NUMA node and each
cluster has 4 cores. All clusters share L3 cache data while the cores
within each cluster share L2 cache. So parse cluster cpu topology for
ARM machines, then guest kernel will take advantages of it for better
scheduling performance.

In virt_smp_parse(), the computing logic of missing values prefers
cores over sockets over threads. And the value of clusters will be
set as default 1 if not explictly specified, so that it will not
impact the parsing results of machines that won't specify "clusters="
in -smp command line because they just don't support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 911ad7d3aa..c9ad76ff64 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2608,35 +2608,37 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
     if (opts) {
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
         /*
-         * Compute missing values; prefer cores over sockets and
-         * sockets over threads.
+         * Compute missing values, prefer cores over sockets
+         * and sockets over threads. The value of clusters has
+         * been be set as default 1 if not explicitly specified.
          */
         if (cpus == 0 || cores == 0) {
             sockets = sockets > 0 ? sockets : 1;
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
                 cores = cores > 0 ? cores : 1;
-                cpus = cores * threads * sockets;
+                cpus = sockets * clusters * cores * threads;
             } else {
                 ms->smp.max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
-                cores = ms->smp.max_cpus / (sockets * threads);
+                cores = ms->smp.max_cpus / (sockets * clusters * threads);
             }
         } else if (sockets == 0) {
             threads = threads > 0 ? threads : 1;
-            sockets = cpus / (cores * threads);
+            sockets = cpus / (clusters * cores * threads);
             sockets = sockets > 0 ? sockets : 1;
         } else if (threads == 0) {
-            threads = cpus / (cores * sockets);
+            threads = cpus / (sockets * clusters * cores);
             threads = threads > 0 ? threads : 1;
-        } else if (sockets * cores * threads < cpus) {
+        } else if (sockets * clusters * cores * threads < cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, cores, threads, cpus);
+                         "sockets (%u) * clusters (%u) * cores (%u) * "
+                         "threads (%u) < smp_cpus (%u)",
+                         sockets, clusters, cores, threads, cpus);
             exit(1);
         }
 
@@ -2647,16 +2649,17 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
+        if (sockets * clusters * cores * threads != ms->smp.max_cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u)"
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads,
+                         "sockets (%u) * clusters(%u) * cores (%u) * "
+                         "threads (%u) != maxcpus (%u)",
+                         sockets, clusters, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
 
         ms->smp.cpus = cpus;
+        ms->smp.clusters = clusters;
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
-- 
2.19.1

