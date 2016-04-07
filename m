Received: by 10.25.208.211 with SMTP id h202csp591953lfg;
        Thu, 7 Apr 2016 09:08:25 -0700 (PDT)
X-Received: by 10.140.86.213 with SMTP id p79mr4705937qgd.76.1460045301917;
        Thu, 07 Apr 2016 09:08:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 46si6394178qgm.95.2016.04.07.09.08.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 09:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoCTk-0007Yr-FU
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 12:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOg-0006qN-Br
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:03:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOV-0004oN-Dt
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:03:06 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52620 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1aoCOU-0004hK-IV; Thu, 07 Apr 2016 12:02:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 615CE1A458F;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from mcs19.domain.local (mcs19.domain.local [10.10.13.51])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 20BF81A47A4;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Apr 2016 18:00:50 +0200
Message-Id: <1460044851-61721-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1460044851-61721-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460044851-61721-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, rth@twiddle.net,
	petar.jovanovic@imgtec.com, blauwirbel@gmail.com,
	jcmvbkbc@gmail.com, maciej.rozycki@imgtec.com,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, afaerber@suse.de, aurelien@aurel32.net,
	proljc@gmail.com
Subject: [Qemu-arm] =?utf-8?q?=5BPATCH_1/2=5D_softfloat=3A_Implement_run-t?=
	=?utf-8?q?ime-configurable_meaning_of_signaling_NaN_bit?=
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PqcpkWs9ewHF

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch modifies SoftFloat library so that it can be configured at
run-time in relation to the meaning of signaling NaN bit, while, at the
same time, strictly preserving its behavior on all existing platforms.

Background:

In floating-point calculations, there is a need for denoting undefined or
unrepresentable values. This is achieved by defining certain floating-poi=
nt
numerical values to be NaNs (which stands for "not a number"). For additi=
onal
reasons, virtually all modern floating-point unit implementations use two
kinds of NaNs: quiet and signaling. The binary representations of these t=
wo
kinds of NaNs, as a rule, differ only in one bit (that bit is, traditiona=
lly,
the first bit of mantissa).

Up to 2008, standards for floating-point did not specify all details abou=
t
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
adopted IEEE standard prescription, and "0" denotes signaling NaN. On top=
 of
that, Mips architecture for SIMD (also known as MSA, or vector instructio=
ns)
also specifies signaling bit in accordance to IEEE standard. MSA unit can=
 be
implemented with both pre-Release 6 and Release 6 main processor units.

QEMU uses SoftFloat library to implement various floating-point-related
instructions on all platforms. The current QEMU implementation allows for
defining meaning of signaling NaN bit during build time, and is implement=
ed
via preprocessor macro called SNAN_BIT_IS_ONE.

On the other hand, the change in this patch enables SoftFloat library to =
be
configured in run-time. This configuration is meant to occur during CPU
initialization, at the moment when it is definitely known what desired
behavior for particular CPU (or any additional FPUs) is.

The change is implemented so that it is consistent with existing
implementation of similar cases. This means that structure float_status i=
s
used for passing the information about desired signaling NaN bit on each
invocation of SoftFloat functions. The additional field in float_status i=
s
called snan_bit_is_one, which supersedes macro SNAN_BIT_IS_ONE.

IMPORTANT:

This change is not meant to create any change in emulator behavior or
functionality on any platform. It just provides the means for SoftFloat
library to be used in a more flexible way - in other words, it will just
prepare SoftFloat library for usage related to Mips platform and its
specifics regarding signaling bit meaning, which is done in the next patc=
h.

Further break down of changes:

  1) Added field snan_bit_is_one to the structure float_status, and
     correspondent setter function set_snan_bit_is_one().

  2) Constants <float16|float32|float64|floatx80|float128>_default_nan
     (used both internally and externally) converted to functions
     <float16|float32|float64|floatx80|float128>_default_nan(float_status=
*).
     This is necessary since they are dependent on signaling bit meaning.
     At the same time, for the sake of code cleanup and simplicity, const=
ants
     <floatx80|float128>_default_nan_<low|high> (used only internally wit=
hin
     SoftFloat library) are removed, as not needed.

  3) Added a float_status* argument to SoftFloat library functions
     XXX_is_quiet_nan(XXX a_), XXX_is_signaling_nan(XXX a_),
     XXX_maybe_silence_nan(XXX a_). This argument must be present in
     order to enable correct invocation of new version of functions
     XXX_default_nan(). (XXX is <float16|float32|float64|floatx80|float12=
8>
     here)

  4) Only for mips platform, and only for cases when snan_bit_is_one is 0=
,
     desired values for default NaNs (in their 16-, 32-, and 64-bit flavo=
rs)
     are different than the default ones currently provided by SoftFloat
     library (which are actually correct values for pre-nan2008 mips case=
s).
     This is all sorted out by this patch. The newly added values will
     never be used, if only this patch from the patch series is applied.
     However, they will kick in once appropriate mips architectures are
     configured to use them, which happens in the next patch of the serie=
s.

  5) Only for mips platform, and only for cases when snan_bit_is_one is 0=
,
     current pickNaNMulAdd() would not provide the right order for argume=
nt
     comparisons. This patch fixes this behavior too. Similarly to the co=
de
     from the previous point, the newly added code would have never been
     executed, if this patch only had been applied.

  6) Updated code for all platforms to reflect changes in SoftFloat libra=
ry.
     This change is twofolds: it includes modifications of SoftFloat libr=
ary
     functions invocations, and an addition of invocation of function
     set_snan_bit_is_one() during CPU initialization, with arguments that
     are appropriate for each particular platform.

     In order to be at the same time accurate in relation to floating poi=
nt
     arithmetics and consistent with a particular platform code, followin=
g
     principle is adopted related to invocations of new function
     set_snan_bit_is_one():

     1. If a target platform doesn't use SoftFloat library, nothing is ad=
ded.
            (cris, lm32, moxie)
     2. Else, if a target platform's signaling bit meaning is "1 is
        signaling", explicit invocation of set_snan_bit_is_one(1) is adde=
d.
            (mips, sh4, unicore32)
              (for mips this will change in the second patch of this
              series, but this very patch leaves mips features as
              they currently are.)
     3. Else, if a target platform explicitly sets other fields of its
        float_status structure(s), explicit invocation of
        set_snan_bit_is_one(0) is added.
            (ppc, s390x, tricore)
     4. Else, if a target platform doesn't explicitly set its structure
        CPUXXXState, explicit invocation of set_snan_bit_is_one(0) is add=
ed.
            (alpha, xtensa)
     5. For remaining cases, nothing is added. (Those cases explicitly se=
t
        their CPUXXXState/float_status structures to 0, and thus implicit=
ly
        perform set_snan_bit_is_one(0).)
            (arm, i386, m68k, microblaze, openrisc, sparc)

     Or, by platform:

     A. alpha - structure CPUAlphaState not explicitly set to 0s, explici=
t
            invocation of set_snan_bit_is_one(0) added
     B. arm - relevant parts of CPUARMState structure explicitly set to 0=
,
            nothing added (implicit set_snan_bit_is_one(0))
     C. cris - does not use SoftFloat library, nothing added
     D. i386 - structure CPUX86State explicitly set to 0s, nothing added
            (implicit set_snan_bit_is_one(0))
     E. lm32 - does not use SoftFloat library, nothing added
     F. m68k - structure CPUM68KState explicitly set to 0s,
            nothing added (implicit set_snan_bit_is_one(0))
     G. microblaze - structure CPUMBState explicitly set to 0s, nothing a=
dded
            (implicit set_snan_bit_is_one(0))
     H. mips - must explicitly invoke set_snan_bit_is_one(1)
     I. moxie - does not use SoftFloat library, nothing added
     J. openrisc - structure CPUOpenRISCState explicitly set to 0s, nothi=
ng
            added (implicit set_snan_bit_is_one(0))
     K. ppc - explicitly sets other fields of float_status, explicit
            invocation of set_snan_bit_is_one(0) added
     L. s390x - explicitely sets other fields of float_status, explicit
            invocation of set_snan_bit_is_one(0) added
     M. sh4 - must explicitly invoke set_snan_bit_is_one(1)
     N. sparc - structure CPUSPARCState explicitly set to 0s, nothing add=
ed
            (implicit set_snan_bit_is_one(0))
     O. tricore - explicitly sets other fields of float_status, explicit
            invocation of set_snan_bit_is_one(0) added
     P. unicore32 - must explicitely invoke set_snan_bit_is_one(1)
     Q. xtensa - structure CPUXtensaState not explicitly set to 0s, expli=
cit
            invocation of set_snan_bit_is_one(0) added

[1] "IEEE Standard for Floating-Point Arithmetic",
    IEEE Computer Society, August 29, 2008.

Tested-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de=E2=80=8E> (=
TriCore part)
Signed-off-by: Maciej Rozycki <maciej.rozycki@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 fpu/softfloat-specialize.h    |  587 +++++++++++++++++++++--------------=
------
 fpu/softfloat.c               |  180 ++++++-------
 include/fpu/softfloat.h       |   49 ++--
 target-alpha/cpu.c            |    2 +
 target-arm/helper-a64.c       |   14 +-
 target-arm/helper.c           |   40 +--
 target-m68k/helper.c          |    6 +-
 target-microblaze/cpu.c       |    2 +
 target-microblaze/op_helper.c |    6 +-
 target-mips/helper.h          |    4 +-
 target-mips/msa_helper.c      |   96 ++++---
 target-mips/op_helper.c       |   16 +-
 target-mips/translate.c       |    5 +-
 target-mips/translate_init.c  |    5 +-
 target-ppc/fpu_helper.c       |  120 ++++-----
 target-ppc/translate_init.c   |    2 +
 target-s390x/cpu.c            |    1 +
 target-s390x/fpu_helper.c     |   28 +-
 target-s390x/helper.h         |    6 +-
 target-s390x/translate.c      |    6 +-
 target-sh4/cpu.c              |    1 +
 target-sparc/cpu.c            |    1 +
 target-tricore/helper.c       |    1 +
 target-unicore32/cpu.c        |    2 +
 target-xtensa/cpu.c           |    3 +
 25 files changed, 613 insertions(+), 570 deletions(-)

diff --git a/fpu/softfloat-specialize.h b/fpu/softfloat-specialize.h
index a4cbdad..1f3af27 100644
--- a/fpu/softfloat-specialize.h
+++ b/fpu/softfloat-specialize.h
@@ -79,16 +79,6 @@ this code that are retained.
  * version 2 or later. See the COPYING file in the top-level directory.
  */
=20
-/* Does the target distinguish signaling NaNs from non-signaling NaNs
- * by setting the most significant bit of the mantissa for a signaling N=
aN?
- * (The more common choice is to have it be zero for SNaN and one for QN=
aN.)
- */
-#if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNICOR=
E32)
-#define SNAN_BIT_IS_ONE 1
-#else
-#define SNAN_BIT_IS_ONE 0
-#endif
-
 #if defined(TARGET_XTENSA)
 /* Define for architectures which deviate from IEEE in not supporting
  * signaling NaNs (so all NaNs are treated as quiet).
@@ -99,73 +89,101 @@ this code that are retained.
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated half-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
+float16 float16_default_nan(float_status *status)
+{
 #if defined(TARGET_ARM)
-const float16 float16_default_nan =3D const_float16(0x7E00);
-#elif SNAN_BIT_IS_ONE
-const float16 float16_default_nan =3D const_float16(0x7DFF);
+    return const_float16(0x7E00);
+#else
+    if (status->snan_bit_is_one)
+        return const_float16(0x7DFF);
+    else
+#if defined(TARGET_MIPS)
+        return const_float16(0x7E00);
 #else
-const float16 float16_default_nan =3D const_float16(0xFE00);
+        return const_float16(0xFE00);
 #endif
+#endif
+}
=20
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated single-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
+float32 float32_default_nan(float_status *status)
+{
 #if defined(TARGET_SPARC)
-const float32 float32_default_nan =3D const_float32(0x7FFFFFFF);
+    return const_float32(0x7FFFFFFF);
 #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA=
) || \
       defined(TARGET_XTENSA) || defined(TARGET_S390X) || defined(TARGET_=
TRICORE)
-const float32 float32_default_nan =3D const_float32(0x7FC00000);
-#elif SNAN_BIT_IS_ONE
-const float32 float32_default_nan =3D const_float32(0x7FBFFFFF);
+    return const_float32(0x7FC00000);
 #else
-const float32 float32_default_nan =3D const_float32(0xFFC00000);
+    if (status->snan_bit_is_one)
+        return const_float32(0x7FBFFFFF);
+    else
+#if defined(TARGET_MIPS)
+        return const_float32(0x7FC00000);
+#else
+        return const_float16(0xFFC00000);
+#endif
 #endif
+}
=20
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated double-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
+float64 float64_default_nan(float_status *status)
+{
 #if defined(TARGET_SPARC)
-const float64 float64_default_nan =3D const_float64(LIT64( 0x7FFFFFFFFFF=
FFFFF ));
+    return const_float64(LIT64( 0x7FFFFFFFFFFFFFFF ));
 #elif defined(TARGET_PPC) || defined(TARGET_ARM) || defined(TARGET_ALPHA=
) || \
       defined(TARGET_S390X)
-const float64 float64_default_nan =3D const_float64(LIT64( 0x7FF80000000=
00000 ));
-#elif SNAN_BIT_IS_ONE
-const float64 float64_default_nan =3D const_float64(LIT64(0x7FF7FFFFFFFF=
FFFF));
+    return const_float64(LIT64( 0x7FF8000000000000 ));
+#else
+    if (status->snan_bit_is_one)
+        return const_float64(LIT64( 0x7FF7FFFFFFFFFFFF ));
+    else
+#if defined(TARGET_MIPS)
+        return const_float64(LIT64( 0x7FF8000000000000 ));
 #else
-const float64 float64_default_nan =3D const_float64(LIT64( 0xFFF80000000=
00000 ));
+        return const_float16(LIT64( 0xFFF8000000000000 ));
 #endif
+#endif
+}
=20
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated extended double-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-#if SNAN_BIT_IS_ONE
-#define floatx80_default_nan_high 0x7FFF
-#define floatx80_default_nan_low  LIT64(0xBFFFFFFFFFFFFFFF)
-#else
-#define floatx80_default_nan_high 0xFFFF
-#define floatx80_default_nan_low  LIT64( 0xC000000000000000 )
-#endif
+floatx80 floatx80_default_nan(float_status *status) {
+    floatx80 r;
=20
-const floatx80 floatx80_default_nan
-    =3D make_floatx80_init(floatx80_default_nan_high, floatx80_default_n=
an_low);
+    if (status->snan_bit_is_one) {
+        r.low =3D LIT64( 0xBFFFFFFFFFFFFFFF );
+        r.high =3D 0x7FFF;
+    } else {
+        r.low =3D LIT64( 0xC000000000000000 );
+        r.high =3D 0xFFFF;
+    }
+    return r;
+}
=20
 /*----------------------------------------------------------------------=
------
-| The pattern for a default generated quadruple-precision NaN.  The `hig=
h' and
-| `low' values hold the most- and least-significant bits, respectively.
+| The pattern for a default generated quadruple-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-#if SNAN_BIT_IS_ONE
-#define float128_default_nan_high LIT64(0x7FFF7FFFFFFFFFFF)
-#define float128_default_nan_low  LIT64(0xFFFFFFFFFFFFFFFF)
-#elif defined(TARGET_S390X)
-#define float128_default_nan_high LIT64( 0x7FFF800000000000 )
-#define float128_default_nan_low  LIT64( 0x0000000000000000 )
+float128 float128_default_nan(float_status *status) {
+    float128 r;
+
+    if (status->snan_bit_is_one) {
+        r.low =3D LIT64( 0xFFFFFFFFFFFFFFFF );
+        r.high =3D LIT64( 0x7FFF7FFFFFFFFFFF );
+    } else {
+        r.low =3D LIT64( 0x0000000000000000 );
+#if defined(TARGET_S390X)
+        r.high =3D LIT64( 0x7FFF800000000000 );
 #else
-#define float128_default_nan_high LIT64( 0xFFFF800000000000 )
-#define float128_default_nan_low  LIT64( 0x0000000000000000 )
+        r.high =3D LIT64( 0xFFFF800000000000 );
 #endif
-
-const float128 float128_default_nan
-    =3D make_float128_init(float128_default_nan_high, float128_default_n=
an_low);
+    }
+    return r;
+}
=20
 /*----------------------------------------------------------------------=
------
 | Raises the exceptions specified by `flags'.  Floating-point traps can =
be
@@ -188,12 +206,12 @@ typedef struct {
 } commonNaNT;
=20
 #ifdef NO_SIGNALING_NANS
-int float16_is_quiet_nan(float16 a_)
+int float16_is_quiet_nan(float16 a_, float_status *status)
 {
     return float16_is_any_nan(a_);
 }
=20
-int float16_is_signaling_nan(float16 a_)
+int float16_is_signaling_nan(float16 a_, float_status *status)
 {
     return 0;
 }
@@ -203,14 +221,13 @@ int float16_is_signaling_nan(float16 a_)
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float16_is_quiet_nan(float16 a_)
+int float16_is_quiet_nan(float16 a_, float_status *status)
 {
     uint16_t a =3D float16_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 9) & 0x3F) =3D=3D 0x3E) && (a & 0x1FF);
-#else
-    return ((a & ~0x8000) >=3D 0x7c80);
-#endif
+    if (status->snan_bit_is_one)
+        return (((a >> 9) & 0x3F) =3D=3D 0x3E) && (a & 0x1FF);
+    else
+        return ((a & ~0x8000) >=3D 0x7c80);
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -218,14 +235,13 @@ int float16_is_quiet_nan(float16 a_)
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float16_is_signaling_nan(float16 a_)
+int float16_is_signaling_nan(float16 a_, float_status *status)
 {
     uint16_t a =3D float16_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((a & ~0x8000) >=3D 0x7c80);
-#else
-    return (((a >> 9) & 0x3F) =3D=3D 0x3E) && (a & 0x1FF);
-#endif
+    if (status->snan_bit_is_one)
+        return ((a & ~0x8000) >=3D 0x7c80);
+    else
+        return (((a >> 9) & 0x3F) =3D=3D 0x3E) && (a & 0x1FF);
 }
 #endif
=20
@@ -233,20 +249,16 @@ int float16_is_signaling_nan(float16 a_)
 | Returns a quiet NaN if the half-precision floating point value `a' is =
a
 | signaling NaN; otherwise returns `a'.
 *-----------------------------------------------------------------------=
-----*/
-float16 float16_maybe_silence_nan(float16 a_)
+float16 float16_maybe_silence_nan(float16 a_, float_status *status)
 {
-    if (float16_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNIC=
ORE32)
-        return float16_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint16_t a =3D float16_val(a_);
-        a |=3D (1 << 9);
-        return make_float16(a);
-#endif
+    if (float16_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one)
+            return float16_default_nan(status);
+        else {
+            uint16_t a =3D float16_val(a_);
+            a |=3D (1 << 9);
+            return make_float16(a);
+        }
     }
     return a_;
 }
