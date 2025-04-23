Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2985214njd;
        Wed, 23 Apr 2025 05:07:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9R37iyobPzwc4RILmYMd+ocYg8Q0tBCoyl9Tbg3qgLO7mpCvlzZZgkV8XVdGiYktavDLCiee04fTnXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFjatZ8Hzgvv688CVkDt0dxqJMT91MIAKAoCVMS4sVHBqJfDgsPE9A4YvmP7o4OcWEH9I9w
X-Received: by 2002:a05:6830:d1c:b0:72a:3a7:a07c with SMTP id 46e09a7af769-73006227511mr11368191a34.13.1745410037284;
        Wed, 23 Apr 2025 05:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745410037; cv=none;
        d=google.com; s=arc-20240605;
        b=dGJSP2dSr6AgqSd93AVi9CWUVTqJofm2a8WEPULKl5v2siQvPOsGaHBqgv/lOQ54nq
         FOTanuZ3gdgN1ss3r8dwEZNanelbUqy3C2eEdufGFzaJwr9AK9Y1NXDVTDU6lY7cWqeG
         +OsFf1KcVGQdxv/yjNRqdgbxQG8rlDavbJT8SCYH97j7sVPHAmjkKY9+6imwHmZezUIe
         Zg+uKYolEH9z9RXZqh+7gw5Ng0/8TAxaiuelpomGflpiC6ykUN+YfZPgbH/PoomrJWCw
         CjvWE+7icGrkL3B9Ngw6/oGOkst11GaHk2h+xgvKYU+RtHbr40V2NvIygSjE0M+DnB8y
         H4Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=c+qL0sTrMB26zTdxkAOihmV73h9govN806MgC8wuFIg=;
        fh=iB51S8I7QmchTsaekNVL8oqE3kB8JUH5eJccl5sOqHU=;
        b=hpRd46DOGi+W8deYulVDeSlEe3n25os49Fm0IxQDQkFSKAucY3oX5ZhIxUvXJtUwiA
         o4FvdXcmat2jZMB5RR4SriGABv7pv6RxyzMWZBwGjj5uZYTN5HmZisFgE22V82QOSgMy
         7js/7CsztzBZjuxrgCGUhlkxjtSxS+NmfYfT8VR/pgDJDmBRBhxfbw4EB38ZdkCIlggS
         cZ/R3ZjO/MMnAbMNt/SDQoJK9grYKdKP54mYVG3ALO90MTJOOKcM6dA9mqWQfwp57TDU
         KZwku5Zy/a4tzUBPns0ytqshLeB7zTwuI1gHKZgDIlohBusobLlezjnG9AoCqs4b6RCJ
         OeBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 46e09a7af769-730047941dasi5907636a34.2.2025.04.23.05.07.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 05:07:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7YsO-0006ik-94; Wed, 23 Apr 2025 08:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7YrF-0006X7-1K; Wed, 23 Apr 2025 08:05:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7Yr9-0000Mg-Dn; Wed, 23 Apr 2025 08:05:37 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZjHkp70Byz6M4jC;
 Wed, 23 Apr 2025 20:01:22 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 600F51402ED;
 Wed, 23 Apr 2025 20:05:32 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.28.126) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Apr 2025 14:05:31 +0200
To: <qemu-devel@nongnu.org>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v9 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Wed, 23 Apr 2025 13:04:52 +0100
Message-ID: <20250423120457.1042-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423120457.1042-1-alireza.sanaee@huawei.com>
References: <20250423120457.1042-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.28.126]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yBW8qVKNQaSg

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79da9..1405506594c2 100644
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
2.34.1

