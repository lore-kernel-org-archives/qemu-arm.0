Received: by 10.223.183.22 with SMTP id l22csp80797wre;
        Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
X-Received: by 10.84.215.213 with SMTP id g21mr6322716plj.477.1503010879835;
        Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503010879; cv=none;
        d=google.com; s=arc-20160816;
        b=ytx3EI8pEn+yPvPieTOdQCWmTd+bZ+pFKTmONYbzjAPE0wODERixjgejhBepvxMh/D
         adCxWG+TxHgK4wZ8mCLhQY/cZrxqdCQo6AxBLrEvFPYA1pN4eROOtM8OeQ7b4mcocDbQ
         4yPVBt1EZIPKHTK7gECTP2BTNBz6CeyeJY9nvW5Fach4Knk93FSWf/jaGTJch6sRfkcU
         lxgyIJ8qrE0z4NuCI37loX7EM4U9t4ua0BjW4w66DwFG83BbI1eJzNd7FVqt+6tMqmAs
         EvVrTqO8cJ29MTCjQlYzaVfTUypmxwtIMWh5BlhyewqOUAPebiYh0/H/lZSVbCWz2ChQ
         IMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:arc-authentication-results;
        bh=aXDZ4Qr9mwfYKP1Hb4K6fjgDzUCvCw9IzsWpbOBP7G0=;
        b=QxsOOdRZ2pFzMr53LcuK1Mqq6IRwtQPPhMsvIHC6bt/PkOkJZsIBOe5yw9uhXjC0jf
         2rOUGWS4xC5WUy+Q6Yf+ZrnB1qJfPWY4ojkis0Kl4npZVsEvHSmH8WDZJMghMDOdcE02
         ykRchplL02Me9fux7L86LskDaq0LpCgXVBnly4LhDbxUBTF/Pj2Szu77p1I1nmWxubZ9
         wd0kemd6QhH9AcmeqxRphTVNyM9irv6I0qnIPkJjuoY2TksvXbCyOEL1aXw8llbfkhQf
         y6ptfBusaycKplpeQFCFRiCDM40jVoMU0w0wqy0Hg6p1BTnJIz5O0yaP6Xpu8J0u31Hc
         FCkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXNcPQ8q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22a as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22a.google.com (mail-pg0-x22a.google.com. [2607:f8b0:400e:c05::22a])
        by mx.google.com with ESMTPS id e9si2655690pfb.690.2017.08.17.16.01.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22a as permitted sender) client-ip=2607:f8b0:400e:c05::22a;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TXNcPQ8q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22a as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22a.google.com with SMTP id t3so23902908pgt.0
        for <alex.bennee@linaro.org>; Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aXDZ4Qr9mwfYKP1Hb4K6fjgDzUCvCw9IzsWpbOBP7G0=;
        b=TXNcPQ8qLiZ3cZen6iUEA4m0Jsfn/DYXvMtximn7ImIWf0YkK5RkHY5Z+lwX+gpuvm
         k5c4PyN7e1pAPlEPAxkLgwaCpUKDkaljzxKAVNNrSYY9R9FE0k5S+IYD+LVZbqAR40vi
         VJL9vyISIzfpC7MvYPE8nBnleg+IbgdwNGpIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aXDZ4Qr9mwfYKP1Hb4K6fjgDzUCvCw9IzsWpbOBP7G0=;
        b=a3SjPZSsmPHHPR6Ks8mNI+VmDD6cenVjhgGyoXNhcoi0gM+zYSkvKz6LsjjBHA3eIy
         P7EMTqyM/ZKgFrfbhjeNWJO2B1XPZMUUqmrksaJ8OyjX1zD+tmFydOOdffwEAQpGT2cG
         bBnLPcmgMTkIttPEReKqUU1/D+js+rwkgmydPKbZsKyZAhTNrKsS7FcRNVeOTJ9pClSr
         1TFgvIvkRVX5wfqP15ay5LRwDEPsblFRY26EPcUMofetkWwu1gPxQ3798YGjJwej3T7S
         6Jnfwl6G0fRS5YzBY0ZfvK2Ol6VKyYkm88CwJnJiZOXqOygiqf8uU3yS6U1oaYbAxmq5
         h1Og==
