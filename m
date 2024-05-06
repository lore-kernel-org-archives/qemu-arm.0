Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1270535ejc;
        Sun, 5 May 2024 18:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/Hbup3oM9aAlX6WLQwScWQ7ehR5a9dW+Gfhku+VsL32laN0bAP9hm7GUNpfPBey0WD/1zr//I6d04Nsq+X1XimYuKkANL
X-Google-Smtp-Source: AGHT+IGvFYEfbKBOiTeDdmtXwpTSFaKHPFvprp9Apph4MTnC3SOCLCixnyp1NgZnCUdr6mJF9LvW
X-Received: by 2002:a05:6214:528f:b0:6a0:b996:1457 with SMTP id kj15-20020a056214528f00b006a0b9961457mr11458293qvb.7.1714957662077;
        Sun, 05 May 2024 18:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957662; cv=none;
        d=google.com; s=arc-20160816;
        b=FuMNx+ljcTCjXpczsn1aW9blsk8RdsdhjkhjLPSGUo9+2qTIVjwLLHMl45ZahR+Iyl
         1TfMHqlx7RFsIc23KHO8bZdAgDAIt028HI3qB+lhR7PvZJsrgHx0RK2LzxPNIx+u/K6u
         CIxPbhGnF9iOxvIvCesUjDKYZclTAvVkks4T0tkt6D+yK0OjIbNvRNAxqX2eck+Wx1zV
         1j4LxCzg1uwy+UEOrShmYLB1QC6C6KDx9ObsH5PHlj+FSsN6lNJB55Ei8aaZit5vuP1d
         Q+oe78U+bALqcJHEDPl29K2QahY594e4dwWKgsRitHnAO3i2sJcihea7dSEbCfqlD8Jc
         qgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cECtgSA6oXB+HuwUhQxCSyi1pKryzo8F3eLUgRVY0Ms=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=jjVbkvqbLC96/OHWeQELZk9FHWle7Gxq/v2QqkT+MyVIFn4Jn28kAL+OIoUkGRV2gq
         midjAc2qgJjt5BSRWpQ2ZNOs6e2xqRci4jgyh3ky7QKJoLBiihuS1eEhQyztA3UI5QBX
         X3XbpjebhbDqaOeEmOjUaBECZiMd/5976ucvYnC0P2qOtrUIF/79Vl1I9HTfqsJiyAI6
         119uPZzvAXBDidNNrKCMdNghfM6bPsyX7V0roKhn8c4oa8ZwM8gmePqBG/aeuMf+WV6b
         Qhg3l9KC7TiIqRCZBBHJBOfZAV9VYkpUWaNWM4LSz+NHDETjrHz74JFc8tRkzrbgIWzW
         rqkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/92TiYt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020ad45c85000000b006a06d4c968asi8588827qvh.456.2024.05.05.18.07.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:07:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="A/92TiYt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmj-0007w3-0c; Sun, 05 May 2024 21:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmX-0007qM-53
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:43 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmF-0002Ug-QV
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:40 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2b346712919so1062584a91.2
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957462; x=1715562262; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cECtgSA6oXB+HuwUhQxCSyi1pKryzo8F3eLUgRVY0Ms=;
 b=A/92TiYtT1IzHGjlqf5JQm40c/PC3DBA92ldxlHQW0BjFL0AZyTRLtQb2YntJ88JLK
 8+50e3RFqwSyIfuyRpMZLewdJU32KIEzXEKkvub1mC6E0FPi32IDtxcvz5UlOrMp9bBz
 RRmaa7unqXbA59BC7RPoMRalGkSBQIdV0DYQfl4ifDb2b+XUcTuC/2UASmfMtPAgw2tm
 fQ2xU4xEm1eIJjPet4Z8EN2jTz8Gk7xFb0RivlRhK9nPpIovt8rTiiTMwQ9ukOy/Ahcj
 dpdqR5em1nl+4JEc+LiKc8a2jhjqgao+KIwPPcnr3H2rLIt6at0+3VnWY/6uXitn0HV/
 QFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957462; x=1715562262;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cECtgSA6oXB+HuwUhQxCSyi1pKryzo8F3eLUgRVY0Ms=;
 b=GneoxvrOkZSqkIqkCa62SqfAWFsjjmW+1vlq3HD3RpaWKEXGRvjbiFV+YQw9XCWq11
 miUb3fbYFYqIE6fMLmcq3W8fy8MhPdjRVjWrPsd1XM5oIZ+MleA11AlTKvEwUektp6Ye
 mbV5FsY0iw/BQo1ZdaloETQyxszjngnTW27CL/xtGh7Lan3HzIuUDfoolTPxI+ImGI3I
 4iSkT2f5ytPPZoUR38HaVsTDo3r8ISl6zgEAapajSzdBDHuuHcOUJrg0J6KaYaN9USnF
 u/wK7rVkU2xEaAsTsKG5eqmUAiDSvv0R3lrJUk+D1R8tCMFK7hk18jGjxsNqlvq6sTbG
 FTdg==
