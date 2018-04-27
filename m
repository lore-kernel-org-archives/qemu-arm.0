Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a10-v6sm2515457wri.10.2018.04.27.12.19.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Apr 2018 12:19:20 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 516713E03EB;
	Fri, 27 Apr 2018 20:19:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH] arm/translate-a64: add FP16 FCMP operations
Date: Fri, 27 Apr 2018 20:19:16 +0100
Message-Id: <20180427191916.26637-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sXZ2Ru0zTqq+

These where missed out from the rest of the half-precision work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
---
 target/arm/helper-a64.c    | 10 +++++++
 target/arm/helper-a64.h    |  2 ++
 target/arm/translate-a64.c | 60 ++++++++++++++++++++++++++++++++------
 3 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index afb25ad20c..35df07adb9 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -85,6 +85,16 @@ static inline uint32_t float_rel_to_flags(int res)
     return flags;
 }
 
+uint64_t HELPER(vfp_cmph_a64)(float16 x, float16 y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare_quiet(x, y, fp_status));
+}
+
+uint64_t HELPER(vfp_cmpeh_a64)(float16 x, float16 y, void *fp_status)
+{
+    return float_rel_to_flags(float16_compare(x, y, fp_status));
+}
+
 uint64_t HELPER(vfp_cmps_a64)(float32 x, float32 y, void *fp_status)
 {
     return float_rel_to_flags(float32_compare_quiet(x, y, fp_status));
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index ef4ddfe9d8..5c0b9bd799 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -19,6 +19,8 @@
 DEF_HELPER_FLAGS_2(udiv64, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(sdiv64, TCG_CALL_NO_RWG_SE, s64, s64, s64)
 DEF_HELPER_FLAGS_1(rbit64, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_3(vfp_cmph_a64, i64, f16, f16, ptr)
+DEF_HELPER_3(vfp_cmpeh_a64, i64, f16, f16, ptr)
 DEF_HELPER_3(vfp_cmps_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpes_a64, i64, f32, f32, ptr)
 DEF_HELPER_3(vfp_cmpd_a64, i64, f64, f64, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c91329249d..d27f4f24d5 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -4461,16 +4461,27 @@ static void disas_data_proc_reg(DisasContext *s, uint32_t insn)
     }
 }
 
-static void handle_fp_compare(DisasContext *s, bool is_double,
+static void handle_fp_compare(DisasContext *s, int type,
                               unsigned int rn, unsigned int rm,
                               bool cmp_with_zero, bool signal_all_nans)
 {
-    TCGv_i64 tcg_flags = tcg_temp_new_i64();
-    TCGv_ptr fpst = get_fpstatus_ptr(false);
+    TCGv_i64 tcg_flags;
+    TCGv_ptr fpst;
 
-    if (is_double) {
+    if (type == 2 ||
+        (type == 3 && !arm_dc_feature(s, ARM_FEATURE_V8_FP16))) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    tcg_flags = tcg_temp_new_i64();
+
+    switch (type) {
+    case 1: /* double */
+    {
         TCGv_i64 tcg_vn, tcg_vm;
 
+        fpst = get_fpstatus_ptr(false);
         tcg_vn = read_fp_dreg(s, rn);
         if (cmp_with_zero) {
             tcg_vm = tcg_const_i64(0);
@@ -4484,9 +4495,13 @@ static void handle_fp_compare(DisasContext *s, bool is_double,
         }
         tcg_temp_free_i64(tcg_vn);
         tcg_temp_free_i64(tcg_vm);
-    } else {
+        break;
+    }
+    case 0: /* single */
+    {
         TCGv_i32 tcg_vn, tcg_vm;
 
+        fpst = get_fpstatus_ptr(false);
         tcg_vn = read_fp_sreg(s, rn);
         if (cmp_with_zero) {
             tcg_vm = tcg_const_i32(0);
@@ -4500,6 +4515,33 @@ static void handle_fp_compare(DisasContext *s, bool is_double,
         }
         tcg_temp_free_i32(tcg_vn);
         tcg_temp_free_i32(tcg_vm);
+        break;
+    }
+    case 3: /* half */
+    {
+        TCGv_i32 tcg_vn = tcg_temp_new_i32();
+        TCGv_i32 tcg_vm = tcg_temp_new_i32();
+
+        fpst = get_fpstatus_ptr(true);
+        read_vec_element_i32(s, tcg_vn, rn, 0, MO_16);
+
+        if (cmp_with_zero) {
+            tcg_vm = tcg_const_i32(0);
+        } else {
+            read_vec_element_i32(s, tcg_vm, rm, 0, MO_16);
+        }
+        if (signal_all_nans) {
+            gen_helper_vfp_cmpeh_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+        } else {
+            gen_helper_vfp_cmph_a64(tcg_flags, tcg_vn, tcg_vm, fpst);
+        }
+        tcg_temp_free_i32(tcg_vn);
+        tcg_temp_free_i32(tcg_vm);
+        break;
+    }
+    default:
+        g_assert_not_reached();
+        break;
     }
 
     tcg_temp_free_ptr(fpst);
@@ -4520,14 +4562,14 @@ static void disas_fp_compare(DisasContext *s, uint32_t insn)
     unsigned int mos, type, rm, op, rn, opc, op2r;
 
     mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2); /* 0 = single, 1 = double */
+    type = extract32(insn, 22, 2);
     rm = extract32(insn, 16, 5);
     op = extract32(insn, 14, 2);
     rn = extract32(insn, 5, 5);
     opc = extract32(insn, 3, 2);
     op2r = extract32(insn, 0, 3);
 
-    if (mos || op || op2r || type > 1) {
+    if (mos || op || op2r) {
         unallocated_encoding(s);
         return;
     }
@@ -4552,14 +4594,14 @@ static void disas_fp_ccomp(DisasContext *s, uint32_t insn)
     TCGLabel *label_continue = NULL;
 
     mos = extract32(insn, 29, 3);
-    type = extract32(insn, 22, 2); /* 0 = single, 1 = double */
+    type = extract32(insn, 22, 2);
     rm = extract32(insn, 16, 5);
     cond = extract32(insn, 12, 4);
     rn = extract32(insn, 5, 5);
     op = extract32(insn, 4, 1);
     nzcv = extract32(insn, 0, 4);
 
-    if (mos || type > 1) {
+    if (mos) {
         unallocated_encoding(s);
         return;
     }
-- 
2.17.0
