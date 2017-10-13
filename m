Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b190sm1223308wma.41.2017.10.13.09.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:32:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 680593E1115;
	Fri, 13 Oct 2017 17:24:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 27/30] target/arm/translate-a64.c: add FP16 FRINTP to 2 reg misc
Date: Fri, 13 Oct 2017 17:24:35 +0100
Message-Id: <20171013162438.32458-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MfoD0wSprj79

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    | 17 ++++++++++++++
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 241fee9d93..63b2bbd4b2 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -585,6 +585,23 @@ float16 HELPER(advsimd_muladdh)(float16 a, float16 b, float16 c, void *fpstp)
     return float16_muladd(a, b, c, 0, fpst);
 }
 
+/* round to integral */
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
+
 /*
  * Floating point comparisons produce an integer result.
  * Softfloat routines return 0/1, which we convert to the 0/-1 Neon requires.
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 444d046500..ce36d81091 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -59,3 +59,4 @@ DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
+DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 142b23abb5..bbc0d96f01 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10588,6 +10588,12 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
 {
     int fpop, opcode, a;
     int rn, rd;
+    int is_q;
+    int pass;
+    TCGv_i32 tcg_rmode;
+    TCGv_ptr tcg_fpstatus;
+    bool need_rmode = false;
+    int rmode;
 
     if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
         unallocated_encoding(s);
@@ -10608,12 +10614,62 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x6c: /* FCMGE (zero) */
     case 0x6d: /* FCMLE (zero) */
         handle_2misc_fcmp_zero(s, fpop, true, 0, false, 1, rn, rd);
+        return;
+        break;
+    case 0x28: /* FRINTP */
+        need_rmode = true;
+        rmode = FPROUNDING_POSINF;
         break;
     default:
         fprintf(stderr,"%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
         g_assert_not_reached();
     }
 
+    is_q = extract32(insn, 30, 1);
+
+    if (!fp_access_check(s)) {
+        return;
+    }
+
+    tcg_fpstatus = get_fpstatus_ptr();
+
+    if (need_rmode) {
+        tcg_rmode = tcg_const_i32(arm_rmode_to_sf(rmode));
+        gen_helper_set_rmode(tcg_rmode, tcg_rmode, cpu_env);
+    } else {
+        TCGV_UNUSED_I32(tcg_rmode);
+    }
+
+    for (pass = 0; pass < (is_q ? 8 : 4); pass++) {
+        TCGv_i32 tcg_op = tcg_temp_new_i32();
+        TCGv_i32 tcg_res = tcg_temp_new_i32();
+
+        read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
+
+        switch (fpop) {
+        case 0x28: /* FRINTP */
+            gen_helper_advsimd_rinth(tcg_res, tcg_op, tcg_fpstatus);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        write_vec_element_i32(s, tcg_res, rd, pass, MO_16);
+
+        tcg_temp_free_i32(tcg_res);
+        tcg_temp_free_i32(tcg_op);
+    }
+
+    if (!is_q) {
+        clear_vec_high(s, rd);
+    }
+
+    if (need_rmode) {
+        gen_helper_set_rmode(tcg_rmode, tcg_rmode, cpu_env);
+        tcg_temp_free_i32(tcg_rmode);
+    }
+
+    tcg_temp_free_ptr(tcg_fpstatus);
 }
 
 /* AdvSIMD scalar x indexed element
-- 
2.14.1
