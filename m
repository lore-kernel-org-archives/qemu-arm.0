Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1994700ejb;
        Fri, 24 May 2024 16:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWhD+akHBGY6xFkvyNDx66pG9VJ2nyZ4+0PH03B5y4y63H6zniBVwlAytSQjHeu7Sas3h/KkyzSrV9k88toZLEQqzUSoDdE
X-Google-Smtp-Source: AGHT+IH9lqXrDMp/MGK0Qb1PakhCNVkNbPAx/rr4nXI9YKzLtVEBpxqWuaMv4ej+It6qv6tBc3tF
X-Received: by 2002:a05:6808:16a3:b0:3c9:9698:e938 with SMTP id 5614622812f47-3d1a774abccmr5072719b6e.52.1716593299511;
        Fri, 24 May 2024 16:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716593299; cv=none;
        d=google.com; s=arc-20160816;
        b=pySGH4CNPKcBGpgvrC2mkcDbxX9WI3fDGqfQRwUPaIS8eLUxJrsUeUIMBCyKm0wAVW
         fkePbQf/yEAAFIqEbK41IiucVRNLCgevdPM1z8jNWt9pHdN/LyAo5vbapHugH2CCFnf3
         BpfbvHsrqhza+KVn+rjU/PtwCptJaVYZvhiL4NJPUH5QIUJ9/E9AKLPJL9nX7Gx2WIeA
         IUS89/5sdk9Kg8hDRRaBNMQvuwZk0XenikkdIUNasMBONDQ/+akl/DUg1Vm+MInJn7GW
         V+EliWYX/oL7gUZ4q7PA76DUyWJYKtjVGWYoJ4Blh7qcDA9zpu/hivAD00SRgXCNUDr9
         B8HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YwWJz5dYdceid2k272oRtgntPmVKRyShOM+but+kUR8=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=tRW61sjaOFo8ur6FzhIyMqmU+GiQV1Kdkos5AbKTwkvMU9cc8Lti3NfTO+4vQ8o6fz
         MCcmrftXkA/TaiyV3gN2bMuIVxavqflOm0yGdsCC1X4rWXtcD7mbsdDfCnP1MQvgcXb0
         uvYHbDlkiZtXv5iEUmlOu626wp42158NpTmoi3oJ3BF7nTvtmv8CvlxSZLFlmGdH6Ki2
         hsSY09N0WtsBPQjBifyToF0mz4k4iNzXfz1rWJ1DZYo5ZVtXCcd/fw3gNTJPhkR8KzGd
         Zzp9ZYEeQ4YI7AMKdcUKWzRxrLteR6k35glIb9fxs24G7QEyayeW8ejuBTdBu/VYDlAv
         NqjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K95PmI0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162d143dsi27054736d6.555.2024.05.24.16.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2024 16:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K95PmI0H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sAeEe-0006sc-H1; Fri, 24 May 2024 19:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEX-0006iH-4a
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:57 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sAeEP-0005q2-33
 for qemu-arm@nongnu.org; Fri, 24 May 2024 19:21:56 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f33d84eaefso18543105ad.3
 for <qemu-arm@nongnu.org>; Fri, 24 May 2024 16:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716592907; x=1717197707; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YwWJz5dYdceid2k272oRtgntPmVKRyShOM+but+kUR8=;
 b=K95PmI0HPhCC9IbD6lDDeRMtO8+TWnDtUBIG2X0MWDM1WA5rL0OeP9vENFYjQC3zQ/
 3aIFX0M9d/qicHk/CMxbkkE2bHWHX5rIwSHy9wRDBbMgpHyibWNJxlLrf9dgYjuUe3q6
 D2SOssr5UqlM7pntwabFqAl+pkUCAYbx2WGhmU+taEBVYGp4exp0q3CTUN6b+45KfnwN
 Yr+q9zp+qWKqqT4UpqwvHt6t8lBcXmDGlEc7rQMoYnXPI3yOk+NihDq/qxsDOE/I2me3
 Sj6jHQ7IN8l7cb0F2/DkJ64gP8XCFzjWDeDa511sgJkDzSMfYHxhkNJ8hxXtaa4uefA6
 Fjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716592907; x=1717197707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwWJz5dYdceid2k272oRtgntPmVKRyShOM+but+kUR8=;
 b=PThOY4CFg2QPaAmsgnx849PYTSt6toEdoMJYB6WntjTlTAZHkHSlyvcisVqUgLQaV+
 SbOy92TZMc8GGoMdywkgATOdsVovZuxBmRdnXYltB7GDW2snl3OovmAOEAVaSUJ7rlVU
 XtM0gXYAzOqamigxV9C6kQJ7ljRXQ1BxVsVrxF9elxwRAerkVHNszipCdUyCA6j3M3ae
 aDTji0vPvbm8gbPW5eZRdIfyfkMX542lPjQnYN2O+JuU83l53/vyCHzHnz9uInvTw0O8
 dREdt99wo0By1N3dsc98dxMoS6ClEpxYopJgzYSOoa4xSNIlqb7Tacc8ubNfR1e2O4D0
 TE2A==
