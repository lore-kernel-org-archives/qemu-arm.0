Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k45sm6749673wrk.45.2017.07.20.08.12.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:32 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 1EDD53E0BD4;
	Thu, 20 Jul 2017 16:04:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for 2.11 23/23] target/arm: implement half-precision F(MIN|MAX)(V|NMV)
Date: Thu, 20 Jul 2017 16:04:26 +0100
Message-Id: <20170720150426.12393-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: jlz8VRPUw0lt

This implements the half-precision variants of the across vector
reduction operations. This involves a re-factor of the reduction code
which more closely matches the ARM ARM order (and handles 8 element
reductions).

As SoftFloat3c doesn't support the operations we need we use the
expanded support from 2a. To keep things neat we put them in another
helper file - advsimd_2a_helper.c.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/Makefile.objs       |   2 +-
 target/arm/advsimd_2a_helper.c |  34 ++++++++++
 target/arm/helper-a64.h        |   5 ++
 target/arm/translate-a64.c     | 147 ++++++++++++++++++++++++++---------------
 4 files changed, 133 insertions(+), 55 deletions(-)
 create mode 100644 target/arm/advsimd_2a_helper.c

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index d4e81b13f0..2f8cf3d93a 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -6,7 +6,7 @@ obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
 obj-y += translate.o op_helper.o helper.o cpu.o
 obj-y += neon_helper.o iwmmxt_helper.o
-obj-$(TARGET_AARCH64) += advsimd_helper.o
+obj-$(TARGET_AARCH64) += advsimd_helper.o advsimd_2a_helper.o
 obj-y += gdbstub.o
 obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
 obj-y += crypto_helper.o
