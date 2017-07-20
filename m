Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w30sm8742405wrb.49.2017.07.20.08.12.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:12:38 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 736F93E0AC0;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for 2.11 14/23] target/arm/translate-a64.c: add ARMv8.2 fadd scalar half-precision
Date: Thu, 20 Jul 2017 16:04:17 +0100
Message-Id: <20170720150426.12393-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fPJ8mZ786q8l

This brings in the initial decode skeleton and the helpers for a
scalar half-precision fadd using SoftFloat3c.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/advsimd_helper.c | 15 ++++++++++++
 target/arm/translate-a64.c  | 60 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/target/arm/advsimd_helper.c b/target/arm/advsimd_helper.c
index ec875a83bb..4e577e9602 100644
--- a/target/arm/advsimd_helper.c
+++ b/target/arm/advsimd_helper.c
@@ -83,3 +83,18 @@ uint32_t HELPER(advsimd_acgt_f16)(uint32_t a, uint32_t b, void *fpstp)
     sync_softfloat_flags_to_2a(fpstp);
     return r;
 }
+
+
+/* Data processing - scalar floating-point and advanced SIMD */
+
+uint32_t HELPER(advsimd_addh)(uint32_t a, uint32_t b, void *fpstp)
+{
+    union ui16_f16 uA = { .ui = a };
+    union ui16_f16 uB = { .ui = b };
+    float16_t r;
+
+    sync_softfloat_flags_from_2a(fpstp);
+    r = f16_add(uA.f, uB.f);
+    sync_softfloat_flags_to_2a(fpstp);
+    return r.v;
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f6aca395bd..a8876e4bcc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -581,6 +581,14 @@ static TCGv_i32 read_fp_sreg(DisasContext *s, int reg)
     return v;
 }
 
+static TCGv_i32 read_fp_hreg(DisasContext *s, int reg)
+{
+    TCGv_i32 v = tcg_temp_new_i32();
+
+    tcg_gen_ld16u_i32(v, cpu_env, fp_reg_offset(s, reg, MO_16));
+    return v;
+}
+
 static void write_fp_dreg(DisasContext *s, int reg, TCGv_i64 v)
 {
     TCGv_i64 tcg_zero = tcg_const_i64(0);
@@ -599,6 +607,15 @@ static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
     tcg_temp_free_i64(tmp);
 }
 
+static void write_fp_hreg(DisasContext *s, int reg, TCGv_i32 v)
+{
+    TCGv_i64 tmp = tcg_temp_new_i64();
+
+    tcg_gen_extu_i32_i64(tmp, v);
+    write_fp_dreg(s, reg, tmp);
+    tcg_temp_free_i64(tmp);
+}
+
 static TCGv_ptr get_fpstatus_ptr(void)
 {
     TCGv_ptr statusptr = tcg_temp_new_ptr();
@@ -4710,6 +4727,39 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     }
 }
 
+/* ARMv8.2 floating-point data-processing (2 source) - half precision
+ */
+static void handle_fp_2src_half(DisasContext *s, int opcode,
+                                int rd, int rn, int rm)
+{
+    TCGv_i32 tcg_op1;
+    TCGv_i32 tcg_op2;
+    TCGv_i32 tcg_res;
+    TCGv_ptr fpst;
+
+    tcg_res = tcg_temp_new_i32();
+    fpst = get_fpstatus_ptr();
+    tcg_op1 = read_fp_hreg(s, rn);
+    tcg_op2 = read_fp_hreg(s, rm);
+
+    switch (opcode) {
+    case 0x2: /* FADD */
+        gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
+        break;
+    default:
+        fprintf(stderr, "%s: unhandled op %#x\n", __func__, opcode);
+        unsupported_encoding(s, opcode);
+        break;
+    }
+
+    write_fp_hreg(s, rd, tcg_res);
+
+    tcg_temp_free_ptr(fpst);
+    tcg_temp_free_i32(tcg_op1);
+    tcg_temp_free_i32(tcg_op2);
+    tcg_temp_free_i32(tcg_res);
+}
+
 /* C3.6.26 Floating-point data-processing (2 source) - single precision */
 static void handle_fp_2src_single(DisasContext *s, int opcode,
                                   int rd, int rn, int rm)
@@ -4848,6 +4898,16 @@ static void disas_fp_2src(DisasContext *s, uint32_t insn)
         }
         handle_fp_2src_double(s, opcode, rd, rn, rm);
         break;
+    case 3:
+        if (arm_dc_feature(s, ARM_FEATURE_V8_FP16)) {
+            if (!fp_access_check(s)) {
+                return;
+            }
+            handle_fp_2src_half(s, opcode, rd, rn, rm);
+        } else {
+            unallocated_encoding(s);
+        }
+        break;
     default:
         unallocated_encoding(s);
     }
-- 
2.13.0
