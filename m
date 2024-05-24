Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994115ejb;
        Fri, 24 May 2024 16:26:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQtaiTUgYYZxWMb3lrUgSvei/09ap0Jinz3sodiPX+dexPOn2qG9o+qKVTtQEEuIB4WcuQlK6P0CC4jEc/IurASbE2LLaw
X-Google-Smtp-Source: AGHT+IGLRMrFxo7FpFZAGfRd0rAqRkwnHrTdwqX+ETwTQeqvJyDE2u/0Vw98mLLO7iF1rR+zCjoJ
X-Received: by 2002:ac8:7d86:0:b0:43e:3956:2314 with SMTP id d75a77b69052e-43fb0dfff36mr40242501cf.29.1716593184633;
        Fri, 24 May 2024 16:26:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593184; cv=none;
        d=google.com; s=arc-20160816;
        b=svAcegupM+S/bV9Zy0id3b3XK5SE0vEa4rHVnN3bEH2BUORoLyNwntuCqsMfCbnTKr
         Y87ipiOiMCWltCe19ErHC0CnWZz0BG5f0QNYWLSV5liKEFhUzAego7psdz7+l6GvcshW
         fdtVuGb+iDL2w5+9sOmI79Y7xXkMUqVnsQzFGIdn3qAU+MAXOJo9BY7idP6yOvujqiDg
         fH1EAlrIakB68WBX97zMbAngAXVv7dAuM4k7tRZu2/zb7k9FgFj2HueoLbMwZTT6JDc6
         wXE/uya8SM0hbPCUV3ZWc6+u3yt4yTk5VuFuwPUyRXXaTnJy7tDYmxOQ+jbuvV2IU9ao
         woWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vUxpSrKxVoAKgNl8OSw2nhjum1zUmIGG6Eg1mHx3xuw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=n4kyn2DRNyOIhaAodiEYXh/vJ9VQBMfl7fRhYG5/cklws+qOrGSJ3JaKgQQeGDngoK
         vBZP71EH92uYgOglhYo7iB7OvJ+Uf7tR5RqyqynbLI/y3Q6A4pVPD9jO29dMeSZVPGgc
         JDUNWZYuG+Wf2baWp4nOCt+1RoAp4NV57B2iZ3MAr8no3DUMFjnwSs+Yi6zAJZQ30iQW
         rnQrUc/SCMOmhLnv6/gOusJl87s1ZP1+MXbA/uQwqzEESqZ/N3RQ3JFnJCK1L+VmGTzS
         jgtKImcIm0fFXNf4048Z2iqAogTPKavsg3YevupMjne639aNDHd8T8FAQmHUygT0Iwz3
         Dcbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J0pRYMg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18a6c89si27709301cf.247.2024.05.24.16.26.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:26:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J0pRYMg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeIb-0001Rf-OZ; Fri, 24 May 2024 19:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeI0-0007cl-6Y
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:32 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0006xA-6p
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6f8edff35a0so1240084b3a.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593117; x=1717197917; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vUxpSrKxVoAKgNl8OSw2nhjum1zUmIGG6Eg1mHx3xuw=;
 b=J0pRYMg0Df6Ojz3qgMYR91Gri869EU8fVT45RIasQstiBGvsjr7oKvPdHTUV6fHklM
 XngKjSanZdSvpBqcLouG2QOSgSWGkaNCnQ53y7Mnm/J9sIZzxHWt7t0CxWXIRSRrTwu9
 rKFPPIdFI2piWEATf1puZBUxBVGk2M0dScW+IJKljhYkVVaTzzIdZMbNGK4A/SiJ2qMU
 LvOeAsXpxoLoBLOM8ZD9IPElsLlSOYuB7c5fIlj4wiwUe3dRNJI/4BhHbgRLZf7ILGT4
 94QPba+ADkjnjGkTyDiEEl0J1glLPdiRssiFwTy2w3vgz84SqHJVUdbct0DdEXbsdUNS
 7EYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593117; x=1717197917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vUxpSrKxVoAKgNl8OSw2nhjum1zUmIGG6Eg1mHx3xuw=;
 b=nTbWWcz/9qec7F/GcZNim/L5Wu58wDDh67xg4LSBydxpfp4+TMJAPuHDIjLSjZPiiv
 ATpMBtj6FFV43dvB5dMG6cLZZtCA3uwVPZwpxsfApy/klYCfc0T8AGqa5pnagjWhaVpq
 IwoYf/zuV9bJx2TLV3KuXTV1OJo0aap4o0iAluchcp6BvdR8dYUmtKm/M92bf+BbdFs0
 q3SMTBJoomcxFsSIZH2NcH/oM/z4sc5U8vpWgm7owFZAMDUq9GoTuWlXEjCpK3M1AGj5
 CUraGuFS18MaLtV0Sn3I/BygwLcAYikieTTRfNVr7oMWv4rWrzGHD5XqZMZCKSv+G/Ez
 0Hiw==
X-Gm-Message-State: AOJu0YyB+cFIZqL96d82NhrvzkGpyg2vjHlbKaRl4Ge1So3YqACj1IKV
 waiSYdQDt5TgnCLhu1Wina5jf3p/wsnRZPYJqThn+rSxo2iOwRamCgeDiA2nqcs=
X-Received: by 2002:aa7:9302:0:b0:6f3:edac:d9e4 with SMTP id
 d2e1a72fcca58-6f8f3700476mr3510278b3a.20.1716593116886; 
 Fri, 24 May 2024 16:25:16 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:25:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 62/67] target/arm: Convert MUL, PMUL to decodetree
