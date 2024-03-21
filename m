Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp489787ejv;
        Thu, 21 Mar 2024 06:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8P26XOeE8pTNTOTvaHbP7tX77p9uec28Oa/eUOcn3SP/Rj0r3Pdcx/PfRmPvW/sYI2iI/pPrtHNNnBEWuYZRLH3s7Plon
X-Google-Smtp-Source: AGHT+IEZ2qpI3I/SDk4maLTvR7N4B+LiE60SB/wvftwtqN0lQl0NRweVeXWI1RQX+Mx0VlxB9aUt
X-Received: by 2002:a05:620a:5587:b0:789:e917:ac8d with SMTP id vq7-20020a05620a558700b00789e917ac8dmr17405349qkn.71.1711026703769;
        Thu, 21 Mar 2024 06:11:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711026703; cv=none;
        d=google.com; s=arc-20160816;
        b=wxRlVJuLDtHZIijafMOlNch6dfc7Qm3PWRybAI/eXARnxLeK2rxEqNo7x8jFn/+9WC
         D7BSznvH5SnbQDeRCpB9AkYSkuTMqEMewPG9G1ilXYHzYB4cV8guKrfMGjWKWnljeRrz
         vuqsM92CMna3cmiVaJeXcH7b8d9l60xIX5wpojSmf/DyA+WnNCbYuUDJRif8Tb70qVhw
         bZFYl2gJk212+VCGkU1Ike+68y5+Ia23vCZ3ZN16Jms+dpqyPyGf3VM5FeSzs7nJj/ev
         YnVhInnu3SVz54HQ33TJyqcuJWjknJMVxUl4MedlQX3rDM8jAr59wVRt2kc4cVqYLePJ
         mImA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=osAwYfR50eyeqacq+iE0oGCK1kae7LkqQfdnKmC589s=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=bitYiq9iBAtEXIG1LrIqq7lVDl12ADLqBqcz9HwIeU7Q8BseMglSn5mYc2aWQAFpZR
         n5tmu40S3NuPRb+ZnudRs6+j7DwV8PwVsr5w9b32q2yvYYUmd0aVwkpvJxHlbMVz5okQ
         xJqH9a/7DyZ5pNBCNDOZU7Uph9b5WmGxb0W3u0WGuIMK2NLwhWwSkY39Vo0Zaew6ygxk
         v59+s+X8Mj4If3qamiqHUdc4yh5IAH/Yom8pFxBseaaNDmTB8dRScYxqkUrVf1UkioZi
         rdaZYanaueh0jDVG9nmenJE+DvX4PZtq88RDRtKO4npqczaaV/iMdsdcHmUT1jILNuyT
         r45Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05620a204200b00789e9045355si12632433qka.453.2024.03.21.06.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 06:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnIAn-00075B-8N; Thu, 21 Mar 2024 09:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAm-00074Y-7d; Thu, 21 Mar 2024 09:09:32 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rnIAj-0002o6-RR; Thu, 21 Mar 2024 09:09:31 -0400
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V0m2L1KyWztQWl;
 Thu, 21 Mar 2024 21:07:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C46B7140158;
 Thu, 21 Mar 2024 21:09:23 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 21 Mar
 2024 21:09:23 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v9 01/23] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Thu, 21 Mar 2024 13:07:50 +0000
Message-ID: <20240321130812.2983113-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321130812.2983113-1-ruanjinjie@huawei.com>
References: <20240321130812.2983113-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: liMV6HNiiNxR

FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v9:
- Declare cpu variable to reuse latter.
v4:
- Update the comment for FEAT_NMI in hcrx_write().
- Update the commit message, s/thress/three/g.
v3:
- Add Reviewed-by.
- Add HCRX_VINMI and HCRX_VFNMI support in HCRX_EL2.
- Upate the commit messsage.
---
 target/arm/cpu-features.h | 5 +++++
 target/arm/helper.c       | 9 ++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e5758d9fbc..b300d0446d 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -681,6 +681,11 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
 }
 
+static inline bool isar_feature_aa64_nmi(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, NMI) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64(id->id_aa64mmfr0, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3f3a5b55d4..7d6c6e9878 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6183,13 +6183,20 @@ bool el_is_in_host(CPUARMState *env, int el)
 static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
+
     uint64_t valid_mask = 0;
 
     /* FEAT_MOPS adds MSCEn and MCE2 */
-    if (cpu_isar_feature(aa64_mops, env_archcpu(env))) {
+    if (cpu_isar_feature(aa64_mops, cpu)) {
         valid_mask |= HCRX_MSCEN | HCRX_MCE2;
     }
 
+    /* FEAT_NMI adds TALLINT, VINMI and VFNMI */
+    if (cpu_isar_feature(aa64_nmi, cpu)) {
+        valid_mask |= HCRX_TALLINT | HCRX_VINMI | HCRX_VFNMI;
+    }
+
     /* Clear RES0 bits.  */
     env->cp15.hcrx_el2 = value & valid_mask;
 }
-- 
2.34.1

