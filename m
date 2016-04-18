Received: by 10.25.208.194 with SMTP id h185csp1436949lfg;
        Mon, 18 Apr 2016 09:07:51 -0700 (PDT)
X-Received: by 10.140.33.229 with SMTP id j92mr43559292qgj.20.1460995671826;
        Mon, 18 Apr 2016 09:07:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o24si19426838qko.113.2016.04.18.09.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:07:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40389 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBiI-0003zq-Ec
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:07:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBex-0005oA-6K
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBem-0005Xs-96
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54380 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBel-0005U2-Co; Mon, 18 Apr 2016 12:04:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 5743F1A4650;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 1955B1A463B;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:34 +0200
Message-Id: <1460995422-14373-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 1/9] softfloat: Implement
 run-time-configurable meaning of signaling NaN bit
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
X-TUID: zPGxaWHjMbZ2

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch modifies SoftFloat library so that it can be configured in
run-time in relation to the meaning of signaling NaN bit, while, at the
same time, strictly preserving its behavior on all existing platforms.

Background:

In floating-point calculations, there is a need for denoting undefined or
unrepresentable values. This is achieved by defining certain floating-point
numerical values to be NaNs (which stands for "not a number"). For additional
reasons, virtually all modern floating-point unit implementations use two
kinds of NaNs: quiet and signaling. The binary representations of these two
kinds of NaNs, as a rule, differ only in one bit (that bit is, traditionally,
the first bit of mantissa).

Up to 2008, standards for floating-point did not specify all details about
binary representation of NaNs. More specifically, the meaning of the bit
that is used for distinguishing between signaling and quiet NaNs was not
strictly prescribed. (IEEE 754-2008 was the first floating-point standard
that defined that meaning clearly, see [1], p. 35) As a result, different
platforms took different approaches, and that presented considerable
challenge for multi-platform emulators like QEMU.

Mips platform represents the most complex case among QEMU-supported
platforms regarding signaling NaN bit. Up to the Release 6 of Mips
architecture, "1" in signaling NaN bit denoted signaling NaN, which is
opposite to IEEE 754-2008 standard. From Release 6 on, Mips architecture
adopted IEEE standard prescription, and "0" denotes signaling NaN. On top of
that, Mips architecture for SIMD (also known as MSA, or vector instructions)
also specifies signaling bit in accordance to IEEE standard. MSA unit can be
implemented with both pre-Release 6 and Release 6 main processor units.

QEMU uses SoftFloat library to implement various floating-point-related
instructions on all platforms. The current QEMU implementation allows for
defining meaning of signaling NaN bit during build time, and is implemented
via preprocessor macro called SNAN_BIT_IS_ONE.

On the other hand, the change in this patch enables SoftFloat library to be
configured in run-time. This configuration is meant to occur during CPU
initialization, at the moment when it is definitely known what desired
behavior for particular CPU (or any additional FPUs) is.

The change is implemented so that it is consistent with existing
implementation of similar cases. This means that structure float_status is
used for passing the information about desired signaling NaN bit on each
invocation of SoftFloat functions. The additional field in float_status is
called snan_bit_is_one, which supersedes macro SNAN_BIT_IS_ONE.

IMPORTANT:

This change is not meant to create any change in emulator behavior or
functionality on any platform. It just provides the means for SoftFloat
library to be used in a more flexible way - in other words, it will just
prepare SoftFloat library for usage related to Mips platform and its
specifics regarding signaling bit meaning, which is done in some of
subsequent patches from this series.

Further break down of changes:

  1) Added field snan_bit_is_one to the structure float_status, and
     correspondent setter function set_snan_bit_is_one().

  2) Constants <float16|float32|float64|floatx80|float128>_default_nan
     (used both internally and externally) converted to functions
     <float16|float32|float64|floatx80|float128>_default_nan(float_status*).
     This is necessary since they are dependent on signaling bit meaning.
     At the same time, for the sake of code cleanup and simplicity, constants
     <floatx80|float128>_default_nan_<low|high> (used only internally within
     SoftFloat library) are removed, as not needed.

  3) Added a float_status* argument to SoftFloat library functions
     XXX_is_quiet_nan(XXX a_), XXX_is_signaling_nan(XXX a_),
     XXX_maybe_silence_nan(XXX a_). This argument must be present in
     order to enable correct invocation of new version of functions
     XXX_default_nan(). (XXX is <float16|float32|float64|floatx80|float128>
     here)

  4) Updated code for all platforms to reflect changes in SoftFloat library.
     This change is twofolds: it includes modifications of SoftFloat library
     functions invocations, and an addition of invocation of function
     set_snan_bit_is_one() during CPU initialization, with arguments that
     are appropriate for each particular platform. It was established that
     all platforms zero their main CPU data structures, so snan_bit_is_one(0)
     in appropriate places is not added, as it is not needed.

[1] "IEEE Standard for Floating-Point Arithmetic",
    IEEE Computer Society, August 29, 2008.

Tested-by: Bastian Koppelmann <address@hidden> (TriCore part)
Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h    | 611 ++++++++++++++++++++----------------------
 fpu/softfloat.c               | 172 ++++++------
 include/fpu/softfloat.h       |  45 ++--
 target-arm/helper-a64.c       |  14 +-
 target-arm/helper.c           |  40 +--
 target-m68k/helper.c          |   6 +-
 target-microblaze/op_helper.c |   6 +-
 target-mips/cpu.h             |   5 +
 target-mips/helper.h          |   4 +-
 target-mips/msa_helper.c      |  98 ++++---
 target-mips/op_helper.c       |  18 +-
 target-mips/translate.c       |   5 +-
 target-mips/translate_init.c  |   2 +
 target-ppc/fpu_helper.c       | 120 +++++----
 target-s390x/fpu_helper.c     |  28 +-
 target-s390x/helper.h         |   6 +-
 target-s390x/translate.c      |   6 +-
 target-sh4/cpu.c              |   1 +
 target-sparc/translate.c      |   2 +-
 target-unicore32/cpu.c        |   2 +
 20 files changed, 600 insertions(+), 591 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index a4cbdad..e03a529 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -79,16 +79,6 @@ this code that are retained.
  * version 2 or later. See the COPYING file in the top-level directory.
  */
 
-/* Does the target distinguish signaling NaNs from non-signaling NaNs
- * by setting the most significant bit of the mantissa for a signaling NaN?
- * (The more common choice is to have it be zero for SNaN and one for QNaN.)
- */
-#if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-#define SNAN_BIT_IS_ONE 1
-#else
-#define SNAN_BIT_IS_ONE 0
-#endif
-
 #if defined(TARGET_XTENSA)
 /* Define for architectures which deviate from IEEE in not supporting
  * signaling NaNs (so all NaNs are treated as quiet).
@@ -99,73 +89,94 @@ this code that are retained.
 /*----------------------------------------------------------------------------
 | The pattern for a default generated half-precision NaN.
 *----------------------------------------------------------------------------*/
+float16 float16_default_nan(float_status *status)
+{
 #if defined(TARGET_ARM)
-const float16 float16_default_nan = const_float16(0x7E00);
-#elif SNAN_BIT_IS_ONE
-const float16 float16_default_nan = const_float16(0x7DFF);
+    return const_float16(0x7E00);
 #else
-const float16 float16_default_nan = const_float16(0xFE00);
+    if (status->snan_bit_is_one) {
+        return const_float16(0x7DFF);
+    } else {
+        return const_float16(0xFE00);
+    }
 #endif
+}
 
 /*----------------------------------------------------------------------------
 | The pattern for a default generated single-precision NaN.
 *----------------------------------------------------------------------------*/
+float32 float32_default_nan(float_status *status)
+{
 #if defined(TARGET_SPARC)
-const float32 float32_default_nan = const_float32(0x7FFFFFFF);
+    return const_float32(0x7FFFFFFF);
 #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA) || \
       defined(TARGET_XTENSA) || defined(TARGET_S390X) || defined(TARGET_TRICORE)
-const float32 float32_default_nan = const_float32(0x7FC00000);
-#elif SNAN_BIT_IS_ONE
-const float32 float32_default_nan = const_float32(0x7FBFFFFF);
+    return const_float32(0x7FC00000);
 #else
-const float32 float32_default_nan = const_float32(0xFFC00000);
+    if (status->snan_bit_is_one) {
+        return const_float32(0x7FBFFFFF);
+    } else {
+        return const_float32(0xFFC00000);
+    }
 #endif
+}
 
 /*----------------------------------------------------------------------------
 | The pattern for a default generated double-precision NaN.
 *----------------------------------------------------------------------------*/
+float64 float64_default_nan(float_status *status)
+{
 #if defined(TARGET_SPARC)
-const float64 float64_default_nan = const_float64(LIT64( 0x7FFFFFFFFFFFFFFF ));
+    return const_float64(LIT64(0x7FFFFFFFFFFFFFFF));
 #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA) || \
       defined(TARGET_S390X)
-const float64 float64_default_nan = const_float64(LIT64( 0x7FF8000000000000 ));
-#elif SNAN_BIT_IS_ONE
-const float64 float64_default_nan = const_float64(LIT64(0x7FF7FFFFFFFFFFFF));
+    return const_float64(LIT64(0x7FF8000000000000));
 #else
-const float64 float64_default_nan = const_float64(LIT64( 0xFFF8000000000000 ));
+    if (status->snan_bit_is_one) {
+        return const_float64(LIT64(0x7FF7FFFFFFFFFFFF));
+    } else {
+        return const_float64(LIT64(0xFFF8000000000000));
+    }
 #endif
+}
 
 /*----------------------------------------------------------------------------
 | The pattern for a default generated extended double-precision NaN.
 *----------------------------------------------------------------------------*/
-#if SNAN_BIT_IS_ONE
-#define floatx80_default_nan_high 0x7FFF
-#define floatx80_default_nan_low  LIT64(0xBFFFFFFFFFFFFFFF)
-#else
-#define floatx80_default_nan_high 0xFFFF
-#define floatx80_default_nan_low  LIT64( 0xC000000000000000 )
-#endif
+floatx80 floatx80_default_nan(float_status *status)
+{
+    floatx80 r;
 
-const floatx80 floatx80_default_nan
-    = make_floatx80_init(floatx80_default_nan_high, floatx80_default_nan_low);
+    if (status->snan_bit_is_one) {
+        r.low = LIT64(0xBFFFFFFFFFFFFFFF);
+        r.high = 0x7FFF;
+    } else {
+        r.low = LIT64(0xC000000000000000);
+        r.high = 0xFFFF;
+    }
+    return r;
+}
 
 /*----------------------------------------------------------------------------
-| The pattern for a default generated quadruple-precision NaN.  The `high' and
-| `low' values hold the most- and least-significant bits, respectively.
+| The pattern for a default generated quadruple-precision NaN.
 *----------------------------------------------------------------------------*/
-#if SNAN_BIT_IS_ONE
-#define float128_default_nan_high LIT64(0x7FFF7FFFFFFFFFFF)
-#define float128_default_nan_low  LIT64(0xFFFFFFFFFFFFFFFF)
-#elif defined(TARGET_S390X)
-#define float128_default_nan_high LIT64( 0x7FFF800000000000 )
-#define float128_default_nan_low  LIT64( 0x0000000000000000 )
+float128 float128_default_nan(float_status *status)
+{
+    float128 r;
+
+    if (status->snan_bit_is_one) {
+        r.low = LIT64(0xFFFFFFFFFFFFFFFF);
+        r.high = LIT64(0x7FFF7FFFFFFFFFFF);
+    } else {
+        r.low = LIT64(0x0000000000000000);
+#if defined(TARGET_S390X)
+        r.high = LIT64(0x7FFF800000000000);
 #else
-#define float128_default_nan_high LIT64( 0xFFFF800000000000 )
-#define float128_default_nan_low  LIT64( 0x0000000000000000 )
+        r.high = LIT64(0xFFFF800000000000);
 #endif
-
-const float128 float128_default_nan
-    = make_float128_init(float128_default_nan_high, float128_default_nan_low);
+    }
+    return r;
+}
 
 /*----------------------------------------------------------------------------
 | Raises the exceptions specified by `flags'.  Floating-point traps can be
@@ -188,12 +199,12 @@ typedef struct {
 } commonNaNT;
 
 #ifdef NO_SIGNALING_NANS
-int float16_is_quiet_nan(float16 a_)
+int float16_is_quiet_nan(float16 a_, float_status *status)
 {
     return float16_is_any_nan(a_);
 }
 
-int float16_is_signaling_nan(float16 a_)
+int float16_is_signaling_nan(float16 a_, float_status *status)
 {
     return 0;
 }
@@ -203,14 +214,14 @@ int float16_is_signaling_nan(float16 a_)
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float16_is_quiet_nan(float16 a_)
+int float16_is_quiet_nan(float16 a_, float_status *status)
 {
     uint16_t a = float16_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
-#else
-    return ((a & ~0x8000) >= 0x7c80);
-#endif
+    if (status->snan_bit_is_one) {
+        return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
+    } else {
+        return ((a & ~0x8000) >= 0x7C80);
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -218,14 +229,14 @@ int float16_is_quiet_nan(float16 a_)
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float16_is_signaling_nan(float16 a_)
+int float16_is_signaling_nan(float16 a_, float_status *status)
 {
     uint16_t a = float16_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((a & ~0x8000) >= 0x7c80);
-#else
-    return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
-#endif
+    if (status->snan_bit_is_one) {
+        return ((a & ~0x8000) >= 0x7C80);
+    } else {
+        return (((a >> 9) & 0x3F) == 0x3E) && (a & 0x1FF);
+    }
 }
 #endif
 
@@ -233,20 +244,16 @@ int float16_is_signaling_nan(float16 a_)
 | Returns a quiet NaN if the half-precision floating point value `a' is a
 | signaling NaN; otherwise returns `a'.
 *----------------------------------------------------------------------------*/
