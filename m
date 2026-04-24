Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523A0FB44A7
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Bq-0005xP-TO; Fri, 24 Apr 2026 00:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bl-0005jM-KK
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:49 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Bi-0002YF-6D
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:30:49 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-40974bf7781so6628408fac.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005042; x=1777609842; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o688HWl5XrNHYPI7Z2Xn/6ecck2Zhe/qTWuxAA2gZDk=;
 b=XWd1AnBmJqCVi8SEC8u4S+wcD9JGEuUpXBAwzab2XjGsnIhXhZTydaULzBVwGjhPaI
 p6PBF/CDjFVLTm3VFOMm28jXsHERCVV+tMv+ECTpd5/owKWzoMhzxPOGXdPhFDNCRHKl
 eKHIdxvVnQVJkBKbBLD5s0YQctrvCAUmZfEIAoM+i3pzAOr4Rlnsid3gO8AvtTOrWEG8
 ShseKZjtFwd9M56jP5t98YOw9OXPvaSGTvlnVQUY55DlA/kok4krtTSJdfhsYR34rX0m
 26HLS2eI5Siw71crjfDNcMTE/lz49pIqA6CJplv2vZ13Yb5Do/xyr7oHqrlza5H8shW4
 PfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005042; x=1777609842;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o688HWl5XrNHYPI7Z2Xn/6ecck2Zhe/qTWuxAA2gZDk=;
 b=Zu4uye7+3LKK4dcpIkivpzTqwtt9M8KQdhV93agcV3XLSG6jlmU38l7V0Yj405Tym5
 BANU/101OYRtYz90Kj3jvSebxeTfG4ucNEpzGeRBKKyLi8yZnBLjDc/4UVRSP5MjWZos
 JazAdMx30fiH+UvT/JzSbZeJ3+Nh9YWRaxMHHW06LgvkbTx1emQmtmt+v9tcJOKL/9lg
 1ZqGwNPdnhjhhG+Mg17LQjENQXVVtjPJKuPbnUqrZpoCmfn64LD+HjYPAgiMGsoCSXKq
 zThrX+TNP/VgaIDp8sDFHhSEPg5hu2qH0zbKiLjPUOI5yePbM43BHl2trueLRGaJMQ7D
 ZPKg==
X-Gm-Message-State: AOJu0Yxiar34WI65WE06huMdarmSdWgyd1E2kQSiPtuzir61aQp8PsE6
 DUXDhekHsS4i9MT01Rl/dYW5wwJMJHsI9tY+e0JNcyeUVuDnblsf8REuz0sGv1ptShpIz8o1ttc
 PoGZM1f8=
X-Gm-Gg: AeBDieuxUH7rByXNatmZ/VOJ4e/0P8wrAGKtXM/v+qgeFIUIG3XsfcaUnQLza4UMmgF
 RxeRJTjngfKD/dd4MwNUlOMR7eSXDMaOAKj8bdjJTGYc386pw6pKr6OESvNhXV7RhY5Kw04fNbu
 1MMAFFfuE6I2QlSwGp7CgtAy70KzZZe7bO76Mnu/hRA6hFjraE0OwpTdkXsBSOga/6rd5/e7snM
 n+pzLKzq7e1soLbdIQrgoOsAvOJXJ0d4+NznkLnQi7wYB78OHhIjUHoeoMvOrWz90z4Q0xxWHei
 MQvmBNgOF0p1lZCl+Kl3HUKPVjP3f/7IjMohAubbaPaCBLOKimecVKsTo/KLs2OaxsOhdo6Baf4
 zcrXukre9ISuEhqXPoFPFX7Q5QqWJJjvrP4COg/0YSA2WzQClEh7/YPSSBgWYEHW/lGze31JB5E
 PUFzfReCRnOkEnhfK0yISJvV8eoaEjfwwz84VBlYuo8Ls64OhJ/I63TjUcLIAhig==
X-Received: by 2002:a05:6870:6111:b0:423:b4e9:b8fa with SMTP id
 586e51a60fabf-42a99ae67f4mr15681021fac.23.1777005041715; 
 Thu, 23 Apr 2026 21:30:41 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:30:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 04/40] target/arm: Implement FEAT_FAMINMAX for SVE
