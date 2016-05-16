Received: by 10.25.208.137 with SMTP id h131csp1289889lfg;
        Mon, 16 May 2016 07:14:02 -0700 (PDT)
X-Received: by 10.55.56.133 with SMTP id f127mr31829431qka.51.1463408042803;
        Mon, 16 May 2016 07:14:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w129si23100299qka.233.2016.05.16.07.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:14:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JHV-0006zL-Qo
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:14:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JHR-0006po-ED
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:13:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JHO-0005ed-Vm
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:13:56 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:32946 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JHO-0005eN-K1; Mon, 16 May 2016 10:13:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id BF0BA1A4515;
	Mon, 16 May 2016 16:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 986DB1A44F1;
	Mon, 16 May 2016 16:13:52 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:38 +0200
Message-Id: <1463407965-19733-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 2/9] softfloat: Clean code format in
 fpu/softfloat-specialize.h
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 988fb8wpzIDE

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

fpu/softfloat-specialize.h is the most critical file in SoftFloat
library, since it handles numerous differences between platforms in
relation to floating point arithmetics. This patch makes the code
in this file more consistent format-wise, and hopefully easier to
debug and maintain.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h | 99 +++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 49 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index 4411d3c..e03a529 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -273,7 +273,7 @@ static commonNaNT float16ToCommonNaN(float16 a, float_status *status)
     }
     z.sign = float16_val(a) >> 15;
     z.low = 0;
-    z.high = ((uint64_t) float16_val(a))<<54;
+    z.high = ((uint64_t) float16_val(a)) << 54;
     return z;
 }
 
