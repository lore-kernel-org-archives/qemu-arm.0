Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6269102ejc;
        Tue, 7 Mar 2023 10:37:22 -0800 (PST)
X-Google-Smtp-Source: AK7set+W8eEq48el8ckjDgvyFDpMeKMr5xtSIvhA2ZwdqboqXL3g729X26fut/Q9HzHRYhPbYitt
X-Received: by 2002:a05:6214:5089:b0:54f:b7e9:182 with SMTP id kk9-20020a056214508900b0054fb7e90182mr26154401qvb.45.1678214242449;
        Tue, 07 Mar 2023 10:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678214242; cv=none;
        d=google.com; s=arc-20160816;
        b=Hg3D+vnthW7DTam4yhu2JXN+MuptNMatWVYGC7Wp1i520RQ3EMqGthIdwrmC70OfrS
         Z288HJ9ZDfbYDA9/fghMgqY/9k6u1k54ku1QkqFx8Szq4tfu/MTKo/FYcyRBhvvE78wW
         xczK+vYfG9ARBP9SjjzSJI2IJ4J7pQ90CrT8nQ8hHqV4UBy+5Xq5iJ0TeeNRTRHzqQax
         MIr3i7Js1a/cwECUnxjqfq+d5eeJU4fWwmFmD/OKiiOeT5AuFxYUoff0VNsnXrIreANk
         izWDFdhpRMK+XKxLvvqWXGZzNyr+3+sMpadZB4X1FpsF7w/RUcyv1ECy0qlQgVgdfO7Y
         yHdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dt1LrS9/3SviLq9dWaQw8L4G7ZRCNNILvm2xpdb6v0o=;
        b=YQK6IJIp0SguwFV4ZZ65J3LbQSXgtDafW2CRFONI9e77XzpwC4HY4oy9vRwp9aiqAq
         opwPhaismRVcQEHyoDKC/lbZqmoPqStYwI3ld0ZmYvtvCs2KNkHWEXCFTnUvPUwMpQUJ
         xB2hrA/epQGFN7QQc6kIUOZWYg3VLrU0HGlP8RwNK8ZwVEE/pWSL6DW2ka+TLcGiDyRy
         QMAHkbvL+YPzHZQChXbirodal1Kciax6oPKVd0LIVIgKKwbLJiz4Dp8IrVjU+IZyXWYN
         gXKyYm6oQbaMfXpY0Jm5y4xMydqXIMcB8XmUrLblfP5kLBIKWj2PP0FBbVxaawZcQFsY
         8nyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o06dry/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a0ce04d000000b0056f00edf209si9629127qvk.51.2023.03.07.10.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Mar 2023 10:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="o06dry/O";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZc9Z-0003ZT-Rl; Tue, 07 Mar 2023 13:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9X-0003YL-U3
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:11 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9V-0007ia-Rc
 for qemu-arm@nongnu.org; Tue, 07 Mar 2023 13:35:11 -0500
Received: by mail-pl1-x633.google.com with SMTP id i3so15113636plg.6
 for <qemu-arm@nongnu.org>; Tue, 07 Mar 2023 10:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dt1LrS9/3SviLq9dWaQw8L4G7ZRCNNILvm2xpdb6v0o=;
 b=o06dry/Oj/QXc5qmla5oFi1BoubZl12yBE9BN+Ohr1OgbxyPJjH+686aCTooNinZIJ
 9Om5LuoRBlSSPQX6RLdGwM5z+b3ywBeQ15GhvjrHqgD58UsX0sahf/CsfgZjW7wJ9rcr
 PKHqWgIClVFwfj8X5taxtsYAPdGW1P9cwReaep63CwSyLTGJzFcpR7iwo1PdDzs9eImg
 9IYDMa6E+/caygrldWEeMXgYnsY/EIXfv2D9f5YKvd9Ou5eVCBaZG5ZxEqtxoWJrEg2B
 OeKHZUAw6+jnoGRX8nLb+eRKjzpuN75rdGhsyhuGoMJyG+wUT3BJqY0k07XGcpb71411
 +aAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dt1LrS9/3SviLq9dWaQw8L4G7ZRCNNILvm2xpdb6v0o=;
 b=BH3+l5vXBjQP/umeJwcIi3WcZGwblqkUtg7x8+tzOzJ7g7Nki3RJTcOX5LDKl3Amu9
 8PLOPtE020w1sWCA4PpBdOxTUBvOnAXfNE4usz2LQiemFbhYBxD+bt5T/x5jDdL+VQrh
 lcBru0xCzbCFEGWE3NSWe/WJoSOkRNEEJ9K6CddbIp9zyRX3tJDENJT6Ufe7Q/yswEEy
 iwkwtA197wwS5z/JncmGAAUhDT7VOtLSQpDAujK5ORs+Rthr5qp9XoQcaR7Ij1FQ1pw5
 wcec6pNp8MTBqq84JD6urnirlDAWd6zAep/Ym/Hop7zr1fVIA9BZvleP7n1M9jJsGmbW
 R1xw==
