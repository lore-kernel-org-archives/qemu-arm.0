Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1271046ejc;
        Sun, 5 May 2024 18:09:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVodiafozqwaO9p7Nxu28E9DoMPnp96YEOL/tOwwNOGOujH+C2xBI1mKIysYgVLMOXXmbBM36gcNioZbD2/3MhxQP5NGPiI
X-Google-Smtp-Source: AGHT+IHiqJL5jcmwZyjz2+9Js/OL8pi58c7GIDwoahEMM/z89tt7haWXpuGqXrzvH3q68+pFXIPu
X-Received: by 2002:a05:620a:d8a:b0:790:ed33:5b99 with SMTP id q10-20020a05620a0d8a00b00790ed335b99mr12087429qkl.8.1714957746455;
        Sun, 05 May 2024 18:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957746; cv=none;
        d=google.com; s=arc-20160816;
        b=J871qDYF8XrMfh2px5Mmuomx0CUVA0h8SWuS+8+2Up22CT+ICBj+T8x4RXU/fu2EQx
         W00ypJebqGv8ZevLBS5OZ5d5fgPTjdq08rKPFB4jx76HEORFpPdFFEuraxVrumRNr0mB
         W5SZuelMhT/ZS/TJmdGxHWrK3o3+8Lp7VgR1XquEu8FrRhKhtNgyqlGVF+vOutxAc6Nr
         PDvpS6nGgNMWJljRO3C6e0lNOE5jjMUqxyoSgozZUX6hX8+JjIhJlnGFXCEf8IXE2O1c
         5f/xi/5mDx/DaJhpyKS7FhL7WEO7eFySyF3sPcO9UVKvl4lnv0ZhI7D5oZfZQ5AM0u5O
         Yzaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=35+/P/kyt1i2i872aRWBgRr8vPbJ90wWYdDeRzbRox8=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Fa6g8Phj55qlt4PMg69bu/SKr1hLtJ2m9TnQPx+pcerSVPUUFpYYnvKwxbXNz/9dUa
         FIulmobD6Ln9jDbVTBhxpzOrU0f3t/1zMBtQa3X8tUr+h+faZY7GQ9bFlM53kXRPOKb5
         C8DaqIaIXzCK1N8ZDLDftBNAcpsozfycZUP2IvspbLE6DiTfUB+Onng/D9kT3K4tv9Oq
         fu0SqhXsy7G32SrnyVAKA6q2avtwBCtlte9Qr9FM5+soWl0nWy/HQOH/omf+ENsReh5c
         B3alov0vnjVnTHpxkkb9fGPqAAS2dU1HvLkTlVVu1Fj4a0B+leGkED8rAvqiu4AtR+Ib
         Y/VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwtUsncq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14-20020a05620a208e00b00790efb07778si7727709qka.516.2024.05.05.18.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:09:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kwtUsncq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s3mqE-0000Wy-DR; Sun, 05 May 2024 21:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpd-0007eJ-3u
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:54 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mpT-0003LP-Tk
 for qemu-devel@nongnu.org; Sun, 05 May 2024 21:07:52 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5e152c757a5so663284a12.2
 for <qemu-devel@nongnu.org>; Sun, 05 May 2024 18:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957662; x=1715562462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35+/P/kyt1i2i872aRWBgRr8vPbJ90wWYdDeRzbRox8=;
 b=kwtUsncqsKPSldjO6BRQg8aS6qYyVHRGrdkoWk7jF9Ajm9oJKN+yqCLGVZkW7DTbH7
 HWi38iwJNmXcDkUFgljq/At9+EAb39faypNNMn9ImbpdufZJ2ndZkACqElRQhYP7RoD7
 0OQ+J4fOKYO8R/clpBlOw6P+uhGo3CjbyAoQl74MbEF3h4jCzD5DQdPIAMHbdCwEe5wk
 jPJ0OkBOO7eYPTvOEEtAbHiL9P2PdbDH7IyzcQ4gl73iU1Hyy+6lQHdWaYOfHtMC7mOS
 YFEhyCUJNM5ATg6xNO8lqKnTZ298q8J4jrM5fgEiT3eNiG7cfs7nXGk0jIb8wCf9buGa
 5sDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957662; x=1715562462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35+/P/kyt1i2i872aRWBgRr8vPbJ90wWYdDeRzbRox8=;
 b=nsEkKcp9OmxaWTeOuWSOHdHJiOKBfKaAONwngodjWDGUkCgW36d7f6LzGBF2sRW1t7
 +ZlcUOTxDKoz0xWh2XF+GjREPJW+mN58P+mBz70subKRDswGTxh9phXbOO5Ejz7IgrvT
 dXXZpbqbt+Yp8TU7+Nirj16cb797ZGRSpoPfz/dhxvdtJ80TOc3G716o0grwudY31UAv
 D8e7MI7EWZedr7kiVX3jIMCTX1tTdJnCt2fSGUp0hZWpf+MplsKkdEu5Xvy70wiegFeX
 x0KvztCuWyLOu1B0vWlGhjnrDXyZliPGFV73jvnrH0DGsQ4BPdAmdgz6wgPrOAc3iRT5
 rBKA==
