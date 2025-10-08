Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398CDCCD184
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:13:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cAs-0004kW-0N; Wed, 08 Oct 2025 17:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cA9-0004Kp-T5
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:38 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6c9B-0006hr-8y
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:57:29 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-271067d66fbso2572455ad.3
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960590; x=1760565390; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufbIAsiBDfbdyvsFouOClRyF47XEv9v24R99qbCOlJw=;
 b=Gg9DuAMMhvjP0gHEO9PiqqsMXTXlbh7qq0iKepi8Z+KFzZoppvvFgMvBS93SW0rpU0
 pZAloLEA1IAh4I0tCEMRl0vo7jD4jfNYb0xeOtlZ/DrMksk8NI3WUS54nvJJhWy5sB7+
 6wgNZKBTOA00nyKEpXbKTpdLDILDsY9lFDxG0ZD4/vwPP5/+igyVADU3/8DwFSTSm2RD
 f1fNo+lFl4vUequwb/RCXrR4kmVRGBo6NRlVTtNFVSyKc2T5yZTSbC6e1UyhJKv8U5P8
 8ukYOIFu9Ogqk4L4Vs0TAfEHzFE3sXAWKPfqOtlF1ExL0EUdsJnonSLLjAFtoKaSPyrH
 0++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960590; x=1760565390;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufbIAsiBDfbdyvsFouOClRyF47XEv9v24R99qbCOlJw=;
 b=P8bET+S5X9GeAzjDO9qx+Azk5+O9DZA4yVhhsZsbYGHuZvm5diuGFW13qGBsnsBvDs
 bxIpOb3JC8Uk9+mEstYbk4LN3iqSbYMOVeWSkoKxOHD1b1smKPI1XqYyszcpfaVZ19+N
 Uhtj2u751aXdYy5SPR8nnsStFpABorZaPXel/lfNFJiPtGPJrHiV5OdMB+eaKaVJhtTd
 +lMRwChclkf54nSGoEgkOKD7rlCopZl0kN0SsPgMqeOoQqMnijvc3gQZiG0BMylGR5xE
 QymqAwNErnzEID0CiDverKNfYVePqf5HuWFtfQflJN74t6Guf7JAigYy6iOuxOQxeU2z
 nyxg==
X-Gm-Message-State: AOJu0Yy5ZSuR0ME8EMc5JjEvHF5zMCsb1SOOZCbxXZwhOv1+V5CC6TMe
 7dwqOH0/RYO+nDPT1J57D7aeyFUvOIz491yslfGUfHuIIwIXkgbdof5x3sQTvGvzLZnksHAVwLF
 KUIVrGMg=
X-Gm-Gg: ASbGncuWWQpUgPvAu4ropeAXEE+Tc7fCNhI5eriduDtneSRON0+DIkyacq923KIdgLA
 WIw/DmoxZZQUdK0ucXPbl5jKgLQ4ReNG0nmrBfuywbZXJcn4GykosrrCmz0jupdlVxZdFCrh0MK
 dtFreNkfhpa5i9ZTTmpVNQH5zRSYHWTZqiYY8r24zmvzz99a03uxtBcsh2noRmGaPa6Z/cY6tnA
 +Czz/DjFc1Rl/Il7XWaV3HYao8FIl4SNppTUhV+0M4U7tL6Y8Wv4r9uFcGVhQmEtIkpi1nEsDQY
 qvivxumXzsbvgooXxHWDt5/j0DWXfjmkTTKDOAIQAmAbGKT6jB3hRqsctu1Z2F7n0/ZFCKfWU/k
 JjRG4tJEEgFXkHcBgk7WP6dA6HzEb+ASc4BcbW3PkmOqsiQtD8aExKVNx
X-Google-Smtp-Source: AGHT+IGvP1goTOTfBy8gabTXv88eAl2t67KKNYtu0TZTvBYwL2CLNi1dfGzU4AOsUcC3sBdBRGLDFA==
X-Received: by 2002:a17:902:fc4c:b0:273:ab5f:a507 with SMTP id
 d9443c01a7336-290273799aemr70991105ad.21.1759960590321; 
 Wed, 08 Oct 2025 14:56:30 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034e44ef9sm7354285ad.52.2025.10.08.14.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:56:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 24/73] target/arm: Convert regime_is_user from switch to
 table
Date: Wed,  8 Oct 2025 14:55:24 -0700
Message-ID: <20251008215613.300150-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 17 -----------------
 target/arm/mmuidx-internal.h | 12 ++++++++++++
 target/arm/mmuidx.c          |  6 ++++--
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d0d976cbb0..c4aef8b50e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1032,23 +1032,6 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
     return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
 }
 
-static inline bool regime_is_user(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E30_0:
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_MUser:
-    case ARMMMUIdx_MSUser:
-    case ARMMMUIdx_MUserNegPri:
-    case ARMMMUIdx_MSUserNegPri:
-        return true;
-    default:
-        return false;
-    }
-}
-
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index 41baf1a003..3e51c0f579 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -17,6 +17,7 @@ FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
+FIELD(MMUIDXINFO, USER, 8, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -64,4 +65,15 @@ static inline bool regime_is_pan(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, PAN);
 }
 
+/*
+ * Return true if the exception level associated with this mmu index is 0.
+ * Differs from arm_mmu_idx_to_el(idx) == 0 in that this allows querying
+ * Stage1 and Stage2 mmu indexes.
+ */
+static inline bool regime_is_user(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, USER);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index 98db02b8e5..1c1e062bfe 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -7,10 +7,12 @@
 #include "mmuidx-internal.h"
 
 
-#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
+#define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK | \
+                ((X == 0) << R_MMUIDXINFO_USER_SHIFT))
 #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
 #define R2     R_MMUIDXINFO_2RANGES_MASK
 #define PAN    R_MMUIDXINFO_PAN_MASK
+#define USER   R_MMUIDXINFO_USER_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
@@ -33,7 +35,7 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_Stage2_S]        = REL(2),
     [ARMMMUIdx_Stage2]          = REL(2),
 
-    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
     [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
     [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
 
-- 
2.43.0


