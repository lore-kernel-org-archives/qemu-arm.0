Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6325933lfb;
        Tue, 28 Dec 2021 01:23:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw42tr9eCSAqnRamBhnVmVXSHyF5/BWd2WlBHLhSlk2qMF0yAkr2aygGxfp0VTBiDmGvnMa
X-Received: by 2002:a05:6902:70d:: with SMTP id k13mr25454073ybt.14.1640683397442;
        Tue, 28 Dec 2021 01:23:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683397; cv=none;
        d=google.com; s=arc-20160816;
        b=lDKeJ9dN30Ba64AWb1kd1EH9GCo8NnMhq+smOw+aZnmR4Ql/UrHuQ0TgVCNnhIVQX9
         v72WQUCsjofqcrK/yF9Btc9Kk5QSYCZPJhO6voxxpgJbSgwr/RaMwQmLG/wjcZa7x44i
         9jl7pLEeCbEhd8YZnOn3xJbZKMoMUwWjE2vvc/i5LWDHhJ09D2vUIDB8CVRZyXMQyzcx
         aeSE9J0woiX9vmKNWS+c/rflRrx1DkA0dI/MEmJbmZ1coe0Fethk+LJxd4phJDgtY5Db
         nsHDgAyJXw3sPurzADxFmIRjniFkzA61h+Evw+ahAqyWaNEpzIiyBdNuZDeTbJue/8zW
         j86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=/IcxkQYxQN9e4dBrx/nuNdA7c0gO0/wt4kATc9QrFuw=;
        b=bPErCc338e+yd4Z+VgKStniYSFDHvJl285IVV6UXYhqltBRYshqlVX0K6F9texyWp3
         gkDgEnfyJpUjex8P69A8Kir5y/IdPQ8oEPhzCSA5TT/PJIgR3O3FYLhxivvwjgV5/9Vg
         4eH0Zxq9djs70qnalOgq/HJWJEF/UAXkTPfJ38AbyRdmqqWIz+WDI0cDqNkFIy4Clmmc
         DMlEa5RPR9DGMsr/V7G33aCebDXpALbQLT7ugfmXqeo2hzKsRDsy18KW/kl9O/jYHzDx
         tO2gB01uzXCS2nXU3yv10hP8mEVbE+8BRCxpRuYAdPLSeN/GOXcCkElCovqvsMaEgWle
         NYVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si18141472ybu.541.2021.12.28.01.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:23:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28hQ-0008TV-S9
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:23:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h2-0007bI-23; Tue, 28 Dec 2021 04:22:52 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28gy-000792-84; Tue, 28 Dec 2021 04:22:51 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNTZ458LFz9rvY;
 Tue, 28 Dec 2021 17:21:48 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:43 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 03/14] hw/core/machine: Wrap target specific parameters
 together
Date: Tue, 28 Dec 2021 17:22:10 +0800
Message-ID: <20211228092221.21068-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
X-TUID: eR0o7oaJAtoV

Wrap the CPU target specific parameters together into a single
variable except generic sockets/cores/threads, to make related
code lines shorter and more concise.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine-smp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index b39ed21e65..4547d7bbdc 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -79,6 +79,7 @@ void machine_parse_smp_config(MachineState *ms,
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+    unsigned others;
 
     /*
      * Specified CPU topology parameters must be greater than zero,
@@ -111,6 +112,8 @@ void machine_parse_smp_config(MachineState *ms,
     dies = dies > 0 ? dies : 1;
     clusters = clusters > 0 ? clusters : 1;
 
+    others = dies * clusters;
+
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
@@ -124,30 +127,30 @@ void machine_parse_smp_config(MachineState *ms,
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * clusters * cores * threads);
+                sockets = maxcpus / (cores * threads * others);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * clusters * threads);
+                cores = maxcpus / (sockets * threads * others);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * clusters * threads);
+                cores = maxcpus / (sockets * threads * others);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * clusters * cores * threads);
+                sockets = maxcpus / (cores * threads * others);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * dies * clusters * cores);
+            threads = maxcpus / (sockets * cores * others);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads * others;
     cpus = cpus > 0 ? cpus : maxcpus;
 
     ms->smp.cpus = cpus;
@@ -159,7 +162,7 @@ void machine_parse_smp_config(MachineState *ms,
     ms->smp.max_cpus = maxcpus;
 
     /* sanity-check of the computed topology */
-    if (sockets * dies * clusters * cores * threads != maxcpus) {
+    if (sockets * cores * threads * others != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
-- 
2.27.0

