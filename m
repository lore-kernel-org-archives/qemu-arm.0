Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6482CC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 16:48:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd9jH-0003Ev-9C; Fri, 26 Jun 2026 12:48:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wd9jA-00038j-Qf
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 12:48:30 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wd9j5-00086B-2T
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 12:48:26 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-37d7c265ca5so1026051a91.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782492501; x=1783097301; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbeQ4XtAXcgQ2gdqbNRCKayzWt8LQO4Nyk9/MULghts=;
 b=If7W0xp1JHrsk+ITrBRLyaOM2BDK4daU/UascCCLR0RNBhW9rpBvmhoexE2zJMcUoP
 o6xjBK60JAHrLuj4Twy++iG2RfGysac1aZNk/8Pdt3FQvlZAjVnxOmtZQj/V/PAhBqXS
 Ir8sY4357GBvjWVeYUee1//Q9YgzEte4fMrF2R9Z0bc8y/HU+VhfWYTgHwj9uVNGrUzq
 FTYozrBEBbHn/VLRRfTzJpbfFDU737DDVLvcQ1NUykVKyjd4lvDjdW7SnG6Lo1BCNcj9
 jUswZau2ek4vviiH63+5UOPduBGxNF+9Tn1y+L/K9XhN/P0IkRsU8JM38WjUK272fxdp
 OqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782492501; x=1783097301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bbeQ4XtAXcgQ2gdqbNRCKayzWt8LQO4Nyk9/MULghts=;
 b=PLqnWTiPDXyhH/pFi1FnTHxe9fTK655c4nOE3xnuaWcEo3sUYG5N39a5GLQGY7OCR+
 MXTCLmTpz5E8h9FO2SghNtz+CVaVbVA+nOQKMVpfZhdjzWFA1oIVONtQ1q9poxEqkCFd
 aGoGH0rDP/sUTgXKSmbojZbzQKsaZljLNbdwRvIfIHY5qzm8+FDGsOOhsKGV+mD+xBae
 +lmllNL28qlynps52Y2QMTHxBdfke4aq6YyKg6BwvjajI7LV2IOIBVac2hgCo/IlU/l8
 BruQYQ9uSAf9IW7xfKGmKVXfbwbYzSqbb8cSNzvIImEcSRATzeQ2hPVfZGobNouezFxA
 iq7g==
X-Gm-Message-State: AOJu0YzKAXwQ6mItaPlqxa9Baj9wzQ/VKPwCabRR4R5FQcEpb5fbjjGM
 YeDzBc/ibiIZEFdBcqbTufP8DJWq9XhF4VnoHZBS9h+wPbnSZngWV/ZL6+yKgKW3S5bu/tnf2RK
 U40hX
X-Gm-Gg: AfdE7cmehpa8so8N+yEoQt0zX2Uy8IDSC1C9mMG6TwLZgHU0dh4To4s1a8BsjXyTEwY
 FKcf3BDz2Nr6WxJjHPkArR3MjVleO+IxHarYRrrl/oTWcJvsu1TdfXE1/znHllGfhcVc5a4mKwZ
 jIgxNNGN5Hv9SwnA8ZtFyv8WXR2yrArrSXENXPGirFIjnBOTHZpOFAJfXDpczlCyeu2ANAKAars
 2QfC0DsRQZYUm83l45OQDDQufIVVPGL7Iwq2zOs2MWrvf0dy6kAohp9EDylhShNVdgMK1WGGEDg
 D7+QAz0vLdUZnRIsDBbuy2Qu0f7ObNVBAifIkW1kUUZmuW4700g6P8As5XmOiJMek4JqjSEJccF
 leaYsQoD6cRrZldls8294uKtgQ2esFGXEuA+zaRq51fZX6wnkpXn22YkNeqxucpqYiicDl2UfNm
 n8xDDAbbPY0JzwgzGj8KBnLmtnk/K8xb0/WhKQkBizFViI/YewHIUyXNHrstde
X-Received: by 2002:a17:90a:9f89:b0:37f:9ce1:cdaa with SMTP id
 98e67ed59e1d1-37f9ce22201mr572541a91.32.1782492500924; 
 Fri, 26 Jun 2026 09:48:20 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37e1c93272fsm1138520a91.14.2026.06.26.09.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 09:48:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2] target/arm: Implement and enable FEAT_SSVE_FEXPA for -cpu
 max
