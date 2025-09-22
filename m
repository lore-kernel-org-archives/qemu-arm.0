Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0FACA100F
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 18:55:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0lck-0005VK-8s; Mon, 22 Sep 2025 14:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lc7-00052b-0h
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:15 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v0lbx-0004Qi-VJ
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 14:50:14 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-77f169d8153so2465655b3a.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 11:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758567004; x=1759171804; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cr6Y93u/SVkcU+goxAfQSNSlnm3F8dUSxwzHBpcNsX8=;
 b=VOgvOkncEpCh/Nz0O8W9bbtqz8Ee//WHT1Le7RoNh1BaC/dOfVF/x4UdgOwqOyjM2Z
 n5k0L1C2B+55/ZHYrID9uJuiYYvmpq4h6cJrGi9fu0ct9yzcrOXGacbwYBwlvKVwg3wP
 twiIz+v8o1Ep2wxxOiKJrrvqGf0AFtpAHwQ6kMeDxUykedw60xmZwv53P5ZWuD9z9t3O
 WewqdBfSX/5fYEpNsMDxxX1zgS/OuGarKWm8EQHnvkvRdjEtVDonvu520CnaYDls3cI9
 dCNIlSzVS+8H3upcKQhvggxtQxNp3OJTT8iRjtSoMUjCd5vhqLoCLJCiucBwYuyIgEqU
 FwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758567004; x=1759171804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cr6Y93u/SVkcU+goxAfQSNSlnm3F8dUSxwzHBpcNsX8=;
 b=oLFkI+yR4k905ITTo/XfRq4zOORuInd5837JKIejcBdwpDv5razqSadmdthiV+Os4Y
 m1FsBsF3oFes1piMpiY3zw5VR8+QkGe8/C6hr4LDJRUCtGdnHxA2ZULvIJgKK/xDXCKD
 U7dlqfCi/lrym8iCHsZfyILY/uiPz26RXuq1/WkL0bkb737xi87EjC6OxzkmqkwQZe+C
 NN/MigII0wARaH30wMn92PMKodKOD2pZAhKj+QeJzRkatrbdbOlrbL24fXxZPcOYuMxu
 pHHWSKOCoj2gIuS7dBfqBk+pHFyDEgK9uJDGLnQtbV62IxlJwEBCzyhXGAp+KvG7zbFd
 +AMw==
X-Gm-Message-State: AOJu0Yw0gpvNwCZu/PFknjlI0Mbiyy4fFIm9PwTB+rEeZxET2XuxDVxt
 GwHl85WbOY8E0biIL8lBpblAHgCl6rsjtgf/82pexmXrZa5H1k+i86FP60BBs8uCytRY4+kemBE
 liWYH
X-Gm-Gg: ASbGncsXkfOrWUsK4TOSfdcILXE5P1SKaxkr81Njnr1Wf7arBtQwxKvJusxVKaplKdr
 Cyx4JVpFkWWVu8PTtAv8X4U4Nk5c2QgWGoa1HoJXfD6Oj9+bPTgGOuuEPpIddvo2Xeuv4jMWNRv
 LYNcy3Z1vz64QK5h0wr2e9A8rnBGOncBdxrfrXC4at8CEfjpYrv1aeoPZmLwka8C3jJuaeqf2G7
 /ZwU7utD4zFCHDqS3Cs6YOiQVVSBBDgRepiNElX41DVoO3RzdOL5IY7bUMOfO1AIjcjLtndNJFZ
 9itjh8uV9vnpkpGhzdN11Rv7DvToFjGjodRpthmp0VraC8zl2wLW95ULcYTluxdvLkpULPa+1mA
 /j0qse4TnwTshWYJ40b8LqTVGTvgH
X-Google-Smtp-Source: AGHT+IEnWNTw5Gv5E13H9j7z/1aw4obXtDacALhBQlZhTKLUE0f/Eg7SZ+7nOmjuhSlC9g9+aTcqIw==
X-Received: by 2002:a05:6a20:72a4:b0:251:2a11:e61 with SMTP id
 adf61e73a8af0-2cfe7274da5mr134321637.17.1758567004374; 
 Mon, 22 Sep 2025 11:50:04 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77e5fe6de75sm10583861b3a.19.2025.09.22.11.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 11:50:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 31/76] target/arm: Introduce regime_to_gcs
Date: Mon, 22 Sep 2025 11:48:39 -0700
Message-ID: <20250922184924.2754205-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922184924.2754205-1-richard.henderson@linaro.org>
References: <20250922184924.2754205-1-richard.henderson@linaro.org>
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

Add a lookup from any a64 mmu index to the gcs mmu index
within the same translation regime.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mmuidx-internal.h | 10 ++++++++++
 target/arm/mmuidx.c          | 24 +++++++++++++-----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/target/arm/mmuidx-internal.h b/target/arm/mmuidx-internal.h
index f494ec348d..962b053852 100644
--- a/target/arm/mmuidx-internal.h
+++ b/target/arm/mmuidx-internal.h
@@ -21,6 +21,7 @@ FIELD(MMUIDXINFO, USER, 8, 1)
 FIELD(MMUIDXINFO, STAGE1, 9, 1)
 FIELD(MMUIDXINFO, STAGE2, 10, 1)
 FIELD(MMUIDXINFO, GCS, 11, 1)
+FIELD(MMUIDXINFO, TG, 12, 5)
 
 extern const uint32_t arm_mmuidx_table[ARM_MMU_IDX_M + 8];
 
@@ -100,4 +101,13 @@ static inline bool regime_is_gcs(ARMMMUIdx idx)
     return FIELD_EX32(arm_mmuidx_table[idx], MMUIDXINFO, GCS);
 }
 
+/* Return the GCS MMUIdx for a given regime. */
+static inline ARMMMUIdx regime_to_gcs(ARMMMUIdx idx)
+{
+    tcg_debug_assert(arm_mmuidx_is_valid(idx));
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


