Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l92sm558454wrc.31.2018.02.08.09.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:25 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 17F7E3E0D2C;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 18/32] arm/translate-a64: add FP16 FPRINTx to simd_two_reg_misc_fp16
Date: Thu,  8 Feb 2018 17:31:43 +0000
Message-Id: <20180208173157.24705-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DzBtxhQf2FAO

This adds the full range of half-precision floating point to integral
instructions.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    |  22 ++++++++
 target/arm/helper-a64.h    |   2 +
 target/arm/translate-a64.c | 136 +++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 148 insertions(+), 12 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 8f0f59ea31..919b073635 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -750,3 +750,25 @@ uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
     int compare = float16_compare(f0, f1, fpst);
     return ADVSIMD_CMPRES(compare == float_relation_greater);
 }
+
+/* round to integral */
+float16 HELPER(advsimd_rinth_exact)(float16 x, void *fp_status)
+{
+    return float16_round_to_int(x, fp_status);
+}
+
+float16 HELPER(advsimd_rinth)(float16 x, void *fp_status)
+{
+    int old_flags = get_float_exception_flags(fp_status), new_flags;
+    float16 ret;
+
+    ret = float16_round_to_int(x, fp_status);
+
+    /* Suppress any inexact exceptions the conversion produced */
+    if (!(old_flags & float_flag_inexact)) {
+        new_flags = get_float_exception_flags(fp_status);
+        set_float_exception_flags(new_flags & ~float_flag_inexact, fp_status);
+    }
+
+    return ret;
+}
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index d2dd46d07b..b583bc0dd8 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -76,3 +76,5 @@ DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
+DEF_HELPER_2(advsimd_rinth_exact, f16, f16, ptr)
+DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f939ca4d40..a0506f094f 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10727,40 +10727,152 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
 /* AdvSIMD [scalar] two register miscellaneous (FP16)
  *
  *   31  30  29 28  27     24  23 22 21       17 16    12 11 10 9    5 4    0
- * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
+ * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
  * | 0 | Q | U | S | 1 1 1 0 | a | 1 1 1 1 0 0 | opcode | 1 0 |  Rn  |  Rd  |
- * +---+---+---+---+--------+---+-------------+--------+-----+------+------+
+ * +---+---+---+---+---------+---+-------------+--------+-----+------+------+
  *   mask: 1000 1111 0111 1110 0000 1100 0000 0000 0x8f7e 0c00
  *   val:  0000 1110 0111 1000 0000 1000 0000 0000 0x0e78 0800
  *
- * ???While the group is listed with bit 28 always set to 1 this is not
- * always the case.????
- *
- * This actually covers two groups,
+ * This actually covers two groups where scalar access is governed by
+ * bit 28. A bunch of the instructions (float to integral) only exist
+ * in the vector form and are un-allocated for the scalar decode. Also
+ * in the scalar decode Q is always 1.
  */
 static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
 {
-    int fpop, opcode, a;
+    int fpop, opcode, a, u;
+    int rn, rd;
+    bool is_q;
+    bool is_scalar;
+    bool only_in_vector = false;
+
+    int pass;
+    TCGv_i32 tcg_rmode = NULL;
+    TCGv_ptr tcg_fpstatus = NULL;
+    bool need_rmode = false;
+    int rmode;
 
     if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
         unallocated_encoding(s);
         return;
     }
 
-    if (!fp_access_check(s)) {
-        return;
-    }
-
-    opcode = extract32(insn, 12, 4);
+    opcode = extract32(insn, 12, 5);
     a = extract32(insn, 23, 1);
+    u = extract32(insn, 29, 1);
+    is_scalar = extract32(insn, 28, 1);
+    is_q = extract32(insn, 30, 1);
+
     fpop = deposit32(opcode, 5, 1, a);
+    fpop = deposit32(fpop, 6, 1, u);
 
     switch (fpop) {
+    case 0x18: /* FRINTN */
+        need_rmode = true;
+        only_in_vector = true;
+        rmode = FPROUNDING_TIEEVEN;
+        break;
+    case 0x19: /* FRINTM */
+        need_rmode = true;
+        only_in_vector = true;
+        rmode = FPROUNDING_NEGINF;
+        break;
+    case 0x38: /* FRINTP */
+        need_rmode = true;
+        only_in_vector = true;
+        rmode = FPROUNDING_POSINF;
+        break;
+    case 0x39: /* FRINTZ */
+        need_rmode = true;
+        only_in_vector = true;
+        rmode = FPROUNDING_ZERO;
+        break;
+    case 0x58: /* FRINTA */
+        need_rmode = true;
+        only_in_vector = true;
+        rmode = FPROUNDING_TIEAWAY;
+        break;
+    case 0x59: /* FRINTX */
+    case 0x79: /* FRINTI */
+        only_in_vector = true;
+        /* current rounding mode */
+        break;
     default:
         fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
         g_assert_not_reached();
     }
 
+
+    /* Check additional constraints for the scalar encoding */
+    if (is_scalar) {
+        if (!is_q) {
+            unallocated_encoding(s);
+            return;
+        }
+        /* FRINTxx is only in the vector form */
+        if (only_in_vector && is_scalar) {
+            unallocated_encoding(s);
+            return;
+        }
+    }
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    if (need_fpst || need_rmode) {
+        tcg_fpstatus = get_fpstatus_ptr(true);
+    }
+
+    if (need_rmode) {
+        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
+        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+    }
+
+    if (is_scalar) {
+        /* no operations yet */
+    } else {
+        for (pass = 0; pass < (is_q ? 8 : 4); pass++) {
+            TCGv_i32 tcg_op = tcg_temp_new_i32();
+            TCGv_i32 tcg_res = tcg_temp_new_i32();
+
+            read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
+
+            switch (fpop) {
+            case 0x18: /* FRINTN */
+            case 0x19: /* FRINTM */
+            case 0x38: /* FRINTP */
+            case 0x39: /* FRINTZ */
+            case 0x58: /* FRINTA */
+            case 0x79: /* FRINTI */
+                gen_helper_advsimd_rinth(tcg_res, tcg_op, tcg_fpstatus);
+                break;
+            case 0x59: /* FRINTX */
+                gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, tcg_fpstatus);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
+            write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+
+            tcg_temp_free_i32(tcg_res);
+            tcg_temp_free_i32(tcg_op);
+        }
+
+        if (!is_q) {
+            clear_vec_high(s, rd);
+        }
+    }
+
+    if (tcg_rmode) {
+        gen_helper_set_rmode(tcg_rmode, tcg_rmode, tcg_fpstatus);
+        tcg_temp_free_i32(tcg_rmode);
+    }
+
+    if (tcg_fpstatus) {
+        tcg_temp_free_ptr(tcg_fpstatus);
+    }
 }
 
 /* AdvSIMD scalar x indexed element
-- 
2.15.1
