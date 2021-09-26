Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2794459lfp;
        Sun, 26 Sep 2021 01:58:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY8DbgWfKrNLpF4d+XVAKCaePD+hkDyMWVZD7z6w01WpD+xjweRdxKeJq9dTEhNOr0wNyZ
X-Received: by 2002:a25:6e06:: with SMTP id j6mr23446792ybc.311.1632646738881;
        Sun, 26 Sep 2021 01:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632646738; cv=none;
        d=google.com; s=arc-20160816;
        b=Q6+KMn3/ma3GqHhNN04jqzOYkYN/FwhvJZrH1xBE3u3tz6buvCUyEFY1vwUPum8pma
         wqxSKXhYHmVz/CZAyqCPcc+BH7jjaJO4jbFkqMUyzXgUVepMZ6dHlUhNJW4GdIVWSa4j
         fCP2ScM5ZeQpUuc0AMn/W2rRaUwGIdGx/0whcNG9b6IWc31qo6toD4kpeeXrXYyWBtfR
         uz3Ms8C9fK2EfVgYwLPbwbEoxyd2OnjmKBcq00QNkmrprJEWMyeq5cpSKv+TfFXgoakZ
         w5aWlRWDgOJ7s7Q+Am9ugmZnRWooX3H2iMIxxq8PFfquUEkPYmXSlorlCjYNeiyP1JWR
         2zQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=lBVO0qEU2faM0gD6ewraTVSXmmJcOKVki3ONe0McDq8=;
        b=HGI4vMmLO7F8PzhO+xfsZ/IUUShUi6mdaZV82WCszYjn5VyL0AVe+My0VbyUR9Kohc
         t6Ug9ZznzzM58uhU+GUIu5gnl2nfLPEnrPb+yq0AXmgDItOSNGkRdE5u2ZRXbH6ZU8I0
         hFAIxuVdC00TAE6RHGazjdtulzfgeu2a2z862ZTpoSDC3Q0fy0xyBOJKYFCxGX9dT2pr
         nL/FrKBBCmneXP23WS5+OOgQCwgTqnjEL6/ZDPhXPmNjRDCKWxF8gzgJfmzJOFaO7W+D
         tV+7BVVkfjp1vXfjmAKtTHg5J61qf3VjeLhIzLmCk5d5agA/YUTR1Wp0AzGTagiV0+E6
         KkXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u129si16151771yba.233.2021.09.26.01.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:58:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPzu-0001V5-9B
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnc-0006DT-ME; Sun, 26 Sep 2021 04:46:18 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnY-0002bf-QC; Sun, 26 Sep 2021 04:46:16 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HHK8w3Nxbz8tR1;
 Sun, 26 Sep 2021 16:45:20 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:09 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:07 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 10/14] machine: Tweak the order of topology members in
 struct CpuTopology
Date: Sun, 26 Sep 2021 16:45:37 +0800
Message-ID: <20210926084541.17352-11-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
X-TUID: y/IvculwB+MC

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

