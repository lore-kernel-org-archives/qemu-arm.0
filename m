Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b11sm2508099wrd.91.2017.10.13.09.32.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:32:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 311863E103D;
	Fri, 13 Oct 2017 17:24:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 24/30] disas_simd_indexed: support half-precision operations
Date: Fri, 13 Oct 2017 17:24:32 +0100
Message-Id: <20171013162438.32458-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GGPJQS+GhI9N

A mild re-factoring of the !is_double leg to gracefully handle both
single and half-precision operations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    |  6 ++++++
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.c | 19 +++++++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 137866732d..241fee9d93 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -578,6 +578,12 @@ float16 HELPER(advsimd_mulxh)(float16 a, float16 b, void *fpstp)
     return float16_mul(a, b, fpst);
 }
 
+/* fused multiply-accumulate */
+float16 HELPER(advsimd_muladdh)(float16 a, float16 b, float16 c, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return float16_muladd(a, b, c, 0, fpst);
+}
 
 /*
  * Floating point comparisons produce an integer result.
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 66c4062ea5..444d046500 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -53,6 +53,7 @@ DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minnumh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_mulxh, f16, f16, f16, ptr)
+DEF_HELPER_4(advsimd_muladdh, f16, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4ad470d9e8..142b23abb5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10757,7 +10757,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         TCGV_UNUSED_PTR(fpst);
     }
 
-    if (size == 3) {
+    if (size == MO_64) {
         TCGv_i64 tcg_idx = tcg_temp_new_i64();
         int pass;
 
@@ -10802,11 +10802,12 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
 
         tcg_temp_free_i64(tcg_idx);
     } else if (!is_long) {
-        /* 32 bit floating point, or 16 or 32 bit integer.
+        /* 16 or 32 bit floating point, or 16 or 32 bit integer.
          * For the 16 bit scalar case we use the usual Neon helpers and
          * rely on the fact that 0 op 0 == 0 with no side effects.
          */
         TCGv_i32 tcg_idx = tcg_temp_new_i32();
+        bool hp = (size == MO_16 ? true : false);
         int pass, maxpasses;
 
         if (is_scalar) {
@@ -10829,7 +10830,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             TCGv_i32 tcg_op = tcg_temp_new_i32();
             TCGv_i32 tcg_res = tcg_temp_new_i32();
 
-            read_vec_element_i32(s, tcg_op, rn, pass, is_scalar ? size : MO_32);
+            read_vec_element_i32(s, tcg_op, rn, pass, size);
 
             switch (opcode) {
             case 0x0: /* MLA */
@@ -10861,8 +10862,14 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 gen_helper_vfp_negs(tcg_op, tcg_op);
                 /* fall through */
             case 0x1: /* FMLA */
-                read_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-                gen_helper_vfp_muladds(tcg_res, tcg_op, tcg_idx, tcg_res, fpst);
+                read_vec_element_i32(s, tcg_res, rd, pass, size);
+                if (hp) {
+                    gen_helper_advsimd_muladdh(tcg_res, tcg_op,
+                                               tcg_idx, tcg_res, fpst);
+                } else {
+                    gen_helper_vfp_muladds(tcg_res, tcg_op,
+                                           tcg_idx, tcg_res, fpst);
+                }
                 break;
             case 0x9: /* FMUL, FMULX */
                 switch (size) {
@@ -10909,7 +10916,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             if (is_scalar) {
                 write_fp_sreg(s, rd, tcg_res);
             } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_res, rd, pass, size);
             }
 
             tcg_temp_free_i32(tcg_op);
-- 
2.14.1
