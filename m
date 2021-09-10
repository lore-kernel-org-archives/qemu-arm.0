Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp907982lfb;
        Fri, 10 Sep 2021 00:32:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9l+GwSYVw8iOGHVSYgTMRys42hrM9nfk5WuU1NV0OfB2EOUYV2fpvYdGqGR9/e/3poL1C
X-Received: by 2002:a5d:9bcf:: with SMTP id d15mr6250845ion.88.1631259149165;
        Fri, 10 Sep 2021 00:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631259149; cv=none;
        d=google.com; s=arc-20160816;
        b=HPC92N0muGAcZQs6iC/uH5Xo/axFRZaZypdV+c6GX7UMpbRVP8OfBDeLnKGIXx9DJI
         Tp2ONiNs9IfQeEYGDzPVcjaTuSuADCNlGMHfIv9B7ZA0r90kIRogA/7fMkdUbyZaEFxc
         USe6o4XPOsLHQDK4Q2U62uAdQc4a0pCVDn+OXhSTHZT2Zq0g79JGxf5j0/s9xd3tFal6
         5E9rRAGhgVzBIhcrj412DNKKYLEVKRPCfK5Z4OZrdbgOr4vu/ek0VGW+Ziu4NxnzqMWR
         3Pjff+QabSJreDNFOJRX9aIRMyCwxgCMNY5dmRe+P4EGhlPJu3LBKNnha5YOiTpGBwTf
         g8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=0k9+laBRl6MrkBBmvz/S/B1WtL8SMJYgxUvmyibrNmM=;
        b=Av+wEYIrvSnRP7Ksw6ihUnODP+uCaScfaM2GQ2kt20r3V3pBKN+WI7C5roIDhOpVmn
         gf+DZC1uv+1wbQtC1pQSU3AqmDh6SxxIMNJJQAthN8adQnbEHdSyxB6LHYK91BEDg5x5
         Q9fd3MG7CIA0W0wfyISm8+t4brF08GXCRF6pDOHkkgRRh/nTmNGhPZDJ/D+qrElxoRQc
         wOzv3jSo3CDaFdwUgpzI4Sfuza0KLjI9flY9s+KWgKBrcsf3B+/8bYoLTCzY0OPkyU6L
         Wr87O4TGKmP6nSVgQuK7tGqi2R1rrrdN6clOcJKosAllYsAwto91MKaZCTLp5zectCSy
         cZhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si4599868ioh.98.2021.09.10.00.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Sep 2021 00:32:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mOb1Q-0000FL-Cu
	for alex.bennee@linaro.org; Fri, 10 Sep 2021 03:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazx-0005PW-31; Fri, 10 Sep 2021 03:30:57 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mOazu-00015q-RB; Fri, 10 Sep 2021 03:30:56 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H5SFK1dC8zW1vp;
 Fri, 10 Sep 2021 15:29:57 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:48 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 10 Sep 2021 15:30:47 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, 
 <qemu-ppc@nongnu.org>, <qemu-s390x@nongnu.org>
Subject: [PATCH v9 14/16] machine: Put all sanity-check in the generic SMP
 parser
Date: Fri, 10 Sep 2021 15:30:23 +0800
Message-ID: <20210910073025.16480-15-wangyanan55@huawei.com>
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
X-TUID: SQ0hqakPzXWl

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
2.23.0

