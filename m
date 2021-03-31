Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp328135lfg;
        Wed, 31 Mar 2021 03:03:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXJ85JCxJ618HZbPRrBK/hlpxjY+AOPIyXaOn4TSM3YSnIy9UuezfooGzUvqw6d6OhfCBm
X-Received: by 2002:a6b:e20a:: with SMTP id z10mr1633757ioc.99.1617185013561;
        Wed, 31 Mar 2021 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617185013; cv=none;
        d=google.com; s=arc-20160816;
        b=x+dyULVCIQogknyCxdZ828XrlH3QMvVpaFYuyfkj+HWomvwDIn015JJBTNLi9DpW2h
         x0gi114wSxmVnMvpwrYP0U2Pv3dTItSMp+EnknK3v1fBNIsmMPYHQkrCumViuTWlfmsy
         BxcpkY/8mmCnD1ESDZSgCzRDkqDGa402wlnPFEaXSPSOmf1UTElEz9tEVjDn3moqYEE4
         D+GdQSaX91TYMel3ogIuK2gkXLLYTMkYXKuunGi3OKlRYd+h1CGrV4qZVaynbrmfAgJY
         IRy8fqB7GGTU1F+5+xllx+1ct5yxNe/gRB1JXbb2CbkPKXft78GzTvpYQszM2FGLb7up
         GpPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=O/MSzVeH1SLIXgsXkt5u0JGoKE6TLWEiGwub5jtCqOc=;
        b=kvK+3rAHqxpuLHzJ7hf9+52zobFUdKhbe8xEAKgM0eWOXs0gtR5V4lV+D4ZD70bZgJ
         BJNF0GKTQGIXIFym40M56ARlWCoSheiIrsudHIJSWRf0qYcJS4iPCB176fGXWdtBX1Ua
         Hx0zZV2cQE6Fxd7OlmHO9aT61Hg+IVYQNYL7uqrBtHP+sHsFUwDt8xCbiNoPwuCLrB0w
         ioNcu/JlsBO6KYn50uGonHemZV/Y5Xkb0REeIYZQYMsAkQnWqkNN74dS17bFHfi5Oz8I
         vJlXLw9SXrK8u0eL0GklGn6zvAsThi5l1khysYeDKgWsPHOvKiVp+WHX/Zciml2MIL37
         JVdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13si1463811jat.120.2021.03.31.03.03.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 03:03:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXhE-00037X-RB
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 06:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYL-0002kv-Jy; Wed, 31 Mar 2021 05:54:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY9-0002Xt-9P; Wed, 31 Mar 2021 05:54:21 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9M6F6wfLz1BFy5;
 Wed, 31 Mar 2021 17:51:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:48 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 2/6] hw/core/machine: Parse cluster cpu topology in
 smp_parse()
Date: Wed, 31 Mar 2021 17:53:39 +0800
Message-ID: <20210331095343.12172-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8vbRS77UlEiW

Function smp_parse() in hw/core/machine.c is a generic/default function
used for parsing the -smp command line. Since the new cluster parameter
has been added in struct CpuTopology, we should parse this new parameter
in the default function.

In smp_parse(), the computing logic of missing values prefers sockets over
cores over threads. And the value of clusters will be set as default 1 if
not explictly specified, so that it will not impact the parsing results of
machines that won't specify "clusters=" in -smp command line because they
just don't support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f438..dd77ad183d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -720,33 +720,38 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
     if (opts) {
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
-        /* compute missing values, prefer sockets over cores over threads */
+        /*
+         * Compute missing values, prefer sockets over cores
+         * over threads. And the value of clusters has been
+         * set as default 1 if not explicitly specified.
+         */
         if (cpus == 0 || sockets == 0) {
             cores = cores > 0 ? cores : 1;
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
                 sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * sockets;
+                cpus = sockets * clusters * cores * threads;
             } else {
                 ms->smp.max_cpus =
                         qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads);
+                sockets = ms->smp.max_cpus / (clusters * cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * threads);
+            cores = cpus / (sockets * clusters * threads);
             cores = cores > 0 ? cores : 1;
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
 
@@ -758,16 +763,17 @@ static void smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
+        if (sockets * clusters * cores * threads != ms->smp.max_cpus) {
             error_report("Invalid CPU topology: "
-                         "sockets (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads,
+                         "sockets (%u) * clusters (%u) * cores (%u) * "
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

