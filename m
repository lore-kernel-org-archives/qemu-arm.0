Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp207144wrv;
        Fri, 26 Jul 2019 10:51:07 -0700 (PDT)
X-Received: by 2002:a63:c84d:: with SMTP id l13mr87615841pgi.154.1564163466806;
        Fri, 26 Jul 2019 10:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163466; cv=none;
        d=google.com; s=arc-20160816;
        b=xapH0PI/jYUo83wY3uR+p50ct+PvCEEfgQTYQ3z0ehqANbnacj8ZRhS4fH50LkSHhG
         UPxn7Dsn6bqE+ql+mN1yjzfBOb6ZXEqGtZytnGA41ls4dNiSqHKrZ0E5+t/S8LNlLSFd
         RrPhMjvKbhxziKc0meu8sfYDyuaGLrn4QjgKE8c8G5u+qCBQwaboSNFrptjYwGYTZDhf
         s5M08YST2rv4c7oqNBgYWRy/MNBc76o+/nu62Y1zpBbGVCrR+p+iYznK2r2bdfLQsQXx
         iMj9M6gFXIZ1vHBkm5toj1bYzhLk3GyA5fTlqv9eq8tW18Uy0x02M0bFajK6lI7BJbIx
         /KCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=G+QSnEYqXF/oTE+I+ALJbsZ2r4R3OZGRCeVr3t2ySsk=;
        b=yCbO8feoRh6178fyvb8VSPD3EIVToZIvI0ouJwjI+PJNv99rZjzs+j9jORbFCPUXEQ
         Qw45ejFBor8zMxnuP6IZ/vIE+6djqos9w05xhEZ7SoQupUjJIcGX+O4KBtxOhXhKvqiU
         kXCGQ6JvSYABtUgSeGhNM7AUIh3TbcSRv8S01Q0b90KaDdEzVM9cE2BSaYeMzrq3SdkB
         LXdqCvT5GDbwiPDZ2OILJ6Nd64aFNIi1ou57zNNUPNPDVGWBhcYooC4lLeZmQznHF3Lq
         dNZy8RroWUn3Gn2B0jdinpDBBGCpX+NJnN28o1blLq9OSCTgK+fQYc2ATNLACmHTmR1T
         KuIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kISlNp5n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j9sor8086957pgf.6.2019.07.26.10.51.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kISlNp5n;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=G+QSnEYqXF/oTE+I+ALJbsZ2r4R3OZGRCeVr3t2ySsk=;
        b=kISlNp5nE8I749I4oLIKQckvP5KwoKV4u5lFjFNZsgCw/ptdlVvoWE4ef5IS1npxFF
         vaoULYbwEDhQK4EKdTJs74/nlh0kxPGP90Px1BsYpuBdv0fJJ3UD7+LBB6cW4uYhaoKh
         rfDP1nk/MsMfD7xzt5fmEIPXbNDU15fFKu+7gL7552x6mLnOqfZbcjeSxWC3T6YE8CM8
         FofFOzeWbZHUbPMuadl3euCmym1DJFh1QzZuMxZOnsNHESGhQhjkmI+rppZhu9U/c5jL
         z313rgCDJWweNELovc2Wbf8CwGattOFWivvhf+/8IFGk8szaa4cRuQQIU90oaE2BSJ6D
         S5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=G+QSnEYqXF/oTE+I+ALJbsZ2r4R3OZGRCeVr3t2ySsk=;
        b=r9oiKfyo3tRMgUXoUXBc0NJmR1VXO+pE9Ok6OJuEgdCbn03p1aRQaKz3VTKOz5/4kK
         xTIaqgjMm7CASd7sKW3CeZ82Mm2TPSrNgkDI5e6gCYf4cTHWmCLzKJVZ052X8MJtYwJJ
         /2U0bsR5+ZykW+eAM5H3WNPaYhEUlO31RXU7ZypS4E9/DrIw5ljBcqz0PIdadjn0VY2q
         fg/MtVLsqraTx6Ge8KMLZmgrTN+20Zz6iEn1drj4AqkbW3GT0Ob4uFsvpUil4skDf7ne
         2Aqp60BgGhMXtQVlt62tfMeL9+CHi8Qh3AudHKGKa2GYKsEACuNdMxfKasnjqQoh0oBN
         eaOg==
