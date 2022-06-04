Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6076676lfh;
        Fri, 3 Jun 2022 21:24:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPHKC9PL8iLt/26f1OI0SU1TtTkfrDWiOKUvAjzowTlU+fGrdJzQA4M5sCZbtbaBcK1HlE
X-Received: by 2002:a05:622a:612:b0:2f3:d4af:c2fc with SMTP id z18-20020a05622a061200b002f3d4afc2fcmr10091835qta.185.1654316658220;
        Fri, 03 Jun 2022 21:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316658; cv=none;
        d=google.com; s=arc-20160816;
        b=D3bMALEiy7DzoWbTzKdUY6DnNAVowLAFESNheiioQYFvR4RP2xgq5WCGeXUO6gYJWw
         ieG6/tjcwqT+YeZ/K7KEFYVloRJxZ2lV6FgHL4FkRTzSzJfReDnE5ua229FkD+pwE/+7
         Hob2D55HQVjlJlfkbewdypmesaZWTK544IRq/2Wf4fl3oPOpXtiYNDbj4vtudAymjwgW
         NQv/yw/Zicz8kIrusmoMjHU38gwzMwmYW7Ifr3SEa/lH8hwV3ua6j7Cfx4AYY1VAIDnC
         699slt099F5WX4Q/Xgb06miM9yqaMDCurxlLrgPw7Wb6b3JrkiOPOPaoyWzkvqZn+kC8
         1jdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nCpPYzkqKBbtVTXM2HIOkXh0U56y2kxPZvGE1Att9+k=;
        b=cMnKIiCGgfL2jo0Ryc0p/nGfH7hyAFtmV/MBmOJacqZehKih4oJcmCi/tGpa7SMqgK
         7kTXzHFYK2PwhaK+NUo3Q3nHRkQ9geZiQWq5zlRLF5tuP9wqpX7GPUT8MW0EjtoF3NL3
         ORS3kk8/8ld6oPhhck5EhVnoY7f5i3qk6S0BoMeCMZpbbEyQcympuMoUKO65gQWJ1iJn
         1SVvMp2yplGrbjtq9nT2+Q3kJ/8Dm4G+6opPJ76uBao6MD51Sz7YONB/0hs38peAeOPn
         ILyhd70CjCc0LzLKemIwgTnqQVGK7DYvIzZQcMMt2qzYimqcd+lE0BLlqRqiS949TjwE
         ZYeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x2Bq1b7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a05622a189200b00304c59fdc42si4763652qtc.69.2022.06.03.21.24.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=x2Bq1b7B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLKj-0000hj-Mq
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3T-00084l-H5
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3R-0008Ux-ON
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id o17so8116373pla.6
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCpPYzkqKBbtVTXM2HIOkXh0U56y2kxPZvGE1Att9+k=;
 b=x2Bq1b7BF7ezoCoiQIxx8OO0eEtDzeLKispcxBwXaFoc/qkSOct81dvV2mkZkjvX+t
 3sBHrdZukvZGq5LDoXwjdlhd12uRJHwpWgmKgrgOWyKG2XBBl/LXEB518DEzI+lxQeUD
 VVMsgsN7+WUXEXP7Ax1E+02XotZw4RfgdGD6xNiJe6liTPrUTmsvc6ESfxfG71JG7bGR
 2FEKI/N5K25I4zkh/L8ULTGuf5n2Z3B/ShhkN5pTGRy8oiVXQs83X8akiWJtoHus7bTi
 sB1Fjaht2IbrtywwprYqY4u+RW2/23JVStPjChA6YPyg64rVhF4sj/8PX6LGYchUcxem
 yDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCpPYzkqKBbtVTXM2HIOkXh0U56y2kxPZvGE1Att9+k=;
 b=aY2atmkNu1HqayxaqbgJ1WOF1eU/YhEbEgPjLK5abxm2cXSNVKZmyyYbRnizF+KZDp
 Lgj8hEjherihEJIsMH7ft12DKFCNRm97eGWUb0an5a0F4krcnDx9oEm6quIEr7aztRMH
 uc5yweIlSgrYgaVxpoEmcqSlDWKT0aYn3IYqKv/bhtE0dHHJL3s1F+2ajTaL7RAhECjd
 xF6u0jy+rfL0uIZshj5LjjUxyDbZ81lQHzhBapRVowaVPgKK6Iit/SLXxmO/RUic41SD
 1gLssYIKCuFZZUrx0dk8HlVqV0FtW7mdbkNxvcueyVuQeME6Vj6BQ2OJkdm6wIsKr2B5
 mkTg==
X-Gm-Message-State: AOAM531pVD/0wWaUks50ZdrqeEAD+0ig0zAN+04TzIRU9rXLmpfZck7p
 1f3dkMfoCDZJ4XYhxtwq3wnHFAIzHa7/hg==
X-Received: by 2002:a17:90a:6fc2:b0:1e3:2c21:c29f with SMTP id
 e60-20020a17090a6fc200b001e32c21c29fmr26608580pjk.191.1654315584979; 
 Fri, 03 Jun 2022 21:06:24 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 17/28] target/arm: Move {arm_s1_,
 }regime_using_lpae_format to tlb_helper.c
Date: Fri,  3 Jun 2022 21:05:56 -0700
Message-Id: <20220604040607.269301-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FyVAehYBeYI+

These functions are used for both page table walking and for
deciding what format in which to deliver exception results.
Since ptw.c is only present for system mode, put the functions
into tlb_helper.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c     | 24 ------------------------
 target/arm/tlb_helper.c | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index f6931237fe..4ed2093acf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10479,30 +10479,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
 }
 #endif /* !CONFIG_USER_ONLY */
 
-/* Return true if the translation regime is using LPAE format page tables */
-bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    int el = regime_el(env, mmu_idx);
-    if (el == 2 || arm_el_is_aa64(env, el)) {
-        return true;
-    }
-    if (arm_feature(env, ARM_FEATURE_LPAE)
-        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
-        return true;
-    }
-    return false;
-}
-
-/* Returns true if the stage 1 translation regime is using LPAE format page
- * tables. Used when raising alignment exceptions, whose FSR changes depending
- * on whether the long or short descriptor format is in use. */
-bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
-{
-    mmu_idx = stage_1_mmu_idx(mmu_idx);
-
-    return regime_using_lpae_format(env, mmu_idx);
-}
-
 #ifndef CONFIG_USER_ONLY
 bool regime_is_user(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 6421e16202..7d8a86b3c4 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -11,6 +11,32 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 
+
+/* Return true if the translation regime is using LPAE format page tables */
+bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    int el = regime_el(env, mmu_idx);
+    if (el == 2 || arm_el_is_aa64(env, el)) {
+        return true;
+    }
+    if (arm_feature(env, ARM_FEATURE_LPAE)
+        && (regime_tcr(env, mmu_idx)->raw_tcr & TTBCR_EAE)) {
+        return true;
+    }
+    return false;
+}
+
+/*
+ * Returns true if the stage 1 translation regime is using LPAE format page
+ * tables. Used when raising alignment exceptions, whose FSR changes depending
+ * on whether the long or short descriptor format is in use.
+ */
+bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
+{
+    mmu_idx = stage_1_mmu_idx(mmu_idx);
+    return regime_using_lpae_format(env, mmu_idx);
+}
+
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el, bool ea,
-- 
2.34.1

