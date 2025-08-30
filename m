Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95E2CA1001
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 16:47:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxW-0003i9-Fm; Sat, 30 Aug 2025 11:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEN1-0006KJ-QJ
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:23 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMz-0004N2-IP
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-76e4f2e4c40so2425108b3a.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532600; x=1757137400; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EUcs9AxpyMgXNnrYM+Z+Mp8un4Ur/NPZfUNCkMhAek=;
 b=ijlLBTyTp95a3bSUrnSkhuy2IqkQekr68k4MUlSh25WER9gMipBqJE7Q4aA17MoNJE
 Kj4DYoWKNVqF0LS/UlRDCHArAOEMIX24qDCwJLTw70oOIKdlgGlBhFSanzuLKyXimFJv
 NEbr6HjGVT/xtSM151AZCOG9XqWtUjBLxiqULDoeMPwijA260wRymWFrmD6nhTpCyeii
 v23Aq10wH6QzKC6t2BGRkfgxBCPNkmcE/dqrym27ylSdhbDb1VayiuSmNUa9gGxfsu4n
 TB+/Kz6XAufJt7qzuRvt0uNzo9d0pA5YbnoV6NmR9nb/WMrM5y5/kwXcfYzCp6H4U0Pv
 ttmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532600; x=1757137400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EUcs9AxpyMgXNnrYM+Z+Mp8un4Ur/NPZfUNCkMhAek=;
 b=KldjJjbmSGEUsf7EEIjrMJ7GHxtJu0PraGZy/ECaakWXG2AtmT/Hq32LeJfvm0B17f
 42FI2PFIezBDuQOQcEJUzvOSpxQBO7DMWamjLwWC4shZy6d7KzEuvZr7qHCjUIWTq4T7
 CuIt4+HnE6cAM0O7J41Y2Y6YjoJyDwJFjxoEzlvrdc6xbEK+4Q2lncJPJqRn5TguvxTB
 AbqvlO+8WeLFYEW0FsPhND3+cvT6RdimcfH3y7t/6NWRDg8/LAU2/vR+ue39e+7SBuG6
 xbW72TpNZlNu6ygRj46bYHMArfd4gNas7FWyw4vD1LwQyjZfTWRvQIpcI5gmz2UbfBgI
 3Ztw==
X-Gm-Message-State: AOJu0Yyr3VHJvU+i/ggU9rmYPEBtmRFoROCKpk6S/gGrl8XYc5DgUaj4
 hxT4WAuD2fU16jVnF1pkApoQTnpM6CyaZbVlMuzNIjgdDuuoRMk7hKJlwgGvHgXoaqU=
X-Gm-Gg: ASbGncs7ZYWXiMO0OSWOzqYUi1cJxrwJDncqfh4eoQLO47crqq4NSO9OdWhvq5gNj1v
 cYYnX1ss/SERnkf7H6ftmQwDishpvHiLiROd8HSfT7R8Cs4Zeu0ijKYttl7hVOjgeCYyJC6GoU9
 zkgynU/w7kuE9UZbAjuXmG+5JS/rzi5kF3EXilxtBt9g/GmriSIeIH0a+U/Hhq6VWHJeO0Yvndo
 kF6cOEngEZYuTRs0o/oLH5uy9HZV0wR+2V+g9O0r8wD89rxLXkPHgu1q7zSV6jGJwGikG0utHF9
 IkgHZda30qeUaGaY6fETxpaoG6PaoKUCjU0PgmS4Y2yZij2Jzw5beTGZ8E0O5s8Me7BuhbSDtKT
 p0Z1fjyNKmteSm6vrkrMtZg+DdVKv/sua+uX6OuXdueC/WcrCJvycdGMwGv6h
X-Google-Smtp-Source: AGHT+IFnsWuEdXg7LhQjymWvku6ivuMClMe6rdmhTtCXLLhQDoIZ8QyeATCWPV8AuJ6Aw8PEXiJtQQ==
X-Received: by 2002:a05:6a20:7f8e:b0:243:78a:82c2 with SMTP id
 adf61e73a8af0-243d6f92da2mr1396228637.60.1756532599710; 
 Fri, 29 Aug 2025 22:43:19 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:43:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 38/84] target/arm: Convert regime_is_pan from switch to
 table
Date: Sat, 30 Aug 2025 15:40:42 +1000
Message-ID: <20250830054128.448363-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 13 -------------
 target/arm/mmuidx-internal.h |  8 ++++++++
 target/arm/mmuidx.c          |  9 +++++----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 2ef81a00ab..2148814835 100644
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