X-Gm-Message-State: AHYfb5gswXAqb9saGrCX4pyOC7wQ9B4fCOxmYSbxQb/+CHfFRWeopCs5
	g0RMyXS1z0hUVeU0Y7gyjp2v
X-Received: by 10.84.171.195 with SMTP id l61mr7755983plb.464.1503010879346;
        Thu, 17 Aug 2017 16:01:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id c23sm5190043pfc.136.2017.08.17.16.01.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Aug 2017 16:01:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 2/8] target/arm: Use generic vector infrastructure for aa64 add/sub/logic
Date: Thu, 17 Aug 2017 16:01:08 -0700
Message-Id: <20170817230114.3655-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170817230114.3655-1-richard.henderson@linaro.org>
References: <20170817230114.3655-1-richard.henderson@linaro.org>
X-TUID: oKTmiUutSLtJ

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 137 ++++++++++++++++++++++++++++-----------------
 1 file changed, 87 insertions(+), 50 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2200e25be0..025354f983 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "tcg-op.h"
+#include "tcg-op-gvec.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "translate.h"
@@ -82,6 +83,7 @@ typedef void NeonGenTwoDoubleOPFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
 typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
 typedef void CryptoTwoOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void CryptoThreeOpEnvFn(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
+typedef void GVecGenTwoFn(uint32_t, uint32_t, uint32_t, uint32_t, uint32_t);
 
 /* initialize TCG globals.  */
 void a64_translate_init(void)
@@ -537,6 +539,21 @@ static inline int vec_reg_offset(DisasContext *s, int regno,
     return offs;
 }
 
+/* Return the offset info CPUARMState of the "whole" vector register Qn.  */
+static inline int vec_full_reg_offset(DisasContext *s, int regno)
+{
+    assert_fp_access_checked(s);
+    return offsetof(CPUARMState, vfp.regs[regno * 2]);
+}
+
+/* Return the byte size of the "whole" vector register, VL / 8.  */
+static inline int vec_full_reg_size(DisasContext *s)
+{
+    /* FIXME SVE: We should put the composite ZCR_EL* value into tb->flags.
+       In the meantime this is just the AdvSIMD length of 128.  */
+    return 128 / 8;
+}
+
 /* Return the offset into CPUARMState of a slice (from
  * the least significant end) of FP register Qn (ie
  * Dn, Sn, Hn or Bn).
@@ -9042,11 +9059,38 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
     bool is_q = extract32(insn, 30, 1);
     TCGv_i64 tcg_op1, tcg_op2, tcg_res[2];
     int pass;
+    GVecGenTwoFn *gvec_op;
 
     if (!fp_access_check(s)) {
         return;
     }
 
+    switch (size + 4 * is_u) {
+    case 0: /* AND */
+        gvec_op = tcg_gen_gvec_and8;
+        goto do_gvec;
+    case 1: /* BIC */
+        gvec_op = tcg_gen_gvec_andc8;
+        goto do_gvec;
+    case 2: /* ORR */
+        gvec_op = tcg_gen_gvec_or8;
+        goto do_gvec;
+    case 3: /* ORN */
+        gvec_op = tcg_gen_gvec_orc8;
+        goto do_gvec;
+    case 4: /* EOR */
+        gvec_op = tcg_gen_gvec_xor8;
+        goto do_gvec;
+    do_gvec:
+        gvec_op(vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn),
+                vec_full_reg_offset(s, rm),
+                is_q ? 16 : 8, vec_full_reg_size(s));
+        return;
+    }
+
+    /* Note that we've now eliminated all !is_u.  */
+
     tcg_op1 = tcg_temp_new_i64();
     tcg_op2 = tcg_temp_new_i64();
     tcg_res[0] = tcg_temp_new_i64();
@@ -9056,47 +9100,27 @@ static void disas_simd_3same_logic(DisasContext *s, uint32_t insn)
         read_vec_element(s, tcg_op1, rn, pass, MO_64);
         read_vec_element(s, tcg_op2, rm, pass, MO_64);
 