@@ -261,7 +273,7 @@ static commonNaNT float16ToCommonNaN(float16 a, float=
_status *status)
 {
     commonNaNT z;
=20
-    if (float16_is_signaling_nan(a)) {
+    if (float16_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     z.sign =3D float16_val(a) >> 15;
@@ -280,24 +292,24 @@ static float16 commonNaNToFloat16(commonNaNT a, flo=
at_status *status)
     uint16_t mantissa =3D a.high>>54;
=20
     if (status->default_nan_mode) {
-        return float16_default_nan;
+        return float16_default_nan(status);
     }
=20
     if (mantissa) {
         return make_float16(((((uint16_t) a.sign) << 15)
                              | (0x1F << 10) | mantissa));
     } else {
-        return float16_default_nan;
+        return float16_default_nan(status);
     }
 }
=20
 #ifdef NO_SIGNALING_NANS
-int float32_is_quiet_nan(float32 a_)
+int float32_is_quiet_nan(float32 a_, float_status *status)
 {
     return float32_is_any_nan(a_);
 }
=20
-int float32_is_signaling_nan(float32 a_)
+int float32_is_signaling_nan(float32 a_, float_status *status)
 {
     return 0;
 }
@@ -307,14 +319,13 @@ int float32_is_signaling_nan(float32 a_)
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float32_is_quiet_nan( float32 a_ )
+int float32_is_quiet_nan( float32 a_, float_status *status )
 {
     uint32_t a =3D float32_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 22) & 0x1ff) =3D=3D 0x1fe) && (a & 0x003fffff);
-#else
-    return ((uint32_t)(a << 1) >=3D 0xff800000);
-#endif
+    if (status->snan_bit_is_one)
+        return ( ( ( a>>22 ) & 0x1FF ) =3D=3D 0x1FE ) && ( a & 0x003FFFF=
F );
+    else
+        return ( 0xFF800000 <=3D (uint32_t) ( a<<1 ) );
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -322,14 +333,13 @@ int float32_is_quiet_nan( float32 a_ )
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float32_is_signaling_nan( float32 a_ )
+int float32_is_signaling_nan( float32 a_, float_status *status )
 {
     uint32_t a =3D float32_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((uint32_t)(a << 1) >=3D 0xff800000);
-#else
-    return ( ( ( a>>22 ) & 0x1FF ) =3D=3D 0x1FE ) && ( a & 0x003FFFFF );
-#endif
+    if (status->snan_bit_is_one)
+        return ( 0xFF800000 <=3D (uint32_t) ( a<<1 ) );
+    else
+        return ( ( ( a>>22 ) & 0x1FF ) =3D=3D 0x1FE ) && ( a & 0x003FFFF=
F );
 }
 #endif
=20
@@ -338,20 +348,16 @@ int float32_is_signaling_nan( float32 a_ )
 | signaling NaN; otherwise returns `a'.
 *-----------------------------------------------------------------------=
-----*/
=20
-float32 float32_maybe_silence_nan( float32 a_ )
+float32 float32_maybe_silence_nan( float32 a_, float_status *status )
 {
-    if (float32_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNIC=
ORE32)
-        return float32_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint32_t a =3D float32_val(a_);
-        a |=3D (1 << 22);
-        return make_float32(a);
-#endif
+    if (float32_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one)
+            return float32_default_nan(status);
+        else {
+            uint32_t a =3D float32_val(a_);
+            a |=3D (1 << 22);
+            return make_float32(a);
+        }
     }
     return a_;
 }
@@ -366,7 +372,7 @@ static commonNaNT float32ToCommonNaN(float32 a, float=
_status *status)
 {
     commonNaNT z;
=20
-    if (float32_is_signaling_nan(a)) {
+    if (float32_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     z.sign =3D float32_val(a)>>31;
@@ -385,14 +391,14 @@ static float32 commonNaNToFloat32(commonNaNT a, flo=
at_status *status)
     uint32_t mantissa =3D a.high>>41;
=20
     if (status->default_nan_mode) {
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
=20
     if ( mantissa )
         return make_float32(
             ( ( (uint32_t) a.sign )<<31 ) | 0x7F800000 | ( a.high>>41 ) =
);
     else
-        return float32_default_nan;
+        return float32_default_nan(status);
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -556,19 +562,36 @@ static int pickNaNMulAdd(flag aIsQNaN, flag aIsSNaN=
, flag bIsQNaN, flag bIsSNaN,
         return 3;
     }
=20
-    /* Prefer sNaN over qNaN, in the a, b, c order. */
-    if (aIsSNaN) {
-        return 0;
-    } else if (bIsSNaN) {
-        return 1;
-    } else if (cIsSNaN) {
-        return 2;
-    } else if (aIsQNaN) {
-        return 0;
-    } else if (bIsQNaN) {
-        return 1;
+    if (status->snan_bit_is_one) {
+        /* Prefer sNaN over qNaN, in the a, b, c order. */
+        if (aIsSNaN) {
+            return 0;
+        } else if (bIsSNaN) {
+            return 1;
+        } else if (cIsSNaN) {
+            return 2;
+        } else if (aIsQNaN) {
+            return 0;
+        } else if (bIsQNaN) {
+            return 1;
+        } else {
+            return 2;
+        }
     } else {
-        return 2;
+        /* Prefer sNaN over qNaN, in the c, a, b order. */
+        if (cIsSNaN) {
+            return 2;
+        } else if (aIsSNaN) {
+            return 0;
+        } else if (bIsSNaN) {
+            return 1;
+        } else if (cIsQNaN) {
+            return 2;
+        } else if (aIsQNaN) {
+            return 0;
+        } else {
+            return 1;
+        }
     }
 }
 #elif defined(TARGET_PPC)
@@ -626,10 +649,10 @@ static float32 propagateFloat32NaN(float32 a, float=
32 b, float_status *status)
     flag aIsLargerSignificand;
     uint32_t av, bv;
=20
-    aIsQuietNaN =3D float32_is_quiet_nan( a );
-    aIsSignalingNaN =3D float32_is_signaling_nan( a );
-    bIsQuietNaN =3D float32_is_quiet_nan( b );
-    bIsSignalingNaN =3D float32_is_signaling_nan( b );
+    aIsQuietNaN =3D float32_is_quiet_nan( a, status );
+    aIsSignalingNaN =3D float32_is_signaling_nan( a, status );
+    bIsQuietNaN =3D float32_is_quiet_nan( b, status );
+    bIsSignalingNaN =3D float32_is_signaling_nan( b, status );
     av =3D float32_val(a);
     bv =3D float32_val(b);
=20
@@ -638,7 +661,7 @@ static float32 propagateFloat32NaN(float32 a, float32=
 b, float_status *status)
     }
=20
     if (status->default_nan_mode)
-        return float32_default_nan;
+        return float32_default_nan(status);
=20
     if ((uint32_t)(av<<1) < (uint32_t)(bv<<1)) {
         aIsLargerSignificand =3D 0;
@@ -650,9 +673,9 @@ static float32 propagateFloat32NaN(float32 a, float32=
 b, float_status *status)
=20
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingN=
aN,
                 aIsLargerSignificand)) {
-        return float32_maybe_silence_nan(b);
+        return float32_maybe_silence_nan(b, status);
     } else {
-        return float32_maybe_silence_nan(a);
+        return float32_maybe_silence_nan(a, status);
     }
 }
=20
@@ -673,12 +696,12 @@ static float32 propagateFloat32MulAddNaN(float32 a,=
 float32 b,
         cIsQuietNaN, cIsSignalingNaN;
     int which;
=20
-    aIsQuietNaN =3D float32_is_quiet_nan(a);
-    aIsSignalingNaN =3D float32_is_signaling_nan(a);
-    bIsQuietNaN =3D float32_is_quiet_nan(b);
-    bIsSignalingNaN =3D float32_is_signaling_nan(b);
-    cIsQuietNaN =3D float32_is_quiet_nan(c);
-    cIsSignalingNaN =3D float32_is_signaling_nan(c);
+    aIsQuietNaN =3D float32_is_quiet_nan(a, status);
+    aIsSignalingNaN =3D float32_is_signaling_nan(a, status);
+    bIsQuietNaN =3D float32_is_quiet_nan(b, status);
+    bIsSignalingNaN =3D float32_is_signaling_nan(b, status);
+    cIsQuietNaN =3D float32_is_quiet_nan(c, status);
+    cIsSignalingNaN =3D float32_is_signaling_nan(c, status);
=20
     if (aIsSignalingNaN | bIsSignalingNaN | cIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -692,29 +715,29 @@ static float32 propagateFloat32MulAddNaN(float32 a,=
 float32 b,
         /* Note that this check is after pickNaNMulAdd so that function
          * has an opportunity to set the Invalid flag.
          */
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
=20
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
=20
 #ifdef NO_SIGNALING_NANS
-int float64_is_quiet_nan(float64 a_)
+int float64_is_quiet_nan(float64 a_, float_status *status)
 {
     return float64_is_any_nan(a_);
 }
=20
-int float64_is_signaling_nan(float64 a_)
+int float64_is_signaling_nan(float64 a_, float_status *status)
 {
     return 0;
 }
@@ -724,15 +747,15 @@ int float64_is_signaling_nan(float64 a_)
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float64_is_quiet_nan( float64 a_ )
+int float64_is_quiet_nan( float64 a_, float_status *status)
 {
     uint64_t a =3D float64_val(a_);
-#if SNAN_BIT_IS_ONE
-    return (((a >> 51) & 0xfff) =3D=3D 0xffe)
-           && (a & 0x0007ffffffffffffULL);
-#else
-    return ((a << 1) >=3D 0xfff0000000000000ULL);
-#endif
+    if (status->snan_bit_is_one)
+        return
+               ( ( ( a>>51 ) & 0xFFF ) =3D=3D 0xFFE )
+            && ( a & LIT64( 0x0007FFFFFFFFFFFF ) );
+    else
+        return ( LIT64( 0xFFF0000000000000 ) <=3D (uint64_t) ( a<<1 ) );
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -740,16 +763,15 @@ int float64_is_quiet_nan( float64 a_ )
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float64_is_signaling_nan( float64 a_ )
+int float64_is_signaling_nan( float64 a_, float_status *status )
 {
     uint64_t a =3D float64_val(a_);
-#if SNAN_BIT_IS_ONE
-    return ((a << 1) >=3D 0xfff0000000000000ULL);
-#else
-    return
-           ( ( ( a>>51 ) & 0xFFF ) =3D=3D 0xFFE )
-        && ( a & LIT64( 0x0007FFFFFFFFFFFF ) );
-#endif
+    if (status->snan_bit_is_one)
+        return ( LIT64( 0xFFF0000000000000 ) <=3D (uint64_t) ( a<<1 ) );
+    else
+        return
+               ( ( ( a>>51 ) & 0xFFF ) =3D=3D 0xFFE )
+            && ( a & LIT64( 0x0007FFFFFFFFFFFF ) );
 }
 #endif
=20
@@ -758,20 +780,16 @@ int float64_is_signaling_nan( float64 a_ )
 | signaling NaN; otherwise returns `a'.
 *-----------------------------------------------------------------------=
-----*/
=20
-float64 float64_maybe_silence_nan( float64 a_ )
+float64 float64_maybe_silence_nan( float64 a_, float_status *status )
 {
-    if (float64_is_signaling_nan(a_)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNIC=
ORE32)
-        return float64_default_nan;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        uint64_t a =3D float64_val(a_);
-        a |=3D LIT64( 0x0008000000000000 );
-        return make_float64(a);
-#endif
+    if (float64_is_signaling_nan(a_, status)) {
+        if (status->snan_bit_is_one)
+            return float64_default_nan(status);
+        else {
+            uint64_t a =3D float64_val(a_);
+            a |=3D LIT64( 0x0008000000000000 );
+            return make_float64(a);
+        }
     }
     return a_;
 }
@@ -786,7 +804,7 @@ static commonNaNT float64ToCommonNaN(float64 a, float=
_status *status)
 {
     commonNaNT z;
=20
-    if (float64_is_signaling_nan(a)) {
+    if (float64_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     z.sign =3D float64_val(a)>>63;
@@ -805,7 +823,7 @@ static float64 commonNaNToFloat64(commonNaNT a, float=
_status *status)
     uint64_t mantissa =3D a.high>>12;
=20
     if (status->default_nan_mode) {
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
=20
     if ( mantissa )
@@ -814,7 +832,7 @@ static float64 commonNaNToFloat64(commonNaNT a, float=
_status *status)
             | LIT64( 0x7FF0000000000000 )
             | ( a.high>>12 ));
     else
-        return float64_default_nan;
+        return float64_default_nan(status);
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -829,10 +847,10 @@ static float64 propagateFloat64NaN(float64 a, float=
64 b, float_status *status)
     flag aIsLargerSignificand;
     uint64_t av, bv;
=20
-    aIsQuietNaN =3D float64_is_quiet_nan( a );
-    aIsSignalingNaN =3D float64_is_signaling_nan( a );
-    bIsQuietNaN =3D float64_is_quiet_nan( b );
-    bIsSignalingNaN =3D float64_is_signaling_nan( b );
+    aIsQuietNaN =3D float64_is_quiet_nan( a, status );
+    aIsSignalingNaN =3D float64_is_signaling_nan( a, status );
+    bIsQuietNaN =3D float64_is_quiet_nan( b, status );
+    bIsSignalingNaN =3D float64_is_signaling_nan( b, status );
     av =3D float64_val(a);
     bv =3D float64_val(b);
=20
@@ -841,7 +859,7 @@ static float64 propagateFloat64NaN(float64 a, float64=
 b, float_status *status)
     }
=20
     if (status->default_nan_mode)
-        return float64_default_nan;
+        return float64_default_nan(status);
=20
     if ((uint64_t)(av<<1) < (uint64_t)(bv<<1)) {
         aIsLargerSignificand =3D 0;
@@ -853,9 +871,9 @@ static float64 propagateFloat64NaN(float64 a, float64=
 b, float_status *status)
=20
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingN=
aN,
                 aIsLargerSignificand)) {
-        return float64_maybe_silence_nan(b);
+        return float64_maybe_silence_nan(b, status);
     } else {
-        return float64_maybe_silence_nan(a);
+        return float64_maybe_silence_nan(a, status);
     }
 }
