Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp912127lfb;
        Fri, 10 Sep 2021 00:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfOQeF1CY/i3IKQ81lM7r7Zrt3EINlPyEAFKJshqkPtmNNB1DjEL0j0ampiWFx36Vqvhuj
X-Received: by 2002:a05:6638:1384:: with SMTP id w4mr3315155jad.21.1631259540216;
        Fri, 10 Sep 2021 00:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259540; cv=none;
        d=google.com; s=arc-20160816;
        b=uzN9L9sChmzP3og5VH+ibH4k0mQaD5bj4IFpSwrbjxqANnT6g/FrRtLwev5mHXhqX4
         K76kLb7KM0pFJPl97OXMHhfxwvE277fZEb3xDIHQvlBqnundVbKHRZRCGIST1ybjzSGL
         su/TGRBU3F4X7u8h9ATiZgFzzFfXI7474hS30RIPt0sCLP0UHqgtAY86tF63XajBQ0SX
         tCUauatp8V3kQoEn1cjBU3ZLqGka1aPbpzwJct43Bl2kzrXdCV5LDUw+jjFS1ll5uCUJ
         NNl6ZwSIegAKrlW2VO6LJhJZSEO//T/wf/+MZb2yjRO9rh+Q8GvNlbhKj0mwqbwnwXxH
         EUcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=jPdRwid9F6wbc0ZAEK19uLw+yKm8+yRUooTnZB1cnPo=;
        b=MMXmxxZbAdAdhphbbCLeCWA6HRNl9gI+cCnuJwqRCRLkqqJiBVClI0G8YKfJ8uts1+
         qhDRjFF0nFUbnLEAq1yM1iLzUKNnbHQEOdJAcQgFGWZVG4YEvhaGKq711G4xLSTkXZTv
         aUsPDs2vwTcKBcR5B4zjvv/GdtDkVoXtYFYMQj/g+Vqf5OiIw7UAxYLMsR6FLuJBiAJ1
         EcmF8gueVCSKhpEzLP5x5gxuxXId9lyF6cgt0O2j2RgIyjfYodxuzHivAuiQY60gwQPV
         S7BpXceUGHrbn8El/+uPT/XeTlhHs3fYGZHRQlJyaqNpxsfqoA2gLZIccEY/cMzWa7/9
         erqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si4410540jaf.48.2021.09.10.00.39.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:39:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:34280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb7j-0004ma-JS
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazl-0004nk-A9; Fri, 10 Sep 2021 03:30:45 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazf-0000if-Lq; Fri, 10 Sep 2021 03:30:45 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H5S9M16CwzQjGq;
 Fri, 10 Sep 2021 15:26:31 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:33 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:32 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 04/16] machine: Set the value of cpus to match maxcpus if
 it's omitted
Date: Fri, 10 Sep 2021 15:30:13 +0800
Message-ID: <20210910073025.16480-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210910073025.16480-1-wangyanan55@huawei.com>
References: <20210910073025.16480-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4FYam6kf7vtc

Currently we directly calculate the omitted cpus based on the given
incomplete collection of parameters. This makes some cmdlines like:
  -smp maxcpus=16
  -smp sockets=2,maxcpus=16
  -smp sockets=2,dies=2,maxcpus=16
  -smp sockets=2,cores=4,maxcpus=16
not work. We should probably set the value of cpus to match maxcpus
if it's omitted, which will make above configs start to work.

So the calculation logic of cpus/maxcpus after this patch will be:
When both maxcpus and cpus are omitted, maxcpus will be calculated
from the given parameters and cpus will be set equal to maxcpus.
When only one of maxcpus and cpus is given then the omitted one
will be set to its counterpart's value. Both maxcpus and cpus may
be specified, but maxcpus must be equal to or greater than cpus.