X-Gm-Message-State: AOJu0YyLM8xNK4/KgYRSagg/PU+hlIBwFjvA+HJYn8uYL0aAlkVZply2
 R3SW64walRd8F9FnN3k41Y7asSA/5z0Sv0HeO5Pd44IZT//BsKOwX+SO0aDyXVn6jQkOYXtIqS0
 y
X-Received: by 2002:a05:6a20:438e:b0:1aa:5fb4:87ff with SMTP id
 i14-20020a056a20438e00b001aa5fb487ffmr10049846pzl.14.1714957661870; 
 Sun, 05 May 2024 18:07:41 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 kp4-20020a056a00464400b006e580678dfbsm6577287pfb.193.2024.05.05.18.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:07:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 44/57] target/arm: Convert CMGT, CMHI, CMGE, CMHS, CMTST,
 CMEQ to decodetree
Date: Sun,  5 May 2024 18:03:50 -0700
Message-Id: <20240506010403.6204-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7qw5bu7g6NYL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  12 +++
 target/arm/tcg/translate-a64.c | 132 ++++++++++++---------------------
 2 files changed, 60 insertions(+), 84 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 97fe1ef927..d97390cacb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -767,6 +767,12 @@ UQRSHL_s        0111 1110 ..1 ..... 01011 1 ..... ..... @rrr_e
 
 ADD_s           0101 1110 111 ..... 10000 1 ..... ..... @rrr_d
 SUB_s           0111 1110 111 ..... 10000 1 ..... ..... @rrr_d
+CMGT_s          0101 1110 111 ..... 00110 1 ..... ..... @rrr_d
+CMHI_s          0111 1110 111 ..... 00110 1 ..... ..... @rrr_d
+CMGE_s          0101 1110 111 ..... 00111 1 ..... ..... @rrr_d
+CMHS_s          0111 1110 111 ..... 00111 1 ..... ..... @rrr_d
+CMTST_s         0101 1110 111 ..... 10001 1 ..... ..... @rrr_d
+CMEQ_s          0111 1110 111 ..... 10001 1 ..... ..... @rrr_d
 
 ### Advanced SIMD scalar pairwise
 
@@ -900,6 +906,12 @@ UQRSHL_v        0.10 1110 ..1 ..... 01011 1 ..... ..... @qrrr_e
 
 ADD_v           0.00 1110 ..1 ..... 10000 1 ..... ..... @qrrr_e
 SUB_v           0.10 1110 ..1 ..... 10000 1 ..... ..... @qrrr_e
+CMGT_v          0.00 1110 ..1 ..... 00110 1 ..... ..... @qrrr_e
+CMHI_v          0.10 1110 ..1 ..... 00110 1 ..... ..... @qrrr_e
+CMGE_v          0.00 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
+CMHS_v          0.10 1110 ..1 ..... 00111 1 ..... ..... @qrrr_e
+CMTST_v         0.00 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
+CMEQ_v          0.10 1110 ..1 ..... 10001 1 ..... ..... @qrrr_e
 
 ### Advanced SIMD scalar x indexed element
 
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9daa8fe5b0..d338cec77d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5181,6 +5181,24 @@ static const ENVScalar2 f_scalar_uqrshl = {
 };
 TRANS(UQRSHL_s, do_env_scalar2, a, &f_scalar_uqrshl)
 