X-Gm-Message-State: AOJu0YybSPhez6Ug1MDHyjL3hkQbaVltIyOfOaw/QSgq3jru2BwsQkVx
 p54yC6Tp+c5ohpzf35PWhTOI4ShKEz2EN/JOwQ4ztoSCDulWW0BhNW7Ne9BzSLU=
X-Received: by 2002:a17:903:1112:b0:1e2:9676:c326 with SMTP id
 d9443c01a7336-1f44871e145mr43385035ad.29.1716592906690; 
 Fri, 24 May 2024 16:21:46 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c759ceesm19178305ad.10.2024.05.24.16.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 16:21:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 27/67] target/arm: Convert FRECPS, FRSQRTS to decodetree
Date: Fri, 24 May 2024 16:20:41 -0700
Message-Id: <20240524232121.284515-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524232121.284515-1-richard.henderson@linaro.org>
References: <20240524232121.284515-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WvHSWeO976rL

These are the last instructions within handle_3same_float
and disas_simd_scalar_three_reg_same_fp16 so remove them.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  12 ++
 target/arm/tcg/translate-a64.c | 293 ++++-----------------------------
 2 files changed, 46 insertions(+), 259 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a852b5f06f..84cb38f1dd 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -731,6 +731,12 @@ FACGT_s         0111 1110 1.1 ..... 11101 1 ..... ..... @rrr_sd
 FABD_s          0111 1110 110 ..... 00010 1 ..... ..... @rrr_h
 FABD_s          0111 1110 1.1 ..... 11010 1 ..... ..... @rrr_sd
 
+FRECPS_s        0101 1110 010 ..... 00111 1 ..... ..... @rrr_h
+FRECPS_s        0101 1110 0.1 ..... 11111 1 ..... ..... @rrr_sd
+
+FRSQRTS_s       0101 1110 110 ..... 00111 1 ..... ..... @rrr_h
+FRSQRTS_s       0101 1110 1.1 ..... 11111 1 ..... ..... @rrr_sd
+
 ### Advanced SIMD three same
 
 FADD_v          0.00 1110 010 ..... 00010 1 ..... ..... @qrrr_h
@@ -784,6 +790,12 @@ FACGT_v         0.10 1110 1.1 ..... 11101 1 ..... ..... @qrrr_sd
 FABD_v          0.10 1110 110 ..... 00010 1 ..... ..... @qrrr_h
 FABD_v          0.10 1110 1.1 ..... 11010 1 ..... ..... @qrrr_sd
 
+FRECPS_v        0.00 1110 010 ..... 00111 1 ..... ..... @qrrr_h
+FRECPS_v        0.00 1110 0.1 ..... 11111 1 ..... ..... @qrrr_sd
+
+FRSQRTS_v       0.00 1110 110 ..... 00111 1 ..... ..... @qrrr_h
+FRSQRTS_v       0.00 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 633384d2a5..a7537a5104 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5035,6 +5035,20 @@ static const FPScalar f_scalar_fabd = {
 };
 TRANS(FABD_s, do_fp3_scalar, a, &f_scalar_fabd)
 
+static const FPScalar f_scalar_frecps = {
+    gen_helper_recpsf_f16,
+    gen_helper_recpsf_f32,
+    gen_helper_recpsf_f64,
+};
+TRANS(FRECPS_s, do_fp3_scalar, a, &f_scalar_frecps)
+
+static const FPScalar f_scalar_frsqrts = {
+    gen_helper_rsqrtsf_f16,
+    gen_helper_rsqrtsf_f32,
+    gen_helper_rsqrtsf_f64,
+};
+TRANS(FRSQRTS_s, do_fp3_scalar, a, &f_scalar_frsqrts)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -5182,6 +5196,20 @@ static gen_helper_gvec_3_ptr * const f_vector_fabd[3] = {
 };
 TRANS(FABD_v, do_fp3_vector, a, f_vector_fabd)
 
