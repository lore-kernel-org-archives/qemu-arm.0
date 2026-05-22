Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1977ACD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:05:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXxe-0007fz-VG; Fri, 22 May 2026 18:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxc-0007dt-BX
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:16 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxa-0007hd-19
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-3664df32e91so8739167a91.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487393; x=1780092193; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GaNcSBy+W7zw8Y6jf8tkpnAcLzTXgHre4SrWOgQk2Rg=;
 b=sKa7u4LUtWtjbutn0is+YBQbhPFsacQwPVxkWo/oCW+L0mW2aCwXBC4Qz8NHQoRTEh
 htjq1QaXuxgM2QnbKddEGN0AaSg6SPn/r3Oy5LoMSDbP4CMaVbru58Dkev38I4hd2JLk
 UvkA+ddgmSvJTV2j2yIMnf6iCh1fG9ZRooTbHzTgUcmrrXaJxuQMfr6Xw2Ud4mA/wE4r
 1VYv4vMSAZBqo+Hh1fUfxmLKqAn6rNQUH2TEaioTTU6ITTlK7Yl17K9y6AxGXUKbGHH1
 u2hH2tSkO8gxxkN9Ujv+BH+r/38EmrdBafB1nz8DRuUAKTs93SKVjec5z4YCrR7DBT+o
 kTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487393; x=1780092193;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GaNcSBy+W7zw8Y6jf8tkpnAcLzTXgHre4SrWOgQk2Rg=;
 b=MjkKCehaXUvJUvCAi2BTvpxaKbl5ViUiJCOnmw6NooQ73wDDYLRoX19ibbm/8kGfPS
 TaMoTbBypHVyrMNPNfP8hVOduxkIbYZKjtT+xXNfqOnC3gzTB2QAnbnyiSGZ985lhAy8
 VybNMr9USovx7FQDZ0vXVeO6+SRGguVl5Npubq4hVXUU780w3kMFQETcRDrd+9VO4qVP
 FiDDWmTfbpeuA84qNUqIJuZyHBJvnKkk8jnnEt8EQsau3Crr0BWGM77M1CK8nf7isFyI
 o4vxJH6Jo06u3MW0HX7OYraXAJ100613Yzx86bGUl8lS0tiTnfTR4nt8Qs7UqxUnifVf
 mrbw==
X-Gm-Message-State: AOJu0YztML3D6DouybhZucukrVvH/cmVoky6FPWjg9De/uNaSCd82sMp
 Scim6OPb3UzTgY4MCbkbnPd3zy2JvaNh2WVrdTD4S1Agqyn6xfjACVYJL6hA4q7n9iE=
X-Gm-Gg: Acq92OGIl5Efw5VXIdcrJ2FurwKqGA4RiaKq9rZBfk1/ArPZwo1Trnyn11tbh+Jvvog
 4FhR+Wy/zg72WHgCHKsnWABZnHyG/AOzqhXYicP19/nGTHoxO3yg2T6iY5zKU81EigWQ/8cbQO3
 VH/ceXno/UasKpG9I/I0CsqeGUbeIz7qU7bw3sRk0+rUimbwKAFoHoYLCP7LTI6iKde/Oo3Z/h2
 b1khCOlabrmpeR4RVP+zScWSce94KvtOVD5mdOORaNWAYbAQduNWR8zvJh5XkEMHxIfUt4F6ZjM
 1gCG/yGhLv+4d1V38CcEubszNyMD0tOiLBhhHIbaVXKQV/G+aBXq95UxzTLBgqhbXtSDI0fZ3O8
 rXY5iPo5cGJxmwEsbYvTv4cKS0Dsm6elLFS2uydjzbsTAnre6dn9e/XlncWHPV2BF2Lj0kFV8hM
 mEauKYUfWQuDwyq5dvOOwtZxxa0oTi
X-Received: by 2002:a17:90b:578c:b0:368:b176:c5a8 with SMTP id
 98e67ed59e1d1-36a675ff469mr5339565a91.15.1779487392404; 
 Fri, 22 May 2026 15:03:12 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 04/64] target/arm: Implement FEAT_FAMINMAX for SVE
Date: Fri, 22 May 2026 15:02:06 -0700
Message-ID: <20260522220306.235200-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/arm/tcg/translate.h       |  7 +++++++
 target/arm/tcg/sve_helper.c      |  8 ++++++++
 target/arm/tcg/translate-sve.c   | 20 ++++++++++++++++++++
 target/arm/tcg/sve.decode        |  2 ++
 6 files changed, 62 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 21b91b1503..a7ab7e2a31 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1568,6 +1568,11 @@ static inline bool isar_feature_aa64_sme_or_sve2(const ARMISARegisters *id)
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
@@ -1608,6 +1613,12 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
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
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 77fdc5f3a1..273399a732 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -872,4 +872,11 @@ static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
         return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
     }
 
+#define TRANS_FEAT_STREAMING_SME2(NAME, FEAT, FUNC, ...)          \
+    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
+    {                                                             \
+        s->is_nonstreaming = !dc_isar_feature(aa64_sme2, s);      \
+        return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
+    }
+
 #endif /* TARGET_ARM_TRANSLATE_H */
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
index aa7d72a35e..e08802c816 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4254,6 +4254,26 @@ DO_ZPZZ_FP(FSCALE, aa64_sme_or_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sme_or_sve, sve_fdiv)
 DO_ZPZZ_FP(FMULX, aa64_sme_or_sve, sve_fmulx)
 
+static gen_helper_gvec_4_ptr * const sve2_famax_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve2_famax_h,
+    gen_helper_sve2_famax_s,
+    gen_helper_sve2_famax_d
+};
+TRANS_FEAT_STREAMING_SME2(FAMAX, aa64_sme2_or_sve2_faminmax,
+                          gen_gvec_fpst_arg_zpzz,
+                          sve2_famax_zpzz_fns[a->esz], a)
+
+static gen_helper_gvec_4_ptr * const sve2_famin_zpzz_fns[4] = {
+    NULL,
+    gen_helper_sve2_famin_h,
+    gen_helper_sve2_famin_s,
+    gen_helper_sve2_famin_d
+};
+TRANS_FEAT_STREAMING_SME2(FAMIN, aa64_sme2_or_sve2_faminmax,
+                          gen_gvec_fpst_arg_zpzz,
+                          sve2_famin_zpzz_fns[a->esz], a)
+
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


