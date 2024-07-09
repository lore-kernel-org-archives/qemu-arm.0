Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2975716njb;
        Mon, 8 Jul 2024 17:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQoxEz57iz9WY3AquTYsUznU+ilfSwVhdctR0OnnAYtWkfNwu+7WEjjiMM81rmvNqVRdyEkbQ/lKmuKUlJ67HewWm8G7ZO
X-Google-Smtp-Source: AGHT+IHtwvs1pgORExD9/oYzmkBK5H0Ze0/6BeTdyIdtmHRJxXK4LqcJlfifr1ruZRl6k/fwxzTu
X-Received: by 2002:a05:622a:1a24:b0:444:f5f1:af3e with SMTP id d75a77b69052e-447fa9213c5mr13529341cf.32.1720483619411;
        Mon, 08 Jul 2024 17:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720483619; cv=none;
        d=google.com; s=arc-20160816;
        b=xNgHsw4ZmlQtHSkHjNz0Or5MXWAbRwwwcBW+rWsto61PiYskfBkpvNzUGlaJTvHVOL
         4GF2YfdSo+LI+P8oEFtY0DzVplBZBCIdAnF0KUTLenMm0mIyXpz8Y0G1tHqAtP0EoNga
         kAVPzYP9GtA6R5Sastj4FiD4/C094H8Xp5NJPkKxu/S6teOT06tF3Ff0WeDFyOGnhxYN
         Z3M4IBmww8isjzck3gg1v73vI0qYaqIvE2zTVJdD2uM01yGMBnF6sSz9QEvsKdGd7IP7
         SvkElQE8EUCXWUlbgZF+QBsMYuRrcKcX4f57La9aGLvtaCVWMtJgnME5PXKrkr6/U/RB
         KYUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6QZjEZqiZahqztsYL9buht7HyZWHWFh4XOBO2Yk44EQ=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=i+MyqiYf+krVldJA714jB8nLUiUWO+qvFr5nbpf8nZcmiobpWqBPl4b6eFAEo9pfp3
         i3CmPNb05iZU/ovAVFMP9AA4E8HJWITxw9mEeLTVmrkAQQkuyFm3zUnD9tXM5mYStDOR
         p641ofOCbKpaHWQeOlOsHuMsjLG5frTBoqX+rweSNO5JfjJ5D3RZpb39uhC7Hsc6G0Uy
         canbPB3OikGRRN695zchvQ1ja7vCJqnCKftsnuK0oEoYzP3fPazkjcas/yPES3T3k7CR
         wyVsC7TuBI6faGmAHHFIvM6c2KcHdRLeAKNQnj1bROkfJ63sMUtw0e4TrLuSsAVWSXDZ
         dTWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ33S+lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9baafa4si9955211cf.276.2024.07.08.17.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 17:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ33S+lO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQyNH-00070E-R9; Mon, 08 Jul 2024 20:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyNB-0006So-2i
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:21 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN8-0001vW-BG
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:20 -0400
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-38257b4283dso21985665ab.2
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 17:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720483577; x=1721088377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6QZjEZqiZahqztsYL9buht7HyZWHWFh4XOBO2Yk44EQ=;
 b=MJ33S+lOwISyxh2jPYfSBTFQrSZnv0oL0sbm3WyKlAPox6YshDcpV9k3i/e3NIkXxO
 D/TFvKBS8C8v0Ss0RZuzCw6rAXM4vqqr23YyXesh/4k95Zqt/CZxUoWCRg8GEfz13195
 YbK5Mr3iCgo2aIc4fd2vx4EdNdRSkTG/gGk9YMBHIaum8P+fxcEkWkErSSeaBR72Rlv1
 lsoBhmBxxnaeqU3AEe5GsMNnjcWy48+FlE8CCi54f9PtSBqo1HauOH/uXN5x9JoFXjP/
 gots3qk+lUjly134Vr26MQs6GplXJhSfoBOBf0xADYJlWrESeAw/XLnQgDfOufeEvKV6
 I+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720483577; x=1721088377;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6QZjEZqiZahqztsYL9buht7HyZWHWFh4XOBO2Yk44EQ=;
 b=U0IOw2/nrwgjEu+tvPWCgVOpbjsmiXq7/1rVnkXJsusF/jn/pirB0Jj89A1Hnbm8po
 MpIw3d7gZ72NDolMwleVzfzR64kgLTk+tER1UwiO1C5JhDR9yfb4UV837O1CpgJyBuV0
 ArqDxptS6K9o+rppPBcPPEaIO252qLBAshjF7t3b0ubs5He0FxGOY+DbnMzxIMLPFOdN
 kSXhWNYKYDZm+qfq0Z48csf90bxMe50cF4EGey73NbawT/UtmiDydnHqvMlZ2S3O+UtM
 L9NlZXOz1G87E7Bf/bkEKDucvjifzQImAVhEHpXn9LhKAcCcBHfhpCsj3ZozAvtxrIkt
 gPzw==
