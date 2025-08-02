Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3FEC87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:47:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLn2-00040t-RC; Sat, 02 Aug 2025 19:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLm0-0002Fq-Qa
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLlz-0005h0-AE
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:36:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-73e810dc01aso1455062a34.0
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177778; x=1754782578; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+LLQ9+ADAzbo3f8WTKEz7f5+T9KiIhpbqjO0j0F7Jw=;
 b=cT3J2Lj1X60isvj6MgHWleJpoAOPm8spISB3Lf/LCIWI4dahfzq6oraa/XckWbTZDB
 MIySAor6JdnrGrlhhgzcMZEMpbPLCH6hUlOiM0eUKIhajj52qP2J2NVw4RoefF/3OVgm
 fZExUy09b6hjtMgTW5MLDYbq9sQ3zBZnTGokZc6Mh9h1EJ6e5fg6Vcq3Aa9pEE+kiM2f
 Mqgd9ND/1P9/0z0F6kwCJprcl+/iGxyU2zvlPMkJNjyVjNqQy4MRaCjomKb5mtK5W44i
 pZpTycsGto1Q5vvZe3aet3zjNDNYexIZqT6hVkQwegFsltbO4HFt11R0JzkydBGmPnm4
 LEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177778; x=1754782578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J+LLQ9+ADAzbo3f8WTKEz7f5+T9KiIhpbqjO0j0F7Jw=;
 b=Zu2ryoguWyzFFvATbKIs+/LM7q0sPW8G9cUaFtmlYrQtj5sqMRG1H75K7G4aGA/J9U
 aUjcS6gBT8E6BP/B7CCDWODHpGaZjCr3ll/QCu9pytWdoGjFR0AG0tmx1ZwjV7Cagki0
 VQd/KoUeDq/+4vaemvRYwILAFdCz8WYqi90Cx+p+Q2wgATIOsh5l54COqLbPU4CeHx9k
 ILg+2FDme4IQgJJy7XKJpRKQSYEZPuB1/38K2TFsEKLMLR2fuySDAEY+zbgDRcieouCw
 zxX3dV21JJkmxetgicxNEoO3wSNsNgj4LgOjCdf9r/dH4Oi0FSZ+HqSm97I1IoNsqHyw
 Ji6g==
X-Gm-Message-State: AOJu0YyUhwSa01ll/irUrlz/tqZlkNCoMN4OsN9yl1nNqy7HBj5zX+X7
 vJXY81YVUftgHesac8Z7S5FaoKkwmvxb/ajjyfQY+3CFu6TtxPZDyB0fAFzs2rISyCQeYN1HjDh
 TYdNosSs=
X-Gm-Gg: ASbGncsUhV7c8n4t2UykBSdGDfBSYsJpbvGjka29QNS8H9gph89ttFygqyG9p1AxGwv
 tbqGLtuSp2u0Ls73NOP2j0xqHBJXTU8XIOinPtMBydpBjNjUgUXYtjm+ZS47C5j68ck+imhWBkc
 l45+ydkNnoKDlPpSGDAV9V+xc9AwdkD3LGBZyIvRflYrnmMOFzrDraS3/vYM0efUk1t1pc5uBwD
 ra3L/MbCe5MlB07L9Fx6g0YWdJyKToDHl3bX5lllGLHAw3umqw6cqWiy4V8LflZCgcOVtYPJB35
 vMqE9FtKtwt+qcbfybhXqYuS1CIqFXZUTZaKU6on5/LLAzDOrwBmkp4icHVGcpjf2m14qpq7+1f
 KhbnFUsLiLwVG6LodTH+osCRvnp2VPfayqMiA+QASHd+qY2wbF6rD
X-Google-Smtp-Source: AGHT+IHrRtJh2WhqExf7yX7dbYNLBgZ2tV2GskHgbfD3QmO2X8Q31C42fHtTq5Ycdkoj/c8WyaKXcQ==
X-Received: by 2002:a05:6808:8193:10b0:433:fdfa:913c with SMTP id
 5614622812f47-433fdfa9843mr694021b6e.30.1754177777987; 
 Sat, 02 Aug 2025 16:36:17 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-741a71dc78asm380409a34.30.2025.08.02.16.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:36:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 40/85] target/arm: Convert regime_is_user from switch to
 table
Date: Sun,  3 Aug 2025 09:29:08 +1000
Message-ID: <20250802232953.413294-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
 target/arm/internals.h       | 17 -----------------
 target/arm/mmuidx-internal.h | 12 ++++++++++++
 target/arm/mmuidx.c          |  6 ++++--
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index ea210c7179..c6f3ae470b 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1034,23 +1034,6 @@ static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
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


