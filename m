Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF900C87FCE
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 08:09:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufwPk-0003gB-1W; Sun, 27 Jul 2025 04:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPE-0000Pf-MC
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:06:53 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufwPB-0004hH-0q
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 04:06:52 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2349f096605so41200365ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 01:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753603608; x=1754208408; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zYW5TuePB67HwCH6P3Jbzlj0fkBjQRv8GZKruDniEmg=;
 b=XJZYYnYDwgdBbmzHDaVlEQ83DqyDRkdQjh+/b1aSYmLhi8BP78GL0P7bwKfO33lbuH
 y4lJIM1IGpr3jUgt8PbOYy75kav+/Z24pmO7CYfI3rqwakbmTXrKPovmueg8hVHEBzhP
 rI78bkgeGpmGNobILgn2H9lcy1wfF0ryQ4NBJJqYrqCT2w30bQqEcAcnFKwOat/R4Oib
 UsCWDcsdKfsDFPnbtlxTZyTOgMXRfA3vJONkrWfyfXMfZzykrOkOcQKaxtm4RiXDLHEH
 roz5bNkiuUSiV/7Y59BVDU0c2g4P3yzt+eiNgQh2N91VD66NQfzjIY7nDdJcnaAaFTNd
 P1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753603608; x=1754208408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYW5TuePB67HwCH6P3Jbzlj0fkBjQRv8GZKruDniEmg=;
 b=Ng8/zzYPwekcBc9O3tolEhcW6SYsldQprWU+EzUiqdL68sAMZwxnQjlSkJogOMQh+5
 l3rmRlYVxht3yztoQUxL3y7kSnuJlooYTyUmd7Diw+UKLjbrUzB2Im9daYpetox5Wmcv
 5pKFJ1EuWIpSlaI5WfYa5Tdwib/uOHydvu7ss+EwF9T2uhFMqg3JZo6f1K1v02G7O5Ci
 FgU4HbTA4KxVd6KN2F9gzlt3MwQ9Rb005E1wwuT7UaRMCSghbzUGaOn//twCZ4XzFT3k
 08bXW9wn/M++j/2kQNgyt0HkXjlAKd/yBgMRXmcX6NJ6aW5EAUhw6U4Y3t73XdUfzVld
 0C/g==
X-Gm-Message-State: AOJu0Yx/ksjPvoItQ51DjtJxWEmmkJRZnjjB1yP7c8jsnrJ5Oz0cDhEb
 YJt+KnFk9Ra4+SDegIiU5iJUj7BniSqvCSHnpaPCQIlaU0pqt21JcCJ1mh8jm3wTUhgWiBWX7lS
 zOjJc
X-Gm-Gg: ASbGncu5MxtfNpx72nyv2YwRB0lTyK7a3b8tTnLb3dzVUJG6EJRG4sAmRUf3lCKcIsI
 wsYaVO9EyaNx66EqT59VOZKY/9mAXLHsb/r15SLUgRnK+FyF0+kWYQHqlDouK0oMgGlfTvA+0ls
 64EPkbcKRMLBadtNL7W0uhg502aYz3xaAynmZn3YDryzdNb3Z5fZjV8AhUHXUJ5t+UJzjtKArn2
 2PQ+R2OtMydjSi9mC9Y/TXsvf4gw5lwK+jRP2ZZ7x2PeafyXvLctQPIHtMZFgWlavQ7Bz9lshHh
 FBp/Gc6Jnm7xLleQyvRpmCth1vHFrfui3WrKNTjuuMdMa4EbnJ3EXlCUy4or9aCqF5q8k/R2h04
 +KY442sFSlwILtDYtZz2feCnUIp6rmY1wdag3fVWUSRba+WroejMYZkBAxiaCzhD2aVZDfpdJgv
 e62KENxXna2Q==
X-Google-Smtp-Source: AGHT+IGoDxCFC88FETiXCByupKPdD/lhYvGofdkVrYFEl3fGqOgDMBaJ3odNx7vVG8ceJT8FYsftjQ==
X-Received: by 2002:a17:903:1c2:b0:23d:dd63:2cd9 with SMTP id
 d9443c01a7336-23fb31d3328mr132316615ad.46.1753603607588; 
 Sun, 27 Jul 2025 01:06:47 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm3908065ad.10.2025.07.27.01.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 01:06:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 41/82] target/arm: Introduce regime_to_gcs
Date: Sat, 26 Jul 2025 22:02:13 -1000
Message-ID: <20250727080254.83840-42-richard.henderson@linaro.org>
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

Add a lookup from any a64 mmu index to the gcs mmu index
within the same translation regime.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mmuidx-internal.h | 10 ++++++++++
 target/arm/mmuidx.c          | 24 +++++++++++++-----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index f5de104460..b6954cbf40 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -21,6 +21,7 @@ FIELD(MMUIDXINFO, USER, 8, 1)
 FIELD(MMUIDXINFO, STAGE1, 9, 1)
 FIELD(MMUIDXINFO, STAGE2, 10, 1)
 FIELD(MMUIDXINFO, GCS, 11, 1)
