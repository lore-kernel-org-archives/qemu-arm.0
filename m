Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF8FC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:07:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwOT-0005yf-1A; Sun, 27 Jul 2025 04:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMC-0006a8-Ri
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:44 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwM9-0004Ci-06
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:44 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2363616a1a6so27450175ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603419; x=1754208219; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UAevgaEqYGutVd9d9I1Jx9uVLEhSMtUVuYJhw8Fcb1c=;
 b=bEgFrI7Osf18Affss+uDwGOB3O5FxtgnA2C7oBA2kdQs/Fl00MsXXq2NExrC9ZtB7c
 mQjrUDFQ/rz0YqPqnE0CKxgQg4v8mHHGghOzFvKb4ZAurQi6fq9mQpqzlM8zlPpfmVFB
 Gkj1rzDCCrr76ae5hbi7/+6cZn5bEB0RKD3OXVM0arGQ2CrqsaUfJNxG3O6scRu1VYNf
 hALtdxYS008EJmND+eFlDFbK1eUYXnLfcJ1G1nBUX6hjO4zpCml5yBx1JIbwUuhDA4pk
 BNTyd1rWoxAsAd6lsgZMkf1fq/TkePgHjAYQiSstFRqPG3D9CPkz9kQ4E2sO9SCsusCx
 tA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603419; x=1754208219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAevgaEqYGutVd9d9I1Jx9uVLEhSMtUVuYJhw8Fcb1c=;
 b=lpro0UMcoWvmNcuebWm7VG7Sdm1FpZkS++LFIeCbyrRBHigmiVhHJPoWR0WY8kbKxd
 0ofHHD73zE5shluXgU8z6l2k+DYbZYvxZobJAme6IDefWKqF6jieMasaVoqdnDD2n1tW
 o5OG3Pf4x0cEzbog7xn/rgPKJhVeZVWgwtvfhStcYkofQCdeQ0BQNk5qklbm2YSSsR0e
 nI2YWO7i9QtvplzY+oh+I7nrf+Z7p+z4LR5amz9o4HsF0M4cSl1L43GHBfmb7+bgWxvH
 6kLAhBg9HVkHTdtvlSmMPoXho3RjQpTHVTGS5LxhEDnu1bxbchK04ygi4hEImLZBRiBJ
 p29g==
X-Gm-Message-State: AOJu0YwBLi0kTHEkuEUD+z2T6bo48+rInP5V7dmRfFRkui3mUMvdPVu6
 IKEZELKNrMpTjGKLGcdI2oxon9JTqeALDX9VfuHXdjuuSCWd9PQM/HPO+yJkKQiwt/w=
X-Gm-Gg: ASbGncvkhq5iiKJNrhdMiFclV8MEZthP5ybbUiNqSFVAV94pcnu4RFEfvD4tk77AO8N
 5MoI22XhpcfU8EbVI5DZAcd7jGBy70+fJ3hQ07lUS3h19MGUxXVA5Raf8RnkZpIVUXVg2Q9OR1H
 q4yNCxqpMSupk/+cAkrb4wAKFHdA5Hmo4vJKCvJsLYlwCjJR7NJI2YfyMGdWfjkPoOia6ujQfTC
 da7ww1hakyOLpZriUVptNmv57o7t4lq/cAXjp2HDeMLzWjkV4NCg/Y50ndjLBWvBuhBrghdxjc0
 PEf41jYOXv/WRhjQIDdBayLN24n1qp8WHtR5jUdmVE0OJpQUkyd/W12x5zpQs/gtuY/bDHg6PH4
 wDncAuoSRgzNmTLtF5pVy6bSFyV9+YoyaolAs2O7X4r8prXjo4xlZndqxyopaPRKqklCAkfGlOr
 wDf0GPis9mMA==
X-Google-Smtp-Source: AGHT+IEShDbtBWYBNqFv+9GZ9xODSXVgaWwiIc7rjSws22nHHtyIKuNPl8+W9RLwGFJkgNH6c9KLzw==
X-Received: by 2002:a17:902:ecd0:b0:234:9cdd:ffd5 with SMTP id
 d9443c01a7336-23fb3125d55mr114390825ad.25.1753603419179; 
 Sun, 27 Jul 2025 01:03:39 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 35/82] target/arm: Convert regime_is_pan from switch to table
Date: Sat, 26 Jul 2025 22:02:07 -1000
Message-ID: <20250727080254.83840-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
 target/arm/internals.h       | 13 -------------
 target/arm/mmuidx-internal.h |  8 ++++++++
 target/arm/mmuidx.c          |  9 +++++----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 962fc423a6..f665971b97 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1029,19 +1029,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
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
index 76d50a0645..5a7259a557 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -16,6 +16,7 @@ FIELD(MMUIDXINFO, ELVALID, 2, 1)
 FIELD(MMUIDXINFO, REL, 3, 2)
 FIELD(MMUIDXINFO, RELVALID, 5, 1)
 FIELD(MMUIDXINFO, 2RANGES, 6, 1)
+FIELD(MMUIDXINFO, PAN, 7, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -54,4 +55,11 @@ static inline bool regime_has_2_ranges(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, 2RANGES);
 }
 
+/* Return true if Privileged Access Never is enabled for this mmu index. */
+static inline bool regime_is_pan(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
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