X-Gm-Message-State: AOJu0YxGHTWPUsmUzhpMvt6ulaw2gQF1Ana8WydwThRHT9tXQem3Q9su
 dWTir/a5CQnHPd03vCa4D0IeirSAiyaHnhDVhIuHeYiCJCrMyNWgBAVoQmhZbqrp8GFdg8ROrLN
 Jr6k=
X-Received: by 2002:a05:6e02:19cf:b0:374:983b:6ff2 with SMTP id
 e9e14a558f8ab-38a5a079b58mr11347605ab.20.1720483577152; 
 Mon, 08 Jul 2024 17:06:17 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b3fefsm316617a12.76.2024.07.08.17.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 17:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 5/6] target/arm: Convert ADDHN, SUBHN, RADDHN,
 RSUBHN to decodetree
Date: Mon,  8 Jul 2024 17:06:09 -0700
Message-ID: <20240709000610.382391-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709000610.382391-1-richard.henderson@linaro.org>
References: <20240709000610.382391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12c.google.com
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
X-TUID: zVQOSfqjT7Oh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 127 +++++++++++++++------------------
 target/arm/tcg/a64.decode      |   5 ++
 2 files changed, 61 insertions(+), 71 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 264d2eeb27..3e0dacdd63 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5949,6 +5949,60 @@ TRANS(UADDW, do_addsub_wide, a, 0, false)
 TRANS(SSUBW, do_addsub_wide, a, MO_SIGN, true)
 TRANS(USUBW, do_addsub_wide, a, 0, true)
 
