Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF84C87FCF
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwP5-0007bd-0N; Sun, 27 Jul 2025 04:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMG-0006eZ-AO
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:50 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwMD-0004Du-6P
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:03:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-234f17910d8so29660795ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603424; x=1754208224; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q3yL151P+dSoqNJcReBE7377GzJXEssI8OgEgpoGNy0=;
 b=IAdKt8tZR/E8YkdfcWJuiUgSDNuQEjXclW+F5sxWro5BKX5EpoS0Kr+jH1xZnLwa7u
 gZ4NjhlAOwmvqvkEOwsXSKx7XIyuWPqzCvjn2Tw2Rm+OuBwzykO9slbV39wVw9+t6OVo
 DX/HpvVwWnSb3VbbMcltkaTceCXtOIxsTJqWT5igEQZPHp1c/xLTb68y8hltOKAVr2Lu
 BJXtje8exvnLkw+KT3yzcbIKwNjt0vPV/i5ySX2J7/KUPX7Cbk9VkJzjr+7KR6DEZ0rW
 xAwVCty4DUFN75PiAOt/R2IX8aP+Kopj0qOEHskKVkgJeo3sCZs2VfxazKQI+5IoDYBO
 UuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603424; x=1754208224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q3yL151P+dSoqNJcReBE7377GzJXEssI8OgEgpoGNy0=;
 b=u9WJtp1doc28WXFFWtmt+zlxs7L0dPsqSofcfuv/HqT3Xsdqsq5DI4f59csfR6fRgG
 TmE9+MPFRueQ8rd9UfNR8MFIEzVuqbswTV8NaIhNkRws2QX/sS0LT8hkEyWhEUEye/u0
 ayDSAsivCQ4QXjCqq9d9TzPGscEPT/hg5UkoWZuRFEnxw3VAL604hSROcwekpZN0vC5J
 tU/XX1ZhhZzFsLfJXKO/1HqDWFaSLhzf+xFs2jrQgDguBA8isVpHvPkTurYVty7kvzkR
 ipDe0XnqF3BuezI5Nr+q2Zcu9mDgom2ZnvQt1d0M2w6jQW9n5F85y4OymJY/9JA3OVWC
 IoFw==
X-Gm-Message-State: AOJu0Ywx1E/rwkfTLvoLRvBUZ1fiqFGwyeW1OWpvQKzOfp6HhUUYaTyh
 09RT8D0PLxZnphUrI+DZar7iKO8+iIHSGPJ3njBFJT1h5dDVy9OqO4U54ZGPBmx3GF9uiM6yFNq
 h3B+d
X-Gm-Gg: ASbGncvuiiYm6rJfvEzlwEtVlVcPLISSLSK1TTCWsk9LAnRbGWj94pJGDLujyLAw3Z/
 cVNjxPHBmDOBGicn+7OWIrYsKq6rm7Z/gRVWF5mg+fQDvvITpr6MSpCXKE4r+GDe4xyAbIJhhaB
 jT9BTZPFimFJvX+WX7YvL6p71H7yf6kxZsgFi5jHYS8ZNrUuM7Wsr+H2gIMlpUBoMOoKmqC+LJv
 TGMYLdBGY3AcZAQpJOynVsP1YAIT2d52xbMEadtjqXjZaEN86UNe7SFUu9nR1rcJAbf0Bxx6cGA
 tUfc+kNLyvKo6CIfH1fIAhGbTlG7J19hQD6WJFdLaY77GiwOEGwACNzRsUu6uhAWmsB5zUPvXEM
 1Xm2qn5Kg1+Ualc5xhmPgp4OmTjm/a+2KvE/eDFpu7k2mMOzzKED7zpF2QbpF7pZMVyVOVOk6Qp
 /COIv76WkQWw==
X-Google-Smtp-Source: AGHT+IFWtjbccSO+FpQWJvZahLzrOTog6H488t6so/U6K9lhBW7Q6W5Q2mk3I2W9iNLuNscMxUCRMQ==
X-Received: by 2002:a17:902:c94a:b0:234:bc4e:4eb8 with SMTP id
 d9443c01a7336-23fb3120755mr107039585ad.46.1753603423856; 
 Sun, 27 Jul 2025 01:03:43 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe333efesm30016415ad.65.2025.07.27.01.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:03:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 39/82] target/arm: Convert regime_is_stage2 to table
Date: Sat, 26 Jul 2025 22:02:11 -1000
Message-ID: <20250727080254.83840-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727080254.83840-1-richard.henderson@linaro.org>
References: <20250727080254.83840-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h       | 5 -----
 target/arm/mmuidx-internal.h | 8 ++++++++
 target/arm/mmuidx.c          | 5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4f99ec69f8..805f4a1876 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1029,11 +1029,6 @@ static inline void arm_call_el_change_hook(ARMCPU *cpu)
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
index f297eefe2b..ecf43d7709 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -19,6 +19,7 @@ FIELD(MMUIDXINFO, 2RANGES, 6, 1)
 FIELD(MMUIDXINFO, PAN, 7, 1)
 FIELD(MMUIDXINFO, USER, 8, 1)
 FIELD(MMUIDXINFO, STAGE1, 9, 1)
+FIELD(MMUIDXINFO, STAGE2, 10, 1)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -82,4 +83,11 @@ static inline bool arm_mmu_idx_is_stage1_of_2(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, STAGE1);
 }
 
+/* Return true if this mmu index is stage 2 of a 2-stage translation. */
+static inline bool regime_is_stage2(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
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