X-Gm-Message-State: AOJu0YzvNO2SR1wNKqTzdZzZ1tpiI0AG07y/mY4CXDfP6m11/ZK+JCc5
 8kJfM7FdnFTraVQAn3hsclM9PGPT/Tq0ZHqQpQbsINDi9HzbSoqDksJcwmdSlWvB9Wn+I//Ho4D
 S
X-Received: by 2002:a17:90a:fb8d:b0:2ae:5b9b:8636 with SMTP id
 cp13-20020a17090afb8d00b002ae5b9b8636mr7214543pjb.3.1714957462213; 
 Sun, 05 May 2024 18:04:22 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/57] target/arm: Convert FRECPS, FRSQRTS to decodetree
Date: Sun,  5 May 2024 18:03:26 -0700
Message-Id: <20240506010403.6204-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
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
X-TUID: VJW4qj7IrJ3B

These are the last instructions within handle_3same_float
and disas_simd_scalar_three_reg_same_fp16 so remove them.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |  12 ++
 target/arm/tcg/translate-a64.c | 293 ++++-----------------------------
 2 files changed, 46 insertions(+), 259 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6aa6643d19..8d0a6a147e 100644
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
index 5f5f62c907..d5828ba8df 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5036,6 +5036,20 @@ static const FPScalar f_scalar_fabd = {
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
@@ -5183,6 +5197,20 @@ static gen_helper_gvec_3_ptr * const f_vector_fabd[3] = {
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
@@ -9302,107 +9330,6 @@ static void handle_3same_64(DisasContext *s, int opcode, bool u,
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
@@ -9419,33 +9346,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
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
@@ -9562,80 +9462,6 @@ static void disas_simd_scalar_three_reg_same(DisasContext *s, uint32_t insn)
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
@@ -11108,7 +10934,7 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
 
 /* Pairwise op subgroup of C3.6.16.
  *
- * This is called directly or via the handle_3same_float for float pairwise
+ * This is called directly for float pairwise
  * operations where the opcode and size are calculated differently.
  */
 static void handle_simd_3same_pair(DisasContext *s, int is_q, int u, int opcode,
@@ -11265,10 +11091,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
 
-    int datasize = is_q ? 128 : 64;
-    int esize = 32 << size;
-    int elements = datasize / esize;
-
     if (size == 1 && !is_q) {
         unallocated_encoding(s);
         return;
@@ -11287,13 +11109,6 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
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
@@ -11322,10 +11137,12 @@ static void disas_simd_3same_float(DisasContext *s, uint32_t insn)
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
@@ -11667,17 +11484,11 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
@@ -11692,10 +11503,12 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
@@ -11759,44 +11572,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
@@ -13566,7 +13342,6 @@ static const AArch64DecodeTable data_proc_simd[] = {
     { 0x5f000400, 0xdf800400, disas_simd_scalar_shift_imm },
     { 0x0e400400, 0x9f60c400, disas_simd_three_reg_same_fp16 },
     { 0x0e780800, 0x8f7e0c00, disas_simd_two_reg_misc_fp16 },
-    { 0x5e400400, 0xdf60c400, disas_simd_scalar_three_reg_same_fp16 },
     { 0x00000000, 0x00000000, NULL }
 };
 
-- 
2.34.1