=20
@@ -876,12 +894,12 @@ static float64 propagateFloat64MulAddNaN(float64 a,=
 float64 b,
         cIsQuietNaN, cIsSignalingNaN;
     int which;
=20
-    aIsQuietNaN =3D float64_is_quiet_nan(a);
-    aIsSignalingNaN =3D float64_is_signaling_nan(a);
-    bIsQuietNaN =3D float64_is_quiet_nan(b);
-    bIsSignalingNaN =3D float64_is_signaling_nan(b);
-    cIsQuietNaN =3D float64_is_quiet_nan(c);
-    cIsSignalingNaN =3D float64_is_signaling_nan(c);
+    aIsQuietNaN =3D float64_is_quiet_nan(a, status);
+    aIsSignalingNaN =3D float64_is_signaling_nan(a, status);
+    bIsQuietNaN =3D float64_is_quiet_nan(b, status);
+    bIsSignalingNaN =3D float64_is_signaling_nan(b, status);
+    cIsQuietNaN =3D float64_is_quiet_nan(c, status);
+    cIsSignalingNaN =3D float64_is_signaling_nan(c, status);
=20
     if (aIsSignalingNaN | bIsSignalingNaN | cIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
@@ -895,29 +913,29 @@ static float64 propagateFloat64MulAddNaN(float64 a,=
 float64 b,
         /* Note that this check is after pickNaNMulAdd so that function
          * has an opportunity to set the Invalid flag.
          */
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
=20
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
=20
 #ifdef NO_SIGNALING_NANS
-int floatx80_is_quiet_nan(floatx80 a_)
+int floatx80_is_quiet_nan(floatx80 a_, float_status *status)
 {
     return floatx80_is_any_nan(a_);
 }
=20
-int floatx80_is_signaling_nan(floatx80 a_)
+int floatx80_is_signaling_nan(floatx80 a_, float_status *status)
 {
     return 0;
 }
@@ -928,19 +946,20 @@ int floatx80_is_signaling_nan(floatx80 a_)
 | function for other types as floatx80 has an explicit bit.
 *-----------------------------------------------------------------------=
-----*/
=20
-int floatx80_is_quiet_nan( floatx80 a )
+int floatx80_is_quiet_nan( floatx80 a, float_status *status )
 {
-#if SNAN_BIT_IS_ONE
-    uint64_t aLow;
-
-    aLow =3D a.low & ~0x4000000000000000ULL;
-    return ((a.high & 0x7fff) =3D=3D 0x7fff)
-        && (aLow << 1)
-        && (a.low =3D=3D aLow);
-#else
-    return ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
-        && (LIT64( 0x8000000000000000 ) <=3D ((uint64_t) ( a.low<<1 )));
-#endif
+    if (status->snan_bit_is_one) {
+        uint64_t aLow;
+
+        aLow =3D a.low & ~ LIT64( 0x4000000000000000 );
+        return
+               ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
+            && (uint64_t) ( aLow<<1 )
+            && ( a.low =3D=3D aLow );
+    }
+    else
+        return ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
+            && (LIT64( 0x8000000000000000 ) <=3D ((uint64_t) ( a.low<<1 =
)));
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -949,20 +968,20 @@ int floatx80_is_quiet_nan( floatx80 a )
 | function for other types as floatx80 has an explicit bit.
 *-----------------------------------------------------------------------=
-----*/
=20
-int floatx80_is_signaling_nan( floatx80 a )
+int floatx80_is_signaling_nan( floatx80 a, float_status *status )
 {
-#if SNAN_BIT_IS_ONE
-    return ((a.high & 0x7fff) =3D=3D 0x7fff)
-        && ((a.low << 1) >=3D 0x8000000000000000ULL);
-#else
-    uint64_t aLow;
-
-    aLow =3D a.low & ~ LIT64( 0x4000000000000000 );
-    return
-           ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
-        && (uint64_t) ( aLow<<1 )
-        && ( a.low =3D=3D aLow );
-#endif
+    if (status->snan_bit_is_one)
+        return ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
+            && (LIT64( 0x8000000000000000 ) <=3D ((uint64_t) ( a.low<<1 =
)));
+    else {
+        uint64_t aLow;
+
+        aLow =3D a.low & ~ LIT64( 0x4000000000000000 );
+        return
+               ( ( a.high & 0x7FFF ) =3D=3D 0x7FFF )
+            && (uint64_t) ( aLow<<1 )
+            && ( a.low =3D=3D aLow );
+    }
 }
 #endif
=20
@@ -971,20 +990,16 @@ int floatx80_is_signaling_nan( floatx80 a )
 | `a' is a signaling NaN; otherwise returns `a'.
 *-----------------------------------------------------------------------=
-----*/
=20
-floatx80 floatx80_maybe_silence_nan( floatx80 a )
+floatx80 floatx80_maybe_silence_nan( floatx80 a, float_status *status )
 {
-    if (floatx80_is_signaling_nan(a)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNIC=
ORE32)
-        a.low =3D floatx80_default_nan_low;
-        a.high =3D floatx80_default_nan_high;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        a.low |=3D LIT64( 0xC000000000000000 );
-        return a;
-#endif
+    if (floatx80_is_signaling_nan(a, status)) {
+        if (status->snan_bit_is_one) {
+            a =3D floatx80_default_nan(status);
+        }
+        else {
+            a.low |=3D LIT64( 0xC000000000000000 );
+            return a;
+        }
     }
     return a;
 }
@@ -998,8 +1013,9 @@ floatx80 floatx80_maybe_silence_nan( floatx80 a )
 static commonNaNT floatx80ToCommonNaN(floatx80 a, float_status *status)
 {
     commonNaNT z;
+    floatx80 d;
=20
-    if (floatx80_is_signaling_nan(a)) {
+    if (floatx80_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     if ( a.low >> 63 ) {
@@ -1007,9 +1023,10 @@ static commonNaNT floatx80ToCommonNaN(floatx80 a, =
float_status *status)
         z.low =3D 0;
         z.high =3D a.low << 1;
     } else {
-        z.sign =3D floatx80_default_nan_high >> 15;
+        d =3D floatx80_default_nan(status);
+        z.sign =3D d.high >> 15;
         z.low =3D 0;
-        z.high =3D floatx80_default_nan_low << 1;
+        z.high =3D d.low << 1;
     }
     return z;
 }
@@ -1024,19 +1041,15 @@ static floatx80 commonNaNToFloatx80(commonNaNT a,=
 float_status *status)
     floatx80 z;
=20
     if (status->default_nan_mode) {
-        z.low =3D floatx80_default_nan_low;
-        z.high =3D floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
=20
     if (a.high >> 1) {
         z.low =3D LIT64( 0x8000000000000000 ) | a.high >> 1;
         z.high =3D ( ( (uint16_t) a.sign )<<15 ) | 0x7FFF;
     } else {
-        z.low =3D floatx80_default_nan_low;
-        z.high =3D floatx80_default_nan_high;
+        z =3D floatx80_default_nan(status);
     }
-
     return z;
 }
=20
@@ -1052,19 +1065,17 @@ static floatx80 propagateFloatx80NaN(floatx80 a, =
floatx80 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
=20
-    aIsQuietNaN =3D floatx80_is_quiet_nan( a );
-    aIsSignalingNaN =3D floatx80_is_signaling_nan( a );
-    bIsQuietNaN =3D floatx80_is_quiet_nan( b );
-    bIsSignalingNaN =3D floatx80_is_signaling_nan( b );
+    aIsQuietNaN =3D floatx80_is_quiet_nan( a, status );
+    aIsSignalingNaN =3D floatx80_is_signaling_nan( a, status );
+    bIsQuietNaN =3D floatx80_is_quiet_nan( b, status );
+    bIsSignalingNaN =3D floatx80_is_signaling_nan( b, status );
=20
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
     }
=20
     if (status->default_nan_mode) {
-        a.low =3D floatx80_default_nan_low;
-        a.high =3D floatx80_default_nan_high;
-        return a;
+        return floatx80_default_nan(status);
     }
=20
     if (a.low < b.low) {
@@ -1077,19 +1088,19 @@ static floatx80 propagateFloatx80NaN(floatx80 a, =
floatx80 b,
=20
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingN=
aN,
                 aIsLargerSignificand)) {
-        return floatx80_maybe_silence_nan(b);
+        return floatx80_maybe_silence_nan(b, status);
     } else {
-        return floatx80_maybe_silence_nan(a);
+        return floatx80_maybe_silence_nan(a, status);
     }
 }
=20
 #ifdef NO_SIGNALING_NANS
-int float128_is_quiet_nan(float128 a_)
+int float128_is_quiet_nan(float128 a_, float_status *status)
 {
     return float128_is_any_nan(a_);
 }
=20
-int float128_is_signaling_nan(float128 a_)
+int float128_is_signaling_nan(float128 a_, float_status *status)
 {
     return 0;
 }
@@ -1099,16 +1110,16 @@ int float128_is_signaling_nan(float128 a_)
 | NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float128_is_quiet_nan( float128 a )
+int float128_is_quiet_nan( float128 a, float_status *status )
 {
-#if SNAN_BIT_IS_ONE
-    return (((a.high >> 47) & 0xffff) =3D=3D 0xfffe)
-        && (a.low || (a.high & 0x00007fffffffffffULL));
-#else
-    return
-        ((a.high << 1) >=3D 0xffff000000000000ULL)
-        && (a.low || (a.high & 0x0000ffffffffffffULL));
-#endif
+    if (status->snan_bit_is_one)
+        return
+               ( ( ( a.high>>47 ) & 0xFFFF ) =3D=3D 0xFFFE )
+            && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
+    else
+        return
+               ( LIT64( 0xFFFE000000000000 ) <=3D (uint64_t) ( a.high<<1=
 ) )
+            && ( a.low || ( a.high & LIT64( 0x0000FFFFFFFFFFFF ) ) );
 }
=20
 /*----------------------------------------------------------------------=
------
@@ -1116,17 +1127,16 @@ int float128_is_quiet_nan( float128 a )
 | signaling NaN; otherwise returns 0.
 *-----------------------------------------------------------------------=
-----*/
=20
-int float128_is_signaling_nan( float128 a )
+int float128_is_signaling_nan( float128 a, float_status *status )
 {
-#if SNAN_BIT_IS_ONE
-    return
-        ((a.high << 1) >=3D 0xffff000000000000ULL)
-        && (a.low || (a.high & 0x0000ffffffffffffULL));
-#else
-    return
-           ( ( ( a.high>>47 ) & 0xFFFF ) =3D=3D 0xFFFE )
-        && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
-#endif
+    if (status->snan_bit_is_one)
+        return
+               ( LIT64( 0xFFFE000000000000 ) <=3D (uint64_t) ( a.high<<1=
 ) )
+            && ( a.low || ( a.high & LIT64( 0x0000FFFFFFFFFFFF ) ) );
+    else
+        return
+               ( ( ( a.high>>47 ) & 0xFFFF ) =3D=3D 0xFFFE )
+            && ( a.low || ( a.high & LIT64( 0x00007FFFFFFFFFFF ) ) );
 }
 #endif
=20
@@ -1135,20 +1145,16 @@ int float128_is_signaling_nan( float128 a )
 | a signaling NaN; otherwise returns `a'.
 *-----------------------------------------------------------------------=
-----*/
=20
-float128 float128_maybe_silence_nan( float128 a )
+float128 float128_maybe_silence_nan( float128 a, float_status *status )
 {
-    if (float128_is_signaling_nan(a)) {
-#if SNAN_BIT_IS_ONE
-#  if defined(TARGET_MIPS) || defined(TARGET_SH4) || defined(TARGET_UNIC=
ORE32)
-        a.low =3D float128_default_nan_low;
-        a.high =3D float128_default_nan_high;
-#  else
-#    error Rules for silencing a signaling NaN are target-specific
-#  endif
-#else
-        a.high |=3D LIT64( 0x0000800000000000 );
-        return a;
-#endif
+    if (float128_is_signaling_nan(a, status)) {
+        if (status->snan_bit_is_one) {
+            a =3D float128_default_nan(status);
+        }
+        else {
+            a.high |=3D LIT64( 0x0000800000000000 );
+            return a;
+        }
     }
     return a;
 }
@@ -1163,7 +1169,7 @@ static commonNaNT float128ToCommonNaN(float128 a, f=
loat_status *status)
 {
     commonNaNT z;
=20
-    if (float128_is_signaling_nan(a)) {
+    if (float128_is_signaling_nan(a, status)) {
         float_raise(float_flag_invalid, status);
     }
     z.sign =3D a.high>>63;
@@ -1181,9 +1187,7 @@ static float128 commonNaNToFloat128(commonNaNT a, f=
loat_status *status)
     float128 z;
=20
     if (status->default_nan_mode) {
-        z.low =3D float128_default_nan_low;
-        z.high =3D float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
=20
     shift128Right( a.high, a.low, 16, &z.high, &z.low );
@@ -1203,19 +1207,17 @@ static float128 propagateFloat128NaN(float128 a, =
float128 b,
     flag aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingNaN;
     flag aIsLargerSignificand;
=20
-    aIsQuietNaN =3D float128_is_quiet_nan( a );
-    aIsSignalingNaN =3D float128_is_signaling_nan( a );
-    bIsQuietNaN =3D float128_is_quiet_nan( b );
-    bIsSignalingNaN =3D float128_is_signaling_nan( b );
+    aIsQuietNaN =3D float128_is_quiet_nan( a, status );
+    aIsSignalingNaN =3D float128_is_signaling_nan( a, status );
+    bIsQuietNaN =3D float128_is_quiet_nan( b, status );
+    bIsSignalingNaN =3D float128_is_signaling_nan( b, status );
=20
     if (aIsSignalingNaN | bIsSignalingNaN) {
         float_raise(float_flag_invalid, status);
     }
=20
     if (status->default_nan_mode) {
-        a.low =3D float128_default_nan_low;
-        a.high =3D float128_default_nan_high;
-        return a;
+        return float128_default_nan(status);
     }
=20
     if (lt128(a.high<<1, a.low, b.high<<1, b.low)) {
@@ -1228,9 +1230,8 @@ static float128 propagateFloat128NaN(float128 a, fl=
oat128 b,
=20
     if (pickNaN(aIsQuietNaN, aIsSignalingNaN, bIsQuietNaN, bIsSignalingN=
aN,
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
index 166c48e..49d582a 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -2105,7 +2105,7 @@ static float32 subFloat32Sigs(float32 a, float32 b,=
 flag zSign,
             return propagateFloat32NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         aExp =3D 1;
@@ -2234,7 +2234,7 @@ float32 float32_mul(float32 a, float32 b, float_sta=
tus *status)
         }
         if ( ( bExp | bSig ) =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2244,7 +2244,7 @@ float32 float32_mul(float32 a, float32 b, float_sta=
tus *status)
         }
         if ( ( aExp | aSig ) =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2299,7 +2299,7 @@ float32 float32_div(float32 a, float32 b, float_sta=
tus *status)
                 return propagateFloat32NaN(a, b, status);
             }
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         return packFloat32( zSign, 0xFF, 0 );
     }
@@ -2313,7 +2313,7 @@ float32 float32_div(float32 a, float32 b, float_sta=
tus *status)
         if ( bSig =3D=3D 0 ) {
             if ( ( aExp | aSig ) =3D=3D 0 ) {
                 float_raise(float_flag_invalid, status);
-                return float32_default_nan;
+                return float32_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat32( zSign, 0xFF, 0 );
@@ -2367,7 +2367,7 @@ float32 float32_rem(float32 a, float32 b, float_sta=
tus *status)
             return propagateFloat32NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( bExp =3D=3D 0xFF ) {
         if (bSig) {
@@ -2378,7 +2378,7 @@ float32 float32_rem(float32 a, float32 b, float_sta=
tus *status)
     if ( bExp =3D=3D 0 ) {
         if ( bSig =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         normalizeFloat32Subnormal( bSig, &bExp, &bSig );
     }
@@ -2493,7 +2493,7 @@ float32 float32_muladd(float32 a, float32 b, float3=
2 c, int flags,
=20
     if (infzero) {
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
=20
     if (flags & float_muladd_negate_c) {
@@ -2514,7 +2514,7 @@ float32 float32_muladd(float32 a, float32 b, float3=
2 c, int flags,
         if (pInf && (pSign ^ cSign)) {
             /* addition of opposite-signed infinities =3D> InvalidOperat=
ion */
             float_raise(float_flag_invalid, status);
-            return float32_default_nan;
+            return float32_default_nan(status);
         }
         /* Otherwise generate an infinity of the same sign */
         return packFloat32(cSign ^ signflip, 0xff, 0);
@@ -2690,12 +2690,12 @@ float32 float32_sqrt(float32 a, float_status *sta=
tus)
         }
         if ( ! aSign ) return a;
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aSign ) {
         if ( ( aExp | aSig ) =3D=3D 0 ) return a;
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         if ( aSig =3D=3D 0 ) return float32_zero;
@@ -2828,7 +2828,7 @@ float32 float32_log2(float32 a, float_status *statu=
s)
     }
     if ( aSign ) {
         float_raise(float_flag_invalid, status);
-        return float32_default_nan;
+        return float32_default_nan(status);
     }
     if ( aExp =3D=3D 0xFF ) {
         if (aSig) {
@@ -2974,7 +2974,9 @@ int float32_eq_quiet(float32 a, float32 b, float_st=
atus *status)
     if (    ( ( extractFloat32Exp( a ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( a ) )
          || ( ( extractFloat32Exp( b ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( =
b ) ) {
+        if ( float32_is_signaling_nan( a, status ) ||
+             float32_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3000,7 +3002,9 @@ int float32_le_quiet(float32 a, float32 b, float_st=
atus *status)
     if (    ( ( extractFloat32Exp( a ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( a ) )
          || ( ( extractFloat32Exp( b ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( =
b ) ) {
+        if ( float32_is_signaling_nan( a, status ) ||
+             float32_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3031,7 +3035,9 @@ int float32_lt_quiet(float32 a, float32 b, float_st=
atus *status)
     if (    ( ( extractFloat32Exp( a ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( a ) )
          || ( ( extractFloat32Exp( b ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( =
b ) ) {
+        if ( float32_is_signaling_nan( a, status ) ||
+             float32_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -3060,7 +3066,9 @@ int float32_unordered_quiet(float32 a, float32 b, f=
loat_status *status)
     if (    ( ( extractFloat32Exp( a ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( a ) )
          || ( ( extractFloat32Exp( b ) =3D=3D 0xFF ) && extractFloat32Fr=
ac( b ) )
        ) {
-        if ( float32_is_signaling_nan( a ) || float32_is_signaling_nan( =
b ) ) {
+        if ( float32_is_signaling_nan( a, status ) ||
+             float32_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -3896,7 +3904,7 @@ static float64 subFloat64Sigs(float64 a, float64 b,=
 flag zSign,
             return propagateFloat64NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         aExp =3D 1;
@@ -4023,7 +4031,7 @@ float64 float64_mul(float64 a, float64 b, float_sta=
tus *status)
         }
         if ( ( bExp | bSig ) =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4033,7 +4041,7 @@ float64 float64_mul(float64 a, float64 b, float_sta=
tus *status)
         }
         if ( ( aExp | aSig ) =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4090,7 +4098,7 @@ float64 float64_div(float64 a, float64 b, float_sta=
tus *status)
                 return propagateFloat64NaN(a, b, status);
             }
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         return packFloat64( zSign, 0x7FF, 0 );
     }
@@ -4104,7 +4112,7 @@ float64 float64_div(float64 a, float64 b, float_sta=
tus *status)
         if ( bSig =3D=3D 0 ) {
             if ( ( aExp | aSig ) =3D=3D 0 ) {
                 float_raise(float_flag_invalid, status);
-                return float64_default_nan;
+                return float64_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat64( zSign, 0x7FF, 0 );
@@ -4162,7 +4170,7 @@ float64 float64_rem(float64 a, float64 b, float_sta=
tus *status)
             return propagateFloat64NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( bExp =3D=3D 0x7FF ) {
         if (bSig) {
@@ -4173,7 +4181,7 @@ float64 float64_rem(float64 a, float64 b, float_sta=
tus *status)
     if ( bExp =3D=3D 0 ) {
         if ( bSig =3D=3D 0 ) {
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         normalizeFloat64Subnormal( bSig, &bExp, &bSig );
     }
@@ -4275,7 +4283,7 @@ float64 float64_muladd(float64 a, float64 b, float6=
4 c, int flags,
=20
     if (infzero) {
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
=20
     if (flags & float_muladd_negate_c) {
@@ -4296,7 +4304,7 @@ float64 float64_muladd(float64 a, float64 b, float6=
4 c, int flags,
         if (pInf && (pSign ^ cSign)) {
             /* addition of opposite-signed infinities =3D> InvalidOperat=
ion */
             float_raise(float_flag_invalid, status);
-            return float64_default_nan;
+            return float64_default_nan(status);
         }
         /* Otherwise generate an infinity of the same sign */
         return packFloat64(cSign ^ signflip, 0x7ff, 0);
@@ -4494,12 +4502,12 @@ float64 float64_sqrt(float64 a, float_status *sta=
tus)
         }
         if ( ! aSign ) return a;
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aSign ) {
         if ( ( aExp | aSig ) =3D=3D 0 ) return a;
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         if ( aSig =3D=3D 0 ) return float64_zero;
@@ -4547,7 +4555,7 @@ float64 float64_log2(float64 a, float_status *statu=
s)
     }
     if ( aSign ) {
         float_raise(float_flag_invalid, status);
-        return float64_default_nan;
+        return float64_default_nan(status);
     }
     if ( aExp =3D=3D 0x7FF ) {
         if (aSig) {
@@ -4694,7 +4702,9 @@ int float64_eq_quiet(float64 a, float64 b, float_st=
atus *status)
     if (    ( ( extractFloat64Exp( a ) =3D=3D 0x7FF ) && extractFloat64F=
rac( a ) )
          || ( ( extractFloat64Exp( b ) =3D=3D 0x7FF ) && extractFloat64F=
rac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( =
b ) ) {
+        if ( float64_is_signaling_nan( a, status ) ||
+             float64_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4722,7 +4732,9 @@ int float64_le_quiet(float64 a, float64 b, float_st=
atus *status)
     if (    ( ( extractFloat64Exp( a ) =3D=3D 0x7FF ) && extractFloat64F=
rac( a ) )
          || ( ( extractFloat64Exp( b ) =3D=3D 0x7FF ) && extractFloat64F=
rac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( =
b ) ) {
+        if ( float64_is_signaling_nan( a, status ) ||
+             float64_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4753,7 +4765,9 @@ int float64_lt_quiet(float64 a, float64 b, float_st=
atus *status)
     if (    ( ( extractFloat64Exp( a ) =3D=3D 0x7FF ) && extractFloat64F=
rac( a ) )
          || ( ( extractFloat64Exp( b ) =3D=3D 0x7FF ) && extractFloat64F=
rac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( =
b ) ) {
+        if ( float64_is_signaling_nan( a, status ) ||
+             float64_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -4782,7 +4796,9 @@ int float64_unordered_quiet(float64 a, float64 b, f=
loat_status *status)
     if (    ( ( extractFloat64Exp( a ) =3D=3D 0x7FF ) && extractFloat64F=
rac( a ) )
          || ( ( extractFloat64Exp( b ) =3D=3D 0x7FF ) && extractFloat64F=
rac( b ) )
        ) {
-        if ( float64_is_signaling_nan( a ) || float64_is_signaling_nan( =
b ) ) {
+        if ( float64_is_signaling_nan( a, status ) ||
+             float64_is_signaling_nan( b, status ) ) {
+
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -5207,7 +5223,6 @@ static floatx80 subFloatx80Sigs(floatx80 a, floatx8=
0 b, flag zSign,
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
     int32_t expDiff;
-    floatx80 z;
=20
     aSig =3D extractFloatx80Frac( a );
     aExp =3D extractFloatx80Exp( a );
@@ -5221,9 +5236,7 @@ static floatx80 subFloatx80Sigs(floatx80 a, floatx8=
0 b, flag zSign,
             return propagateFloatx80NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        z.low =3D floatx80_default_nan_low;
-        z.high =3D floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         aExp =3D 1;
@@ -5317,7 +5330,6 @@ floatx80 floatx80_mul(floatx80 a, floatx80 b, float=
_status *status)
     flag aSign, bSign, zSign;
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
-    floatx80 z;
=20
     aSig =3D extractFloatx80Frac( a );
     aExp =3D extractFloatx80Exp( a );
@@ -5341,9 +5353,7 @@ floatx80 floatx80_mul(floatx80 a, floatx80 b, float=
_status *status)
         if ( ( aExp | aSig ) =3D=3D 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low =3D floatx80_default_nan_low;
-            z.high =3D floatx80_default_nan_high;
-            return z;
+            return floatx80_default_nan(status);
         }
         return packFloatx80( zSign, 0x7FFF, LIT64( 0x8000000000000000 ) =
);
     }
@@ -5377,7 +5387,6 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float=
_status *status)
     int32_t aExp, bExp, zExp;
     uint64_t aSig, bSig, zSig0, zSig1;
     uint64_t rem0, rem1, rem2, term0, term1, term2;
-    floatx80 z;
=20
     aSig =3D extractFloatx80Frac( a );
     aExp =3D extractFloatx80Exp( a );
@@ -5409,9 +5418,7 @@ floatx80 floatx80_div(floatx80 a, floatx80 b, float=
_status *status)
             if ( ( aExp | aSig ) =3D=3D 0 ) {
  invalid:
                 float_raise(float_flag_invalid, status);
-                z.low =3D floatx80_default_nan_low;
-                z.high =3D floatx80_default_nan_high;
-                return z;
+                return floatx80_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloatx80( zSign, 0x7FFF, LIT64( 0x800000000000000=
0 ) );
@@ -5461,7 +5468,6 @@ floatx80 floatx80_rem(floatx80 a, floatx80 b, float=
_status *status)
     int32_t aExp, bExp, expDiff;
     uint64_t aSig0, aSig1, bSig;
     uint64_t q, term0, term1, alternateASig0, alternateASig1;
-    floatx80 z;
=20
     aSig0 =3D extractFloatx80Frac( a );
     aExp =3D extractFloatx80Exp( a );
@@ -5485,9 +5491,7 @@ floatx80 floatx80_rem(floatx80 a, floatx80 b, float=
_status *status)
         if ( bSig =3D=3D 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low =3D floatx80_default_nan_low;
-            z.high =3D floatx80_default_nan_high;
-            return z;
+            return floatx80_default_nan(status);
         }
         normalizeFloatx80Subnormal( bSig, &bExp, &bSig );
     }
@@ -5559,7 +5563,6 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *st=
atus)
     int32_t aExp, zExp;
     uint64_t aSig0, aSig1, zSig0, zSig1, doubleZSig0;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    floatx80 z;
=20
     aSig0 =3D extractFloatx80Frac( a );
     aExp =3D extractFloatx80Exp( a );
@@ -5575,9 +5578,7 @@ floatx80 floatx80_sqrt(floatx80 a, float_status *st=
atus)
         if ( ( aExp | aSig0 ) =3D=3D 0 ) return a;
  invalid:
         float_raise(float_flag_invalid, status);
-        z.low =3D floatx80_default_nan_low;
-        z.high =3D floatx80_default_nan_high;
-        return z;
+        return floatx80_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         if ( aSig0 =3D=3D 0 ) return packFloatx80( 0, 0, 0 );
@@ -5745,8 +5746,8 @@ int floatx80_eq_quiet(floatx80 a, floatx80 b, float=
_status *status)
          || (    ( extractFloatx80Exp( b ) =3D=3D 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (    floatx80_is_signaling_nan( a, status )
+             || floatx80_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5776,8 +5777,8 @@ int floatx80_le_quiet(floatx80 a, floatx80 b, float=
_status *status)
          || (    ( extractFloatx80Exp( b ) =3D=3D 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (    floatx80_is_signaling_nan( a, status )
+             || floatx80_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5812,8 +5813,8 @@ int floatx80_lt_quiet(floatx80 a, floatx80 b, float=
_status *status)
          || (    ( extractFloatx80Exp( b ) =3D=3D 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (    floatx80_is_signaling_nan( a, status )
+             || floatx80_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -5845,8 +5846,8 @@ int floatx80_unordered_quiet(floatx80 a, floatx80 b=
, float_status *status)
          || (    ( extractFloatx80Exp( b ) =3D=3D 0x7FFF )
               && (uint64_t) ( extractFloatx80Frac( b )<<1 ) )
        ) {
-        if (    floatx80_is_signaling_nan( a )
-             || floatx80_is_signaling_nan( b ) ) {
+        if (    floatx80_is_signaling_nan( a, status )
+             || floatx80_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -6385,7 +6386,6 @@ static float128 subFloat128Sigs(float128 a, float12=
8 b, flag zSign,
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1;
     int32_t expDiff;
-    float128 z;
=20
     aSig1 =3D extractFloat128Frac1( a );
     aSig0 =3D extractFloat128Frac0( a );
@@ -6403,9 +6403,7 @@ static float128 subFloat128Sigs(float128 a, float12=
8 b, flag zSign,
             return propagateFloat128NaN(a, b, status);
         }
         float_raise(float_flag_invalid, status);
-        z.low =3D float128_default_nan_low;
-        z.high =3D float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         aExp =3D 1;
@@ -6515,7 +6513,6 @@ float128 float128_mul(float128 a, float128 b, float=
_status *status)
     flag aSign, bSign, zSign;
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2, zSig3;
-    float128 z;
=20
     aSig1 =3D extractFloat128Frac1( a );
     aSig0 =3D extractFloat128Frac0( a );
@@ -6541,9 +6538,7 @@ float128 float128_mul(float128 a, float128 b, float=
_status *status)
         if ( ( aExp | aSig0 | aSig1 ) =3D=3D 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low =3D float128_default_nan_low;
-            z.high =3D float128_default_nan_high;
-            return z;
+            return float128_default_nan(status);
         }
         return packFloat128( zSign, 0x7FFF, 0, 0 );
     }
@@ -6582,7 +6577,6 @@ float128 float128_div(float128 a, float128 b, float=
_status *status)
     int32_t aExp, bExp, zExp;
     uint64_t aSig0, aSig1, bSig0, bSig1, zSig0, zSig1, zSig2;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    float128 z;
=20
     aSig1 =3D extractFloat128Frac1( a );
     aSig0 =3D extractFloat128Frac0( a );
@@ -6616,9 +6610,7 @@ float128 float128_div(float128 a, float128 b, float=
_status *status)
             if ( ( aExp | aSig0 | aSig1 ) =3D=3D 0 ) {
  invalid:
                 float_raise(float_flag_invalid, status);
-                z.low =3D float128_default_nan_low;
-                z.high =3D float128_default_nan_high;
-                return z;
+                return float128_default_nan(status);
             }
             float_raise(float_flag_divbyzero, status);
             return packFloat128( zSign, 0x7FFF, 0, 0 );
@@ -6673,7 +6665,6 @@ float128 float128_rem(float128 a, float128 b, float=
_status *status)
     uint64_t aSig0, aSig1, bSig0, bSig1, q, term0, term1, term2;
     uint64_t allZero, alternateASig0, alternateASig1, sigMean1;
     int64_t sigMean0;
-    float128 z;
=20
     aSig1 =3D extractFloat128Frac1( a );
     aSig0 =3D extractFloat128Frac0( a );
@@ -6699,9 +6690,7 @@ float128 float128_rem(float128 a, float128 b, float=
_status *status)
         if ( ( bSig0 | bSig1 ) =3D=3D 0 ) {
  invalid:
             float_raise(float_flag_invalid, status);
-            z.low =3D float128_default_nan_low;
-            z.high =3D float128_default_nan_high;
-            return z;
+            return float128_default_nan(status);
         }
         normalizeFloat128Subnormal( bSig0, bSig1, &bExp, &bSig0, &bSig1 =
);
     }
@@ -6782,7 +6771,6 @@ float128 float128_sqrt(float128 a, float_status *st=
atus)
     int32_t aExp, zExp;
     uint64_t aSig0, aSig1, zSig0, zSig1, zSig2, doubleZSig0;
     uint64_t rem0, rem1, rem2, rem3, term0, term1, term2, term3;
-    float128 z;
=20
     aSig1 =3D extractFloat128Frac1( a );
     aSig0 =3D extractFloat128Frac0( a );
@@ -6799,9 +6787,7 @@ float128 float128_sqrt(float128 a, float_status *st=
atus)
         if ( ( aExp | aSig0 | aSig1 ) =3D=3D 0 ) return a;
  invalid:
         float_raise(float_flag_invalid, status);
-        z.low =3D float128_default_nan_low;
-        z.high =3D float128_default_nan_high;
-        return z;
+        return float128_default_nan(status);
     }
     if ( aExp =3D=3D 0 ) {
         if ( ( aSig0 | aSig1 ) =3D=3D 0 ) return packFloat128( 0, 0, 0, =
0 );
@@ -6969,8 +6955,8 @@ int float128_eq_quiet(float128 a, float128 b, float=
_status *status)
          || (    ( extractFloat128Exp( b ) =3D=3D 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b )=
 ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (    float128_is_signaling_nan( a, status )
+             || float128_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7000,8 +6986,8 @@ int float128_le_quiet(float128 a, float128 b, float=
_status *status)
          || (    ( extractFloat128Exp( b ) =3D=3D 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b )=
 ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (    float128_is_signaling_nan( a, status )
+             || float128_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7036,8 +7022,8 @@ int float128_lt_quiet(float128 a, float128 b, float=
_status *status)
          || (    ( extractFloat128Exp( b ) =3D=3D 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b )=
 ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (    float128_is_signaling_nan( a, status )
+             || float128_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 0;
@@ -7070,8 +7056,8 @@ int float128_unordered_quiet(float128 a, float128 b=
, float_status *status)
          || (    ( extractFloat128Exp( b ) =3D=3D 0x7FFF )
               && ( extractFloat128Frac0( b ) | extractFloat128Frac1( b )=
 ) )
        ) {
-        if (    float128_is_signaling_nan( a )
-             || float128_is_signaling_nan( b ) ) {
+        if (    float128_is_signaling_nan( a, status )
+             || float128_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return 1;
@@ -7351,8 +7337,8 @@ static inline int float ## s ## _compare_internal(f=
loat ## s a, float ## s b,\
         ( ( extractFloat ## s ## Exp( b ) =3D=3D nan_exp ) &&           =
         \
           extractFloat ## s ## Frac( b ) )) {                           =
     \
         if (!is_quiet ||                                                =
     \
-            float ## s ## _is_signaling_nan( a ) ||                     =
     \
-            float ## s ## _is_signaling_nan( b ) ) {                    =
     \
+            float ## s ## _is_signaling_nan( a, status ) ||             =
     \
+            float ## s ## _is_signaling_nan( b, status ) ) {            =
     \
             float_raise(float_flag_invalid, status);                    =
     \
         }                                                               =
     \
         return float_relation_unordered;                                =
     \
@@ -7401,8 +7387,8 @@ static inline int floatx80_compare_internal(floatx8=
0 a, floatx80 b,
         ( ( extractFloatx80Exp( b ) =3D=3D 0x7fff ) &&
           ( extractFloatx80Frac( b )<<1 ) )) {
         if (!is_quiet ||
-            floatx80_is_signaling_nan( a ) ||
-            floatx80_is_signaling_nan( b ) ) {
+            floatx80_is_signaling_nan( a, status ) ||
+            floatx80_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return float_relation_unordered;
@@ -7447,8 +7433,8 @@ static inline int float128_compare_internal(float12=
8 a, float128 b,
         ( ( extractFloat128Exp( b ) =3D=3D 0x7fff ) &&
           ( extractFloat128Frac0( b ) | extractFloat128Frac1( b ) ) )) {
         if (!is_quiet ||
-            float128_is_signaling_nan( a ) ||
-            float128_is_signaling_nan( b ) ) {
+            float128_is_signaling_nan( a, status ) ||
+            float128_is_signaling_nan( b, status ) ) {
             float_raise(float_flag_invalid, status);
         }
         return float_relation_unordered;
@@ -7508,11 +7494,11 @@ static inline float ## s float ## s ## _minmax(fl=
oat ## s a, float ## s b,     \
     if (float ## s ## _is_any_nan(a) ||                                 =
\
         float ## s ## _is_any_nan(b)) {                                 =
\
         if (isieee) {                                                   =
\
-            if (float ## s ## _is_quiet_nan(a) &&                       =
\
+            if (float ## s ## _is_quiet_nan(a, status) &&               =
\
                 !float ## s ##_is_any_nan(b)) {                         =
\
                 return b;                                               =
\
-            } else if (float ## s ## _is_quiet_nan(b) &&                =
\
-                       !float ## s ## _is_any_nan(a)) {                 =
\
+            } else if (float ## s ## _is_quiet_nan(b, status) &&        =
\
+                       !float ## s ## _is_any_nan(a )) {                =
\
                 return a;                                               =
\
             }                                                           =
\
         }                                                               =
\
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index c937062..60524bb 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -205,6 +205,7 @@ typedef struct float_status {
     /* should denormalised inputs go to zero and set the input_denormal =
flag? */
     flag flush_inputs_to_zero;
     flag default_nan_mode;
+    flag snan_bit_is_one;
 } float_status;
=20
 static inline void set_float_detect_tininess(int val, float_status *stat=
us)
@@ -236,6 +237,10 @@ static inline void set_default_nan_mode(flag val, fl=
oat_status *status)
 {
     status->default_nan_mode =3D val;
 }
+static inline void set_snan_bit_is_one(flag val, float_status *status)
+{
+    status->snan_bit_is_one =3D val;
+}
 static inline int get_float_detect_tininess(float_status *status)
 {
     return status->float_detect_tininess;
@@ -342,9 +347,9 @@ float64 float16_to_float64(float16 a, flag ieee, floa=
t_status *status);
 /*----------------------------------------------------------------------=
------
 | Software half-precision operations.
 *-----------------------------------------------------------------------=
-----*/
-int float16_is_quiet_nan( float16 );
-int float16_is_signaling_nan( float16 );
-float16 float16_maybe_silence_nan( float16 );
+int float16_is_quiet_nan( float16, float_status *status );
+int float16_is_signaling_nan( float16, float_status *status );
+float16 float16_maybe_silence_nan( float16, float_status *status );
=20
 static inline int float16_is_any_nan(float16 a)
 {
@@ -354,7 +359,7 @@ static inline int float16_is_any_nan(float16 a)
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated half-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-extern const float16 float16_default_nan;
+float16 float16_default_nan(float_status *status);
=20
 /*----------------------------------------------------------------------=
------
 | Software IEC/IEEE single-precision conversion routines.
@@ -404,9 +409,9 @@ float32 float32_minnum(float32, float32, float_status=
 *status);
 float32 float32_maxnum(float32, float32, float_status *status);
 float32 float32_minnummag(float32, float32, float_status *status);
 float32 float32_maxnummag(float32, float32, float_status *status);
-int float32_is_quiet_nan( float32 );
-int float32_is_signaling_nan( float32 );
-float32 float32_maybe_silence_nan( float32 );
+int float32_is_quiet_nan( float32, float_status *status );
+int float32_is_signaling_nan( float32, float_status *status );
+float32 float32_maybe_silence_nan( float32, float_status *status );
 float32 float32_scalbn(float32, int, float_status *status);
=20
 static inline float32 float32_abs(float32 a)
@@ -466,7 +471,7 @@ static inline float32 float32_set_sign(float32 a, int=
 sign)
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated single-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-extern const float32 float32_default_nan;
+float32 float32_default_nan(float_status *status);
=20
 /*----------------------------------------------------------------------=
------
 | Software IEC/IEEE double-precision conversion routines.
@@ -516,9 +521,9 @@ float64 float64_minnum(float64, float64, float_status=
 *status);
 float64 float64_maxnum(float64, float64, float_status *status);
 float64 float64_minnummag(float64, float64, float_status *status);
 float64 float64_maxnummag(float64, float64, float_status *status);
-int float64_is_quiet_nan( float64 a );
-int float64_is_signaling_nan( float64 );
-float64 float64_maybe_silence_nan( float64 );
+int float64_is_quiet_nan( float64 a, float_status *status );
+int float64_is_signaling_nan( float64, float_status *status );
+float64 float64_maybe_silence_nan( float64, float_status *status );
 float64 float64_scalbn(float64, int, float_status *status);
=20
 static inline float64 float64_abs(float64 a)
@@ -578,7 +583,7 @@ static inline float64 float64_set_sign(float64 a, int=
 sign)
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated double-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-extern const float64 float64_default_nan;
+float64 float64_default_nan(float_status *status);
=20
 /*----------------------------------------------------------------------=
------
 | Software IEC/IEEE extended double-precision conversion routines.
@@ -611,9 +616,9 @@ int floatx80_lt_quiet(floatx80, floatx80, float_statu=
s *status);
 int floatx80_unordered_quiet(floatx80, floatx80, float_status *status);
 int floatx80_compare(floatx80, floatx80, float_status *status);
 int floatx80_compare_quiet(floatx80, floatx80, float_status *status);
-int floatx80_is_quiet_nan( floatx80 );
-int floatx80_is_signaling_nan( floatx80 );
-floatx80 floatx80_maybe_silence_nan( floatx80 );
+int floatx80_is_quiet_nan( floatx80, float_status *status );
+int floatx80_is_signaling_nan( floatx80, float_status *status );
+floatx80 floatx80_maybe_silence_nan( floatx80, float_status *status );
 floatx80 floatx80_scalbn(floatx80, int, float_status *status);
=20
 static inline floatx80 floatx80_abs(floatx80 a)
@@ -663,7 +668,9 @@ static inline int floatx80_is_any_nan(floatx80 a)
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated extended double-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-extern const floatx80 floatx80_default_nan;
+uint16_t floatx80_default_nan_high(float_status *status);
+uint64_t floatx80_default_nan_low(float_status *status);
+floatx80 floatx80_default_nan(float_status *status);
=20
 /*----------------------------------------------------------------------=
------
 | Software IEC/IEEE quadruple-precision conversion routines.
@@ -696,9 +703,9 @@ int float128_lt_quiet(float128, float128, float_statu=
s *status);
 int float128_unordered_quiet(float128, float128, float_status *status);
 int float128_compare(float128, float128, float_status *status);
 int float128_compare_quiet(float128, float128, float_status *status);
-int float128_is_quiet_nan( float128 );
-int float128_is_signaling_nan( float128 );
-float128 float128_maybe_silence_nan( float128 );
+int float128_is_quiet_nan( float128, float_status *status );
+int float128_is_signaling_nan( float128, float_status *status );
+float128 float128_maybe_silence_nan( float128, float_status *status );
 float128 float128_scalbn(float128, int, float_status *status);
=20
 static inline float128 float128_abs(float128 a)
@@ -744,6 +751,8 @@ static inline int float128_is_any_nan(float128 a)
 /*----------------------------------------------------------------------=
------
 | The pattern for a default generated quadruple-precision NaN.
 *-----------------------------------------------------------------------=
-----*/
-extern const float128 float128_default_nan;
+uint64_t float128_default_nan_high(float_status *status);
+uint64_t float128_default_nan_low(float_status *status);
+float128 float128_default_nan(float_status *status);
=20
 #endif /* !SOFTFLOAT_H */
diff --git a/target-alpha/cpu.c b/target-alpha/cpu.c
index 8a155ca..a8b1e13 100644
--- a/target-alpha/cpu.c
+++ b/target-alpha/cpu.c
@@ -278,6 +278,8 @@ static void alpha_cpu_initfn(Object *obj)
 #endif
     env->lock_addr =3D -1;
     env->fen =3D 1;
+
+    set_snan_bit_is_one(0, &env->fp_status);
 }
=20
 static void alpha_cpu_class_init(ObjectClass *oc, void *data)
diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
index c7bfb4d..50f0c8b 100644
--- a/target-arm/helper-a64.c
+++ b/target-arm/helper-a64.c
@@ -343,12 +343,12 @@ float32 HELPER(frecpx_f32)(float32 a, void *fpstp)
=20
     if (float32_is_any_nan(a)) {
         float32 nan =3D a;
-        if (float32_is_signaling_nan(a)) {
+        if (float32_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan =3D float32_maybe_silence_nan(a);
+            nan =3D float32_maybe_silence_nan(a, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =3D float32_default_nan;
+            nan =3D float32_default_nan(fpst);
         }
         return nan;
     }
@@ -372,12 +372,12 @@ float64 HELPER(frecpx_f64)(float64 a, void *fpstp)
=20
     if (float64_is_any_nan(a)) {
         float64 nan =3D a;
-        if (float64_is_signaling_nan(a)) {
+        if (float64_is_signaling_nan(a, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan =3D float64_maybe_silence_nan(a);
+            nan =3D float64_maybe_silence_nan(a, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =3D float64_default_nan;
+            nan =3D float64_default_nan(fpst);
         }
         return nan;
     }
@@ -406,7 +406,7 @@ float32 HELPER(fcvtx_f64_to_f32)(float64 a, CPUARMSta=
te *env)
     set_float_rounding_mode(float_round_to_zero, &tstat);
     set_float_exception_flags(0, &tstat);
     r =3D float64_to_float32(a, &tstat);
-    r =3D float32_maybe_silence_nan(r);
+    r =3D float32_maybe_silence_nan(r, &tstat);
     exflags =3D get_float_exception_flags(&tstat);
     if (exflags & float_flag_inexact) {
         r =3D make_float32(float32_val(r) | 1);
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..6ef4450 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -8648,7 +8648,7 @@ float64 VFP_HELPER(fcvtd, s)(float32 x, CPUARMState=
 *env)
     /* ARM requires that S<->D conversion of any kind of NaN generates
      * a quiet NaN by forcing the most significant frac bit to 1.
      */
-    return float64_maybe_silence_nan(r);
+    return float64_maybe_silence_nan(r, &env->vfp.fp_status);
 }
=20
 float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
@@ -8657,7 +8657,7 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState=
 *env)
     /* ARM requires that S<->D conversion of any kind of NaN generates
      * a quiet NaN by forcing the most significant frac bit to 1.
      */
-    return float32_maybe_silence_nan(r);
+    return float32_maybe_silence_nan(r, &env->vfp.fp_status);
 }
=20
 /* VFP3 fixed point conversion.  */
@@ -8756,7 +8756,7 @@ static float32 do_fcvt_f16_to_f32(uint32_t a, CPUAR=
MState *env, float_status *s)
     int ieee =3D (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) =3D=3D 0;
     float32 r =3D float16_to_float32(make_float16(a), ieee, s);
     if (ieee) {
-        return float32_maybe_silence_nan(r);
+        return float32_maybe_silence_nan(r, s);
     }
     return r;
 }
@@ -8766,7 +8766,7 @@ static uint32_t do_fcvt_f32_to_f16(float32 a, CPUAR=
MState *env, float_status *s)
     int ieee =3D (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) =3D=3D 0;
     float16 r =3D float32_to_float16(a, ieee, s);
     if (ieee) {
-        r =3D float16_maybe_silence_nan(r);
+        r =3D float16_maybe_silence_nan(r, s);
     }
     return float16_val(r);
 }
@@ -8796,7 +8796,7 @@ float64 HELPER(vfp_fcvt_f16_to_f64)(uint32_t a, CPU=
ARMState *env)
     int ieee =3D (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) =3D=3D 0;
     float64 r =3D float16_to_float64(make_float16(a), ieee, &env->vfp.fp=
_status);
     if (ieee) {
-        return float64_maybe_silence_nan(r);
+        return float64_maybe_silence_nan(r, &env->vfp.fp_status);
     }
     return r;
 }
@@ -8806,7 +8806,7 @@ uint32_t HELPER(vfp_fcvt_f64_to_f16)(float64 a, CPU=
ARMState *env)
     int ieee =3D (env->vfp.xregs[ARM_VFP_FPSCR] & (1 << 26)) =3D=3D 0;
     float16 r =3D float64_to_float16(a, ieee, &env->vfp.fp_status);
     if (ieee) {
-        r =3D float16_maybe_silence_nan(r);
+        r =3D float16_maybe_silence_nan(r, &env->vfp.fp_status);
     }
     return float16_val(r);
 }
@@ -8956,12 +8956,12 @@ float32 HELPER(recpe_f32)(float32 input, void *fp=
stp)
=20
     if (float32_is_any_nan(f32)) {
         float32 nan =3D f32;
-        if (float32_is_signaling_nan(f32)) {
+        if (float32_is_signaling_nan(f32, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan =3D float32_maybe_silence_nan(f32);
+            nan =3D float32_maybe_silence_nan(f32, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =3D  float32_default_nan;
+            nan =3D  float32_default_nan(fpst);
         }
         return nan;
     } else if (float32_is_infinity(f32)) {
@@ -9010,12 +9010,12 @@ float64 HELPER(recpe_f64)(float64 input, void *fp=
stp)
     /* Deal with any special cases */
     if (float64_is_any_nan(f64)) {
         float64 nan =3D f64;
-        if (float64_is_signaling_nan(f64)) {
+        if (float64_is_signaling_nan(f64, fpst)) {
             float_raise(float_flag_invalid, fpst);
-            nan =3D float64_maybe_silence_nan(f64);
+            nan =3D float64_maybe_silence_nan(f64, fpst);
         }
         if (fpst->default_nan_mode) {
-            nan =3D  float64_default_nan;
+            nan =3D  float64_default_nan(fpst);
         }
         return nan;
     } else if (float64_is_infinity(f64)) {
@@ -9117,12 +9117,12 @@ float32 HELPER(rsqrte_f32)(float32 input, void *f=
pstp)
=20
     if (float32_is_any_nan(f32)) {
         float32 nan =3D f32;
-        if (float32_is_signaling_nan(f32)) {
+        if (float32_is_signaling_nan(f32, s)) {
             float_raise(float_flag_invalid, s);
-            nan =3D float32_maybe_silence_nan(f32);
+            nan =3D float32_maybe_silence_nan(f32, s);
         }
         if (s->default_nan_mode) {
-            nan =3D  float32_default_nan;
+            nan =3D  float32_default_nan(s);
         }
         return nan;
     } else if (float32_is_zero(f32)) {
@@ -9130,7 +9130,7 @@ float32 HELPER(rsqrte_f32)(float32 input, void *fps=
tp)
         return float32_set_sign(float32_infinity, float32_is_neg(f32));
     } else if (float32_is_neg(f32)) {
         float_raise(float_flag_invalid, s);
-        return float32_default_nan;
+        return float32_default_nan(s);
     } else if (float32_is_infinity(f32)) {
         return float32_zero;
     }
@@ -9181,12 +9181,12 @@ float64 HELPER(rsqrte_f64)(float64 input, void *f=
pstp)
=20
     if (float64_is_any_nan(f64)) {
         float64 nan =3D f64;
-        if (float64_is_signaling_nan(f64)) {
+        if (float64_is_signaling_nan(f64, s)) {
             float_raise(float_flag_invalid, s);
-            nan =3D float64_maybe_silence_nan(f64);
+            nan =3D float64_maybe_silence_nan(f64, s);
         }
         if (s->default_nan_mode) {
-            nan =3D  float64_default_nan;
+            nan =3D  float64_default_nan(s);
         }
         return nan;
     } else if (float64_is_zero(f64)) {
@@ -9194,7 +9194,7 @@ float64 HELPER(rsqrte_f64)(float64 input, void *fps=
tp)
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
@@ -557,10 +557,10 @@ float64 HELPER(sub_cmp_f64)(CPUM68KState *env, floa=
t64 a, float64 b)
     /* ??? Should flush denormals to zero.  */
     float64 res;
     res =3D float64_sub(a, b, &env->fp_status);
-    if (float64_is_quiet_nan(res)) {
+    if (float64_is_quiet_nan(res, &env->fp_status)) {
         /* +/-inf compares equal against itself, but sub returns nan.  *=
/
-        if (!float64_is_quiet_nan(a)
-            && !float64_is_quiet_nan(b)) {
+        if (!float64_is_quiet_nan(a, &env->fp_status)
+            && !float64_is_quiet_nan(b, &env->fp_status)) {
             res =3D float64_zero;
             if (float64_lt_quiet(a, res, &env->fp_status))
                 res =3D float64_chs(res);
diff --git a/target-microblaze/cpu.c b/target-microblaze/cpu.c
index fdfb019..31f78cb 100644
--- a/target-microblaze/cpu.c
+++ b/target-microblaze/cpu.c
@@ -121,6 +121,8 @@ static void mb_cpu_reset(CPUState *s)
     env->mmu.c_mmu_tlb_access =3D 3;
     env->mmu.c_mmu_zones =3D 16;
 #endif
+
+    set_snan_bit_is_one(0, &env->fp_status);
 }
=20
 static void mb_disas_set_info(CPUState *cpu, disassemble_info *info)
diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.=
c
index 9733388..45fc94d 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -287,12 +287,14 @@ uint32_t helper_fcmp_un(CPUMBState *env, uint32_t a=
, uint32_t b)
     fa.l =3D a;
     fb.l =3D b;
=20
-    if (float32_is_signaling_nan(fa.f) || float32_is_signaling_nan(fb.f)=
) {
+    if (float32_is_signaling_nan(fa.f, &env->fp_status) ||
+        float32_is_signaling_nan(fb.f, &env->fp_status)) {
         update_fpu_flags(env, float_flag_invalid);
         r =3D 1;
     }
=20
-    if (float32_is_quiet_nan(fa.f) || float32_is_quiet_nan(fb.f)) {
+    if (float32_is_quiet_nan(fa.f, &env->fp_status) ||
+        float32_is_quiet_nan(fb.f, &env->fp_status)) {
         r =3D 1;
     }
=20
diff --git a/target-mips/helper.h b/target-mips/helper.h
index 594341d..133dcfb 100644
--- a/target-mips/helper.h
+++ b/target-mips/helper.h
@@ -222,8 +222,8 @@ DEF_HELPER_2(float_cvtw_d, i32, env, i64)
 DEF_HELPER_3(float_addr_ps, i64, env, i64, i64)
 DEF_HELPER_3(float_mulr_ps, i64, env, i64, i64)
=20
-DEF_HELPER_FLAGS_1(float_class_s, TCG_CALL_NO_RWG_SE, i32, i32)
-DEF_HELPER_FLAGS_1(float_class_d, TCG_CALL_NO_RWG_SE, i64, i64)
+DEF_HELPER_FLAGS_3(float_class_s, TCG_CALL_NO_RWG_SE, i32, env, i32, i32=
)
+DEF_HELPER_FLAGS_3(float_class_d, TCG_CALL_NO_RWG_SE, i64, env, i64, i32=
)
=20
 #define FOP_PROTO(op)                                     \
 DEF_HELPER_4(float_ ## op ## _s, i32, env, i32, i32, i32) \
diff --git a/target-mips/msa_helper.c b/target-mips/msa_helper.c
index 654a0d2..a079fe4 100644
--- a/target-mips/msa_helper.c
+++ b/target-mips/msa_helper.c
@@ -1494,11 +1494,11 @@ MSA_UNOP_DF(pcnt)
 #define FLOAT_ONE32 make_float32(0x3f8 << 20)
 #define FLOAT_ONE64 make_float64(0x3ffULL << 52)
=20
-#define FLOAT_SNAN16 (float16_default_nan ^ 0x0220)
+#define FLOAT_SNAN16(s) (float16_default_nan(s) ^ 0x0220)
         /* 0x7c20 */
-#define FLOAT_SNAN32 (float32_default_nan ^ 0x00400020)
+#define FLOAT_SNAN32(s) (float32_default_nan(s) ^ 0x00400020)
         /* 0x7f800020 */
-#define FLOAT_SNAN64 (float64_default_nan ^ 0x0008000000000020ULL)
+#define FLOAT_SNAN64(s) (float64_default_nan(s) ^ 0x0008000000000020ULL)
         /* 0x7ff0000000000020 */
=20
 static inline void clear_msacsr_cause(CPUMIPSState *env)
@@ -1611,7 +1611,7 @@ static inline float16 float16_from_float32(int32_t =
a, flag ieee,
       float16 f_val;
=20
       f_val =3D float32_to_float16((float32)a, ieee, status);
-      f_val =3D float16_maybe_silence_nan(f_val);
+      f_val =3D float16_maybe_silence_nan(f_val, status);
=20
       return a < 0 ? (f_val | (1 << 15)) : f_val;
 }
@@ -1621,7 +1621,7 @@ static inline float32 float32_from_float64(int64_t =
a, float_status *status)
       float32 f_val;
=20
       f_val =3D float64_to_float32((float64)a, status);
-      f_val =3D float32_maybe_silence_nan(f_val);
+      f_val =3D float32_maybe_silence_nan(f_val, status);
=20
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
@@ -1632,7 +1632,7 @@ static inline float32 float32_from_float16(int16_t =
a, flag ieee,
       float32 f_val;
=20
       f_val =3D float16_to_float32((float16)a, ieee, status);
-      f_val =3D float32_maybe_silence_nan(f_val);
+      f_val =3D float32_maybe_silence_nan(f_val, status);
=20
       return a < 0 ? (f_val | (1 << 31)) : f_val;
 }
@@ -1642,7 +1642,7 @@ static inline float64 float64_from_float32(int32_t =
a, float_status *status)
       float64 f_val;
=20
       f_val =3D float32_to_float64((float64)a, status);
-      f_val =3D float64_maybe_silence_nan(f_val);
+      f_val =3D float64_maybe_silence_nan(f_val, status);
=20
       return a < 0 ? (f_val | (1ULL << 63)) : f_val;
 }
@@ -1788,7 +1788,8 @@ static inline int32_t float64_to_q32(float64 a, flo=
at_status *status)
         c =3D update_msacsr(env, CLEAR_IS_INEXACT, 0);                  =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -2387,7 +2388,8 @@ void helper_msa_fsne_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
         c =3D update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));           =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -2523,7 +2525,8 @@ void helper_msa_fdiv_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
         c =3D update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));           =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -2642,7 +2645,8 @@ void helper_msa_fexp2_df(CPUMIPSState *env, uint32_=
t df, uint32_t wd,
         c =3D update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));           =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -2693,7 +2697,8 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_=
t df, uint32_t wd,
         c =3D update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## XBITS >> 6) << 6) | c;             =
      \
+            DEST =3D ((FLOAT_SNAN ## XBITS(&env->active_tc.msa_fp_status=
)     \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -2730,9 +2735,9 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t =
df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
=20
-#define NUMBER_QNAN_PAIR(ARG1, ARG2, BITS)      \
-    !float ## BITS ## _is_any_nan(ARG1)         \
-    && float ## BITS ## _is_quiet_nan(ARG2)
+#define NUMBER_QNAN_PAIR(ARG1, ARG2, BITS, STATUS)      \
+    !float ## BITS ## _is_any_nan(ARG1)                 \
+    && float ## BITS ## _is_quiet_nan(ARG2, STATUS)
=20
 #define MSA_FLOAT_MAXOP(DEST, OP, ARG1, ARG2, BITS)                     =
    \
     do {                                                                =
    \
@@ -2744,18 +2749,19 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_=
t df, uint32_t wd,
         c =3D update_msacsr(env, 0, 0);                                 =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
-#define FMAXMIN_A(F, G, X, _S, _T, BITS)                            \
+#define FMAXMIN_A(F, G, X, _S, _T, BITS, STATUS)                    \
     do {                                                            \
         uint## BITS ##_t S =3D _S, T =3D _T;                            =
\
         uint## BITS ##_t as, at, xs, xt, xd;                        \
-        if (NUMBER_QNAN_PAIR(S, T, BITS)) {                         \
+        if (NUMBER_QNAN_PAIR(S, T, BITS, STATUS)) {                 \
             T =3D S;                                                  \
         }                                                           \
-        else if (NUMBER_QNAN_PAIR(T, S, BITS)) {                    \
+        else if (NUMBER_QNAN_PAIR(T, S, BITS, STATUS)) {            \
             S =3D T;                                                  \
         }                                                           \
         as =3D float## BITS ##_abs(S);                                \
@@ -2769,6 +2775,7 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t =
df, uint32_t wd,
 void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status =3D &env->active_tc.msa_fp_status;
     wr_t wx, *pwx =3D &wx;
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
@@ -2780,9 +2787,9 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i =3D 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32)) {
+            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pws->w[i], 32=
);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status=
)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pwt->w[i], pwt->w[i], 32=
);
             } else {
                 MSA_FLOAT_MAXOP(pwx->w[i], min, pws->w[i], pwt->w[i], 32=
);
@@ -2791,9 +2798,9 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
         break;
     case DF_DOUBLE:
         for (i =3D 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64)) {
+            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pws->d[i], 64=
);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status=
)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pwt->d[i], pwt->d[i], 64=
);
             } else {
                 MSA_FLOAT_MAXOP(pwx->d[i], min, pws->d[i], pwt->d[i], 64=
);
@@ -2812,6 +2819,7 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
 void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status =3D &env->active_tc.msa_fp_status;
     wr_t wx, *pwx =3D &wx;
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
@@ -2823,12 +2831,12 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint=
32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i =3D 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(min, max, pwx->w[i], pws->w[i], pwt->w[i], 32);
+            FMAXMIN_A(min, max, pwx->w[i], pws->w[i], pwt->w[i], 32, sta=
tus);
         }
         break;
     case DF_DOUBLE:
         for (i =3D 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(min, max, pwx->d[i], pws->d[i], pwt->d[i], 64);
+            FMAXMIN_A(min, max, pwx->d[i], pws->d[i], pwt->d[i], 64, sta=
tus);
         }
         break;
     default:
@@ -2843,6 +2851,7 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32=
_t df, uint32_t wd,
 void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status =3D &env->active_tc.msa_fp_status;
     wr_t wx, *pwx =3D &wx;
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
@@ -2854,9 +2863,9 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i =3D 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32)) {
+            if (NUMBER_QNAN_PAIR(pws->w[i], pwt->w[i], 32, status)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pws->w[i], 32=
);
-            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->w[i], pws->w[i], 32, status=
)) {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pwt->w[i], pwt->w[i], 32=
);
             } else {
                 MSA_FLOAT_MAXOP(pwx->w[i], max, pws->w[i], pwt->w[i], 32=
);
@@ -2865,9 +2874,9 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
         break;
     case DF_DOUBLE:
         for (i =3D 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64)) {
+            if (NUMBER_QNAN_PAIR(pws->d[i], pwt->d[i], 64, status)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pws->d[i], 64=
);
-            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64)) {
+            } else if (NUMBER_QNAN_PAIR(pwt->d[i], pws->d[i], 64, status=
)) {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pwt->d[i], pwt->d[i], 64=
);
             } else {
                 MSA_FLOAT_MAXOP(pwx->d[i], max, pws->d[i], pwt->d[i], 64=
);
@@ -2886,6 +2895,7 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t=
 df, uint32_t wd,
 void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         uint32_t ws, uint32_t wt)
 {
+    float_status *status =3D &env->active_tc.msa_fp_status;
     wr_t wx, *pwx =3D &wx;
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
@@ -2897,12 +2907,12 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint=
32_t df, uint32_t wd,
     switch (df) {
     case DF_WORD:
         for (i =3D 0; i < DF_ELEMENTS(DF_WORD); i++) {
-            FMAXMIN_A(max, min, pwx->w[i], pws->w[i], pwt->w[i], 32);
+            FMAXMIN_A(max, min, pwx->w[i], pws->w[i], pwt->w[i], 32, sta=
tus);
         }
         break;
     case DF_DOUBLE:
         for (i =3D 0; i < DF_ELEMENTS(DF_DOUBLE); i++) {
-            FMAXMIN_A(max, min, pwx->d[i], pws->d[i], pwt->d[i], 64);
+            FMAXMIN_A(max, min, pwx->d[i], pws->d[i], pwt->d[i], 64, sta=
tus);
         }
         break;
     default:
@@ -2920,13 +2930,13 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint=
32_t df,
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
     if (df =3D=3D DF_WORD) {
-        pwd->w[0] =3D helper_float_class_s(pws->w[0]);
-        pwd->w[1] =3D helper_float_class_s(pws->w[1]);
-        pwd->w[2] =3D helper_float_class_s(pws->w[2]);
-        pwd->w[3] =3D helper_float_class_s(pws->w[3]);
+        pwd->w[0] =3D helper_float_class_s(env, pws->w[0], 1);
+        pwd->w[1] =3D helper_float_class_s(env, pws->w[1], 1);
+        pwd->w[2] =3D helper_float_class_s(env, pws->w[2], 1);
+        pwd->w[3] =3D helper_float_class_s(env, pws->w[3], 1);
     } else {
-        pwd->d[0] =3D helper_float_class_d(pws->d[0]);
-        pwd->d[1] =3D helper_float_class_d(pws->d[1]);
+        pwd->d[0] =3D helper_float_class_d(env, pws->d[0], 1);
+        pwd->d[1] =3D helper_float_class_d(env, pws->d[1], 1);
     }
 }
=20
@@ -2940,7 +2950,8 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32=
_t df,
         c =3D update_msacsr(env, CLEAR_FS_UNDERFLOW, 0);                =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         } else if (float ## BITS ## _is_any_nan(ARG)) {                 =
    \
             DEST =3D 0;                                                 =
      \
         }                                                               =
    \
@@ -3044,12 +3055,14 @@ void helper_msa_fsqrt_df(CPUMIPSState *env, uint3=
2_t df, uint32_t wd,
         set_float_exception_flags(0, status);                           =
    \
         DEST =3D float ## BITS ## _ ## div(FLOAT_ONE ## BITS, ARG, statu=
s);   \
         c =3D update_msacsr(env, float ## BITS ## _is_infinity(ARG) ||  =
      \
-                          float ## BITS ## _is_quiet_nan(DEST) ?        =
    \
+                          float ## BITS ## _is_quiet_nan(DEST,          =
    \
+                              &env->active_tc.msa_fp_status) ?          =
    \
                           0 : RECIPROCAL_INEXACT,                       =
    \
                           IS_DENORMAL(DEST, BITS));                     =
    \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
@@ -3165,7 +3178,8 @@ void helper_msa_frint_df(CPUMIPSState *env, uint32_=
t df, uint32_t wd,
         c =3D update_msacsr(env, 0, IS_DENORMAL(DEST, BITS));           =
      \
                                                                         =
    \
         if (get_enabled_exceptions(env, c)) {                           =
    \
-            DEST =3D ((FLOAT_SNAN ## BITS >> 6) << 6) | c;              =
      \
+            DEST =3D ((FLOAT_SNAN ## BITS(&env->active_tc.msa_fp_status)=
      \
+                       >> 6) << 6) | c;                                 =
    \
         }                                                               =
    \
     } while (0)
=20
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 8ec1bef..ce7ec9c 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2660,7 +2660,7 @@ uint64_t helper_float_cvtd_s(CPUMIPSState *env, uin=
t32_t fst0)
     uint64_t fdt2;
=20
     fdt2 =3D float32_to_float64(fst0, &env->active_fpu.fp_status);
-    fdt2 =3D float64_maybe_silence_nan(fdt2);
+    fdt2 =3D float64_maybe_silence_nan(fdt2, &env->active_fpu.fp_status)=
;
     update_fcr31(env, GETPC());
     return fdt2;
 }
@@ -2750,7 +2750,7 @@ uint32_t helper_float_cvts_d(CPUMIPSState *env, uin=
t64_t fdt0)
     uint32_t fst2;
=20
     fst2 =3D float64_to_float32(fdt0, &env->active_fpu.fp_status);
-    fst2 =3D float32_maybe_silence_nan(fst2);
+    fst2 =3D float32_maybe_silence_nan(fst2, &env->active_fpu.fp_status)=
;
     update_fcr31(env, GETPC());
     return fst2;
 }
@@ -3200,11 +3200,17 @@ FLOAT_RINT(rint_d, 64)
 #define FLOAT_CLASS_POSITIVE_ZERO      0x200
=20
 #define FLOAT_CLASS(name, bits)                                      \
-uint ## bits ## _t helper_float_ ## name (uint ## bits ## _t arg)    \
+uint ## bits ## _t helper_float_ ## name (CPUMIPSState *env,         \
+                         uint ## bits ## _t arg, uint32_t is_msa)    \
 {                                                                    \
-    if (float ## bits ## _is_signaling_nan(arg)) {                   \
+    float_status* fst;                                               \
+                                                                     \
+    fst =3D (is_msa =3D=3D 1) ?                                         =
   \
+        &env->active_tc.msa_fp_status : &env->active_fpu.fp_status;  \
+                                                                     \
+    if (float ## bits ## _is_signaling_nan(arg, fst)) {              \
         return FLOAT_CLASS_SIGNALING_NAN;                            \
-    } else if (float ## bits ## _is_quiet_nan(arg)) {                \
+    } else if (float ## bits ## _is_quiet_nan(arg, fst)) {           \
         return FLOAT_CLASS_QUIET_NAN;                                \
     } else if (float ## bits ## _is_neg(arg)) {                      \
         if (float ## bits ## _is_infinity(arg)) {                    \
diff --git a/target-mips/translate.c b/target-mips/translate.c
index a3a05ec..496216d 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -9110,7 +9110,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
         {
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_class_s(fp0, fp0);
+            gen_helper_float_class_s(fp0, cpu_env, fp0, 0);
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9608,7 +9608,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
         {
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_class_d(fp0, fp0);
+            gen_helper_float_class_d(fp0, cpu_env, fp0, 0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -20129,6 +20129,7 @@ void cpu_state_reset(CPUMIPSState *env)
     env->CP0_PageGrain =3D env->cpu_model->CP0_PageGrain;
     env->active_fpu.fcr0 =3D env->cpu_model->CP1_fcr0;
     env->active_fpu.fcr31 =3D env->cpu_model->CP1_fcr31;
+    set_snan_bit_is_one(1, &env->active_fpu.fp_status);
     env->msair =3D env->cpu_model->MSAIR;
     env->insn_flags =3D env->cpu_model->insn_flags;
=20
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 5af077d..c650dd0 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -834,8 +834,9 @@ static void fpu_init (CPUMIPSState *env, const mips_d=
ef_t *def)
 {
     int i;
=20
-    for (i =3D 0; i < MIPS_FPU_MAX; i++)
+    for (i =3D 0; i < MIPS_FPU_MAX; i++) {
         env->fpus[i].fcr0 =3D def->CP1_fcr0;
+    }
=20
     memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
 }
@@ -892,4 +893,6 @@ static void msa_reset(CPUMIPSState *env)
=20
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
+
+    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
 }
diff --git a/target-ppc/fpu_helper.c b/target-ppc/fpu_helper.c
index b67ebca..48e9f40 100644
--- a/target-ppc/fpu_helper.c
+++ b/target-ppc/fpu_helper.c
@@ -73,7 +73,7 @@ void helper_compute_fprf(CPUPPCState *env, uint64_t arg=
)
     farg.ll =3D arg;
     isneg =3D float64_is_neg(farg.d);
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (float64_is_signaling_nan(farg.d)) {
+        if (float64_is_signaling_nan(farg.d, &env->fp_status)) {
             /* Signaling NaN: flags are undefined */
             fprf =3D 0x00;
         } else {
@@ -534,8 +534,8 @@ uint64_t helper_fadd(CPUPPCState *env, uint64_t arg1,=
 uint64_t arg2)
         /* Magnitude subtraction of infinities */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))=
) {
             /* sNaN addition */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -558,8 +558,8 @@ uint64_t helper_fsub(CPUPPCState *env, uint64_t arg1,=
 uint64_t arg2)
         /* Magnitude subtraction of infinities */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))=
) {
             /* sNaN subtraction */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -582,8 +582,8 @@ uint64_t helper_fmul(CPUPPCState *env, uint64_t arg1,=
 uint64_t arg2)
         /* Multiplication of zero by infinity */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))=
) {
             /* sNaN multiplication */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -609,8 +609,8 @@ uint64_t helper_fdiv(CPUPPCState *env, uint64_t arg1,=
 uint64_t arg2)
         /* Division of zero by zero */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXZDZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))=
) {
             /* sNaN division */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -632,7 +632,7 @@ uint64_t helper_##op(CPUPPCState *env, uint64_t arg) =
                  \
     if (unlikely(env->fp_status.float_exception_flags)) {              \
         if (float64_is_any_nan(arg)) {                                 \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXCVI, 1);      \
-            if (float64_is_signaling_nan(arg)) {                       \
+            if (float64_is_signaling_nan(arg, &env->fp_status)) {      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1); \
             }                                                          \
             farg.ll =3D nanval;                                         =
 \
@@ -681,7 +681,7 @@ static inline uint64_t do_fri(CPUPPCState *env, uint6=
4_t arg,
=20
     farg.ll =3D arg;
=20
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN round */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         farg.ll =3D arg | 0x0008000000000000ULL;
@@ -737,9 +737,9 @@ uint64_t helper_fmadd(CPUPPCState *env, uint64_t arg1=
, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))=
) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -780,9 +780,9 @@ uint64_t helper_fmsub(CPUPPCState *env, uint64_t arg1=
, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))=
) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -821,9 +821,9 @@ uint64_t helper_fnmadd(CPUPPCState *env, uint64_t arg=
1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))=
) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -866,9 +866,9 @@ uint64_t helper_fnmsub(CPUPPCState *env, uint64_t arg=
1, uint64_t arg2,
         /* Multiplication of zero by infinity */
         farg1.ll =3D fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, 1=
);
     } else {
-        if (unlikely(float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d) ||
-                     float64_is_signaling_nan(farg3.d))) {
+        if (unlikely(float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg3.d, &env->fp_status))=
) {
             /* sNaN operation */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
         }
@@ -903,7 +903,7 @@ uint64_t helper_frsp(CPUPPCState *env, uint64_t arg)
=20
     farg.ll =3D arg;
=20
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN square root */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -921,7 +921,7 @@ uint64_t helper_fsqrt(CPUPPCState *env, uint64_t arg)
     farg.ll =3D arg;
=20
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (unlikely(float64_is_signaling_nan(farg.d))) {
+        if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status)))=
 {
             /* sNaN reciprocal square root */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
             farg.ll =3D float64_snan_to_qnan(farg.ll);
@@ -942,7 +942,7 @@ uint64_t helper_fre(CPUPPCState *env, uint64_t arg)
=20
     farg.ll =3D arg;
=20
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN reciprocal */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -958,7 +958,7 @@ uint64_t helper_fres(CPUPPCState *env, uint64_t arg)
=20
     farg.ll =3D arg;
=20
-    if (unlikely(float64_is_signaling_nan(farg.d))) {
+    if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status))) {
         /* sNaN reciprocal */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -977,7 +977,7 @@ uint64_t helper_frsqrte(CPUPPCState *env, uint64_t ar=
g)
     farg.ll =3D arg;
=20
     if (unlikely(float64_is_any_nan(farg.d))) {
-        if (unlikely(float64_is_signaling_nan(farg.d))) {
+        if (unlikely(float64_is_signaling_nan(farg.d, &env->fp_status)))=
 {
             /* sNaN reciprocal square root */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
             farg.ll =3D float64_snan_to_qnan(farg.ll);
@@ -1100,8 +1100,8 @@ void helper_fcmpu(CPUPPCState *env, uint64_t arg1, =
uint64_t arg2,
     env->fpscr |=3D ret << FPSCR_FPRF;
     env->crf[crfD] =3D ret;
     if (unlikely(ret =3D=3D 0x01UL
-                 && (float64_is_signaling_nan(farg1.d) ||
-                     float64_is_signaling_nan(farg2.d)))) {
+                 && (float64_is_signaling_nan(farg1.d, &env->fp_status) =
||
+                     float64_is_signaling_nan(farg2.d, &env->fp_status))=
)) {
         /* sNaN comparison */
         fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 1);
     }
@@ -1131,8 +1131,8 @@ void helper_fcmpo(CPUPPCState *env, uint64_t arg1, =
uint64_t arg2,
     env->fpscr |=3D ret << FPSCR_FPRF;
     env->crf[crfD] =3D ret;
     if (unlikely(ret =3D=3D 0x01UL)) {
-        if (float64_is_signaling_nan(farg1.d) ||
-            float64_is_signaling_nan(farg2.d)) {
+        if (float64_is_signaling_nan(farg1.d, &env->fp_status) ||
+            float64_is_signaling_nan(farg2.d, &env->fp_status)) {
             /* sNaN comparison */
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN |
                                   POWERPC_EXCP_FP_VXVC, 1);
@@ -1168,7 +1168,7 @@ static inline int32_t efsctsi(CPUPPCState *env, uin=
t32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
=20
@@ -1181,7 +1181,7 @@ static inline uint32_t efsctui(CPUPPCState *env, ui=
nt32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
=20
@@ -1194,7 +1194,7 @@ static inline uint32_t efsctsiz(CPUPPCState *env, u=
int32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
=20
@@ -1207,7 +1207,7 @@ static inline uint32_t efsctuiz(CPUPPCState *env, u=
int32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
=20
@@ -1245,7 +1245,7 @@ static inline uint32_t efsctsf(CPUPPCState *env, ui=
nt32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
     tmp =3D uint64_to_float32(1ULL << 32, &env->vec_status);
@@ -1261,7 +1261,7 @@ static inline uint32_t efsctuf(CPUPPCState *env, ui=
nt32_t val)
=20
     u.l =3D val;
     /* NaN are not treated the same way IEEE 754 does */
-    if (unlikely(float32_is_quiet_nan(u.f))) {
+    if (unlikely(float32_is_quiet_nan(u.f, &env->vec_status))) {
         return 0;
     }
     tmp =3D uint64_to_float32(1ULL << 32, &env->vec_status);
@@ -1839,8 +1839,8 @@ void helper_##name(CPUPPCState *env, uint32_t opcod=
e)                        \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
             if (tp##_is_infinity(xa.fld) && tp##_is_infinity(xb.fld)) { =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXISI, sfprf)=
;    \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                 =
     \
-                       tp##_is_signaling_nan(xb.fld)) {                 =
     \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||         =
     \
+                       tp##_is_signaling_nan(xb.fld, &tstat)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);   \
             }                                                           =
     \
         }                                                               =
     \
@@ -1894,8 +1894,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                          \
             if ((tp##_is_infinity(xa.fld) && tp##_is_zero(xb.fld)) ||   =
     \
                 (tp##_is_infinity(xb.fld) && tp##_is_zero(xa.fld))) {   =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXIMZ, sfprf)=
;    \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                 =
     \
-                       tp##_is_signaling_nan(xb.fld)) {                 =
     \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||         =
     \
+                       tp##_is_signaling_nan(xb.fld, &tstat)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);   \
             }                                                           =
     \
         }                                                               =
     \
@@ -1948,8 +1948,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                           \
             } else if (tp##_is_zero(xa.fld) &&                          =
      \
                 tp##_is_zero(xb.fld)) {                                 =
      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXZDZ, sfprf)=
;     \
-            } else if (tp##_is_signaling_nan(xa.fld) ||                 =
      \
-                tp##_is_signaling_nan(xb.fld)) {                        =
      \
+            } else if (tp##_is_signaling_nan(xa.fld, &tstat) ||         =
      \
+                tp##_is_signaling_nan(xb.fld, &tstat)) {                =
      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);    \
             }                                                           =
      \
         }                                                               =
      \
@@ -1990,7 +1990,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                           \
     helper_reset_fpstatus(env);                                         =
      \
                                                                         =
      \
     for (i =3D 0; i < nels; i++) {                                      =
        \
-        if (unlikely(tp##_is_signaling_nan(xb.fld))) {                  =
      \
+        if (unlikely(tp##_is_signaling_nan(xb.fld, &env->fp_status))) { =
      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);    \
         }                                                               =
      \
         xt.fld =3D tp##_div(tp##_one, xb.fld, &env->fp_status);         =
        \
@@ -2039,7 +2039,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                          \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
             if (tp##_is_neg(xb.fld) && !tp##_is_zero(xb.fld)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSQRT, sfprf=
);   \
-            } else if (tp##_is_signaling_nan(xb.fld)) {                 =
     \
+            } else if (tp##_is_signaling_nan(xb.fld, &tstat)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);   \
             }                                                           =
     \
         }                                                               =
     \
@@ -2089,7 +2089,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                          \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{    \
             if (tp##_is_neg(xb.fld) && !tp##_is_zero(xb.fld)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSQRT, sfprf=
);   \
-            } else if (tp##_is_signaling_nan(xb.fld)) {                 =
     \
+            } else if (tp##_is_signaling_nan(xb.fld, &tstat)) {         =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);   \
             }                                                           =
     \
         }                                                               =
     \
@@ -2274,9 +2274,9 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                           \
         env->fp_status.float_exception_flags |=3D tstat.float_exception_=
flags;  \
                                                                         =
      \
         if (unlikely(tstat.float_exception_flags & float_flag_invalid)) =
{     \
-            if (tp##_is_signaling_nan(xa.fld) ||                        =
      \
-                tp##_is_signaling_nan(b->fld) ||                        =
      \
-                tp##_is_signaling_nan(c->fld)) {                        =
      \
+            if (tp##_is_signaling_nan(xa.fld, &tstat) ||                =
      \
+                tp##_is_signaling_nan(b->fld, &tstat) ||                =
      \
+                tp##_is_signaling_nan(c->fld, &tstat)) {                =
      \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, sfprf=
);    \
                 tstat.float_exception_flags &=3D ~float_flag_invalid;   =
        \
             }                                                           =
      \
@@ -2358,8 +2358,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                      \
                                                                         =
 \
     if (unlikely(float64_is_any_nan(xa.VsrD(0)) ||                      =
 \
                  float64_is_any_nan(xb.VsrD(0)))) {                     =
 \
-        if (float64_is_signaling_nan(xa.VsrD(0)) ||                     =
 \
-            float64_is_signaling_nan(xb.VsrD(0))) {                     =
 \
+        if (float64_is_signaling_nan(xa.VsrD(0), &env->fp_status) ||    =
 \
+            float64_is_signaling_nan(xb.VsrD(0), &env->fp_status)) {    =
 \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);      =
 \
         }                                                               =
 \
         if (ordered) {                                                  =
 \
@@ -2406,8 +2406,8 @@ void helper_##name(CPUPPCState *env, uint32_t opcod=
e)                         \
                                                                         =
      \
     for (i =3D 0; i < nels; i++) {                                      =
        \
         xt.fld =3D tp##_##op(xa.fld, xb.fld, &env->fp_status);          =
        \
-        if (unlikely(tp##_is_signaling_nan(xa.fld) ||                   =
      \
-                     tp##_is_signaling_nan(xb.fld))) {                  =
      \
+        if (unlikely(tp##_is_signaling_nan(xa.fld, &env->fp_status) ||  =
      \
+                     tp##_is_signaling_nan(xb.fld, &env->fp_status))) { =
      \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);      =
      \
         }                                                               =
      \
     }                                                                   =
      \
@@ -2446,8 +2446,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                       \
     for (i =3D 0; i < nels; i++) {                                      =
    \
         if (unlikely(tp##_is_any_nan(xa.fld) ||                         =
  \
                      tp##_is_any_nan(xb.fld))) {                        =
  \
-            if (tp##_is_signaling_nan(xa.fld) ||                        =
  \
-                tp##_is_signaling_nan(xb.fld)) {                        =
  \
+            if (tp##_is_signaling_nan(xa.fld, &env->fp_status) ||       =
  \
+                tp##_is_signaling_nan(xb.fld, &env->fp_status)) {       =
  \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);  =
  \
             }                                                           =
  \
             if (svxvc) {                                                =
  \
@@ -2500,7 +2500,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                \
                                                                    \
     for (i =3D 0; i < nels; i++) {                                   \
         xt.tfld =3D stp##_to_##ttp(xb.sfld, &env->fp_status);        \
-        if (unlikely(stp##_is_signaling_nan(xb.sfld))) {           \
+        if (unlikely(stp##_is_signaling_nan(xb.sfld,               \
+                                            &env->fp_status))) {   \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0); \
             xt.tfld =3D ttp##_snan_to_qnan(xt.tfld);                 \
         }                                                          \
@@ -2555,7 +2556,7 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                          \
                                                                         =
     \
     for (i =3D 0; i < nels; i++) {                                      =
       \
         if (unlikely(stp##_is_any_nan(xb.sfld))) {                      =
     \
-            if (stp##_is_signaling_nan(xb.sfld)) {                      =
     \
+            if (stp##_is_signaling_nan(xb.sfld, &env->fp_status)) {     =
     \
                 fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);  =
     \
             }                                                           =
     \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXCVI, 0);       =
     \
@@ -2664,7 +2665,8 @@ void helper_##op(CPUPPCState *env, uint32_t opcode)=
                    \
     }                                                                  \
                                                                        \
     for (i =3D 0; i < nels; i++) {                                      =
 \
-        if (unlikely(tp##_is_signaling_nan(xb.fld))) {                 \
+        if (unlikely(tp##_is_signaling_nan(xb.fld,                     \
+                                           &env->fp_status))) {        \
             fload_invalid_op_excp(env, POWERPC_EXCP_FP_VXSNAN, 0);     \
             xt.fld =3D tp##_snan_to_qnan(xb.fld);                       =
 \
         } else {                                                       \
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index f515725..2f47854 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -573,6 +573,7 @@ static inline void vscr_init (CPUPPCState *env, uint3=
2_t val)
     /* Altivec always uses round-to-nearest */
     set_float_rounding_mode(float_round_nearest_even, &env->vec_status);
     set_flush_to_zero(vscr_nj, &env->vec_status);
+    set_snan_bit_is_one(0, &env->vec_status);
 }
=20
 #ifdef CONFIG_USER_ONLY
@@ -9930,6 +9931,7 @@ static void ppc_cpu_reset(CPUState *s)
         }
         env->spr[i] =3D spr->default_value;
     }
+    set_snan_bit_is_one(0, &env->fp_status);
=20
     /* Flush all TLBs */
     tlb_flush(s, 1);
diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
index 4bfff34..93a11d7 100644
--- a/target-s390x/cpu.c
+++ b/target-s390x/cpu.c
@@ -173,6 +173,7 @@ static void s390_cpu_full_reset(CPUState *s)
     /* tininess for underflow is detected before rounding */
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->fpu_status);
+    set_snan_bit_is_one(0, &env->fpu_status);
=20
     /* Reset state inside the kernel that we cannot access yet from QEMU=
. */
     if (kvm_enabled()) {
diff --git a/target-s390x/fpu_helper.c b/target-s390x/fpu_helper.c
index 1c7f673..d527c98 100644
--- a/target-s390x/fpu_helper.c
+++ b/target-s390x/fpu_helper.c
@@ -266,7 +266,7 @@ uint64_t HELPER(ldeb)(CPUS390XState *env, uint64_t f2=
)
 {
     float64 ret =3D float32_to_float64(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float64_maybe_silence_nan(ret);
+    return float64_maybe_silence_nan(ret, &env->fpu_status);
 }
=20
 /* convert 128-bit float to 64-bit float */
@@ -274,7 +274,7 @@ uint64_t HELPER(ldxb)(CPUS390XState *env, uint64_t ah=
, uint64_t al)
 {
     float64 ret =3D float128_to_float64(make_float128(ah, al), &env->fpu=
_status);
     handle_exceptions(env, GETPC());
-    return float64_maybe_silence_nan(ret);
+    return float64_maybe_silence_nan(ret, &env->fpu_status);
 }
=20
 /* convert 64-bit float to 128-bit float */
@@ -282,7 +282,7 @@ uint64_t HELPER(lxdb)(CPUS390XState *env, uint64_t f2=
)
 {
     float128 ret =3D float64_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return RET128(float128_maybe_silence_nan(ret));
+    return RET128(float128_maybe_silence_nan(ret, &env->fpu_status));
 }
=20
 /* convert 32-bit float to 128-bit float */
@@ -290,7 +290,7 @@ uint64_t HELPER(lxeb)(CPUS390XState *env, uint64_t f2=
)
 {
     float128 ret =3D float32_to_float128(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return RET128(float128_maybe_silence_nan(ret));
+    return RET128(float128_maybe_silence_nan(ret, &env->fpu_status));
 }
=20
 /* convert 64-bit float to 32-bit float */
@@ -298,7 +298,7 @@ uint64_t HELPER(ledb)(CPUS390XState *env, uint64_t f2=
)
 {
     float32 ret =3D float64_to_float32(f2, &env->fpu_status);
     handle_exceptions(env, GETPC());
-    return float32_maybe_silence_nan(ret);
+    return float32_maybe_silence_nan(ret, &env->fpu_status);
 }
=20
 /* convert 128-bit float to 32-bit float */
@@ -306,7 +306,7 @@ uint64_t HELPER(lexb)(CPUS390XState *env, uint64_t ah=
, uint64_t al)
 {
     float32 ret =3D float128_to_float32(make_float128(ah, al), &env->fpu=
_status);
     handle_exceptions(env, GETPC());
-    return float32_maybe_silence_nan(ret);
+    return float32_maybe_silence_nan(ret, &env->fpu_status);
 }
=20
 /* 32-bit FP compare */
@@ -623,7 +623,7 @@ uint64_t HELPER(msdb)(CPUS390XState *env, uint64_t f1=
,
 }
=20
 /* test data class 32-bit */
-uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
+uint32_t HELPER(tceb)(CPUS390XState *env, uint64_t f1, uint64_t m2)
 {
     float32 v1 =3D f1;
     int neg =3D float32_is_neg(v1);
@@ -632,7 +632,8 @@ uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
     if ((float32_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float32_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float32_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float32_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float32_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc =3D 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
@@ -643,7 +644,7 @@ uint32_t HELPER(tceb)(uint64_t f1, uint64_t m2)
 }
=20
 /* test data class 64-bit */
-uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
+uint32_t HELPER(tcdb)(CPUS390XState *env, uint64_t v1, uint64_t m2)
 {
     int neg =3D float64_is_neg(v1);
     uint32_t cc =3D 0;
@@ -651,7 +652,8 @@ uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
     if ((float64_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float64_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float64_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float64_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float64_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc =3D 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
@@ -662,7 +664,8 @@ uint32_t HELPER(tcdb)(uint64_t v1, uint64_t m2)
 }
=20
 /* test data class 128-bit */
-uint32_t HELPER(tcxb)(uint64_t ah, uint64_t al, uint64_t m2)
+uint32_t HELPER(tcxb)(CPUS390XState *env, uint64_t ah,
+                      uint64_t al, uint64_t m2)
 {
     float128 v1 =3D make_float128(ah, al);
     int neg =3D float128_is_neg(v1);
@@ -671,7 +674,8 @@ uint32_t HELPER(tcxb)(uint64_t ah, uint64_t al, uint6=
4_t m2)
     if ((float128_is_zero(v1) && (m2 & (1 << (11-neg)))) ||
         (float128_is_infinity(v1) && (m2 & (1 << (5-neg)))) ||
         (float128_is_any_nan(v1) && (m2 & (1 << (3-neg)))) ||
-        (float128_is_signaling_nan(v1) && (m2 & (1 << (1-neg))))) {
+        (float128_is_signaling_nan(v1, &env->fpu_status) &&
+         (m2 & (1 << (1-neg))))) {
         cc =3D 1;
     } else if (m2 & (1 << (9-neg))) {
         /* assume normalized number */
diff --git a/target-s390x/helper.h b/target-s390x/helper.h
index 7e06119..207a6e7 100644
--- a/target-s390x/helper.h
+++ b/target-s390x/helper.h
@@ -67,9 +67,9 @@ DEF_HELPER_FLAGS_4(maeb, TCG_CALL_NO_WG, i64, env, i64,=
 i64, i64)
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
@@ -3979,21 +3979,21 @@ static ExitStatus op_svc(DisasContext *s, DisasOp=
s *o)
=20
 static ExitStatus op_tceb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tceb(cc_op, o->in1, o->in2);
+    gen_helper_tceb(cc_op, cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return NO_EXIT;
 }
=20
 static ExitStatus op_tcdb(DisasContext *s, DisasOps *o)
 {
-    gen_helper_tcdb(cc_op, o->in1, o->in2);
+    gen_helper_tcdb(cc_op, cpu_env, o->in1, o->in2);
     set_cc_static(s);
     return NO_EXIT;
 }
=20
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
=20
 static void superh_cpu_disas_set_info(CPUState *cpu, disassemble_info *i=
nfo)
diff --git a/target-sparc/cpu.c b/target-sparc/cpu.c
index fe4119e..1486a50 100644
--- a/target-sparc/cpu.c
+++ b/target-sparc/cpu.c
@@ -70,6 +70,7 @@ static void sparc_cpu_reset(CPUState *s)
     env->npc =3D env->pc + 4;
 #endif
     env->cache_control =3D 0;
+    set_snan_bit_is_one(0, &env->fp_status);
 }
=20
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
diff --git a/target-tricore/helper.c b/target-tricore/helper.c
index 71b31cd..e4eaec6 100644
--- a/target-tricore/helper.c
+++ b/target-tricore/helper.c
@@ -116,6 +116,7 @@ void fpu_set_state(CPUTriCoreState *env)
     set_flush_inputs_to_zero(1, &env->fp_status);
     set_flush_to_zero(1, &env->fp_status);
     set_default_nan_mode(1, &env->fp_status);
+    set_snan_bit_is_one(0, &env->fp_status);
 }
=20
 uint32_t psw_read(CPUTriCoreState *env)
diff --git a/target-unicore32/cpu.c b/target-unicore32/cpu.c
index 66f43ac..1138687 100644
--- a/target-unicore32/cpu.c
+++ b/target-unicore32/cpu.c
@@ -77,6 +77,7 @@ static void unicore_ii_cpu_initfn(Object *obj)
=20
     set_feature(env, UC32_HWCAP_CMOV);
     set_feature(env, UC32_HWCAP_UCF64);
+    set_snan_bit_is_one(1, &env->ucf64.fp_status);
 }
=20
 static void uc32_any_cpu_initfn(Object *obj)
@@ -89,6 +90,7 @@ static void uc32_any_cpu_initfn(Object *obj)
=20
     set_feature(env, UC32_HWCAP_CMOV);
     set_feature(env, UC32_HWCAP_UCF64);
+    set_snan_bit_is_one(1, &env->ucf64.fp_status);
 }
=20
 static const UniCore32CPUInfo uc32_cpus[] =3D {
diff --git a/target-xtensa/cpu.c b/target-xtensa/cpu.c
index 01b251f..0bb17b7 100644
--- a/target-xtensa/cpu.c
+++ b/target-xtensa/cpu.c
@@ -72,6 +72,9 @@ static void xtensa_cpu_reset(CPUState *s)
     env->sregs[CONFIGID1] =3D env->config->configid[1];
=20
     env->pending_irq_level =3D 0;
+
+    set_snan_bit_is_one(0, &env->fp_status);
+
     reset_mmu(env);
 }
=20
--=20
1.7.9.5

