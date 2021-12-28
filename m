Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6327485lfb;
        Tue, 28 Dec 2021 01:27:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSkB50NM1Hs9RDnyiDnz2ksAxyb6A8jrUfVbhUGpXoSqrgjiRUL/X9KHv1qY/9UWUybopX
X-Received: by 2002:a25:4188:: with SMTP id o130mr6790328yba.271.1640683623483;
        Tue, 28 Dec 2021 01:27:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683623; cv=none;
        d=google.com; s=arc-20160816;
        b=lz5d+GsPQExlI8CIEQYsiZtXUbgksqLiJh4aaGNtFPHc/4JGMPyVMRvzmS80KsK5Zm
         mYnHBtFxSPGiAuvvX1aJ5AWNjlykQLKY4tYy6kzrxyIoYIuTmxjDWvn2/xpBxVe8xdCo
         b39oo1fCloaH322zlHUjkFgvdodNjgbg1xK3U7/71OvxoOL8cxst+kLjluwGr/jaEkal
         RkfJcLqGW+vxRX82J2vF1QZgaCelryy/N9bCgktP7Mu+XiNDk14somwKpn7xeONuMid0
         0kTbzp6xCnfiutGa2Plj8qLW0On76SRsW1VnUyOVwloMNjN57/Ctn678mZrBl1Ycve7S
         r1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=3BSCFPbDOFWq7WxWqZk1AiMu3ceT79C8O+zOs8UxJsI=;
        b=tlpWlfWU9Is6fPsX6llB2RhjUU7W9HR8Hft7YWnBMC9TVF2V9gbeFmsMMJ8tkr0BdN
         GuT5hA0VTW0gf2EMtlCW99ZZD0RQ4DfGdEFD561gGEHNkjNAq1nW5Z2Y/UnEtuYPaKMP
         K4K2Bxt0DuyZ4s7f6gSgVbD8fEMVI498k5GluD0Gi12RjHNhByOqxfCXYaS4o7z9Px5G
         T3leGZkSDdvJ/3eV1kfHgMYvy9RMv/nBp7nH8PgpGi1WdnP4uRDwbb7hmp0NzUgCNmeS
         sRMgM5LMYDYR7rVKh6oFnyEC+iQUzF3OPpTm9sS+rL3Ckhp+sE+L0LdRzt4tPfkqe8NN
         cOfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n184si15821552ybn.210.2021.12.28.01.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:27:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28l4-0007Lx-Tg
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:27:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h3-0007g1-KD; Tue, 28 Dec 2021 04:22:53 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h1-000798-PS; Tue, 28 Dec 2021 04:22:53 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JNTXN02MHz8w5h;
 Tue, 28 Dec 2021 17:20:20 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:46 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 05/14] tests/unit/test-smp-parse: No need to explicitly
 zero MachineClass members
Date: Tue, 28 Dec 2021 17:22:12 +0800
Message-ID: <20211228092221.21068-6-wangyanan55@huawei.com>
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
X-TUID: 14Ti8sVaKFBo

The default value of the MachineClass members is 0, which
means we don't have to explicitly zero them. Also the value
of "mc->smp_props.prefer_sockets" will be taken care of by
smp_parse_test(), we don't necessarily need the statement
in machine_base_class_init() either.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 tests/unit/test-smp-parse.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
index 331719bbc4..72d83d1bbc 100644
--- a/tests/unit/test-smp-parse.c
+++ b/tests/unit/test-smp-parse.c
@@ -523,8 +523,6 @@ static void machine_base_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->smp_props.prefer_sockets = true;
-
     mc->name = g_strdup(SMP_MACHINE_NAME);
 }
 
@@ -534,9 +532,6 @@ static void machine_generic_valid_class_init(ObjectClass *oc, void *data)
 
     mc->min_cpus = MIN_CPUS;
     mc->max_cpus = MAX_CPUS;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
@@ -546,9 +541,6 @@ static void machine_generic_invalid_class_init(ObjectClass *oc, void *data)
     /* Force invalid min CPUs and max CPUs */
     mc->min_cpus = 2;
     mc->max_cpus = 511;
-
-    mc->smp_props.dies_supported = false;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_dies_class_init(ObjectClass *oc, void *data)
@@ -559,7 +551,6 @@ static void machine_with_dies_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.dies_supported = true;
-    mc->smp_props.clusters_supported = false;
 }
 
 static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
@@ -570,7 +561,6 @@ static void machine_with_clusters_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
 
     mc->smp_props.clusters_supported = true;
-    mc->smp_props.dies_supported = false;
 }
 
 static void test_generic_valid(const void *opaque)
-- 
2.27.0