-        if (!is_u) {
-            switch (size) {
-            case 0: /* AND */
-                tcg_gen_and_i64(tcg_res[pass], tcg_op1, tcg_op2);
-                break;
-            case 1: /* BIC */
-                tcg_gen_andc_i64(tcg_res[pass], tcg_op1, tcg_op2);
-                break;
-            case 2: /* ORR */
-                tcg_gen_or_i64(tcg_res[pass], tcg_op1, tcg_op2);
-                break;
-            case 3: /* ORN */
-                tcg_gen_orc_i64(tcg_res[pass], tcg_op1, tcg_op2);
-                break;
-            }
-        } else {
-            if (size != 0) {
-                /* B* ops need res loaded to operate on */
-                read_vec_element(s, tcg_res[pass], rd, pass, MO_64);
-            }
+        /* B* ops need res loaded to operate on */
+        read_vec_element(s, tcg_res[pass], rd, pass, MO_64);
 
-            switch (size) {
-            case 0: /* EOR */
-                tcg_gen_xor_i64(tcg_res[pass], tcg_op1, tcg_op2);
-                break;
-            case 1: /* BSL bitwise select */
-                tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_op2);
-                tcg_gen_and_i64(tcg_op1, tcg_op1, tcg_res[pass]);
-                tcg_gen_xor_i64(tcg_res[pass], tcg_op2, tcg_op1);
-                break;
-            case 2: /* BIT, bitwise insert if true */
-                tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_res[pass]);
-                tcg_gen_and_i64(tcg_op1, tcg_op1, tcg_op2);
-                tcg_gen_xor_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
-                break;
-            case 3: /* BIF, bitwise insert if false */
-                tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_res[pass]);
-                tcg_gen_andc_i64(tcg_op1, tcg_op1, tcg_op2);
-                tcg_gen_xor_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
-                break;
-            }
+        switch (size) {
+        case 1: /* BSL bitwise select */
+            tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_op2);
+            tcg_gen_and_i64(tcg_op1, tcg_op1, tcg_res[pass]);
+            tcg_gen_xor_i64(tcg_res[pass], tcg_op2, tcg_op1);
+            break;
+        case 2: /* BIT, bitwise insert if true */
+            tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_res[pass]);
+            tcg_gen_and_i64(tcg_op1, tcg_op1, tcg_op2);
+            tcg_gen_xor_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
+            break;
+        case 3: /* BIF, bitwise insert if false */
+            tcg_gen_xor_i64(tcg_op1, tcg_op1, tcg_res[pass]);
+            tcg_gen_andc_i64(tcg_op1, tcg_op1, tcg_op2);
+            tcg_gen_xor_i64(tcg_res[pass], tcg_res[pass], tcg_op1);
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 
@@ -9370,6 +9394,7 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
     int pass;
+    GVecGenTwoFn *gvec_op;
 
     switch (opcode) {
     case 0x13: /* MUL, PMUL */
@@ -9409,6 +9434,28 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
         return;
     }
 
+    switch (opcode) {
+    case 0x10: /* ADD, SUB */
+        {
+            static GVecGenTwoFn * const fns[4][2] = {
+                { tcg_gen_gvec_add8, tcg_gen_gvec_sub8 },
+                { tcg_gen_gvec_add16, tcg_gen_gvec_sub16 },
+                { tcg_gen_gvec_add32, tcg_gen_gvec_sub32 },
+                { tcg_gen_gvec_add64, tcg_gen_gvec_sub64 },
+            };
+            gvec_op = fns[size][u];
+            goto do_gvec;
+        }
+        break;
+
+    do_gvec:
+        gvec_op(vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn),
+                vec_full_reg_offset(s, rm),
+                is_q ? 16 : 8, vec_full_reg_size(s));
+        return;
+    }
+
     if (size == 3) {
         assert(is_q);
         for (pass = 0; pass < 2; pass++) {
@@ -9581,16 +9628,6 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
                 genfn = fns[size][u];
                 break;
             }
-            case 0x10: /* ADD, SUB */
-            {
-                static NeonGenTwoOpFn * const fns[3][2] = {
-                    { gen_helper_neon_add_u8, gen_helper_neon_sub_u8 },
-                    { gen_helper_neon_add_u16, gen_helper_neon_sub_u16 },
-                    { tcg_gen_add_i32, tcg_gen_sub_i32 },
-                };
-                genfn = fns[size][u];
-                break;
-            }
             case 0x11: /* CMTST, CMEQ */
             {
                 static NeonGenTwoOpFn * const fns[3][2] = {
-- 
2.13.5
