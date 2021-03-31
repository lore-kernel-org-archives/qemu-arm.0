Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp323461lfg;
        Wed, 31 Mar 2021 02:56:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJFheIugQIjOV6qDQHWkJXCsOrkRukzBiwNVd1tigx5EEaoiaQmPIPwKTcAzRyTBoSUl8h
X-Received: by 2002:a25:d842:: with SMTP id p63mr3821208ybg.94.1617184564461;
        Wed, 31 Mar 2021 02:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617184564; cv=none;
        d=google.com; s=arc-20160816;
        b=lgaIcKGGChPeaCjcDsCAGnxq6T/3AFL52dYiVzW7feXrDM+ejnjeAubYkJnDxHPbWu
         MMjJ1yAjL8KB10HpwnAaosR1uSz85Bg/FVboKOhiAVfmJyAcgR8I9oIjjvrPx09DtFmB
         dV6iUZ76w4FSN30G4zGzHacGNRy6wgW2BoWruDSqCzMQontsNEQutVq5iGrP3+EpWBqi
         45LiiSw94gpQaZYXKbrSsB9BKVesvoCyI2suZq8kdFGO3KTIys0MLXHgNcqqKwxcYt14
         Y4kXN0JYqTJWlGPXalKwlL0Xxch8kec+OCldF848T3DYcf12Bc3YUs0ip5Dl9whdKI/n
         9FuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=1rrhz3oz0u+doMkImXKsK/Fp15V5Q9Ull/x+D/I5W1c=;
        b=P9gmJKZnS7+0xeHHg+cGKH/NGW3LJ/u3vuwDzZw44iGFUcuwyQ9L2Z8cFEjfKbAGR+
         uiETswT4rzVDIfl9EIdIZ6svvTsHQqLoScJZ4++K6gwyfnVadOnavSyaWC6PV1qwt5Ty
         cdY4DZG71WVMeKJnPeowuF6/xmuTGKcs4dLLKaMEEij7t/iliDiw294tOX5EbzVYZfsw
         5FXAqCkOVYqHLcc99VzBrgvyBfK6bRLfAHJqG9C8KGkT9PYpUjdoJLzzOwMBF50vQvaY
         pDsKSKgSFEC/BgygIMFFHmDXXd04hX68jVKePQrV0UElVEiRJCIPLyhtoybO5azEpA3Q
         +eBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si2063140ybt.160.2021.03.31.02.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 02:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXZz-00049o-ON
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 05:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYL-0002lr-T0; Wed, 31 Mar 2021 05:54:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY7-0002aw-2M; Wed, 31 Mar 2021 05:54:21 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9M6M1MGlz1BFy9;
 Wed, 31 Mar 2021 17:51:55 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:51 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 4/6] hw/i386/pc: Parse cluster cpu topology for PC machines
Date: Wed, 31 Mar 2021 17:53:41 +0800
Message-ID: <20210331095343.12172-5-wangyanan55@huawei.com>
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
X-TUID: B0wGmQpLeYHY

There is a separate function pc_smp_parse() in hw/i386/pc.c used
to parse cpu topology for the PC machines. And there are some x86
implementations that have a similar concept of cluster, for example,
on Jacobsville there are 6 clusters of 4 Atom cores, each cluster
sharing a separate L2 cache, and 24 cores sharing L3 cache.
So parse cluster cpu topology the for PC machines, then guest kernel
will take advantages of it for better scheduling performance.

In pc_smp_parse(), the computing logic of missing values prefers
sockets over cores over threads. And the value of clusters will be
set as default 1 if not explictly specified, so that it will not
impact the parsing results of machines that won't specify "clusters="
in -smp command line because they just don't support it.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/i386/pc.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 8aa85dec54..f2906f9185 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -716,33 +716,39 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
         unsigned cpus    = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
         unsigned dies = qemu_opt_get_number(opts, "dies", 1);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
         unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
 
-        /* compute missing values, prefer sockets over cores over threads */
+        /*
+         * Compute missing values, prefer sockets over cores
+         * over threads. And the value of dies or clusters has
+         * been set as default 1 if not explicitly specified.
+         */
         if (cpus == 0 || sockets == 0) {
             cores = cores > 0 ? cores : 1;
             threads = threads > 0 ? threads : 1;
             if (cpus == 0) {
                 sockets = sockets > 0 ? sockets : 1;
-                cpus = cores * threads * dies * sockets;
+                cpus = sockets * dies * clusters * cores * threads;
             } else {
                 ms->smp.max_cpus =
                         qemu_opt_get_number(opts, "maxcpus", cpus);
-                sockets = ms->smp.max_cpus / (cores * threads * dies);
+                sockets = ms->smp.max_cpus /
+                          (dies * clusters * cores * threads);
             }
         } else if (cores == 0) {
             threads = threads > 0 ? threads : 1;
-            cores = cpus / (sockets * dies * threads);
+            cores = cpus / (sockets * dies * clusters * threads);
             cores = cores > 0 ? cores : 1;
         } else if (threads == 0) {
-            threads = cpus / (cores * dies * sockets);
+            threads = cpus / (sockets * dies * clusters * cores);
             threads = threads > 0 ? threads : 1;
-        } else if (sockets * dies * cores * threads < cpus) {
+        } else if (sockets * dies * clusters * cores * threads < cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                         "smp_cpus (%u)",
-                         sockets, dies, cores, threads, cpus);
+                         "sockets (%u) * dies (%u) * clusters (%u) * "
+                         "cores (%u) * threads (%u) < smp_cpus (%u)",
+                         sockets, dies, clusters, cores, threads, cpus);
             exit(1);
         }
 
@@ -756,14 +762,15 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
 
         if (sockets * dies * cores * threads != ms->smp.max_cpus) {
             error_report("Invalid CPU topology deprecated: "
-                         "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                         "!= maxcpus (%u)",
-                         sockets, dies, cores, threads,
+                         "sockets (%u) * dies (%u) * clusters (%u) * "
+                         "cores (%u) * threads (%u) != maxcpus (%u)",
+                         sockets, dies, clusters, cores, threads,
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

