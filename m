Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1288793njc;
        Mon, 10 Mar 2025 09:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWV9cYIOr63k6ifnK6xja/ofAtK8CbNCfjNlA2s9jU/wf18n5h93YJCTRNH6aYROxrBGXHRtzTia6xHYA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMjhoqM06TMUhSaafT0CFLOG6KtAgzVs62UPxDqwVb1Bma7FSzs0CTRoo7kqSvYdB7xXbd
X-Received: by 2002:a05:620a:86cc:b0:7c5:5883:8fb3 with SMTP id af79cd13be357-7c558839118mr447266485a.8.1741623885554;
        Mon, 10 Mar 2025 09:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741623885; cv=none;
        d=google.com; s=arc-20240605;
        b=gdcCNy2jgiiHFOj8gyWUQbhx0rxIffDptYwc4a8iVniuWDVflqN8U1jYaRuHpxvL+B
         mUQuxMLrqaczTIh+W4QHUZ4wgHNJR533loT1qC5I6MBXMtdarerm5Elh7Cr5oNnlf4vt
         BflKMq03cs/mQFwpbUu6IvO9hWUwgaWK9x0xf9l1fVaDFmk6UX7rSLe4huv4wrGw+jip
         5rGIi+09B+39KTAKysmKyhwhKRQ9f29u4AtNklJnykNPqQSUuYen9e53ZcJVT0N8W72m
         dRa9cdqTQvNGhaRbE6dPGgYdV9bhZ5ntNbioovjR48olCpYGxLytX6dPMnktS2w02rRF
         ENKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=c+qL0sTrMB26zTdxkAOihmV73h9govN806MgC8wuFIg=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=cUXoH7aZtgKyd0WOJTqWcSrFY0W18XsD1USwf1J+FpGP09xI9s4s8yWk/k/W/qLGvy
         paXkn1+nVodLMGTX3HOTZ8H8u798Fj+qWeVlJul9UlG2Z9xGEiP4IYJoVtt8eUVYtXeP
         k1u4b+95T5nlX0cOOWVWt8ettZMh41z5o+RX6o+Sy41NyFTlZubOrYq1FjwFBIiX3AS0
         lWZDx50zHC/iP1uz+ri3nsl2oDGw+68PBS2W5yz8Lc9xG7UCkFs4KJvARxTNB+hoYOfA
         43/hfDHTAreJFWv0Et0LWdpGQrPNvWY9GmqgI3WhuOMd+8vMp7r3n71YcOVeVH4vLiY2
         bvCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c54206a422si479152785a.559.2025.03.10.09.24.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 09:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trfvl-00083x-Hw; Mon, 10 Mar 2025 12:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfve-00081D-RI; Mon, 10 Mar 2025 12:24:37 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfvT-00020V-E5; Mon, 10 Mar 2025 12:24:33 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBMZx5JjMz6M4G9;
 Tue, 11 Mar 2025 00:21:13 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 42E3214011F;
 Tue, 11 Mar 2025 00:24:19 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.68.114) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Mar 2025 17:24:15 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v8 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Mon, 10 Mar 2025 16:23:32 +0000
Message-ID: <20250310162337.844-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310162337.844-1-alireza.sanaee@huawei.com>
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.68.114]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
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
X-TUID: 0Mqg6uI2DNjn

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

