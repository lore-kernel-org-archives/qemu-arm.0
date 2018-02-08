Received: by 10.28.71.27 with SMTP id u27csp2337863wma;
        Thu, 8 Feb 2018 09:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqS5bsgwt3K5AMcy185N2DbqVb+H8DCD8qxb5Y7klU8=;
        b=dNtF5+PxeyB7lzMaR9iUXgwIxz0DzTttGVRxeabnSoSsWYNdTfYexACRv8SW58xufZ
         j0Econ0oAV6AE95Dwm6s5fkNZ1Jb3HYjQApLk9jCe+EAHydK+raJegxKP3FPGWAiX9So
         To/yHPKp326GptWYpUEkc+A52M9+lUbnn+SoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqS5bsgwt3K5AMcy185N2DbqVb+H8DCD8qxb5Y7klU8=;
        b=GKM3Jm0vYOLB7fHshH8z75sDCSZoNmvLz1VSZrgW/nGUUa9DsdSfpSP4C63yV2NeTH
         56j0jppat88rZB6QH79ldodKz2znEPV8NhpGuQ34B1+1dgsia4t4yByCrR1g7LISlPzr
         w8RkniRwjI1b7oCB9Pgwpb4oGsx2YMyAwh2s5HrLT06LIgMBWc2ELCS56dScbofKDikh
         jZmx0B3cqn6NgPHJOp8nu32+MOAhDIID0K85/ni9D9Sszgrfd8wuJTvjpm3/dv7sL2nl
         P8cK4ZAXJaIu3PZZrWpmT97fKQZXcMNduERbJOmfhBgW5UBvjU8+MgHSD5rmfLHjacm3
         iHWQ==
X-Google-Smtp-Source: AH8x224tmtU52gU3iDP3ZAA0A9yibFyvbRo9VtFAaC5fVVNLK+zAMZZp6R2Vynps1qjkFsEd478n7w==
X-Received: by 10.223.185.123 with SMTP id b56mr1471586wrg.13.1518111125751;
        Thu, 08 Feb 2018 09:32:05 -0800 (PST)
Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x190sm455675wme.27.2018.02.08.09.32.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:05 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 8D23B3E0C74;
	Thu,  8 Feb 2018 17:31:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/32] arm/translate-a64: add FP16 F[A]C[EQ/GE/GT] to simd_three_reg_same_fp16
Date: Thu,  8 Feb 2018 17:31:36 +0000
Message-Id: <20180208173157.24705-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cYMY7OSaCZRm

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/helper-a64.h    |  5 +++++
 target/arm/translate-a64.c | 15 ++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 25e45121af..78eeda31d1 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -599,3 +599,52 @@ ADVSIMD_HALFOP(min)
 ADVSIMD_HALFOP(max)
 ADVSIMD_HALFOP(minnum)
 ADVSIMD_HALFOP(maxnum)
+
+/*
+ * Floating point comparisons produce an integer result. Softfloat
+ * routines return float_relation types which we convert to the 0/-1
+ * Neon requires.
+ */
+
+#define ADVSIMD_CMPRES(test) (test) ? 0xffff : 0
+
+uint32_t HELPER(advsimd_ceq_f16)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    int compare = float16_compare_quiet(a, b, fpst);
+    return ADVSIMD_CMPRES(compare == float_relation_equal);
+}
+
+uint32_t HELPER(advsimd_cge_f16)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    int compare = float16_compare(a, b, fpst);
+    return ADVSIMD_CMPRES(compare == float_relation_greater ||
+                          compare == float_relation_equal);
+}
+
+uint32_t HELPER(advsimd_cgt_f16)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    int compare = float16_compare(a, b, fpst);
+    return ADVSIMD_CMPRES(compare == float_relation_greater);
+}
+
+uint32_t HELPER(advsimd_acge_f16)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    float16 f0 = float16_abs(a);
+    float16 f1 = float16_abs(b);
+    int compare = float16_compare(f0, f1, fpst);
+    return ADVSIMD_CMPRES(compare == float_relation_greater ||
+                          compare == float_relation_equal);
+}
+
+uint32_t HELPER(advsimd_acgt_f16)(float16 a, float16 b, void *fpstp)
+{
+    float_status *fpst = fpstp;
+    float16 f0 = float16_abs(a);
+    float16 f1 = float16_abs(b);
+    int compare = float16_compare(f0, f1, fpst);
+    return ADVSIMD_CMPRES(compare == float_relation_greater);
+}
diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 5cbabcc27a..e701644ae7 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -57,3 +57,8 @@ DEF_HELPER_3(advsimd_maxh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_maxnumh, f16, f16, f16, ptr)
 DEF_HELPER_3(advsimd_minnumh, f16, f16, f16, ptr)
+DEF_HELPER_3(advsimd_ceq_f16, i32, f16, f16, ptr)
+DEF_HELPER_3(advsimd_cge_f16, i32, f16, f16, ptr)
+DEF_HELPER_3(advsimd_cgt_f16, i32, f16, f16, ptr)
+DEF_HELPER_3(advsimd_acge_f16, i32, f16, f16, ptr)
+DEF_HELPER_3(advsimd_acgt_f16, i32, f16, f16, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 93d71d8b2c..14572f26e1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9855,6 +9855,9 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         case 0x2: /* FADD */
             gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
+        case 0x4: /* FCMEQ */
+            gen_helper_advsimd_ceq_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
         case 0x6: /* FMAX */
             gen_helper_advsimd_maxh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
@@ -9870,6 +9873,12 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         case 0x13: /* FMUL */
             gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
+        case 0x14: /* FCMGE */
+            gen_helper_advsimd_cge_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x15: /* FACGE */
+            gen_helper_advsimd_acge_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
         case 0x17: /* FDIV */
             gen_helper_advsimd_divh(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
@@ -9877,6 +9886,12 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
             gen_helper_advsimd_subh(tcg_res, tcg_op1, tcg_op2, fpst);
             gen_helper_advsimd_absh(tcg_res, tcg_res);
             break;
+        case 0x1c: /* FCMGT */
+            gen_helper_advsimd_cgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
+        case 0x1d: /* FACGT */
+            gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
         default:
             fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
                     __func__, insn, fpopcode, s->pc);
-- 
2.15.1