X-Gm-Message-State: APjAAAUMwjJclbYhfGkHEr0y9rxI3+z8pYH0B99vcTsuQl1VpKKUrxrX
	Gucdc0ErPHWkIp6Rt+XL6Ws9V0xF
X-Google-Smtp-Source: APXvYqxrgKeALelDo5nQDJnwqBPxjQfqrqHjysc56s10cna0tnn1gu/Mw4nvkZdjCxo6qtQ1kZN5rA==
X-Received: by 2002:a65:5082:: with SMTP id r2mr66449305pgp.170.1564163466096;
        Fri, 26 Jul 2019 10:51:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:51:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 27/67] target/arm: Convert Signed multiply, signed and unsigned divide
Date: Fri, 26 Jul 2019 10:49:52 -0700
Message-Id: <20190726175032.6769-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 7OLYDP5VP78d

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 471 ++++++++++++++++++-----------------------
 target/arm/a32.decode  |  22 ++
 target/arm/t32.decode  |  18 ++
 3 files changed, 248 insertions(+), 263 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 11e74135fd..5bdec27265 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9512,17 +9512,218 @@ static bool trans_RBIT(DisasContext *s, arg_rr *a)
     return op_rr(s, a, gen_helper_rbit);
 }
 
+/*
+ * Signed multiply, signed and unsigned divide
+ */
+
+static bool op_smlad(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    if (sub) {
+        /* This subtraction cannot overflow. */
+        tcg_gen_sub_i32(t1, t1, t2);
+    } else {
+        /*
+         * This addition cannot overflow 32 bits; however it may
+         * overflow considered as a signed operation, in which case
+         * we must set the Q flag.
+         */
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+
+    if (a->ra != 15) {
+        t2 = load_reg(s, a->ra);
+        gen_helper_add_setq(t1, cpu_env, t1, t2);
+        tcg_temp_free_i32(t2);
+    }
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMLAD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, false);
+}
+
+static bool trans_SMLADX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, false);
+}
+
+static bool trans_SMLSD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, false, true);
+}
+
+static bool trans_SMLSDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlad(s, a, true, true);
+}
+
+static bool op_smlald(DisasContext *s, arg_rrrr *a, bool m_swap, bool sub)
+{
+    TCGv_i32 t1, t2;
+    TCGv_i64 l1, l2;
+
+    if (!ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (m_swap) {
+        gen_swap_half(t2);
+    }
+    gen_smul_dual(t1, t2);
+
+    l1 = tcg_temp_new_i64();
+    l2 = tcg_temp_new_i64();
+    tcg_gen_ext_i32_i64(l1, t1);
+    tcg_gen_ext_i32_i64(l2, t2);
+    tcg_temp_free_i32(t1);
+    tcg_temp_free_i32(t2);
+
+    if (sub) {
+        tcg_gen_sub_i64(l1, l1, l2);
+    } else {
+        tcg_gen_add_i64(l1, l1, l2);
+    }
+    tcg_temp_free_i64(l2);
+
+    gen_addq(s, l1, a->ra, a->rd);
+    gen_storeq_reg(s, a->ra, a->rd, l1);
+    tcg_temp_free_i64(l1);
+    return true;
+}
+
+static bool trans_SMLALD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, false);
+}
+
+static bool trans_SMLALDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, false);
+}
+
+static bool trans_SMLSLD(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, false, true);
+}
+
+static bool trans_SMLSLDX(DisasContext *s, arg_rrrr *a)
+{
+    return op_smlald(s, a, true, true);
+}
+
+static bool op_smmla(DisasContext *s, arg_rrrr *a, bool round, bool sub)
+{
+    TCGv_i32 t1, t2;
+    TCGv_i64 tmp64;
+
+    if (s->thumb
+        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
+        : !ENABLE_ARCH_6) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    tmp64 = gen_muls_i64_i32(t1, t2);
+
+    if (a->ra != 15) {
+        t1 = load_reg(s, a->ra);
+        if (sub) {
+            tmp64 = gen_subq_msw(tmp64, t1);
+        } else {
+            tmp64 = gen_addq_msw(tmp64, t1);
+        }
+    }
+    if (round) {
+        tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
+    }
+    t1 = tcg_temp_new_i32();
+    tcg_gen_extrh_i64_i32(t1, tmp64);
+    tcg_temp_free_i64(tmp64);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SMMLA(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, false);
+}
+
+static bool trans_SMMLAR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, false);
+}
+
+static bool trans_SMMLS(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, false, true);
+}
+
+static bool trans_SMMLSR(DisasContext *s, arg_rrrr *a)
+{
+    return op_smmla(s, a, true, true);
+}
+
+static bool op_div(DisasContext *s, arg_rrr *a, bool u)
+{
+    TCGv_i32 t1, t2;
+
+    if (s->thumb
+        ? !dc_isar_feature(thumb_div, s)
+        : !dc_isar_feature(arm_div, s)) {
+        return false;
+    }
+
+    t1 = load_reg(s, a->rn);
+    t2 = load_reg(s, a->rm);
+    if (u) {
+        gen_helper_udiv(t1, t1, t2);
+    } else {
+        gen_helper_sdiv(t1, t1, t2);
+    }
+    tcg_temp_free_i32(t2);
+    store_reg(s, a->rd, t1);
+    return true;
+}
+
+static bool trans_SDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, false);
+}
+
+static bool trans_UDIV(DisasContext *s, arg_rrr *a)
+{
+    return op_div(s, a, true);
+}
+
 /*
  * Legacy decoder.
  */
 
 static void disas_arm_insn(DisasContext *s, unsigned int insn)
 {
-    unsigned int cond, val, op1, i, rm, rs, rn, rd;
+    unsigned int cond, val, op1, i, rn, rd;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
 
     /* M variants do not implement ARM mode; this must raise the INVSTATE
      * UsageFault exception.
@@ -9802,144 +10003,10 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
         switch(op1) {
         case 0x0:
         case 0x1:
-            /* multiplies, extra load/stores */
-            /* All done in decodetree.  Reach here for illegal ops.  */
-            goto illegal_op;
-            break;
         case 0x4:
         case 0x5:
-            goto do_ldst;
         case 0x6:
         case 0x7:
-            if (insn & (1 << 4)) {
-                ARCH(6);
-                /* Armv6 Media instructions.  */
-                rm = insn & 0xf;
-                rn = (insn >> 16) & 0xf;
-                rd = (insn >> 12) & 0xf;
-                rs = (insn >> 8) & 0xf;
-                switch ((insn >> 23) & 3) {
-                case 0: /* Parallel add/subtract.  */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 1:
-                    /* Halfword pack, [US]SAT, [US]SAT16, SEL, REV et al */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                case 2: /* Multiplies (Type 3).  */
-                    switch ((insn >> 20) & 0x7) {
-                    case 5:
-                        if (((insn >> 6) ^ (insn >> 7)) & 1) {
-                            /* op2 not 00x or 11x : UNDEF */
-                            goto illegal_op;
-                        }
-                        /* Signed multiply most significant [accumulate].
-                           (SMMUL, SMMLA, SMMLS) */
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        tmp64 = gen_muls_i64_i32(tmp, tmp2);
-
-                        if (rd != 15) {
-                            tmp = load_reg(s, rd);
-                            if (insn & (1 << 6)) {
-                                tmp64 = gen_subq_msw(tmp64, tmp);
-                            } else {
-                                tmp64 = gen_addq_msw(tmp64, tmp);
-                            }
-                        }
-                        if (insn & (1 << 5)) {
-                            tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
-                        }
-                        tcg_gen_shri_i64(tmp64, tmp64, 32);
-                        tmp = tcg_temp_new_i32();
-                        tcg_gen_extrl_i64_i32(tmp, tmp64);
-                        tcg_temp_free_i64(tmp64);
-                        store_reg(s, rn, tmp);
-                        break;
-                    case 0:
-                    case 4:
-                        /* SMLAD, SMUAD, SMLSD, SMUSD, SMLALD, SMLSLD */
-                        if (insn & (1 << 7)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 5))
-                            gen_swap_half(tmp2);
-                        gen_smul_dual(tmp, tmp2);
-                        if (insn & (1 << 22)) {
-                            /* smlald, smlsld */
-                            TCGv_i64 tmp64_2;
-
-                            tmp64 = tcg_temp_new_i64();
-                            tmp64_2 = tcg_temp_new_i64();
-                            tcg_gen_ext_i32_i64(tmp64, tmp);
-                            tcg_gen_ext_i32_i64(tmp64_2, tmp2);
-                            tcg_temp_free_i32(tmp);
-                            tcg_temp_free_i32(tmp2);
-                            if (insn & (1 << 6)) {
-                                tcg_gen_sub_i64(tmp64, tmp64, tmp64_2);
-                            } else {
-                                tcg_gen_add_i64(tmp64, tmp64, tmp64_2);
-                            }
-                            tcg_temp_free_i64(tmp64_2);
-                            gen_addq(s, tmp64, rd, rn);
-                            gen_storeq_reg(s, rd, rn, tmp64);
-                            tcg_temp_free_i64(tmp64);
-                        } else {
-                            /* smuad, smusd, smlad, smlsd */
-                            if (insn & (1 << 6)) {
-                                /* This subtraction cannot overflow. */
-                                tcg_gen_sub_i32(tmp, tmp, tmp2);
-                            } else {
-                                /* This addition cannot overflow 32 bits;
-                                 * however it may overflow considered as a
-                                 * signed operation, in which case we must set
-                                 * the Q flag.
-                                 */
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                            }
-                            tcg_temp_free_i32(tmp2);
-                            if (rd != 15)
-                              {
-                                tmp2 = load_reg(s, rd);
-                                gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                                tcg_temp_free_i32(tmp2);
-                              }
-                            store_reg(s, rn, tmp);
-                        }
-                        break;
-                    case 1:
-                    case 3:
-                        /* SDIV, UDIV */
-                        if (!dc_isar_feature(arm_div, s)) {
-                            goto illegal_op;
-                        }
-                        if (((insn >> 5) & 7) || (rd != 15)) {
-                            goto illegal_op;
-                        }
-                        tmp = load_reg(s, rm);
-                        tmp2 = load_reg(s, rs);
-                        if (insn & (1 << 21)) {
-                            gen_helper_udiv(tmp, tmp, tmp2);
-                        } else {
-                            gen_helper_sdiv(tmp, tmp, tmp2);
-                        }
-                        tcg_temp_free_i32(tmp2);
-                        store_reg(s, rn, tmp);
-                        break;
-                    default:
-                        goto illegal_op;
-                    }
-                    break;
-                case 3:
-                    /* USAD, BFI, BFC, SBFX, UBFX */
-                    /* Done by decodetree */
-                    goto illegal_op;
-                }
-                break;
-            }
-        do_ldst:
             /* All done in decodetree.  Reach here for illegal ops.  */
             goto illegal_op;
         case 0x08:
