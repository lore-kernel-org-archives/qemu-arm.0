Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w126sm1302265wme.25.2017.10.13.09.24.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:24:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id BFE8B3E0755;
	Fri, 13 Oct 2017 17:24:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 05/30] softfloat: implement propagateFloat16NaN
Date: Fri, 13 Oct 2017 17:24:13 +0100
Message-Id: <20171013162438.32458-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8oyI9HRm8Rtc

This will be required when expanding the MINMAX() macro for 16
bit/half-precision operations.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat-specialize.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index de2c5d5702..c8282b8bf7 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -685,6 +685,49 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSNaN, flag bIsQNaN, flag bIsSNaN,
 }
 #endif
 
+/*----------------------------------------------------------------------------
+| Takes two half-precision floating-point values `a' and `b', one of which
+| is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
+| signaling NaN, the invalid exception is raised.
+*----------------------------------------------------------------------------*/
+
+static float16 propagateFloat16NaN(float16 a, float16 b, float_status *status)
+{
+    flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
+    flag aIsLargerSignificand;
+    uint16_t av, bv;
+
+    aIsQuietNaN = float16_is_quiet_nan(a, status);
+    aIsSignalingNaN = float16_is_signaling_nan(a, status);
+    bIsQuietNaN = float16_is_quiet_nan(b, status);
+    bIsSignalingNaN = float16_is_signaling_nan(b, status);
+    av = float16_val(a);
+    bv = float16_val(b);
+
+    if (aIsSignalingNaN | bIsSignalingNaN) {
+        float_raise(float_flag_invalid, status);
+    }
+
+    if (status->default_nan_mode) {
+        return float16_default_nan(status);
+    }
+
+    if ((uint16_t)(av << 1) < (uint16_t)(bv << 1)) {
+        aIsLargerSignificand = 0;
+    } else if ((uint16_t)(bv << 1) < (uint16_t)(av << 1)) {
+        aIsLargerSignificand = 1;
+    } else {
+        aIsLargerSignificand = (av < bv) ? 1 : 0;
+    }
+
+    if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN,
+                aIsLargerSignificand)) {
+        return float16_maybe_silence_nan(b, status);
+    } else {
+        return float16_maybe_silence_nan(a, status);
+    }
+}
+
 /*----------------------------------------------------------------------------
 | Takes two single-precision floating-point values `a' and `b', one of which
 | is a NaN, and returns the appropriate NaN result.  If either `a' or `b' is a
-- 
2.14.1