Date: Fri, 26 Jun 2026 09:48:19 -0700
Message-ID: <20260626164819.770787-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

v2: The enable test for this is (FEAT_SVE || FEAT_SSVE_FEXPA).
    I thought maybe writing it all out like this is clearer than using
    TRANS_FEAT_STREAMING_IF with a one-off combination feature test.


r~

---
 target/arm/cpu-features.h      |  5 +++++
 linux-user/aarch64/elfload.c   |  1 +
 target/arm/tcg/cpu64.c         |  1 +
 target/arm/tcg/translate-sve.c | 21 +++++++++++++++------
 docs/system/arm/emulation.rst  |  1 +
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index c3eeecbea9..bdeb72bd77 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1580,6 +1580,11 @@ static inline bool isar_feature_aa64_sme_mop4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMOP4);
 }
 
+static inline bool isar_feature_aa64_ssve_fexpa(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SFEXPA);
+}
+
 static inline bool isar_feature_aa64_ssve_aes(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, AES);
diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 9b93969850..cea286cce0 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -174,6 +174,7 @@ abi_ulong get_elf_hwcap(CPUState *cs)
     GET_FEATURE_ID(aa64_f8mm8, ARM_HWCAP_A64_F8MM8);
     GET_FEATURE_ID(aa64_f8mm4, ARM_HWCAP_A64_F8MM4);
     GET_FEATURE_ID(aa64_ssve_aes, ARM_HWCAP_A64_SME_AES);
+    GET_FEATURE_ID(aa64_ssve_fexpa, ARM_HWCAP_A64_SME_SFEXPA);
     GET_FEATURE_ID(aa64_sme_mop4, ARM_HWCAP_A64_SME_SMOP4);
     GET_FEATURE_ID(aa64_sve2p2, ARM_HWCAP_A64_SVE2P2);
 
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 2cf335c956..7151c509f9 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1384,6 +1384,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
     t = FIELD_DP64(t, ID_AA64SMFR0, SMOP4, 1);    /* FEAT_SME_MOP4 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, SFEXPA, 1);   /* FEAT_SSVE_FEXPA */
     t = FIELD_DP64(t, ID_AA64SMFR0, AES, 1);      /* FEAT_SSVE_AES */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 79e8e16b24..fc4cc8c479 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -1369,12 +1369,21 @@ TRANS_FEAT_NONSTREAMING(ADR_u32, aa64_sve, do_adr, a, gen_helper_sve_adr_u32)
  *** SVE Integer Misc - Unpredicated Group
  */
 
-static gen_helper_gvec_2 * const fexpa_fns[4] = {
-    NULL,                   gen_helper_sve_fexpa_h,
-    gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
-};
-TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
-                        fexpa_fns[a->esz], a->rd, a->rn, s->fpcr_ah)
+static bool trans_FEXPA(DisasContext *s, arg_FEXPA *a)
+{
+    static gen_helper_gvec_2 * const fexpa_fns[4] = {
+        NULL,                   gen_helper_sve_fexpa_h,
+        gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
+    };
+
+    if (!dc_isar_feature(aa64_ssve_fexpa, s)) {
+        if (!dc_isar_feature(aa64_sve, s)) {
+            return false;
+        }
+        s->is_nonstreaming = true;
+    }
+    return gen_gvec_ool_zz(s, fexpa_fns[a->esz], a->rd, a->rn, s->fpcr_ah);
+}
 
 static gen_helper_gvec_3 * const ftssel_fns[4] = {
     NULL,                    gen_helper_sve_ftssel_h,
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 3ef5b53e8a..a12471aafe 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -175,6 +175,7 @@ the following architecture extensions:
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
 - FEAT_SME_MOP4 (Quarter-tile outer product instructions)
 - FEAT_SSVE_AES (Streaming SVE Mode Advanced Encryption Standard and 128-bit polynomial multiply long instructions)
+- FEAT_SSVE_FEXPA (Streaming FEXPA instruction)
 - FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
-- 
2.43.0