-float16 float16_maybe_silence_nan(float16 a_)
+float16 float16_maybe_silence_nan(float16 a_, float_status *status)
 {
-    if (float16_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-        return float16_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint16_t a = float16_val(a_);
-        a |= (1 << 9);
-        return make_float16(a);
-#endif
+    if (float16_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one) {
+            return float16_default_nan(status);
+        } else {
+            uint16_t a = float16_val(a_);
+            a |= (1 << 9);
+            return make_float16(a);
+        }
     }
     return a_;
 }
@@ -261,12 +268,12 @@ static commonNaNT float16ToCommonNaN(float16 a, float_status *status)
 {
     commonNaNT z;
 
-    if (float16_is_signaling_nan(a)) {
+    if (float16_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     z.sign = float16_val(a) >> 15;
     z.low = 0;
-    z.high = ((uint64_t) float16_val(a))<<54;
+    z.high = ((uint64_t) float16_val(a)) << 54;
     return z;
 }
 
@@ -277,27 +284,27 @@ static commonNaNT float16ToCommonNaN(float16 a, float_status *status)
 
 static float16 commonNaNToFloat16(commonNaNT a, float_status *status)
 {
-    uint16_t mantissa = a.high>>54;
+    uint16_t mantissa = a.high >> 54;
 
     if (status->default_nan_mode) {
-        return float16_default_nan;
+        return float16_default_nan(status);
     }
 
     if (mantissa) {
         return make_float16(((((uint16_t) a.sign) << 15)
                              | (0x1F << 10) | mantissa));
     } else {
-        return float16_default_nan;
+        return float16_default_nan(status);
     }
 }
 
 #ifdef NO_SIGNALING_NANS
-int float32_is_quiet_nan(float32 a_)
+int float32_is_quiet_nan(float32 a_, float_status *status)
 {
     return float32_is_any_nan(a_);
 }
 
-int float32_is_signaling_nan(float32 a_)
+int float32_is_signaling_nan(float32 a_, float_status *status)
 {
     return 0;
 }
@@ -307,14 +314,14 @@ int float32_is_signaling_nan(float32 a_)
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float32_is_quiet_nan( float32 a_ )
+int float32_is_quiet_nan(float32 a_, float_status *status)
 {
     uint32_t a = float32_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 22) & 0x1ff) == 0x1fe) && (a & 0x003fffff);
