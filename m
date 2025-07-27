Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CC2C87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:19:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwNq-0004GP-8d; Sun, 27 Jul 2025 04:05:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwM9-0006VI-9l
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:42 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwM6-0004C1-7j
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:40 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-23fe9a5e5e8so4652475ad.0
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603417; x=1754208217; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eEH28c0nOz2sg6VGDpoRkYxKKUtdldOAh0qxcYe2kKI=;
 b=SbfAR38DiPlSV7SNbRt1ingsSWfShHikeht48rafiWGmkIBgEuL6Yd22BKYgq/cOx8
 bs8J2TAr7rbTA6xwKlbMdXvC/F8vF2ftEObGAQ2n8Tgl0Yve0LkFQNyv5rLerFQHeQjP
 uetOzL3k1hBwfSxW/kinKyvb4Jy84U+mTRTw/CAM+fqwiTdwxnCu4bP/DEh6vQCa50Y6
 4JfySFCxhSN9AHXwrbdlTtrIlJIfmIyfMW7S/591kZLLx+5WRrZC7I0IJWYWaeSBTuBd
 35k59OcOrNHCUXvdnh3nOpKPqrwYY+e4SKnsmoPDGXOWwOjvi37ifjylGd0ORHfztfbe
 Bsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603417; x=1754208217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eEH28c0nOz2sg6VGDpoRkYxKKUtdldOAh0qxcYe2kKI=;
 b=iUY93mblQ9CK4yC4AZ2KEOYKK+r3stqZvaBvlXWPgSAZhV8Uh0XjZillhqQD01rUbf
 65OrRkopJMNy427xjs9HlksM081N9YY+uMND/g2FtEc1wnUBP6K8CLzFVH1tdOynUNsT
 rJvEKlE59kPXpLejqMW6Fi4oJ34Y/LoPA2um7bd2a9E8ANRKt7QvQO63Vv8KBBM2Pk/U
 Z4BPmuHh5PrKYJty+naEvu6pK/n4F0zj9J1jWgk3IREVpi+pZV9NT8q06GHjwElfFINH
 0Ox9UrcFliaWE5KDD4CabQZD508ZUGDHFhr9eG8NgrWpbzrUZireiTb+uZe8kOcvwCm5
 E8BA==
X-Gm-Message-State: AOJu0Yz3cYhXdYNKOO/N46FD+T/JHy3dVt/GP+rc1Vfh4zc+bqUXtmK0
 T8ss2RwDkkUZVQFlb7rHQIZ8R9nJflHS2sw8UaZnRhfmKtzcDYYDiG+OcezH1syeoYo=
X-Gm-Gg: ASbGncsO7O7I5VTOAGSxWFBgMw0HdU2bvRTORTbbFrCLm6dkLr4H0VHRQjJAtOIjRwD
 STderGhrQeXbcKAXFXHDFGDFkWynpVq4g1H8pUywiqpzHBiMoFGulyrPETB7UFUCajq4dCQ1Jp5
 yQvGxMf6PcjKTByKv1ZRMV3rSZEE8vkVzcw2d0dDmlMPDhb9X+4E3bdAIRHToH/Z7WPogv03JhH
 pzitTNCD9zHXQcPGIo2/dU7JljcGG8mey8j+lTjjPk7S7Y0dlJT4IIn7kOFRO1hsjqQapwIao/a
 jp6XTggWqLAnKn2Xt0tndNAQvXzYglwa1taKqq1+0XdW3eycJrH9otPTnYnnYipgKEJ3LDELhVA
 yy3roiZP683rWwPmGO2Nz4OZqfPHQOg5Sq05X8/dbw6VqPVgOTKJ1TgS8e+4JE+3r17qDmK3PEo
 xg9HQ9B6t512nwVTwaWFdH
X-Google-Smtp-Source: AGHT+IHWDTap+O0qoUFA2BjGu7zbECg6lodgNHKPTJoDBav6hcH3QMu67IUmIrhMmOY7l7a8fEwumw==
X-Received: by 2002:a17:902:ccc4:b0:23d:dd04:28d4 with SMTP id
 d9443c01a7336-23fb3165099mr122608635ad.43.1753603416914; 
 Sun, 27 Jul 2025 01:03:36 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 33/82] target/arm: Convert regime_has_2_ranges from switch to
 table
Date: Sat, 26 Jul 2025 22:02:05 -1000
Message-ID: <20250727080254.83840-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 28 ----------------------------
 target/arm/mmuidx-internal.h | 17 +++++++++++++++++
 target/arm/mmuidx.c          | 19 ++++++++++---------
 3 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3b730a5d81..0322646753 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1029,34 +1029,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-/*
- * Return true if this address translation regime has two ranges.
- * Note that this will not return the correct answer for AArch32
- * Secure PL1&0 (i.e. mmu indexes E3, E30_0, E30_3_PAN), but it is
- * never called from a context where EL3 can be AArch32. (The
- * correct return value for ARMMMUIdx_E3 would be different for
- * that case, so we can't just make the function return the
- * correct value anyway; we would need an extra "bool e3_is_aarch32"
- * argument which all the current callsites would pass as 'false'.)
- */
-static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-        return true;
-    default:
-        return false;
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index 1a4770401b..76d50a0645 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -15,6 +15,7 @@ FIELD(MMUIDXINFO, EL, 0, 2)
 FIELD(MMUIDXINFO, ELVALID, 2, 1)
 FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
+FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -37,4 +38,20 @@ static inline uint32_t regime_el(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, REL);
 }
 
+/*
+ * Return true if this address translation regime has two ranges.
+ * Note that this will not return the correct answer for AArch32
+ * Secure PL1&0 (i.e. mmu indexes E3, E30_0, E30_3_PAN), but it is
+ * never called from a context where EL3 can be AArch32. (The
+ * correct return value for ARMMMUIdx_E3 would be different for
+ * that case, so we can't just make the function return the
+ * correct value anyway; we would need an extra "bool e3_is_aarch32"
+ * argument which all the current callsites would pass as 'false'.)
+ */
+static inline bool regime_has_2_ranges(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, 2RANGES);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index 6dfefa56c2..f880d21606 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -9,18 +9,19 @@
 
 #define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
 #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
+#define R2     R_MMUIDXINFO_2RANGES_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
      * A-profile.
      */
-    [ARMMMUIdx_E10_0]           = EL(0) | REL(1),
-    [ARMMMUIdx_E10_1]           = EL(1) | REL(1),
-    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1),
+    [ARMMMUIdx_E10_0]           = EL(0) | REL(1) | R2,
+    [ARMMMUIdx_E10_1]           = EL(1) | REL(1) | R2,
+    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2,
 
-    [ARMMMUIdx_E20_0]           = EL(0) | REL(2),
-    [ARMMMUIdx_E20_2]           = EL(2) | REL(2),
-    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2),
+    [ARMMMUIdx_E20_0]           = EL(0) | REL(2) | R2,
+    [ARMMMUIdx_E20_2]           = EL(2) | REL(2) | R2,
+    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2,
 
     [ARMMMUIdx_E2]              = EL(2) | REL(2),
 
@@ -31,9 +32,9 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_Stage2_S]        = REL(2),
     [ARMMMUIdx_Stage2]          = REL(2),
 
-    [ARMMMUIdx_Stage1_E0]       = REL(1),
-    [ARMMMUIdx_Stage1_E1]       = REL(1),
-    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1),
+    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2,
 
     /*
      * M-profile.
-- 
2.43.0