+static bool do_addsub_highnarrow(DisasContext *s, arg_qrrr_e *a,
+                                 bool sub, bool round)
+{
+    TCGv_i64 tcg_op0, tcg_op1;
+    MemOp esz = a->esz;
+    int half = 8 >> esz;
+    bool top = a->q;
+    int ebits = 8 << esz;
+    uint64_t rbit = 1ull << (ebits - 1);
+    int top_swap, top_half;
+
+    /* There are no 128x128->64 bit operations. */
+    if (esz >= MO_64) {
+        return false;
+    }
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    tcg_op0 = tcg_temp_new_i64();
+    tcg_op1 = tcg_temp_new_i64();
+
+    /*
+     * For top half inputs, iterate backward; forward for bottom half.
+     * This means the store to the destination will not occur until
+     * overlapping input inputs are consumed.
+     */
+    top_swap = top ? half - 1 : 0;
+    top_half = top ? half : 0;
+
+    for (int elt_fwd = 0; elt_fwd < half; ++elt_fwd) {
+        int elt = elt_fwd ^ top_swap;
+
+        read_vec_element(s, tcg_op1, a->rm, elt, esz + 1);
+        read_vec_element(s, tcg_op0, a->rn, elt, esz + 1);
+        if (sub) {
+            tcg_gen_sub_i64(tcg_op0, tcg_op0, tcg_op1);
+        } else {
+            tcg_gen_add_i64(tcg_op0, tcg_op0, tcg_op1);
+        }
+        if (round) {
+            tcg_gen_addi_i64(tcg_op0, tcg_op0, rbit);
+        }
+        tcg_gen_shri_i64(tcg_op0, tcg_op0, ebits);
+        write_vec_element(s, tcg_op0, a->rd, elt + top_half, esz);
+    }
+    clear_vec_high(s, top, a->rd);
+    return true;
+}
+
+TRANS(ADDHN, do_addsub_highnarrow, a, false, false)
+TRANS(SUBHN, do_addsub_highnarrow, a, true, false)
+TRANS(RADDHN, do_addsub_highnarrow, a, false, true)
+TRANS(RSUBHN, do_addsub_highnarrow, a, true, true)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -10813,65 +10867,6 @@ static void disas_simd_shift_imm(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Generate code to do a "long" addition or subtraction, ie one done in
- * TCGv_i64 on vector lanes twice the width specified by size.
- */
-static void gen_neon_addl(int size, bool is_sub, TCGv_i64 tcg_res,
-                          TCGv_i64 tcg_op1, TCGv_i64 tcg_op2)
-{
-    static NeonGenTwo64OpFn * const fns[3][2] = {
-        { gen_helper_neon_addl_u16, gen_helper_neon_subl_u16 },
-        { gen_helper_neon_addl_u32, gen_helper_neon_subl_u32 },
-        { tcg_gen_add_i64, tcg_gen_sub_i64 },
-    };
-    NeonGenTwo64OpFn *genfn;
-    assert(size < 3);
-
-    genfn = fns[size][is_sub];
-    genfn(tcg_res, tcg_op1, tcg_op2);
-}
-
-static void do_narrow_round_high_u32(TCGv_i32 res, TCGv_i64 in)
-{
-    tcg_gen_addi_i64(in, in, 1U << 31);
-    tcg_gen_extrh_i64_i32(res, in);
-}
-
-static void handle_3rd_narrowing(DisasContext *s, int is_q, int is_u, int size,
-                                 int opcode, int rd, int rn, int rm)
-{
-    TCGv_i32 tcg_res[2];
-    int part = is_q ? 2 : 0;
-    int pass;
-
-    for (pass = 0; pass < 2; pass++) {
-        TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-        TCGv_i64 tcg_op2 = tcg_temp_new_i64();
-        TCGv_i64 tcg_wideres = tcg_temp_new_i64();
-        static NeonGenNarrowFn * const narrowfns[3][2] = {
-            { gen_helper_neon_narrow_high_u8,
-              gen_helper_neon_narrow_round_high_u8 },
-            { gen_helper_neon_narrow_high_u16,
-              gen_helper_neon_narrow_round_high_u16 },
-            { tcg_gen_extrh_i64_i32, do_narrow_round_high_u32 },
-        };
-        NeonGenNarrowFn *gennarrow = narrowfns[size][is_u];
-
-        read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-        gen_neon_addl(size, (opcode == 6), tcg_wideres, tcg_op1, tcg_op2);
-
-        tcg_res[pass] = tcg_temp_new_i32();
-        gennarrow(tcg_res[pass], tcg_wideres);
-    }
-
-    for (pass = 0; pass < 2; pass++) {
-        write_vec_element_i32(s, tcg_res[pass], rd, pass + part, MO_32);
-    }
-    clear_vec_high(s, is_q, rd);
-}
-
 /* AdvSIMD three different
  *   31  30  29 28       24 23  22  21 20  16 15    12 11 10 9    5 4    0
  * +---+---+---+-----------+------+---+------+--------+-----+------+------+
@@ -10899,18 +10894,6 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     switch (opcode) {
-    case 4: /* ADDHN, ADDHN2, RADDHN, RADDHN2 */
-    case 6: /* SUBHN, SUBHN2, RSUBHN, RSUBHN2 */
-        /* 128 x 128 -> 64 */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_3rd_narrowing(s, is_q, is_u, size, opcode, rd, rn, rm);
-        break;
     case 14: /* PMULL, PMULL2 */
         if (is_u) {
             unallocated_encoding(s);
@@ -10949,7 +10932,9 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
     case 1: /* SADDW, SADDW2, UADDW, UADDW2 */
     case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
     case 3: /* SSUBW, SSUBW2, USUBW, USUBW2 */
+    case 4: /* ADDHN, ADDHN2, RADDHN, RADDHN2 */
     case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
+    case 6: /* SUBHN, SUBHN2, RSUBHN, RSUBHN2 */
     case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
     case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
     case 9: /* SQDMLAL, SQDMLAL2 */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 32e2f3a0d5..afb34a8fd4 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -998,6 +998,11 @@ UADDW           0.10 1110 ..1 ..... 00010 0 ..... ..... @qrrr_e
 SSUBW           0.00 1110 ..1 ..... 00110 0 ..... ..... @qrrr_e
 USUBW           0.10 1110 ..1 ..... 00110 0 ..... ..... @qrrr_e
 
+ADDHN           0.00 1110 ..1 ..... 01000 0 ..... ..... @qrrr_e
+RADDHN          0.10 1110 ..1 ..... 01000 0 ..... ..... @qrrr_e
+SUBHN           0.00 1110 ..1 ..... 01100 0 ..... ..... @qrrr_e
+RSUBHN          0.10 1110 ..1 ..... 01100 0 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0

