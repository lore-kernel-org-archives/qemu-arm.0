Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4B7CAC5AD
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lcE-0005AM-9z; Mon, 22 Sep 2025 14:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc2-0004zh-O6
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:11 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbu-0004Dk-Mt
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:10 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-323266d6f57so4874060a91.0
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567001; x=1759171801; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4QHixNLRruVL1+s5ZPspsPklSaQIRNXFJF3fprFyCk=;
 b=Xw0f45DBGNtRZ2uo4rb6ADF96MxGT82lUFzNY1snsXnGMfCwWAnGcHvL4lUwBEDXEu
 0TDF0+YKAYAXMKzRU6jZTpFjwg7+HVVFfPqf2HLfOrWs2UYPryGxqWKVTCEzuAyZnXKM
 4RGCTxsaHEG2qAIruuWIGow/60jUiHHfkKGtiu46a1L66+f9HSJfQinscKCDFCcaigLJ
 JaMW9YdUKBOeOfh0dhmqHm5FucmPKr79Y4+uCwtHDiInALLBamZ+Kq0Xr1mwvywH8xHy
 m4iueeEWE21x/TiZx9hIy9tkorOGxaTEF9LehCiqmAz+q7QRf3UT6pZZzbLjQTj/V92I
 n30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567001; x=1759171801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4QHixNLRruVL1+s5ZPspsPklSaQIRNXFJF3fprFyCk=;
 b=bbBAutoFUpLHn3EIz+ndtDn5Q3nMNvOowNo0WQwgRSM+rHdrg6cbXYUObrS6jXy7qz
 IcO/qEhaZSvEnruviioWepOWBNSsYkgmRk4RLy5dSg5bOWw0l0S8nbdIcSioH9pCZmlp
 O0TvBKmCeLjjuNd1ZLaJ5IKCXRdGO1OlLQurbGil0liSgk61qS5XboogcpyphQiStuBm
 a4TjB5DpUbXeY6+3k5sSlTmyakqWWsVOUlwCyNxl3Mel5oE+P9ZMZ43kxL4pI7asgdy+
 BS7gX2uJKW8QT6FRWro9fdktLGIrNxRjy3bR8GQcQCnDVCvpi/1V6nGo1oOEIn7prk0b
 E1sg==
X-Gm-Message-State: AOJu0YxZT+7yJkfEJi3szF8Z7fblAcqrcmq3mClmo6//GnEFrOjLDDlp
 3LFnD/nDGsJWJYJANDIb/wRwnhq8iDxPPIbIhmePywmupMSlkT8LDYmnO+AdoSWYUDdnsI1q5a3
 6h5VO
X-Gm-Gg: ASbGnctSbX8U8DBkTpYIP812G7qBm2cXVRAhd/s0OS9kEzTX7sdBzT4gO7SXhWLGfh+
 cCEzSHTzvykWUbhRGxLXtfipoXr3cf9djIyZWnA+a8wc9HAy5EDV1azTrZ34WInWDCReRHbNGBp
 fh6/rZZx7vV3x7VZhWqo43LO+yLVuM4+SD70D88z2ewoMurvy25kli586r0TNCRk5Nll7eTh2d1
 QiXZX9S2T9m+HZpffGSkV4X48OKKK3RZvm7omvaYjuHJx8lV7V9b/SqVyT0oklZ0tIrcx+9jUTo
 ag/4KxeB42hkHdw2pMU7AgtIV2FNR3PlNMa12a5BTrkTZ4TuuQJunR+WRjsKYb498vxk9A51FVh
 dL7HnjXjgdHzWaI4+eBFOzLIIMs9KlmcwDqXhiP3Vsuw4yOlV6jfsRipzzg==
X-Google-Smtp-Source: AGHT+IG4cQu/DuBITF8RlmuqqjZeGZOYNYazEgIbDfLyUFXvZQ1JZI+aNpoF28G95YzTRU66Fz1VdA==
X-Received: by 2002:a17:90b:28cc:b0:32d:a0f7:fa19 with SMTP id
 98e67ed59e1d1-330983417e1mr18170817a91.17.1758567000342; 
 Mon, 22 Sep 2025 11:50:00 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 27/76] target/arm: Convert regime_is_user from switch to
 table
Date: Mon, 22 Sep 2025 11:48:35 -0700
Message-ID: <20250922184924.2754205-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
index ad5584eb0b..afdc5a92ae 100644
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


