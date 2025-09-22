Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5073DCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:08:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lcI-0005Dl-5j; Mon, 22 Sep 2025 14:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc5-00050h-3T
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:13 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbw-0004FQ-DP
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:12 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-77f169d8153so2465625b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567003; x=1759171803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMkbENUvVqZ656cyeBLZAoddv/+9a0gSIGqLUctDUDE=;
 b=fNOvd8d55rFj3tlGmLQ3Otc+MebPgCPQSUWj0KQYyxNWBrjZqCziy4XrDh9r4/+/4B
 TMZTlZhWSTk7uzZP6OvYeUd0yaI+qIQD+vXsw7h5xcQbDWhuZlFGyZ5AqltRZ8iwO5v9
 U8Pmwhs3uxwoo8cGh5Wv+ANMr4PRml0FPRhJd3z40q4Ua+8d7ILxPS90q0ln9Ntc9tbB
 hr55WRfFYdOB9Nkr/OzjpHiBWnMOkxjgoQ3tuFvAvx4yN6d8mJ6ru/dco7jK2sH+AVvi
 +n2HD4xbFGfgZKYfzzNSCdWXlm5qQDg7wmu8cDM5lVfw9B4Sw113VFMsHeCngz3iRkW6
 kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567003; x=1759171803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MMkbENUvVqZ656cyeBLZAoddv/+9a0gSIGqLUctDUDE=;
 b=NnrC9Y9fPwotMBIzee50uLmWdcYDx5Lq2m+8JGJTZmkNtxhd1tlnrWJfRKK9UTtsuR
 us1E4wLCJTepvsl6TarFP+N7GOq+mTZ/pyOxYmisf1/f78Hmxl+4WB+K9UYZvXh9/4lK
 TC9/1wfHNK/BG6muEkLmq6Xr0J6n58Q8DUMNXiIvd9cStLdOinlOe1Bn/pGfC7YbK+aU
 S9orftlVssXiTEgComNAWz+S88FmxdjtVk0x01bYdY2zJGhiHM7Oew7/Li3fJikZE4E+
 kh35wgQx3r/k2ck8MtyvpiQVW3/vouHxWEpxHJLptgAb4gyTU4LYCKayewf5s4iCsodL
 c+bg==
X-Gm-Message-State: AOJu0YyH/iBJAA0p0ZIV0Thdn8mPEUq5ZxgIQXUiBKzZxWWunWie0Pth
 /7kqlGs3GkGmTCRauNLVsQPj0RjTSW0yhAbob59lQQOB5h2JXUSAkplqNolvgqwoTyrlgIwcYKc
 v9Uax
X-Gm-Gg: ASbGncv0vPf+VoUFJQubFAQYtIskIqG/vsjKbuTXcGRH9WR3WrcYXU4Ov4BXeHlP5kw
 C4a8QWE3R+bzz18Qa2vpZPs4bE5paZ5sT5MeG5e3nq5nTYne/7Iz7YqIXYGa5TycVmvvuDP/BAp
 k2qtW29fBKoxi0SNDrsZPJZIbWgv222YcBdQsp7MCx+Br0L0eQFi+AlEdsEVuM1gm+218bBCaQ1
 5kU6HbUDJ8WelIPkNuBjNF+WVEGp7lj3BU3G/j0/9a77xETEZOavKO8QBoljtqRx1O6cNRz+RtA
 lHwQrqeRwG2InMpfLJE4lkM9rtR3saV9PnuBb3k2iLpIOB76++K3aJNB/PQoA6Dqp5glrDV6vEP
 5qmIC8ps1E64Q8nBpWh7x2hmiagqTMirqkR1BpWM=
X-Google-Smtp-Source: AGHT+IHeNJLn1pB27jiZsOuHmfx67iaGLzlbOh3OAZpfubnQcnsyQVhEzsNxYkykGM8GrR5rSvNu2A==
X-Received: by 2002:a05:6a20:6a1f:b0:2ba:103:aa3b with SMTP id
 adf61e73a8af0-2cffe9f51d9mr88061637.53.1758567002778; 
 Mon, 22 Sep 2025 11:50:02 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 29/76] target/arm: Convert regime_is_stage2 to table
Date: Mon, 22 Sep 2025 11:48:37 -0700
Message-ID: <20250922184924.2754205-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

This wasn't using a switch, but two comparisons.
Convert it to arm_mmuidx_table for consistency.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 5 -----
 target/arm/mmuidx-internal.h | 8 ++++++++
 target/arm/mmuidx.c          | 5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 771f7748de..dc6bf3548e 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,11 +1027,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-static inline bool regime_is_stage2(ARMMMUIdx mmu_idx)
-{
-    return mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S;
-}
-
 /* Return the SCTLR value which controls this address translation regime */
 static inline uint64_t regime_sctlr(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index 55fba4aae2..1d948aa6f4 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -19,6 +19,7 @@ FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
 FIELD(MMUIDXINFO, USER, 8, 1)
 FIELD(MMUIDXINFO, STAGE1, 9, 1)
+FIELD(MMUIDXINFO, STAGE2, 10, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -84,4 +85,11 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE1);
 }
 
+/* Return true if this mmu index is stage 2 of a 2-stage translation. */
+static inline bool regime_is_stage2(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE2);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index c5b43a5932..61a682e655 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -14,6 +14,7 @@
 #define PAN    R_MMUIDXINFO_PAN_MASK
 #define USER   R_MMUIDXINFO_USER_MASK
 #define S1     R_MMUIDXINFO_STAGE1_MASK
+#define S2     R_MMUIDXINFO_STAGE2_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
@@ -33,8 +34,8 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_E30_0]           = EL(0) | REL(3),
     [ARMMMUIdx_E30_3_PAN]       = EL(3) | REL(3) | PAN,
 
-    [ARMMMUIdx_Stage2_S]        = REL(2),
-    [ARMMMUIdx_Stage2]          = REL(2),
+    [ARMMMUIdx_Stage2_S]        = REL(2) | S2,
+    [ARMMMUIdx_Stage2]          = REL(2) | S2,
 
     [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | S1 | USER,
     [ARMMMUIdx_Stage1_E1]       = REL(1) | R2 | S1,
-- 
2.43.0