Date: Fri, 24 Apr 2026 14:29:38 +1000
Message-ID: <20260424043014.46305-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
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
 target/arm/cpu-features.h        | 11 +++++++++++
 target/arm/tcg/helper-sve-defs.h | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c      |  8 ++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  2 ++
 5 files changed, 37 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index a2ce38faa3..03631018d7 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1549,6 +1549,11 @@ static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
     return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2(id);
 }
 
+static inline bool isar_feature_aa64_sme2_or_sve2(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2(id) || isar_feature_aa64_sve2(id);
+}
+
 static inline bool isar_feature_aa64_sme_or_sve2p1(const ARMISARegisters *id)
 {
     return isar_feature_aa64_sme(id) || isar_feature_aa64_sve2p1(id);
@@ -1589,6 +1594,12 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_bf16(id);
 }
 
+static inline bool
+isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_faminmax(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index c3541a8ca8..1eebb64a29 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -3166,3 +3166,17 @@ DEF_HELPER_FLAGS_5(sve2p1_st1ss_le_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i
 DEF_HELPER_FLAGS_5(sve2p1_st1ss_be_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
 DEF_HELPER_FLAGS_5(sve2p1_st1dd_le_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
 DEF_HELPER_FLAGS_5(sve2p1_st1dd_be_c, TCG_CALL_NO_WG, void, env, ptr, tl, i32, i64)
+
+DEF_HELPER_FLAGS_6(sve2_famax_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famax_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famax_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve2_famin_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famin_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_famin_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 062d8881bd..9968600f75 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4742,6 +4742,14 @@ DO_ZPZZ_FP(sve_fmulx_h, uint16_t, H1_2, helper_advsimd_mulxh)
 DO_ZPZZ_FP(sve_fmulx_s, uint32_t, H1_4, helper_vfp_mulxs)
 DO_ZPZZ_FP(sve_fmulx_d, uint64_t, H1_8, helper_vfp_mulxd)
 
+DO_ZPZZ_FP(sve2_famax_h, uint16_t, H1_2, float16_famax)
+DO_ZPZZ_FP(sve2_famax_s, uint32_t, H1_4, float32_famax)
+DO_ZPZZ_FP(sve2_famax_d, uint64_t, H1_8, float64_famax)
+
+DO_ZPZZ_FP(sve2_famin_h, uint16_t, H1_2, float16_famin)
+DO_ZPZZ_FP(sve2_famin_s, uint32_t, H1_4, float32_famin)
+DO_ZPZZ_FP(sve2_famin_d, uint64_t, H1_8, float64_famin)
+
 #undef DO_ZPZZ_FP
 
 /* Three-operand expander, with one scalar operand, controlled by
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5bace3fda1..756c4373b5 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4252,6 +4252,8 @@ DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
 DO_ZPZZ_FP(FSCALE, aa64_sme_or_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sme_or_sve, sve_fdiv)
 DO_ZPZZ_FP(FMULX, aa64_sme_or_sve, sve_fmulx)
+DO_ZPZZ_FP(FAMAX, aa64_sme2_or_sve2_faminmax, sve2_famax)
+DO_ZPZZ_FP(FAMIN, aa64_sme2_or_sve2_faminmax, sve2_famin)
 
 typedef void gen_helper_sve_fp2scalar(TCGv_ptr, TCGv_ptr, TCGv_ptr,
                                       TCGv_i64, TCGv_ptr, TCGv_i32);
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index ab63cfaa0f..078a085a79 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1130,6 +1130,8 @@ FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm
 FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
 FDIV            01100101 .. 00 1100 100 ... ..... .....    @rdm_pg_rn # FDIVR
 FDIV            01100101 .. 00 1101 100 ... ..... .....    @rdn_pg_rm
+FAMAX           01100101 .. 00 1110 100 ... ..... .....    @rdn_pg_rm
+FAMIN           01100101 .. 00 1111 100 ... ..... .....    @rdn_pg_rm
 
 # SVE floating-point arithmetic with immediate (predicated)
 FADD_zpzi       01100101 .. 011 000 100 ... 0000 . .....        @rdn_i1
-- 
2.43.0