+static gen_helper_gvec_3_ptr * const f_vector_frecps[3] = {
+    gen_helper_gvec_recps_h,
+    gen_helper_gvec_recps_s,
+    gen_helper_gvec_recps_d,
+};
+TRANS(FRECPS_v, do_fp3_vector, a, f_vector_frecps)
+
+static gen_helper_gvec_3_ptr * const f_vector_frsqrts[3] = {
+    gen_helper_gvec_rsqrts_h,
+    gen_helper_gvec_rsqrts_s,
+    gen_helper_gvec_rsqrts_d,
+};
+TRANS(FRSQRTS_v, do_fp3_vector, a, f_vector_frsqrts)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -9308,107 +9336,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
     }
 }
 
-/* Handle the 3-same-operands float operations; shared by the scalar
- * and vector encodings. The caller must filter out any encodings
- * not allocated for the encoding it is dealing with.
- */
-static void handle_3same_float(DisasContext *s, int size, int elements,
-                               int fpopcode, int rd, int rn, int rm)
-{
-    int pass;
-    TCGv_ptr fpst = fpstatus_ptr(FPST_FPCR);
-
-    for (pass = 0; pass < elements; pass++) {
-        if (size) {
-            /* Double */
-            TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-            TCGv_i64 tcg_op2 = tcg_temp_new_i64();
-            TCGv_i64 tcg_res = tcg_temp_new_i64();
-
-            read_vec_element(s, tcg_op1, rn, pass, MO_64);
-            read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-            switch (fpopcode) {
-            case 0x1f: /* FRECPS */
-                gen_helper_recpsf_f64(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x3f: /* FRSQRTS */
-                gen_helper_rsqrtsf_f64(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0x18: /* FMAXNM */
-            case 0x19: /* FMLA */
-            case 0x1a: /* FADD */
-            case 0x1b: /* FMULX */
-            case 0x1c: /* FCMEQ */
-            case 0x1e: /* FMAX */
-            case 0x38: /* FMINNM */
-            case 0x39: /* FMLS */
-            case 0x3a: /* FSUB */
-            case 0x3e: /* FMIN */
-            case 0x5b: /* FMUL */
-            case 0x5c: /* FCMGE */
-            case 0x5d: /* FACGE */
-            case 0x5f: /* FDIV */
-            case 0x7a: /* FABD */
-            case 0x7c: /* FCMGT */
-            case 0x7d: /* FACGT */
-                g_assert_not_reached();
-            }
-
-            write_vec_element(s, tcg_res, rd, pass, MO_64);
-        } else {
-            /* Single */
-            TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-            TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_32);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_32);
-
-            switch (fpopcode) {
-            case 0x1f: /* FRECPS */
-                gen_helper_recpsf_f32(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0x3f: /* FRSQRTS */
-                gen_helper_rsqrtsf_f32(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0x18: /* FMAXNM */
-            case 0x19: /* FMLA */
-            case 0x1a: /* FADD */
-            case 0x1b: /* FMULX */
-            case 0x1c: /* FCMEQ */
-            case 0x1e: /* FMAX */
-            case 0x38: /* FMINNM */
-            case 0x39: /* FMLS */
-            case 0x3a: /* FSUB */
-            case 0x3e: /* FMIN */
-            case 0x5b: /* FMUL */
-            case 0x5c: /* FCMGE */
-            case 0x5d: /* FACGE */
-            case 0x5f: /* FDIV */
-            case 0x7a: /* FABD */
-            case 0x7c: /* FCMGT */
-            case 0x7d: /* FACGT */
-                g_assert_not_reached();
-            }
-
-            if (elements == 1) {
-                /* scalar single so clear high part */
-                TCGv_i64 tcg_tmp = tcg_temp_new_i64();
-
-                tcg_gen_extu_i32_i64(tcg_tmp, tcg_res);
-                write_vec_element(s, tcg_tmp, rd, pass, MO_64);
-            } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-            }
-        }
-    }
-
-    clear_vec_high(s, elements * (size ? 8 : 4) > 8, rd);
-}
-
 /* AdvSIMD scalar three same
  *  31 30  29 28       24 23  22  21 20  16 15    11  10 9    5 4    0
  * +-----+---+-----------+------+---+------+--------+---+------+------+
@@ -9425,33 +9352,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     bool u = extract32(insn, 29, 1);
     TCGv_i64 tcg_rd;
 
-    if (opcode >= 0x18) {
-        /* Floating point: U, size[1] and opcode indicate operation */
-        int fpopcode = opcode | (extract32(size, 1, 1) << 5) | (u << 6);
-        switch (fpopcode) {
-        case 0x1f: /* FRECPS */
-        case 0x3f: /* FRSQRTS */
-            break;
-        default:
-        case 0x1b: /* FMULX */
-        case 0x5d: /* FACGE */
-        case 0x7d: /* FACGT */
-        case 0x1c: /* FCMEQ */
-        case 0x5c: /* FCMGE */
-        case 0x7a: /* FABD */
-        case 0x7c: /* FCMGT */
-            unallocated_encoding(s);
-            return;
-        }
-
-        if (!fp_access_check(s)) {
-            return;
-        }
-
-        handle_3same_float(s, extract32(size, 0, 1), 1, fpopcode, rd, rn, rm);
-        return;
-    }
-
     switch (opcode) {
     case 0x1: /* SQADD, UQADD */
     case 0x5: /* SQSUB, UQSUB */
@@ -9568,80 +9468,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
     write_fp_dreg(s, rd, tcg_rd);
 }
 
