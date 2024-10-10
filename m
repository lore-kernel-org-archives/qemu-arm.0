Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1433384njl;
        Thu, 10 Oct 2024 04:20:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeh3IRT6hPu9Ps+ojlxFW9N9mkZtdF9t5fh4L2j70oPYHRYnlOVtpp7ViBSicfUe5/sAsIFpUr+Q7uAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEoZksEgCfjwOg1ITSn7S+AEsyt6XrR5TNbYcbaDA072slTYbDu8dOeetHnVJdE1Odltx02
X-Received: by 2002:a05:620a:3188:b0:7b1:18c0:2efe with SMTP id af79cd13be357-7b118c0304bmr15595185a.26.1728559231285;
        Thu, 10 Oct 2024 04:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728559231; cv=none;
        d=google.com; s=arc-20240605;
        b=lk5YS6jByGrosCmRkM9+73Ui0rKfohCuELFDyFsw8fVqiLDaoZyEcFHcLRTek0gAFg
         FyNXzmyjqvCTpstVzZQyscgCtT+rPwu02AXixPM8jMSEjsDFntNRScXFmfLZr5mOvSJ5
         OlsV0I9hJ1K4Z2dnXU4LjVLDqBziff8JLMYh9qvPhqyPm86EGTzRV+iQyDDYUByOa7VZ
         TNj6+AHVUCKYO+gM+qpKkw5UWg/Ml3MxkHL+BAc7VRuATwEQh51dhNNoep0kTGHBcfFF
         s91S7co2uva/92+XCyljGB758FsRf9foS2s56QNXFSoTy2otr/B166oT3DMX2LXs+BEW
         dmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WK/aLF5quu8WNFaLVzI70n56c0XxtB1a/39ry15cjic=;
        fh=rWf9XuWQsI9arb3S/1QVkVJRzitX9+a8CSyR5OF0OEQ=;
        b=gX8H3Cs70v6v6QCq7yoL1VfpLmXbD1luTnTJQrpscyqP2hTDtYJHsETt4YbsJ848Bm
         35X9fQsUs/TA21tJDqFQFICK79tZPY6JYG5S/9IU+HGo5bMwSSClMbx/+c2v98WibzBz
         1gwrlBJSzi2AIYK4gULg+lZUEcluzHCLRz5I5IpxuBERgycobxdlId5ilP6v44tE21/b
         EkZ1qFw6iP6dSknX8nAEFpwwkDgYDzgDjahFHdiEWthy08uE0kWmW7g+OFArUtyLyxwh
         QX2Bgb3hYeCo4j+w0IHqRu7nnpSr1bTJ+JVLnA99XX8Waml28liZ5PszDBXcj1soIS7Z
         gp8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149d2f9esi113663985a.747.2024.10.10.04.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 04:20:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syrDP-0001wZ-NH; Thu, 10 Oct 2024 07:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrDK-0001uD-VU; Thu, 10 Oct 2024 07:20:17 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrDB-0004vt-85; Thu, 10 Oct 2024 07:20:09 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPS1W4yt4z6K73c;
 Thu, 10 Oct 2024 19:18:39 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 643F814011A;
 Thu, 10 Oct 2024 19:20:00 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.126.168.143) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 13:19:59 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>
Subject: [PATCH v3 3/6] target/arm/tcg: increase cache level for cpu=max
Date: Thu, 10 Oct 2024 12:18:19 +0100
Message-ID: <20241010111822.345-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010111822.345-1-alireza.sanaee@huawei.com>
References: <20241010111822.345-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.168.143]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 71wRDJn2XGn1

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 904a7e90b4..47d8c9c9ae 100644
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

