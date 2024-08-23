Received: by 2002:a17:505:1116:b0:1be9:327d:8ee3 with SMTP id pu22csp169734njb;
        Fri, 23 Aug 2024 05:55:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXE0YEnQgCZap/ypJffSmdoQU6vashrUA3SULlMbBi3Ojr1jNh0ptTOIyDI6xf6828oCYb46uhK462Vsg==@linaro.org
X-Google-Smtp-Source: AGHT+IHGzTmRMm5zAOGGMXe/zTfeHMu1t9nt0t1QbK/AfdZaa1MuSY7yt942umURI4yHuQDFCN1Y
X-Received: by 2002:a05:622a:1e90:b0:453:7634:bbfa with SMTP id d75a77b69052e-45509c1bd33mr27152831cf.21.1724417749764;
        Fri, 23 Aug 2024 05:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724417749; cv=none;
        d=google.com; s=arc-20160816;
        b=FD2z49b3nACkRlJczUB6R72+0q6gswhbcIe1QzHDouSFUgylYUbJc8Jc9Vkil/9KsO
         zjRHag56DXnjv/0OxSVJ+QUmNZPV//E4kRHu1tWgzIuNlfDt9lPr/7yq25C4Ttc5guG+
         Vmc+MQyn3C4lxugV2bHKS0k63dXZ/1S2X33LdIyQKWubG83/KMdsu0Lv7V55OmG25FEN
         kY05jpCraHzrhnrmmoHiyJ6G/ZswDIhbW0nK4xHfin05fU/swzceWHckgpOhOdyf8bsX
         aizTJV/1wJNdrCTMrW/b5/G4bI7Wc1g7HJw0TLb3bH6vY/swBTz04EH1elVwyQOBEk96
         a8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dZ8SDUosSEgaAhh3RkR7aaVS1/GJohf/rFlRTMpfdLk=;
        fh=FkJWaune7hMuK+jemAGcJmHRm42IOkVpZLD1KexBaC8=;
        b=NsVvq5bruPK9UB2kICDyDXiVI+Q9/26JwcN1uaCXKsuRRoQGZkHa1Uv+TEfyb+sXA0
         Coj0uQRbqbVrqKkNYA4ryJpn6YRv1TwwY+g/hkZrnhvr5B3rZt2DadQ4+9SZnuxhw6na
         Y4A+EIhCq6J2chs3KqRJPib9gDxbsjbWFquYEhfKU0aU58EQJvynCH5AgkRxC4ZEnELC
         R203lFjkAg7TBK7psrqq8f4PgeGL3TLSVwuABXkrDJmC3c67+D8yXKkbT3ckkpzsT2By
         xpS4TIPe30E5+ZPkHIkNFLknqmD0oMFjnK73wchnOh/6CW/mM2Cr4HtqnGD4QhBZXKBH
         q83A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-454fe0d2ccasi41261771cf.25.2024.08.23.05.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2024 05:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1shTpF-0007Bx-RF; Fri, 23 Aug 2024 08:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1shTpD-0007AH-Ab; Fri, 23 Aug 2024 08:55:31 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1shTpB-0005Aj-Ov; Fri, 23 Aug 2024 08:55:31 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wr0Mf5PQlz6K918;
 Fri, 23 Aug 2024 20:52:14 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
 by mail.maildlp.com (Postfix) with ESMTPS id 9E73A140B2A;
 Fri, 23 Aug 2024 20:55:23 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.79.211) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 13:55:22 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>
Subject: [PATCH 1/2] target/arm/tcg: increase cache level for cpu=max
Date: Fri, 23 Aug 2024 13:54:45 +0100
Message-ID: <20240823125446.721-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240823125446.721-1-alireza.sanaee@huawei.com>
References: <20240823125446.721-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.79.211]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500006.china.huawei.com (7.191.161.198)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BRvkm9sQJJyZ

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function. It introduces three layers of caches and modifies the cache
description registers accordingly. Additionally, a new function is added
to handle cache description when CCIDX is disabled. The CCIDX remains
disabled for cpu=max configuration.

TODO: I am planning to send a separate patch using this cache
description function for the rest of the CPU types. This is a
starting point to test L3 caches for cpu=max.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 target/arm/tcg/cpu64.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index fe232eb306..f2b6fb6d84 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -55,6 +55,32 @@ static uint64_t make_ccsidr64(unsigned assoc, unsigned linesize,
          | (lg_linesize - 4);
 }
 
+static uint64_t make_ccsidr32(unsigned assoc, unsigned linesize,
+                              unsigned cachesize)
+{
+    unsigned lg_linesize = ctz32(linesize);
+    unsigned sets;
+
+    /*
+     * The 32-bit CCSIDR_EL1 format is:
+     *   [27:13] number of sets - 1
+     *   [12:3]  associativity - 1
+     *   [2:0]   log2(linesize) - 4
+     *           so 0 == 16 bytes, 1 == 32 bytes, 2 == 64 bytes, etc
+     */
+    assert(assoc != 0);
+    assert(is_power_of_2(linesize));
+    assert(lg_linesize >= 4 && lg_linesize <= 7 + 4);
+
+    /* sets * associativity * linesize == cachesize. */
+    sets = cachesize / (assoc * linesize);
+    assert(cachesize % (assoc * linesize) == 0);
+
+    return ((uint64_t)(sets - 1) << 13)
+         | ((assoc - 1) << 3)
+         | (lg_linesize - 4);
+}
+
 static void aarch64_a35_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -1086,6 +1112,15 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    /*
+     * Expanded cache set
+     */
+    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
+    cpu->ccsidr[0] = make_ccsidr32(4, 64, 64 * KiB); /* 64KB L1 dcache */
+    cpu->ccsidr[1] = cpu->ccsidr[0];                 /* 64KB L1 icache */
+    cpu->ccsidr[2] = make_ccsidr32(8, 64, 1 * MiB);  /* 1MB L2 unified cache */
+    cpu->ccsidr[4] = make_ccsidr32(8, 64, 2 * MiB);  /* 2MB L3 unified cache */
+
     /*
      * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
      * to because we started with aarch64_a57_initfn(). A 'max' CPU might
-- 
2.34.1