-/* AdvSIMD scalar three same FP16
- *  31 30  29 28       24 23  22 21 20  16 15 14 13    11 10  9  5 4  0
- * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
- * | 0 1 | U | 1 1 1 1 0 | a | 1 0 |  Rm  | 0 0 | opcode | 1 | Rn | Rd |
- * +-----+---+-----------+---+-----+------+-----+--------+---+----+----+
- * v: 0101 1110 0100 0000 0000 0100 0000 0000 => 5e400400
- * m: 1101 1111 0110 0000 1100 0100 0000 0000 => df60c400
- */
-static void disas_simd_scalar_three_reg_same_fp16(DisasContext *s,
-                                                  uint32_t insn)
-{
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int opcode = extract32(insn, 11, 3);
-    int rm = extract32(insn, 16, 5);
-    bool u = extract32(insn, 29, 1);
-    bool a = extract32(insn, 23, 1);
-    int fpopcode = opcode | (a << 3) |  (u << 4);
-    TCGv_ptr fpst;
-    TCGv_i32 tcg_op1;
-    TCGv_i32 tcg_op2;
-    TCGv_i32 tcg_res;
-
-    switch (fpopcode) {
-    case 0x07: /* FRECPS */
-    case 0x0f: /* FRSQRTS */
-        break;
-    default:
-    case 0x03: /* FMULX */
-    case 0x04: /* FCMEQ (reg) */
-    case 0x14: /* FCMGE (reg) */
-    case 0x15: /* FACGE */
-    case 0x1a: /* FABD */
-    case 0x1c: /* FCMGT (reg) */
-    case 0x1d: /* FACGT */
-        unallocated_encoding(s);
-        return;
-    }
-
-    if (!dc_isar_feature(aa64_fp16, s)) {
-        unallocated_encoding(s);
-    }
-
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-    tcg_op1 = read_fp_hreg(s, rn);
-    tcg_op2 = read_fp_hreg(s, rm);
-    tcg_res = tcg_temp_new_i32();
-
-    switch (fpopcode) {
-    case 0x07: /* FRECPS */
-        gen_helper_recpsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    case 0x0f: /* FRSQRTS */
-        gen_helper_rsqrtsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
-        break;
-    default:
-    case 0x03: /* FMULX */
-    case 0x04: /* FCMEQ (reg) */
-    case 0x14: /* FCMGE (reg) */
-    case 0x15: /* FACGE */
-    case 0x1a: /* FABD */
-    case 0x1c: /* FCMGT (reg) */
-    case 0x1d: /* FACGT */
-        g_assert_not_reached();
-    }
-
-    write_fp_sreg(s, rd, tcg_res);
-}
-
 /* AdvSIMD scalar three same extra
  *  31 30  29 28       24 23  22  21 20  16  15 14    11  10 9  5 4  0
  * +-----+---+-----------+------+---+------+---+--------+---+----+----+
@@ -11114,7 +10940,7 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
 
 /* Pairwise op subgroup of C3.6.16.
  *
- * This is called directly or via the handle_3same_float for float pairwise
+ * This is called directly for float pairwise
  * operations where the opcode and size are calculated differently.
  */
 static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
