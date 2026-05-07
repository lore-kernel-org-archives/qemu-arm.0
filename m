Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7D1CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:50:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OE-000099-9p; Thu, 07 May 2026 19:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OD-00008M-2z
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OB-0000yj-49
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:20 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7dd73b7c757so781527a34.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197458; x=1778802258; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aCs6S3RwqHIbMU68g+AI9p1n67JI8P+lk5cSTwfb/kc=;
 b=UlNyRPwONE67JW8LSAc2d+r9tPMZPw9VZ/C5SFz53Huz98XWRG6S+3FjWR+GYhV5Al
 /DTy8s43/f+7q5ZAhsznVaHbL5CoFFfSjznLDtGb3NOlQdfsvLfq7U6nJRRGEeZ0y0pe
 pmTi9dEFM+4r8NcDSuqI8UU/FnV+gT1Wb1ZIXC0QmiJv9BNe0g8scfW5gHzTwFxI2FKW
 2JZs6dpiWsBinzXanJHIlVZFCSSMIkTsYqYXZoCF0Y9OC1yHExkdcXEdUb9MwHxgKzMC
 4s119U10/gyxGjLwoiFkOCDAjpF05+uw03xi5FN/cD6Od7ir4HmcjnMCKjyHunAhFtgt
 Jf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197458; x=1778802258;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aCs6S3RwqHIbMU68g+AI9p1n67JI8P+lk5cSTwfb/kc=;
 b=aP3+ONO4JEx+/oDxLOYk6VasYEdcap1bQBe11AlZMKE7HoG2FONN9OpLa6GHryLvBO
 q5dAEXhv7OK+TC+/DiWt9LqGLY6AvbOlULdn6SxFlGnNlIMWyOslLVrX1YnTSPwyTZa5
 hbkah+CAlRS6H3u4D0+AGxDLkrjNLQnMLSVSkcclzN2rEGJaLZzdSRarLpgsz1ap4pvp
 t/GURpq8VIg8jn7AIytU8mxQavQUO9bLtwumESGisM08UGbgfkJKxtU0bpKKKjO/BQZ/
 CyTkG0+ExyjnGvXMwsAXbZ1MOJLcQcI5ai4pzFT52Hily9iV+e5y4KuIi5w8YX5m5ZJa
 QQpA==
X-Gm-Message-State: AOJu0YzJT9b28YNoaBWFfIgKRowhZG1z7sQxJ2BJFVZpq1a3/HrtyrBf
 WN/KDuYMZ0Jqhb8Iiwzl1loqsOamoxTV6JiXWSNiRXkaEJMheq3u2dTSOP/nZRWDTRM=
X-Gm-Gg: AeBDievRfffsk+FPI79AAoPDjGjbH/FP1DA7m7aHndQkajB5gnrWxqtodqL5rgkMFSV
 yszzIL14GgsjpqxtCjJh6YlifhM4ltLd747ybwdk8Ijj64KZc5H1/33oJM4tz2sfCHR2O+lyXsy
 167fx+feZD5K1HtZI+HetxjoQ8ziHNoGGl8pHXkQrMqk4739ucnW4Nk0YykFpBhxfNK75No42Ob
 oX3y3JwdpN6OF4x07PkoTo39NtkPMq6YEnUu2gQlUGyiRLtG0I1/iKIm7oNDeegxvXlrE9IASIc
 9UtGQU9VHk9czjLw3wkxj5udxqZ2IGB/m4C48F7h54v78AqZ+vper4TKL/AZ+c/VoRtaMVQEdih
 FnnHv2OP/QCF+PPLLFIQIJsocqtLAPc2ZUdaTdxDvrdom1YZzbIVMR/rzLDHJy4vmkoFdW6fbj/
 oCY0FXzOlTQvjWLbL5fF8lbviUjklwsCSzQhQ8dUu732/5dQ==
X-Received: by 2002:a05:6830:a90:b0:7dc:cc70:7788 with SMTP id
 46e09a7af769-7e1def32d7amr6304057a34.7.1778197457701; 
 Thu, 07 May 2026 16:44:17 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 02/60] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
Date: Thu,  7 May 2026 18:43:15 -0500
Message-ID: <20260507234413.643512-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-a64-defs.h |  7 +++++++
 target/arm/tcg/vec_internal.h    |  7 +++++++
 target/arm/tcg/translate-a64.c   | 14 +++++++++++++
 target/arm/tcg/vec_helper64.c    | 35 ++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode        |  5 +++++
 6 files changed, 73 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 252044b057..21d0be73cd 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1061,6 +1061,11 @@ static inline bool isar_feature_aa64_ats1a(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, ATS1A);
 }
 
