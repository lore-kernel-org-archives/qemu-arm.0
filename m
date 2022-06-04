Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6075151lfh;
        Fri, 3 Jun 2022 21:19:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNavUzSrHFFUZ7NV5LoAwnOKNG9QG8sl4ABHEEDIvo0Sniy6jH6kmeS7wy1SR4WkZBX12M
X-Received: by 2002:a05:622a:15cb:b0:304:c9a7:cee1 with SMTP id d11-20020a05622a15cb00b00304c9a7cee1mr10257784qty.594.1654316342535;
        Fri, 03 Jun 2022 21:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316342; cv=none;
        d=google.com; s=arc-20160816;
        b=to8QI+ZDFx/CphLWa+3ra1oelISQO2hYnaWUTh41YHnwrpPqaPNvhupm6AXn41Bo9s
         4TuLvuqFAVFLkvfADDkCtwXF1ncShspQ8iL22F05mLI9Q6LZcGiYv5RCdLfggll07bRC
         GZ12Zqt6RLh5lRLuQOiRm90WfDBlGlG6cdp+s7JjU9FmUnYRviJV3NI0sby4zM2kLdMO
         gH+s1+WDplN0B7D0aIOY0DX0MYegPJLoBU/UNuhDTwlGatbmCKomuo3tpK0qAxkzDQN3
         evFghSrLfEYP0FBMahpEkrkp8x7W7J2b6WVos4H5IvBG7VttMHd+ivjf6kvd8gnOxiuQ
         WbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=e3tM2x5Geh/0C+lNtCDw6ji3/cajAOAo6f5xAef+ZfI=;
        b=Zy9R+whFEsTreLjQoramFoXSFstQD5BIUFnLPsLe0KQERVaslWU8SI0D9l8vkKJgei
         grX4rQa6X5qCQC1L+olooD6bbf2m0aM5Cy/eEujEsnsnI5cBiciK+lJYsj1rs39wA3yx
         i0Ts3k4yafaBaN0gkh6fn542EFunzIHtrbNEErtVq31nOvELm7d9mtIzaXsazsRre1rl
         5OEvpfYBohL8kV8/tpdX/EA6oVjo87DpW+iXNHTY9Fn7e9cpi4UO3uY1P4iGql5qDq8A
         bfAE1Se0qywTwI+EBvGe4Cou7qmtXyrnxzi6bhMqkVc7vjwmnelU8ldIPSOYCIPA6h0X
         KwPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXy8v+mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo11-20020ad45f0b000000b00461d9f6f633si4056000qvb.119.2022.06.03.21.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pXy8v+mO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLFd-0002gO-2P
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3P-0007rM-MK
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3N-0008V4-5J
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:23 -0400
Received: by mail-pj1-x1036.google.com with SMTP id e24so8741524pjt.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e3tM2x5Geh/0C+lNtCDw6ji3/cajAOAo6f5xAef+ZfI=;
 b=pXy8v+mODdY6WcFaeuftszjQsCRkZfg+JbZHfB+GfwWhU6GaVE4yTRS4fCt06MwQYm
 /XPK54LIeLckdnQpVokmBuiJSiqZMv2ulSuPDy7el83Equ2vH1WVNw7qWwqaRZGwUduA
 HMfp+FT0tPALxDBxkowV1FvnsCnim3SJ3yFUw/vkAsMf+zWHBqozf00TWLX2rCBOzJCr
 drwPYYGaVEjAhjUfbfBBiukFVsNVfzJMAzLZgcaYkMFVyoIi7r4iHYRYf3eJSLGyi54i
 lFqzt8UkKgwqiphI9uD91sLYgOeCDqWsMRpWjN/LYvMHxqAt++gPnaDgombqMQe44kOU
 kNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e3tM2x5Geh/0C+lNtCDw6ji3/cajAOAo6f5xAef+ZfI=;
 b=AkIjNUrVJYzRA0w8a8v8jIvPbY2pWiv6gaPvBjPbzaDk9wy7BybnRgdqEMY2hFjoWf
 1lBFdQiNWgQdGLp1XTCJWVOxORCjckUCV3CiEDPRbmPoN1BtCCOlaNAgpIDVbSoo6TF6
 PRKop05URU5WY0q2+eS9UCsKhh5cBeeZYlTCOSg8IdP1Pt00ZFJnn+ghxwYfa98HV/1E
 SckRsV2R4QgmvpjvFe3EI7j0Aip9K24Smpb8qfu1FYPgv4hWkTvPEK0B4NOAVMm0iJkC
 6YncfudHmqGKqPuQaesSMeZRD+vy5VQSTmYLO+YsBafiYKiAjMeUeb86fXnppljIOZqc
 ssdw==
X-Gm-Message-State: AOAM530Lo+HY4g2HaNRCQkpLJ4Hf89z3UfGuu1Ml+/TTUyKequVFBs4Q
 7OWr1kZtO8asEcmtBO1cGoeWmRTZw9yeog==
X-Received: by 2002:a17:902:b703:b0:158:2667:7447 with SMTP id
 d3-20020a170902b70300b0015826677447mr12871233pls.92.1654315580425; 
 Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 12/28] target/arm: Move m_is_{ppb,system}_region to ptw.c
Date: Fri,  3 Jun 2022 21:05:51 -0700
Message-Id: <20220604040607.269301-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: VhcsRYOrfCOL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 15 ---------------
 target/arm/ptw.c    | 16 ++++++++++++++++
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index d2d2711908..6c47a57599 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -33,9 +33,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address);
-bool m_is_system_region(CPUARMState *env, uint32_t address);
-
 bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
                         MMUAccessType access_type, ARMMMUIdx mmu_idx,
                         bool s1_is_el0,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 52655bbdf1..937971730c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11641,21 +11641,6 @@ do_fault:
     return true;
 }
 
-bool m_is_ppb_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
-    return arm_feature(env, ARM_FEATURE_M) &&
-        extract32(address, 20, 12) == 0xe00;
-}
-
-bool m_is_system_region(CPUARMState *env, uint32_t address)
-{
-    /* True if address is in the M profile system region
-     * 0xe0000000 - 0xffffffff
-     */
-    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
-}
-
 /* Combine either inner or outer cacheability attributes for normal
  * memory, according to table D4-42 and pseudocode procedure
  * CombineS1S2AttrHints() of ARM DDI 0487B.b (the ARMv8 ARM).
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c15fba43c3..32ba2e5e8b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -416,6 +416,22 @@ static void get_phys_addr_pmsav7_default(CPUARMState *env, ARMMMUIdx mmu_idx,
     }
 }
 
+static bool m_is_ppb_region(CPUARMState *env, uint32_t address)
+{
+    /* True if address is in the M profile PPB region 0xe0000000 - 0xe00fffff */
+    return arm_feature(env, ARM_FEATURE_M) &&
+        extract32(address, 20, 12) == 0xe00;
+}
+
+static bool m_is_system_region(CPUARMState *env, uint32_t address)
+{
+    /*
+     * True if address is in the M profile system region
+     * 0xe0000000 - 0xffffffff
+     */
+    return arm_feature(env, ARM_FEATURE_M) && extract32(address, 29, 3) == 0x7;
+}
+
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
                                          bool is_user)
 {
-- 
2.34.1

