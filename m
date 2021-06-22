Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2888122lfg;
        Tue, 22 Jun 2021 02:39:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx28K8CnQmt1UXDbLu9EgA+UiA2UT38Ulr8S8jyI0n7+Gq+pp7fw6bxGv326g+WQuOH24dV
X-Received: by 2002:a6b:a10:: with SMTP id z16mr2101321ioi.70.1624354755140;
        Tue, 22 Jun 2021 02:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354755; cv=none;
        d=google.com; s=arc-20160816;
        b=bTvK/7a0XD9XpuVRvu0E1LtZb1qdlXhEPynDIXxfzvsAqV91t/ErQ9o6Dc7TwC53nn
         0RFVi4+3389gva/VYv21N97+Cdav+N51tMJStvfvZLCAC5hNGLRgN5mz4AR2mBNswBQs
         yCFqoBUSjsTIuqYz4/FGI/69ux8RvVZmeBqCfMzQWK8UrmmR8oUDJqR6H4sXdztIUkyS
         dUBk0BTNsiYv35kx5rRQUgcQOY3fVHy0Wb576B24d4uW6gN/4BCzEcoNXbmtTxdLLq6z
         HedozGx1i7v46elwYloeKlGLgLK4Aow34SnWX9lWrSIajEWXla+9esg5Vj3Hc8rXciRX
         S/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=NAomQoKHrGYipxdUlv3KWfHGHX6a6i9bHaHGp7Ll6AY=;
        b=DCcP42j9giySzKuWpSpqLq3d45upc4HfjWJC0Aw4WVVU7/lClSal5GNMfAdbE2nUjU
         JiE0IQ2dhvGLLPzBXO2NiOM3v4c/65uhVtPLIDJeuH88X1c2DNJrvz0c69tUfUd2kX6f
         91BQNhlIXNmYdyKX0yh3mjytp9A+2Yp4NDDzIo1PFpmjzwSVELPKTFN72U7BhjgkIlHB
         sN7Nt2ZXSkQUASwpEdCwGMnxYPvWtwjEsxMcikO3zPjiTpxp9ZJQgGnMyKVoEQ3y9pXv
         83CyJkd3YKdVIwJ5FFPSPkrtvqIlzKxjfkare6bR3QW7n5uJFj6H9DFaY3uTCGrHFNOn
         VD/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t8si13546290ilu.89.2021.06.22.02.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcsE-0004b3-CO
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnn-00037t-LM; Tue, 22 Jun 2021 05:34:39 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-00032h-9y; Tue, 22 Jun 2021 05:34:39 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G8Lk40d8Gz72mq;
 Tue, 22 Jun 2021 17:31:08 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:22 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:21 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 1/7] vl: Add expose=on|off option support in -smp
 command line
Date: Tue, 22 Jun 2021 17:34:07 +0800
Message-ID: <20210622093413.13360-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7q6GT4D7TPRc

Once the view of virtual cpu topology is provided to guest kernel,
with a well-designed vCPU pinning to the pCPU we could get a huge
benefit, e.g., the scheduling performance improvement. However a
virtual cpu topology view of guest may also have a negative impact
if the pinning is badly-designed. See Dario Faggioli's research
and the related performance tests in [1] for reference.

[1] https://kvmforum2020.sched.com/event/eE1y/virtual-topology-
for-virtual-machines-friend-or-foe-dario-faggioli-suse

So here we go, let's introduce support of generating cpu topology
descriptions to the guest. However, instead of quietly enforcing
the support for the latest machine type, we'd better introduce a
new parameter "expose=on|off" in -smp command line to leave QEMU
users a choice to decide whether to enable the feature or not.
This will allow the feature to work on different machine types
and also ideally compat with already in-use -smp command lines.

Furthermore, based on existing parsing rules of -smp command line
in generic smp_parse() which allows to compute the missing values,
another more strict rule is introduced to follow when exposure of
cpu topology is enabled. With "expose=on", it's important to know
what users actually want, so we require that all of cpus/sockets/
cores/threads must be provided while maxcpus is optional.
Hopefully the new rule will apply to all kinds of architectures
which support the feature.

In conclusion, if a QEMU user doesn't hope to enable the virtual
cpu topology support, then feel free to configure a -smp cmdline
like below and everything will work just like before:
-smp 96
-smp 96,expose=off
-smp 96,sockets=2
-smp 96,sockets=2,expose=off
...

While if a QEMU user is ready to take advantage of the virtual cpu
topology support, then he must configure an accurate -smp cmdline
like below, on different machine types:
-smp 96,sockets=2,cores=48,threads=1,expose=on
-smp 96,maxcpus=96,sockets=2,cores=48,threads=1,expose=on

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 qemu-options.hx | 24 +++++++++++++++---------
 softmmu/vl.c    |  3 +++
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..d18d64958b 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -196,25 +196,31 @@ SRST
 ERST
 
 DEF("smp", HAS_ARG, QEMU_OPTION_smp,
-    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets]\n"
+    "-smp [cpus=]n[,maxcpus=cpus][,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,expose=on|off]\n"
     "                set the number of CPUs to 'n' [default=1]\n"
     "                maxcpus= maximum number of total cpus, including\n"
     "                offline CPUs for hotplug, etc\n"
     "                cores= number of CPU cores on one socket (for PC, it's on one die)\n"
     "                threads= number of threads on one CPU core\n"
     "                dies= number of CPU dies on one socket (for PC only)\n"
-    "                sockets= number of discrete sockets in the system\n",
+    "                sockets= number of discrete sockets in the system\n"
+    "                expose=on|off controls support for exposing cpu topology\n"
+    "                to the guest (default=off)\n",
         QEMU_ARCH_ALL)
 SRST
-``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus]``
+``-smp [cpus=]n[,cores=cores][,threads=threads][,dies=dies][,sockets=sockets][,maxcpus=maxcpus][,expose=on|off]``
     Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
-    are supported. On Sparc32 target, Linux limits the number of usable
-    CPUs to 4. For the PC target, the number of cores per die, the
-    number of threads per cores, the number of dies per packages and the
-    total number of sockets can be specified. Missing values will be
-    computed. If any on the three values is given, the total number of
-    CPUs n can be omitted. maxcpus specifies the maximum number of
+    are supported. On the Sparc32 target, Linux limits the number of usable
+    CPUs to 4. For the PC target, the number of cores per die, the number
+    of threads per core, the number of dies per package and the total number
+    of sockets can be specified. maxcpus specifies the maximum number of
     hotpluggable CPUs.
+
+    With "expose=off" or not explicitly specified, missing values will be
+    computed, and the total number of CPUs n can be omitted if any on the
+    three values is given. Otherwise with "expose=on", much more detailed
+    configuration is required: cpus/sockets/cores/threads must be given,
+    while maxcpus is optional.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
diff --git a/softmmu/vl.c b/softmmu/vl.c
index feb4d201f3..f4b59571c7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -729,6 +729,9 @@ static QemuOptsList qemu_smp_opts = {
         }, {
             .name = "maxcpus",
             .type = QEMU_OPT_NUMBER,
+        }, {
+            .name = "expose",
+            .type = QEMU_OPT_BOOL,
         },
         { /*End of list */ }
     },
-- 
2.23.0

