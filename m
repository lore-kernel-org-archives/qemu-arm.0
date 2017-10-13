Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p128sm1654630wmb.1.2017.10.13.09.32.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Oct 2017 09:32:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 6AC973E0BFD;
	Fri, 13 Oct 2017 17:24:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Cc: peter.maydell@linaro.org,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [RFC PATCH 14/30] softfloat: 16 bit helpers for shr, clz and rounding and packing
Date: Fri, 13 Oct 2017 17:24:22 +0100
Message-Id: <20171013162438.32458-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171013162438.32458-1-alex.bennee@linaro.org>
References: <20171013162438.32458-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xA6PXIjgcDQ7

Half-precision helpers for float16 maths. I didn't bother hand-coding
the count leading zeros as we could always fall-back to host-utils if
we needed to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 fpu/softfloat-macros.h | 39 +++++++++++++++++++++++++++++++++++++++
 fpu/softfloat.c        | 21 +++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/fpu/softfloat-macros.h b/fpu/softfloat-macros.h
index 9cc6158cb4..73091a88a8 100644
--- a/fpu/softfloat-macros.h
+++ b/fpu/softfloat-macros.h
@@ -89,6 +89,31 @@ this code that are retained.
 # define SOFTFLOAT_GNUC_PREREQ(maj, min) 0
 #endif
 
+/*----------------------------------------------------------------------------
+| Shifts `a' right by the number of bits given in `count'.  If any nonzero
+| bits are shifted off, they are ``jammed'' into the least significant bit of
+| the result by setting the least significant bit to 1.  The value of `count'
+| can be arbitrarily large; in particular, if `count' is greater than 16, the
+| result will be either 0 or 1, depending on whether `a' is zero or nonzero.
+| The result is stored in the location pointed to by `zPtr'.
+*----------------------------------------------------------------------------*/
+
+static inline void shift16RightJamming(uint16_t a, int count, uint16_t *zPtr)
+{
+    uint16_t z;
+
+    if ( count == 0 ) {
+        z = a;
+    }
+    else if ( count < 16 ) {
+        z = ( a>>count ) | ( ( a<<( ( - count ) & 16 ) ) != 0 );
+    }
+    else {
+        z = ( a != 0 );
+    }
+    *zPtr = z;
+
+}
 
 /*----------------------------------------------------------------------------
 | Shifts `a' right by the number of bits given in `count'.  If any nonzero
@@ -664,6 +689,20 @@ static uint32_t estimateSqrt32(int aExp, uint32_t a)
 
 }
 
+/*----------------------------------------------------------------------------
+| Returns the number of leading 0 bits before the most-significant 1 bit of
+| `a'.  If `a' is zero, 16 is returned.
+*----------------------------------------------------------------------------*/
+
+static int8_t countLeadingZeros16( uint16_t a )
+{
+    if (a) {
+        return __builtin_clz(a);
+    } else {
+        return 16;
+    }
+}
+
 /*----------------------------------------------------------------------------
 | Returns the number of leading 0 bits before the most-significant 1 bit of
 | `a'.  If `a' is zero, 32 is returned.
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 6ab4b39c09..cf7bf6d4f4 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -3488,6 +3488,27 @@ static float16 roundAndPackFloat16(flag zSign, int zExp,
     return packFloat16(zSign, zExp, zSig >> 13);
 }
 
+/*----------------------------------------------------------------------------
+| Takes an abstract floating-point value having sign `zSign', exponent `zExp',
+| and significand `zSig', and returns the proper single-precision floating-
+| point value corresponding to the abstract input.  This routine is just like
+| `roundAndPackFloat32' except that `zSig' does not have to be normalized.
+| Bit 15 of `zSig' must be zero, and `zExp' must be 1 less than the ``true''
+| floating-point exponent.
+*----------------------------------------------------------------------------*/
+
+static float16
+ normalizeRoundAndPackFloat16(flag zSign, int zExp, uint16_t zSig,
+                              float_status *status)
+{
+    int8_t shiftCount;
+
+    shiftCount = countLeadingZeros16( zSig ) - 1;
+    return roundAndPackFloat16(zSign, zExp - shiftCount, zSig<<shiftCount,
+                               true, status);
+
+}
+
 /*----------------------------------------------------------------------------
 | If `a' is denormal and we are in flush-to-zero mode then set the
 | input-denormal exception and return zero. Otherwise just return the value.
-- 
2.14.1