@@ -284,7 +284,7 @@ static commonNaNT float16ToCommonNaN(float16 a, float_status *status)
 
 static float16 commonNaNToFloat16(commonNaNT a, float_status *status)
 {
-    uint16_t mantissa = a.high>>54;
+    uint16_t mantissa = a.high >> 54;
 
     if (status->default_nan_mode) {
         return float16_default_nan(status);
@@ -372,9 +372,9 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
     if (float32_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = float32_val(a)>>31;
+    z.sign = float32_val(a) >> 31;
     z.low = 0;
-    z.high = ( (uint64_t) float32_val(a) )<<41;
+    z.high = ((uint64_t)float32_val(a)) << 41;
     return z;
 }
 
@@ -385,17 +385,18 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
 
 static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 {
-    uint32_t mantissa = a.high>>41;
+    uint32_t mantissa = a.high >> 41;
 
     if (status->default_nan_mode) {
         return float32_default_nan(status);
     }
 
-    if ( mantissa )
+    if (mantissa) {
         return make_float32(
-            ( ( (uint32_t) a.sign )<<31 ) | 0x7F800000 | ( a.high>>41 ) );
-    else
-        return float32_default_nan;
+            (((uint32_t)a.sign) << 31) | 0x7F800000 | (a.high >> 41));
+    } else {
+        return float32_default_nan(status);
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -497,11 +498,10 @@ static int pickNaN(flag aIsQNaN, flag aIsSNaN, flag bIsQNaN, flag bIsSNaN,
             return aIsLargerSignificand ? 0 : 1;
         }
         return bIsQNaN ? 1 : 0;
-    }
-    else if (aIsQNaN) {
-        if (bIsSNaN || !bIsQNaN)
+    } else if (aIsQNaN) {
+        if (bIsSNaN || !bIsQNaN) {
             return 0;
-        else {
+        } else {
             return aIsLargerSignificand ? 0 : 1;
         }
     } else {
@@ -644,9 +644,9 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
         return float32_default_nan(status);
     }
 
-    if ((uint32_t)(av<<1) < (uint32_t)(bv<<1)) {
+    if ((uint32_t)(av << 1) < (uint32_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint32_t)(bv<<1) < (uint32_t)(av<<1)) {
+    } else if ((uint32_t)(bv << 1) < (uint32_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -789,9 +789,9 @@ static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
     if (float64_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = float64_val(a)>>63;
+    z.sign = float64_val(a) >> 63;
     z.low = 0;
-    z.high = float64_val(a)<<12;
+    z.high = float64_val(a) << 12;
     return z;
 }
 
@@ -808,13 +808,14 @@ static float64 commonNaNToFloat64(commonNaNT a, float_status *status)
         return float64_default_nan(status);
     }
 
-    if ( mantissa )
+    if (mantissa) {
         return make_float64(
-              ( ( (uint64_t) a.sign )<<63 )
-            | LIT64( 0x7FF0000000000000 )
-            | ( a.high>>12 ));
-    else
-        return float64_default_nan;
+              (((uint64_t) a.sign) << 63)
+            | LIT64(0x7FF0000000000000)
+            | (a.high >> 12));
+    } else {
+        return float64_default_nan(status);
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -844,9 +845,9 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
         return float64_default_nan(status);
     }
 
-    if ((uint64_t)(av<<1) < (uint64_t)(bv<<1)) {
+    if ((uint64_t)(av << 1) < (uint64_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint64_t)(bv<<1) < (uint64_t)(av<<1)) {
+    } else if ((uint64_t)(bv << 1) < (uint64_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -935,12 +936,12 @@ int floatx80_is_quiet_nan(floatx80 a, float_status *status)
         uint64_t aLow;
 
         aLow = a.low & ~0x4000000000000000ULL;
-        return ((a.high & 0x7fff) == 0x7fff)
+        return ((a.high & 0x7FFF) == 0x7FFF)
             && (aLow << 1)
             && (a.low == aLow);
     } else {
-        return ( ( a.high & 0x7FFF ) == 0x7FFF )
-            && (LIT64( 0x8000000000000000 ) <= ((uint64_t) ( a.low<<1 )));
+        return ((a.high & 0x7FFF) == 0x7FFF)
+            && (LIT64(0x8000000000000000) <= ((uint64_t)(a.low << 1)));
     }
 }
 
@@ -958,11 +959,11 @@ int floatx80_is_signaling_nan(floatx80 a, float_status *status)
     } else {
         uint64_t aLow;
 
-        aLow = a.low & ~ LIT64( 0x4000000000000000 );
+        aLow = a.low & ~LIT64(0x4000000000000000);
         return
-               ( ( a.high & 0x7FFF ) == 0x7FFF )
-            && (uint64_t) ( aLow<<1 )
-            && ( a.low == aLow );
+               ((a.high & 0x7FFF) == 0x7FFF)
+            && (uint64_t) (aLow << 1)
+            && (a.low == aLow);
     }
 }
 #endif
@@ -999,7 +1000,7 @@ static commonNaNT floatx80ToCommonNaN(floatx80 a, float_status *status)
     if (floatx80_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    if ( a.low >> 63 ) {
+    if (a.low >> 63) {
         z.sign = a.high >> 15;
         z.low = 0;
         z.high = a.low << 1;
@@ -1026,8 +1027,8 @@ static floatx80 commonNaNToFloatx80(commonNaNT a, float_status *status)
     }
 
     if (a.high >> 1) {
-        z.low = LIT64( 0x8000000000000000 ) | a.high >> 1;
-        z.high = ( ( (uint16_t) a.sign )<<15 ) | 0x7FFF;
+        z.low = LIT64(0x8000000000000000) | a.high >> 1;
+        z.high = (((uint16_t)a.sign) << 15) | 0x7FFF;
     } else {
         z = floatx80_default_nan(status);
     }
@@ -1094,12 +1095,12 @@ int float128_is_signaling_nan(float128 a_, float_status *status)
 int float128_is_quiet_nan(float128 a, float_status *status)
 {
     if (status->snan_bit_is_one) {
-        return (((a.high >> 47) & 0xffff) == 0xfffe)
-           && (a.low || (a.high & 0x00007fffffffffffULL));
+        return (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & 0x00007FFFFFFFFFFFULL));
     } else {
         return
-            ((a.high << 1) >= 0xffff000000000000ULL)
-            && (a.low || (a.high & 0x0000ffffffffffffULL));
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
     }
 }
 
@@ -1112,12 +1113,12 @@ int float128_is_signaling_nan(float128 a, float_status *status)
 {
     if (status->snan_bit_is_one) {
         return
-            ((a.high << 1) >= 0xffff000000000000ULL)
-            && (a.low || (a.high & 0x0000ffffffffffffULL));
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
     } else {
         return
-               ( ( ( a.high>>47 ) & 0xFFFF ) == 0xFFFE )
-            && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
+               (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & LIT64(0x00007FFFFFFFFFFF)));
     }
 }
 #endif
@@ -1153,8 +1154,8 @@ static commonNaNT float128ToCommonNaN(float128 a, float_status *status)
     if (float128_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = a.high>>63;
-    shortShift128Left( a.high, a.low, 16, &z.high, &z.low );
+    z.sign = a.high >> 63;
+    shortShift128Left(a.high, a.low, 16, &z.high, &z.low);
     return z;
 }
 
@@ -1171,8 +1172,8 @@ static float128 commonNaNToFloat128(commonNaNT a, float_status *status)
         return float128_default_nan(status);
     }
 
-    shift128Right( a.high, a.low, 16, &z.high, &z.low );
-    z.high |= ( ( (uint64_t) a.sign )<<63 ) | LIT64( 0x7FFF000000000000 );
+    shift128Right(a.high, a.low, 16, &z.high, &z.low);
+    z.high |= (((uint64_t)a.sign) << 63) | LIT64(0x7FFF000000000000);
     return z;
 }
 
@@ -1201,9 +1202,9 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
         return float128_default_nan(status);
     }
 
-    if (lt128(a.high<<1, a.low, b.high<<1, b.low)) {
+    if (lt128(a.high << 1, a.low, b.high << 1, b.low)) {
         aIsLargerSignificand = 0;
-    } else if (lt128(b.high<<1, b.low, a.high<<1, a.low)) {
+    } else if (lt128(b.high << 1, b.low, a.high << 1, a.low)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (a.high < b.high) ? 1 : 0;
-- 
1.9.1

