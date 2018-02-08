Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d63sm461769wmd.9.2018.02.08.09.40.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:25 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F0DE23E0FCB;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 30/32] arm/translate-a64: add all FP16 ops in simd_scalar_pairwise
Date: Thu,  8 Feb 2018 17:31:55 +0000
Message-Id: <20180208173157.24705-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Sr64F480R4W2

I only needed to do a little light re-factoring to support the
half-precision helpers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 80 +++++++++++++++++++++++++++++++---------------
 1 file changed, 54 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b209f57d55..b094399fb4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -6371,24 +6371,30 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
     case 0xf: /* FMAXP */
     case 0x2c: /* FMINNMP */
     case 0x2f: /* FMINP */
-        /* FP op, size[0] is 32 or 64 bit */
+        /* FP op, size[0] is 32 or 64 bit*/
         if (!u) {
-            unallocated_encoding(s);
-            return;
+            if (!arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+                unallocated_encoding(s);
+                return;
+            } else {
+                size = MO_16;
+            }
+        } else {
+            size = extract32(size, 0, 1) ? MO_64 : MO_32;
         }
+
         if (!fp_access_check(s)) {
             return;
         }
 
-        size = extract32(size, 0, 1) ? 3 : 2;
-        fpst = get_fpstatus_ptr(false);
+        fpst = get_fpstatus_ptr(size == MO_16);
         break;
     default:
         unallocated_encoding(s);
         return;
     }
 
-    if (size == 3) {
+    if (size == MO_64) {
         TCGv_i64 tcg_op1 = tcg_temp_new_i64();
         TCGv_i64 tcg_op2 = tcg_temp_new_i64();
         TCGv_i64 tcg_res = tcg_temp_new_i64();
@@ -6429,27 +6435,49 @@ static void disas_simd_scalar_pairwise(DisasContext *s, uint32_t insn)
         TCGv_i32 tcg_op2 = tcg_temp_new_i32();
         TCGv_i32 tcg_res = tcg_temp_new_i32();
 
-        read_vec_element_i32(s, tcg_op1, rn, 0, MO_32);
-        read_vec_element_i32(s, tcg_op2, rn, 1, MO_32);
+        read_vec_element_i32(s, tcg_op1, rn, 0, size);
+        read_vec_element_i32(s, tcg_op2, rn, 1, size);
 
-        switch (opcode) {
-        case 0xc: /* FMAXNMP */
-            gen_helper_vfp_maxnums(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0xd: /* FADDP */
-            gen_helper_vfp_adds(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0xf: /* FMAXP */
-            gen_helper_vfp_maxs(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0x2c: /* FMINNMP */
-            gen_helper_vfp_minnums(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        case 0x2f: /* FMINP */
-            gen_helper_vfp_mins(tcg_res, tcg_op1, tcg_op2, fpst);
-            break;
-        default:
-            g_assert_not_reached();
+        if (size == MO_16) {
+            switch (opcode) {
+            case 0xc: /* FMAXNMP */
+                gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0xd: /* FADDP */
+                gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0xf: /* FMAXP */
+                gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0x2c: /* FMINNMP */
+                gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0x2f: /* FMINP */
+                gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        } else {
+            switch (opcode) {
+            case 0xc: /* FMAXNMP */
+                gen_helper_vfp_maxnums(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0xd: /* FADDP */
+                gen_helper_vfp_adds(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0xf: /* FMAXP */
+                gen_helper_vfp_maxs(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0x2c: /* FMINNMP */
+                gen_helper_vfp_minnums(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            case 0x2f: /* FMINP */
+                gen_helper_vfp_mins(tcg_res, tcg_op1, tcg_op2, fpst);
+                break;
+            default:
+                g_assert_not_reached();
+            }
         }
 
         write_fp_sreg(s, rd, tcg_res);
-- 
2.15.1
