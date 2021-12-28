Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6327769lfb;
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxz059RzhVwa8bR1AEJnULBSJw6seuV1RaUHwFG+GvmBgOS+wszauPng17b+seF6CEwiOqX
X-Received: by 2002:a25:6604:: with SMTP id a4mr7287418ybc.399.1640683656521;
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683656; cv=none;
        d=google.com; s=arc-20160816;
        b=IBlguVSl02n1v2hi0je9LKkZICudfB6+rnmyHBOllAyR9pV2LE0FYpTLTxwGhF4i6p
         weYfdICGMSyBCvSNFeRMzhLpPrGXY9PavVNHGNzlmOq/ERytKcYvksT9FKuuzTblg/p7
         V1ewhLIuB24mWXoMEwAH4xs1XznmA2jGcOKaiKF1tkk/B5YS6AlB0c3Kwxa2TtmlHjz/
         yT8TClJrjFEhF0TELswK6xcgAAELemRf2fq8h6+UlMcZ4vWNREVl0TKaKuT16Nlr4emp
         wRvtrG3oYA4ISpdPzqm+f4zbM/1WrGvR8JoAC6BIVjZxJ4ufoRjHMkLHebFl1iVDWPZ1
         nbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=tMlRwgrRREhKtiXqc6v5UuBkp6a6F/1aIURLphIL174=;
        b=aw7zUxDsIwAjgE9TRTU/09Rp++frqfop8d4zHxfyCC6GidageFL4NTBGHX44H0MMLG
         1z/JUfLCy3bHCwGHostaHtPHrsU8p7ltyMDT3/zYxnHAf5cVDkRXT2t/izEF3COSFIhA
         7QReBbvor9FIgT8ApesDq7IyDNdSKXAy18JCWK1L/nEKAu3OUdbd7pbak53nAjr1FYow
         rExlp8whBwb8/1u93/O/m03CB3rqJp7aBBGplGi9ygXC+7x6VY8UDqTkCjQuHxU6nOeE
         yA2aLutfcU1Nd0CwpTwWbCWzACFamPIuug8VimZ9922Sartcky6KC9Y65OqvTbLI2bJY
         8uEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 185si12455123yby.524.2021.12.28.01.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:49254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28lb-0007u9-VF
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:27:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h3-0007fJ-AL; Tue, 28 Dec 2021 04:22:53 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h0-00079W-VF; Tue, 28 Dec 2021 04:22:53 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNTXP21hKz8w7X;
 Tue, 28 Dec 2021 17:20:21 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:47 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 06/14] tests/unit/test-smp-parse: Keep default MIN/MAX CPUs
 in machine_base_class_init
Date: Tue, 28 Dec 2021 17:22:13 +0800
Message-ID: <20211228092221.21068-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
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
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>
X-TUID: VSs9PEouk2cr

Most machine types in test-smp-parse will be OK to have the default
MIN/MAX CPUs except "smp-generic-invalid", let's keep the default
values in machine_base_class_init which will be inherited. And if
we hope a different value for a specific machine, modify it in its
own initialization function.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/unit/test-smp-parse.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 72d83d1bbc..fdc39a846c 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -523,15 +523,10 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->name = g_strdup(SMP_MACHINE_NAME);
-}
-
-static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
+
+    mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -547,9 +542,6 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     mc->smp_props.dies_supported = true;
 }
 
@@ -557,9 +549,6 @@ static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->min_cpus = MIN_CPUS;
-    mc->max_cpus = MAX_CPUS;
-
     mc->smp_props.clusters_supported = true;
 }
 
@@ -718,7 +707,6 @@ static const TypeInfo smp_machine_types[] = {
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-valid"),
         .parent         = TYPE_MACHINE,
-        .class_init     = machine_generic_valid_class_init,
     }, {
         .name           = MACHINE_TYPE_NAME("smp-generic-invalid"),
         .parent         = TYPE_MACHINE,
-- 
2.27.0