+static bool do_cmop_d(DisasContext *s, arg_rrr_e *a, TCGCond cond)
+{
+    if (fp_access_check(s)) {
+        TCGv_i64 t0 = read_fp_dreg(s, a->rn);
+        TCGv_i64 t1 = read_fp_dreg(s, a->rm);
+        tcg_gen_negsetcond_i64(cond, t0, t0, t1);
+        write_fp_dreg(s, a->rd, t0);
+    }
+    return true;
+}
+
+TRANS(CMGT_s, do_cmop_d, a, TCG_COND_GT)
+TRANS(CMHI_s, do_cmop_d, a, TCG_COND_GTU)
+TRANS(CMGE_s, do_cmop_d, a, TCG_COND_GE)
+TRANS(CMHS_s, do_cmop_d, a, TCG_COND_GEU)
+TRANS(CMEQ_s, do_cmop_d, a, TCG_COND_EQ)
+TRANS(CMTST_s, do_cmop_d, a, TCG_COND_TSTNE)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5438,6 +5456,28 @@ TRANS(UQRSHL_v, do_gvec_fn3, a, gen_neon_uqrshl)
 TRANS(ADD_v, do_gvec_fn3, a, tcg_gen_gvec_add)
 TRANS(SUB_v, do_gvec_fn3, a, tcg_gen_gvec_sub)
 
+static bool do_cmop_v(DisasContext *s, arg_qrrr_e *a, TCGCond cond)
+{
+    if (a->esz == MO_64 && !a->q) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        tcg_gen_gvec_cmp(cond, a->esz,
+                         vec_full_reg_offset(s, a->rd),
+                         vec_full_reg_offset(s, a->rn),
+                         vec_full_reg_offset(s, a->rm),
+                         a->q ? 16 : 8, vec_full_reg_size(s));
+    }
+    return true;
+}
+
+TRANS(CMGT_v, do_cmop_v, a, TCG_COND_GT)
+TRANS(CMHI_v, do_cmop_v, a, TCG_COND_GTU)
+TRANS(CMGE_v, do_cmop_v, a, TCG_COND_GE)
+TRANS(CMHS_v, do_cmop_v, a, TCG_COND_GEU)
+TRANS(CMEQ_v, do_cmop_v, a, TCG_COND_EQ)
+TRANS(CMTST_v, do_gvec_fn3, a, gen_gvec_cmtst)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -9415,45 +9455,6 @@ static void disas_simd_scalar_three_reg_diff(DisasContext *s, uint32_t insn)
     }
 }
 