X-Gm-Message-State: AO0yUKVnGX+7mKrzIzlxF2LpTwNL3t3YVtoxMqhzKVXkNN9NjFE+cKaC
 riqqTlHCSD65l28OCNZsV7dhtik+4a8NJV4nKfg=
X-Received: by 2002:a17:90b:38c3:b0:236:704d:ab8c with SMTP id
 nn3-20020a17090b38c300b00236704dab8cmr17027265pjb.26.1678214108156; 
 Tue, 07 Mar 2023 10:35:08 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 05/25] target/arm: Create gen_set_rmode, gen_restore_rmode
Date: Tue,  7 Mar 2023 10:34:43 -0800
Message-Id: <20230307183503.2512684-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: Gdv4zcsYkejL

Split out common subroutines for handing rounding mode
changes during translation.  Use tcg_constant_i32 and
tcg_temp_new_i32 instead of tcg_const_i32.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: qemu-arm@nongnu.org
---
 target/arm/tcg/translate.h     | 17 ++++++++++++
 target/arm/tcg/translate-a64.c | 47 ++++++++++++++--------------------
 target/arm/tcg/translate-sve.c |  6 ++---
 target/arm/tcg/translate-vfp.c | 26 ++++++++-----------
 4 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 20f3ca7aca..f02d4685b4 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -616,6 +616,23 @@ static inline TCGv_ptr gen_lookup_cp_reg(uint32_t key)
     return ret;
 }
 
+/*
+ * Set and reset rounding mode around another operation.
+ */
+static inline TCGv_i32 gen_set_rmode(ARMFPRounding rmode, TCGv_ptr fpst)
+{
+    TCGv_i32 new = tcg_constant_i32(arm_rmode_to_sf(rmode));
+    TCGv_i32 old = tcg_temp_new_i32();
+
+    gen_helper_set_rmode(old, new, fpst);
+    return old;
+}
+
+static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
+{
+    gen_helper_set_rmode(old, old, fpst);
+}
+
 /*
  * Helpers for implementing sets of trans_* functions.
  * Defer the implementation of NAME to FUNC, with optional extra arguments.
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 210899ff79..989c958de6 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6146,13 +6146,12 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
     case 0xb: /* FRINTZ */
     case 0xc: /* FRINTA */
     {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(opcode & 7));
+        TCGv_i32 tcg_rmode;
+
         fpst = fpstatus_ptr(FPST_FPCR_F16);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        tcg_rmode = gen_set_rmode(opcode & 7, fpst);
         gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
         break;
     }
     case 0xe: /* FRINTX */
