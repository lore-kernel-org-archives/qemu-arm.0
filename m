Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26016CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:20:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jI4-0002H1-R1; Fri, 03 Oct 2025 13:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jI3-0002Fs-Pz
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:55 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGi-0006IS-0F
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:54 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-279e2554b5fso18832765ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511303; x=1760116103; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufbIAsiBDfbdyvsFouOClRyF47XEv9v24R99qbCOlJw=;
 b=mFMXkZe1obcUCpBaC3NVa7ad/S6MBJ7jc8/bQtGY0eTWk7/ZfhKyCrcdkz+YBMhOI0
 ZPp4jbiVcKcMfTR09uMSyhB1+Dj4KXPu7nXNMO7koN8UGHsM/G0XqGBcJxiT9OJLdk0O
 yii+lwoFHIuMfEgQ7BsBi37ZUMw+DjHNQf5WrttNfay15/BimNmKxoU94RYQ2+srC7wE
 UyEAdUjxR408gm5dkzBlj0PzczakgMSSKX330vxnxPbblx2FCfer2tuEMF83oEdOT65i
 IHY7N4LQ4uByUOxHx30/R2Cl/Bk+aDUyPoLfJQWHtLfzZAhuK26GKNDtdhykPq08/NK3
 Jffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511303; x=1760116103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ufbIAsiBDfbdyvsFouOClRyF47XEv9v24R99qbCOlJw=;
 b=mMCLUVM+frS93VjkPnbXexOjB9Fou90GU4RGPS0N66TfYbv/1tiyJAt0JPf7pWJHMN
 4ubPuI/fNdnSPL6aK9IInqcr0Wl27VP5/Kg3IWLhJb6U6ESiJvEEXvsUqRnso1e4Jci1
 7z5H4hwvcfHaWpt2udew6/6/6vl+6ApIOOAol7hWk1xnbjXAktIB1cpBPDqWWv+G77VR
 Ewme0okIQ/IVWkl1fvszDXJnLiEOCKqXnGubVRrBdeakk66adJk5n2GhgfJqyzIVoov/
 P6FOHo3sSJrW/37/j+goTKxCK0yyL4kmJwRhp8XDiuRvqBA2vgOtMXRH0/xCYJkYCePL
 h+nA==
X-Gm-Message-State: AOJu0YwWExiWnRnixAi+QTqENkFFFgmh++ppa1C7Qq69IaKuEdWrBOy1
 J8SPvcfJZLYZVUrWEhMIPOpZdXlfhD2yyA1ilFrbUXW3DhqMP4dzVzccUXikuAM+CgA=
X-Gm-Gg: ASbGncvFa8HlGr6/wqppHUuZtbCAIQJ7h95fRrs0TQzUihlfvXIJqiYybGAn4wxu9ym
 y9ZhvfxvX7Y2kRkrMH6G684xON0u9OOwXPOL5UMzwSLHD1IalG7kfUcFhPYf6z96MK9AcT+Cd8s
 HwhO02KNAT2WjTnxRyLcgnVGQmZmVvvPJXPHUx2JMItlvtxcLOvDKd9dBVuXDGf7qXQycYC4Q68
 Ql6v21AFnw2EQDLtWNxlCHnmfuwcL2iz180cYDVGRnITQ0rVml09oVvQu6IJuVcArIt44AoB2py
 zm3ZOkpFpJAVXdw4bPjAbrUf4J//hrahltgKKpwn/ciJAQY4Ju0Pks+SfrdeZyOxFJtmG+S5hFw
 JLxKwiuMwQGnyEv835+MHOVwU/7VhmkeEO6bRULIa31NfM0BNHWFgwCiH
X-Google-Smtp-Source: AGHT+IHpurz7hA0kfG1xy7x3YKfQemf9khC0RS6zpUKQYv3fbbxdCPtZyyIAuNHvPrBdYYLvxRKZeQ==
X-Received: by 2002:a17:903:190:b0:271:9b0e:54ca with SMTP id
 d9443c01a7336-28e8d04f303mr106268585ad.13.1759511303313; 
 Fri, 03 Oct 2025 10:08:23 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 24/73] target/arm: Convert regime_is_user from switch to
 table
Date: Fri,  3 Oct 2025 10:07:11 -0700
Message-ID: <20251003170800.997167-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


