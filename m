Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2165918lfq;
        Fri, 18 Dec 2020 02:45:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwV8ZKRtJ0Cej/NuidYAMwB9W1QH80/2o3oW65PZZwcljqPJ+mv5T5v6w5Z/oDA9lJoR8Ku
X-Received: by 2002:a25:dcd1:: with SMTP id y200mr5146315ybe.28.1608288304800;
        Fri, 18 Dec 2020 02:45:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608288304; cv=none;
        d=google.com; s=arc-20160816;
        b=Kui6P2vULr+48SBni3s1vz+ncuGJnE1jEyKj+4bPladybGwYsSmvC0ucoW95Oikp+B
         S5pH7ZfXmxHbyxKJIZlGbBiNNIsUrt8Bu/7TbP0oRKlSvOxM/viB0D6HApLYuSedcr7K
         2HdRqfOYgtZCRBWDKkPoMubrOkT+cf7JwrTEuUjKJjEgRhcFtWZIbbVh3lctbWnXLF9h
         E9UjIWleKF8T2JKID83d9Ar6JS2tw3xX4AVT0Mntor1wgN+weinHgzKR7hUp0f79FFao
         41ZYc5AJ9+HXHHTFTXkz29f41X1svT0wHA+w+1xLBW1BuZaRB8CAkZAxjQ+pXUD+Db8l
         RDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=TSx3JHlA+N7FUGHG5UeM0WdL6YYgaw08GvA5mIdY6bo=;
        b=XweyFS2z3Aht3noFYVE6fZU2ScodrWX7X2rKGthB63Hf+1bsZh4f2n2d9oATOfZdnI
         StsxIXWeglNbHKMPWGdxuU3o+SCS6WE9OxxkXloZmbtDDUsWyQljhZ+1jY/D2OIh3vuz
         B++lNKiOv9Cz393JI/2LmIXrZBq4GY1c4TEHqGF/6/LfHP0nzybpks9x6tKd7Ju8FrCW
         kGNlPsK16UNpLU58ICtGkLy3KVUVzYiQn+U5ZdH+coBcnxfZZmlZal9nURQzu+Pno31I
         b7i2jW6GZRvKCAuX3heuuKMy0hzFiP+CCHOVQIDN7bxaMg/7F7v13e56EF2Amz9Cr7c9
         qIgA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t35si7424021ybt.211.2020.12.18.02.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Dec 2020 02:45:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kqDFw-0005f0-3P
	for alex.bennee@linaro.org; Fri, 18 Dec 2020 05:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqD9C-00068I-Hq; Fri, 18 Dec 2020 05:38:06 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:55282
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqD99-0003J8-Jn; Fri, 18 Dec 2020 05:38:06 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id ABBBD6001B;
 Fri, 18 Dec 2020 11:38:00 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 04/18] target/arm: use arm_hcr_el2_eff() where applicable
Date: Fri, 18 Dec 2020 12:37:45 +0200
Message-Id: <20201218103759.19929-4-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3337797.iIbC2pHGDl@basile.remlab.net>
References: <3337797.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bk+RdzbG+6BY

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

This will simplify accessing HCR conditionally in secure state.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9b82bcf5f9..c784efac8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4432,16 +4432,16 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 
 static int vae1_tlbmask(CPUARMState *env)
 {
-    /* Since we exclude secure first, we may read HCR_EL2 directly. */
-    if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
-    } else if ((env->cp15.hcr_el2 & (HCR_E2H | HCR_TGE))
-               == (HCR_E2H | HCR_TGE)) {
+    uint64_t hcr = arm_hcr_el2_eff(env);
+
+    if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
         return ARMMMUIdxBit_E20_2 |
                ARMMMUIdxBit_E20_2_PAN |
                ARMMMUIdxBit_E20_0;
+    } else if (arm_is_secure_below_el3(env)) {
+        return ARMMMUIdxBit_SE10_1 |
+               ARMMMUIdxBit_SE10_1_PAN |
+               ARMMMUIdxBit_SE10_0;
     } else {
         return ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
@@ -9968,6 +9968,8 @@ static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 static inline bool regime_translation_disabled(CPUARMState *env,
                                                ARMMMUIdx mmu_idx)
 {
+    uint64_t hcr_el2;
+
     if (arm_feature(env, ARM_FEATURE_M)) {
         switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
@@ -9986,19 +9988,21 @@ static inline bool regime_translation_disabled(CPUARMState *env,
         }
     }
 
+    hcr_el2 = arm_hcr_el2_eff(env);
+
     if (mmu_idx == ARMMMUIdx_Stage2) {
         /* HCR.DC means HCR.VM behaves as 1 */
-        return (env->cp15.hcr_el2 & (HCR_DC | HCR_VM)) == 0;
+        return (hcr_el2 & (HCR_DC | HCR_VM)) == 0;
     }
 
-    if (env->cp15.hcr_el2 & HCR_TGE) {
+    if (hcr_el2 & HCR_TGE) {
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
         if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
             return true;
         }
     }
 
-    if ((env->cp15.hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
+    if ((hcr_el2 & HCR_DC) && arm_mmu_idx_is_stage1_of_2(mmu_idx)) {
         /* HCR.DC means SCTLR_EL1.M behaves as 0 */
         return true;
     }
@@ -10349,7 +10353,8 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s1ptw = true;
             return ~0;
         }
-        if ((env->cp15.hcr_el2 & HCR_PTW) && (cacheattrs.attrs & 0xf0) == 0) {
+        if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
+            (cacheattrs.attrs & 0xf0) == 0) {
             /*
              * PTW set and S1 walk touched S2 Device memory:
              * generate Permission fault.
@@ -10782,7 +10787,7 @@ static uint8_t convert_stage2_attrs(CPUARMState *env, uint8_t s2attrs)
     uint8_t hihint = 0, lohint = 0;
 
     if (hiattr != 0) { /* normal memory */
-        if ((env->cp15.hcr_el2 & HCR_CD) != 0) { /* cache disabled */
+        if (arm_hcr_el2_eff(env) & HCR_CD) { /* cache disabled */
             hiattr = loattr = 1; /* non-cacheable */
         } else {
             if (hiattr != 1) { /* Write-through or write-back */
@@ -12104,7 +12109,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             /* Combine the S1 and S2 cache attributes. */
-            if (env->cp15.hcr_el2 & HCR_DC) {
+            if (arm_hcr_el2_eff(env) & HCR_DC) {
                 /*
                  * HCR.DC forces the first stage attributes to
                  *  Normal Non-Shareable,
-- 
2.29.2

