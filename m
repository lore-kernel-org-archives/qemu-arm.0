Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i4sm465815wmf.3.2018.02.08.09.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 9F86A3E0CCF;
	Thu,  8 Feb 2018 17:31:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/32] arm/translate-a64: add FP16 FMULA/X/S to simd_three_reg_same_fp16
Date: Thu,  8 Feb 2018 17:31:37 +0000
Message-Id: <20180208173157.24705-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6WkdO9QVawTQ

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    | 24 ++++++++++++++++++++++++
 target/arm/helper-a64.h    |  2 ++
 target/arm/translate-a64.c | 15 +++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 78eeda31d1..bdfcac111f 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -600,6 +600,30 @@ ADVSIMD_HALFOP(max)
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
index e701644ae7..7900299efd 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -57,6 +57,8 @@ DEF_HELPER_3(advsimd_maxh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minnumh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_mulxh, f16, f16, f16, ptr)
+DEF_HELPER_4(advsimd_muladdh, f16, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 14572f26e1..3eec52eb34 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9852,9 +9852,17 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
@@ -9864,6 +9872,13 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
