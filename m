Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2797841lfp;
        Sun, 26 Sep 2021 02:04:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx82NydeMGaWsFtv+ZZwKT8mjvectGK6fWGnHnpauKXzlGVG1emsYqmNgEsj04TUdtjdE4t
X-Received: by 2002:a9d:725e:: with SMTP id a30mr12160254otk.183.1632647065924;
        Sun, 26 Sep 2021 02:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632647065; cv=none;
        d=google.com; s=arc-20160816;
        b=CBrwt4EnS5kxRhLHFDReLYJ7ndQRO40GVUccHYwy2lY3YopuqQqvgftTgyDMFrL0U2
         xJYliRrmyvmtFqAOLckBxQ7hzsMkTV54e9LneZnqeqKL2CFwKsx1z3LMGZcZgC7q1kss
         7mCROnLOTQ48kZ+ZJaCmNJZYuYSPQYtPa8gvooSk40ZRKkIY23QBnuFOxyWSYdLh8+nH
         ubP5EJ2Blk5WPBUlnvXZcQk3Wip+zgkoKBH77mnZastQL8suql293qvR9vy+u7s866jn
         WGvqg/HKO/UE8F0GECONsA+AixRMKAuXxL5HsYqPWmexNeRZ0AwUjtg94ILDKA2ijqVa
         MA3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=9KeAZmBCxrtzwv2leMoxDuvudEGvwYLWFjhNISJsXGE=;
        b=AWRNkPUAiBLWYaurPA29XAHmeiJReLaDhA9XkDH/MbZFdo/RwY+5bqfyoHr8lJvasS
         zeMZqSHs9172eC6SnxeCM2SyqhIEblQBMGAc7BaxNZDmoXhF2eYFs9ZcMFmRTWIoJIsW
         d7csjMOPuG7D72K2a0rSx6EMWnXOewF30aIjSzmmuthKmA+JPTJFH0CVtscX9b+KQ6kH
         uyaSdGo41miAaPmSYcfSeLUMwMf+7tV8lXodlPbmGmcP9lf/6Ep8UKcxl1QFfJI+SJB+
         /8HJFRB7v1XaFdBDJLdEIVL52mox83V1lQJU0mm7HIyiaUjYfjy3lBplyVQZL6QxlnTY
         2pJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n126si712022oih.151.2021.09.26.02.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 02:04:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUQ5B-0007YX-76
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 05:04:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPng-0006Fy-3P; Sun, 26 Sep 2021 04:46:20 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPne-0002gO-2b; Sun, 26 Sep 2021 04:46:19 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HHK8W1XG6z1DH3Q;
 Sun, 26 Sep 2021 16:44:59 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:14 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:46:13 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 14/14] machine: Put all sanity-check in the generic SMP
 parser
Date: Sun, 26 Sep 2021 16:45:41 +0800
Message-ID: <20210926084541.17352-15-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210926084541.17352-1-wangyanan55@huawei.com>
References: <20210926084541.17352-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pN5u6rKJHYOs

Put both sanity-check of the input SMP configuration and sanity-check
of the output SMP configuration uniformly in the generic parser. Then
machine_set_smp() will become cleaner, also all the invalid scenarios
can be tested only by calling the parser.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
---
 hw/core/machine.c | 63 +++++++++++++++++++++++------------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1bdeff32b3..5b62ba7e34 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -813,6 +813,20 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
 
+    /*
+     * Specified CPU topology parameters must be greater than zero,
+     * explicit configuration like "cpus=0" is not allowed.
+     */
+    if ((config->has_cpus && config->cpus == 0) ||
+        (config->has_sockets && config->sockets == 0) ||
+        (config->has_dies && config->dies == 0) ||
+        (config->has_cores && config->cores == 0) ||
+        (config->has_threads && config->threads == 0) ||
+        (config->has_maxcpus && config->maxcpus == 0)) {
+        warn_report("Invalid CPU topology deprecated: "
+                    "CPU topology parameters must be greater than zero");
+    }
+
     /*
      * If not supported by the machine, a topology parameter must be
      * omitted or specified equal to 1.
@@ -892,6 +906,22 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
                    topo_msg, maxcpus, cpus);
         return;
     }
+
+    if (ms->smp.cpus < mc->min_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.cpus,
+                   mc->name, mc->min_cpus);
+        return;
+    }
+
+    if (ms->smp.max_cpus > mc->max_cpus) {
+        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
+                   "supported by machine '%s' is %d",
+                   ms->smp.max_cpus,
+                   mc->name, mc->max_cpus);
+        return;
+    }
 }
 
 static void machine_get_smp(Object *obj, Visitor *v, const char *name,
@@ -914,7 +944,6 @@ static void machine_get_smp(Object *obj, Visitor *v, const char *name,
 static void machine_set_smp(Object *obj, Visitor *v, const char *name,
                             void *opaque, Error **errp)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(obj);
     MachineState *ms = MACHINE(obj);
     SMPConfiguration *config;
     ERRP_GUARD();
@@ -923,40 +952,10 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    /*
-     * Specified CPU topology parameters must be greater than zero,
-     * explicit configuration like "cpus=0" is not allowed.
-     */
-    if ((config->has_cpus && config->cpus == 0) ||
-        (config->has_sockets && config->sockets == 0) ||
-        (config->has_dies && config->dies == 0) ||
-        (config->has_cores && config->cores == 0) ||
-        (config->has_threads && config->threads == 0) ||
-        (config->has_maxcpus && config->maxcpus == 0)) {
-        warn_report("Invalid CPU topology deprecated: "
-                    "CPU topology parameters must be greater than zero");
-    }
-
     smp_parse(ms, config, errp);
     if (*errp) {
-        goto out_free;
-    }
-
-    /* sanity-check smp_cpus and max_cpus against mc */
-    if (ms->smp.cpus < mc->min_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The min CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.cpus,
-                   mc->name, mc->min_cpus);
-    } else if (ms->smp.max_cpus > mc->max_cpus) {
-        error_setg(errp, "Invalid SMP CPUs %d. The max CPUs "
-                   "supported by machine '%s' is %d",
-                   ms->smp.max_cpus,
-                   mc->name, mc->max_cpus);
+        qapi_free_SMPConfiguration(config);
     }
-
-out_free:
-    qapi_free_SMPConfiguration(config);
 }
 
 static void machine_class_init(ObjectClass *oc, void *data)
-- 
2.19.1