Note: change in this patch won't affect any existing working cmdlines
but allows more incomplete configs to be valid.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c | 29 ++++++++++++++++-------------
 hw/i386/pc.c      | 29 ++++++++++++++++-------------
 qemu-options.hx   | 11 ++++++++---
 3 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 56bd3033a5..fe935cb4a3 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -760,25 +760,28 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-    if (cpus == 0) {
+    if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        cpus = sockets * cores * threads;
+    } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
-    } else if (sockets == 0) {
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        sockets = maxcpus / (cores * threads);
-    } else if (cores == 0) {
-        threads = threads > 0 ? threads : 1;
-        cores = maxcpus / (sockets * threads);
-    } else if (threads == 0) {
-        threads = maxcpus / (sockets * cores);
+
+        if (sockets == 0) {
+            cores = cores > 0 ? cores : 1;
+            threads = threads > 0 ? threads : 1;
+            sockets = maxcpus / (cores * threads);
+        } else if (cores == 0) {
+            threads = threads > 0 ? threads : 1;
+            cores = maxcpus / (sockets * threads);
+        } else if (threads == 0) {
+            threads = maxcpus / (sockets * cores);
+        }
     }
 
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
+    cpus = cpus > 0 ? cpus : maxcpus;
+
     if (sockets * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * cores (%u) * threads (%u) < "
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 9399e2906d..83aa136a15 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -727,25 +727,28 @@ static void pc_smp_parse(MachineState *ms, SMPConfiguration *config, Error **err
     dies = dies > 0 ? dies : 1;
 
     /* compute missing values, prefer sockets over cores over threads */
-    maxcpus = maxcpus > 0 ? maxcpus : cpus;
-
-    if (cpus == 0) {
+    if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
         cores = cores > 0 ? cores : 1;
         threads = threads > 0 ? threads : 1;
-        cpus = sockets * dies * cores * threads;
+    } else {
         maxcpus = maxcpus > 0 ? maxcpus : cpus;
-    } else if (sockets == 0) {
-        cores = cores > 0 ? cores : 1;
-        threads = threads > 0 ? threads : 1;
-        sockets = maxcpus / (dies * cores * threads);
-    } else if (cores == 0) {
-        threads = threads > 0 ? threads : 1;
-        cores = maxcpus / (sockets * dies * threads);
-    } else if (threads == 0) {
-        threads = maxcpus / (sockets * dies * cores);
+
+        if (sockets == 0) {
+            cores = cores > 0 ? cores : 1;
+            threads = threads > 0 ? threads : 1;
+            sockets = maxcpus / (dies * cores * threads);
+        } else if (cores == 0) {
+            threads = threads > 0 ? threads : 1;
+            cores = maxcpus / (sockets * dies * threads);
+        } else if (threads == 0) {
+            threads = maxcpus / (sockets * dies * cores);
+        }
     }
 
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * cores * threads;
+    cpus = cpus > 0 ? cpus : maxcpus;
+
     if (sockets * dies * cores * threads < cpus) {
         error_setg(errp, "cpu topology: "
                    "sockets (%u) * dies (%u) * cores (%u) * threads (%u) < "
diff --git a/qemu-options.hx b/qemu-options.hx
index 91d859aa29..9d71a661bb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -214,9 +214,14 @@ SRST
     Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
     the machine type board. On boards supporting CPU hotplug, the optional
     '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
-    added at runtime. If omitted the maximum number of CPUs will be
-    set to match the initial CPU count. Both parameters are subject to
-    an upper limit that is determined by the specific machine type chosen.
+    added at runtime. When both parameters are omitted, the maximum number
+    of CPUs will be calculated from the provided topology members and the
+    initial CPU count will match the maximum number. When only one of them
+    is given then the omitted one will be set to its counterpart's value.
+    Both parameters may be specified, but the maximum number of CPUs must
+    be equal to or greater than the initial CPU count. Both parameters are
+    subject to an upper limit that is determined by the specific machine
+    type chosen.
 
     To control reporting of CPU topology information, the number of sockets,
     dies per socket, cores per die, and threads per core can be specified.
-- 
2.23.0