diff --git a/target/arm/advsimd_2a_helper.c b/target/arm/advsimd_2a_helper.c
new file mode 100644
index 0000000000..9afe16432d
--- /dev/null
+++ b/target/arm/advsimd_2a_helper.c
@@ -0,0 +1,34 @@
+/*
+ * ARM AdvancedSIMD helper functions
+ *
+ * Copyright (c) 2017 Linaro.
+ * Author: Alex Bennée <alex.bennee@linaro.org>
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * This code is specifically for AdvancedSIMD helpers rather than
+ * shared NEON helpers which are re-purposed for ARMv8. In practice
+ * these are helpers for newer features not found in older ARMs,
+ * currently half-precision float support.
+ *
+ * These particular helpers use the existing SoftFloat2a code
+ */
+#include "qemu/osdep.h"
+
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+
+#define ADVSIMD_HELPER(name, suffix) HELPER(glue(glue(advsimd_, name), suffix))
+
+#define ADVSIMD_HALFOP(name) \
+float16 ADVSIMD_HELPER(name, h)(float16 a, float16 b, void *fpstp) \
+{ \
+    float_status *fpst = fpstp; \
+    return float16_ ## name(a, b, fpst);    \
+}
+
+ADVSIMD_HALFOP(min)
+ADVSIMD_HALFOP(max)
+ADVSIMD_HALFOP(minnum)
+ADVSIMD_HALFOP(maxnum)
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index f4992e7b36..e99562c684 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -46,5 +46,10 @@ DEF_HELPER_FLAGS_4(paired_cmpxchg64_le, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 
 /* helper_advsimd.c */
+DEF_HELPER_3(advsimd_maxh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_minnumh, f16, f16, f16, ptr)
+
 DEF_HELPER_3(advsimd_acgt_f16, i32, i32, i32, ptr)
 DEF_HELPER_3(advsimd_addh, f32, f32, f32, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c3f6080ce4..8c41f0e510 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5659,26 +5659,80 @@ static void disas_simd_zip_trn(DisasContext *s, uint32_t insn)
     tcg_temp_free_i64(tcg_resh);
 }
 
-static void do_minmaxop(DisasContext *s, TCGv_i32 tcg_elt1, TCGv_i32 tcg_elt2,
-                        int opc, bool is_min, TCGv_ptr fpst)
-{
-    /* Helper function for disas_simd_across_lanes: do a single precision
-     * min/max operation on the specified two inputs,
-     * and return the result in tcg_elt1.
-     */
-    if (opc == 0xc) {
-        if (is_min) {
-            gen_helper_vfp_minnums(tcg_elt1, tcg_elt1, tcg_elt2, fpst);
-        } else {
-            gen_helper_vfp_maxnums(tcg_elt1, tcg_elt1, tcg_elt2, fpst);
-        }
+/*
+ * do_reduction_op helper
+ *
+ * This mirrors the Reduce() pseudocode in the ARM ARM. It is
+ * important for correct NaN propagation that we do these
+ * operations in exactly the order specified by the pseudocode.
+ *
+ * This is a recursive function, TCG temps should be freed by the
+ * calling function once it is done with the values.
+ */
+static TCGv_i32 do_reduction_op(DisasContext *s, int fpopcode, int rn,
+                                int esize, int size, int vmap, TCGv_ptr fpst)
+{
+    if (esize == size) {
+        int element;
+        TCGMemOp msize = esize == 16 ? MO_16 : MO_32;
+        TCGv_i32 tcg_elem;
+
+        /* We should have one register left here */
+        assert(ctpop8(vmap) == 1);
+        element = ctz32(vmap);
+        assert(element < 8);
+
+        tcg_elem = tcg_temp_new_i32();
+        read_vec_element_i32(s, tcg_elem, rn, element, msize);
+        return tcg_elem;
     } else {
-        assert(opc == 0xf);
-        if (is_min) {
-            gen_helper_vfp_mins(tcg_elt1, tcg_elt1, tcg_elt2, fpst);
-        } else {
-            gen_helper_vfp_maxs(tcg_elt1, tcg_elt1, tcg_elt2, fpst);
+        int bits = size / 2;
+        int shift = ctpop8(vmap) / 2;
+        int vmap_lo = (vmap >> shift) & vmap;
+        int vmap_hi = (vmap & ~vmap_lo);
+        TCGv_i32 tcg_hi, tcg_lo, tcg_res;
+
+        tcg_hi = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_hi, fpst);
+        tcg_lo = do_reduction_op(s, fpopcode, rn, esize, bits, vmap_lo, fpst);
+        tcg_res = tcg_temp_new_i32();
+
+        /* base fpopcode = 0x0c NMV, 0x0f V
+                           0x10 MIN, 0x00 MAX
+                           0x20 F32, 0x00 FP16
+         */
+        switch(fpopcode) {
+        case 0x0c: /* fmaxnmv half-precision */
+            gen_helper_advsimd_maxnumh(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x0f: /* fmaxv half-precision */
+            gen_helper_advsimd_maxh(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x1c: /* fminnmv half-precision */
+            gen_helper_advsimd_minnumh(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x1f: /* fminv half-precision */
+            gen_helper_advsimd_minh(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x2c: /* fmaxnmv */
+            gen_helper_vfp_maxnums(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x2f: /* fmaxv */
+            gen_helper_vfp_maxs(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x3c: /* fminnmv */
+            gen_helper_vfp_minnums(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        case 0x3f: /* fminv */
+            gen_helper_vfp_mins(tcg_res, tcg_lo, tcg_hi, fpst);
+            break;
+        default:
+            fprintf(stderr, "%s: fpopcode %x not handled\n", __func__, fpopcode);
+            break;
         }
+
+        tcg_temp_free_i32(tcg_hi);
+        tcg_temp_free_i32(tcg_lo);
+        return tcg_res;
     }
 }
 
@@ -5720,16 +5774,21 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
         break;
     case 0xc: /* FMAXNMV, FMINNMV */
     case 0xf: /* FMAXV, FMINV */
-        if (!is_u || !is_q || extract32(size, 0, 1)) {
-            unallocated_encoding(s);
-            return;
-        }
-        /* Bit 1 of size field encodes min vs max, and actual size is always
-         * 32 bits: adjust the size variable so following code can rely on it
+        /* Bit 1 of size field encodes min vs max and the actual size
+         * depends on the encoding of the U bit. If not set (and FP16
+         * enabled) then we do half-precision float instead of single
+         * precision.
          */
         is_min = extract32(size, 1, 1);
         is_fp = true;
-        size = 2;
+        if (!is_u && arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            size = 1;
+        } else if (!is_u || !is_q || extract32(size, 0, 1)) {
+            unallocated_encoding(s);
+            return;
+        } else {
+            size = 2;
+        }
         break;
     default:
         unallocated_encoding(s);
@@ -5786,38 +5845,18 @@ static void disas_simd_across_lanes(DisasContext *s, uint32_t insn)
 
         }
     } else {
-        /* Floating point ops which work on 32 bit (single) intermediates.
+        /* Floating point vector reduction ops which work across 32
+         * bit (single) or 16 bit (half-precision) intermediates.
          * Note that correct NaN propagation requires that we do these
          * operations in exactly the order specified by the pseudocode.
          */
-        TCGv_i32 tcg_elt1 = tcg_temp_new_i32();
-        TCGv_i32 tcg_elt2 = tcg_temp_new_i32();
-        TCGv_i32 tcg_elt3 = tcg_temp_new_i32();
         TCGv_ptr fpst = get_fpstatus_ptr();
-
-        assert(esize == 32);
-        assert(elements == 4);
-
-        read_vec_element(s, tcg_elt, rn, 0, MO_32);
-        tcg_gen_extrl_i64_i32(tcg_elt1, tcg_elt);
-        read_vec_element(s, tcg_elt, rn, 1, MO_32);
-        tcg_gen_extrl_i64_i32(tcg_elt2, tcg_elt);
-
-        do_minmaxop(s, tcg_elt1, tcg_elt2, opcode, is_min, fpst);
-
-        read_vec_element(s, tcg_elt, rn, 2, MO_32);
-        tcg_gen_extrl_i64_i32(tcg_elt2, tcg_elt);
-        read_vec_element(s, tcg_elt, rn, 3, MO_32);
-        tcg_gen_extrl_i64_i32(tcg_elt3, tcg_elt);
-
-        do_minmaxop(s, tcg_elt2, tcg_elt3, opcode, is_min, fpst);
-
-        do_minmaxop(s, tcg_elt1, tcg_elt2, opcode, is_min, fpst);
-
-        tcg_gen_extu_i32_i64(tcg_res, tcg_elt1);
-        tcg_temp_free_i32(tcg_elt1);
-        tcg_temp_free_i32(tcg_elt2);
-        tcg_temp_free_i32(tcg_elt3);
+        int fpopcode = opcode | is_min << 4 | is_u << 5;
+        int vmap = (1 << elements) - 1;
+        TCGv_i32 tcg_res32 = do_reduction_op(s, fpopcode, rn, esize,
+                                             (is_q ? 128 : 64), vmap, fpst);
+        tcg_gen_extu_i32_i64(tcg_res, tcg_res32);
+        tcg_temp_free_i32(tcg_res32);
         tcg_temp_free_ptr(fpst);
     }
 
@@ -5939,7 +5978,7 @@ static void handle_simd_dupg(DisasContext *s, int is_q, int rd, int rn,
 {
     int size = ctz32(imm5);
     int esize = 8 << size;
-    int elements = (is_q ? 128 : 64)/esize;
+    int elements = (is_q ? 128 : 64) / esize;
     int i = 0;
 
     if (size > 3 || ((size == 3) && !is_q)) {
-- 
2.13.0
