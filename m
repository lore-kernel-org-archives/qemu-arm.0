Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E27EC4452B
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFWo-00028c-4d; Tue, 21 Jul 2026 14:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUv-00015Q-1s
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:21 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUt-0006fv-64
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38e3617ba36so6171950a91.3
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659637; x=1785264437; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zXdLcTVmLaodZE2u8MGvlXRVuwgv/NIQIsqWIhdsBA0=;
 b=qFAZdXG6eVFYRd/DWP2zAC25gZaSJpLUA2n00uuxDAVRSpN1ldZBXAFzpm2B+jc3vU
 y20u7+Q2oGM1dQeotm9BAfjb5/IWQmEGEtrEKivKor99p5pv++/3XYoZUGi2bKglcwV5
 v+CjNtadMqidzkh3Wurp3eZe0LDwodynB9AxrrH8HsDiDpVeRQCjKmKrJj/y0HIdy9ev
 heyf91+Mkko5bbXFmC/23kcZjlazrpSvtKHKaITloT6LleaniSYGmSV5KK6X1oH6TGnL
 /WSrg7pWGyhHtZSLaXS+H8vMctRFdlzhBv4NttdpwiJafT8TT1nZITU/dnRWOn6vaScI
 chwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659637; x=1785264437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zXdLcTVmLaodZE2u8MGvlXRVuwgv/NIQIsqWIhdsBA0=;
 b=I0SHUVV76b8ZDSXMe0DsAZ0HLWA19H3QwGrserW90N9k2sYdDcrvhEJ42TItpV/jOV
 hR5pG3Jl1u3A5FZeRO3LgjPMWDdCCKl7fB4MDpAS8Vrm0kQGuDw9hUzTmM1j2pIonUzo
 dfRR1ub/Of4f3dnkMrZXdZRGEyS5YVph/ghOV7iHaI5thKst+Ouul7vsMDYaUwYIt8pD
 +AV8blZbg0f8XuY9yrfFiQh650l1PUGMCMPGjReqrkyfLuXnzdLcFjs/GgKqTAoNByia
 ei2a0cWF/gAvJoH6W2jV4Xf+Pwx0MZ9b/SJqcWXW6VNAPiBXt09EbioSrTgZsaaYZECw
 HeKA==
X-Gm-Message-State: AOJu0Yxm+c7GaRtNc6jIqrwyZMtc6c5JWsGhWTuCck7s0dk8XsKtf469
 /oAX6ZcooFdX2sBF5lgcT7+92AsnTqnbQPbs0zN51rvsLQsjuV9l60bHVtGOpnJYltg=
X-Gm-Gg: AR+sD10/f2ge46OG+0agVLDVMV/6ORLMZ6T4s0cHyO1waHmB/KjdsVz1nFaEIHg0NAJ
 8DaO8DRgtY4jwAIIyA+yopsNp2XBMarnQgf44xnOXeXJNed8GI7VzNDQR84gYCnBHyjgZmVvm31
 zyVARkQ7OJ4KE2SBVEwBM42KQj8RHiwxTS4cqznWXCXsACAHiOU1vvhaQ91w6871cZW+vaYLJdY
 hIV9+YSRyp7DRVhChAhN+v4pkfMcJpC8QCn20GUB3ycsiPHZ8in7pXEHc+kqODVtM9lDN/G9VTU
 fG4g/sptGQmokF5LCXKg9xbYL1reseNt8ZnSBSpv17sfion/C3QWVsMWJHZThZaF7pUBYpSLyRl
 0OmlxZ5URwFfyYK5pYaq81/HuPWMMQsQSjRnhJdPPTfdBlRjo9K0CvA5b5YK+i4Ebd1A8sUtDXd
 XckTSfAAo=
X-Received: by 2002:a17:90b:2fc5:b0:38e:2c8f:a01a with SMTP id
 98e67ed59e1d1-38e4b4119c7mr20424288a91.11.1784659637131; 
 Tue, 21 Jul 2026 11:47:17 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 14/20] target/arm: Implement and enable FEAT_SSVE_BitPerm for
 -cpu max
Date: Tue, 21 Jul 2026 11:46:50 -0700
Message-ID: <20260721184656.530230-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 target/arm/cpu-features.h      |  5 +++++
 linux-user/aarch64/elfload.c   |  1 +
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/translate-sve.c | 12 ++++++------
 docs/system/arm/emulation.rst  |  1 +
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 44dfc7d457..d3130fbe67 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1605,6 +1605,11 @@ static inline bool isar_feature_aa64_ssve_aes(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, AES);
 }
 
+static inline bool isar_feature_aa64_ssve_bitperm(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SBITPERM);
+}
+
 static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 7afbfca418..4359312ee3 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -181,6 +181,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_sve2p2, ARM_HWCAP_A64_SVE2P2);
     GET_FEATURE_ID(aa64_sme2p2, ARM_HWCAP_A64_SME2P2);
     GET_FEATURE_ID(aa64_sve_bfscale, ARM_HWCAP_A64_SVE_BFSCALE);
+    GET_FEATURE_ID(aa64_ssve_bitperm, ARM_HWCAP_A64_SME_SBITPERM);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 4a44d148e2..c7f8217cb3 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1390,6 +1390,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, STMOP, 1);    /* FEAT_SME_TMOP */
     t = FIELD_DP64(t, ID_AA64SMFR0, SFEXPA, 1);   /* FEAT_SSVE_FEXPA */
     t = FIELD_DP64(t, ID_AA64SMFR0, AES, 1);      /* FEAT_SSVE_AES */
+    t = FIELD_DP64(t, ID_AA64SMFR0, SBITPERM, 1); /* FEAT_SSVE_BitPerm */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 0b522e22ef..08372d9d8b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7420,22 +7420,22 @@ static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
     gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
 };
-TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
-                        bext_fns[a->esz], a, 0)
+TRANS_FEAT_STREAMING_IF(BEXT, aa64_sve_bitperm, aa64_ssve_bitperm,
+                        gen_gvec_ool_arg_zzz, bext_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bdep_fns[4] = {
     gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
     gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
 };
-TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
-                        bdep_fns[a->esz], a, 0)
+TRANS_FEAT_STREAMING_IF(BDEP, aa64_sve_bitperm, aa64_ssve_bitperm,
+                        gen_gvec_ool_arg_zzz, bdep_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bgrp_fns[4] = {
     gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
     gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
 };
-TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve_bitperm, gen_gvec_ool_arg_zzz,
-                        bgrp_fns[a->esz], a, 0)
+TRANS_FEAT_STREAMING_IF(BGRP, aa64_sve_bitperm, aa64_ssve_bitperm,
+                        gen_gvec_ool_arg_zzz, bgrp_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const cadd_fns[4] = {
     gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 4c91bb45c8..fbc98d47d4 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -191,6 +191,7 @@ the following architecture extensions:
 - FEAT_SME_MOP4 (Quarter-tile outer product instructions)
 - FEAT_SME_TMOP (Structured sparsity outer product instructions)
 - FEAT_SSVE_AES (Streaming SVE Mode Advanced Encryption Standard and 128-bit polynomial multiply long instructions)
+- FEAT_SSVE_BitPerm (Streaming Scalable Vector Bit Permutes instructions)
 - FEAT_SSVE_FEXPA (Streaming FEXPA instruction)
 - FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
-- 
2.43.0


