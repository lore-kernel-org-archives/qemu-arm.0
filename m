Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp659240ejh;
        Sun, 7 Apr 2024 01:21:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtdBKUeae3yaDrXafBMQITe2AiZ2Iv0fDrzw/de1OxBVSaDWNDXcbKsn1nYpWsje4yaZANzCZ0KQDQmYY3uapwG5k4KQk1
X-Google-Smtp-Source: AGHT+IFt6gGO6q9k5OLv5fAuUkY//wS6VyDBcGd6WOMuJZCTEoqutDAzfEqlS61z8ytXHujtHe5Y
X-Received: by 2002:a05:622a:1908:b0:432:b30b:7fd7 with SMTP id w8-20020a05622a190800b00432b30b7fd7mr7611716qtc.32.1712478072380;
        Sun, 07 Apr 2024 01:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712478072; cv=none;
        d=google.com; s=arc-20160816;
        b=btJejnKP6VoCTBpyGPyB4FvkNzibW5FrocNRuRm/E/SDTFbnsF35nba//Go/0G1tby
         afJPQPQX6NOEZLqh9ixCtBsseks2M8jYcduCIjpBafNZ9EgeDQ4PC6kpTWtSv4dJFrQi
         NAEqMMSyytZsmXt7oVcSpsC6FsqMTYXX/4Zxca4HeV1Az3QPou6oY7lY2eWW5ty8lGtG
         rx0o9KF/lT/Vfp5WlwyMrd//sm61Xy4TmWBLC3SiJby98jPC12ekicjpSfqOXzGOXidQ
         +Y42JyyBmTgLBZn5x34vGtMAcxzHSWD3eP6vsOxIJfwNxi9hQcRK//yBdDAD6nN3B05k
         5qsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dX5iwsrpR8mW09UzXkfQ77cS4j8jWsZBF9AY6ZX9Yho=;
        fh=dR6uRwfo9om/DmWDsGu5eY7/2T4Nd7sHG4YVwbPnVj0=;
        b=hXouqIz2b39mw3+eMb59pOjJ++WSVkxXWFQLY8PU3xDDWimPvMAN5YEAYinm0oGd+g
         4ScbB95EZpFbTGV7cAY1hxuiPoXCWpXY3FZiaC0a6pZ9OEOZ9fip/54oxqOPHRRMKYZS
         zDQs1Ip+l702tFZwSr3ttARAujjrL29EKOi/u0FbsjvzTUt9VFoPMY3zOaARmYvxxiwD
         1DVeEXK/iSGQxibKTsNabsjrFRQa2GZ4kARloixGnmTblI1kwFDTFV+fskeM+sXg7SSI
         u43YKq2YmddByXC/Jzj06UoEG13Xt2TsFnMX3Q3JbfsH13DMAiUEXREREFsL9KKBgSP4
         NTfg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20-20020ac87fd4000000b0043466521f72si4755308qtk.341.2024.04.07.01.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Apr 2024 01:21:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtNkx-0004GD-8t; Sun, 07 Apr 2024 04:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkq-0004Bb-TX; Sun, 07 Apr 2024 04:19:56 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rtNkl-0001zZ-4d; Sun, 07 Apr 2024 04:19:55 -0400
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VC4nt3hFWztRtY;
 Sun,  7 Apr 2024 16:17:06 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id E388114010C;
 Sun,  7 Apr 2024 16:19:45 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Sun, 7 Apr
 2024 16:19:45 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v13 01/24] target/arm: Handle HCR_EL2 accesses for bits
 introduced with FEAT_NMI
Date: Sun, 7 Apr 2024 08:17:10 +0000
Message-ID: <20240407081733.3231820-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407081733.3231820-1-ruanjinjie@huawei.com>
References: <20240407081733.3231820-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TxAXcxqysmmz

FEAT_NMI defines another three new bits in HCRX_EL2: TALLINT, HCRX_VINMI and
HCRX_VFNMI. When the feature is enabled, allow these bits to be written in
HCRX_EL2.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
v13:
- Add Reviewed-by.
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

