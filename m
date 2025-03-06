Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1282445njm;
        Wed, 5 Mar 2025 22:05:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXW32ALl2HqXflUcN9KBSHe4/X2JZY3YKcRzE2OtkBXycTMw8ssmpcuRvbsAOWJTP+Ei5HSUvMtRZodcw==@linaro.org
X-Google-Smtp-Source: AGHT+IEdhGr6rmsPsDWu/xj1TWlqYyepx4UEa9weL/6r6T+nZ8eGvC6lkUZVGFjDCIzVSZkwqZaq
X-Received: by 2002:a05:620a:6190:b0:7c3:9e49:c55a with SMTP id af79cd13be357-7c3d8e250e7mr986174685a.9.1741241103870;
        Wed, 05 Mar 2025 22:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741241103; cv=none;
        d=google.com; s=arc-20240605;
        b=aSW+b2NEj1JJPQk3/+wQEXCEUEm9TP0V99dT8RZ3FaOemw7ycG322jzhAYZxA6+ZQo
         SkAnpz/Tfsb+ANWER9x/c8xN6NIAx1XglfRIA+z8ni0Mt9dCII+hg6f1nn/lNf2HJcPi
         nSzuMfgGv5mNdJas9QLTNlucaLyCfeuTmFBNbW2p3I3YjXNCaLa9ZB++TUixATGhbbhj
         EvM3BNIVgizYTAu2+SLgGwgHYZ2gC0nUa5HsNgihszie11phJrP2sAkBRoVFTnJOxMVL
         omWddh7Y6p9RPDeTQnw1vVXKxdLG2ZLRvYjOv/BN2AfY5KzDvYfLgEU+p2g5/a/qc8M/
         +Q9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/B0LH41rGXaDKJHoyfXvIhVQFb95sBQeE1fhfGSHocU=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=NGGKoDfRsP+8gNz0Moouyt+hiH1Tq8gjByrRbTmbLl5w6xfyP4vXSxsMwMAG7KXHqi
         AjxAju+rwu9Br9nFneB3Iye565EE2RU4HCZ7WKKV8LyM69b76ZrrRX8Mv2fU40cWKObi
         /SATIvJ/nN/8OU64kC7bYpB1dhRzN1oCAXycRO/qHjJRWZJsKZxfYVxIweZljUQVynFQ
         M3GJ58KqNm+c/dTaDIdjWLe/xddp8OToQJJDZxD0ZZBStqNqlvuF7v9FJzuM0zaMnnMX
         /mon3FkYsv+UwFxZDLQ187xusiPU9MwWNxpV/9y5H+jegYKuOK/6DzD9y632maQVABGR
         pJww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e551d082si64563785a.442.2025.03.05.22.05.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 22:05:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq4LZ-00018w-Rn; Thu, 06 Mar 2025 01:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4LY-000180-DX; Thu, 06 Mar 2025 01:04:40 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4LW-0001h5-Ox; Thu, 06 Mar 2025 01:04:40 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z7f0W6qKZz6L55q;
 Thu,  6 Mar 2025 14:00:27 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 885D51406AC;
 Thu,  6 Mar 2025 14:04:36 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.96.233.98) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Mar 2025 07:04:31 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v7 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Thu, 6 Mar 2025 06:03:47 +0000
Message-ID: <20250306060352.907-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306060352.907-1-alireza.sanaee@huawei.com>
References: <20250306060352.907-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.96.233.98]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bL62KsesnQ0z

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79d..1405506594 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    /*
+     * Expanded cache set
+     */
+    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    /* 1MB L2 unified cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
+    /* 2MB L3 unified cache */
+    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
+
     /*
      * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
      * to because we started with aarch64_a57_initfn(). A 'max' CPU might
-- 
2.43.0