-#else
-    return ((uint32_t)(a << 1) >= 0xff800000);
-#endif
+    if (status->snan_bit_is_one) {
+        return (((a >> 22) & 0x1FF) == 0x1FE) && (a & 0x003FFFFF);
+    } else {
+        return ((uint32_t)(a << 1) >= 0xFF800000);
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -322,14 +329,14 @@ int float32_is_quiet_nan( float32 a_ )
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float32_is_signaling_nan( float32 a_ )
+int float32_is_signaling_nan(float32 a_, float_status *status)
 {
     uint32_t a = float32_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((uint32_t)(a << 1) >= 0xff800000);
-#else
-    return ( ( ( a>>22 ) & 0x1FF ) == 0x1FE ) && ( a & 0x003FFFFF );
-#endif
+    if (status->snan_bit_is_one) {
+        return ((uint32_t)(a << 1) >= 0xFF800000);
+    } else {
+        return (((a >> 22) & 0x1FF) == 0x1FE) && (a & 0x003FFFFF);
+    }
 }
 #endif
 
@@ -338,20 +345,16 @@ int float32_is_signaling_nan( float32 a_ )
 | signaling NaN; otherwise returns `a'.
 *----------------------------------------------------------------------------*/
 
-float32 float32_maybe_silence_nan( float32 a_ )
+float32 float32_maybe_silence_nan(float32 a_, float_status *status)
 {
-    if (float32_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-        return float32_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint32_t a = float32_val(a_);
-        a |= (1 << 22);
-        return make_float32(a);
-#endif
+    if (float32_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one) {
+            return float32_default_nan(status);
+        } else {
+            uint32_t a = float32_val(a_);
+            a |= (1 << 22);
+            return make_float32(a);
+        }
     }
     return a_;
 }
@@ -366,12 +369,12 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
 {
     commonNaNT z;
 
-    if (float32_is_signaling_nan(a)) {
+    if (float32_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = float32_val(a)>>31;
+    z.sign = float32_val(a) >> 31;
     z.low = 0;
-    z.high = ( (uint64_t) float32_val(a) )<<41;
+    z.high = ((uint64_t)float32_val(a)) << 41;
     return z;
 }
 
@@ -382,17 +385,18 @@ static commonNaNT float32ToCommonNaN(float32 a, float_status *status)
 
 static float32 commonNaNToFloat32(commonNaNT a, float_status *status)
 {
-    uint32_t mantissa = a.high>>41;
+    uint32_t mantissa = a.high >> 41;
 
     if (status->default_nan_mode) {
-        return float32_default_nan;
+        return float32_default_nan(status);
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
@@ -494,11 +498,10 @@ static int pickNaN(flag aIsQNaN, flag aIsSNaN, flag bIsQNaN, flag bIsSNaN,
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
@@ -626,10 +629,10 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
     flag aIsLargerSignificand;
     uint32_t av, bv;
 
-    aIsQuietNaN = float32_is_quiet_nan( a );
-    aIsSignalingNaN = float32_is_signaling_nan( a );
-    bIsQuietNaN = float32_is_quiet_nan( b );
-    bIsSignalingNaN = float32_is_signaling_nan( b );
+    aIsQuietNaN = float32_is_quiet_nan(a, status);
+    aIsSignalingNaN = float32_is_signaling_nan(a, status);
+    bIsQuietNaN = float32_is_quiet_nan(b, status);
+    bIsSignalingNaN = float32_is_signaling_nan(b, status);
     av = float32_val(a);
     bv = float32_val(b);
 
@@ -637,12 +640,13 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
         float_raise(float_flag_invalid, status);
     }
 
-    if (status->default_nan_mode)
-        return float32_default_nan;
+    if (status->default_nan_mode) {
+        return float32_default_nan(status);
+    }
 
-    if ((uint32_t)(av<<1) < (uint32_t)(bv<<1)) {
+    if ((uint32_t)(av << 1) < (uint32_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint32_t)(bv<<1) < (uint32_t)(av<<1)) {
+    } else if ((uint32_t)(bv << 1) < (uint32_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -650,9 +654,9 @@ static float32 propagateFloat32NaN(float32 a, float32 b, float_status *status)
 
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN,
                 aIsLargerSignificand)) {
-        return float32_maybe_silence_nan(b);
+        return float32_maybe_silence_nan(b, status);
     } else {
-        return float32_maybe_silence_nan(a);
+        return float32_maybe_silence_nan(a, status);
     }
 }
 
@@ -673,12 +677,12 @@ static float32 propagateFloat32MulAddNaN(float32 a, float32 b,
         cIsQuietNaN, cIsSignalingNaN;
     int which;
 
-    aIsQuietNaN = float32_is_quiet_nan(a);
-    aIsSignalingNaN = float32_is_signaling_nan(a);
-    bIsQuietNaN = float32_is_quiet_nan(b);
-    bIsSignalingNaN = float32_is_signaling_nan(b);
-    cIsQuietNaN = float32_is_quiet_nan(c);
-    cIsSignalingNaN = float32_is_signaling_nan(c);
+    aIsQuietNaN = float32_is_quiet_nan(a, status);
+    aIsSignalingNaN = float32_is_signaling_nan(a, status);
+    bIsQuietNaN = float32_is_quiet_nan(b, status);
+    bIsSignalingNaN = float32_is_signaling_nan(b, status);
+    cIsQuietNaN = float32_is_quiet_nan(c, status);
+    cIsSignalingNaN = float32_is_signaling_nan(c, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN | cIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -692,29 +696,29 @@ static float32 propagateFloat32MulAddNaN(float32 a, float32 b,
         /* Note that this check is after pickNaNMulAdd so that function
          * has an opportunity to set the Invalid flag.
          */
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
 
     switch (which) {
     case 0:
-        return float32_maybe_silence_nan(a);
+        return float32_maybe_silence_nan(a, status);
     case 1:
-        return float32_maybe_silence_nan(b);
+        return float32_maybe_silence_nan(b, status);
     case 2:
-        return float32_maybe_silence_nan(c);
+        return float32_maybe_silence_nan(c, status);
     case 3:
     default:
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
 }
 
 #ifdef NO_SIGNALING_NANS
-int float64_is_quiet_nan(float64 a_)
+int float64_is_quiet_nan(float64 a_, float_status *status)
 {
     return float64_is_any_nan(a_);
 }
 
-int float64_is_signaling_nan(float64 a_)
+int float64_is_signaling_nan(float64 a_, float_status *status)
 {
     return 0;
 }
@@ -724,15 +728,15 @@ int float64_is_signaling_nan(float64 a_)
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float64_is_quiet_nan( float64 a_ )
+int float64_is_quiet_nan(float64 a_, float_status *status)
 {
     uint64_t a = float64_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 51) & 0xfff) == 0xffe)
-           && (a & 0x0007ffffffffffffULL);
-#else
-    return ((a << 1) >= 0xfff0000000000000ULL);
-#endif
+    if (status->snan_bit_is_one) {
+        return (((a >> 51) & 0xFFF) == 0xFFE)
+               && (a & 0x0007FFFFFFFFFFFFULL);
+    } else {
+        return ((a << 1) >= 0xFFF0000000000000ULL);
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -740,16 +744,16 @@ int float64_is_quiet_nan( float64 a_ )
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float64_is_signaling_nan( float64 a_ )
+int float64_is_signaling_nan(float64 a_, float_status *status)
 {
     uint64_t a = float64_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((a << 1) >= 0xfff0000000000000ULL);
-#else
-    return
-           ( ( ( a>>51 ) & 0xFFF ) == 0xFFE )
-        && ( a & LIT64( 0x0007FFFFFFFFFFFF ) );
-#endif
+    if (status->snan_bit_is_one) {
+        return ((a << 1) >= 0xFFF0000000000000ULL);
+    } else {
+        return
+               (((a >> 51) & 0xFFF) == 0xFFE)
+            && (a & LIT64(0x0007FFFFFFFFFFFF));
+    }
 }
 #endif
 
@@ -758,20 +762,16 @@ int float64_is_signaling_nan( float64 a_ )
 | signaling NaN; otherwise returns `a'.
 *----------------------------------------------------------------------------*/
 
-float64 float64_maybe_silence_nan( float64 a_ )
+float64 float64_maybe_silence_nan(float64 a_, float_status *status)
 {
-    if (float64_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-        return float64_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint64_t a = float64_val(a_);
-        a |= LIT64( 0x0008000000000000 );
-        return make_float64(a);
-#endif
+    if (float64_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one) {
+            return float64_default_nan(status);
+        } else {
+            uint64_t a = float64_val(a_);
+            a |= LIT64(0x0008000000000000);
+            return make_float64(a);
+        }
     }
     return a_;
 }
@@ -786,12 +786,12 @@ static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
 {
     commonNaNT z;
 
-    if (float64_is_signaling_nan(a)) {
+    if (float64_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = float64_val(a)>>63;
+    z.sign = float64_val(a) >> 63;
     z.low = 0;
-    z.high = float64_val(a)<<12;
+    z.high = float64_val(a) << 12;
     return z;
 }
 
@@ -802,19 +802,20 @@ static commonNaNT float64ToCommonNaN(float64 a, float_status *status)
 
 static float64 commonNaNToFloat64(commonNaNT a, float_status *status)
 {
-    uint64_t mantissa = a.high>>12;
+    uint64_t mantissa = a.high >> 12;
 
     if (status->default_nan_mode) {
-        return float64_default_nan;
+        return float64_default_nan(status);
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
@@ -829,10 +830,10 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
     flag aIsLargerSignificand;
     uint64_t av, bv;
 
-    aIsQuietNaN = float64_is_quiet_nan( a );
-    aIsSignalingNaN = float64_is_signaling_nan( a );
-    bIsQuietNaN = float64_is_quiet_nan( b );
-    bIsSignalingNaN = float64_is_signaling_nan( b );
+    aIsQuietNaN = float64_is_quiet_nan(a, status);
+    aIsSignalingNaN = float64_is_signaling_nan(a, status);
+    bIsQuietNaN = float64_is_quiet_nan(b, status);
+    bIsSignalingNaN = float64_is_signaling_nan(b, status);
     av = float64_val(a);
     bv = float64_val(b);
 
@@ -840,12 +841,13 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
         float_raise(float_flag_invalid, status);
     }
 
-    if (status->default_nan_mode)
-        return float64_default_nan;
+    if (status->default_nan_mode) {
+        return float64_default_nan(status);
+    }
 
-    if ((uint64_t)(av<<1) < (uint64_t)(bv<<1)) {
+    if ((uint64_t)(av << 1) < (uint64_t)(bv << 1)) {
         aIsLargerSignificand = 0;
-    } else if ((uint64_t)(bv<<1) < (uint64_t)(av<<1)) {
+    } else if ((uint64_t)(bv << 1) < (uint64_t)(av << 1)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (av < bv) ? 1 : 0;
@@ -853,9 +855,9 @@ static float64 propagateFloat64NaN(float64 a, float64 b, float_status *status)
 
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN,
                 aIsLargerSignificand)) {
-        return float64_maybe_silence_nan(b);
+        return float64_maybe_silence_nan(b, status);
     } else {
-        return float64_maybe_silence_nan(a);
+        return float64_maybe_silence_nan(a, status);
     }
 }
 
@@ -876,12 +878,12 @@ static float64 propagateFloat64MulAddNaN(float64 a, float64 b,
         cIsQuietNaN, cIsSignalingNaN;
     int which;
 
-    aIsQuietNaN = float64_is_quiet_nan(a);
-    aIsSignalingNaN = float64_is_signaling_nan(a);
-    bIsQuietNaN = float64_is_quiet_nan(b);
-    bIsSignalingNaN = float64_is_signaling_nan(b);
-    cIsQuietNaN = float64_is_quiet_nan(c);
-    cIsSignalingNaN = float64_is_signaling_nan(c);
+    aIsQuietNaN = float64_is_quiet_nan(a, status);
+    aIsSignalingNaN = float64_is_signaling_nan(a, status);
+    bIsQuietNaN = float64_is_quiet_nan(b, status);
+    bIsSignalingNaN = float64_is_signaling_nan(b, status);
+    cIsQuietNaN = float64_is_quiet_nan(c, status);
+    cIsSignalingNaN = float64_is_signaling_nan(c, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN | cIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -895,29 +897,29 @@ static float64 propagateFloat64MulAddNaN(float64 a, float64 b,
         /* Note that this check is after pickNaNMulAdd so that function
          * has an opportunity to set the Invalid flag.
          */
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
 
     switch (which) {
     case 0:
-        return float64_maybe_silence_nan(a);
+        return float64_maybe_silence_nan(a, status);
     case 1:
-        return float64_maybe_silence_nan(b);
+        return float64_maybe_silence_nan(b, status);
     case 2:
-        return float64_maybe_silence_nan(c);
+        return float64_maybe_silence_nan(c, status);
     case 3:
     default:
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
 }
 
 #ifdef NO_SIGNALING_NANS
-int floatx80_is_quiet_nan(floatx80 a_)
+int floatx80_is_quiet_nan(floatx80 a_, float_status *status)
 {
     return floatx80_is_any_nan(a_);
 }
 
-int floatx80_is_signaling_nan(floatx80 a_)
+int floatx80_is_signaling_nan(floatx80 a_, float_status *status)
 {
     return 0;
 }
@@ -928,19 +930,19 @@ int floatx80_is_signaling_nan(floatx80 a_)
 | function for other types as floatx80 has an explicit bit.
 *----------------------------------------------------------------------------*/
 
-int floatx80_is_quiet_nan( floatx80 a )
+int floatx80_is_quiet_nan(floatx80 a, float_status *status)
 {
-#if SNAN_BIT_IS_ONE
-    uint64_t aLow;
+    if (status->snan_bit_is_one) {
+        uint64_t aLow;
 
-    aLow = a.low & ~0x4000000000000000ULL;
-    return ((a.high & 0x7fff) == 0x7fff)
-        && (aLow << 1)
-        && (a.low == aLow);
-#else
-    return ( ( a.high & 0x7FFF ) == 0x7FFF )
-        && (LIT64( 0x8000000000000000 ) <= ((uint64_t) ( a.low<<1 )));
-#endif
+        aLow = a.low & ~0x4000000000000000ULL;
+        return ((a.high & 0x7FFF) == 0x7FFF)
+            && (aLow << 1)
+            && (a.low == aLow);
+    } else {
+        return ((a.high & 0x7FFF) == 0x7FFF)
+            && (LIT64(0x8000000000000000) <= ((uint64_t)(a.low << 1)));
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -949,20 +951,20 @@ int floatx80_is_quiet_nan( floatx80 a )
 | function for other types as floatx80 has an explicit bit.
 *----------------------------------------------------------------------------*/
 
-int floatx80_is_signaling_nan( floatx80 a )
+int floatx80_is_signaling_nan(floatx80 a, float_status *status)
 {
-#if SNAN_BIT_IS_ONE
-    return ((a.high & 0x7fff) == 0x7fff)
-        && ((a.low << 1) >= 0x8000000000000000ULL);
-#else
-    uint64_t aLow;
+    if (status->snan_bit_is_one) {
+        return ((a.high & 0x7FFF) == 0x7FFF)
+            && ((a.low << 1) >= 0x8000000000000000ULL);
+    } else {
+        uint64_t aLow;
 
-    aLow = a.low & ~ LIT64( 0x4000000000000000 );
-    return
-           ( ( a.high & 0x7FFF ) == 0x7FFF )
-        && (uint64_t) ( aLow<<1 )
-        && ( a.low == aLow );
-#endif
+        aLow = a.low & ~LIT64(0x4000000000000000);
+        return
+               ((a.high & 0x7FFF) == 0x7FFF)
+            && (uint64_t) (aLow << 1)
+            && (a.low == aLow);
+    }
 }
 #endif
 
@@ -971,20 +973,15 @@ int floatx80_is_signaling_nan( floatx80 a )
 | `a' is a signaling NaN; otherwise returns `a'.
 *----------------------------------------------------------------------------*/
 
-floatx80 floatx80_maybe_silence_nan( floatx80 a )
+floatx80 floatx80_maybe_silence_nan(floatx80 a, float_status *status)
 {
-    if (floatx80_is_signaling_nan(a)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-        a.low = floatx80_default_nan_low;
-        a.high = floatx80_default_nan_high;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        a.low |= LIT64( 0xC000000000000000 );
-        return a;
-#endif
+    if (floatx80_is_signaling_nan(a, status)) {
+        if (status->snan_bit_is_one) {
+            a = floatx80_default_nan(status);
+        } else {
+            a.low |= LIT64(0xC000000000000000);
+            return a;
+        }
     }
     return a;
 }
@@ -997,19 +994,21 @@ floatx80 floatx80_maybe_silence_nan( floatx80 a )
 
 static commonNaNT floatx80ToCommonNaN(floatx80 a, float_status *status)
 {
+    floatx80 dflt;
     commonNaNT z;
 
-    if (floatx80_is_signaling_nan(a)) {
+    if (floatx80_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    if ( a.low >> 63 ) {
+    if (a.low >> 63) {
         z.sign = a.high >> 15;
         z.low = 0;
         z.high = a.low << 1;
     } else {
-        z.sign = floatx80_default_nan_high >> 15;
+        dflt = floatx80_default_nan(status);
+        z.sign = dflt.high >> 15;
         z.low = 0;
-        z.high = floatx80_default_nan_low << 1;
+        z.high = dflt.low << 1;
     }
     return z;
 }
@@ -1024,19 +1023,15 @@ static floatx80 commonNaNToFloatx80(commonNaNT a, float_status *status)
     floatx80 z;
 
     if (status->default_nan_mode) {
-        z.low = floatx80_default_nan_low;
-        z.high = floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
 
     if (a.high >> 1) {
-        z.low = LIT64( 0x8000000000000000 ) | a.high >> 1;
-        z.high = ( ( (uint16_t) a.sign )<<15 ) | 0x7FFF;
+        z.low = LIT64(0x8000000000000000) | a.high >> 1;
+        z.high = (((uint16_t)a.sign) << 15) | 0x7FFF;
     } else {
-        z.low = floatx80_default_nan_low;
-        z.high = floatx80_default_nan_high;
+        z = floatx80_default_nan(status);
     }
-
     return z;
 }
 
@@ -1052,19 +1047,17 @@ static floatx80 propagateFloatx80NaN(floatx80 a, floatx80 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
 
-    aIsQuietNaN = floatx80_is_quiet_nan( a );
-    aIsSignalingNaN = floatx80_is_signaling_nan( a );
-    bIsQuietNaN = floatx80_is_quiet_nan( b );
-    bIsSignalingNaN = floatx80_is_signaling_nan( b );
+    aIsQuietNaN = floatx80_is_quiet_nan(a, status);
+    aIsSignalingNaN = floatx80_is_signaling_nan(a, status);
+    bIsQuietNaN = floatx80_is_quiet_nan(b, status);
+    bIsSignalingNaN = floatx80_is_signaling_nan(b, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
     }
 
     if (status->default_nan_mode) {
-        a.low = floatx80_default_nan_low;
-        a.high = floatx80_default_nan_high;
-        return a;
+        return floatx80_default_nan(status);
     }
 
     if (a.low < b.low) {
@@ -1077,19 +1070,19 @@ static floatx80 propagateFloatx80NaN(floatx80 a, floatx80 b,
 
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN,
                 aIsLargerSignificand)) {
-        return floatx80_maybe_silence_nan(b);
+        return floatx80_maybe_silence_nan(b, status);
     } else {
-        return floatx80_maybe_silence_nan(a);
+        return floatx80_maybe_silence_nan(a, status);
     }
 }
 
 #ifdef NO_SIGNALING_NANS
-int float128_is_quiet_nan(float128 a_)
+int float128_is_quiet_nan(float128 a_, float_status *status)
 {
     return float128_is_any_nan(a_);
 }
 
-int float128_is_signaling_nan(float128 a_)
+int float128_is_signaling_nan(float128 a_, float_status *status)
 {
     return 0;
 }
@@ -1099,16 +1092,16 @@ int float128_is_signaling_nan(float128 a_)
 | NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float128_is_quiet_nan( float128 a )
+int float128_is_quiet_nan(float128 a, float_status *status)
 {
-#if SNAN_BIT_IS_ONE
-    return (((a.high >> 47) & 0xffff) == 0xfffe)
-        && (a.low || (a.high & 0x00007fffffffffffULL));
-#else
-    return
-        ((a.high << 1) >= 0xffff000000000000ULL)
-        && (a.low || (a.high & 0x0000ffffffffffffULL));
-#endif
+    if (status->snan_bit_is_one) {
+        return (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & 0x00007FFFFFFFFFFFULL));
+    } else {
+        return
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
+    }
 }
 
 /*----------------------------------------------------------------------------
@@ -1116,17 +1109,17 @@ int float128_is_quiet_nan( float128 a )
 | signaling NaN; otherwise returns 0.
 *----------------------------------------------------------------------------*/
 
-int float128_is_signaling_nan( float128 a )
+int float128_is_signaling_nan(float128 a, float_status *status)
 {
-#if SNAN_BIT_IS_ONE
-    return
-        ((a.high << 1) >= 0xffff000000000000ULL)
-        && (a.low || (a.high & 0x0000ffffffffffffULL));
-#else
-    return
-           ( ( ( a.high>>47 ) & 0xFFFF ) == 0xFFFE )
-        && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
-#endif
+    if (status->snan_bit_is_one) {
+        return
+            ((a.high << 1) >= 0xFFFF000000000000ULL)
+            && (a.low || (a.high & 0x0000FFFFFFFFFFFFULL));
+    } else {
+        return
+               (((a.high >> 47) & 0xFFFF) == 0xFFFE)
+            && (a.low || (a.high & LIT64(0x00007FFFFFFFFFFF)));
+    }
 }
 #endif
 
@@ -1135,20 +1128,15 @@ int float128_is_signaling_nan( float128 a )
 | a signaling NaN; otherwise returns `a'.
 *----------------------------------------------------------------------------*/
 
-float128 float128_maybe_silence_nan( float128 a )
+float128 float128_maybe_silence_nan(float128 a, float_status *status)
 {
-    if (float128_is_signaling_nan(a)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICORE32)
-        a.low = float128_default_nan_low;
-        a.high = float128_default_nan_high;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        a.high |= LIT64( 0x0000800000000000 );
-        return a;
-#endif
+    if (float128_is_signaling_nan(a, status)) {
+        if (status->snan_bit_is_one) {
+            a = float128_default_nan(status);
+        } else {
+            a.high |= LIT64(0x0000800000000000);
+            return a;
+        }
     }
     return a;
 }
@@ -1163,11 +1151,11 @@ static commonNaNT float128ToCommonNaN(float128 a, float_status *status)
 {
     commonNaNT z;
 
-    if (float128_is_signaling_nan(a)) {
+    if (float128_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
-    z.sign = a.high>>63;
-    shortShift128Left( a.high, a.low, 16, &z.high, &z.low );
+    z.sign = a.high >> 63;
+    shortShift128Left(a.high, a.low, 16, &z.high, &z.low);
     return z;
 }
 
@@ -1181,13 +1169,11 @@ static float128 commonNaNToFloat128(commonNaNT a, float_status *status)
     float128 z;
 
     if (status->default_nan_mode) {
-        z.low = float128_default_nan_low;
-        z.high = float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
 
-    shift128Right( a.high, a.low, 16, &z.high, &z.low );
-    z.high |= ( ( (uint64_t) a.sign )<<63 ) | LIT64( 0x7FFF000000000000 );
+    shift128Right(a.high, a.low, 16, &z.high, &z.low);
+    z.high |= (((uint64_t)a.sign) << 63) | LIT64(0x7FFF000000000000);
     return z;
 }
 
@@ -1203,24 +1189,22 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
 
-    aIsQuietNaN = float128_is_quiet_nan( a );
-    aIsSignalingNaN = float128_is_signaling_nan( a );
-    bIsQuietNaN = float128_is_quiet_nan( b );
-    bIsSignalingNaN = float128_is_signaling_nan( b );
+    aIsQuietNaN = float128_is_quiet_nan(a, status);
+    aIsSignalingNaN = float128_is_signaling_nan(a, status);
+    bIsQuietNaN = float128_is_quiet_nan(b, status);
+    bIsSignalingNaN = float128_is_signaling_nan(b, status);
 
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
     }
 
     if (status->default_nan_mode) {
-        a.low = float128_default_nan_low;
-        a.high = float128_default_nan_high;
-        return a;
+        return float128_default_nan(status);
     }
 
-    if (lt128(a.high<<1, a.low, b.high<<1, b.low)) {
+    if (lt128(a.high << 1, a.low, b.high << 1, b.low)) {
         aIsLargerSignificand = 0;
-    } else if (lt128(b.high<<1, b.low, a.high<<1, a.low)) {
+    } else if (lt128(b.high << 1, b.low, a.high << 1, a.low)) {
         aIsLargerSignificand = 1;
     } else {
         aIsLargerSignificand = (a.high < b.high) ? 1 : 0;
@@ -1228,9 +1212,8 @@ static float128 propagateFloat128NaN(float128 a, float128 b,
 
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN,
                 aIsLargerSignificand)) {
-        return float128_maybe_silence_nan(b);
+        return float128_maybe_silence_nan(b, status);
     } else {
-        return float128_maybe_silence_nan(a);
+        return float128_maybe_silence_nan(a, status);
     }
 }
-
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 166c48e..9b1eccf 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2105,7 +2105,7 @@ static float32 subFloat32Sigs(float32 a, float32 b, flag zSign,
             return propagateFloat32NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp == 0 ) {
         aExp = 1;
@@ -2234,7 +2234,7 @@ float32 float32_mul(float32 a, float32 b, float_status *status)
         }
         if ( ( bExp | bSig ) == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2244,7 +2244,7 @@ float32 float32_mul(float32 a, float32 b, float_status *status)
         }
         if ( ( aExp | aSig ) == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2299,7 +2299,7 @@ float32 float32_div(float32 a, float32 b, float_status *status)
                 return propagateFloat32NaN(a, b, status);
             }
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2313,7 +2313,7 @@ float32 float32_div(float32 a, float32 b, float_status *status)
         if ( bSig == 0 ) {
             if ( ( aExp | aSig ) == 0 ) {
                 float_raise(float_flag_invalid, status);
-                return float32_default_nan;
+                return float32_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat32( zSign, 0xFF, 0 );
@@ -2367,7 +2367,7 @@ float32 float32_rem(float32 a, float32 b, float_status *status)
             return propagateFloat32NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( bExp == 0xFF ) {
         if (bSig) {
@@ -2378,7 +2378,7 @@ float32 float32_rem(float32 a, float32 b, float_status *status)
     if ( bExp == 0 ) {
         if ( bSig == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         normalizeFloat32Subnormal( bSig, &bExp, &bSig );
     }
@@ -2493,7 +2493,7 @@ float32 float32_muladd(float32 a, float32 b, float32 c, int flags,
 
     if (infzero) {
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
 
     if (flags & float_muladd_negate_c) {
@@ -2514,7 +2514,7 @@ float32 float32_muladd(float32 a, float32 b, float32 c, int flags,
         if (pInf && (pSign ^ cSign)) {
             /* addition of opposite-signed infinities => InvalidOperation */
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         /* Otherwise generate an infinity of the same sign */
         return packFloat32(cSign ^ signflip, 0xff, 0);
@@ -2690,12 +2690,12 @@ float32 float32_sqrt(float32 a, float_status *status)
         }
         if ( ! aSign ) return a;
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aSign ) {
         if ( ( aExp | aSig ) == 0 ) return a;
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp == 0 ) {
         if ( aSig == 0 ) return float32_zero;
@@ -2828,7 +2828,7 @@ float32 float32_log2(float32 a, float_status *status)
     }
     if ( aSign ) {
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp == 0xFF ) {
         if (aSig) {
@@ -2974,7 +2974,8 @@ int float32_eq_quiet(float32 a, float32 b, float_status *status)
     if (    ( ( extractFloat32Exp( a ) == 0xFF ) && extractFloat32Frac( a ) )
          || ( ( extractFloat32Exp( b ) == 0xFF ) && extractFloat32Frac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( b ) ) {
+        if (float32_is_signaling_nan(a, status)
+         || float32_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3000,7 +3001,8 @@ int float32_le_quiet(float32 a, float32 b, float_status *status)
     if (    ( ( extractFloat32Exp( a ) == 0xFF ) && extractFloat32Frac( a ) )
          || ( ( extractFloat32Exp( b ) == 0xFF ) && extractFloat32Frac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( b ) ) {
+        if (float32_is_signaling_nan(a, status)
+         || float32_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3031,7 +3033,8 @@ int float32_lt_quiet(float32 a, float32 b, float_status *status)
     if (    ( ( extractFloat32Exp( a ) == 0xFF ) && extractFloat32Frac( a ) )
          || ( ( extractFloat32Exp( b ) == 0xFF ) && extractFloat32Frac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( b ) ) {
+        if (float32_is_signaling_nan(a, status)
+         || float32_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3060,7 +3063,8 @@ int float32_unordered_quiet(float32 a, float32 b, float_status *status)
     if (    ( ( extractFloat32Exp( a ) == 0xFF ) && extractFloat32Frac( a ) )
          || ( ( extractFloat32Exp( b ) == 0xFF ) && extractFloat32Frac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( b ) ) {
+        if (float32_is_signaling_nan(a, status)
+         || float32_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -3896,7 +3900,7 @@ static float64 subFloat64Sigs(float64 a, float64 b, flag zSign,
             return propagateFloat64NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp == 0 ) {
         aExp = 1;
@@ -4023,7 +4027,7 @@ float64 float64_mul(float64 a, float64 b, float_status *status)
         }
         if ( ( bExp | bSig ) == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4033,7 +4037,7 @@ float64 float64_mul(float64 a, float64 b, float_status *status)
         }
         if ( ( aExp | aSig ) == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4090,7 +4094,7 @@ float64 float64_div(float64 a, float64 b, float_status *status)
                 return propagateFloat64NaN(a, b, status);
             }
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4104,7 +4108,7 @@ float64 float64_div(float64 a, float64 b, float_status *status)
         if ( bSig == 0 ) {
             if ( ( aExp | aSig ) == 0 ) {
                 float_raise(float_flag_invalid, status);
-                return float64_default_nan;
+                return float64_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat64( zSign, 0x7FF, 0 );
@@ -4162,7 +4166,7 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
             return propagateFloat64NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( bExp == 0x7FF ) {
         if (bSig) {
@@ -4173,7 +4177,7 @@ float64 float64_rem(float64 a, float64 b, float_status *status)
     if ( bExp == 0 ) {
         if ( bSig == 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         normalizeFloat64Subnormal( bSig, &bExp, &bSig );
     }
@@ -4275,7 +4279,7 @@ float64 float64_muladd(float64 a, float64 b, float64 c, int flags,
 
     if (infzero) {
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
 
     if (flags & float_muladd_negate_c) {
@@ -4296,7 +4300,7 @@ float64 float64_muladd(float64 a, float64 b, float64 c, int flags,
         if (pInf && (pSign ^ cSign)) {
             /* addition of opposite-signed infinities => InvalidOperation */
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         /* Otherwise generate an infinity of the same sign */
         return packFloat64(cSign ^ signflip, 0x7ff, 0);
@@ -4494,12 +4498,12 @@ float64 float64_sqrt(float64 a, float_status *status)
         }
         if ( ! aSign ) return a;
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aSign ) {
         if ( ( aExp | aSig ) == 0 ) return a;
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp == 0 ) {
         if ( aSig == 0 ) return float64_zero;
@@ -4547,7 +4551,7 @@ float64 float64_log2(float64 a, float_status *status)
     }
     if ( aSign ) {
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp == 0x7FF ) {
         if (aSig) {
@@ -4694,7 +4698,8 @@ int float64_eq_quiet(float64 a, float64 b, float_status *status)
     if (    ( ( extractFloat64Exp( a ) == 0x7FF ) && extractFloat64Frac( a ) )
          || ( ( extractFloat64Exp( b ) == 0x7FF ) && extractFloat64Frac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( b ) ) {
+        if (float64_is_signaling_nan(a, status)
+         || float64_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4722,7 +4727,8 @@ int float64_le_quiet(float64 a, float64 b, float_status *status)
     if (    ( ( extractFloat64Exp( a ) == 0x7FF ) && extractFloat64Frac( a ) )
          || ( ( extractFloat64Exp( b ) == 0x7FF ) && extractFloat64Frac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( b ) ) {
+        if (float64_is_signaling_nan(a, status)
+         || float64_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4753,7 +4759,8 @@ int float64_lt_quiet(float64 a, float64 b, float_status *status)
     if (    ( ( extractFloat64Exp( a ) == 0x7FF ) && extractFloat64Frac( a ) )
          || ( ( extractFloat64Exp( b ) == 0x7FF ) && extractFloat64Frac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( b ) ) {
+        if (float64_is_signaling_nan(a, status)
+         || float64_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4782,7 +4789,8 @@ int float64_unordered_quiet(float64 a, float64 b, float_status *status)
     if (    ( ( extractFloat64Exp( a ) == 0x7FF ) && extractFloat64Frac( a ) )
          || ( ( extractFloat64Exp( b ) == 0x7FF ) && extractFloat64Frac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( b ) ) {
+        if (float64_is_signaling_nan(a, status)
+         || float64_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -5207,7 +5215,6 @@ static floatx80 subFloatx80Sigs(floatx80 a, floatx80 b, flag zSign,
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
     int32_t expDiff;
-    floatx80 z;
 
     aSig = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
@@ -5221,9 +5228,7 @@ static floatx80 subFloatx80Sigs(floatx80 a, floatx80 b, flag zSign,
             return propagateFloatx80NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        z.low = floatx80_default_nan_low;
-        z.high = floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
     if ( aExp == 0 ) {
         aExp = 1;
@@ -5317,7 +5322,6 @@ floatx80 floatx80_mul(floatx80 a, floatx80 b, float_status *status)
     flag aSign, bSign, zSign;
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
-    floatx80 z;
 
     aSig = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
@@ -5341,9 +5345,7 @@ floatx80 floatx80_mul(floatx80 a, floatx80 b, float_status *status)
         if ( ( aExp | aSig ) == 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low = floatx80_default_nan_low;
-            z.high = floatx80_default_nan_high;
-            return z;
+            return floatx80_default_nan(status);
         }
         return packFloatx80( zSign, 0x7FFF, LIT64( 0x8000000000000000 ) );
     }
@@ -5377,7 +5379,6 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
     uint64_t rem0, rem1, rem2, term0, term1, term2;
-    floatx80 z;
 
     aSig = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
@@ -5409,9 +5410,7 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float_status *status)
             if ( ( aExp | aSig ) == 0 ) {
  invalid:
                 float_raise(float_flag_invalid, status);
-                z.low = floatx80_default_nan_low;
-                z.high = floatx80_default_nan_high;
-                return z;
+                return floatx80_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloatx80( zSign, 0x7FFF, LIT64( 0x8000000000000000 ) );
@@ -5461,7 +5460,6 @@ floatx80 floatx80_rem(floatx80 a, floatx80 b, float_status *status)
     int32_t aExp, bExp, expDiff;
     uint64_t aSig0, aSig1, bSig;
     uint64_t q, term0, term1, alternateASig0, alternateASig1;
-    floatx80 z;
 
     aSig0 = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
@@ -5485,9 +5483,7 @@ floatx80 floatx80_rem(floatx80 a, floatx80 b, float_status *status)
         if ( bSig == 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low = floatx80_default_nan_low;
-            z.high = floatx80_default_nan_high;
-            return z;
+            return floatx80_default_nan(status);
         }
         normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
     }
@@ -5559,7 +5555,6 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *status)
     int32_t aExp, zExp;
     uint64_t aSig0, aSig1, zSig0, zSig1, doubleZSig0;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    floatx80 z;
 
     aSig0 = extractFloatx80Frac( a );
     aExp = extractFloatx80Exp( a );
@@ -5575,9 +5570,7 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *status)
         if ( ( aExp | aSig0 ) == 0 ) return a;
  invalid:
         float_raise(float_flag_invalid, status);
-        z.low = floatx80_default_nan_low;
-        z.high = floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
     if ( aExp == 0 ) {
         if ( aSig0 == 0 ) return packFloatx80( 0, 0, 0 );
@@ -5745,8 +5738,8 @@ int floatx80_eq_quiet(floatx80 a, floatx80 b, float_status *status)
          || (    ( extractFloatx80Exp( b ) == 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (floatx80_is_signaling_nan(a, status)
+         || floatx80_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5776,8 +5769,8 @@ int floatx80_le_quiet(floatx80 a, floatx80 b, float_status *status)
          || (    ( extractFloatx80Exp( b ) == 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (floatx80_is_signaling_nan(a, status)
+         || floatx80_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5812,8 +5805,8 @@ int floatx80_lt_quiet(floatx80 a, floatx80 b, float_status *status)
          || (    ( extractFloatx80Exp( b ) == 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (floatx80_is_signaling_nan(a, status)
+         || floatx80_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5845,8 +5838,8 @@ int floatx80_unordered_quiet(floatx80 a, floatx80 b, float_status *status)
          || (    ( extractFloatx80Exp( b ) == 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (floatx80_is_signaling_nan(a, status)
+         || floatx80_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -6385,7 +6378,6 @@ static float128 subFloat128Sigs(float128 a, float128 b, flag zSign,
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1;
     int32_t expDiff;
-    float128 z;
 
     aSig1 = extractFloat128Frac1( a );
     aSig0 = extractFloat128Frac0( a );
@@ -6403,9 +6395,7 @@ static float128 subFloat128Sigs(float128 a, float128 b, flag zSign,
             return propagateFloat128NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        z.low = float128_default_nan_low;
-        z.high = float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
     if ( aExp == 0 ) {
         aExp = 1;
@@ -6515,7 +6505,6 @@ float128 float128_mul(float128 a, float128 b, float_status *status)
     flag aSign, bSign, zSign;
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2, zSig3;
-    float128 z;
 
     aSig1 = extractFloat128Frac1( a );
     aSig0 = extractFloat128Frac0( a );
@@ -6541,9 +6530,7 @@ float128 float128_mul(float128 a, float128 b, float_status *status)
         if ( ( aExp | aSig0 | aSig1 ) == 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low = float128_default_nan_low;
-            z.high = float128_default_nan_high;
-            return z;
+            return float128_default_nan(status);
         }
         return packFloat128( zSign, 0x7FFF, 0, 0 );
     }
@@ -6582,7 +6569,6 @@ float128 float128_div(float128 a, float128 b, float_status *status)
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    float128 z;
 
     aSig1 = extractFloat128Frac1( a );
     aSig0 = extractFloat128Frac0( a );
@@ -6616,9 +6602,7 @@ float128 float128_div(float128 a, float128 b, float_status *status)
             if ( ( aExp | aSig0 | aSig1 ) == 0 ) {
  invalid:
                 float_raise(float_flag_invalid, status);
-                z.low = float128_default_nan_low;
-                z.high = float128_default_nan_high;
-                return z;
+                return float128_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat128( zSign, 0x7FFF, 0, 0 );
@@ -6673,7 +6657,6 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
     uint64_t aSig0, aSig1, bSig0, bSig1, q, term0, term1, term2;
     uint64_t allZero, alternateASig0, alternateASig1, sigMean1;
     int64_t sigMean0;
-    float128 z;
 
     aSig1 = extractFloat128Frac1( a );
     aSig0 = extractFloat128Frac0( a );
@@ -6699,9 +6682,7 @@ float128 float128_rem(float128 a, float128 b, float_status *status)
         if ( ( bSig0 | bSig1 ) == 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low = float128_default_nan_low;
-            z.high = float128_default_nan_high;
-            return z;
+            return float128_default_nan(status);
         }
         normalizeFloat128Subnormal( bSig0, bSig1, &bExp, &bSig0, &bSig1 );
     }
@@ -6782,7 +6763,6 @@ float128 float128_sqrt(float128 a, float_status *status)
     int32_t aExp, zExp;
     uint64_t aSig0, aSig1, zSig0, zSig1, zSig2, doubleZSig0;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    float128 z;
 
     aSig1 = extractFloat128Frac1( a );
     aSig0 = extractFloat128Frac0( a );
@@ -6799,9 +6779,7 @@ float128 float128_sqrt(float128 a, float_status *status)
         if ( ( aExp | aSig0 | aSig1 ) == 0 ) return a;
  invalid:
         float_raise(float_flag_invalid, status);
-        z.low = float128_default_nan_low;
-        z.high = float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
     if ( aExp == 0 ) {
         if ( ( aSig0 | aSig1 ) == 0 ) return packFloat128( 0, 0, 0, 0 );
@@ -6969,8 +6947,8 @@ int float128_eq_quiet(float128 a, float128 b, float_status *status)
          || (    ( extractFloat128Exp( b ) == 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (float128_is_signaling_nan(a, status)
+         || float128_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7000,8 +6978,8 @@ int float128_le_quiet(float128 a, float128 b, float_status *status)
          || (    ( extractFloat128Exp( b ) == 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (float128_is_signaling_nan(a, status)
+         || float128_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7036,8 +7014,8 @@ int float128_lt_quiet(float128 a, float128 b, float_status *status)
          || (    ( extractFloat128Exp( b ) == 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (float128_is_signaling_nan(a, status)
+         || float128_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7070,8 +7048,8 @@ int float128_unordered_quiet(float128 a, float128 b, float_status *status)
          || (    ( extractFloat128Exp( b ) == 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (float128_is_signaling_nan(a, status)
+         || float128_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -7351,8 +7329,8 @@ static inline int float ## s ## _compare_internal(float ## s a, float ## s b,\
         ( ( extractFloat ## s ## Exp( b ) == nan_exp ) &&                    \
           extractFloat ## s ## Frac( b ) )) {                                \
         if (!is_quiet ||                                                     \
-            float ## s ## _is_signaling_nan( a ) ||                          \
-            float ## s ## _is_signaling_nan( b ) ) {                         \
+            float ## s ## _is_signaling_nan(a, status) ||                  \
+            float ## s ## _is_signaling_nan(b, status)) {                 \
             float_raise(float_flag_invalid, status);                         \
         }                                                                    \
         return float_relation_unordered;                                     \
@@ -7401,8 +7379,8 @@ static inline int floatx80_compare_internal(floatx80 a, floatx80 b,
         ( ( extractFloatx80Exp( b ) == 0x7fff ) &&
           ( extractFloatx80Frac( b )<<1 ) )) {
         if (!is_quiet ||
-            floatx80_is_signaling_nan( a ) ||
-            floatx80_is_signaling_nan( b ) ) {
+            floatx80_is_signaling_nan(a, status) ||
+            floatx80_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return float_relation_unordered;
@@ -7447,8 +7425,8 @@ static inline int float128_compare_internal(float128 a, float128 b,
         ( ( extractFloat128Exp( b ) == 0x7fff ) &&
           ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )) {
         if (!is_quiet ||
-            float128_is_signaling_nan( a ) ||
-            float128_is_signaling_nan( b ) ) {
+            float128_is_signaling_nan(a, status) ||
+            float128_is_signaling_nan(b, status)) {
             float_raise(float_flag_invalid, status);
         }
         return float_relation_unordered;
@@ -7508,11 +7486,11 @@ static inline float ## s float ## s ## _minmax(float ## s a, float ## s b,     \
     if (float ## s ## _is_any_nan(a) ||                                 \
         float ## s ## _is_any_nan(b)) {                                 \
         if (isieee) {                                                   \
-            if (float ## s ## _is_quiet_nan(a) &&                       \
+            if (float ## s ## _is_quiet_nan(a, status) &&               \
                 !float ## s ##_is_any_nan(b)) {                         \
                 return b;                                               \
-            } else if (float ## s ## _is_quiet_nan(b) &&                \
-                       !float ## s ## _is_any_nan(a)) {                 \
+            } else if (float ## s ## _is_quiet_nan(b, status) &&        \
+                       !float ## s ## _is_any_nan(a)) {                \
                 return a;                                               \
             }                                                           \
         }                                                               \
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index c937062..95a1103 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -205,6 +205,7 @@ typedef struct float_status {
     /* should denormalised inputs go to zero and set the input_denormal flag? */
     flag flush_inputs_to_zero;
     flag default_nan_mode;
+    flag snan_bit_is_one;
 } float_status;
 
 static inline void set_float_detect_tininess(int val, float_status *status)
@@ -236,6 +237,10 @@ static inline void set_default_nan_mode(flag val, float_status *status)
 {
     status->default_nan_mode = val;
 }
+static inline void set_snan_bit_is_one(flag val, float_status *status)
+{
+    status->snan_bit_is_one = val;
+}
 static inline int get_float_detect_tininess(float_status *status)
 {
     return status->float_detect_tininess;
@@ -342,9 +347,9 @@ float64 float16_to_float64(float16 a, flag ieee, float_status *status);
 /*----------------------------------------------------------------------------
 | Software half-precision operations.
 *----------------------------------------------------------------------------*/
-int float16_is_quiet_nan( float16 );
-int float16_is_signaling_nan( float16 );
-float16 float16_maybe_silence_nan( float16 );
+int float16_is_quiet_nan(float16, float_status *status);
+int float16_is_signaling_nan(float16, float_status *status);
+float16 float16_maybe_silence_nan(float16, float_status *status);
 
 static inline int float16_is_any_nan(float16 a)
 {
@@ -354,7 +359,7 @@ static inline int float16_is_any_nan(float16 a)
 /*----------------------------------------------------------------------------
 | The pattern for a default generated half-precision NaN.
 *----------------------------------------------------------------------------*/
-extern const float16 float16_default_nan;
+float16 float16_default_nan(float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software IEC/IEEE single-precision conversion routines.
@@ -404,9 +409,9 @@ float32 float32_minnum(float32, float32, float_status *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
-int float32_is_quiet_nan( float32 );
-int float32_is_signaling_nan( float32 );
-float32 float32_maybe_silence_nan( float32 );
+int float32_is_quiet_nan(float32, float_status *status);
+int float32_is_signaling_nan(float32, float_status *status);
+float32 float32_maybe_silence_nan(float32, float_status *status);
 float32 float32_scalbn(float32, int, float_status *status);
 
 static inline float32 float32_abs(float32 a)
@@ -466,7 +471,7 @@ static inline float32 float32_set_sign(float32 a, int sign)
 /*----------------------------------------------------------------------------
 | The pattern for a default generated single-precision NaN.
 *----------------------------------------------------------------------------*/
-extern const float32 float32_default_nan;
+float32 float32_default_nan(float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software IEC/IEEE double-precision conversion routines.
@@ -516,9 +521,9 @@ float64 float64_minnum(float64, float64, float_status *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
-int float64_is_quiet_nan( float64 a );
-int float64_is_signaling_nan( float64 );
-float64 float64_maybe_silence_nan( float64 );
+int float64_is_quiet_nan(float64 a, float_status *status);
+int float64_is_signaling_nan(float64, float_status *status);
+float64 float64_maybe_silence_nan(float64, float_status *status);
 float64 float64_scalbn(float64, int, float_status *status);
 
 static inline float64 float64_abs(float64 a)
@@ -578,7 +583,7 @@ static inline float64 float64_set_sign(float64 a, int sign)
 /*----------------------------------------------------------------------------
 | The pattern for a default generated double-precision NaN.
 *----------------------------------------------------------------------------*/
-extern const float64 float64_default_nan;
+float64 float64_default_nan(float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software IEC/IEEE extended double-precision conversion routines.
@@ -611,9 +616,9 @@ int floatx80_lt_quiet(floatx80, floatx80, float_status *status);
 int floatx80_unordered_quiet(floatx80, floatx80, float_status *status);
 int floatx80_compare(floatx80, floatx80, float_status *status);
 int floatx80_compare_quiet(floatx80, floatx80, float_status *status);
-int floatx80_is_quiet_nan( floatx80 );
-int floatx80_is_signaling_nan( floatx80 );
-floatx80 floatx80_maybe_silence_nan( floatx80 );
+int floatx80_is_quiet_nan(floatx80, float_status *status);
+int floatx80_is_signaling_nan(floatx80, float_status *status);
+floatx80 floatx80_maybe_silence_nan(floatx80, float_status *status);
 floatx80 floatx80_scalbn(floatx80, int, float_status *status);
 
 static inline floatx80 floatx80_abs(floatx80 a)
@@ -663,7 +668,7 @@ static inline int floatx80_is_any_nan(floatx80 a)
 /*----------------------------------------------------------------------------
 | The pattern for a default generated extended double-precision NaN.
 *----------------------------------------------------------------------------*/
-extern const floatx80 floatx80_default_nan;
+floatx80 floatx80_default_nan(float_status *status);
 
 /*----------------------------------------------------------------------------
 | Software IEC/IEEE quadruple-precision conversion routines.
@@ -696,9 +701,9 @@ int float128_lt_quiet(float128, float128, float_status *status);
 int float128_unordered_quiet(float128, float128, float_status *status);
 int float128_compare(float128, float128, float_status *status);
 int float128_compare_quiet(float128, float128, float_status *status);
-int float128_is_quiet_nan( float128 );
-int float128_is_signaling_nan( float128 );
-float128 float128_maybe_silence_nan( float128 );
+int float128_is_quiet_nan(float128, float_status *status);
+int float128_is_signaling_nan(float128, float_status *status);
+float128 float128_maybe_silence_nan(float128, float_status *status);
 float128 float128_scalbn(float128, int, float_status *status);
 
 static inline float128 float128_abs(float128 a)
@@ -744,6 +749,6 @@ static inline int float128_is_any_nan(float128 a)
 /*----------------------------------------------------------------------------
 | The pattern for a default generated quadruple-precision NaN.
 *----------------------------------------------------------------------------*/
-extern const float128 float128_default_nan;
+float128 float128_default_nan(float_status *status);
 
 #endif /* !SOFTFLOAT_H */
diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
index c7bfb4d..50f0c8b 100644
--- a/target-arm/helper-a64.c
+++ b/target-arm/helper-a64.c
@@ -343,12 +343,12 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
 
     if (float32_is_any_nan(a)) {
         float32 nan = a;
-        if (float32_is_signaling_nan(a)) {
+        if (float32_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_maybe_silence_nan(a);
+            nan = float32_maybe_silence_nan(a, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan = float32_default_nan;
+            nan = float32_default_nan(fpst);
         }
         return nan;
     }
@@ -372,12 +372,12 @@ float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
 
     if (float64_is_any_nan(a)) {
         float64 nan = a;
-        if (float64_is_signaling_nan(a)) {
+        if (float64_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_maybe_silence_nan(a);
+            nan = float64_maybe_silence_nan(a, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan = float64_default_nan;
+            nan = float64_default_nan(fpst);
         }
         return nan;
     }
@@ -406,7 +406,7 @@ float32 HELPER(fcvtx_f64_to_f32)(float64 a, CPUARMState *env)
     set_float_rounding_mode(float_round_to_zero, &tstat);
     set_float_exception_flags(0, &tstat);
     r = float64_to_float32(a, &tstat);
-    r = float32_maybe_silence_nan(r);
+    r = float32_maybe_silence_nan(r, &tstat);
     exflags = get_float_exception_flags(&tstat);
     if (exflags & float_flag_inexact) {
         r = make_float32(float32_val(r) | 1);
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..6ef4450 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -8648,7 +8648,7 @@ float64 VFP_HELPER(fcvtd, s)(float32 x, CPUARMState *env)
     /* ARM requires that S<->D conversion of any kind of NaN generates
      * a quiet NaN by forcing the most significant frac bit to 1.
      */
-    return float64_maybe_silence_nan(r);
+    return float64_maybe_silence_nan(r, &env->vfp.fp_status);
 }
 
 float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
@@ -8657,7 +8657,7 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
     /* ARM requires that S<->D conversion of any kind of NaN generates
      * a quiet NaN by forcing the most significant frac bit to 1.
      */
-    return float32_maybe_silence_nan(r);
+    return float32_maybe_silence_nan(r, &env->vfp.fp_status);
 }
 
 /* VFP3 fixed point conversion.  */
@@ -8756,7 +8756,7 @@ static float32 do_fcvt_f16_to_f32(uint32_t a, CPUARMState *env, float_status *s)
     int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
     float32 r = float16_to_float32(make_float16(a), ieee, s);
     if (ieee) {
-        return float32_maybe_silence_nan(r);
+        return float32_maybe_silence_nan(r, s);
     }
     return r;
 }
@@ -8766,7 +8766,7 @@ static uint32_t do_fcvt_f32_to_f16(float32 a, CPUARMState *env, float_status *s)
     int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
     float16 r = float32_to_float16(a, ieee, s);
     if (ieee) {
-        r = float16_maybe_silence_nan(r);
+        r = float16_maybe_silence_nan(r, s);
     }
     return float16_val(r);
 }
@@ -8796,7 +8796,7 @@ float64 HELPER(vfp_fcvt_f16_to_f64)(uint32_t a, CPUARMState *env)
     int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
     float64 r = float16_to_float64(make_float16(a), ieee, &env->vfp.fp_status);
     if (ieee) {
-        return float64_maybe_silence_nan(r);
+        return float64_maybe_silence_nan(r, &env->vfp.fp_status);
     }
     return r;
 }
@@ -8806,7 +8806,7 @@ uint32_t HELPER(vfp_fcvt_f64_to_f16)(float64 a, CPUARMState *env)
     int ieee = (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) == 0;
     float16 r = float64_to_float16(a, ieee, &env->vfp.fp_status);
     if (ieee) {
-        r = float16_maybe_silence_nan(r);
+        r = float16_maybe_silence_nan(r, &env->vfp.fp_status);
     }
     return float16_val(r);
 }
@@ -8956,12 +8956,12 @@ float32 HELPER(recpe_f32)(float32 input, void *fpstp)
 
     if (float32_is_any_nan(f32)) {
         float32 nan = f32;
-        if (float32_is_signaling_nan(f32)) {
+        if (float32_is_signaling_nan(f32, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float32_maybe_silence_nan(f32);
+            nan = float32_maybe_silence_nan(f32, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =  float32_default_nan;
+            nan =  float32_default_nan(fpst);
         }
         return nan;
     } else if (float32_is_infinity(f32)) {
@@ -9010,12 +9010,12 @@ float64 HELPER(recpe_f64)(float64 input, void *fpstp)
     /* Deal with any special cases */
     if (float64_is_any_nan(f64)) {
         float64 nan = f64;
-        if (float64_is_signaling_nan(f64)) {
+        if (float64_is_signaling_nan(f64, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan = float64_maybe_silence_nan(f64);
+            nan = float64_maybe_silence_nan(f64, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =  float64_default_nan;
+            nan =  float64_default_nan(fpst);
         }
         return nan;
     } else if (float64_is_infinity(f64)) {
@@ -9117,12 +9117,12 @@ float32 HELPER(rsqrte_f32)(float32 input, void *fpstp)
 
     if (float32_is_any_nan(f32)) {
         float32 nan = f32;
-        if (float32_is_signaling_nan(f32)) {
+        if (float32_is_signaling_nan(f32, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float32_maybe_silence_nan(f32);
+            nan = float32_maybe_silence_nan(f32, s);
         }
         if (s->default_nan_mode) {
-            nan =  float32_default_nan;
+            nan =  float32_default_nan(s);
         }
         return nan;
     } else if (float32_is_zero(f32)) {
@@ -9130,7 +9130,7 @@ float32 HELPER(rsqrte_f32)(float32 input, void *fpstp)
         return float32_set_sign(float32_infinity, float32_is_neg(f32));
     } else if (float32_is_neg(f32)) {
         float_raise(float_flag_invalid, s);
-        return float32_default_nan;
+        return float32_default_nan(s);
     } else if (float32_is_infinity(f32)) {
         return float32_zero;
     }
@@ -9181,12 +9181,12 @@ float64 HELPER(rsqrte_f64)(float64 input, void *fpstp)
 
     if (float64_is_any_nan(f64)) {
         float64 nan = f64;
-        if (float64_is_signaling_nan(f64)) {
+        if (float64_is_signaling_nan(f64, s)) {
             float_raise(float_flag_invalid, s);
-            nan = float64_maybe_silence_nan(f64);
+            nan = float64_maybe_silence_nan(f64, s);
         }
         if (s->default_nan_mode) {
-            nan =  float64_default_nan;
+            nan =  float64_default_nan(s);
         }
         return nan;
     } else if (float64_is_zero(f64)) {
@@ -9194,7 +9194,7 @@ float64 HELPER(rsqrte_f64)(float64 input, void *fpstp)
         return float64_set_sign(float64_infinity, float64_is_neg(f64));
     } else if (float64_is_neg(f64)) {
         float_raise(float_flag_invalid, s);
-        return float64_default_nan;
+        return float64_default_nan(s);
     } else if (float64_is_infinity(f64)) {
         return float64_zero;
     }
diff --git a/target-m68k/helper.c b/target-m68k/helper.c
index a8f6d9d..4a1c623 100644
--- a/target-m68k/helper.c
+++ b/target-m68k/helper.c
@@ -557,10 +557,10 @@ float64 HELPER(sub_cmp_f64)(CPUM68KState *env, float64 a, float64 b)
     /* ??? Should flush denormals to zero.  */
     float64 res;
     res = float64_sub(a, b, &env->fp_status);
-    if (float64_is_quiet_nan(res)) {
+    if (float64_is_quiet_nan(res, &env->fp_status)) {
         /* +/-inf compares equal against itself, but sub returns nan.  */
-        if (!float64_is_quiet_nan(a)
-            && !float64_is_quiet_nan(b)) {
+        if (!float64_is_quiet_nan(a, &env->fp_status)
+            && !float64_is_quiet_nan(b, &env->fp_status)) {
             res = float64_zero;
             if (float64_lt_quiet(a, res, &env->fp_status))
                 res = float64_chs(res);
diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
index 9733388..45fc94d 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -287,12 +287,14 @@ uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a, uint32_t b)
     fa.l = a;
     fb.l = b;
 
-    if (float32_is_signaling_nan(fa.f) || float32_is_signaling_nan(fb.f)) {
+    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
+        float32_is_signaling_nan(fb.f, &env->fp_status)) {
         update_fpu_flags(env, float_flag_invalid);
         r = 1;
     }
 
-    if (float32_is_quiet_nan(fa.f) || float32_is_quiet_nan(fb.f)) {
+    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
+        float32_is_quiet_nan(fb.f, &env->fp_status)) {
         r = 1;
     }
 
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 866924d..6478420 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -789,6 +789,11 @@ void cpu_mips_soft_irq(CPUMIPSState *env, int irq, int level);
 /* helper.c */
 int mips_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
                               int mmu_idx);
+
+/* op_helper.c */
+uint32_t float_class_s(uint32_t arg, float_status *fst);
+uint64_t float_class_d(uint64_t arg, float_status *fst);
+
 #if !defined(CONFIG_USER_ONLY)
 void r4k_invalidate_tlb (CPUMIPSState *env, int idx, int use_extra);
 hwaddr cpu_mips_translate_address (CPUMIPSState *env, target_ulong address,
diff --git a/target-mips/helper.h b/target-mips/helper.h
index 594341d..8546177 100644
--- a/target-mips/helper.h
+++ b/target-mips/helper.h
@@ -222,8 +222,8 @@ DEF_HELPER_2(float_cvtw_d, i32, env, i64)
 DEF_HELPER_3(float_addr_ps, i64, env, i64, i64)
 DEF_HELPER_3(float_mulr_ps, i64, env, i64, i64)
 
-DEF_HELPER_FLAGS_1(float_class_s, TCG_CALL_NO_RWG_SE, i32, i32)
-DEF_HELPER_FLAGS_1(float_class_d, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_2(float_class_s, TCG_CALL_NO_RWG_SE, i32, env, i32)
+DEF_HELPER_FLAGS_2(float_class_d, TCG_CALL_NO_RWG_SE, i64, env, i64)
 
 #define FOP_PROTO(op)                                     \
 DEF_HELPER_4(float_ ## op ## _s, i32, env, i32, i32, i32) \
diff --git a/target-mips/msa_helper.c b/target-mips/msa_helper.c
index 654a0d2..5be30c3 100644
--- a/target-mips/msa_helper.c
+++ b/target-mips/msa_helper.c
@@ -1494,11 +1494,11 @@ MSA_UNOP_DF(pcnt)
 #define FLOAT_ONE32 make_float32(0x3f8 << 20)
 #define FLOAT_ONE64 make_float64(0x3ffULL << 52)
 
-#define FLOAT_SNAN16 (float16_default_nan ^ 0x0220)
+#define FLOAT_SNAN16(s) (float16_default_nan(s) ^ 0x0220)
         /* 0x7c20 */
-#define FLOAT_SNAN32 (float32_default_nan ^ 0x00400020)
+#define FLOAT_SNAN32(s) (float32_default_nan(s) ^ 0x00400020)
         /* 0x7f800020 */
-#define FLOAT_SNAN64 (float64_default_nan ^ 0x0008000000000020ULL)
+#define FLOAT_SNAN64(s) (float64_default_nan(s) ^ 0x0008000000000020ULL)
         /* 0x7ff0000000000020 */
 
 static inline void clear_msacsr_cause(CPUMIPSState *env)
@@ -1611,7 +1611,7 @@ static inline float16 float16_from_float32(int32_t a, flag ieee,
       float16 f_val;
 
       f_val = float32_to_float16((float32)a, ieee, status);
-      f_val = float16_maybe_silence_nan(f_val);
+      f_val = float16_maybe_silence_nan(f_val, status);
 
       return a < 0 ? (f_val | (1 << 15)) : f_val;
 }
@@ -1621,7 +1621,7 @@ static inline float32 float32_from_float64(int64_t a, float_status *status)
       float32 f_val;
 
       f_val = float64_to_float32((float64)a, status);
-      f_val = float32_maybe_silence_nan(f_val);
+      f_val = float32_maybe_silence_nan(f_val, status);
 
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
@@ -1632,7 +1632,7 @@ static inline float32 float32_from_float16(int16_t a, flag ieee,
       float32 f_val;
 
       f_val = float16_to_float32((float16)a, ieee, status);
-      f_val = float32_maybe_silence_nan(f_val);
+      f_val = float32_maybe_silence_nan(f_val, status);
 
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
@@ -1642,7 +1642,7 @@ static inline float64 float64_from_float32(int32_t a, float_status *status)
       float64 f_val;
 
       f_val = float32_to_float64((float64)a, status);
-      f_val = float64_maybe_silence_nan(f_val);
+      f_val = float64_maybe_silence_nan(f_val, status);
 
       return a < 0 ? (f_val | (1ULL << 63)) : f_val;
 }
@@ -1788,7 +1788,8 @@ static inline int32_t float64_to_q32(float64 a, float_status *status)
         c = update_msacsr(env, CLEAR_IS_INEXACT, 0);                        \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -2387,7 +2388,8 @@ void helper_msa_fsne_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -2523,7 +2525,8 @@ void helper_msa_fdiv_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -2642,7 +2645,8 @@ void helper_msa_fexp2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -2693,7 +2697,8 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                      \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## XBITS >> 6) << 6) | c;                   \
+            DEST = ((FLOAT_SNAN ## XBITS(&env->active_tc.msa_fp_status)     \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -2730,9 +2735,9 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
 
-#define NUMBER_QNAN_PAIR(ARG1, ARG2, BITS)      \
-    !float ## BITS ## _is_any_nan(ARG1)         \
-    && float ## BITS ## _is_quiet_nan(ARG2)
+#define NUMBER_QNAN_PAIR(ARG1, ARG2, BITS, STATUS)      \
+    !float ## BITS ## _is_any_nan(ARG1)                 \
+    && float ## BITS ## _is_quiet_nan(ARG2, STATUS)
 
 #define MSA_FLOAT_MAXOP(DEST, OP, ARG1, ARG2, BITS)                         \
     do {                                                                    \
@@ -2744,18 +2749,19 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, 0, 0);                                       \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
-#define FMAXMIN_A(F, G, X, _S, _T, BITS)                            \
+#define FMAXMIN_A(F, G, X, _S, _T, BITS, STATUS)                    \
     do {                                                            \
         uint## BITS ##_t S = _S, T = _T;                            \
         uint## BITS ##_t as, at, xs, xt, xd;                        \
-        if (NUMBER_QNAN_PAIR(S, T, BITS)) {                         \
+        if (NUMBER_QNAN_PAIR(S, T, BITS, STATUS)) {                 \
             T = S;                                                  \
         }                                                           \
-        else if (NUMBER_QNAN_PAIR(T, S, BITS)) {                    \
+        else if (NUMBER_QNAN_PAIR(T, S, BITS, STATUS)) {            \
             S = T;                                                  \
         }                                                           \
         as = float## BITS ##_abs(S);                                \
@@ -2769,6 +2775,7 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status = &env->active_tc.msa_fp_status;
     wr_t wx, *pwx = &wx;
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
@@ -2780,9 +2787,9 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32)) {
+            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pws->w[i], 32);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pwt->w[i], pwt->w[i], 32);
             } else {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pwt->w[i], 32);
@@ -2791,9 +2798,9 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         break;
     case DF_DOUBLE:
         for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64)) {
+            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pws->d[i], 64);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pwt->d[i], pwt->d[i], 64);
             } else {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pwt->d[i], 64);
@@ -2812,6 +2819,7 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status = &env->active_tc.msa_fp_status;
     wr_t wx, *pwx = &wx;
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
@@ -2823,12 +2831,12 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(min, max, pwx->w[i], pws->w[i], pwt->w[i], 32);
+            FMAXMIN_A(min, max, pwx->w[i], pws->w[i], pwt->w[i], 32, status);
         }
         break;
     case DF_DOUBLE:
         for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(min, max, pwx->d[i], pws->d[i], pwt->d[i], 64);
+            FMAXMIN_A(min, max, pwx->d[i], pws->d[i], pwt->d[i], 64, status);
         }
         break;
     default:
@@ -2843,6 +2851,7 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status = &env->active_tc.msa_fp_status;
     wr_t wx, *pwx = &wx;
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
@@ -2854,9 +2863,9 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32)) {
+            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pws->w[i], 32);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pwt->w[i], pwt->w[i], 32);
             } else {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pwt->w[i], 32);
@@ -2865,9 +2874,9 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         break;
     case DF_DOUBLE:
         for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64)) {
+            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pws->d[i], 64);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pwt->d[i], pwt->d[i], 64);
             } else {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pwt->d[i], 64);
@@ -2886,6 +2895,7 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status = &env->active_tc.msa_fp_status;
     wr_t wx, *pwx = &wx;
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
@@ -2897,12 +2907,12 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i = 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(max, min, pwx->w[i], pws->w[i], pwt->w[i], 32);
+            FMAXMIN_A(max, min, pwx->w[i], pws->w[i], pwt->w[i], 32, status);
         }
         break;
     case DF_DOUBLE:
         for (i = 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(max, min, pwx->d[i], pws->d[i], pwt->d[i], 64);
+            FMAXMIN_A(max, min, pwx->d[i], pws->d[i], pwt->d[i], 64, status);
         }
         break;
     default:
@@ -2917,16 +2927,18 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
         uint32_t wd, uint32_t ws)
 {
+    float_status* status = &env->active_tc.msa_fp_status;
+
     wr_t *pwd = &(env->active_fpu.fpr[wd].wr);
     wr_t *pws = &(env->active_fpu.fpr[ws].wr);
     if (df == DF_WORD) {
-        pwd->w[0] = helper_float_class_s(pws->w[0]);
-        pwd->w[1] = helper_float_class_s(pws->w[1]);
-        pwd->w[2] = helper_float_class_s(pws->w[2]);
-        pwd->w[3] = helper_float_class_s(pws->w[3]);
+        pwd->w[0] = float_class_s(pws->w[0], status);
+        pwd->w[1] = float_class_s(pws->w[1], status);
+        pwd->w[2] = float_class_s(pws->w[2], status);
+        pwd->w[3] = float_class_s(pws->w[3], status);
     } else {
-        pwd->d[0] = helper_float_class_d(pws->d[0]);
-        pwd->d[1] = helper_float_class_d(pws->d[1]);
+        pwd->d[0] = float_class_d(pws->d[0], status);
+        pwd->d[1] = float_class_d(pws->d[1], status);
     }
 }
 
@@ -2940,7 +2952,8 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
         c = update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                      \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         } else if (float ## BITS ## _is_any_nan(ARG)) {                     \
             DEST = 0;                                                       \
         }                                                                   \
@@ -3044,12 +3057,14 @@ void helper_msa_fsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         set_float_exception_flags(0, status);                               \
         DEST = float ## BITS ## _ ## div(FLOAT_ONE ## BITS, ARG, status);   \
         c = update_msacsr(env, float ## BITS ## _is_infinity(ARG) ||        \
-                          float ## BITS ## _is_quiet_nan(DEST) ?            \
+                          float ## BITS ## _is_quiet_nan(DEST,              \
+                              &env->active_tc.msa_fp_status) ?              \
                           0 : RECIPROCAL_INEXACT,                           \
                           IS_DENORMAL(DEST, BITS));                         \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
@@ -3165,7 +3180,8 @@ void helper_msa_frint_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         c = update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));                 \
                                                                             \
         if (get_enabled_exceptions(env, c)) {                               \
-            DEST = ((FLOAT_SNAN ## BITS >> 6) << 6) | c;                    \
+            DEST = ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)      \
+                       >> 6) << 6) | c;                                     \
         }                                                                   \
     } while (0)
 
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 8ec1bef..230aa94 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2660,7 +2660,7 @@ uint64_t helper_float_cvtd_s(CPUMIPSState *env, uint32_t fst0)
     uint64_t fdt2;
 
     fdt2 = float32_to_float64(fst0, &env->active_fpu.fp_status);
-    fdt2 = float64_maybe_silence_nan(fdt2);
+    fdt2 = float64_maybe_silence_nan(fdt2, &env->active_fpu.fp_status);
     update_fcr31(env, GETPC());
     return fdt2;
 }
@@ -2750,7 +2750,7 @@ uint32_t helper_float_cvts_d(CPUMIPSState *env, uint64_t fdt0)
     uint32_t fst2;
 
     fst2 = float64_to_float32(fdt0, &env->active_fpu.fp_status);
-    fst2 = float32_maybe_silence_nan(fst2);
+    fst2 = float32_maybe_silence_nan(fst2, &env->active_fpu.fp_status);
     update_fcr31(env, GETPC());
     return fst2;
 }
@@ -3200,11 +3200,12 @@ FLOAT_RINT(rint_d, 64)
 #define FLOAT_CLASS_POSITIVE_ZERO      0x200
 
 #define FLOAT_CLASS(name, bits)                                      \
-uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
+uint ## bits ## _t float_ ## name (uint ## bits ## _t arg,           \
+                                   float_status *status)             \
 {                                                                    \
-    if (float ## bits ## _is_signaling_nan(arg)) {                   \
+    if (float ## bits ## _is_signaling_nan(arg, status)) {           \
         return FLOAT_CLASS_SIGNALING_NAN;                            \
-    } else if (float ## bits ## _is_quiet_nan(arg)) {                \
+    } else if (float ## bits ## _is_quiet_nan(arg, status)) {        \
         return FLOAT_CLASS_QUIET_NAN;                                \
     } else if (float ## bits ## _is_neg(arg)) {                      \
         if (float ## bits ## _is_infinity(arg)) {                    \
@@ -3227,8 +3228,15 @@ uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
             return FLOAT_CLASS_POSITIVE_NORMAL;                      \
         }                                                            \
     }                                                                \
+}                                                                    \
+uint ## bits ## _t helper_float_ ## name (CPUMIPSState *env,         \
+                                          uint ## bits ## _t arg)    \
+{                                                                    \
+    return float_ ## name(arg, &env->active_fpu.fp_status);          \
 }
 
+
+
 FLOAT_CLASS(class_s, 32)
 FLOAT_CLASS(class_d, 64)
 #undef FLOAT_CLASS
diff --git a/target-mips/translate.c b/target-mips/translate.c
index a3a05ec..e934884 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -9110,7 +9110,7 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
         {
             TCGv_i32 fp0 = tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_class_s(fp0, fp0);
+            gen_helper_float_class_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9608,7 +9608,7 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
         {
             TCGv_i64 fp0 = tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_class_d(fp0, fp0);
+            gen_helper_float_class_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -20129,6 +20129,7 @@ void cpu_state_reset(CPUMIPSState *env)
     env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
     env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
     env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
+    set_snan_bit_is_one(1, &env->active_fpu.fp_status);
     env->msair = env->cpu_model->MSAIR;
     env->insn_flags = env->cpu_model->insn_flags;
 
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 5af077d..e81a831 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -892,4 +892,6 @@ static void msa_reset(CPUMIPSState *env)
 
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
+
+    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
 }
diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c
index b67ebca..48e9f40 100644
--- a/target-ppc/fpu_helper.c
+++ b/target-ppc/fpu_helper.c
@@ -73,7 +73,7 @@ void helper_compute_fprf(CPUPPCState *env, uint64_t arg)
     farg.ll = arg;
     isneg = float64_is_neg(farg.d);
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (float64_is_signaling_nan(farg.d)) {
+        if (float64_is_signaling_nan(farg.d, &env->fp_status)) {
             /* Signaling NaN: flags are undefined */
             fprf = 0x00;
         } else {
@@ -534,8 +534,8 @@ uint64_t helper_fadd(CPUPPCState *env, uint64_t arg1, uint64_t arg2)
         /* Magnitude subtraction of infinities */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))) {
             /* sNaN addition */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -558,8 +558,8 @@ uint64_t helper_fsub(CPUPPCState *env, uint64_t arg1, uint64_t arg2)
         /* Magnitude subtraction of infinities */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))) {
             /* sNaN subtraction */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -582,8 +582,8 @@ uint64_t helper_fmul(CPUPPCState *env, uint64_t arg1, uint64_t arg2)
         /* Multiplication of zero by infinity */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))) {
             /* sNaN multiplication */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -609,8 +609,8 @@ uint64_t helper_fdiv(CPUPPCState *env, uint64_t arg1, uint64_t arg2)
         /* Division of zero by zero */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXZDZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))) {
             /* sNaN division */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -632,7 +632,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg)                   \
     if (unlikely(env->fp_status.float_exception_flags)) {              \
         if (float64_is_any_nan(arg)) {                                 \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXCVI, 1);      \
-            if (float64_is_signaling_nan(arg)) {                       \
+            if (float64_is_signaling_nan(arg, &env->fp_status)) {      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1); \
             }                                                          \
             farg.ll = nanval;                                          \
@@ -681,7 +681,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint64_t arg,
 
     farg.ll = arg;
 
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN round */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         farg.ll = arg | 0x0008000000000000ULL;
@@ -737,9 +737,9 @@ uint64_t helper_fmadd(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -780,9 +780,9 @@ uint64_t helper_fmsub(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -821,9 +821,9 @@ uint64_t helper_fnmadd(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -866,9 +866,9 @@ uint64_t helper_fnmsub(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll = fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -903,7 +903,7 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
 
     farg.ll = arg;
 
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN square root */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -921,7 +921,7 @@ uint64_t helper_fsqrt(CPUPPCState *env, uint64_t arg)
     farg.ll = arg;
 
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (unlikely(float64_is_signaling_nan(farg.d))) {
+        if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
             /* sNaN reciprocal square root */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
             farg.ll = float64_snan_to_qnan(farg.ll);
@@ -942,7 +942,7 @@ uint64_t helper_fre(CPUPPCState *env, uint64_t arg)
 
     farg.ll = arg;
 
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN reciprocal */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -958,7 +958,7 @@ uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
 
     farg.ll = arg;
 
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN reciprocal */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -977,7 +977,7 @@ uint64_t helper_frsqrte(CPUPPCState *env, uint64_t arg)
     farg.ll = arg;
 
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (unlikely(float64_is_signaling_nan(farg.d))) {
+        if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
             /* sNaN reciprocal square root */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
             farg.ll = float64_snan_to_qnan(farg.ll);
@@ -1100,8 +1100,8 @@ void helper_fcmpu(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
     env->fpscr |= ret << FPSCR_FPRF;
     env->crf[crfD] = ret;
     if (unlikely(ret == 0x01UL
-                 && (float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d)))) {
+                 && (float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status)))) {
         /* sNaN comparison */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -1131,8 +1131,8 @@ void helper_fcmpo(CPUPPCState *env, uint64_t arg1, uint64_t arg2,
     env->fpscr |= ret << FPSCR_FPRF;
     env->crf[crfD] = ret;
     if (unlikely(ret == 0x01UL)) {
-        if (float64_is_signaling_nan(farg1.d) ||
-            float64_is_signaling_nan(farg2.d)) {
+        if (float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+            float64_is_signaling_nan(farg2.d, &env->fp_status)) {
             /* sNaN comparison */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN |
                                   POWERPC_EXCP_FP_VXVC, 1);
@@ -1168,7 +1168,7 @@ static inline int32_t efsctsi(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
 
@@ -1181,7 +1181,7 @@ static inline uint32_t efsctui(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
 
@@ -1194,7 +1194,7 @@ static inline uint32_t efsctsiz(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
 
@@ -1207,7 +1207,7 @@ static inline uint32_t efsctuiz(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
 
@@ -1245,7 +1245,7 @@ static inline uint32_t efsctsf(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
     tmp = uint64_to_float32(1ULL << 32, &env->vec_status);
@@ -1261,7 +1261,7 @@ static inline uint32_t efsctuf(CPUPPCState *env, uint32_t val)
 
     u.l = val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
     tmp = uint64_to_float32(1ULL << 32, &env->vec_status);
@@ -1839,8 +1839,8 @@ void helper_##name(CPUPPCState *env, uint32_t opcode)                        \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             if (tp##_is_infinity(xa.fld) && tp##_is_infinity(xb.fld)) {      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, sfprf);    \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                      \
-                       tp##_is_signaling_nan(xb.fld)) {                      \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||              \
+                       tp##_is_signaling_nan(xb.fld, &tstat)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);   \
             }                                                                \
         }                                                                    \
@@ -1894,8 +1894,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                          \
             if ((tp##_is_infinity(xa.fld) && tp##_is_zero(xb.fld)) ||        \
                 (tp##_is_infinity(xb.fld) && tp##_is_zero(xa.fld))) {        \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, sfprf);    \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                      \
-                       tp##_is_signaling_nan(xb.fld)) {                      \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||              \
+                       tp##_is_signaling_nan(xb.fld, &tstat)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);   \
             }                                                                \
         }                                                                    \
@@ -1948,8 +1948,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                           \
             } else if (tp##_is_zero(xa.fld) &&                                \
                 tp##_is_zero(xb.fld)) {                                       \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXZDZ, sfprf);     \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                       \
-                tp##_is_signaling_nan(xb.fld)) {                              \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||               \
+                tp##_is_signaling_nan(xb.fld, &tstat)) {                      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);    \
             }                                                                 \
         }                                                                     \
@@ -1990,7 +1990,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                           \
     helper_reset_fpstatus(env);                                               \
                                                                               \
     for (i = 0; i < nels; i++) {                                              \
-        if (unlikely(tp##_is_signaling_nan(xb.fld))) {                        \
+        if (unlikely(tp##_is_signaling_nan(xb.fld, &env->fp_status))) {       \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);    \
         }                                                                     \
         xt.fld = tp##_div(tp##_one, xb.fld, &env->fp_status);                 \
@@ -2039,7 +2039,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                          \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             if (tp##_is_neg(xb.fld) && !tp##_is_zero(xb.fld)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSQRT, sfprf);   \
-            } else if (tp##_is_signaling_nan(xb.fld)) {                      \
+            } else if (tp##_is_signaling_nan(xb.fld, &tstat)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);   \
             }                                                                \
         }                                                                    \
@@ -2089,7 +2089,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                          \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {    \
             if (tp##_is_neg(xb.fld) && !tp##_is_zero(xb.fld)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSQRT, sfprf);   \
-            } else if (tp##_is_signaling_nan(xb.fld)) {                      \
+            } else if (tp##_is_signaling_nan(xb.fld, &tstat)) {              \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);   \
             }                                                                \
         }                                                                    \
@@ -2274,9 +2274,9 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                           \
         env->fp_status.float_exception_flags |= tstat.float_exception_flags;  \
                                                                               \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) {     \
-            if (tp##_is_signaling_nan(xa.fld) ||                              \
-                tp##_is_signaling_nan(b->fld) ||                              \
-                tp##_is_signaling_nan(c->fld)) {                              \
+            if (tp##_is_signaling_nan(xa.fld, &tstat) ||                      \
+                tp##_is_signaling_nan(b->fld, &tstat) ||                      \
+                tp##_is_signaling_nan(c->fld, &tstat)) {                      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf);    \
                 tstat.float_exception_flags &= ~float_flag_invalid;           \
             }                                                                 \
@@ -2358,8 +2358,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                      \
                                                                          \
     if (unlikely(float64_is_any_nan(xa.VsrD(0)) ||                       \
                  float64_is_any_nan(xb.VsrD(0)))) {                      \
-        if (float64_is_signaling_nan(xa.VsrD(0)) ||                      \
-            float64_is_signaling_nan(xb.VsrD(0))) {                      \
+        if (float64_is_signaling_nan(xa.VsrD(0), &env->fp_status) ||     \
+            float64_is_signaling_nan(xb.VsrD(0), &env->fp_status)) {     \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);       \
         }                                                                \
         if (ordered) {                                                   \
@@ -2406,8 +2406,8 @@ void helper_##name(CPUPPCState *env, uint32_t opcode)                         \
                                                                               \
     for (i = 0; i < nels; i++) {                                              \
         xt.fld = tp##_##op(xa.fld, xb.fld, &env->fp_status);                  \
-        if (unlikely(tp##_is_signaling_nan(xa.fld) ||                         \
-                     tp##_is_signaling_nan(xb.fld))) {                        \
+        if (unlikely(tp##_is_signaling_nan(xa.fld, &env->fp_status) ||        \
+                     tp##_is_signaling_nan(xb.fld, &env->fp_status))) {       \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);            \
         }                                                                     \
     }                                                                         \
@@ -2446,8 +2446,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                       \
     for (i = 0; i < nels; i++) {                                          \
         if (unlikely(tp##_is_any_nan(xa.fld) ||                           \
                      tp##_is_any_nan(xb.fld))) {                          \
-            if (tp##_is_signaling_nan(xa.fld) ||                          \
-                tp##_is_signaling_nan(xb.fld)) {                          \
+            if (tp##_is_signaling_nan(xa.fld, &env->fp_status) ||         \
+                tp##_is_signaling_nan(xb.fld, &env->fp_status)) {         \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);    \
             }                                                             \
             if (svxvc) {                                                  \
@@ -2500,7 +2500,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                \
                                                                    \
     for (i = 0; i < nels; i++) {                                   \
         xt.tfld = stp##_to_##ttp(xb.sfld, &env->fp_status);        \
-        if (unlikely(stp##_is_signaling_nan(xb.sfld))) {           \
+        if (unlikely(stp##_is_signaling_nan(xb.sfld,               \
+                                            &env->fp_status))) {   \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0); \
             xt.tfld = ttp##_snan_to_qnan(xt.tfld);                 \
         }                                                          \
@@ -2555,7 +2556,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                          \
                                                                              \
     for (i = 0; i < nels; i++) {                                             \
         if (unlikely(stp##_is_any_nan(xb.sfld))) {                           \
-            if (stp##_is_signaling_nan(xb.sfld)) {                           \
+            if (stp##_is_signaling_nan(xb.sfld, &env->fp_status)) {          \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);       \
             }                                                                \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXCVI, 0);            \
@@ -2664,7 +2665,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)                    \
     }                                                                  \
                                                                        \
     for (i = 0; i < nels; i++) {                                       \
-        if (unlikely(tp##_is_signaling_nan(xb.fld))) {                 \
+        if (unlikely(tp##_is_signaling_nan(xb.fld,                     \
+                                           &env->fp_status))) {        \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);     \
             xt.fld = tp##_snan_to_qnan(xb.fld);                        \
         } else {                                                       \
diff --git a/target-s390x/fpu_helper.c b/target-s390x/fpu_helper.c
index 1c7f673..d527c98 100644
--- a/target-s390x/fpu_helper.c
+++ b/target-s390x/fpu_helper.c
@@ -266,7 +266,7 @@ uint64_t HELPER(ldeb)(CPUS390XState *env, uint64_t f2)
 {
     float64 ret = float32_to_float64(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float64_maybe_silence_nan(ret);
+    return float64_maybe_silence_nan(ret, &env->fpu_status);
 }
 
 /* convert 128-bit float to 64-bit float */
@@ -274,7 +274,7 @@ uint64_t HELPER(ldxb)(CPUS390XState *env, uint64_t ah, uint64_t al)
 {
     float64 ret = float128_to_float64(make_float128(ah, al), &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float64_maybe_silence_nan(ret);
+    return float64_maybe_silence_nan(ret, &env->fpu_status);
 }
 
 /* convert 64-bit float to 128-bit float */
@@ -282,7 +282,7 @@ uint64_t HELPER(lxdb)(CPUS390XState *env, uint64_t f2)
 {
     float128 ret = float64_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return RET128(float128_maybe_silence_nan(ret));
+    return RET128(float128_maybe_silence_nan(ret, &env->fpu_status));
 }
 
 /* convert 32-bit float to 128-bit float */
@@ -290,7 +290,7 @@ uint64_t HELPER(lxeb)(CPUS390XState *env, uint64_t f2)
 {
     float128 ret = float32_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return RET128(float128_maybe_silence_nan(ret));
+    return RET128(float128_maybe_silence_nan(ret, &env->fpu_status));
 }
 
 /* convert 64-bit float to 32-bit float */
@@ -298,7 +298,7 @@ uint64_t HELPER(ledb)(CPUS390XState *env, uint64_t f2)
 {
     float32 ret = float64_to_float32(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float32_maybe_silence_nan(ret);
+    return float32_maybe_silence_nan(ret, &env->fpu_status);
 }
 
 /* convert 128-bit float to 32-bit float */
@@ -306,7 +306,7 @@ uint64_t HELPER(lexb)(CPUS390XState *env, uint64_t ah, uint64_t al)
 {
     float32 ret = float128_to_float32(make_float128(ah, al), &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float32_maybe_silence_nan(ret);
+    return float32_maybe_silence_nan(ret, &env->fpu_status);
 }
 
 /* 32-bit FP compare */
@@ -623,7 +623,7 @@ uint64_t HELPER(msdb)(CPUS390XState *env, uint64_t f1,
 }
 
 /* test data class 32-bit */
-uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
+uint32_t HELPER(tceb)(CPUS390XState *env, uint64_t f1, uint64_t m2)
 {
     float32 v1 = f1;
     int neg = float32_is_neg(v1);
@@ -632,7 +632,8 @@ uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
     if ((float32_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float32_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float32_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float32_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float32_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc = 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
@@ -643,7 +644,7 @@ uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
 }
 
 /* test data class 64-bit */
-uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
+uint32_t HELPER(tcdb)(CPUS390XState *env, uint64_t v1, uint64_t m2)
 {
     int neg = float64_is_neg(v1);
     uint32_t cc = 0;
@@ -651,7 +652,8 @@ uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
     if ((float64_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float64_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float64_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float64_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float64_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc = 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
@@ -662,7 +664,8 @@ uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
 }
 
 /* test data class 128-bit */
-uint32_t HELPER(tcxb)(uint64_t ah, uint64_t al, uint64_t m2)
+uint32_t HELPER(tcxb)(CPUS390XState *env, uint64_t ah,
+                      uint64_t al, uint64_t m2)
 {
     float128 v1 = make_float128(ah, al);
     int neg = float128_is_neg(v1);
@@ -671,7 +674,8 @@ uint32_t HELPER(tcxb)(uint64_t ah, uint64_t al, uint64_t m2)
     if ((float128_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float128_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float128_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float128_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float128_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc = 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
diff --git a/target-s390x/helper.h b/target-s390x/helper.h
index 7e06119..207a6e7 100644
--- a/target-s390x/helper.h
+++ b/target-s390x/helper.h
@@ -67,9 +67,9 @@ DEF_HELPER_FLAGS_4(maeb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(madb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(mseb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 DEF_HELPER_FLAGS_4(msdb, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
-DEF_HELPER_FLAGS_2(tceb, TCG_CALL_NO_RWG_SE, i32, i64, i64)
-DEF_HELPER_FLAGS_2(tcdb, TCG_CALL_NO_RWG_SE, i32, i64, i64)
-DEF_HELPER_FLAGS_3(tcxb, TCG_CALL_NO_RWG_SE, i32, i64, i64, i64)
+DEF_HELPER_FLAGS_3(tceb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
+DEF_HELPER_FLAGS_3(tcdb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64)
+DEF_HELPER_FLAGS_4(tcxb, TCG_CALL_NO_RWG_SE, i32, env, i64, i64, i64)
 DEF_HELPER_FLAGS_1(clz, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_2(sqeb, TCG_CALL_NO_WG, i64, env, i64)
 DEF_HELPER_FLAGS_2(sqdb, TCG_CALL_NO_WG, i64, env, i64)
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index c871ef2..1dadcd7 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -3979,21 +3979,21 @@ static ExitStatus op_svc(DisasContext *s, DisasOps *o)
 
 static ExitStatus op_tceb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tceb(cc_op, o->in1, o->in2);
+    gen_helper_tceb(cc_op, cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return NO_EXIT;
 }
 
 static ExitStatus op_tcdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcdb(cc_op, o->in1, o->in2);
+    gen_helper_tcdb(cc_op, cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return NO_EXIT;
 }
 
 static ExitStatus op_tcxb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcxb(cc_op, o->out, o->out2, o->in2);
+    gen_helper_tcxb(cc_op, cpu_env, o->out, o->out2, o->in2);
     set_cc_static(s);
     return NO_EXIT;
 }
diff --git a/target-sh4/cpu.c b/target-sh4/cpu.c
index 86ba388..60039ac 100644
--- a/target-sh4/cpu.c
+++ b/target-sh4/cpu.c
@@ -70,6 +70,7 @@ static void superh_cpu_reset(CPUState *s)
     set_flush_to_zero(1, &env->fp_status);
 #endif
     set_default_nan_mode(1, &env->fp_status);
+    set_snan_bit_is_one(1, &env->fp_status);
 }
 
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index 7998ff5..58572c3 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -4670,7 +4670,7 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
                         TCGv r_const;
 
                         gen_address_mask(dc, cpu_addr);
-                        tcg_gen_qemu_ld8u(cpu_val, cpu_addr, dc->mem_idx);
+                        tcg_gen_qemu_ld8s(cpu_val, cpu_addr, dc->mem_idx);
                         r_const = tcg_const_tl(0xff);
                         tcg_gen_qemu_st8(r_const, cpu_addr, dc->mem_idx);
                         tcg_temp_free(r_const);
diff --git a/target-unicore32/cpu.c b/target-unicore32/cpu.c
index 66f43ac..1138687 100644
--- a/target-unicore32/cpu.c
+++ b/target-unicore32/cpu.c
@@ -77,6 +77,7 @@ static void unicore_ii_cpu_initfn(Object *obj)
 
     set_feature(env, UC32_HWCAP_CMOV);
     set_feature(env, UC32_HWCAP_UCF64);
+    set_snan_bit_is_one(1, &env->ucf64.fp_status);
 }
 
 static void uc32_any_cpu_initfn(Object *obj)
@@ -89,6 +90,7 @@ static void uc32_any_cpu_initfn(Object *obj)
 
     set_feature(env, UC32_HWCAP_CMOV);
     set_feature(env, UC32_HWCAP_UCF64);
+    set_snan_bit_is_one(1, &env->ucf64.fp_status);
 }
 
 static const UniCore32CPUInfo uc32_cpus[] = {
-- 
1.9.1


