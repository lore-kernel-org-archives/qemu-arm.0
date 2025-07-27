Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DDFC87FD1
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:07:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwOg-0006g9-3R; Sun, 27 Jul 2025 04:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMG-0006eb-AO
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMC-0004DX-26
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-23ffa7b3b30so3142125ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603423; x=1754208223; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GsGizLEr2I76K1s0Xg3imO0jd0fS5orGZDEDwiddEA=;
 b=aJ6dXF73h5kWJpI8e9mCXgd6zQ1zyjILuE7IM6VTJKl2UOf45Fu0tq1Q3wmtoTjA4t
 6HInetx2PNeFyTlGZGP9rFUBJcUQ+J7gKP4bU3QrEhXdXg/AZYnq3NK0hKcp5C7u4Zk3
 XwjCUzWhzA3rexspsQ1fjf/5Y0eaUtmkJlkSLeJSNFxqSf31m8blBUXsfHmOMngGWMkZ
 CmccYCOeXGuM1bE7piX1TF96mXHPLUU3hzgUR/JaeloHYLdWkFdKfV4JPkohwEbwjgda
 y4O3vIINWOcA4EXsdDe41N7Kui86xONtRkY0dFmB4pWxFjvhLxqELc2eG0gRRIYQIHN6
 4u4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603423; x=1754208223;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GsGizLEr2I76K1s0Xg3imO0jd0fS5orGZDEDwiddEA=;
 b=Sw5BigLjwGyVUGhOCDJLRCnFdDfDrzsdTrYtibw0UY7foDP0bOPG+XsuXHGG4FBteu
 8ik8UlnxiOjmghgixIKrEL/mTkUxpuNisdIAjcSfONu/0mLCviTab4bz4EkEo7dVGfm6
 iyUyuKBeiKo/1WAJlHEQYWnbrrr4OCEUXV1WT4t79lXEXBC67+5+bzZCG5JOmIkJIqh5
 6FiARmvAJhLbCBceFqdh2VDK/suXCcc8LsNr6ZL0oyln7bseq690NpFCEJsrg4+fcqP+
 sqVAMWC8xuXlHGBgx9BqcdRhC2drHs9UJFEWFd2ne7EMFDT1V5YweOcoDxU8x3eHV8pJ
 JtOw==
X-Gm-Message-State: AOJu0Yz3Y+2OvHmsrM3dRTONLr5fbyknrgSDOxNZ4kCkU+hMVwflrwqP
 V9wF1m+XwmX4Ebsdhi7HWQbjlMXILlLEXfuopY3owjNYkDiMYfyXT/ODq6uwrqcrHzywb0UiSwq
 YtRqA
X-Gm-Gg: ASbGncuEl5Pv4+S169PZnkEKvXY0jDeOIAxEJlMJr+YtigD6jhvNpeiftr+3SC5+/i+
 KG5Fmq25nD3GbqjSrKIFOy/vVpVDRxs/QeZdz7NxJCRRm6qHEfPNirTcpgqLoyr+Xhjfjz0V3EW
 zxM5vv+MoupazECRj4IepEGyUzANWnouQIPqVqpcdlVUJqr2/9BQUFkmDoZLZF17N+ksMIet65E
 nFjBYa+R2kIWHtfUnwQNEyhBKWSZwKu5ZTrzbB7bS+UlWgur4DBoVVmLPR1+4nxqfVYR08LnfCT
 VatVMOLoDLAhgHIpc5lKyLcw7T55YgOiESiPsb/9L+SlQApFOGNBsgS0xIhLhhZoJjjd42greia
 dwEDoPGJQo/jlAtPxy+zgvI4cwP2znM9H0OovXHHKFRJbnxP5JdeUutHMHzJzY+CPBzCBKUmqp0
 KsK5v6AMH0hkrACZVW1oy/
X-Google-Smtp-Source: AGHT+IF0EhjvtisVRivYc7IzAxDX6eDs4ZLdAu7RV/YlY7swbnFkhYhixjnykvACGjgQhutoOUqTvg==
X-Received: by 2002:a17:902:f68f:b0:23f:afc3:83d4 with SMTP id
 d9443c01a7336-23fb3086eb3mr138186625ad.21.1753603422658; 
 Sun, 27 Jul 2025 01:03:42 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 38/82] target/arm: Convert arm_mmu_idx_is_stage1_of_2 from
 switch to table
Date: Sat, 26 Jul 2025 22:02:10 -1000
Message-ID: <20250727080254.83840-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 target/arm/internals.h       | 19 -------------------
 target/arm/mmuidx-internal.h |  8 ++++++++
 target/arm/mmuidx.c          |  7 ++++---
 3 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c6f3ae470b..4f99ec69f8 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1282,25 +1282,6 @@ ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx);
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
index ef1f94a23f..f297eefe2b 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -18,6 +18,7 @@ FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
 FIELD(MMUIDXINFO, USER, 8, 1)
+FIELD(MMUIDXINFO, STAGE1, 9, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -74,4 +75,11 @@ static inline bool regime_is_user(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, USER);
 }
 
+/* Return true if this mmu index is stage 1 of a 2-stage translation. */
+static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
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


