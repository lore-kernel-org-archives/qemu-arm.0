Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994798ejb;
        Fri, 24 May 2024 16:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8MEuS+tIcVbm5SJghJxLDcBuV4/R9jbLZvVIa/Mq4MYUPBPAKNBQeDCM/Wv4/5btrS1bqRygw7bKhYFxCf4OVXWJVyADs
X-Google-Smtp-Source: AGHT+IG4OKL86zRXybgPYAIw8/qvSl5FpOkgwePR0N5R4etaVgcZF1u9OZbgdI8xn1MDASYj0FgN
X-Received: by 2002:a05:622a:1346:b0:43a:357c:5639 with SMTP id d75a77b69052e-43fb0e922e6mr40497111cf.32.1716593319937;
        Fri, 24 May 2024 16:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593319; cv=none;
        d=google.com; s=arc-20160816;
        b=FcN9y8DtBO934vXPSKPNrY9HlBQNaIQk4FVvQFAs6io0t+hckwgI1tUaN2ZC7SFQdZ
         84KBj6//Wq7sxDTG7kzBwzi56bYqJHdUfkExcCufLwbq57CJl336bQpG2vCc411r3zZv
         WmIV1gwOR+aUyEazuxrgX+O9YvT/L1K6fuU19t6R5RUCbXvkMAdOYkYsUKLjPmQnu2gE
         KYz9o7UDo6ZEzXZJJ1o6Vc62lEJecsD3fYpNklxB6AptLT4AdVKln4dlbrf2n6OJ8dlF
         nR1u3km1jzEFazCNmzOUSw8R86atAXe7NzESgWbT/P3SGUixIP7lzEmOR9w7jzP95VCz
         Cspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iMbUPJ6N6KonzyEnUgiB4FTCa95bEc5bnf6ZFlswq0s=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=Y2VKLVCuLOa14OwRLGc/Fnmeb1f2BLuq+jf7I60Z0KTU6P8MzwBaLch0HkzgeaETef
         05knD6jqZ/Hyu6rjLAD59LR7MGebmoBeZEfLi2dDDAWgFkda/bipAVfyeGd2s0QyPwp8
         m0j60iffMsFRCbf2z1zW7+F5CaAGhLk+FirqW1WrIXbYD6OxzZncrFnzJO6Bf98u0D6e
         gUeE9YmgHGRkGIN3RCRIGX8zj6JrUpewmDidiLOhg7lWgYVYFRjkCjtEYK6nTpZYN1ZB
         w05bAPZ3NiA55pCrZrOfkSxqw/uEE0rcjSyVn4M3o9g9FFhM/Fs+biCfqQRhZOwLrdRi
         32XA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCdx84Ky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b3144si29239561cf.505.2024.05.24.16.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCdx84Ky;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeJI-0003hX-23; Fri, 24 May 2024 19:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHt-0007Of-Vr
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:28 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeHW-0006fg-9K
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:25:17 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-681953ad4f2so1100881a12.2
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716593100; x=1717197900; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMbUPJ6N6KonzyEnUgiB4FTCa95bEc5bnf6ZFlswq0s=;
 b=LCdx84KyL6SmzYqzVuo6ync8mYX/+Qp4MrwZW2kR1Pz5/fgxOyZrB4xeahSRVWaJdd
 sflG45CHz2eJvR3VnqzdSRnDgbnxn4LDdF7uBXdz4FCEhDcNR2ZzK7GCvLLGUMgA3503
 /RrorrBxL4EN5Nu5g90rVj6VEW76hv3kd8izaqC2DLufAGnsUBO3sI0bgKkdJkxd8Coi
 Hyxrtb6adqo+eUd22IPJiGTExtmmyYdteP/31mBilwBR5H7ZURIqoioJyKrsgiG6yW+h
 gayc8O/wTfGIq/+9/9wi9xF381zS+6ti1DdKwrJxv5qnRFI0DzoLTweZ+Mr+TGKRRe44
 byQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716593100; x=1717197900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iMbUPJ6N6KonzyEnUgiB4FTCa95bEc5bnf6ZFlswq0s=;
 b=hNpVSEUajAMNOWOJLGPihRP/4sEcLuaTlkgo685TTiQj8dkmgH+26pOEjjyriD/1Vw
 fXt/bIz/HPtvFbbQY0xW0xRbxYMRSzMR8P/G65MMVP8g958pLTdaAXG0PAgYSzxMeiwn
 SvLC/yArNNnpy78FGFEM+9Echrgd3Rdj3XVA8lwPhe73n/AwkAYwJg1sadz+87QhjoAl
 pDCqIOh1VYx0hss26E5+C0LONeCsEgiGA/lGl6Fjm1ee3VuMNOldhW9Df4b3UG6sfBF+
 yLdQ4STw0+8YnEskr9NUnBrvOxTfX7PzLkC1QEutVxwPMA6ptKcbQ2DmbLswgu03sLAz
 d5hA==
