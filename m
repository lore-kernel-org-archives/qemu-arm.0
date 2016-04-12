Received: by 10.25.208.211 with SMTP id h202csp1987796lfg;
        Tue, 12 Apr 2016 05:59:28 -0700 (PDT)
X-Received: by 10.140.32.100 with SMTP id g91mr3539650qgg.47.1460465963212;
        Tue, 12 Apr 2016 05:59:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si9163624qgx.33.2016.04.12.05.59.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Apr 2016 05:59:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apxuc-0001dI-2b
	for alex.bennee@linaro.org; Tue, 12 Apr 2016 08:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtf-000862-I0
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtc-0006vJ-TO
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43682 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apxtc-0006um-EZ; Tue, 12 Apr 2016 08:58:20 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id B07F81A456B;
	Tue, 12 Apr 2016 14:58:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 7CD891A224D;
	Tue, 12 Apr 2016 14:58:17 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Apr 2016 14:58:07 +0200
Message-Id: <1460465891-6142-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v4 5/9] softfloat: Clean up white spaces in
 softfloat-specialize.h
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
Cc: proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, miodrag.dinic@imgtec.com,
	pbonzini@redhat.com, gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com,
	afaerber@suse.de, aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Dden+l07ADr

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

As the development of SoftFloat library took places, many contributors
had different code styles, and the code was left with inconsistent style,
difficult to read, and hard to maintain.

This patch will make spaces around shift operators and braces consistent
within file fpu/softfloat-specialize.h.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h |   94 ++++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index a5680e0..aa2f793 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -283,7 +283,7 @@ static commonNaNT float16ToCommonNaN(float16 a, float_status *status)
     }
     z.sign = float16_val(a) >> 15;
     z.low = 0;
-    z.high = ((uint64_t) float16_val(a))<<54;
+    z.high = ((uint64_t) float16_val(a)) << 54;
     return z;
 }
 
@@ -345,7 +345,7 @@ int float32_is_signaling_nan( float32 a_, float_status *status )
     if (status->snan_bit_is_one) {
         return ((uint32_t)(a << 1) >= 0xFF800000);
     } else {
-        return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
+        return (((a >> 22) & 0x1FF) == 0x1FE) && (a & 0x003FFFFF);
     }
 }
 #endif
@@ -382,9 +382,9 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
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
 