@@ -10163,7 +10230,6 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
     TCGv_i32 addr;
-    TCGv_i64 tmp64;
     int op;
 
     /*
@@ -10429,132 +10495,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         case 2: /* SIMD add/subtract, in decodetree */
         case 3: /* Other data processing, in decodetree */
             goto illegal_op;
-        case 4: case 5: /* 32-bit multiply.  Sum of absolute differences.  */
-            switch ((insn >> 20) & 7) {
-            case 0: /* 32 x 32 -> 32 */
-            case 1: /* 16 x 16 -> 32 */
-            case 3: /* 32 * 16 -> 32msb */
-            case 7: /* Unsigned sum of absolute differences.  */
-                /* in decodetree */
-                goto illegal_op;
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    goto illegal_op;
-                }
-                break;
-            }
-            op = (insn >> 4) & 0xf;
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            switch ((insn >> 20) & 7) {
-            case 2: /* Dual multiply add.  */
-            case 4: /* Dual multiply subtract.  */
-                if (op)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (insn & (1 << 22)) {
-                    /* This subtraction cannot overflow. */
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    /* This addition cannot overflow 32 bits;
-                     * however it may overflow considered as a signed
-                     * operation, in which case we must set the Q flag.
-                     */
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                if (rs != 15)
-                  {
-                    tmp2 = load_reg(s, rs);
-                    gen_helper_add_setq(tmp, cpu_env, tmp, tmp2);
-                    tcg_temp_free_i32(tmp2);
-                  }
-                break;
-            case 5: case 6: /* 32 * 32 -> 32msb (SMMUL, SMMLA, SMMLS) */
-                tmp64 = gen_muls_i64_i32(tmp, tmp2);
-                if (rs != 15) {
-                    tmp = load_reg(s, rs);
-                    if (insn & (1 << 20)) {
-                        tmp64 = gen_addq_msw(tmp64, tmp);
-                    } else {
-                        tmp64 = gen_subq_msw(tmp64, tmp);
-                    }
-                }
-                if (insn & (1 << 4)) {
-                    tcg_gen_addi_i64(tmp64, tmp64, 0x80000000u);
-                }
-                tcg_gen_shri_i64(tmp64, tmp64, 32);
-                tmp = tcg_temp_new_i32();
-                tcg_gen_extrl_i64_i32(tmp, tmp64);
-                tcg_temp_free_i64(tmp64);
-                break;
-            }
-            store_reg(s, rd, tmp);
-            break;
-        case 6: case 7: /* 64-bit multiply, Divide.  */
-            op = ((insn >> 4) & 0xf) | ((insn >> 16) & 0x70);
-            tmp = load_reg(s, rn);
-            tmp2 = load_reg(s, rm);
-            if ((op & 0x50) == 0x10) {
-                /* sdiv, udiv */
-                if (!dc_isar_feature(thumb_div, s)) {
-                    goto illegal_op;
-                }
-                if (op & 0x20)
-                    gen_helper_udiv(tmp, tmp, tmp2);
-                else
-                    gen_helper_sdiv(tmp, tmp, tmp2);
-                tcg_temp_free_i32(tmp2);
-                store_reg(s, rd, tmp);
-            } else if ((op & 0xe) == 0xc) {
-                /* Dual multiply accumulate long.  */
-                if (!arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)) {
-                    tcg_temp_free_i32(tmp);
-                    tcg_temp_free_i32(tmp2);
-                    goto illegal_op;
-                }
-                if (op & 1)
-                    gen_swap_half(tmp2);
-                gen_smul_dual(tmp, tmp2);
-                if (op & 0x10) {
-                    tcg_gen_sub_i32(tmp, tmp, tmp2);
-                } else {
-                    tcg_gen_add_i32(tmp, tmp, tmp2);
-                }
-                tcg_temp_free_i32(tmp2);
-                /* BUGFIX */
-                tmp64 = tcg_temp_new_i64();
-                tcg_gen_ext_i32_i64(tmp64, tmp);
-                tcg_temp_free_i32(tmp);
-                gen_addq(s, tmp64, rs, rd);
-                gen_storeq_reg(s, rs, rd, tmp64);
-                tcg_temp_free_i64(tmp64);
-            } else {
-                if (op & 0x20) {
-                    /* Unsigned 64-bit multiply  */
-                    tmp64 = gen_mulu_i64_i32(tmp, tmp2);
-                } else {
-                    if (op & 8) {
-                        /* smlalxy, in decodetree */
-                        goto illegal_op;
-                    } else {
-                        /* Signed 64-bit multiply  */
-                        tmp64 = gen_muls_i64_i32(tmp, tmp2);
-                    }
-                }
-                if (op & 4) {
-                    /* umaal, in decodetree */
-                    goto illegal_op;
-                } else if (op & 0x40) {
-                    /* 64-bit accumulate.  */
-                    gen_addq(s, tmp64, rs, rd);
-                }
-                gen_storeq_reg(s, rs, rd, tmp64);
-                tcg_temp_free_i64(tmp64);
-            }
-            break;
+        case 4: case 5:
+            /* 32-bit multiply.  Sum of absolute differences, in decodetree */
+            goto illegal_op;
+        case 6: case 7: /* 64-bit multiply, Divide, in decodetree */
+            goto illegal_op;
         }
         break;
     case 6: case 7: case 14: case 15:
