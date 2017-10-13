Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p49sm166948wrc.61.2017.10.13.09.32.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:32:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7A9AD3E1337;
	Fri, 13 Oct 2017 17:24:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 28/30] softfloat: float16_to_int16 conversion
Date: Fri, 13 Oct 2017 17:24:36 +0100
Message-Id: <20171013162438.32458-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: N/XymOuPxLxS

I didn't have another reference for this so I wrote it from first
principles. The roundAndPackInt16 works with the same shifted input as
roundAndPacknt32 but with different constants for invalid testing for
overflow.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat.c         | 98 +++++++++++++++++++++++++++++++++++++++++++++++++
 include/fpu/softfloat.h |  1 +
 2 files changed, 99 insertions(+)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index dc7f5f6d88..63f7cd1226 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -132,6 +132,62 @@ static inline flag extractFloat16Sign(float16 a)
     return float16_val(a)>>15;
 }
 
+/*----------------------------------------------------------------------------
+| Takes a 32-bit fixed-point value `absZ' with binary point between bits 6
+| and 7, and returns the properly rounded 16-bit integer corresponding to the
+| input.  If `zSign' is 1, the input is negated before being converted to an
+| integer.  Bit 31 of `absZ' must be zero.  Ordinarily, the fixed-point input
+| is simply rounded to an integer, with the inexact exception raised if the
+| input cannot be represented exactly as an integer.  However, if the fixed-
+| point input is too large, the invalid exception is raised and the largest
+| positive or negative integer is returned.
+*----------------------------------------------------------------------------*/
+
+static int16_t roundAndPackInt16(flag zSign, uint32_t absZ, float_status *status)
+{
+    int8_t roundingMode;
+    flag roundNearestEven;
+    int8_t roundIncrement, roundBits;
+    int16_t z;
+
+    roundingMode = status->float_rounding_mode;
+    roundNearestEven = ( roundingMode == float_round_nearest_even );
+
+    switch (roundingMode) {
+    case float_round_nearest_even:
+    case float_round_ties_away:
+        roundIncrement = 0x40;
+        break;
+    case float_round_to_zero:
+        roundIncrement = 0;
+        break;
+    case float_round_up:
+        roundIncrement = zSign ? 0 : 0x7f;
+        break;
+    case float_round_down:
+        roundIncrement = zSign ? 0x7f : 0;
+        break;
+    default:
+        abort();
+    }
+    roundBits = absZ & 0x7F;
+
+    absZ = ( absZ + roundIncrement )>>7;
+    absZ &= ~ ( ( ( roundBits ^ 0x40 ) == 0 ) & roundNearestEven );
+    z = absZ;
+    if ( zSign ) z = - z;
+
+    if ( ( absZ>>16 ) || ( z && ( ( z < 0 ) ^ zSign ) ) ) {
+        float_raise(float_flag_invalid, status);
+        return zSign ? (int16_t) 0x8000 : 0x7FFF;
+    }
+    if (roundBits) {
+        status->float_exception_flags |= float_flag_inexact;
+    }
+    return z;
+
+}
+
 /*----------------------------------------------------------------------------
 | Takes a 64-bit fixed-point value `absZ' with binary point between bits 6
 | and 7, and returns the properly rounded 32-bit integer corresponding to the
@@ -4509,6 +4565,48 @@ int float16_unordered_quiet(float16 a, float16 b, float_status *status)
     return 0;
 }
 
+/*----------------------------------------------------------------------------
+| Returns the result of converting the half-precision floating-point value
+| `a' to the 16-bit two's complement integer format.  The conversion is
+| performed according to the IEC/IEEE Standard for Binary Floating-Point
+| Arithmetic---which means in particular that the conversion is rounded
+| according to the current rounding mode.  If `a' is a NaN, the largest
+| positive integer is returned.  Otherwise, if the conversion overflows, the
+| largest integer with the same sign as `a' is returned.
+*----------------------------------------------------------------------------*/
+
+int16_t float16_to_int16(float32 a, float_status *status)
+{
+    flag aSign;
+    int aExp;
+    uint32_t aSig;
+
+    a = float16_squash_input_denormal(a, status);
+    aSig = extractFloat16Frac( a );
+    aExp = extractFloat16Exp( a );
+    aSign = extractFloat16Sign( a );
+    if ( ( aExp == 0x1F ) && aSig ) aSign = 0;
+    if ( aExp ) aSig |= 0x0400; /* implicit bit */
+
+    /* At this point the binary point is between 10:9, we need to
+     * shift the significand it up by the +ve exponent to get the
+     * integer and then move the binary point down to the  7:6 for
+     * the final roundAnPackInt16.
+     *
+     * Even with the maximum +ve shift everything happily fits in the
+     * 32 bit aSig.
+     */
+    aExp -= 15; /* exp bias */
+    if (aExp >= 3) {
+        aSig <<= aExp - 3;
+    } else {
+        /* ensure small numbers still get rounded */
+        shift32RightJamming( aSig, 3 - aExp, &aSig );
+    }
+
+    return roundAndPackInt16(aSign, aSig, status);
+}
+
 /* Half precision floats come in two formats: standard IEEE and "ARM" format.
    The latter gains extra exponent range by omitting the NaN/Inf encodings.  */
 
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 856f67cf12..49517b19ea 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -338,6 +338,7 @@ static inline float64 uint16_to_float64(uint16_t v, float_status *status)
 | Software half-precision conversion routines.
 *----------------------------------------------------------------------------*/
 float16 float32_to_float16(float32, flag, float_status *status);
+int16_t float16_to_int16(float32 a, float_status *status);
 float32 float16_to_float32(float16, flag, float_status *status);
 float16 float64_to_float16(float64 a, flag ieee, float_status *status);
 float64 float16_to_float64(float16 a, flag ieee, float_status *status);
-- 
2.14.1
