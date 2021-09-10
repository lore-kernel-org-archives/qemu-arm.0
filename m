Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp908784lfb;
        Fri, 10 Sep 2021 00:33:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNUihUz57lFmoW4+Cub+aZRcNRjUH8y49fE+AWxOazEkr9S+YalYu1jLr/jcZNLHvPTmeM
X-Received: by 2002:a5d:8505:: with SMTP id q5mr5891091ion.53.1631259229605;
        Fri, 10 Sep 2021 00:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259229; cv=none;
        d=google.com; s=arc-20160816;
        b=I9yc6Jl2hBpTM9cX+TTt3n12gM7LwUbkJWISrGtjFbRDc9Kwh0xBtjVeBgGBAx0+EA
         ubsFq9bZqDAGv/Purttf+aa5eC4/QoC/kwaiPqoiJloCeTPVO02ZpA4+7xib5zRG6Yod
         3Mo5vhBYF5T2NeTu56GVCXBdtCNrWvAuWOxzKghBWF00eiU1EbiogWacp+Idog7g1Okv
         nMxcpCloEBuLknjK68dw6eBGobxCmHE1dGTTk1PVpfEoETihdqCI7p4ICKtBpt4p38pA
         kkKCc0Dz8FEWyv2GasRoAkh7jbCeTN3LvGvepPOUQ9y2kB+ogOE6yTfTQKNZkgWE25+p
         xEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=64x1PpW0DNxX2Y3t8OASHoChnRYxAOnGiEg21LYttS4=;
        b=l6fRKSJxEtccsOrPm6/8Wo2HrlEjWOXCMy0N1ZHIZ54Q1H4l1v91Wu8ra03rb/KXVZ
         o3vjzw6RzCo4R5ZibSQqnbeqm5OApS4/QHQ8Y9utzzDCay9uTzAJMwDSf/ZgrRKEqI4O
         T5HCngEDkxtnZxtK++DhFiNzhGPBIHd635RaQac3+FNgoXz8eFCfJNRLmXr5MaQnZPd2
         tEh3R0rSG20sJ9ORIGwmZn9ZSHgS4kgNuIlUNKy6VD8yYtqEIMXBV+CjKEcNG5ydopYt
         jkMx6do3qnoOQ39rHiMbTSmXMtktTgfhTQJL9NQC541f+6rvMwxluLMlx0uhHX3rV5Gk
         MCDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9si4140151iow.85.2021.09.10.00.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:33:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb2i-0003Zn-VU
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazj-0004lL-Rj; Fri, 10 Sep 2021 03:30:43 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazf-0000ks-Q7; Fri, 10 Sep 2021 03:30:43 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5SF10czkzW1WD;
 Fri, 10 Sep 2021 15:29:41 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:35 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:34 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 05/16] machine: Improve the error reporting of smp parsing
Date: Fri, 10 Sep 2021 15:30:14 +0800
Message-ID: <20210910073025.16480-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4kHYPDoah6n3

We have two requirements for a valid SMP configuration:
the product of "sockets * cores * threads" must represent all the
possible cpus, i.e., max_cpus, and then must include the initially
present cpus, i.e., smp_cpus.

So we only need to ensure 1) "sockets * cores * threads == maxcpus"
at first and then ensure 2) "maxcpus >= cpus". With a reasonable
order of the sanity check, we can simplify the error reporting code.
When reporting an error message we also report the exact value of
each topology member to make users easily see what's going on.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c | 22 +++++++++-------------
 hw/i386/pc.c      | 24 ++++++++++--------------
 2 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index fe935cb4a3..f1b30b3101 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -782,25 +782,21 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, cores, threads, cpus);
+    if (sockets * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, cores, threads, maxcpus, cpus);
         return;
     }
 
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 83aa136a15..f08eb4fc3b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -749,25 +749,21 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
     cpus = cpus > 0 ? cpus : maxcpus;
 
-    if (sockets * dies * cores * threads < cpus) {
-        error_setg(errp, "cpu topology: "
-                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
-                   "smp_cpus (%u)",
-                   sockets, dies, cores, threads, cpus);
+    if (sockets * dies * cores * threads != maxcpus) {
+        error_setg(errp, "Invalid CPU topology: "
+                   "product of the hierarchy must match maxcpus: "
+                   "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
+                   "!= maxcpus (%u)",
+                   sockets, dies, cores, threads, maxcpus);
         return;
     }
 
     if (maxcpus < cpus) {
-        error_setg(errp, "maxcpus must be equal to or greater than smp");
-        return;
-    }
-
-    if (sockets * dies * cores * threads != maxcpus) {
-        error_setg(errp, "Invalid CPU topology deprecated: "
+        error_setg(errp, "Invalid CPU topology: "
+                   "maxcpus must be equal to or greater than smp: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
-                   "!= maxcpus (%u)",
-                   sockets, dies, cores, threads,
-                   maxcpus);
+                   "== maxcpus (%u) < smp_cpus (%u)",
+                   sockets, dies, cores, threads, maxcpus, cpus);
         return;
     }
 
-- 
2.23.0

