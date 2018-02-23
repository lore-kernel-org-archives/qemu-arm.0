Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 59sm2515666wro.6.2018.02.23.07.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:42:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 90A353E0B56;
	Fri, 23 Feb 2018 15:36:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/31] arm/translate-a64: add FP16 FMULX/MLS/FMLA to simd_indexed
Date: Fri, 23 Feb 2018 15:36:19 +0000
Message-Id: <20180223153636.29809-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223153636.29809-1-alex.bennee@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Yi+NX/NqO5L9

The helpers use the new re-factored muladd support in SoftFloat for
the float16 work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - re-jigged switch statement to fall-through for unalloc
  - added is_fp16 bool for fpst
  - fixed up some long lines
---
 target/arm/translate-a64.c | 83 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 67 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e96e6cdd15..43bff5cd09 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11198,6 +11198,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     int rd = extract32(insn, 0, 5);
     bool is_long = false;
     bool is_fp = false;
+    bool is_fp16 = false;
     int index;
     TCGv_ptr fpst;
 
@@ -11244,7 +11245,8 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
         }
         /* fall through */
     case 0x9: /* FMUL, FMULX */
-        if (!extract32(size, 1, 1)) {
+        if (size == 1 ||
+            (size < 2 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
             unallocated_encoding(s);
             return;
         }
@@ -11256,18 +11258,34 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     if (is_fp) {
-        /* low bit of size indicates single/double */
-        size = extract32(size, 0, 1) ? 3 : 2;
-        if (size == 2) {
+        /* convert insn encoded size to TCGMemOp size */
+        switch (size) {
+        case 2: /* single precision */
+            size = MO_32;
             index = h << 1 | l;
-        } else {
+            rm |= (m << 4);
+            break;
+        case 3: /* double precision */
+            size = MO_64;
             if (l || !is_q) {
                 unallocated_encoding(s);
                 return;
             }
             index = h;
+            rm |= (m << 4);
+            break;
+        case 0: /* half precision */
+            size = MO_16;
+            index = h << 2 | l << 1 | m;
+            is_fp16 = true;
+            if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+                break;
+            }
+            /* fallthru */
+        default: /* unallocated */
+            unallocated_encoding(s);
+            return;
         }
-        rm |= (m << 4);
     } else {
         switch (size) {
         case 1:
@@ -11288,7 +11306,7 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
     }
 
     if (is_fp) {
-        fpst = get_fpstatus_ptr(false);
+        fpst = get_fpstatus_ptr(is_fp16);
     } else {
         fpst = NULL;
     }
@@ -11390,18 +11408,51 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
                 break;
             }
             case 0x5: /* FMLS */
-                /* As usual for ARM, separate negation for fused multiply-add */
-                gen_helper_vfp_negs(tcg_op, tcg_op);
-                /* fall through */
             case 0x1: /* FMLA */
-                read_vec_element_i32(s, tcg_res, rd, pass, MO_32);
-                gen_helper_vfp_muladds(tcg_res, tcg_op, tcg_idx, tcg_res, fpst);
+                read_vec_element_i32(s, tcg_res, rd, pass,
+                                     is_scalar ? size : MO_32);
+                switch (size) {
+                case 1:
+                    if (opcode == 0x5) {
+                        /* As usual for ARM, separate negation for fused
+                         * multiply-add */
+                        tcg_gen_xori_i32(tcg_op, tcg_op, 0x80008000);
+                    }
+                    gen_helper_advsimd_muladdh(tcg_res, tcg_op, tcg_idx,
+                                               tcg_res, fpst);
+                    break;
+                case 2:
+                    if (opcode == 0x5) {
+                        /* As usual for ARM, separate negation for
+                         * fused multiply-add */
+                        tcg_gen_xori_i32(tcg_op, tcg_op, 0x80000000);
+                    }
+                    gen_helper_vfp_muladds(tcg_res, tcg_op, tcg_idx,
+                                           tcg_res, fpst);
+                    break;
+                default:
+                    g_assert_not_reached();
+                }
                 break;
             case 0x9: /* FMUL, FMULX */
-                if (u) {
-                    gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
-                } else {
-                    gen_helper_vfp_muls(tcg_res, tcg_op, tcg_idx, fpst);
+                switch (size) {
+                case 1:
+                    if (u) {
+                        gen_helper_advsimd_mulxh(tcg_res, tcg_op, tcg_idx,
+                                                 fpst);
+                    } else {
+                        g_assert_not_reached();
+                    }
+                    break;
+                case 2:
+                    if (u) {
+                        gen_helper_vfp_mulxs(tcg_res, tcg_op, tcg_idx, fpst);
+                    } else {
+                        gen_helper_vfp_muls(tcg_res, tcg_op, tcg_idx, fpst);
+                    }
+                    break;
+                default:
+                    g_assert_not_reached();
                 }
                 break;
             case 0xc: /* SQDMULH */
-- 
2.15.1