@@ -395,7 +395,7 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
 
 static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 {
-    uint32_t mantissa = a.high>>41;
+    uint32_t mantissa = a.high >> 41;
 
     if (status->default_nan_mode) {
         return float32_default_nan(status);
@@ -403,7 +403,7 @@ static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 
     if ( mantissa ) {
         return make_float32(
-            ( ( (uint32_t) a.sign )<<31 ) | 0x7F800000 | ( a.high>>41 ) );
+            (((uint32_t)a.sign) << 31) | 0x7F800000 | (a.high >> 41));
     } else {
         return float32_default_nan(status);
     }
@@ -656,10 +656,10 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
     flag aIsLargerSignificand;
     uint32_t av, bv;
 
-    aIsQuietNaN = float32_is_quiet_nan( a, status );
-    aIsSignalingNaN = float32_is_signaling_nan( a, status );
-    bIsQuietNaN = float32_is_quiet_nan( b, status );
-    bIsSignalingNaN = float32_is_signaling_nan( b, status );
+    aIsQuietNaN = float32_is_quiet_nan(a, status);
+    aIsSignalingNaN = float32_is_signaling_nan(a, status);
+    bIsQuietNaN = float32_is_quiet_nan(b, status);
+    bIsSignalingNaN = float32_is_signaling_nan(b, status);
     av = float32_val(a);
     bv = float32_val(b);
 
@@ -670,9 +670,9 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
     if (status->default_nan_mode)
         return float32_default_nan(status);
 
-    if ((uint32_t)(av<<1) < (uint32_t)(bv<<1)) {
+    if ((uint32_t)(av << 1) < (uint32_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint32_t)(bv<<1) < (uint32_t)(av<<1)) {
+    } else if ((uint32_t)(bv << 1) < (uint32_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -777,8 +777,8 @@ int float64_is_signaling_nan( float64 a_, float_status *status )
         return ((a << 1) >= 0xFFF0000000000000ULL);
     } else {
         return
-               ( ( ( a>>51 ) & 0xFFF ) == 0xFFE )
-            && ( a & LIT64( 0x0007FFFFFFFFFFFF ) );
+               (((a >> 51) & 0xFFF) == 0xFFE)
+            && (a & LIT64( 0x0007FFFFFFFFFFFF ));
     }
 }
 #endif
@@ -815,9 +815,9 @@ static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
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
 
@@ -828,7 +828,7 @@ static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
 
 static float64 commonNaNToFloat64(commonNaNT a, float_status *status)
 {
-    uint64_t mantissa = a.high>>12;
+    uint64_t mantissa = a.high >> 12;
 
     if (status->default_nan_mode) {
         return float64_default_nan(status);
@@ -836,9 +836,9 @@ static float64 commonNaNToFloat64(commonNaNT a, float_status *status)
 
     if ( mantissa ) {
         return make_float64(
-              ( ( (uint64_t) a.sign )<<63 )
+              (((uint64_t)a.sign) << 63)
             | LIT64( 0x7FF0000000000000 )
-            | ( a.high>>12 ));
+            | (a.high >> 12));
     } else {
         return float64_default_nan(status);
     }
@@ -856,10 +856,10 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
     flag aIsLargerSignificand;
     uint64_t av, bv;
 
-    aIsQuietNaN = float64_is_quiet_nan( a, status );
-    aIsSignalingNaN = float64_is_signaling_nan( a, status );
-    bIsQuietNaN = float64_is_quiet_nan( b, status );
-    bIsSignalingNaN = float64_is_signaling_nan( b, status );
+    aIsQuietNaN = float64_is_quiet_nan(a, status);
+    aIsSignalingNaN = float64_is_signaling_nan(a, status);
+    bIsQuietNaN = float64_is_quiet_nan(b, status);
+    bIsSignalingNaN = float64_is_signaling_nan(b, status);
     av = float64_val(a);
     bv = float64_val(b);
 
@@ -870,9 +870,9 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
     if (status->default_nan_mode)
         return float64_default_nan(status);
 
-    if ((uint64_t)(av<<1) < (uint64_t)(bv<<1)) {
+    if ((uint64_t)(av << 1) < (uint64_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint64_t)(bv<<1) < (uint64_t)(av<<1)) {
+    } else if ((uint64_t)(bv << 1) < (uint64_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -965,8 +965,8 @@ int floatx80_is_quiet_nan( floatx80 a, float_status *status )
             && (aLow << 1)
             && (a.low == aLow);
     } else {
-        return ( ( a.high & 0x7FFF ) == 0x7FFF )
-            && (LIT64( 0x8000000000000000 ) <= ((uint64_t) ( a.low<<1 )));
+        return ((a.high & 0x7FFF) == 0x7FFF)
+            && (LIT64( 0x8000000000000000 ) <= ((uint64_t)(a.low << 1)));
     }
 }
 
@@ -986,9 +986,9 @@ int floatx80_is_signaling_nan( floatx80 a, float_status *status )
 
         aLow = a.low & ~ LIT64( 0x4000000000000000 );
         return
-               ( ( a.high & 0x7FFF ) == 0x7FFF )
-            && (uint64_t) ( aLow<<1 )
-            && ( a.low == aLow );
+               ((a.high & 0x7FFF) == 0x7FFF)
+            && (uint64_t)(aLow << 1)
+            && (a.low == aLow);
     }
 }
 #endif
@@ -1053,7 +1053,7 @@ static floatx80 commonNaNToFloatx80(commonNaNT a, float_status *status)
 
     if (a.high >> 1) {
         z.low = LIT64( 0x8000000000000000 ) | a.high >> 1;
-        z.high = ( ( (uint16_t) a.sign )<<15 ) | 0x7FFF;
+        z.high = (((uint16_t)a.sign) << 15) | 0x7FFF;
     } else {
         z = floatx80_default_nan(status);
     }
@@ -1072,10 +1072,10 @@ static floatx80 propagateFloatx80NaN(floatx80 a, floatx80 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
 
-    aIsQuietNaN = floatx80_is_quiet_nan( a, status );
-    aIsSignalingNaN = floatx80_is_signaling_nan( a, status );
-    bIsQuietNaN = floatx80_is_quiet_nan( b, status );
-    bIsSignalingNaN = floatx80_is_signaling_nan( b, status );
+    aIsQuietNaN = floatx80_is_quiet_nan(a, status);
+    aIsSignalingNaN = floatx80_is_signaling_nan(a, status);
+    bIsQuietNaN = floatx80_is_quiet_nan(b, status);
+    bIsSignalingNaN = floatx80_is_signaling_nan(b, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -1142,8 +1142,8 @@ int float128_is_signaling_nan( float128 a, float_status *status )
             && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
     } else {
         return
-               ( ( ( a.high>>47 ) & 0xFFFF ) == 0xFFFE )
-            && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
+               (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & LIT64( 0x00007FFFFFFFFFFF )));
     }
 }
 #endif
@@ -1179,8 +1179,8 @@ static commonNaNT float128ToCommonNaN(float128 a, float_status *status)
     if (float128_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = a.high>>63;
-    shortShift128Left( a.high, a.low, 16, &z.high, &z.low );
+    z.sign = a.high >> 63;
+    shortShift128Left(a.high, a.low, 16, &z.high, &z.low);
     return z;
 }
 
@@ -1197,8 +1197,8 @@ static float128 commonNaNToFloat128(commonNaNT a, float_status *status)
         return float128_default_nan(status);
     }
 
-    shift128Right( a.high, a.low, 16, &z.high, &z.low );
-    z.high |= ( ( (uint64_t) a.sign )<<63 ) | LIT64( 0x7FFF000000000000 );
+    shift128Right(a.high, a.low, 16, &z.high, &z.low);
+    z.high |= (((uint64_t)a.sign) << 63) | LIT64( 0x7FFF000000000000 );
     return z;
 }
 
@@ -1214,10 +1214,10 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
 
-    aIsQuietNaN = float128_is_quiet_nan( a, status );
-    aIsSignalingNaN = float128_is_signaling_nan( a, status );
-    bIsQuietNaN = float128_is_quiet_nan( b, status );
-    bIsSignalingNaN = float128_is_signaling_nan( b, status );
+    aIsQuietNaN = float128_is_quiet_nan(a, status);
+    aIsSignalingNaN = float128_is_signaling_nan(a, status);
+    bIsQuietNaN = float128_is_quiet_nan(b, status);
+    bIsSignalingNaN = float128_is_signaling_nan(b, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -1227,9 +1227,9 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
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
1.7.9.5

