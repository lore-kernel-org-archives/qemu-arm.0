Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEBCC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:17:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwPP-0001mP-BS; Sun, 27 Jul 2025 04:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMD-0006bc-Sg
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMA-0004D6-UT
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:45 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-23dea2e01e4so45473065ad.1
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603421; x=1754208221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YV6leE4fgOKq8LWFBEf7PmSadRs+8Mz0dVJVLCLswgQ=;
 b=iGwuU1mUCEK+dSv19rrLCnNXcl+oDLMQHgGNed1iwD+mxLVeRSEUBqZDe4CH9bBv84
 6V+QcNFBHPrq66I8Er532d2uPZ8tL9QaOzJBrgBN7LS6oQHmFYFMO9ayDcqQeLAw465T
 I4SjQtUnxGUpkewcBwRVvmVOwkEQSlo7pCst31IPZlEXSQu79xzmFeDqk934+MigWbSl
 e2ap+r9Ttkbi7oEuwjlu/nXmNBIdZYquW/R4w4L4lWyx1TH7yQSN2DHt36UCzfirfjNi
 jqkPmbQj+SlCDokBGnLf7/nLaweWsX5RIjMFb7bHA6FQR0FN12KT/YQCuUBDm06q937F
 EDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603421; x=1754208221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YV6leE4fgOKq8LWFBEf7PmSadRs+8Mz0dVJVLCLswgQ=;
 b=MRhfmqzh+utFXuxsC4nR/zUIUEVrHRpe3rZV0BxfHSSjzku59vjJWU4ZFQigDAEdTR
 i/N0nGvKxpSPnHkGG7mBshdKcv7bNsVdaM9ngpvsEiT7kGujwFmu5XKRNeQvtnXw+ZTw
 mWWPeqaU20FZW9MTHTpOhTFDRJWbdevLX11F+/GGExRdZoZY7w85DsZ3VevcfWdM5zus
 xcUfURzY8khJYqrjROQRwiZuNRbE3IT/s/9FTfxjmS9rS5fwTTXNoXGeL8V5INeAVGiy
 J/1vfGuknv2R7eumNYYv9xX+La+YlzAFGod7cax6eZ49jKNLeyTimPXIckvSYjYc/8l6
 guOg==
X-Gm-Message-State: AOJu0Yy8FMP8w9+qFRtaRmuw9cXrSwsM5G3DUbd7mCaYrzUcxNgAzmHF
 /2WaOCATiFr/tKbZBLVESjQ4GGex/pOJhhwHjDYw2SMrT3fIp6mAbtzbpAJ8ci+l2JM=
X-Gm-Gg: ASbGnct4O7ZTjl4ysI+PeFAi3++fgbpZeKbU/R2DG5fQNm7Ey3QOX9to+pFO6ZzxIFM
 Z64bMO9iNNmNpwF99f1prU0kaiMQZ98bYozsnSv4TVLYIlqkIKamFOblXeAHIePXSi+SuslltwO
 xBqy46FHC7gAz+2oPJWSLfeAMEpl6x+Bgt6n9kEcMDosjp2pK54cEY51bNIk5cRAqkkJMf4g3LM
 PnZ0AWvwAWVlSUAlBy9mOncPMJ/gCAF8LGtlsgKyhKhT+4ZrxdLI1zECG4pxevKAP3RoYGrJUEK
 CWauWuKDyA68/ihFDqO1AjAA7XP6COt0dBensNbFZ8cS8GavU5a3ENhq2eG24yvaz5vSWW438wS
 ITbRcLAx8TwiCJ1HAb3Ab89xSsAYjym4nhKyEVSfcpnogxB7U3Q6RyueORDKkXbnwss7HL9eotJ
 xV/OW/NEkKcg==
X-Google-Smtp-Source: AGHT+IEHRISwR3dMbs8ZHoA+Q5EJ/5dJ4grfCKxnBfPlukxzoLno1A4Ku6l5AUE3W/+Hz2Mv+dcvGA==
X-Received: by 2002:a17:902:d585:b0:23f:b0f5:b73c with SMTP id
 d9443c01a7336-23fb30e81c9mr115784245ad.44.1753603421595; 
 Sun, 27 Jul 2025 01:03:41 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 37/82] target/arm: Convert regime_is_user from switch to table
Date: Sat, 26 Jul 2025 22:02:09 -1000
Message-ID: <20250727080254.83840-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
index 5a7259a557..ef1f94a23f 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -17,6 +17,7 @@ FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
+FIELD(MMUIDXINFO, USER, 8, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -62,4 +63,15 @@ static inline bool regime_is_pan(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, PAN);
 }
 
+/*
+ * Return true if the exception level associated with this mmu index is 0.
+ * Differs from arm_mmu_idx_to_el(idx) == 0 in that this allows querying
+ * Stage1 and Stage2 mmu indexes.
+ */
+static inline bool regime_is_user(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
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


