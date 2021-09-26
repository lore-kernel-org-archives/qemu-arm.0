Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2791218lfp;
        Sun, 26 Sep 2021 01:51:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybUa/HvpUdbvMa5s7tgmfMzI/Ax+BxuYcVyukRx1WPoEbdy033eBsDGZxsLRa8zs0f3Uht
X-Received: by 2002:a5b:b0c:: with SMTP id z12mr5166314ybp.358.1632646273634;
        Sun, 26 Sep 2021 01:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646273; cv=none;
        d=google.com; s=arc-20160816;
        b=u4mdDa9BdObrlYNzUU++xmmtKOkuYWMwhqOTh2uVuyb8lOJQ3zV6bBk8HASWdEfIe9
         Lb79pkab93AIlg8hRrADoCgf0LYI2Sb220H46SKl84UVx6g3sELJ9vm4OngEXBdZxsqB
         aWqMQ5lhs1Dhf0KhWiDVWcfIjm0PGVkVXTSWbGQXY6bm9AByHXp87pyJ4t5aNLCkUT6n
         na66k1ZzdzyM8F5nXLSlLKdGAeMmCpg2WlHH2KlqlUdqchWHUqvSQdsB7YcE++HFPkw1
         6yhpG0ZlEkY50AS7tUgTbQz6Byb1MEQmvhzpFUBMx6sDuqGUNywMwM+hVTse/TqvIFg2
         xgMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=caIfLaulepuj/fW/PZC3m7pvPM9w+kLLh9rMm1gtFRM=;
        b=aZWVJuRPhzlUEJXwWUCABUlNHLjqW8CrWptd9KBboFfqnrnhxzGCzNkdJlUKVTidJG
         ce747TBg2kKdHSBhBI5YNtyU5IFJnv0Zk2YY6SfJ1E/++n2ZLWpNzT50+3UJJFNv3Uqv
         HPbLqG2xiIXnrU7M/7TpmXFRwyu8h8Ja9xdqdmx4telSEFV468pQuSKcFVI+/tqOGl3y
         Qjviy967RQTTnc+tqULnO2j2CoFqKSsxbJhvFt3PYAX9Y21jvDY1dMSzCZ7D4pDTS9B7
         JlQzUl46nZ4dM6P5aIGseKCiORjjqwHIr7KpA0nu0snvDk6YJPkgDzffhnaZJoH+Ttn0
         atVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u129si16127620yba.233.2021.09.26.01.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPsO-0005HC-U3
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnN-00061H-Sh; Sun, 26 Sep 2021 04:46:01 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnK-0002HL-QQ; Sun, 26 Sep 2021 04:46:01 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HHK824PjKzVh0f;
 Sun, 26 Sep 2021 16:44:34 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:49 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:48 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 02/14] machine: Minor refactor/fix for the smp parsers
Date: Sun, 26 Sep 2021 16:45:29 +0800
Message-ID: <20210926084541.17352-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
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
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NyptaBVwFE0B

To pave the way for the functional improvement in later patches,
make some refactor/cleanup for the smp parsers, including using
local maxcpus instead of ms->smp.max_cpus in the calculation,
defaulting dies to 0 initially like other members, cleanup the
sanity check for dies.

We actually also fix a hidden defect by avoiding directly using
the provided *zero value* in the calculation, which could cause
a segment fault (e.g. using dies=0 in the calculation).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c | 18 ++++++++++--------
 hw/i386/pc.c      | 23 ++++++++++++++---------
 2 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 711e83db54..cf9cf53911 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,8 +752,9 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned sockets = config->has_sockets ? config->sockets : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
-    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+    if (config->has_dies && config->dies > 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
         return;
     }
@@ -766,8 +767,8 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -784,26 +785,27 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * cores * threads != ms->smp.max_cpus) {
+    if (sockets * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology: "
                    "sockets (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
     ms->smp.cpus = cpus;
+    ms->smp.sockets = sockets;
     ms->smp.cores = cores;
     ms->smp.threads = threads;
-    ms->smp.sockets = sockets;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7e523b913c..8599a9b527 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -718,9 +718,13 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
 {
     unsigned cpus    = config->has_cpus ? config->cpus : 0;
     unsigned sockets = config->has_sockets ? config->sockets : 0;
-    unsigned dies    = config->has_dies ? config->dies : 1;
+    unsigned dies    = config->has_dies ? config->dies : 0;
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
+    unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+
+    /* directly default dies to 1 if it's omitted */
+    dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
@@ -730,8 +734,8 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
             sockets = sockets > 0 ? sockets : 1;
             cpus = cores * threads * dies * sockets;
         } else {
-            ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
-            sockets = ms->smp.max_cpus / (cores * threads * dies);
+            maxcpus = maxcpus > 0 ? maxcpus : cpus;
+            sockets = maxcpus / (dies * cores * threads);
         }
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
@@ -748,27 +752,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    ms->smp.max_cpus = config->has_maxcpus ? config->maxcpus : cpus;
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
 
-    if (ms->smp.max_cpus < cpus) {
+    if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
     }
 
-    if (sockets * dies * cores * threads != ms->smp.max_cpus) {
+    if (sockets * dies * cores * threads != maxcpus) {
         error_setg(errp, "Invalid CPU topology deprecated: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) "
                    "!= maxcpus (%u)",
                    sockets, dies, cores, threads,
-                   ms->smp.max_cpus);
+                   maxcpus);
         return;
     }
 
     ms->smp.cpus = cpus;
-    ms->smp.cores = cores;
-    ms->smp.threads = threads;
     ms->smp.sockets = sockets;
     ms->smp.dies = dies;
+    ms->smp.cores = cores;
+    ms->smp.threads = threads;
+    ms->smp.max_cpus = maxcpus;
 }
 
 static
-- 
2.19.1

