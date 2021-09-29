Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5495884lfp;
        Tue, 28 Sep 2021 20:03:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSOQGdIThFu99WHj+kky5UTcHQoopxp+IwjJR1SNbrvePixaqJvQm9F3/JaYZJot1q7C9w
X-Received: by 2002:a1f:1cd4:: with SMTP id c203mr725942vkc.21.1632884630697;
        Tue, 28 Sep 2021 20:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632884630; cv=none;
        d=google.com; s=arc-20160816;
        b=RML+3ulLh7hXwWNd1rNyc5ABEtw7ZnRZ/DifJZ4NUYhTp+ib6hvnjrIg/1lrGpxzUA
         eSL6Z0cMy5/o+Fm+PTnRL72ZYc6G2z/GxQQWNuyvcSkgMuYm9QAseYSXtxjPhnLMlyXt
         1HIOgOlL6K3wnyctG4Rq5SGab1/HeWjK+LcbrjYhcV3UP1S4e4JJ+zmw5Eh5yxiiPN0H
         3IIDz47FBhitfL0PJTYQYZUw7SvDxWkYLorIEP/Cjp0ZsZX1kXFvgxxsb09uwP27PrRb
         HOBzTemQS8kA1IVWUSM/qZ/QcyTDmsULY4WBtEcMc3VJCAWc2N/5nbmIzTBSiCcEVY0K
         5FhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Q391vK73gYY5oBNfiz6qereZOsZ7MiJoK8pADGS7VOQ=;
        b=PYju7YaECxWswhKplYk3j74aBk1BolWa/TNopSar/pCuFyBJyUAQTmdyAc2MKy+sA4
         5ZqzM34/cFabsL6If4z8285yOeIBhnoP0kZl4tZMmlyBZ9bQdlKOS0G1Y64pVM5HhY49
         OvVI/Cw915hPBACbKkoF7VulxI4ZfSZeIdNFHSbfWonLlmuPPDuFdFcOGQekEeVU9TQN
         oBS/lr/UJCkiLXMfv/WU3tDA825or80nqaHlLqTbaSCE0Er6Mkf7sURuTMcStPkoKQSa
         oq0Kzp4rdLDvTcVI01y6ciLNHG41zxrzLhQMFaspYI/SkeEaImZz4hKOXuzOp3bUAjJa
         eDgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10si961493vsr.339.2021.09.28.20.03.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 20:03:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:55756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVPsr-0004k2-Uz
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 23:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPnw-0004zt-Si; Tue, 28 Sep 2021 22:58:44 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPns-0005qC-LD; Tue, 28 Sep 2021 22:58:44 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HK1Ht2sX2zWZCx;
 Wed, 29 Sep 2021 10:57:14 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:33 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:32 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 04/16] machine: Uniformly use maxcpus to calculate the
 omitted parameters
Date: Wed, 29 Sep 2021 10:58:04 +0800
Message-ID: <20210929025816.21076-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BLxaW9kJZoki

We are currently using maxcpus to calculate the omitted sockets
but using cpus to calculate the omitted cores/threads. This makes
cmdlines like:
  -smp cpus=8,maxcpus=16
  -smp cpus=8,cores=4,maxcpus=16
  -smp cpus=8,threads=2,maxcpus=16
work fine but the ones like:
  -smp cpus=8,sockets=2,maxcpus=16
  -smp cpus=8,sockets=2,cores=4,maxcpus=16
  -smp cpus=8,sockets=2,threads=2,maxcpus=16
break the sanity check.

Since we require for a valid config that the product of "sockets * cores
* threads" should equal to the maxcpus, we should uniformly use maxcpus
to calculate their omitted values.

Also the if-branch of "cpus == 0 || sockets == 0" was split into two
branches of "cpus == 0" and "sockets == 0" so that we can clearly read
that we are parsing the configuration with a preference on cpus over
sockets over cores over threads.

Note: change in this patch won't affect any existing working cmdlines
but improves consistency and allows more incomplete configs to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c | 30 +++++++++++++++---------------
 hw/i386/pc.c      | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 8e719e2932..596e758133 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -760,24 +760,26 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (cores * threads);
-        }
+        cpus = sockets * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * cores * threads < cpus) {
+        threads = maxcpus / (sockets * cores);
+    }
+
+    if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -785,8 +787,6 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 93dc322a97..87c06d3991 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -727,24 +727,26 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
-    if (cpus == 0 || sockets == 0) {
+    maxcpus = maxcpus > 0 ? maxcpus : cpus;
+
+    if (cpus == 0) {
+        sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        if (cpus == 0) {
-            sockets = sockets > 0 ? sockets : 1;
-            cpus = cores * threads * dies * sockets;
-        } else {
-            maxcpus = maxcpus > 0 ? maxcpus : cpus;
-            sockets = maxcpus / (dies * cores * threads);
-        }
+        cpus = sockets * dies * cores * threads;
+        maxcpus = maxcpus > 0 ? maxcpus : cpus;
+    } else if (sockets == 0) {
+        cores = cores > 0 ? cores : 1;
+        threads = threads > 0 ? threads : 1;
+        sockets = maxcpus / (dies * cores * threads);
     } else if (cores == 0) {
         threads = threads > 0 ? threads : 1;
-        cores = cpus / (sockets * dies * threads);
-        cores = cores > 0 ? cores : 1;
+        cores = maxcpus / (sockets * dies * threads);
     } else if (threads == 0) {
-        threads = cpus / (cores * dies * sockets);
-        threads = threads > 0 ? threads : 1;
-    } else if (sockets * dies * cores * threads < cpus) {
+        threads = maxcpus / (sockets * dies * cores);
+    }
+
+    if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
                    "smp_cpus (%u)",
@@ -752,8 +754,6 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
         return;
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
     if (maxcpus < cpus) {
         error_setg(errp, "maxcpus must be equal to or greater than smp");
         return;
-- 
2.19.1

