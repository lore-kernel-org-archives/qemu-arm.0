Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 7sm2117551wmq.42.2018.02.23.07.42.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:42:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 57FBE3E0968;
	Fri, 23 Feb 2018 15:36:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 11/31] arm/translate-a64: add FP16 FMULA/X/S to simd_three_reg_same_fp16
Date: Fri, 23 Feb 2018 15:36:16 +0000
Message-Id: <20180223153636.29809-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223153636.29809-1-alex.bennee@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1QlLntI3HPLt

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c    | 24 ++++++++++++++++++++++++
 target/arm/helper-a64.h    |  2 ++
 target/arm/translate-a64.c | 15 +++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index d0b284fec4..1ef13abd76 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -595,6 +595,30 @@ ADVSIMD_HALFOP(max)
 ADVSIMD_HALFOP(minnum)
 ADVSIMD_HALFOP(maxnum)
 
+/* Data processing - scalar floating-point and advanced SIMD */
+float16 HELPER(advsimd_mulxh)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+
+    a = float16_squash_input_denormal(a, fpst);
+    b = float16_squash_input_denormal(b, fpst);
+
+    if ((float16_is_zero(a) && float16_is_infinity(b)) ||
+        (float16_is_infinity(a) && float16_is_zero(b))) {
+        /* 2.0 with the sign bit set to sign(A) XOR sign(B) */
+        return make_float16((1U << 14) |
+                            ((float16_val(a) ^ float16_val(b)) & (1U << 15)));
+    }
+    return float16_mul(a, b, fpst);
+}
+
+/* fused multiply-accumulate */
+float16 HELPER(advsimd_muladdh)(float16 a, float16 b, float16 c, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    return float16_muladd(a, b, c, 0, fpst);
+}
+
 /*
  * Floating point comparisons produce an integer result. Softfloat
  * routines return float_relation types which we convert to the 0/-1
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 1cf40bda5e..9c1a95594c 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -61,3 +61,5 @@ DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
+DEF_HELPER_3(advsimd_mulxh, f16, f16, f16, ptr)
+DEF_HELPER_4(advsimd_muladdh, f16, f16, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index fb74dc1c45..0e2d298687 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10286,9 +10286,17 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         case 0x0: /* FMAXNM */
             gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
+        case 0x1: /* FMLA */
+            read_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+            gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,
+                                       fpst);
+            break;
         case 0x2: /* FADD */
             gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
+        case 0x3: /* FMULX */
+            gen_helper_advsimd_mulxh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
         case 0x4: /* FCMEQ */
             gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
@@ -10298,6 +10306,13 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         case 0x8: /* FMINNM */
             gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
+        case 0x9: /* FMLS */
+             /* As usual for ARM, separate negation for fused multiply-add */
+            tcg_gen_xori_i32(tcg_op1, tcg_op1, 0x8000);
+            read_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+            gen_helper_advsimd_muladdh(tcg_res, tcg_op1, tcg_op2, tcg_res,
+                                       fpst);
+            break;
         case 0xa: /* FSUB */
             gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
-- 
2.15.1