-static void handle_3same_64(DisasContext *s, int opcode, bool u,
-                            TCGv_i64 tcg_rd, TCGv_i64 tcg_rn, TCGv_i64 tcg_rm)
-{
-    /* Handle 64x64->64 opcodes which are shared between the scalar
-     * and vector 3-same groups. We cover every opcode where size == 3
-     * is valid in either the three-reg-same (integer, not pairwise)
-     * or scalar-three-reg-same groups.
-     */
-    TCGCond cond;
-
-    switch (opcode) {
-    case 0x6: /* CMGT, CMHI */
-        cond = u ? TCG_COND_GTU : TCG_COND_GT;
-    do_cmop:
-        /* 64 bit integer comparison, result = test ? -1 : 0. */
-        tcg_gen_negsetcond_i64(cond, tcg_rd, tcg_rn, tcg_rm);
-        break;
-    case 0x7: /* CMGE, CMHS */
-        cond = u ? TCG_COND_GEU : TCG_COND_GE;
-        goto do_cmop;
-    case 0x11: /* CMTST, CMEQ */
-        if (u) {
-            cond = TCG_COND_EQ;
-            goto do_cmop;
-        }
-        gen_cmtst_i64(tcg_rd, tcg_rn, tcg_rm);
-        break;
-    default:
-    case 0x1: /* SQADD / UQADD */
-    case 0x5: /* SQSUB / UQSUB */
-    case 0x8: /* SSHL, USHL */
-    case 0x9: /* SQSHL, UQSHL */
-    case 0xa: /* SRSHL, URSHL */
-    case 0xb: /* SQRSHL, UQRSHL */
-    case 0x10: /* ADD, SUB */
-        g_assert_not_reached();
-    }
-}
-
 /* AdvSIMD scalar three same
  *  31 30  29 28       24 23  22  21 20  16 15    11  10 9    5 4    0
  * +-----+---+-----------+------+---+------+--------+---+------+------+
@@ -9471,14 +9472,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0x6: /* CMGT, CMHI */
-    case 0x7: /* CMGE, CMHS */
-    case 0x11: /* CMTST, CMEQ */
-        if (size != 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        break;
     case 0x16: /* SQDMULH, SQRDMULH (vector) */
         if (size != 1 && size != 2) {
             unallocated_encoding(s);
@@ -9488,11 +9481,14 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     default:
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
+    case 0x6: /* CMGT, CMHI */
+    case 0x7: /* CMGE, CMHS */
     case 0x8: /* SSHL, USHL */
     case 0x9: /* SQSHL, UQSHL */
     case 0xa: /* SRSHL, URSHL */
     case 0xb: /* SQRSHL, UQRSHL */
     case 0x10: /* ADD, SUB (vector) */
+    case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
         return;
     }
@@ -9504,10 +9500,7 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     tcg_rd = tcg_temp_new_i64();
 
     if (size == 3) {
-        TCGv_i64 tcg_rn = read_fp_dreg(s, rn);
-        TCGv_i64 tcg_rm = read_fp_dreg(s, rm);
-
-        handle_3same_64(s, opcode, u, tcg_rd, tcg_rn, tcg_rm);
+        g_assert_not_reached();
     } else {
         /* Do a single operation on the lowest element in the vector.
          * We use the standard Neon helpers and rely on 0 OP 0 == 0 with
@@ -10913,7 +10906,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     int pass;
-    TCGCond cond;
 
     switch (opcode) {
     case 0x13: /* MUL, PMUL */
@@ -10950,11 +10942,14 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     case 0x01: /* SQADD, UQADD */
     case 0x05: /* SQSUB, UQSUB */
+    case 0x06: /* CMGT, CMHI */
+    case 0x07: /* CMGE, CMHS */
     case 0x08: /* SSHL, USHL */
     case 0x09: /* SQSHL, UQSHL */
     case 0x0a: /* SRSHL, URSHL */
     case 0x0b: /* SQRSHL, UQRSHL */
     case 0x10: /* ADD, SUB */
+    case 0x11: /* CMTST, CMEQ */
         unallocated_encoding(s);
         return;
     }
@@ -11015,41 +11010,10 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             gen_gvec_op3_qc(s, is_q, rd, rn, rm, fns[size - 1][u]);
         }
         return;
-    case 0x11:
-        if (!u) { /* CMTST */
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_cmtst, size);
-            return;
-        }
-        /* else CMEQ */
-        cond = TCG_COND_EQ;
-        goto do_gvec_cmp;
-    case 0x06: /* CMGT, CMHI */
-        cond = u ? TCG_COND_GTU : TCG_COND_GT;
-        goto do_gvec_cmp;
-    case 0x07: /* CMGE, CMHS */
-        cond = u ? TCG_COND_GEU : TCG_COND_GE;
-    do_gvec_cmp:
-        tcg_gen_gvec_cmp(cond, size, vec_full_reg_offset(s, rd),
-                         vec_full_reg_offset(s, rn),
-                         vec_full_reg_offset(s, rm),
-                         is_q ? 16 : 8, vec_full_reg_size(s));
-        return;
     }
 
     if (size == 3) {
-        assert(is_q);
-        for (pass = 0; pass < 2; pass++) {
-            TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-            TCGv_i64 tcg_op2 = tcg_temp_new_i64();
-            TCGv_i64 tcg_res = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_op1, rn, pass, MO_64);
-            read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-            handle_3same_64(s, opcode, u, tcg_res, tcg_op1, tcg_op2);
-
-            write_vec_element(s, tcg_res, rd, pass, MO_64);
-        }
+        g_assert_not_reached();
     } else {
         for (pass = 0; pass < (is_q ? 4 : 2); pass++) {
             TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-- 
2.34.1

