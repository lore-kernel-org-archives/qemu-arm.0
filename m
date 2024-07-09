Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp2975848njb;
        Mon, 8 Jul 2024 17:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHcAbBGNrofeTnHFqPdDbTHgkA5llmx59im2u2Tez0XID1UI+WJBTOG1Sj/3jFLtDqOkII6qHbPjH0n/uEAPjVKTPgATBe
X-Google-Smtp-Source: AGHT+IHtkNQAyzvGqt5cKUUw2FSEFEnAk0wNfQEOmtgFpu6wJ2EgzpK3G943NmPBz0SNmcZmt/kD
X-Received: by 2002:a0d:e646:0:b0:64a:b250:55f2 with SMTP id 00721157ae682-658ee7911dbmr13274647b3.7.1720483635668;
        Mon, 08 Jul 2024 17:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720483635; cv=none;
        d=google.com; s=arc-20160816;
        b=M/gzfUqFJah/cdSTBceZVgrE1P9EZQZmTI4sDPt+RhDVaseVvq72UsVvUi2fAFXAoV
         OSSO8movSb/Z6zMjjCttlBqSXECSDVKxeSQsSHcA24Xte99a51GysE0u/UXOa8xx54/m
         JwQhVcCyw3qnYNiTrCoGN2CiGVPV/r5iZDNx4j4fDxxBcDVhHDbF77Pqi0p+B69GRbTN
         v3VsZSNf/DnWire7sgBcSaMSV8OLjj7bmIzQvGfcEqE+yqzZFZ+KYiAMecHIG1MdPdTv
         5nkinmLwDCDnGRcsflqO2I6AQUSfAYV2vpoQ2//1DlbTa+0D1B7zKwMP4TgxD7NMTsY6
         DXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GnsES1JfSgMlgLee5StaRe03QD6RN3WNcvucQ9eZvvk=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=hgKAhjzcdXyBL82yuR9hsNcm8tff36+yiJdHNQNuRADw3uFkFkzPTKRJmh8wGYx+4t
         XES+R+9spRFOUS3tPd8cgrZsVlcQp3UCBr8xrYZ2b1tI1iBP0S2T9+GswVEe8crrGs2c
         MMatbzTbjkOdSy7R/Bce9qRHvJvVziDGGwr+pH/THekhSh6opM/X0cjFyJPHf3kmlubD
         SUJnrh66lYCeq+g1zOPa7SY/tbTiY0Q43zTBGatZNUeFImnuSThnRgJWXJ8ncTDDwTlS
         +EokFkNRXLcnxDKngdq00Tsc4FKR02mqvR787Z5zzy8Jour/6FpBt9XDnSEv7QWaXODX
         WR+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qXsfQWvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190a1814si97333385a.328.2024.07.08.17.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2024 17:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qXsfQWvr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sQyNI-00073k-K7; Mon, 08 Jul 2024 20:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN9-0006MR-Mf
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:19 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sQyN7-0001v6-CP
 for qemu-arm@nongnu.org; Mon, 08 Jul 2024 20:06:19 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5b9776123a3so2107415eaf.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jul 2024 17:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720483576; x=1721088376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GnsES1JfSgMlgLee5StaRe03QD6RN3WNcvucQ9eZvvk=;
 b=qXsfQWvrmatAwwXS7rJav96Yw48pgII9sAWoegugEYzq+SgiWJjcJrE/QAEwys4NPj
 V5AVpY6jEADZLpqW3EG9lJndpiixZEjo1A8lEGM9sMs4KGqtmi9L5nv+Z/ozAxIU0K5E
 JCrsYB1LZ0yhcxRQ4FvArPkh105Sx6MmsyEJhV8ApwLibi1qbjL37W2U7PR5Seiw+1On
 47RVnQ7gZ6f6FcODVx+xIi/SoPeUT+A82mASNVbWxd1hTokR6pAEGZTnRB9539NoH+qO
 juq2Cclxhx8rNA7NeYiShm6+6tVWawZH7rVTu5HCrvUHQ8/vYlriUwncxZF2Bq9gx/79
 Wb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720483576; x=1721088376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GnsES1JfSgMlgLee5StaRe03QD6RN3WNcvucQ9eZvvk=;
 b=bzKRws8OYQwD4F191FISp5DArRgQLz0JIr1qHUGOIYeIJXF6et38TL0kBFxzCQK7La
 mjA7Tq7DRoYoJ/3k+tHrnjjVElWY8FlYh1xJzLNOydiS8bkCdms3VYngNQPVrLYsaOUT
 b2ImwCnpyY4yV2flEhK6VAKg1pSZDoh/ZnUWQBEvP/8TBbu+hTSWRzM3lolhUtrGz6VC
 njeKxkWEB9JKMekdr0TId0vAfbDilWzK8P9a5Fkts1dRS2QnP+bHKo46whLlITN+DWb3
 qTLj4jJpFJo1DzFh4dVyyq/K9881zvyH7/6Ce3206d3CszVw3jiflZwfKYzpSZOLYRx5
 3F8A==
