Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321CACA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:13:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXcA-0001BW-Hv; Thu, 14 Aug 2025 09:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXc5-000148-C0
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:25 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXc1-00051t-4V
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:03:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-76e2ea94c7cso874260b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176597; x=1755781397; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pIUQoqIgDqvDhrh04QrLTmJNySBZbca5o7+NnmcCMU=;
 b=u9FM4XTHlW/SsDwTk6H2ECKaVd+GHWNHqumi/nbbSzEuKoiNKj6JW9HdWdcObGK1Zw
 cb38RjE31zfiO832tybvNuqPIWOCIkSnKpohGcdTUw4O5IQcGoc3svnWjhiI4fGm1xtj
 LefUT2Dfp1lbMthe6dxPWt/k7viU33kCzLJx0pyVduqXUjTHvRiGqXyCKZW6Ki0/YqRh
 vPXKY6dvSpx8CUvySlhPRoA84u7kJE+zxhpET0wiNIpfE9nUI5rOo141zlNnh+4IP6BQ
 Wc9omnIZU2k+SLChO3mWr+X9m/vyYcbWxIssiBqXhTLZQSn1Imv2JYkrI3OWRm89UnDQ
 kzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176597; x=1755781397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pIUQoqIgDqvDhrh04QrLTmJNySBZbca5o7+NnmcCMU=;
 b=Td9cxO8iZeuVCyvZgU98VkZuduoXEgQKTb555STV5RF/Uo5wErvXaXvzhiMS+dFM8E
 UU3/UhegYc09tQikGiAScHqLNV030Nnvb+h/MvnaEImx8mZEjWa6/JiSgG/v4cKCIkUr
 hrnYYOs3qjR/WJN4dHyMr2soPE9SmqwPpR+3BhVoVhAHgWJ18CzYccpoJ3klMLqiXTc5
 aG+2Df9F2qkGFIeraEz7nbnzV8gueBjfJRJmNYJ9PDspSDyJPSBj2dyiXJCvQ4e0YlUj
 Sge0N/YDFPiVELYZOxfO0BVTDacPowqTIlqzD9xk1eu8HBmZ9A704tZgMYuNFt+YcT0Y
 mi/g==
X-Gm-Message-State: AOJu0YyX+YsnvOqndnrg622J8ldzLoeoB9V0hnOzyxvK6aPxHmzc8B22
 AXeQzdJPT/SMmAjS6f+0v5SPAEFhIbDFJtTnpCIGyoaL4aVp8pUZCJ8NBwjqNUY/aFk=
X-Gm-Gg: ASbGnctW2TZpN5WOFBSGP36lwuqvA6DXUWkdt+6qbWCZFu8yla35OzHA9OdPaLB2Via
 Do+AXyALHejurK4sAT4mR+AbtOBz6EeqCa18zpWqBOuULnm8dsLW8e2nqu07hKYVPDVCv75fyeI
 wqg44KjK5HLzwefJGM7r8oq27iGZeG5X4zXN87eo69HzbA1UByGnFW4UbYFcq8VZpg8LsJz0vN5
 tfkILhzhcZpgrLuMOyF2LngXkJ2iwcjjOZgYIB1eUgZMOT6VUCLzd4UTDIcPVNK7YLursp9mDdO
 1Kl6U/S0nKIDv3nqMhv1zIbxJg4CqVm205/SMx5Gi8OaGS5NjowB1Dwm47PFdrAl/HaFWk1Leqs
 woCUt2rObDm8Xm1GtDKfeKijb2o8Fesf73JrvLdPKCNYXZNc=
X-Google-Smtp-Source: AGHT+IERID6z8JeVXdbJdrFkGDYo1qDrLz1HxbvTDZ6AFlzHYl+QLndd1KLK9PP4ClqTHOH3ZFLVPw==
X-Received: by 2002:a05:6a00:1a89:b0:76b:ed75:81a with SMTP id
 d2e1a72fcca58-76e2fbe363cmr3510973b3a.5.1755176596922; 
 Thu, 14 Aug 2025 06:03:16 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:03:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 40/85] target/arm: Convert regime_is_user from switch to
 table
Date: Thu, 14 Aug 2025 22:57:07 +1000
Message-ID: <20250814125752.164107-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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


