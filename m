Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4661980lfr;
        Tue, 13 Apr 2021 01:35:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNErFg8FCvfM36hUpw+utTmyqxyVJWw0to0D22cTrNQw1umVBCUurMhx5AtUbwQCApDCva
X-Received: by 2002:a67:3197:: with SMTP id x145mr21164075vsx.10.1618302952579;
        Tue, 13 Apr 2021 01:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618302952; cv=none;
        d=google.com; s=arc-20160816;
        b=GMFDXDxpnnaKwQ1glcF5V1eHeEbbCaN1NYup6CBDuUaHFrGe1waDuU/cMHw09Z22tS
         edBCy5WtI/3kHF7+kPIIq/uJKPyJp5khxjyY9o8+yabBR5U7nLxFY8DKIufxsMr4K7AM
         XVbWLEFWS/y30nJMJekOAomia6LgHagGX/wpMo9fGVSyrXiYnF39+hciXzSPlXahkCoD
         w3cA3pLzsZOK1A/+f1XnzoFmWhIE1zByngGiqz/BztEj90c7kAmCpLD7fJjZKvQSwrf9
         8gbpstQDeEeYB6lUZgfZ2OnwwjobwyvmbZZZG0FB/gNxXYa07CwR09LORwRSqGtdfBtd
         uW2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=TgTSvEMeJtstoqGflARlYiqIj8i9Mv3URmdVkvpE+JM=;
        b=G2jujOo9A1PeAN12J4xxZK3lcoPbJt3/nSwD6nixCJV4CMAUOJDEq0fj9cWsaYXkMN
         RfhbaELnOwB7/7BAi3GBa0v4+//7j3YIAmdVRezslBISfNdNlSwrN+nFuMPLVk/L62SV
         L5SXBYt9uGojruQrynBZUDVkiekMNCyzjf+FnatE9hZXz3vp/4AZi1BG1WNYDIwO/htx
         ceD/nvy4tW9DoFoHEEy5ziCBfzTZuoktb0k9UsyDmUpRFFIzcw0Ve9fAc5sF4kn/n5Hh
         faasPVZVHErWZmyUvBXYO7oSCTu+d61Akc8rODG5wLxCwb1AXqA7AyMVKgxk+9yLBb8O
         IwwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4si4925129vsc.388.2021.04.13.01.35.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:35:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWEWV-0003d8-Si
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:35:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWET0-0008Pw-2J; Tue, 13 Apr 2021 04:32:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5360)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESw-0004tK-Rs; Tue, 13 Apr 2021 04:32:13 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKJgd1MGvz1BGXj;
 Tue, 13 Apr 2021 16:29:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:31:55 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Date: Tue, 13 Apr 2021 16:31:45 +0800
Message-ID: <20210413083147.34236-3-wangyanan55@huawei.com>
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
X-TUID: R94kGvNqCw6c

There is a separate function virt_smp_parse() in hw/virt/arm.c used
to parse cpu topology for the ARM machines. So add parsing of -smp
cluster parameter in it, then total number of logical cpus will be
calculated like: max_cpus = sockets * clusters * cores * threads.

In virt_smp_parse(), the computing logic of missing values prefers
cores over sockets over threads. And for compatibility, the value
of clusters will be set as default 1 if not explicitly specified.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57ef961cb5..51797628db 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2639,35 +2639,38 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
     if (opts) {
         unsigned cpus = qemu_opt_get_number(opts, "cpus", 0);
         unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
+        unsigned clusters = qemu_opt_get_number(opts, "clusters", 1);
         unsigned cores = qemu_opt_get_number(opts, "cores", 0);
         unsigned threads = qemu_opt_get_number(opts, "threads", 0);
+        VirtMachineState *vms = VIRT_MACHINE(ms);
 
         /*
-         * Compute missing values; prefer cores over sockets and
-         * sockets over threads.
+         * Compute missing values; prefer cores over sockets and sockets
+         * over threads. For compatibility, value of clusters will have
+         * been set as default 1 if not explicitly specified.
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
 
@@ -2678,11 +2681,11 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
             exit(1);
         }
 
-        if (sockets * cores * threads != ms->smp.max_cpus) {
+        if (sockets * clusters * cores * threads != ms->smp.max_cpus) {
             error_report("cpu topology: "
-                         "sockets (%u) * cores (%u) * threads (%u)"
-                         "!= maxcpus (%u)",
-                         sockets, cores, threads,
+                         "sockets (%u) * clusters (%u) * cores (%u) * "
+                         "threads (%u) != maxcpus (%u)",
+                         sockets, clusters, cores, threads,
                          ms->smp.max_cpus);
             exit(1);
         }
@@ -2691,6 +2694,7 @@ static void virt_smp_parse(MachineState *ms, QemuOpts *opts)
         ms->smp.cores = cores;
         ms->smp.threads = threads;
         ms->smp.sockets = sockets;
+        vms->smp_clusters = clusters;
     }
 
     if (ms->smp.cpus > 1) {
-- 
2.19.1