@@ -6231,10 +6230,9 @@ static void handle_fp_1src_single(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6304,10 +6302,9 @@ static void handle_fp_1src_double(DisasContext *s, int opcode, int rd, int rn)
 
     fpst = fpstatus_ptr(FPST_FPCR);
     if (rmode >= 0) {
-        TCGv_i32 tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        TCGv_i32 tcg_rmode = gen_set_rmode(rmode, fpst);
         gen_fpst(tcg_res, tcg_op, fpst);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+        gen_restore_rmode(tcg_rmode, fpst);
     } else {
         gen_fpst(tcg_res, tcg_op, fpst);
     }
@@ -6944,9 +6941,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             rmode = FPROUNDING_TIEAWAY;
         }
 
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
 
         switch (type) {
         case 1: /* float64 */
@@ -7023,7 +7018,7 @@ static void handle_fpfpcvt(DisasContext *s, int rd, int rn, int opcode,
             g_assert_not_reached();
         }
 
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -8771,9 +8766,8 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
 
     assert(!(is_scalar && is_q));
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
     tcg_fpstatus = fpstatus_ptr(size == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, tcg_fpstatus);
     fracbits = (16 << size) - immhb;
     tcg_shift = tcg_constant_i32(fracbits);
 
@@ -8831,7 +8825,7 @@ static void handle_simd_shift_fpint_conv(DisasContext *s, bool is_scalar,
         }
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    gen_restore_rmode(tcg_rmode, tcg_fpstatus);
 }
 
 /* AdvSIMD scalar shift by immediate
@@ -10219,12 +10213,11 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
         tcg_fpstatus = fpstatus_ptr(FPST_FPCR);
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
-        tcg_rmode = NULL;
         tcg_fpstatus = NULL;
+        tcg_rmode = NULL;
     }
 
     if (size == 3) {
@@ -10276,7 +10269,7 @@ static void disas_simd_scalar_two_reg_misc(DisasContext *s, uint32_t insn)
     }
 
     if (is_fcvt) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12406,8 +12399,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
         tcg_fpstatus = NULL;
     }
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     } else {
         tcg_rmode = NULL;
     }
@@ -12590,7 +12582,7 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
     clear_vec_high(s, is_q, rd);
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
@@ -12758,8 +12750,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (rmode >= 0) {
-        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_rmode = gen_set_rmode(rmode, tcg_fpstatus);
     }
 
     if (is_scalar) {
@@ -12859,7 +12850,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     }
 
     if (tcg_rmode) {
-        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        gen_restore_rmode(tcg_rmode, tcg_fpstatus);
     }
 }
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 3c65dd1ff2..3ca60fb36b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4096,17 +4096,15 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     }
 
     vsz = vec_full_reg_size(s);
-    tmode = tcg_const_i32(arm_rmode_to_sf(mode));
     status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-
-    gen_helper_set_rmode(tmode, tmode, status);
+    tmode = gen_set_rmode(mode, status);
 
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
                        pred_full_reg_offset(s, a->pg),
                        status, vsz, vsz, 0, fn);
 
-    gen_helper_set_rmode(tmode, tmode, status);
+    gen_restore_rmode(tmode, status);
     return true;
 }
 
diff --git a/target/arm/tcg/translate-vfp.c b/target/arm/tcg/translate-vfp.c
index e7acfb3338..dd782aacf4 100644
--- a/target/arm/tcg/translate-vfp.c
+++ b/target/arm/tcg/translate-vfp.c
@@ -464,8 +464,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         fpst = fpstatus_ptr(FPST_FPCR);
     }
 
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_op;
@@ -489,7 +488,7 @@ static bool trans_VRINT(DisasContext *s, arg_VRINT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -533,9 +532,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
     }
 
     tcg_shift = tcg_constant_i32(0);
-
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rounding));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(rounding, fpst);
 
     if (sz == 3) {
         TCGv_i64 tcg_double, tcg_res;
@@ -572,7 +569,7 @@ static bool trans_VCVT(DisasContext *s, arg_VCVT *a)
         vfp_store_reg32(tcg_res, rd);
     }
 
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     return true;
 }
 
@@ -2783,10 +2780,9 @@ static bool trans_VRINTZ_hp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rinth(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2808,10 +2804,9 @@ static bool trans_VRINTZ_sp(DisasContext *s, arg_VRINTZ_sp *a)
     tmp = tcg_temp_new_i32();
     vfp_load_reg32(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rints(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg32(tmp, a->vd);
     return true;
 }
@@ -2842,10 +2837,9 @@ static bool trans_VRINTZ_dp(DisasContext *s, arg_VRINTZ_dp *a)
     tmp = tcg_temp_new_i64();
     vfp_load_reg64(tmp, a->vm);
     fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_rmode = tcg_const_i32(arm_rmode_to_sf(FPROUNDING_ZERO));
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    tcg_rmode = gen_set_rmode(FPROUNDING_ZERO, fpst);
     gen_helper_rintd(tmp, tmp, fpst);
-    gen_helper_set_rmode(tcg_rmode, tcg_rmode, fpst);
+    gen_restore_rmode(tcg_rmode, fpst);
     vfp_store_reg64(tmp, a->vd);
     return true;
 }
-- 
2.34.1

