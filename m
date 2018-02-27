Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x190sm13300059wme.27.2018.02.27.06.38.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2018 06:38:59 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 8D4553E099E;
	Tue, 27 Feb 2018 14:38:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 09/31] arm/translate-a64: add FP16 FADD/FABD/FSUB/FMUL/FDIV to simd_three_reg_same_fp16
Date: Tue, 27 Feb 2018 14:38:30 +0000
Message-Id: <20180227143852.11175-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180227143852.11175-1-alex.bennee@linaro.org>
References: <20180227143852.11175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2TfYuqgcsgKQ

The fprintf is only there for debugging as the skeleton is added to,
it will be removed once the skeleton is complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v2
 - add absh helper
 - fix checkpatch violation
 - make abs a bitwise operation
---
 target/arm/helper-a64.c    |  4 ++++
 target/arm/helper-a64.h    |  4 ++++
 target/arm/translate-a64.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index fddd5d242b..931a6d3c34 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -586,6 +586,10 @@ float16 ADVSIMD_HELPER(name, h)(float16 a, float16 b, void *fpstp) \
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
index cb2a73124d..bac9469426 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -52,3 +52,7 @@ DEF_HELPER_FLAGS_3(advsimd_maxh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_minh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_maxnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
 DEF_HELPER_FLAGS_3(advsimd_minnumh, TCG_CALL_NO_RWG, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_addh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_subh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_mulh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_divh, f16, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4828457b5b..f8770ee1e9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10283,6 +10283,34 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
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
+            tcg_gen_andi_i32(tcg_res, tcg_res, 0x7fff);
+            break;
         default:
             fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
                     __func__, insn, fpopcode, s->pc);
-- 
2.15.1
