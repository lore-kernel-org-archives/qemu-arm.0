Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2085CCCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:13:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jJJ-0003QV-N6; Fri, 03 Oct 2025 13:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jI1-00029x-Ja
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:53 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGj-0006J9-9c
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:09:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-329a41dc2ebso2656465a91.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511307; x=1760116107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cr6Y93u/SVkcU+goxAfQSNSlnm3F8dUSxwzHBpcNsX8=;
 b=YBpP0W+fIquM+EaxlqYRhigVSBEMGMVlgU+nxm2HkgkOvPxLvnbnSimIZ7TGlRxHdD
 KEgMyB/O4zceVaCrS8XEQyuz9IaUtG/Klz45pI6fo5NkaCXNPlx7QYD7Au2DQ1drKh9j
 L+I6ILz+SzIarv1ECzesECI2EZQCz84f9FPVk3hQarZtY+AAarpp1FKsmmPW9jsvlnTD
 Yo781C86cvwXpBzYkLHoGEtttjpr31FVU6ZL7SU3mu8r5C5n5/s3zIXd+2vrxPKlIZ9a
 NhJHBdcWP5boZiLBQBrjzrJke8qgUGrN5aevnn6LY1UfkBq6g0xyaAdzE24C99kp8MCi
 nzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511307; x=1760116107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cr6Y93u/SVkcU+goxAfQSNSlnm3F8dUSxwzHBpcNsX8=;
 b=skkR0Rhl39lDbHF5+Hw60mEgKuHDVJ9IEnbN0ocnFHgRr+a1QJlWwDbqnqtr8C0kXF
 9L4E6bB1JDiInCL6yDYLQ31+MwpyssoyYG8drcHHP+fpKQzOBTHxtdahog+oi4oixsxO
 0KwvbLRaOwEePf91g1tQlQdpDjAkhuC0iczC5ViYaP+Q1WKdffqwG4k0T1ar+S2KbCqE
 zrMOoSZEdP/hf/2+2OZwki6i3O3vsSOznay/RGGOTH4JG835RX9/+oGuUz4chWqk3DpT
 0gBVeaH7DIijx1YwG2HJHuOqhNrGE/CBEaJy+YULYQpJwHhD50p0TFLN2KmQ6ZAH06BN
 t0KA==
X-Gm-Message-State: AOJu0YwMcljDUJrnehLgfGeTqb2yPLn6pvJgg9DN2pNi0cja679gg5If
 u/RlnwhSm/268miV0nFRd5b4JFOkTD9Vs7IcJvKWWoVJKNI3sU2feIJ7NFG2VoJL8NdfT19XWIl
 UhLP60OA=
X-Gm-Gg: ASbGncsC0faj8juLe9S7ERaRl9D2sVVTpF85K8CUHFYsN1aKaSSJvRJrWQbxWs7dlc7
 IAT4svZOInVhwuBjO5fy7RNXBEq0ON24nd/Y32lqA4RKUoZLJY4aYiITTzLOByZhdR862+bVPr/
 vbA2Jhag4wbyL1aG9php6pSwk50TK8OvAhyGDlnszrCSoYzgjcWoXi55oFSrpNcTU8np6EV00ot
 N/kaB6fbu2LqaG3sT8jowK59kkCFXkHPCRbhJEEZK992nxUBcNnSA0pdn4RH9j+8sglwK/jne3L
 K8EvHk6HFpZ+NrZtK31NgQ4MBVHEvbb1T8o6kroeho4PhywAMq9RoW7Iurn8CbgE5zsyPkhEcGP
 IPNNA2puKf7j6LACCySitQer+E0BsE3AWwgaXG9E/XgfwZifJ5u7UYP1e
X-Google-Smtp-Source: AGHT+IEaTDwJ/ru2HQy+q8Lm5cfGHa1UBGspNUFsw1eWzubUPt+7rOOII/Y8Ronsg3kXpeq4T+gnuw==
X-Received: by 2002:a17:902:da48:b0:25c:e895:6a75 with SMTP id
 d9443c01a7336-28e9a6a915amr39061825ad.28.1759511306846; 
 Fri, 03 Oct 2025 10:08:26 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 28/73] target/arm: Introduce regime_to_gcs
Date: Fri,  3 Oct 2025 10:07:15 -0700
Message-ID: <20251003170800.997167-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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