diff --git a/target/arm/a32.decode b/target/arm/a32.decode
index 725e627796..c5af685585 100644
--- a/target/arm/a32.decode
+++ b/target/arm/a32.decode
@@ -486,3 +486,25 @@ REV              .... 0110 1011 1111 .... 1111 0011 ....      @rdm
 REV16            .... 0110 1011 1111 .... 1111 1011 ....      @rdm
 REVSH            .... 0110 1111 1111 .... 1111 1011 ....      @rdm
 RBIT             .... 0110 1111 1111 .... 1111 0011 ....      @rdm
+
+# Signed multiply, signed and unsigned divide
+
+@rdmn            ---- .... .... rd:4 .... rm:4 .... rn:4      &rrr
+
+SMLAD            .... 0111 0000 .... .... .... 0001 ....      @rdamn
+SMLADX           .... 0111 0000 .... .... .... 0011 ....      @rdamn
+SMLSD            .... 0111 0000 .... .... .... 0101 ....      @rdamn
+SMLSDX           .... 0111 0000 .... .... .... 0111 ....      @rdamn
+
+SDIV             .... 0111 0001 .... 1111 .... 0001 ....      @rdmn
+UDIV             .... 0111 0011 .... 1111 .... 0001 ....      @rdmn
+
+SMLALD           .... 0111 0100 .... .... .... 0001 ....      @rdamn
+SMLALDX          .... 0111 0100 .... .... .... 0011 ....      @rdamn
+SMLSLD           .... 0111 0100 .... .... .... 0101 ....      @rdamn
+SMLSLDX          .... 0111 0100 .... .... .... 0111 ....      @rdamn
+
+SMMLA            .... 0111 0101 .... .... .... 0001 ....      @rdamn
+SMMLAR           .... 0111 0101 .... .... .... 0011 ....      @rdamn
+SMMLS            .... 0111 0101 .... .... .... 1101 ....      @rdamn
+SMMLSR           .... 0111 0101 .... .... .... 1111 ....      @rdamn
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index ea147e5348..68203e3704 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -228,6 +228,24 @@ SMLALTT          1111 1011 1100 .... .... .... 1011 ....      @rnadm
 # usad8 is usada8 w/ ra=15
 USADA8           1111 1011 0111 .... .... .... 0000 ....      @rnadm
 
