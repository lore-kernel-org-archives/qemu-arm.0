Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id e132sm1404279wmd.42.2017.10.13.09.24.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D243C3E0756;
	Fri, 13 Oct 2017 17:24:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 06/30] fpu/softfloat: implement float16_squash_input_denormal
Date: Fri, 13 Oct 2017 17:24:14 +0100
Message-Id: <20171013162438.32458-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xtP1EKHMFLoD

This will be required when expanding the MINMAX() macro for 16
bit/half-precision operations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c         | 15 +++++++++++++++
 include/fpu/softfloat.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 433c5dad2d..3a4ab1355f 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3488,6 +3488,21 @@ static float16 roundAndPackFloat16(flag zSign, int zExp,
     return packFloat16(zSign, zExp, zSig >> 13);
 }
 
+/*----------------------------------------------------------------------------
+| If `a' is denormal and we are in flush-to-zero mode then set the
+| input-denormal exception and return zero. Otherwise just return the value.
+*----------------------------------------------------------------------------*/
+float16 float16_squash_input_denormal(float16 a, float_status *status)
+{
+    if (status->flush_inputs_to_zero) {
+        if (extractFloat16Exp(a) == 0 && extractFloat16Frac(a) != 0) {
+            float_raise(float_flag_input_denormal, status);
+            return make_float16(float16_val(a) & 0x8000);
+        }
+    }
+    return a;
+}
+
 static void normalizeFloat16Subnormal(uint32_t aSig, int *zExpPtr,
                                       uint32_t *zSigPtr)
 {
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 0f96a0edd1..d5e99667b6 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -277,6 +277,7 @@ void float_raise(uint8_t flags, float_status *status);
 | If `a' is denormal and we are in flush-to-zero mode then set the
 | input-denormal exception and return zero. Otherwise just return the value.
 *----------------------------------------------------------------------------*/
+float16 float16_squash_input_denormal(float16 a, float_status *status);
 float32 float32_squash_input_denormal(float32 a, float_status *status);
 float64 float64_squash_input_denormal(float64 a, float_status *status);
 
-- 
2.14.1
