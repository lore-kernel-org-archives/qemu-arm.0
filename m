Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp149283lfb;
        Thu, 2 Sep 2021 04:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfDwXmVK1K5tm5iZCv58Y5gl4c78vrJVAl3TBAhyR+pmnigXrfTbsf14StNGCSQfQTsNTT
X-Received: by 2002:adf:e809:: with SMTP id o9mr3034605wrm.425.1630580921803;
        Thu, 02 Sep 2021 04:08:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630580921; cv=none;
        d=google.com; s=arc-20160816;
        b=qAKY678uXyMiYdj+ftfBv2NxNv3Ijzc9PM1AOCsjFZjW6YGhsVwZ88Fccue6HXTLlz
         CGmGXfIsM17M2Xnd8B1JwKaQ0JXBk9Lc2+7ys7wYNCvFZtPdLNVMSIfst2x3s9SO9iVz
         pk481fOqQmBJFlRV6k2fMIElB12B2JFLUnLzwwBBtXPp19J3J4WfEgf5yfk72NPMELmd
         M4soaU9r9GakA1MJVyL34lQHVasuqbWzGdnAWbvy4tjiOkIJiYjSkZOpD7vJoHtTidDH
         EoXU9Jl4/7mIvjWuGJZAaaa72js+BhzhiQ4nZBGgRNxET8zawYpE5jF/dHHLgEK2APRM
         Ocyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=lBVO0qEU2faM0gD6ewraTVSXmmJcOKVki3ONe0McDq8=;
        b=xFfzqQWq9xYMLZc8ZCVu0mpVHNAmTCO1b2Tmmq8SNx9c7sQvAF1T+p/1IsOnIiIIRe
         Zn43brrN8QbXXjePKuRjzM4B94HVUlBVfRSIyVnnnezv2U31Wh4YYoM6fzfD5fMMlF5I
         MUGpZGZluB40wf2AyPLEU1dXqDECIHRCx61sEh+naV301RVreXiuukwS639dAXnegCz6
         rtOV6Nzl1rkBjaJg2aFi5SuLGWYOVeogoqBfD9GgIOzpLmWBZD0Xnx9T21xi3O9utGgq
         Y2yGGLmyWTyBsFvnCFly2+zdwj77Gt57+pUu70Pm5wE8r5x4Gw+/eSWrESPENjVXJEFX
         hW7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9si1687613wmg.117.2021.09.02.04.08.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Sep 2021 04:08:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLkaG-0006WO-Rv
	for alex.bennee@linaro.org; Thu, 02 Sep 2021 07:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVb-00073G-Pv; Thu, 02 Sep 2021 07:03:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mLkVY-0003gV-0I; Thu, 02 Sep 2021 07:03:51 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4H0dGn084Kz8xdN;
 Thu,  2 Sep 2021 18:59:29 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 2 Sep 2021 19:03:43 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 2 Sep 2021 19:03:42 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v8 08/14] machine: Tweak the order of topology members in
 struct CpuTopology
Date: Thu, 2 Sep 2021 19:03:24 +0800
Message-ID: <20210902110330.18036-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210902110330.18036-1-wangyanan55@huawei.com>
References: <20210902110330.18036-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
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
 Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Greg Kurz <groug@kaod.org>,
 Yanan Wang <wangyanan55@huawei.com>, wanghaibin.wang@huawei.com,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zzTHqKwJMCVJ

Now that all the possible topology parameters are integrated in struct
CpuTopology, tweak the order of topology members to be "cpus/sockets/
dies/cores/threads/maxcpus" for readability and consistency. We also
tweak the comment by adding explanation of dies parameter.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c   | 8 ++++----
 include/hw/boards.h | 7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1ad5dac3e8..a21fcd7700 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -829,11 +829,11 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 {
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config = &(SMPConfiguration){
-        .has_cores = true, .cores = ms->smp.cores,
+        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_sockets = true, .sockets = ms->smp.sockets,
         .has_dies = true, .dies = ms->smp.dies,
+        .has_cores = true, .cores = ms->smp.cores,
         .has_threads = true, .threads = ms->smp.threads,
-        .has_cpus = true, .cpus = ms->smp.cpus,
         .has_maxcpus = true, .maxcpus = ms->smp.max_cpus,
     };
     if (!visit_type_SMPConfiguration(v, name, &config, &error_abort)) {
@@ -1060,10 +1060,10 @@ static void machine_initfn(Object *obj)
     /* default to mc->default_cpus */
     ms->smp.cpus = mc->default_cpus;
     ms->smp.max_cpus = mc->default_cpus;
-    ms->smp.cores = 1;
+    ms->smp.sockets = 1;
     ms->smp.dies = 1;
+    ms->smp.cores = 1;
     ms->smp.threads = 1;
-    ms->smp.sockets = 1;
 }
 
 static void machine_finalize(Object *obj)
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 2ae039b74f..2a1bba86c0 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -275,17 +275,18 @@ typedef struct DeviceMemoryState {
 /**
  * CpuTopology:
  * @cpus: the number of present logical processors on the machine
- * @cores: the number of cores in one package
- * @threads: the number of threads in one core
  * @sockets: the number of sockets on the machine
+ * @dies: the number of dies in one socket
+ * @cores: the number of cores in one die
+ * @threads: the number of threads in one core
  * @max_cpus: the maximum number of logical processors on the machine
  */
 typedef struct CpuTopology {
     unsigned int cpus;
+    unsigned int sockets;
     unsigned int dies;
     unsigned int cores;
     unsigned int threads;
-    unsigned int sockets;
     unsigned int max_cpus;
 } CpuTopology;
 
-- 
2.19.1