+SMLAD            1111 1011 0010 .... .... .... 0000 ....      @rnadm
+SMLADX           1111 1011 0010 .... .... .... 0001 ....      @rnadm
+SMLSD            1111 1011 0100 .... .... .... 0000 ....      @rnadm
+SMLSDX           1111 1011 0100 .... .... .... 0001 ....      @rnadm
+
+SMLALD           1111 1011 1100 .... .... .... 1100 ....      @rnadm
+SMLALDX          1111 1011 1100 .... .... .... 1101 ....      @rnadm
+SMLSLD           1111 1011 1101 .... .... .... 1100 ....      @rnadm
+SMLSLDX          1111 1011 1101 .... .... .... 1101 ....      @rnadm
+
+SMMLA            1111 1011 0101 .... .... .... 0000 ....      @rnadm
+SMMLAR           1111 1011 0101 .... .... .... 0001 ....      @rnadm
+SMMLS            1111 1011 0110 .... .... .... 0000 ....      @rnadm
+SMMLSR           1111 1011 0110 .... .... .... 0001 ....      @rnadm
+
+SDIV             1111 1011 1001 .... 1111 .... 1111 ....      @rndm
+UDIV             1111 1011 1011 .... 1111 .... 1111 ....      @rndm
+
 # Data-processing (two source registers)
 
 QADD             1111 1010 1000 .... 1111 .... 1000 ....      @rndm
-- 
2.17.1