X-Gm-Message-State: AOJu0YxfMX9+Bd8cf1gjZ1RDF5r0hthsFbC1itEctEUtaWleZAxmEXuh
 2j6+Gz1z8T9CZl7fmGZ3u027OG6yCgxuER0Z2ABDVj+vzxBaBZM5WQvR5WErG/Y=
X-Received: by 2002:a05:6359:7403:b0:1a6:b005:2acb with SMTP id
 e5c5f4694b2df-1aaddfbd057mr87745255d.0.1720483576018; 
 Mon, 08 Jul 2024 17:06:16 -0700 (PDT)
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b3fefsm316617a12.76.2024.07.08.17.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 17:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 4/6] target/arm: Convert SADDW, SSUBW, UADDW,
 USUBW to decodetree
Date: Mon,  8 Jul 2024 17:06:08 -0700
Message-ID: <20240709000610.382391-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709000610.382391-1-richard.henderson@linaro.org>
References: <20240709000610.382391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
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
X-TUID: Pqb72kCA74WK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 86 +++++++++++++++++-----------------
 target/arm/tcg/a64.decode      |  5 ++
 2 files changed, 48 insertions(+), 43 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 07b9cdd78f..264d2eeb27 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5908,6 +5908,47 @@ TRANS(SQDMLSL_vi, do_3op_widening,
       a->esz | MO_SIGN, a->q, a->rd, a->rn, a->rm, a->idx,
       a->esz == MO_16 ? gen_sqdmlsl_h : gen_sqdmlsl_s, true)
 
+static bool do_addsub_wide(DisasContext *s, arg_qrrr_e *a,
+                           MemOp sign, bool sub)
+{
+    TCGv_i64 tcg_op0, tcg_op1;
+    MemOp esz = a->esz;
+    int half = 8 >> esz;
+    bool top = a->q;
+    int top_swap = top ? 0 : half - 1;
+    int top_half = top ? half : 0;
+
+    /* There are no 64x64->128 bit operations. */
+    if (esz >= MO_64) {
+        return false;
+    }
+    if (!fp_access_check(s)) {
+        return true;
+    }
+    tcg_op0 = tcg_temp_new_i64();
+    tcg_op1 = tcg_temp_new_i64();
+
+    for (int elt_fwd = 0; elt_fwd < half; ++elt_fwd) {
+        int elt = elt_fwd ^ top_swap;
+
+        read_vec_element(s, tcg_op1, a->rm, elt + top_half, esz | sign);
+        read_vec_element(s, tcg_op0, a->rn, elt, esz + 1);
+        if (sub) {
+            tcg_gen_sub_i64(tcg_op0, tcg_op0, tcg_op1);
+        } else {
+            tcg_gen_add_i64(tcg_op0, tcg_op0, tcg_op1);
+        }
+        write_vec_element(s, tcg_op0, a->rd, elt, esz + 1);
+    }
+    clear_vec_high(s, 1, a->rd);
+    return true;
+}
+
+TRANS(SADDW, do_addsub_wide, a, MO_SIGN, false)
+TRANS(UADDW, do_addsub_wide, a, 0, false)
+TRANS(SSUBW, do_addsub_wide, a, MO_SIGN, true)
+TRANS(USUBW, do_addsub_wide, a, 0, true)
+
 /*
  * Advanced SIMD scalar/vector x indexed element
  */