+static inline bool isar_feature_aa64_faminmax(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR3, FAMINMAX) != 0;
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index 3c3c5dddb7..215df1201b 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -145,6 +145,13 @@ DEF_HELPER_FLAGS_5(gvec_fmulx_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst,
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_famax_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famax_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(exception_return, void, env, i64)
 #endif
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index c7ccb28b18..cc2691b2f6 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -338,6 +338,13 @@ bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
+float16 float16_famax(float16, float16, float_status *);
+float16 float16_famin(float16, float16, float_status *);
+float32 float32_famax(float32, float32, float_status *);
+float32 float32_famin(float32, float32, float_status *);
+float64 float64_famax(float64, float64, float_status *);
+float64 float64_famin(float64, float64, float_status *);
+
 /*
  * Decode helper functions for predicate as counter.
  */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a27c4c6ec..3c6559964b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6478,6 +6478,20 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnmp[3] = {
 };
 TRANS(FMINNMP_v, do_fp3_vector, a, 0, f_vector_fminnmp)
 
+static gen_helper_gvec_3_ptr * const f_vector_famax[3] = {
+    gen_helper_gvec_famax_h,
+    gen_helper_gvec_famax_s,
+    gen_helper_gvec_famax_d,
+};
+TRANS_FEAT(FAMAX, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famax)
+
+static gen_helper_gvec_3_ptr * const f_vector_famin[3] = {
+    gen_helper_gvec_famin_h,
+    gen_helper_gvec_famin_s,
+    gen_helper_gvec_famin_d,
+};
+TRANS_FEAT(FAMIN, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famin)
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index 249a257177..b5ad67b5e0 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -140,3 +140,38 @@ void HELPER(simd_tblx)(void *vd, void *vm, CPUARMState *env, uint32_t desc)
     memcpy(vd, &result, 16);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+#define DO_FAMINMAX(NAME, TYPE, FN)                             \
+TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)             \
+{                                                               \
+    bool save_fz = get_flush_to_zero(s);                        \
+    bool save_fiz = get_flush_inputs_to_zero(s);                \
+    int new_flags, save_flags = get_float_exception_flags(s);   \
+                                                                \
+    set_flush_to_zero(0, s);                                    \
+    set_flush_inputs_to_zero(0, s);                             \
+    TYPE r = TYPE##_##FN(TYPE##_abs(a), TYPE##_abs(b), s);      \
+                                                                \
+    set_flush_to_zero(save_fz, s);                              \
+    set_flush_inputs_to_zero(save_fiz, s);                      \
+    new_flags = get_float_exception_flags(s);                   \
+    new_flags = (save_flags & float_flag_input_denormal_used)   \
+              | (new_flags & ~float_flag_input_denormal_used);  \
+    set_float_exception_flags(new_flags, s);                    \
+                                                                \
+    return r;                                                   \
+}
+
+DO_FAMINMAX(famax, float16, max)
+DO_FAMINMAX(famin, float16, min)
+DO_FAMINMAX(famax, float32, max)
+DO_FAMINMAX(famin, float32, min)
+DO_FAMINMAX(famax, float64, max)
+DO_FAMINMAX(famin, float64, min)
+
+DO_3OP(gvec_famax_h, float16_famax, float16)
+DO_3OP(gvec_famin_h, float16_famin, float16)
+DO_3OP(gvec_famax_s, float32_famax, float32)
+DO_3OP(gvec_famin_s, float32_famin, float32)
+DO_3OP(gvec_famax_d, float64_famax, float64)
+DO_3OP(gvec_famin_d, float64_famin, float64)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 01b1b3e38b..666a293540 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1193,6 +1193,11 @@ RSUBHN          0.10 1110 ..1 ..... 01100 0 ..... ..... @qrrr_e
 PMULL_p8        0.00 1110 001 ..... 11100 0 ..... ..... @qrrr_b
 PMULL_p64       0.00 1110 111 ..... 11100 0 ..... ..... @qrrr_b
 
+FAMAX           0.00 1110 110 ..... 00011 1 ..... ..... @qrrr_h
+FAMAX           0.00 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
+FAMIN           0.10 1110 110 ..... 00011 1 ..... ..... @qrrr_h
+FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


