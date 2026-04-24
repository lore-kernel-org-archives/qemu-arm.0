Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA50DFB44A6
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:32:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Co-0008Q1-As; Fri, 24 Apr 2026 00:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CP-00074t-Cj
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:30 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8CN-0002qG-P3
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:31:29 -0400
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-479d9b155deso1853226b6e.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005086; x=1777609886; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMD0VgSvOctoffSNQ7zz1Fm9S+qkzJ2gc0NItSVQ7FU=;
 b=ep6p+HRmpzEo4TmJEPAdKDtX7ZHi7wAVGmc9k52e9CxMhkW68LHtRGSAxsY7IezOzM
 bxAKg0q66DE1UHZTLoNhAp4gj8Sg5NgfzbmKTWce0Th74jAJ0ziyy5ey+y0cRpK7os4V
 D43RPNZYNCgTIxbun5JqX6SLbP5dQYPUyebixKQP0oEqQKL7aWKD6Ld8KwBIWWKJQrLi
 11SxRlM6aD8FIFfroi322IG/greQZUTdJ01Mus1VnabYkSMkmSpTuhcu9KzE3Q9vLiCP
 1C5tJH3PRSPAtU7iM0wqfOYT2FxzjWdRIp2fPg/u5nlPp/jIEuLAQ7neNPHcAeQMG2Rx
 tFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005086; x=1777609886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZMD0VgSvOctoffSNQ7zz1Fm9S+qkzJ2gc0NItSVQ7FU=;
 b=smfFuSe2HQ7kIVyakLkj9iSy7+MSkpC4scWgeFSMEBQ+At3TFuJKO5YJnA2pYynZc/
 3RFd9sq7VbXJUV5jKyEOBBrSfGka0XtUoKbPvVbI2ELcvmc0/CXkm0xg7DyJWpXMdIpz
 cHr9ou39pYrfmgiKJ2N+XBvbEEYj2Bls4vSNI4oyJ59cVJBic4xsvK9YZBmyTonaIMKS
 Mg3KxXcolSgksKtAU004KA4CbG0eva3LcBiH2gxesp/Eazz0BM2Ie1IT6EGUwbYGODTu
 o+rUT+MRt65sNhHoh5nNONrastI0u8/2/AZhzaLAvMdyNYvh9l3vA3sYLbFKWQ4lf59Z
 m/cw==
X-Gm-Message-State: AOJu0Yw9smrjpwt4hOW23OmmrgpruJhSldGVIQDD903UXpm1kdFp2iWJ
 fkRY/KiW/yK//cF3NvNqzHoR3lXOTDljz68q/DdSbjpil8+029xHMOXu9o3/oZCV5FRvFFXFgym
 ie16L3Vc=
X-Gm-Gg: AeBDies69iB53bACVrdLKwixDsu1yWj+pRj3nnA97bEaijkoQ4LXin/mKjYc3aPAwv4
 z9/orCwjKsgZhR9V3HbMCUJXnC8QA5PFqyt2rx8x3MJbzmEYjRDKY5+Ytp8KWClWc1whXMa3FzI
 HdNsO68qfDK8BayuvrlIUsQ3DTudaE/LF0CiEZ6YO/jRzqN1QPPvyCkzqlWB/qbLiVXQVMA+RLI
 xYloLoQ29K2Xay7kwBuQUlB2UgfG9I4bRLw9GPaTRlWOdtlDutY4gmhkwCFgpg1wV6tUMkuuz1Q
 7u9vELt9Go8aR5Zk7av1En9o50GoJA0FbEcZji1t2M96PfO86Kx7gspozHc3I66P+jxPLTwpjaG
 B7C7ugGmsc0cKfbl9tHAV+zPzVBDoFL/ApnUh0dc6Mn3bWAEe4N58QOrdmcScMIN5hzQOVUaiD4
 0Oqbvi/2syvDXIB5TGC5qMSSee4tF7LLrVhQ5mptBTpYNog6m3aJIcuNvA2YCaog==
X-Received: by 2002:a05:6820:2002:b0:694:9175:9d47 with SMTP id
 006d021491bc7-6949175acafmr10033325eaf.18.1777005086461; 
 Thu, 23 Apr 2026 21:31:26 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:31:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 15/40] target/arm: Implement ID_AA64FPFR0
Date: Fri, 24 Apr 2026 14:29:49 +1000
Message-ID: <20260424043014.46305-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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
 target/arm/cpu-features.h    |  9 +++++++++
 target/arm/helper.c          | 13 +++++++++++--
 target/arm/cpu-sysregs.h.inc |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index ddef6fbeb0..df070afdbf 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -401,6 +401,15 @@ FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
+FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
+FIELD(ID_AA64FPFR0, F8E4M3, 1, 1)
+FIELD(ID_AA64FPFR0, F8MM4, 26, 1)
+FIELD(ID_AA64FPFR0, F8MM8, 27, 1)
+FIELD(ID_AA64FPFR0, F8DP2, 28, 1)
+FIELD(ID_AA64FPFR0, F8DP4, 29, 1)
+FIELD(ID_AA64FPFR0, F8FMA, 30, 1)
+FIELD(ID_AA64FPFR0, F8CVT, 31, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6ebd121050..f0f00c6eff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6510,11 +6510,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = 0 },
-            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64FPFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64FPFR0) },
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6745,6 +6745,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64SMFR0_I16I64_MASK |
                                R_ID_AA64SMFR0_SMEVER_MASK |
                                R_ID_AA64SMFR0_FA64_MASK },
+            { .name = "ID_AA64FPFR0_EL1",
+              .exported_bits = R_ID_AA64FPFR0_F8E5M2_MASK |
+                               R_ID_AA64FPFR0_F8E4M3_MASK |
+                               R_ID_AA64FPFR0_F8MM4_MASK |
+                               R_ID_AA64FPFR0_F8MM8_MASK |
+                               R_ID_AA64FPFR0_F8DP2_MASK |
+                               R_ID_AA64FPFR0_F8DP4_MASK |
+                               R_ID_AA64FPFR0_F8FMA_MASK |
+                               R_ID_AA64FPFR0_F8CVT_MASK },
             { .name = "ID_AA64MMFR0_EL1",
               .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
               .fixed_bits = (0xfu << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index b99579f773..6e8b335b8f 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -3,6 +3,7 @@ DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
 DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
 DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
 DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
-- 
2.43.0


