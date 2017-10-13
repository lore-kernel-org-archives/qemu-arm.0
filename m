Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b190sm1223429wma.41.2017.10.13.09.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:32:12 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 9E6DC3E151E;
	Fri, 13 Oct 2017 17:24:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 30/30] target/arm/translate-a64.c: add FP16 FCVTPS to 2 reg misc
Date: Fri, 13 Oct 2017 17:24:38 +0100
Message-Id: <20171013162438.32458-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GmYFAlpMXs3b

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    | 20 ++++++++++++++++++++
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.c |  7 +++++++
 3 files changed, 28 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 63b2bbd4b2..1cc2758eac 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -639,3 +639,23 @@ uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
     float16 f1 = float16_abs(b);
     return -float16_lt(f1, f0, fpst);
 }
+
+/*
+ * Half-precision floating point conversion functions
+ *
+ * There are a multitude of conversion functions with various
+ * different rounding modes. This is dealt with by the calling code
+ * setting the mode appropriately before calling the helper.
+ */
+
+uint32_t HELPER(advsimd_f16tosinth)(float16 a, void *fpstp)
+{
+    float_status *fpst = fpstp;
+
+    /* Invalid if we are passed a NaN */
+    if (float16_is_any_nan(a)) {
+        float_raise(float_flag_invalid, fpst);
+        return 0;
+    }
+    return float16_to_int16(a, fpst);
+}
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ce36d81091..73a985d1a4 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -60,3 +60,4 @@ DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
 DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
 DEF_HELPER_2(advsimd_rinth, f16, f16, ptr)
+DEF_HELPER_2(advsimd_f16tosinth, i32, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bbc0d96f01..ac71911a1a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10620,6 +10620,10 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         need_rmode = true;
         rmode = FPROUNDING_POSINF;
         break;
+    case 0x2a: /* FCVTPS */
+        need_rmode = true;
+        rmode = FPROUNDING_POSINF;
+        break;
     default:
         fprintf(stderr,"%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
         g_assert_not_reached();
@@ -10647,6 +10651,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         read_vec_element_i32(s, tcg_op, rn, pass, MO_16);
 
         switch (fpop) {
+        case 0x2a: /* FCVTPS */
+            gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
+            break;
         case 0x28: /* FRINTP */
             gen_helper_advsimd_rinth(tcg_res, tcg_op, tcg_fpstatus);
             break;
-- 
2.14.1
