Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D8ACA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:25:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNxR-0003HS-Ho; Sat, 30 Aug 2025 11:57:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMz-0006IJ-Pv
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:21 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usEMt-0004MC-Uw
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:43:21 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7722e0ca299so973516b3a.1
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532594; x=1757137394; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KGZo8KBWxFmNhdef6qTbtyZn5NiQLX0WXbRYDwiR+/g=;
 b=mKHwH5YFQqYLM5QgeC6lmfKgalTAkuJ0lw5M2nuaerzL/yS10i5psD4VMWsr0NweEq
 z570NeIoZCKuERGKeuqEetWYpC2Vhq9UssypiIikPJxSpofFDOgjv0n971bHSdeA2So8
 LMyWfhZXKMNxaDunHPTYOMF0ib4RvHTSpNWjxng5uWAqWLNJjpmEUEtsuP7FpXfa1wcj
 dcogDMv5ggAWEmi1qvju75jupb3ABZ+gZJ5K59FaK2wKzUWbkcpn++wQEUB4Hv1HcFhG
 nfVFPXUYIJHvMpVezeQsM3Wm3SrwKtKTliPy2z4MroM+ooUEfRj5kv9OIA6XAqJ0wzFA
 Kaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532594; x=1757137394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KGZo8KBWxFmNhdef6qTbtyZn5NiQLX0WXbRYDwiR+/g=;
 b=qZCNwMRvcBI67/WoPeio/pjtMeanoMJVCzzfjVKjTvKljZvsi9CYakJx1Gs+8ioviO
 ysedJ1MppvIc2ATwMOPuLEge/uJHleBMjqzdQ+C4HsmA20WmzruNs8Bf/ive0WADBWdG
 y+CpO9F7guSqhrbb4Zr/yKEoXorv3jD2TagzCK4pUWMxWFSaBO7slIiiDzABDSBozMPo
 1On41Tx1MZuGPPPG/Y8d2xXUQTxCyJRbwuMQxqQWx2Ar8sQNJ7zIhuvLf8hRcla43pgn
 77MjnSC9Yim6lKk/tURIiP96b9K9kEKGTafxNDcUuqQyoq9l5ZkyWcSzNmFkl0dFzgne
 i9rw==
X-Gm-Message-State: AOJu0YweoKobXrnr7PDHyamnpdXGdT0xASeJqDKeQWOie5rkX3y4OlXL
 25SmAxAhFnfcaoNl1enjBfTCyNhseg2ElOhg0dW7Llvcg9dbHVXthofCaqTTtoMECmg=
X-Gm-Gg: ASbGncuVfqZxavSgfpULqJGdDarMNZtxu0kLwvfbd0TMOXYmGaDup7epunjjQ+CALKY
 RLk8mfFDqLM15vr03HTuTM5lOfstt+Px18jX5ebFXHhX6i9Ie0P8Ad0gGTr0QCV6vFsHLEPyjSm
 11Bn+MSNoMihy31KPCa+wzzKMtScEH1xFXJcLVnGh2f/Z/ww1qQWuubVZahtVqXjqEU7Z/uD215
 DDQe1N6axt7QYE2cqtSr2TnciYAr2+mBjCtgwfpGd71WRgCGEqfP9kvIktluulnWQYj/raAr+oe
 BmAD6OO1kBqUz0LZaAqIGtgkWB9kGPVpWRmuyFlulGTEZaJ3a0RluElhJEElIvodmptUqVcwRpd
 cd6T3Jh+KepPR5+whS6EivFziiF6y0TwW76ijyvda1WVcqN+vIdpLcaEYYn2Ts6CyhlUCXS0=
X-Google-Smtp-Source: AGHT+IHK8HBUdy3Ezx8NmEpm8qnwHZpxbFKLO82dD/+1qPAj4daHkXzjWQpnDxs8wqsrptRxiGuTcw==
X-Received: by 2002:a05:6a21:339a:b0:243:78a:82c7 with SMTP id
 adf61e73a8af0-243d5234e3emr2387680637.28.1756532594331; 
 Fri, 29 Aug 2025 22:43:14 -0700 (PDT)
