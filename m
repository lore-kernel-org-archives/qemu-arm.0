Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp523094nji;
        Thu, 12 Sep 2024 06:40:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsxpyOTnYZX4A1dUKWaD4mJvtvBV4jekFv2seCJw/XGc1CiMZ8JNtXK85eVy21nhUmoQcYY6kE1Ywpug==@linaro.org
X-Google-Smtp-Source: AGHT+IGEcXG2aHAcj7AalO8R7aGpS2jw2QS7sKz+x0fFYkj7NCi+q/kJPWMAKkZ/8Ae8aAEcrhOU
X-Received: by 2002:a05:6902:1895:b0:e0b:db13:76bc with SMTP id 3f1490d57ef6-e1d9db92685mr2751779276.12.1726148427896;
        Thu, 12 Sep 2024 06:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726148427; cv=none;
        d=google.com; s=arc-20240605;
        b=P/zUD4Jat+0AimJoBg9vwyQZaju/VOxzUX0Be85Hn8LbH7EbInYYcKtohtiaYt2uGm
         aV20OpPjY1mdKLoC79M+MVOxTFzvc2qihy3GO0WW/G1Aa1KGEYK6Adm20UEPWLyiQfqa
         lRdaFuQEfj98TEoyhpsaKChodybyuTXmqgh7YbuGUN6M1in6/rMiL0p8RrFdk2NDTJsL
         shBlfWMMSxAbi6S9+rxT2LITYK5F0INZvC/Co35zISqv0R22//ViE+2uk0TTRT1zMCnp
         dJRZs7Zl5rSFy7ybs2VqMnBFkXrBMdRYdynA68vJhCJ10ElAg/N4NcYdNjBA/Hc84dRH
         CIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WK/aLF5quu8WNFaLVzI70n56c0XxtB1a/39ry15cjic=;
        fh=FkJWaune7hMuK+jemAGcJmHRm42IOkVpZLD1KexBaC8=;
        b=guGYkiSLHFrJizSjc2RYqomlMDIUETWbKUSCPn1KQr3yGyYfdKwUxAsaQKB+iSsEud
         Qv0+KvomoDwKQHxtIsyNI+U00Kty9KA2mFBgkvzQqLzJEVerB5NPqGGAprpgkal/Mmxb
         kD3/HR53YUH9nHcsB65O0vKS5IdMK9kvnRqWZciM8hgQtdgshO+iL80zfoS10YKsOK0m
         R+wH1RjH1Iq739zaxE0bujfDsnXb5Rcqi8dKZ3bIB7+o9/nwawZiAjlRVTtk91ykWWw9
         fdceBMsVDnKjG29FkO0kki9IAlWXaSdzKh6CWx8JtlKEa+gPo6zV35WHx/GFA6Rj9v1r
         Q0Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822fa6500si124865181cf.539.2024.09.12.06.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2024 06:40:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sok3e-0006zb-IK; Thu, 12 Sep 2024 09:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok3b-0006jq-Gs; Thu, 12 Sep 2024 09:40:23 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok3a-0000Kw-50; Thu, 12 Sep 2024 09:40:23 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4JNK4Qllz6K6RP;
 Thu, 12 Sep 2024 21:35:29 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 5C5031400C9;
 Thu, 12 Sep 2024 21:40:20 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.48.147.42) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:40:19 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>
Subject: [PATCH 3/5] target/arm/tcg: increase cache level for cpu=max
Date: Thu, 12 Sep 2024 14:38:27 +0100
Message-ID: <20240912133829.400-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912133829.400-1-alireza.sanaee@huawei.com>
References: <20240912133829.400-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.147.42]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mcPgtr4W+j7u

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