X-Gm-Message-State: AOJu0YyjDN0QQ3mgahfH5Qd9hdsJ8Ntd3cI4JWp+QDxkw10POU6BLnjc
 lOQcC0UYRlyg7FBI6tO6s1lm1vESiyxXKQlGo3mKQI61xLQO71/d7jzpOCi5Jlx6ewKxlsd7/aD
 6
X-Received: by 2002:a05:6a20:3242:b0:1b1:f321:47ff with SMTP id
 adf61e73a8af0-1b212d0a7d4mr3518315637.17.1716593099148; 
 Fri, 24 May 2024 16:24:59 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2cfd1sm1591695b3a.3.2024.05.24.16.24.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 41/67] target/arm: Convert SQADD, SQSUB, UQADD,
 UQSUB to decodetree
Date: Fri, 24 May 2024 16:20:55 -0700
Message-Id: <20240524232121.284515-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: MGw4BnIb1Vai

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  11 ++++
 target/arm/tcg/translate-a64.c | 100 +++++++++++++++++++--------------
 2 files changed, 68 insertions(+), 43 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index f48adef5bb..19010af03b 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -44,6 +44,7 @@
 @rrr_h          ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=1
 @rrr_sd         ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_sd
 @rrr_hsd        ........ ... rm:5 ...... rn:5 rd:5      &rrr_e esz=%esz_hsd
+@rrr_e          ........ esz:2 . rm:5 ...... rn:5 rd:5  &rrr_e
 
 @rrx_h          ........ .. .. rm:4 .... . . rn:5 rd:5  &rrx_e esz=1 idx=%hlm
 @rrx_s          ........ .. . rm:5  .... . . rn:5 rd:5  &rrx_e esz=2 idx=%hl
@@ -744,6 +745,11 @@ FRECPS_s        0101 1110 0.1 ..... 11111 1 ..... ..... @rrr_sd
 FRSQRTS_s       0101 1110 110 ..... 00111 1 ..... ..... @rrr_h
 FRSQRTS_s       0101 1110 1.1 ..... 11111 1 ..... ..... @rrr_sd
 
+SQADD_s         0101 1110 ..1 ..... 00001 1 ..... ..... @rrr_e
+UQADD_s         0111 1110 ..1 ..... 00001 1 ..... ..... @rrr_e
+SQSUB_s         0101 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
+UQSUB_s         0111 1110 ..1 ..... 00101 1 ..... ..... @rrr_e
+
 ### Advanced SIMD scalar pairwise
 
 FADDP_s         0101 1110 0011 0000 1101 10 ..... ..... @rr_h
@@ -857,6 +863,11 @@ BSL_v           0.10 1110 011 ..... 00011 1 ..... ..... @qrrr_b
 BIT_v           0.10 1110 101 ..... 00011 1 ..... ..... @qrrr_b
 BIF_v           0.10 1110 111 ..... 00011 1 ..... ..... @qrrr_b
 
+SQADD_v         0.00 1110 ..1 ..... 00001 1 ..... ..... @qrrr_e
+UQADD_v         0.10 1110 ..1 ..... 00001 1 ..... ..... @qrrr_e
+SQSUB_v         0.00 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
+UQSUB_v         0.10 1110 ..1 ..... 00101 1 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ca7ba6b1e8..2f7298811d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5060,6 +5060,43 @@ static const FPScalar f_scalar_frsqrts = {
 };
 TRANS(FRSQRTS_s, do_fp3_scalar, a, &f_scalar_frsqrts)
 