Received: from stoup.. (122-150-204-48.dyn.ip.vocus.au. [122.150.204.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4d96829a66sm2435905a12.6.2025.08.29.22.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:43:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 36/84] target/arm: Convert regime_has_2_ranges from switch
 to table
Date: Sat, 30 Aug 2025 15:40:40 +1000
Message-ID: <20250830054128.448363-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
 target/arm/internals.h       | 28 ----------------------------
 target/arm/mmuidx-internal.h | 17 +++++++++++++++++
 target/arm/mmuidx.c          | 19 ++++++++++---------
 3 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 13fc5a2ca0..a9f44a23cd 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1027,34 +1027,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
     }
 }
 
-/*
- * Return true if this address translation regime has two ranges.
- * Note that this will not return the correct answer for AArch32
- * Secure PL1&0 (i.e. mmu indexes E3, E30_0, E30_3_PAN), but it is
- * never called from a context where EL3 can be AArch32. (The
- * correct return value for ARMMMUIdx_E3 would be different for
- * that case, so we can't just make the function return the
- * correct value anyway; we would need an extra "bool e3_is_aarch32"
- * argument which all the current callsites would pass as 'false'.)
- */
-static inline bool regime_has_2_ranges(ARMMMUIdx mmu_idx)
-{
-    switch (mmu_idx) {
-    case ARMMMUIdx_Stage1_E0:
-    case ARMMMUIdx_Stage1_E1:
-    case ARMMMUIdx_Stage1_E1_PAN:
-    case ARMMMUIdx_E10_0:
-    case ARMMMUIdx_E10_1:
-    case ARMMMUIdx_E10_1_PAN:
-    case ARMMMUIdx_E20_0:
-    case ARMMMUIdx_E20_2:
-    case ARMMMUIdx_E20_2_PAN:
-        return true;
-    default:
-        return false;
-    }
-}
-
 static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
 {
     switch (mmu_idx) {
diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index d8d64a14d6..f03a2ab94c 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -15,6 +15,7 @@ FIELD(MMUIDXINFO, EL, 0, 2)
 FIELD(MMUIDXINFO, ELVALID, 2, 1)
 FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
+FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -39,4 +40,20 @@ static inline uint32_t regime_el(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, REL);
 }
 
+/*
+ * Return true if this address translation regime has two ranges.
+ * Note that this will not return the correct answer for AArch32
+ * Secure PL1&0 (i.e. mmu indexes E3, E30_0, E30_3_PAN), but it is
+ * never called from a context where EL3 can be AArch32. (The
+ * correct return value for ARMMMUIdx_E3 would be different for
+ * that case, so we can't just make the function return the
+ * correct value anyway; we would need an extra "bool e3_is_aarch32"
+ * argument which all the current callsites would pass as 'false'.)
+ */
+static inline bool regime_has_2_ranges(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
+    return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, 2RANGES);
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index 6dfefa56c2..f880d21606 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -9,18 +9,19 @@
 
 #define EL(X)  ((X << R_MMUIDXINFO_EL_SHIFT) | R_MMUIDXINFO_ELVALID_MASK)
 #define REL(X) ((X << R_MMUIDXINFO_REL_SHIFT) | R_MMUIDXINFO_RELVALID_MASK)
+#define R2     R_MMUIDXINFO_2RANGES_MASK
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
      * A-profile.
      */
-    [ARMMMUIdx_E10_0]           = EL(0) | REL(1),
-    [ARMMMUIdx_E10_1]           = EL(1) | REL(1),
-    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1),
+    [ARMMMUIdx_E10_0]           = EL(0) | REL(1) | R2,
+    [ARMMMUIdx_E10_1]           = EL(1) | REL(1) | R2,
+    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2,
 
-    [ARMMMUIdx_E20_0]           = EL(0) | REL(2),
-    [ARMMMUIdx_E20_2]           = EL(2) | REL(2),
-    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2),
+    [ARMMMUIdx_E20_0]           = EL(0) | REL(2) | R2,
+    [ARMMMUIdx_E20_2]           = EL(2) | REL(2) | R2,
+    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2,
 
     [ARMMMUIdx_E2]              = EL(2) | REL(2),
 
@@ -31,9 +32,9 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_Stage2_S]        = REL(2),
     [ARMMMUIdx_Stage2]          = REL(2),
 
-    [ARMMMUIdx_Stage1_E0]       = REL(1),
-    [ARMMMUIdx_Stage1_E1]       = REL(1),
-    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1),
+    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2,
+    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2,
 
     /*
      * M-profile.
-- 
2.43.0


