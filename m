Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i33sm505044wri.70.2018.02.08.09.40.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:33 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 984833E0EE2;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 25/32] arm/translate-a64: add FP16 FRCPX to simd_two_reg_misc_fp16
Date: Thu,  8 Feb 2018 17:31:50 +0000
Message-Id: <20180208173157.24705-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fK+4uQ8EnCDu

We go with the localised helper.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    | 29 +++++++++++++++++++++++++++++
 target/arm/helper-a64.h    |  1 +
 target/arm/translate-a64.c |  4 ++++
 3 files changed, 34 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 76f3289e37..38cdc13b3e 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -356,6 +356,35 @@ uint64_t HELPER(neon_addlp_u16)(uint64_t a)
 }
 
 /* Floating-point reciprocal exponent - see FPRecpX in ARM ARM */
+float16 HELPER(frecpx_f16)(float16 a, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    uint16_t val16, sbit;
+    int16_t exp;
+
+    if (float16_is_any_nan(a)) {
+        float16 nan = a;
+        if (float16_is_signaling_nan(a, fpst)) {
+            float_raise(float_flag_invalid, fpst);
+            nan = float16_maybe_silence_nan(a, fpst);
+        }
+        if (fpst->default_nan_mode) {
+            nan = float16_default_nan(fpst);
+        }
+        return nan;
+    }
+
+    val16 = float16_val(a);
+    sbit = 0x8000 & val16;
+    exp = extract32(val16, 10, 5);
+
+    if (exp == 0) {
+        return make_float16(deposit32(sbit, 10, 5, 0x1e));
+    } else {
+        return make_float16(deposit32(sbit, 10, 5, ~exp));
+    }
+}
+
 float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
 {
     float_status *fpst = fpstp;
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 453753f4e7..d8a55142b5 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -41,6 +41,7 @@ DEF_HELPER_FLAGS_1(neon_addlp_s16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(neon_addlp_u16, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_2(frecpx_f64, TCG_CALL_NO_RWG, f64, f64, ptr)
 DEF_HELPER_FLAGS_2(frecpx_f32, TCG_CALL_NO_RWG, f32, f32, ptr)
+DEF_HELPER_FLAGS_2(frecpx_f16, TCG_CALL_NO_RWG, f16, f16, ptr)
 DEF_HELPER_FLAGS_2(fcvtx_f64_to_f32, TCG_CALL_NO_RWG, f32, f64, env)
 DEF_HELPER_FLAGS_3(crc32_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
 DEF_HELPER_FLAGS_3(crc32c_64, TCG_CALL_NO_RWG_SE, i64, i64, i64, i32)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4ad5e97f56..b6cd4dd8f2 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10849,6 +10849,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         return;
         break;
     case 0x3d: /* FRECPE */
+    case 0x3f: /* FRECPX */
         break;
     case 0x18: /* FRINTN */
         need_rmode = true;
@@ -10973,6 +10974,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x3d: /* FRECPE */
             gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
             break;
+        case 0x3f: /* FRECPX */
+            gen_helper_frecpx_f16(tcg_res, tcg_op, tcg_fpstatus);
+            break;
         case 0x5a: /* FCVTNU */
         case 0x5b: /* FCVTMU */
         case 0x5c: /* FCVTAU */
-- 
2.15.1
