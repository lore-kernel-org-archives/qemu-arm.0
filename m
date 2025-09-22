Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA6CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:51:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lc9-00055R-Fl; Mon, 22 Sep 2025 14:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc3-00050Q-K0
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:12 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbv-0004EK-Eo
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:11 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-77c1814ca1dso3638501b3a.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567002; x=1759171802; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXEhGs2c7sX9UNzM1Em26qJHq6E+l20XSVscjZYvVl8=;
 b=JIyKxGh+Ti63Lk4m6pCiamqy+UH/7Yf7iGUaJuP6vkR0li1mRL41nNRKTpwce5ag5c
 h6zfIOpyQOc+MQ1RBLjG+bh9mp5kGPpuCJcQAE1RUkiTqPdeHIePeZFjqWgAYoLDb1/t
 SGHz+FcpHfTK8eH3aTYd/oGzoFx+aaxo+xjrC9Zva8pInjUWeEIX8geCjPwwduk8NBV7
 WpS3eZGrB2R3vZ792Ch5qZbkvWpGuyx0k5V/CR4J91VBu+LXmLbmLRzL5CSe/9SISgoE
 SZTsSkim+d/vG4fk7YkwhQOfUbc26J84JI+W1kAe7mBYtIHDYSsmEIrcd5sh/+WzIXjq
 88HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567002; x=1759171802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXEhGs2c7sX9UNzM1Em26qJHq6E+l20XSVscjZYvVl8=;
 b=mSp6ztdCZ0iAEn4wZysOFCYeRpoSij0GIrQqGVH9De/Vx4QO/iT+4BsFeIIPaCGeB5
 HxGHgX4Gt7OsHDyQb66eCuMCHbjZ+bdsmN31w2SlmzOHTEcnCwd7gETPRm2zYv8tcROm
 2aDlOKWUeMAyKGCeEymQCfYgkQOEcoYTb3JlW0nbBpKsIJ7NENLxmPnFIfoRsnLZHzCz
 4YPqyTEHpeUYSiDQofWGNE06/TaV1Vj7iRhqsY/axmzrX7ndA9tVgzjh+DWSoFpihEqW
 CGkhNZwuxU0DTN0KAN4bho8V3ALJyiDVltvFNGUJrU7oT8Aug3Ov8N/ntDT+87/DNvFE
 mS4g==
X-Gm-Message-State: AOJu0YysishDIxfui6u98Yj7u+F9r7nP3/QI0rfmimYKQjE87DsMN/3Z
 tfzWbV2xqJ8gBWTg/cJgqptHmmIMzlbzmHG7yI1y0soSHMlCxm+Pn41anuaY7/Os6XQ=
X-Gm-Gg: ASbGncswjuyC982A+VahGvg7Nii491rWEloIdCEJQ1n6kNX5jwKv/QJUIoNySegsngH
 4XB1ANEB9RaoKmugYJjmrl32J/KmQq21Vwm5T4sFkslG0kv7R4K+4D1gmnIX5pUD+sWFfWMG6sk
 IF5UgZVgGSC23KHSpGzNMrmoRWQY7sOwnFbmGz58ot6BRGinjozclnnRs351ylPSILahQg7O0xS
 O7EpK//N1x0l69jF0iBZphltImS4EJ+BAlKSWxi491fAbP8dXd9joP+GlMeDA4laTeMubae7jg3
 8g0MYUbx6zPLnUeoXJ8Ph6ICuKOJHD8x6HiPZMuFguIq9VxinXZq5Y+5LnGagXhW03rBGRYUwch
 jXMXcTTRxbWJdwwe5RvpNTE8XYy/J
X-Google-Smtp-Source: AGHT+IGyJcjpSg9dEAZ6WxG9bnfJKkiMS4GH21i4I+L6ZQur2in73nvU+R236wQZYquUiAS+OH+jxQ==
X-Received: by 2002:a05:6a00:3e0a:b0:776:4fb5:bfc6 with SMTP id
 d2e1a72fcca58-77e4e8bd90bmr16339504b3a.21.1758567001664; 
 Mon, 22 Sep 2025 11:50:01 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 28/76] target/arm: Convert arm_mmu_idx_is_stage1_of_2 from
 switch to table
Date: Mon, 22 Sep 2025 11:48:36 -0700
Message-ID: <20250922184924.2754205-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
 target/arm/internals.h       | 19 -------------------
 target/arm/mmuidx-internal.h |  8 ++++++++
 target/arm/mmuidx.c          |  7 ++++---
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index afdc5a92ae..771f7748de 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1280,25 +1280,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx);
 ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env);
 #endif
 
-/**
- * arm_mmu_idx_is_stage1_of_2:
- * @mmu_idx: The ARMMMUIdx to test
- *
- * Return true if @mmu_idx is a NOTLB mmu_idx that is the
- * first stage of a two stage regime.
- */
-static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-        return true;
-    default:
-        return false;
-    }
-}
-
 static inline uint32_t aarch32_cpsr_valid_mask(uint64_t features,
                                                const ARMISARegisters *id)
 {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index 3e51c0f579..55fba4aae2 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -18,6 +18,7 @@ FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
 FIELD(MMUIDXINFO, USER, 8, 1)
+FIELD(MMUIDXINFO, STAGE1, 9, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -76,4 +77,11 @@ static inline bool regime_is_user(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, USER);
 }
 
+/* Return true if this mmu index is stage 1 of a 2-stage translation. */
+static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE1);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index 1c1e062bfe..c5b43a5932 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -13,6 +13,7 @@
 #define R2     R_MMUIDXINFO_2RANGES_MASK
 #define PAN    R_MMUIDXINFO_PAN_MASK
 #define USER   R_MMUIDXINFO_USER_MASK
+#define S1     R_MMUIDXINFO_STAGE1_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
@@ -35,9 +36,9 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_Stage2_S]        = REL(2),
     [ARMMMUIdx_Stage2]          = REL(2),
 
-    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | USER,
-    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
-    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
+    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | S1 | USER,
+    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2 | S1,
+    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | S1 | PAN,
 
     /*
      * M-profile.
-- 
2.43.0