+FIELD(MMUIDXINFO, TG, 12, 5)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -98,4 +99,13 @@ static inline bool regime_is_gcs(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, GCS);
 }
 
+/* Return the GCS MMUIdx for a given regime. */
+static inline ARMMMUIdx regime_to_gcs(ARMMMUIdx idx)
+{
+    tcg_debug_assert((unsigned)idx < ARRAY_SIZE(arm_mmuidx_table));
+    uint32_t core = FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, TG);
+    tcg_debug_assert(core != 0); /* core 0 is E10_0, not a GCS index */
+    return core | ARM_MMU_IDX_A;
+}
+
 #endif /* TARGET_ARM_MMUIDX_INTERNAL_H */
diff --git a/target/arm/mmuidx.c b/target/arm/mmuidx.c
index 42b003db9c..a4663c8d87 100644
--- a/target/arm/mmuidx.c
+++ b/target/arm/mmuidx.c
@@ -16,27 +16,29 @@
 #define S1     R_MMUIDXINFO_STAGE1_MASK
 #define S2     R_MMUIDXINFO_STAGE2_MASK
 #define GCS    R_MMUIDXINFO_GCS_MASK
+#define TG(X)  \
+    ((ARMMMUIdx_##X##_GCS & ARM_MMU_IDX_COREIDX_MASK) << R_MMUIDXINFO_TG_SHIFT)
 
 const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     /*
      * A-profile.
      */
-    [ARMMMUIdx_E10_0]           = EL(0) | REL(1) | R2,
+    [ARMMMUIdx_E10_0]           = EL(0) | REL(1) | R2 | TG(E10_0),
     [ARMMMUIdx_E10_0_GCS]       = EL(0) | REL(1) | R2 | GCS,
-    [ARMMMUIdx_E10_1]           = EL(1) | REL(1) | R2,
-    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2 | PAN,
+    [ARMMMUIdx_E10_1]           = EL(1) | REL(1) | R2 | TG(E10_1),
+    [ARMMMUIdx_E10_1_PAN]       = EL(1) | REL(1) | R2 | TG(E10_1) | PAN,
     [ARMMMUIdx_E10_1_GCS]       = EL(1) | REL(1) | R2 | GCS,
 
-    [ARMMMUIdx_E20_0]           = EL(0) | REL(2) | R2,
+    [ARMMMUIdx_E20_0]           = EL(0) | REL(2) | R2 | TG(E20_0),
     [ARMMMUIdx_E20_0_GCS]       = EL(0) | REL(2) | R2 | GCS,
-    [ARMMMUIdx_E20_2]           = EL(2) | REL(2) | R2,
-    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2 | PAN,
+    [ARMMMUIdx_E20_2]           = EL(2) | REL(2) | R2 | TG(E20_2),
+    [ARMMMUIdx_E20_2_PAN]       = EL(2) | REL(2) | R2 | TG(E20_2) | PAN,
     [ARMMMUIdx_E20_2_GCS]       = EL(2) | REL(2) | R2 | GCS,
 
-    [ARMMMUIdx_E2]              = EL(2) | REL(2),
+    [ARMMMUIdx_E2]              = EL(2) | REL(2) | TG(E2),
     [ARMMMUIdx_E2_GCS]          = EL(2) | REL(2) | GCS,
 
-    [ARMMMUIdx_E3]              = EL(3) | REL(3),
+    [ARMMMUIdx_E3]              = EL(3) | REL(3) | TG(E3),
     [ARMMMUIdx_E3_GCS]          = EL(3) | REL(3) | GCS,
     [ARMMMUIdx_E30_0]           = EL(0) | REL(3),
     [ARMMMUIdx_E30_3_PAN]       = EL(3) | REL(3) | PAN,
@@ -44,10 +46,10 @@ const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8] = {
     [ARMMMUIdx_Stage2_S]        = REL(2) | S2,
     [ARMMMUIdx_Stage2]          = REL(2) | S2,
 
-    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | S1 | USER,
+    [ARMMMUIdx_Stage1_E0]       = REL(1) | R2 | S1 | USER | TG(Stage1_E0),
     [ARMMMUIdx_Stage1_E0_GCS]   = REL(1) | R2 | S1 | USER | GCS,
-    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2 | S1,
-    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | S1 | PAN,
+    [ARMMMUIdx_Stage1_E1]       = REL(1) | R2 | S1 | TG(Stage1_E1),
+    [ARMMMUIdx_Stage1_E1_PAN]   = REL(1) | R2 | S1 | TG(Stage1_E1) | PAN,
     [ARMMMUIdx_Stage1_E1_GCS]   = REL(1) | R2 | S1 | GCS,
 
     /*
-- 
2.43.0


