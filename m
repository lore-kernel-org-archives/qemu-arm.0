Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp4484537ejv;
        Wed, 3 Apr 2024 03:19:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXcNPIi15OUdqEtO29AJ2ctPsWniL9oqkAo4ilQGOnSp7sfSFiwhG1WXo1yNwwVRDKgvNAYGS+csPymeeUYSBMGgavF27u9
X-Google-Smtp-Source: AGHT+IH7AFQouOWzz+1hcqEItcELAcLhBMMbXcH9rS3xFcMWmp35/WOKYCn8aulu+dwq0O48lV3b
X-Received: by 2002:a67:ec17:0:b0:478:5c40:9f1e with SMTP id d23-20020a67ec17000000b004785c409f1emr2313400vso.0.1712139572418;
        Wed, 03 Apr 2024 03:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139572; cv=none;
        d=google.com; s=arc-20160816;
        b=DMPoS444xgX/BhlxmUINQhY4no3E1K4Wd4s3VEGjUDBQH3eDWTur5heyJMOHSEh3//
         4l0xex4I8aPycFm6qSI3T+nycq5PNe5lJbcCMSq/Jh6Wtbn86qrXY6/hxCsE7maGZ7lC
         Y7tsAKmqEFH7vAB7zJ3ZsGiF5M+LMVvC+SK1G6zZQKsFAvvhqOjgCX/Ssg8IFfACs79i
         2FlWyTaAksYEN68qrYhbDlZd7Qj1wF1MHevlcdGMzUDLkuYrvQq5xeNM44+aBoHBnKv0
         S0WK601yNKY5F+GGlzfPmclFAnUdKgGhZGyzJCCP+YQQZ1h1AJ+wE8utsUIKFKr55GUf
         evmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=jhHKPIkaBdrlkprOruHBRIsc93MVoYjyiBbC1fp0BR4=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=OxCCfdSUg8ak6yJHtj5cfpGyam5mv6HscE5VjyENVuEkget/Y8BiNfPRxsPWeHhsr0
         zakPACcaXbbib4P3w0x3tkuii363u4GaBSEpFcCche8fqR3bzbIcFKUD+9ilRyIvwWSl
         IsKQavVVgDmc+RiWnZZkOexxINP0HoAdVgXocGq3v5svmy2WA+fmVLgvBlPRxwYZKYtp
         a3fu9VEOzhSZ/3l3jCQzbHlNT4AylEXfwCIi/+0PzvcYCg0z/O9HOaBlmo1snDG+bGJh
         glXe5RDP9Olr88naG6Tk5V13MhCEkoVcH+8LYTZwztWHQVuTD/lAA9vAI3wt3H+j7Eh5
         Seuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a0ce587000000b006972eded89fsi13926345qvm.307.2024.04.03.03.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2024 03:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rrxgw-0000sB-QU; Wed, 03 Apr 2024 06:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgq-0000nF-Kw; Wed, 03 Apr 2024 06:17:56 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rrxgm-0006br-0a; Wed, 03 Apr 2024 06:17:55 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4V8gcN5HtDz1ylXN;
 Wed,  3 Apr 2024 18:15:32 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id C602814010C;
 Wed,  3 Apr 2024 18:17:40 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 3 Apr
 2024 18:17:40 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 01/23] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Wed, 3 Apr 2024 10:15:49 +0000
Message-ID: <20240403101611.3204086-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403101611.3204086-1-ruanjinjie@huawei.com>
References: <20240403101611.3204086-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=ruanjinjie@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GBfNRU8yN1+1

FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v12:
- Remove the redundant blank line.
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
 target/arm/helper.c       | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 3f3a5b55d4..408922c94d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6183,13 +6183,19 @@ bool el_is_in_host(CPUARMState *env, int el)
 static void hcrx_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
+    ARMCPU *cpu = env_archcpu(env);
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

