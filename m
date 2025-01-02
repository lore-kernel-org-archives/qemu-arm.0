Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9615275njk;
        Thu, 2 Jan 2025 07:21:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUGygWH/8bRzwZ7cV1nwY3BSstG8VRcr1sS2Fn4/QlIRlNB8o0xour5DJsrmId9YIOie+6tdvKJtX8NLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFljdVhXmuh6JLwgnKqHUismeOdVigj9IQJcavkePzb8xGm/zqaPAPaPbJOCBTW8NZjk8Ed
X-Received: by 2002:a05:6214:124c:b0:6d8:b2f2:bcb8 with SMTP id 6a1803df08f44-6dd233207b0mr665427086d6.8.1735831269992;
        Thu, 02 Jan 2025 07:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735831269; cv=none;
        d=google.com; s=arc-20240605;
        b=LAZeDHPZc2XQhtDfxmLNtAJKBEtg/OruW4+VUI/y7Al7CKf1jFWPbsweKuXcg6TBRL
         COnHDKhu+nC/brq2S8a+x/KW1f27FtVEQZEI9quM5PCoYUsODmONWyaKMTRIcH3HjGfq
         QxGGWABkcmnGN5NzTrH1+lD0SHlJH/6diTWh29HUJyThijySjWAGG59coUN1/e/KFNig
         7WgVhJkd1aSqEgBJunev638Y2ek3M65sjhHVxC05T1fqdYvGU8J5D0ZpR1XwkThq2J2M
         4NiwiFmZu8TZrzYoqeA3tWtnyDHoNbD0HKKAhOT2/xqyrD6yBUgnkjid6tuC202bwGYz
         X5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=y7WfmvUQyFsZaAiynCJPZg9yiunHbGv5puqcXrNH1hY=;
        fh=3SOh7oRf8ZAjcQS1l/R73yHW85MB7PHhEzRWSpnyrno=;
        b=WjbYZY+5aW+/gKZkWOpUFAtxSbNNOHMMIiRhKwzeQGOMjXcHXWJcC9xkHQg7HJxQaj
         yleeLF3iZohPy0r6uiwqEdvNOPNaBr4u4jbk0DnNo+bIWe9Li+USDUGk7IxogF8xbJ5A
         325BVimiBnxBUrGEOzX3meIwGf3MJKKY+QV5h3+ddg3kTvWcNP7iHPZaRlh0WJR2Yh1F
         nWMHmWzU4wQw1fM9UNS6udijXIMT4t2zmELbADVIo3bMdUCq3R56ZbDyJIc+yYBwTaYm
         HQhv48TYKHLBUhfyC/ukSMYG5qmGbC9bqOeURDRi0wP9X+Y+i+WJOTDoRzAnoaHExvyT
         kchw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18253411si341443746d6.340.2025.01.02.07.21.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 07:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tTN0P-0000tp-G3; Thu, 02 Jan 2025 10:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN0J-0000pn-5g; Thu, 02 Jan 2025 10:20:55 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTN0H-0008Cv-Ni; Thu, 02 Jan 2025 10:20:54 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YP9PG29FWz6K739;
 Thu,  2 Jan 2025 23:20:02 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 590B81401F3;
 Thu,  2 Jan 2025 23:20:51 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.73.182) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 2 Jan 2025 16:20:50 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <robh@kernel.org>, <sarsanaee@gmail.com>
Subject: [PATCH v5 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Thu, 2 Jan 2025 15:20:07 +0000
Message-ID: <20250102152012.1049-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102152012.1049-1-alireza.sanaee@huawei.com>
References: <20250102152012.1049-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.73.182]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: PTI0zcVY82Ad

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93573ceeb1..9434804061 100644
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

