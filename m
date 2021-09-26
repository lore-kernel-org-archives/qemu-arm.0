Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2790899lfp;
        Sun, 26 Sep 2021 01:50:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAgwU/SlosT1Tw6plA3oqGE1yDvJAYIjKyLTDl+jN66dnKjn6mADCrCmhQZAQL2akEWIzR
X-Received: by 2002:a25:2ac5:: with SMTP id q188mr21484083ybq.443.1632646234015;
        Sun, 26 Sep 2021 01:50:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646234; cv=none;
        d=google.com; s=arc-20160816;
        b=C0Mx6hw6psK9PMvw0t97RrQRC0htGfL9N+s+rGRMj/WjB0KPeF25tJ3m9TB5u/g2H/
         nnU8IFKLFBf0NbT5NohbhCoexZTX7JPyDvBF1WZ6bko6qr9sYxWvUZEWW0AxcDHcwMe6
         Hd4bCP1BSLTEGNlefbUn3BrYl44GEOIlUYd88/VY5qFpKdwKJrFALHy4LJ4CNgPhTXJU
         8uHKaznaXprhOqedjSHvjIRM623KWjG6SzFrFwYzP/4LmA0WHF+tSE5z+6cFK//6TUsP
         b5ooSJ15CmbDpoaUSu/AoVh1Bl+4WCcL2UIfH/8SrIB/KfPlQWSJ8tFeaOhHNOvMstI6
         AtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=K8gCEax5cGYKaFtppcIdxp9RVisLBVaJirVzG26KwCk=;
        b=IkQfScNP1ZdRk7BsS2E9wc++5/gPfkjF8/71bY11vzk0ZVp+fXwiRRadhkv83/aBnz
         WKwrrk2E0u7onX+4d/x8q0G41g5u7Zc6dk+Eom+jEszinbbBh9w8uwOTR2NI0N1xdyEc
         NSWjNQv9rCS26jtNGaMN2Xgq6DdNvu8Em0SHH6cb00eZEQrcZXLhLOEtoRi+ePWt8qiT
         9x6cuFf7Hs2gubELjd0ivE35k7DgCjDlM79XLOSi4IaaYtbh4TbOmv2zV0AaRoIYBPxN
         29dYVXTFkmpuPt7H8T2SYsVuVeuiTh73wnW/GNqefHjNqU31kTvL+3OyNya2H5DTLIuk
         JY1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 78si3092183ybn.64.2021.09.26.01.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:50:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPrl-0004VN-CV
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnN-00060i-H2; Sun, 26 Sep 2021 04:46:01 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnJ-0002IM-66; Sun, 26 Sep 2021 04:46:01 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HHK4c0GQmzRTs0;
 Sun, 26 Sep 2021 16:41:36 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:50 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:50 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 03/14] machine: Uniformly use maxcpus to calculate the
 omitted parameters
Date: Sun, 26 Sep 2021 16:45:30 +0800
Message-ID: <20210926084541.17352-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
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
X-TUID: i2iIgV1/7G/n

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
---
 hw/core/machine.c | 30 +++++++++++++++---------------
 hw/i386/pc.c      | 30 +++++++++++++++---------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index cf9cf53911..56bd3033a5 100644
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
index 8599a9b527..9399e2906d 100644
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

