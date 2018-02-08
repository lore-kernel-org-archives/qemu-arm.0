Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x91sm559291wrb.77.2018.02.08.09.32.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:08 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3CD493E0D9A;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/32] arm/translate-a64: add FP16 FCMxx (zero) to simd_two_reg_misc_fp16
Date: Thu,  8 Feb 2018 17:31:45 +0000
Message-Id: <20180208173157.24705-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TBH53tWVIxob

I re-use the existing handle_2misc_fcmp_zero handler and tweak it
slightly to deal with the half-precision case.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0049111e6d..0efe9ae2fc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -7769,14 +7769,14 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
                                    bool is_scalar, bool is_u, bool is_q,
                                    int size, int rn, int rd)
 {
-    bool is_double = (size == 3);
+    bool is_double = (size == MO_64);
     TCGv_ptr fpst;
 
     if (!fp_access_check(s)) {
         return;
     }
 
-    fpst = get_fpstatus_ptr(false);
+    fpst = get_fpstatus_ptr(size == MO_16);
 
     if (is_double) {
         TCGv_i64 tcg_op = tcg_temp_new_i64();
@@ -7828,6 +7828,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
         TCGv_i32 tcg_res = tcg_temp_new_i32();
         NeonGenTwoSingleOPFn *genfn;
         bool swap = false;
+        bool hp = (size == MO_16 ? true : false);
         int pass, maxpasses;
 
         switch (opcode) {
@@ -7835,16 +7836,16 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             swap = true;
             /* fall through */
         case 0x2c: /* FCMGT (zero) */
-            genfn = gen_helper_neon_cgt_f32;
+            genfn = hp ? gen_helper_advsimd_cgt_f16 : gen_helper_neon_cgt_f32;
             break;
         case 0x2d: /* FCMEQ (zero) */
-            genfn = gen_helper_neon_ceq_f32;
+            genfn = hp ? gen_helper_advsimd_ceq_f16 : gen_helper_neon_ceq_f32;
             break;
         case 0x6d: /* FCMLE (zero) */
             swap = true;
             /* fall through */
         case 0x6c: /* FCMGE (zero) */
-            genfn = gen_helper_neon_cge_f32;
+            genfn = hp ? gen_helper_advsimd_cge_f16 : gen_helper_neon_cge_f32;
             break;
         default:
             g_assert_not_reached();
@@ -7853,11 +7854,11 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
         if (is_scalar) {
             maxpasses = 1;
         } else {
-            maxpasses = is_q ? 4 : 2;
+            maxpasses = hp ? (is_q ? 8 : 4) : (is_q ? 4 : 2);
         }
 
         for (pass = 0; pass < maxpasses; pass++) {
-            read_vec_element_i32(s, tcg_op, rn, pass, MO_32);
+            read_vec_element_i32(s, tcg_op, rn, pass, hp ? MO_16 : MO_32);
             if (swap) {
                 genfn(tcg_res, tcg_zero, tcg_op, fpst);
             } else {
@@ -7866,7 +7867,7 @@ static void handle_2misc_fcmp_zero(DisasContext *s, int opcode,
             if (is_scalar) {
                 write_fp_sreg(s, rd, tcg_res);
             } else {
-                write_vec_element_i32(s, tcg_res, rd, pass, MO_32);
+                write_vec_element_i32(s, tcg_res, rd, pass, hp ? MO_16 : MO_32);
             }
         }
         tcg_temp_free_i32(tcg_res);
@@ -10766,7 +10767,19 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(opcode, 5, 1, a);
     fpop = deposit32(fpop, 6, 1, u);
 
+    rd = extract32(insn, 0, 5);
+    rn = extract32(insn, 5, 5);
+
     switch (fpop) {
+    break;
+    case 0x2c: /* FCMGT (zero) */
+    case 0x2d: /* FCMEQ (zero) */
+    case 0x2e: /* FCMLT (zero) */
+    case 0x6c: /* FCMGE (zero) */
+    case 0x6d: /* FCMLE (zero) */
+        handle_2misc_fcmp_zero(s, fpop, is_scalar, 0, is_q, MO_16, rn, rd);
+        return;
+        break;
     case 0x18: /* FRINTN */
         need_rmode = true;
         only_in_vector = true;
-- 
2.15.1