@@ -10790,37 +10831,6 @@ static void gen_neon_addl(int size, bool is_sub, TCGv_i64 tcg_res,
     genfn(tcg_res, tcg_op1, tcg_op2);
 }
 
-static void handle_3rd_wide(DisasContext *s, int is_q, int is_u, int size,
-                            int opcode, int rd, int rn, int rm)
-{
-    TCGv_i64 tcg_res[2];
-    int part = is_q ? 2 : 0;
-    int pass;
-
-    for (pass = 0; pass < 2; pass++) {
-        TCGv_i64 tcg_op1 = tcg_temp_new_i64();
-        TCGv_i32 tcg_op2 = tcg_temp_new_i32();
-        TCGv_i64 tcg_op2_wide = tcg_temp_new_i64();
-        static NeonGenWidenFn * const widenfns[3][2] = {
-            { gen_helper_neon_widen_s8, gen_helper_neon_widen_u8 },
-            { gen_helper_neon_widen_s16, gen_helper_neon_widen_u16 },
-            { tcg_gen_ext_i32_i64, tcg_gen_extu_i32_i64 },
-        };
-        NeonGenWidenFn *widenfn = widenfns[size][is_u];
-
-        read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element_i32(s, tcg_op2, rm, part + pass, MO_32);
-        widenfn(tcg_op2_wide, tcg_op2);
-        tcg_res[pass] = tcg_temp_new_i64();
-        gen_neon_addl(size, (opcode == 3),
-                      tcg_res[pass], tcg_op1, tcg_op2_wide);
-    }
-
-    for (pass = 0; pass < 2; pass++) {
-        write_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-    }
-}
-
 static void do_narrow_round_high_u32(TCGv_i32 res, TCGv_i64 in)
 {
     tcg_gen_addi_i64(in, in, 1U << 31);
@@ -10889,18 +10899,6 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
 
     switch (opcode) {
-    case 1: /* SADDW, SADDW2, UADDW, UADDW2 */
-    case 3: /* SSUBW, SSUBW2, USUBW, USUBW2 */
-        /* 64 x 128 -> 128 */
-        if (size == 3) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_3rd_wide(s, is_q, is_u, size, opcode, rd, rn, rm);
-        break;
     case 4: /* ADDHN, ADDHN2, RADDHN, RADDHN2 */
     case 6: /* SUBHN, SUBHN2, RSUBHN, RSUBHN2 */
         /* 128 x 128 -> 64 */
@@ -10948,7 +10946,9 @@ static void disas_simd_three_reg_diff(DisasContext *s, uint32_t insn)
         return;
     default:
     case 0: /* SADDL, SADDL2, UADDL, UADDL2 */
+    case 1: /* SADDW, SADDW2, UADDW, UADDW2 */
     case 2: /* SSUBL, SSUBL2, USUBL, USUBL2 */
+    case 3: /* SSUBW, SSUBW2, USUBW, USUBW2 */
     case 5: /* SABAL, SABAL2, UABAL, UABAL2 */
     case 7: /* SABDL, SABDL2, UABDL, UABDL2 */
     case 8: /* SMLAL, SMLAL2, UMLAL, UMLAL2 */
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index cf69e7e1be..32e2f3a0d5 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -993,6 +993,11 @@ SQDMLAL_v       0.00 1110 101 ..... 10010 0 ..... ..... @qrrr_s
 SQDMLSL_v       0.00 1110 011 ..... 10110 0 ..... ..... @qrrr_h
 SQDMLSL_v       0.00 1110 101 ..... 10110 0 ..... ..... @qrrr_s
 
+SADDW           0.00 1110 ..1 ..... 00010 0 ..... ..... @qrrr_e
+UADDW           0.10 1110 ..1 ..... 00010 0 ..... ..... @qrrr_e
+SSUBW           0.00 1110 ..1 ..... 00110 0 ..... ..... @qrrr_e
+USUBW           0.10 1110 ..1 ..... 00110 0 ..... ..... @qrrr_e
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0

