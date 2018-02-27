Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y34sm27892743wry.19.2018.02.27.06.48.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:48:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7D2053E1615;
	Tue, 27 Feb 2018 14:38:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 21/31] arm/translate-a64: add FP16 FNEG/FABS to simd_two_reg_misc_fp16
Date: Tue, 27 Feb 2018 14:38:42 +0000
Message-Id: <20180227143852.11175-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zvGw8r2yH6Wv

Neither of these operations alter the floating point status registers
so we can do a pure bitwise operation, either squashing any sign
bit (ABS) or inverting it (NEG).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v3
  - fixup re-base conflicts
  - make both operations pure bitwise TCG
---
 target/arm/translate-a64.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 6f33783a11..9f2c3682dc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11262,6 +11262,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     TCGv_i32 tcg_rmode = NULL;
     TCGv_ptr tcg_fpstatus = NULL;
     bool need_rmode = false;
+    bool need_fpst = true;
     int rmode;
 
     if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
@@ -11380,6 +11381,10 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         need_rmode = true;
         rmode = FPROUNDING_ZERO;
         break;
+    case 0x2f: /* FABS */
+    case 0x6f: /* FNEG */
+        need_fpst = false;
+        break;
     default:
         fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
         g_assert_not_reached();
@@ -11403,7 +11408,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         return;
     }
 
-    if (need_rmode) {
+    if (need_rmode || need_fpst) {
         tcg_fpstatus = get_fpstatus_ptr(true);
     }
 
@@ -11433,6 +11438,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x7b: /* FCVTZU */
             gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
             break;
+        case 0x6f: /* FNEG */
+            tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -11476,6 +11484,12 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x59: /* FRINTX */
                 gen_helper_advsimd_rinth_exact(tcg_res, tcg_op, tcg_fpstatus);
                 break;
+            case 0x2f: /* FABS */
+                tcg_gen_andi_i32(tcg_res, tcg_op, 0x7fff);
+                break;
+            case 0x6f: /* FNEG */
+                tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.15.1