+static bool do_satacc_s(DisasContext *s, arg_rrr_e *a,
+                MemOp sgn_n, MemOp sgn_m,
+                void (*gen_bhs)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp),
+                void (*gen_d)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
+{
+    TCGv_i64 t0, t1, t2, qc;
+    MemOp esz = a->esz;
+
+    if (!fp_access_check(s)) {
+        return true;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    qc = tcg_temp_new_i64();
+    read_vec_element(s, t1, a->rn, 0, esz | sgn_n);
+    read_vec_element(s, t2, a->rm, 0, esz | sgn_m);
+    tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
+
+    if (esz == MO_64) {
+        gen_d(t0, qc, t1, t2);
+    } else {
+        gen_bhs(t0, qc, t1, t2, esz);
+        tcg_gen_ext_i64(t0, t0, esz);
+    }
+
+    write_fp_dreg(s, a->rd, t0);
+    tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
+    return true;
+}
+
+TRANS(SQADD_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqadd_bhs, gen_sqadd_d)
+TRANS(SQSUB_s, do_satacc_s, a, MO_SIGN, MO_SIGN, gen_sqsub_bhs, gen_sqsub_d)
+TRANS(UQADD_s, do_satacc_s, a, 0, 0, gen_uqadd_bhs, gen_uqadd_d)
+TRANS(UQSUB_s, do_satacc_s, a, 0, 0, gen_uqsub_bhs, gen_uqsub_d)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5298,6 +5335,11 @@ TRANS(BSL_v, do_bitsel, a->q, a->rd, a->rd, a->rn, a->rm)
 TRANS(BIT_v, do_bitsel, a->q, a->rd, a->rm, a->rn, a->rd)
 TRANS(BIF_v, do_bitsel, a->q, a->rd, a->rm, a->rd, a->rn)
 
+TRANS(SQADD_v, do_gvec_fn3, a, gen_gvec_sqadd_qc)
+TRANS(UQADD_v, do_gvec_fn3, a, gen_gvec_uqadd_qc)
+TRANS(SQSUB_v, do_gvec_fn3, a, gen_gvec_sqsub_qc)
+TRANS(UQSUB_v, do_gvec_fn3, a, gen_gvec_uqsub_qc)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -9291,29 +9333,8 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
      * or scalar-three-reg-same groups.
      */
     TCGCond cond;
-    TCGv_i64 qc;
 
     switch (opcode) {
-    case 0x1: /* SQADD */
-        qc = tcg_temp_new_i64();
-        tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        if (u) {
-            gen_uqadd_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        } else {
-            gen_sqadd_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        }
-        tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        break;
-    case 0x5: /* SQSUB */
-        qc = tcg_temp_new_i64();
-        tcg_gen_ld_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        if (u) {
-            gen_uqsub_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        } else {
-            gen_sqsub_d(tcg_rd, qc, tcg_rn, tcg_rm);
-        }
-        tcg_gen_st_i64(qc, tcg_env, offsetof(CPUARMState, vfp.qc));
-        break;
     case 0x6: /* CMGT, CMHI */
         cond = u ? TCG_COND_GTU : TCG_COND_GT;
     do_cmop:
@@ -9366,6 +9387,8 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
         }
         break;
     default:
+    case 0x1: /* SQADD / UQADD */
+    case 0x5: /* SQSUB / UQSUB */
         g_assert_not_reached();
     }
 }
@@ -9387,8 +9410,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     TCGv_i64 tcg_rd;
 
     switch (opcode) {
-    case 0x1: /* SQADD, UQADD */
-    case 0x5: /* SQSUB, UQSUB */
     case 0x9: /* SQSHL, UQSHL */
     case 0xb: /* SQRSHL, UQRSHL */
         break;
@@ -9410,6 +9431,8 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         }
         break;
     default:
+    case 0x1: /* SQADD, UQADD */
+    case 0x5: /* SQSUB, UQSUB */
         unallocated_encoding(s);
         return;
     }
@@ -9436,12 +9459,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
         void (*genfn)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64, MemOp) = NULL;
 
         switch (opcode) {
-        case 0x1: /* SQADD, UQADD */
-            genfn = u ? gen_uqadd_bhs : gen_sqadd_bhs;
-            break;
-        case 0x5: /* SQSUB, UQSUB */
-            genfn = u ? gen_uqsub_bhs : gen_sqsub_bhs;
-            break;
         case 0x9: /* SQSHL, UQSHL */
         {
             static NeonGenTwoOpEnvFn * const fns[3][2] = {
@@ -9473,6 +9490,8 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
             break;
         }
         default:
+        case 0x1: /* SQADD, UQADD */
+        case 0x5: /* SQSUB, UQSUB */
             g_assert_not_reached();
         }
 
@@ -10933,6 +10952,11 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+
+    case 0x01: /* SQADD, UQADD */
+    case 0x05: /* SQSUB, UQSUB */
+        unallocated_encoding(s);
+        return;
     }
 
     if (!fp_access_check(s)) {
@@ -10940,20 +10964,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     }
 
     switch (opcode) {
-    case 0x01: /* SQADD, UQADD */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uqadd_qc, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqadd_qc, size);
-        }
-        return;
-    case 0x05: /* SQSUB, UQSUB */
-        if (u) {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_uqsub_qc, size);
-        } else {
-            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqsub_qc, size);
-        }
-        return;
     case 0x08: /* SSHL, USHL */
         if (u) {
             gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_ushl, size);
@@ -11038,6 +11048,10 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                          vec_full_reg_offset(s, rm),
                          is_q ? 16 : 8, vec_full_reg_size(s));
         return;
+
+    case 0x01: /* SQADD, UQADD */
+    case 0x05: /* SQSUB, UQSUB */
+        g_assert_not_reached();
     }
 
     if (size == 3) {
-- 
2.34.1

