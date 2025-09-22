Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EECCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:10:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lc6-00051q-9W; Mon, 22 Sep 2025 14:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbx-0004xZ-Vr
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:08 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbq-0004C9-D7
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:05 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-76e2ea933b7so4271583b3a.1
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758566997; x=1759171797; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8HfYM97rkS2HFXVpmImKidouR7djYhqCiCCIkuQ4XIE=;
 b=acdsw12H8WYCCf/JNS78C7xPFL1ADS+inhZYrO/PZPah1oddlDsIKKGilBPx9vYzQ+
 N0oo5HjObQTRyUXj/d5hbclpT0npOu+/K7Jb5i4SuAdUJidj573qLif5hu7Qaik/KxF+
 epBtXEPBLdCqlIsgfDmcCES4MrEf9wDK9Oqb/tP1MesEui1fU0IEkEWKtGZmEBaU2j/y
 fw/bKX7viR1IqKtFSWueelDHixOjhUNnOL68etUSdzX31peW6wM3G/CXvW6Hp2bFixOb
 C/WvamJBYHZZ0OFgkaA0hFcTw4LtCNOnyYDdhxxh0Lq/kWJLsabHl3J5tBIZd3yjKrKP
 sK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758566997; x=1759171797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HfYM97rkS2HFXVpmImKidouR7djYhqCiCCIkuQ4XIE=;
 b=k12z1dP1zwqoy1qlgQrOxM3hcEwDLRBlpRQwXA+LRZm/hhvt2e9eefDwtzT44LL8yc
 jUUn+Z0pr2JGmomcbvBCtYs9EdhcmX8cNVNA9XQtMuIgt2/B1+m0W0FzLXpwHaMZsSrd
 fD3l0lmXobMHsMzpwJ5CgvTm9lyj5r/F1jc8cUaaljR4gQq8bcnI8K9lj4fR+v8xRIE/
 GWSXmxBiumAs4S9UlQ9+URgAmP7+KRkL83NG3fl7yhGhVthv34XQFX1GhAFSMYNwFsCH
 u+a0hpRSG/VDlQ3kvFPfZhJnhJy2h24bQ5+1mIXIhnBpBQ++hanTTmzA884J7WePbFV2
 TU5g==
X-Gm-Message-State: AOJu0Yz9EiYS+oeRTcXkABu3a75o6IIIjiPWFTYma2G7EWLiaElMBbcB
 cKqlks8z9kbY3VTtOEsVEAWLtE9PH13/n5rJXDRUQSRnNCEp5jhP4pgCRVVSY7Okpj9xcE2FTR9
 IYqu1
X-Gm-Gg: ASbGncsbNCx3SFDPmrKBSLqoVPTI1u351gAQ7EbkbC5I6vE/BNGLPn+cyVfOBlvCa+3
 k0ntcViiTZeayrJnzMgFkeXNnh6dnvUAZf8wOdLE5RQNiA2r2Nykalkq4zh9cpTrIVEYjOQTTYw
 tx+qnr8jDqm7u7T4HXVkdCwsuNYMKH9lllde3EKoA5O9kaEeWr7qZNy04OdtEMLvKrcK17bhrSt
 ssoVCiEjhpFnEGs18KP+7Ltq7VPMqldv3YdqpuAsVrNDTq/JvCK09o2v3MQT6BEYgmL/J5CkAY2
 lVIo9n0dReZBiFYYY5js4qeRqccZUloDbNE2LGYnXVqP8Fut8arGLcWLxDH8GatihSR/TlQiy07
 k+OUjYiobZv5jV49gHvII7iJPF3hb9KYxQu8db9I=
X-Google-Smtp-Source: AGHT+IG73M0BaDKpuRN3SiaqIjL34X10Tl5tV5q2m747yXhQZmk01oflbfQx3dtdaBE88yo7CvbfDg==
X-Received: by 2002:a05:6a20:1595:b0:263:4717:559 with SMTP id
 adf61e73a8af0-292188e67a3mr15919813637.20.1758566996778; 
 Mon, 22 Sep 2025 11:49:56 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:49:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 23/76] target/arm: Convert regime_has_2_ranges from switch
 to table
Date: Mon, 22 Sep 2025 11:48:31 -0700
Message-ID: <20250922184924.2754205-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 28 ----------------------------
 target/arm/mmuidx-internal.h | 17 +++++++++++++++++
 target/arm/mmuidx.c          | 19 ++++++++++---------
 3 files changed, 27 insertions(+), 37 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index a886282957..a25ef90c4c 100644
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


