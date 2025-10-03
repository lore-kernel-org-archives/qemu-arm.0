Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66528CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:12:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jHg-0001xU-RR; Fri, 03 Oct 2025 13:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jHe-0001we-Sy
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:31 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGd-0006Hz-SR
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:30 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b4ee87cc81eso2276105a12.1
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511302; x=1760116102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOmjEL78vAj/qpk42Yir5qx6ESIUS3UfNsoScCN3OOA=;
 b=LZS69gkytBdy0/29EjXKv0fvEv18opp0qKDrKjVMN9nGQhUdGqu1ubDL0hf9KMOo48
 0UhkRo4tqshi0hEBeA/1npBXKFOXReOB/17flscM7ApmbnxkMXHAhrIqUTYzZ8KSWjJ3
 RWx6Izu1TQ6ABrrgyUsK4qP2PmBpdoHHVBjyboBK25w3NmW0fFeFJ4Su4FWNgA6CQRce
 Z1W3K/hTg3uPZooPMQD9Yb+LwbLZ5cI4mI76MHNeyvO2Fn8G2unwgKuNNFbZYGm3hImL
 p5gmzqaoqtZ/izWye/Q736BG5HBLJgqaNEb/uUhsQbmPuHPOrMVNm6/5ljDnycFJ/gDY
 BbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511302; x=1760116102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOmjEL78vAj/qpk42Yir5qx6ESIUS3UfNsoScCN3OOA=;
 b=pNR1SYXArpeqd6C3PlMoTp6TeONhgWufror1U+50okz7/4RdhQQwtv5OzVAkQSHxRA
 wwiVkL+ii2fh2qdEgyen+uLPlSv/0tqDf+k1cCYGirqcXCmWSubi1wAcWg3Fr+IcEkMr
 xgpClmFvWSdKoGRe4kVFooxIs4yOIuW4zxediIJvXIV4hpc8HWtvW8QUpvzNTBWYh68B
 zly01bffns7s45UZpeP80PFOySB0atyu8oq63S1LUkeuukzjvyP+y8TJeIUnmYm6FKV7
 ARwdEQyUXx0qLjs5tXCGZvE8ql0L/BAdhgOmICBGUTfIKEegbXD/SUjhLgui8L9RAxvO
 1rEQ==
X-Gm-Message-State: AOJu0Ywtj4eal2szYWbuytu0oyFMYSfqHZFnLJoYxbeLato+5cTho3h/
 kPb9EA8rkf3TiGisvg3vILby+Ji7pKdXn6qKpwCnPJ1ytVgWX6szywJH1/kqoe2u91M=
X-Gm-Gg: ASbGncvqY2r8249Kd1gnrm7jvBmd9T6kGvoR04h6Lr7C1rwya2/8a+lqIcNbFcNF3nJ
 QwdbXKRjSLQKaqhN2ilwqrjzefdMFkClhmcrtLKi0QgVzugPx7hR1mnMw/Su1MXF1bdKpMsl983
 r+HwSj8O+V/8vR+2ivqdDGKEpH/lCDHwbu1iGGs3L6MYDd8CxIbfRhWIAV0yCk4omcgaTjZR33I
 AWZHpYUQHoJhu1IJOm/cG5IacqCDA6n7dx6xSsjr77j6tFeJaKAAL7Cd+9UfNaTxJ9lmYIpwSgE
 +Jw2gV8Cax1u6fdfkI/AZBrxpmusyEZyGzZ2wcfwupjy7NmDVnb7xPN+CywHgferO7eBj4AaOGm
 FVfI+Nfdackqj2q83eGb5IdJqDRYWuNs9YgM2dz1qPfi9d1L7ykkp2NW9
X-Google-Smtp-Source: AGHT+IENA2gW/L5BfIga6TujqV48z0X+GSPY4xNPpcO8FPcKVPzUxQh+p118ScYeIsYe3FR2Y/fyyA==
X-Received: by 2002:a17:902:ea03:b0:24c:ea17:e322 with SMTP id
 d9443c01a7336-28e9a5b9ec8mr49055255ad.3.1759511301631; 
 Fri, 03 Oct 2025 10:08:21 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 22/73] target/arm: Convert regime_is_pan from switch to
 table
Date: Fri,  3 Oct 2025 10:07:09 -0700
Message-ID: <20251003170800.997167-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 13 -------------
 target/arm/mmuidx-internal.h |  8 ++++++++
 target/arm/mmuidx.c          |  9 +++++----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index cb2ffeff59..819ada7a5d 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,19 +1027,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_pan(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_2_PAN:
-    case ARMMMUIdx_E30_3_PAN:
-        return true;
-    default:
-        return false;
-    }
-}
-
 static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
 {
     return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index f03a2ab94c..41baf1a003 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -16,6 +16,7 @@ FIELD(MMUIDXINFO, ELVALID, 2, 1)
 FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
+FIELD(MMUIDXINFO, PAN, 7, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -56,4 +57,11 @@ static inline bool regime_has_2_ranges(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, 2RANGES);
 }
 
+/* Return true if Privileged Access Never is enabled for this mmu index. */
+static inline bool regime_is_pan(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, PAN);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index f880d21606..98db02b8e5 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -10,6 +10,7 @@
 #define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
 #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
 #define R2     R_MMUIDXINFO_2RANGES_MASK
+#define PAN    R_MMUIDXINFO_PAN_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
@@ -17,24 +18,24 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
      */
     [ARMMMUIdx_E10_0]           = EL(0) | REL(1) | R2,
     [ARMMMUIdx_E10_1]           = EL(1) | REL(1) | R2,
-    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2,
+    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2 | PAN,
 
     [ARMMMUIdx_E20_0]           = EL(0) | REL(2) | R2,
     [ARMMMUIdx_E20_2]           = EL(2) | REL(2) | R2,
-    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2,
+    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2 | PAN,
 
     [ARMMMUIdx_E2]              = EL(2) | REL(2),
 
     [ARMMMUIdx_E3]              = EL(3) | REL(3),
     [ARMMMUIdx_E30_0]           = EL(0) | REL(3),
-    [ARMMMUIdx_E30_3_PAN]       = EL(3) | REL(3),
+    [ARMMMUIdx_E30_3_PAN]       = EL(3) | REL(3) | PAN,
 
     [ARMMMUIdx_Stage2_S]        = REL(2),
     [ARMMMUIdx_Stage2]          = REL(2),
 
     [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
     [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
-    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | PAN,
 
     /*
      * M-profile.
-- 
2.43.0


