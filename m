Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5344264lfk;
        Sun, 21 Nov 2021 04:27:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxh6g035Dafc2ctN9McEzdzvj/aNa+uVJQkhd8furq5i0pLBt1Jq5J+bYb0BMIDfO2HTAA
X-Received: by 2002:a05:6102:a2f:: with SMTP id 15mr33977137vsb.55.1637497659318;
        Sun, 21 Nov 2021 04:27:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497659; cv=none;
        d=google.com; s=arc-20160816;
        b=Ac46jjCNfaeu4wlMJLd++0Z73otoE7RDQ8w/kMONVij9DnSr40bbspGD2YaJWLJKsu
         rHup66D8dwkZvyD5oCIw7c0JyE3NUkr3q40EU1+cZk2ZBckpKAG7aEYQ65TmnWKPwD8I
         nA8CWOvISCFmcP/fqPtB6L4pUE9e+M19mnGV5Co84T5pfIiuHQVl0/CGulbgT0RiSAOy
         6mNNwIRKSgraoHuuaADQseRwA4ubAj3I56gVyLanVXKxBxRpdwoiCEQDr4nfv/Po71E2
         r9Z1iSgHEkvytC6go7UWENtW2Tz/Mrud2dYFjV2GF4NdK3zuUD+CKpmjis7S30/LNQaW
         K2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=D11uErHDWrQ5VhxDO3SN2n1bILC2nrof1TU5WeVD6LI=;
        b=t26qXYWtFbrIXV2mZ9C3CkMt9tfSl7f2sjtkTaQfLVchDbVVdNQKHaT7qR3UINLCvk
         GJQWKUDdHWxKL72fXs+ji8gmIf0Os2delpruwYHX7rZkR19OPRGZhrABlAIxtf+Nq0By
         K3hKr6/4e3YUM/Jqf2U2MIVdDiGuP5sv6P7UI3EYHAZ6C7ObwZcIT4Oi6L8f5K4yMJsl
         qPXA1FscTWfSYggpsxDWeyn1M402VfTFdukUuOroP9bnj1Bd3nSfqUc2RJvNkVDt7FgR
         3o8hDt8c1ur9BN1BjGMatDiiDwsrOagKbWmCBk/x998LnLbjjv4pgVjs8/O94uVMybVZ
         O9eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u30si15968352vsj.141.2021.11.21.04.27.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:27:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:56632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1molwY-0001O7-Nf
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:27:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluM-0003pE-R5; Sun, 21 Nov 2021 07:25:22 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluH-0005lb-Sp; Sun, 21 Nov 2021 07:25:22 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HxqH002M5zbhph;
 Sun, 21 Nov 2021 20:20:12 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:09 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 03/10] hw/core/machine: Wrap target specific parameters
 together
Date: Sun, 21 Nov 2021 20:24:55 +0800
Message-ID: <20211121122502.9844-4-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: cvRFFYHpVV5s

Wrap the CPU target specific parameters together into a single
variable, so that we don't need to update the other lines but
a single line when new topology parameters are introduced.

No functional change intended.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/core/machine-smp.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 87ceb45470..2a3f16e52b 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -77,6 +77,7 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
     unsigned maxcpus = config->has_maxcpus ? config->maxcpus : 0;
+    unsigned others;
 
     /*
      * Specified CPU topology parameters must be greater than zero,
@@ -109,6 +110,8 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     dies = dies > 0 ? dies : 1;
     clusters = clusters > 0 ? clusters : 1;
 
+    others = dies * clusters;
+
     /* compute missing values based on the provided ones */
     if (cpus == 0 && maxcpus == 0) {
         sockets = sockets > 0 ? sockets : 1;
@@ -122,30 +125,30 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
             if (sockets == 0) {
                 cores = cores > 0 ? cores : 1;
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * clusters * cores * threads);
+                sockets = maxcpus / (cores * threads * others);
             } else if (cores == 0) {
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * clusters * threads);
+                cores = maxcpus / (sockets * threads * others);
             }
         } else {
             /* prefer cores over sockets since 6.2 */
             if (cores == 0) {
                 sockets = sockets > 0 ? sockets : 1;
                 threads = threads > 0 ? threads : 1;
-                cores = maxcpus / (sockets * dies * clusters * threads);
+                cores = maxcpus / (sockets * threads * others);
             } else if (sockets == 0) {
                 threads = threads > 0 ? threads : 1;
-                sockets = maxcpus / (dies * clusters * cores * threads);
+                sockets = maxcpus / (cores * threads * others);
             }
         }
 
         /* try to calculate omitted threads at last */
         if (threads == 0) {
-            threads = maxcpus / (sockets * dies * clusters * cores);
+            threads = maxcpus / (sockets * cores * others);
         }
     }
 
-    maxcpus = maxcpus > 0 ? maxcpus : sockets * dies * clusters * cores * threads;
+    maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads * others;
     cpus = cpus > 0 ? cpus : maxcpus;
 
     ms->smp.cpus = cpus;
@@ -157,7 +160,7 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     ms->smp.max_cpus = maxcpus;
 
     /* sanity-check of the computed topology */
-    if (sockets * dies * clusters * cores * threads != maxcpus) {
+    if (sockets * cores * threads * others != maxcpus) {
         g_autofree char *topo_msg = cpu_hierarchy_to_string(ms);
         error_setg(errp, "Invalid CPU topology: "
                    "product of the hierarchy must match maxcpus: "
-- 
2.19.1

