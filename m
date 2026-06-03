Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05790CD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:31:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIW-0007ER-5Y; Tue, 02 Jun 2026 23:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIF-0006rH-HY
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcID-0003kZ-IY
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:22 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-8419ab3a297so3941798b3a.2
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457359; x=1781062159; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNC9uxOlge1Zc9qz5XYFu2TueBOfJcxpuXKeADefLUQ=;
 b=zaYbJFRN2lpnkCqLTTYRqP7+aa5ZGoMVSKPEqXM7GsBL2WVLnMlblFWLxCgPcBeiOC
 hgJKzmmLMNIuPGLzRn3fPONq8BZw3xBR2Lqb7z5ECQcp1pp4VBvogZ9xcFGoKzL1iE58
 GSzX9W1+WuDaZmnADKNkRlEZBYGe0+L8/JnNLWwSRa1vi4UfX+BEvYETBZXDmNEx3NbD
 btXDuWHwJgq8aqpGCsl2w7fZZ+HqStBQGUJWBsHfw3XsOhckiWhbm2LY7eVbh1U/Mf9H
 0fFBl1tRTHwSKb0eUsbuZlu+BkKUWw5cF90Xs4cn1kASTrKByr2X84p3/XtnjVcdEmlB
 FF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457359; x=1781062159;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZNC9uxOlge1Zc9qz5XYFu2TueBOfJcxpuXKeADefLUQ=;
 b=U9t7Qyjh+FWfqA19XcJT7s/JFvJT8NsnmzohujmBF7HMuzrCGHrmC6zeEaH9AqZEAp
 49vFOdGvaYX528XE0shEFQmr9z2gMjf/63Q0EBqG24xfnGQkHe2BGvenw1TPiTgLhljz
 vR/AdwWLUE3ibTFgBRrYQi5hM347510JoNJYVyogUjYGj6oZXHPLP8R/D7/bGnsAwUuk
 x8nwodLDM95BGHJTm+I7B0WxidYl3Q2CW1krRYgAwK6OrgTrmitHnuPfdYF27beODt6f
 ElsO3qeYPr/ENYxhS54EO7HSRvVfsqYSuYoK3FUZ+8i3PrTVT2UcPyPDj7g5fiXnnF50
 Qv5w==
X-Gm-Message-State: AOJu0YzTK//VWr7R6nsVdkxXaNIIUMnGJ78lN3myOjfmtsKYbqGhv5NF
 /nAwbzCWKpDYxPv7zL7NqIXYoxNxOjptVpYvE1Ndbx1opkehfRawCW1TxpZpTYxSVI4=
X-Gm-Gg: Acq92OFTjZbe7K1bS6m306/1y2sW84/i6I2FRUDN/+Rx/0mcbItYHLG3imJDV0v/kFN
 cxzzeQoRJ1oO4/KW/bNHlSekLp4B6DMSy3Dt8oymr3Lgt7V4188x7qkuR+gJA7hpEKNW7AsWw/G
 nZk+T9pAEL9RpuMYUjzRQMVhk5CHkSeKKYT1Be162dSY7NexlG07w5EMMKF+s7syPLoARqhvirz
 i3g2+5Q6NpHStlO3uxSSA1DCAEwTEmEbQsOwGTtm8bLJj5vlAswuayKpUMiovG606/GVdzjl+Sr
 kB6Pmw76pQXpnR7wtcDFdXosryPoWkYBrzdAuPpR9vg3KjsjkqYfBqR5AhVe7e+2G1GMYHE/1EL
 0SkaS7DYyoRYYKrC7RsbkFWPoOcid7vM43t2zBXvQk2nJKgd4UiAxtpan2Vhk98LrbHFBwuIX30
 9iv/C31NYxbXpy/tdhBShylDoNhxyTmE1LymBHJdk=
X-Received: by 2002:a05:6a00:ab8f:b0:842:6004:3fb9 with SMTP id
 d2e1a72fcca58-84284e932f5mr1606376b3a.25.1780457359329; 
 Tue, 02 Jun 2026 20:29:19 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 33/45] target/arm: Enable FEAT_FP8FMA,
 FEAT_SSVE_FP8FMA for -cpu max
Date: Tue,  2 Jun 2026 20:28:42 -0700
Message-ID: <20260603032855.106930-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 2 ++
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 06c14e82ea..a82d65a681 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -226,6 +226,8 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
                                ARM_HWCAP2_A64_F8E4M3 |
                                ARM_HWCAP2_A64_F8E5M2);
+    GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
+    GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index e466ab5b8a..6ad841c51b 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1378,6 +1378,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
@@ -1396,6 +1397,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 41fa9bfca3..78d1938656 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -76,6 +76,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
@@ -161,6 +162,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


