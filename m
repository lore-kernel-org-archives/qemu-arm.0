Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d5sm538423wra.72.2018.02.08.09.32.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7A8103E0C5D;
	Thu,  8 Feb 2018 17:31:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/32] arm/translate-a64: add FP16 FADD/FABD/FSUB/FMUL/FDIV to simd_three_reg_same_fp16
Date: Thu,  8 Feb 2018 17:31:35 +0000
Message-Id: <20180208173157.24705-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: WI4hGKqVaQ7V

The fprintf is only there for debugging as the skeleton is added to,
it will be removed once the skeleton is complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
 - add absh helper
 - fix checkpatch violation
---
 target/arm/helper-a64.c    |  9 +++++++++
 target/arm/helper-a64.h    |  5 +++++
 target/arm/translate-a64.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index fddd5d242b..25e45121af 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -579,6 +579,11 @@ uint64_t HELPER(paired_cmpxchg64_be_parallel)(CPUARMState *env, uint64_t addr,
 
 #define ADVSIMD_HELPER(name, suffix) HELPER(glue(glue(advsimd_, name), suffix))
 
+float16 ADVSIMD_HELPER(abs, h) (float16 a)
+{
+    return float16_abs(a);
+}
+
 #define ADVSIMD_HALFOP(name) \
 float16 ADVSIMD_HELPER(name, h)(float16 a, float16 b, void *fpstp) \
 { \
@@ -586,6 +591,10 @@ float16 ADVSIMD_HELPER(name, h)(float16 a, float16 b, void *fpstp) \
     return float16_ ## name(a, b, fpst);    \
 }
 
+ADVSIMD_HALFOP(add)
+ADVSIMD_HALFOP(sub)
+ADVSIMD_HALFOP(mul)
+ADVSIMD_HALFOP(div)
 ADVSIMD_HALFOP(min)
 ADVSIMD_HALFOP(max)
 ADVSIMD_HALFOP(minnum)
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index b69a557241..5cbabcc27a 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -48,6 +48,11 @@ DEF_HELPER_FLAGS_4(paired_cmpxchg64_le_parallel, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(paired_cmpxchg64_be_parallel, TCG_CALL_NO_WG,
                    i64, env, i64, i64, i64)
+DEF_HELPER_1(advsimd_absh, f16, f16)
+DEF_HELPER_3(advsimd_addh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_subh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_mulh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_divh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_maxh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5392f83794..93d71d8b2c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9849,6 +9849,34 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
 
         switch (fpopcode) {
+        case 0x0: /* FMAXNM */
+            gen_helper_advsimd_maxnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x2: /* FADD */
+            gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x6: /* FMAX */
+            gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x8: /* FMINNM */
+            gen_helper_advsimd_minnumh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0xa: /* FSUB */
+            gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0xe: /* FMIN */
+            gen_helper_advsimd_minh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x13: /* FMUL */
+            gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x17: /* FDIV */
+            gen_helper_advsimd_divh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x1a: /* FABD */
+            gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
+            gen_helper_advsimd_absh(tcg_res, tcg_res);
+            break;
         default:
             fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
                     __func__, insn, fpopcode, s->pc);
-- 
2.15.1
