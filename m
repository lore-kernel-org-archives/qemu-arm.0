Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp564254ejj;
        Mon, 25 Mar 2024 01:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnaj79nrCEafe5KsK4eqEW1Ex4ZIKSKXef4/wohreUAKPCGe0z9ywJ1YvnCAa8GHRX3AGKPIjfjAb/W87AzVl6o+EMTGPo
X-Google-Smtp-Source: AGHT+IHSmwkeuuhhKBcJ3u9xacTKThJuemPtCczr8WqaMd15eFhPm8Me5TYWjkzTcfeItX5sVRzC
X-Received: by 2002:a25:df0e:0:b0:dc6:238e:d766 with SMTP id w14-20020a25df0e000000b00dc6238ed766mr4815227ybg.2.1711356814134;
        Mon, 25 Mar 2024 01:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711356814; cv=none;
        d=google.com; s=arc-20160816;
        b=o9pRQ8Hp0JQa67GEGASTQR3JP+ljlNNeiu/Lv2vR0HrBjaCiP60troI1ou6p6ChuMV
         gQv/v9maQ4AwvJsKk81R2edrCFAJUN9f2N21YE/ppser0tS2FVjUWDSUT4atKSiIB1BZ
         oj84rsF8V+HSTqePU8kvKQ1lOQWCev9xIkhfwxNPTyzq3Bn/xpHPIAgQWLnQ6BRSY726
         GwY5Qr2RwHfuRaNZZMWj5XUQU9QC59RDs+zeb7ntc9UvytJG8/gcV3zve50xvY/poN3Z
         vxHStYFLtK/UsciXqKYlWPKDTtUKNhAXgwEl/CuHikTmV3tFFZrjDIooKab5haXf8S3R
         5Gmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=osAwYfR50eyeqacq+iE0oGCK1kae7LkqQfdnKmC589s=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=QvrUBiBMpg5dF4xr2VLYHHJgCb54iEmdwYW6qQlkjgCcOifr8nrI2U6URu8iW7EsEp
         wv482Y+E2woniHqK5woM/wMVn5jRr9467I38487lI8c/8rldErfrkIBV2sNj6DKA01Na
         2qDMv1X1UTbLDoFM1jpcBBUU+oqajkYN8Z/NzBUwz2BuownsEjHZzXUnstT9IsTlZ439
         JG+ivUT7KtfQ1UBF1AKd7xu+Y8m7dnarPie+ScVlW+JHoU6+W7awEJZYFUNOX5KsPoRV
         cQsPZRLkrMkfuE2GpO+fOxIXSdStZa2cvf4tXPgGYx/1Fed2u46q6k+kyDj/7GMOsLcC
         xg/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs13-20020ac86f0d000000b0042ee2b88e40si5592711qtb.727.2024.03.25.01.53.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 01:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rog3z-000349-KD; Mon, 25 Mar 2024 04:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3m-0002zh-J5; Mon, 25 Mar 2024 04:52:05 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rog3j-0007ND-9c; Mon, 25 Mar 2024 04:52:02 -0400
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4V368w3KsMz1vxYM;
 Mon, 25 Mar 2024 16:50:56 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id D40FD140429;
 Mon, 25 Mar 2024 16:51:44 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 25 Mar
 2024 16:51:44 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v10 01/23] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Mon, 25 Mar 2024 08:48:32 +0000
Message-ID: <20240325084854.3010562-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325084854.3010562-1-ruanjinjie@huawei.com>
References: <20240325084854.3010562-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ruanjinjie@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-TUID: EUV++eziMkq5

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