Date: Fri, 24 May 2024 16:21:16 -0700
Message-Id: <20240524232121.284515-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: N89dAajiwrNj

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  5 ++++
 target/arm/tcg/translate-a64.c | 51 +++++++++++++---------------------
 2 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 07b604ec30..3ea0643370 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -926,6 +926,8 @@ SABD_v          0.00 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
 UABD_v          0.10 1110 ..1 ..... 01110 1 ..... ..... @qrrr_e
 SABA_v          0.00 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
 UABA_v          0.10 1110 ..1 ..... 01111 1 ..... ..... @qrrr_e
+MUL_v           0.00 1110 ..1 ..... 10011 1 ..... ..... @qrrr_e
+PMUL_v          0.10 1110 001 ..... 10011 1 ..... ..... @qrrr_b
 
 ### Advanced SIMD scalar x indexed element
 
@@ -967,3 +969,6 @@ FMLAL_vi        0.00 1111 10 .. .... 0000 . 0 ..... .....   @qrrx_h
 FMLSL_vi        0.00 1111 10 .. .... 0100 . 0 ..... .....   @qrrx_h
 FMLAL2_vi       0.10 1111 10 .. .... 1000 . 0 ..... .....   @qrrx_h
 FMLSL2_vi       0.10 1111 10 .. .... 1100 . 0 ..... .....   @qrrx_h
+
+MUL_vi          0.00 1111 01 .. .... 1000 . 0 ..... .....   @qrrx_h
+MUL_vi          0.00 1111 10 . ..... 1000 . 0 ..... .....   @qrrx_s
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 61afbc434f..1909d1426c 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5468,6 +5468,8 @@ TRANS(SABA_v, do_gvec_fn3_no64, a, gen_gvec_saba)
 TRANS(UABA_v, do_gvec_fn3_no64, a, gen_gvec_uaba)
 TRANS(SABD_v, do_gvec_fn3_no64, a, gen_gvec_sabd)
 TRANS(UABD_v, do_gvec_fn3_no64, a, gen_gvec_uabd)
+TRANS(MUL_v, do_gvec_fn3_no64, a, tcg_gen_gvec_mul)
+TRANS(PMUL_v, do_gvec_op3_ool, a, 0, gen_helper_gvec_pmul_b)
 
 static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
 {
@@ -5694,6 +5696,22 @@ TRANS_FEAT(FMLSL_vi, aa64_fhm, do_fmlal_idx, a, true, false)
 TRANS_FEAT(FMLAL2_vi, aa64_fhm, do_fmlal_idx, a, false, true)
 TRANS_FEAT(FMLSL2_vi, aa64_fhm, do_fmlal_idx, a, true, true)
 
+static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
+                               gen_helper_gvec_3 * const fns[2])
+{
+    assert(a->esz == MO_16 || a->esz == MO_32);
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, a->q, a->rd, a->rn, a->rm, a->idx, fns[a->esz - 1]);
+    }
+    return true;
+}
+
+static gen_helper_gvec_3 * const f_vector_idx_mul[2] = {
+    gen_helper_gvec_mul_idx_h,
+    gen_helper_gvec_mul_idx_s,
+};
+TRANS(MUL_vi, do_int3_vector_idx, a, f_vector_idx_mul)
+
 /*
  * Advanced SIMD scalar pairwise
  */
@@ -10927,12 +10945,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     switch (opcode) {
-    case 0x13: /* MUL, PMUL */
-        if (u && size != 0) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* fall through */
     case 0x12: /* MLA, MLS */
         if (size == 3) {
             unallocated_encoding(s);
@@ -10969,6 +10981,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     case 0x0f: /* SABA, UABA */
     case 0x10: /* ADD, SUB */
     case 0x11: /* CMTST, CMEQ */
+    case 0x13: /* MUL, PMUL */
         unallocated_encoding(s);
         return;
     }
@@ -10978,13 +10991,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x13: /* MUL, PMUL */
-        if (!u) { /* MUL */
-            gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
-        } else {  /* PMUL */
-            gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0, gen_helper_gvec_pmul_b);
-        }
-        return;
     case 0x12: /* MLA, MLS */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_mls, size);
@@ -12198,7 +12204,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     TCGv_ptr fpst;
 
     switch (16 * u + opcode) {
-    case 0x08: /* MUL */
     case 0x10: /* MLA */
     case 0x14: /* MLS */
         if (is_scalar) {
@@ -12285,6 +12290,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     case 0x01: /* FMLA */
     case 0x04: /* FMLSL */
     case 0x05: /* FMLS */
+    case 0x08: /* MUL */
     case 0x09: /* FMUL */
     case 0x18: /* FMLAL2 */
     case 0x19: /* FMULX */
@@ -12407,22 +12413,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         return;
 
-    case 0x08: /* MUL */
-        if (!is_long && !is_scalar) {
-            static gen_helper_gvec_3 * const fns[3] = {
-                gen_helper_gvec_mul_idx_h,
-                gen_helper_gvec_mul_idx_s,
-                gen_helper_gvec_mul_idx_d,
-            };
-            tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                               vec_full_reg_offset(s, rn),
-                               vec_full_reg_offset(s, rm),
-                               is_q ? 16 : 8, vec_full_reg_size(s),
-                               index, fns[size - 1]);
-            return;
-        }
-        break;
-
     case 0x10: /* MLA */
         if (!is_long && !is_scalar) {
             static gen_helper_gvec_4 * const fns[3] = {
@@ -12491,7 +12481,6 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
 
             switch (16 * u + opcode) {
-            case 0x08: /* MUL */
             case 0x10: /* MLA */
             case 0x14: /* MLS */
             {
-- 
2.34.1

