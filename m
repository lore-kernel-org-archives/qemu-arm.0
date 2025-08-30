Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E004BCA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:00:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxh-0004vM-IT; Sat, 30 Aug 2025 11:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQ8-000787-Qj
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:46:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEQ6-0004n4-Cw
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:46:36 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2490369145fso12859525ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532792; x=1757137592; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XY9uHEs+/yg9KP8B5F1HuhY0y0pvH7Pd4YfxX4PFYC4=;
 b=EzBkBF+GN5kHQb/NBiZ/SqTXi5rzjBzzUmvsEN6Ncq9zge/7lja1Mjg8P/VWD3h69c
 jlKuKrInMPogD284GviW27ldlnux0WH7Wv6es8ZdIVNxNefmqEXCU/zRBYcmQuz9hiOk
 XdxIYDdEl/NBKfdHJKZDu6t5r0D8K/1W0QFmYJbPRdFgiRspNm29x5VLW4HAziF++OE+
 cuJkZ7X7syEQ5SS2Ury1WJR1YHksXiqjqtrE02+okEn+2JP8dbYxGJugiHfpcHuI01b+
 rYoHeNufNmW2AkUp0VLh2p9rpuRhOQndbU8goaIawTFqJcBGb6W1il1o/LLJCKOgycDx
 fkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532792; x=1757137592;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XY9uHEs+/yg9KP8B5F1HuhY0y0pvH7Pd4YfxX4PFYC4=;
 b=LTeevD8P98gfw8i6jdeZLR1ysLJqtXIY/2kJzrcrBqHW/BRMpkzEea9CqGs4AdvFxX
 ChdZOkAfLUVSq23X67rTj3D959Pao6Q7YUWOck0JNQhBMYtY/s4T1bbjhXkodwPNaihR
 Betfv0fHSfhs0pfC1Ggsuf49OpC7mUHR4tVYW0/wAwieGxbcJibx8d779AaB3nsmTuco
 mgqfAte3BLGzhaCN+QerlsAgtgM/d3v0tAVq/mB6vwLC7iZxac3HUXL0JTMI6gFaZKY0
 myYrpTl7/Yu5nrp/2wfHK8KfjqbMKVJwfYMTY9HtNw++Ji3WObFiZ7Zj2HiU95EBHheE
 KUdw==
X-Gm-Message-State: AOJu0Yykd+YA/SJ3Pa+Xset3dA+4jHh+l5IQFjioyxVTis+FHJPA910G
 Q5ytWqWmN5uBFptMD7WqwLk5Dhbuuvls74XPZNRHIVVtKvCp1mBdYwzTgPAl5W0RQBI=
X-Gm-Gg: ASbGnctL8xNvlUGQ0/XQih0dkCmvBY8fX/znMBr59LUn86idHsUck4pMCvRXRyKLY59
 rQXGb6pFOPzd/IzSltugoe6quBUUP3NGNopZ38G0AYN9oWdqc/yUvBxTD4qE2X6osv4QepmLJH7
 kw7EPYfEEvqiYNOvJDMMnXbg+rUlJFq3xKB4k7d2CGp4fYZZ2S4UJ50/CjfOM+3nxDhSx7+0UsR
 6H8As3fICZwBvVB9W1CoMMSS2GBrxcw0xpQMJ5/QSIPiVx9QKKx89KBag09hnHZatvVNPe88A8m
 HzA1dwxeThVHWdV0goQ956wFfZdeneqvW5N7Vy6tjgkiT8mDEit6MCFj6yc7p7lmHEJHsde6Nyg
 wkJSOeFtqeZqPhvM8UlMAd3nWrqgJwtVzvO9YA5gfr4SCIKpQN0g8guzTdOEQLp4+XqxorsLolA
 ==
X-Google-Smtp-Source: AGHT+IFe02smqgeyMwCoLStf1SQtlRow1nJTLP8rgLGNmb/6A620HSkYjuKNkPIGwn51hiJV6xjqVQ==
X-Received: by 2002:a17:903:2288:b0:246:ae6e:e5e4 with SMTP id
 d9443c01a7336-249448ded1amr14470245ad.6.1756532792177; 
 Fri, 29 Aug 2025 22:46:32 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:46:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 41/84] target/arm: Convert arm_mmu_idx_is_stage1_of_2 from
 switch to table
Date: Sat, 30 Aug 2025 15:40:45 +1000
Message-ID: <20250830054128.448363-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
index a2e5ae42a3..68db7559b0 100644
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