@@ -11271,10 +11097,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
 
-    int datasize = is_q ? 128 : 64;
-    int esize = 32 << size;
-    int elements = datasize / esize;
-
     if (size == 1 && !is_q) {
         unallocated_encoding(s);
         return;
@@ -11293,13 +11115,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
         handle_simd_3same_pair(s, is_q, 0, fpopcode, size ? MO_64 : MO_32,
                                rn, rm, rd);
         return;
-    case 0x1f: /* FRECPS */
-    case 0x3f: /* FRSQRTS */
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_3same_float(s, size, elements, fpopcode, rd, rn, rm);
-        return;
 
     case 0x1d: /* FMLAL  */
     case 0x3d: /* FMLSL  */
@@ -11328,10 +11143,12 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     case 0x1b: /* FMULX */
     case 0x1c: /* FCMEQ */
     case 0x1e: /* FMAX */
+    case 0x1f: /* FRECPS */
     case 0x38: /* FMINNM */
     case 0x39: /* FMLS */
     case 0x3a: /* FSUB */
     case 0x3e: /* FMIN */
+    case 0x3f: /* FRSQRTS */
     case 0x5b: /* FMUL */
     case 0x5c: /* FCMGE */
     case 0x5d: /* FACGE */
@@ -11673,17 +11490,11 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
      * together indicate the operation.
      */
     int fpopcode = opcode | (a << 3) | (u << 4);
-    int datasize = is_q ? 128 : 64;
-    int elements = datasize / 16;
     bool pairwise;
     TCGv_ptr fpst;
     int pass;
 
     switch (fpopcode) {
-    case 0x7: /* FRECPS */
-    case 0xf: /* FRSQRTS */
-        pairwise = false;
-        break;
     case 0x10: /* FMAXNMP */
     case 0x12: /* FADDP */
     case 0x16: /* FMAXP */
@@ -11698,10 +11509,12 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
     case 0x3: /* FMULX */
     case 0x4: /* FCMEQ */
     case 0x6: /* FMAX */
+    case 0x7: /* FRECPS */
     case 0x8: /* FMINNM */
     case 0x9: /* FMLS */
     case 0xa: /* FSUB */
     case 0xe: /* FMIN */
+    case 0xf: /* FRSQRTS */
     case 0x13: /* FMUL */
     case 0x14: /* FCMGE */
     case 0x15: /* FACGE */
@@ -11765,44 +11578,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             write_vec_element_i32(s, tcg_res[pass], rd, pass, MO_16);
         }
     } else {
-        for (pass = 0; pass < elements; pass++) {
-            TCGv_i32 tcg_op1 = tcg_temp_new_i32();
-            TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-            TCGv_i32 tcg_res = tcg_temp_new_i32();
-
-            read_vec_element_i32(s, tcg_op1, rn, pass, MO_16);
-            read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
-
-            switch (fpopcode) {
-            case 0x7: /* FRECPS */
-                gen_helper_recpsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            case 0xf: /* FRSQRTS */
-                gen_helper_rsqrtsf_f16(tcg_res, tcg_op1, tcg_op2, fpst);
-                break;
-            default:
-            case 0x0: /* FMAXNM */
-            case 0x1: /* FMLA */
-            case 0x2: /* FADD */
-            case 0x3: /* FMULX */
-            case 0x4: /* FCMEQ */
-            case 0x6: /* FMAX */
-            case 0x8: /* FMINNM */
-            case 0x9: /* FMLS */
-            case 0xa: /* FSUB */
-            case 0xe: /* FMIN */
-            case 0x13: /* FMUL */
-            case 0x14: /* FCMGE */
-            case 0x15: /* FACGE */
-            case 0x17: /* FDIV */
-            case 0x1a: /* FABD */
-            case 0x1c: /* FCMGT */
-            case 0x1d: /* FACGT */
-                g_assert_not_reached();
-            }
-
-            write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
-        }
+        g_assert_not_reached();
     }
 
     clear_vec_high(s, is_q, rd);
@@ -13572,7 +13348,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
-    { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.34.1

