Received: by 10.25.208.211 with SMTP id h202csp588919lfg;
        Thu, 7 Apr 2016 09:03:37 -0700 (PDT)
X-Received: by 10.55.200.133 with SMTP id t5mr4875041qkl.55.1460045016866;
        Thu, 07 Apr 2016 09:03:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u128si6361620qhb.120.2016.04.07.09.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 09:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aoCPA-0007hT-8w
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 12:03:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOY-0006cE-Ga
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:03:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1aoCOV-0004oC-2y
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 12:02:58 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52627 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1aoCOU-0004hU-IY; Thu, 07 Apr 2016 12:02:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 702FE1A45B5;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from mcs19.domain.local (mcs19.domain.local [10.10.13.51])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 43B501A4554;
	Thu,  7 Apr 2016 18:02:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  7 Apr 2016 18:00:51 +0200
Message-Id: <1460044851-61721-3-git-send-email-aleksandar.markovic@rt-rk.com>
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
Subject: [Qemu-arm] [PATCH 2/2] target-mips: Activate IEEE 754-2008 support
	for Mips
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
X-TUID: DJOH+i8VAAhs

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch utilizes provisions from the previous patch, and configures
Mips R6 CPUs and Mips MSA units appropriately with reference to the meani=
ng
of the signaling NaN bit (this is mentioned in point 2 in the list below)=
.
The majority of involved MIPS instructions will be fixed just with that
change. Certain number of other IEEE 754-2008-related MIPS issues are
addressed with this patch as well.

The changes can be summarized this way:

1) Definitions of Mips processors are updated to reflect supported
   IEEE-754-2008-related features. (file target-mips/translate_init.c)

2) Functions mips_cpu_reset() and msa_reset() are updated so that flag
   snan_bit_is_one is properly set for any Mips configuration.
   (file target-mips/translate_init.c)

3) Updated handling of instuctions <ABS|NEG>.<S|D>. Note that legacy
   (pre-nan2008) ABS and NEG instructions are arithmetic (any NaN operand
   signals invalid operation), while R6 ones are non-arithmetic, always
   changing the sign bit, even for NaN-like operands. Details on these
   instructions are documented in [1] p. 35 and 359. Affected file is
   target-mips/translate.c.

4) New set of helpers for handling nan2008-syle versions of instructions
   <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>. Details on these instruction=
s
   are presented in [1] p. 129, 130, 149, 155, 222, 223, 393, 394, 504,
   505. Affected files are target-mips/helper.h, target-mips/translate.c,
   and target-mips/op-helper.c.

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32=C2=AE SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016

Signed-off-by: Maciej Rozycki <maciej.rozycki@imgtec.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/helper.h         |   18 ++-
 target-mips/op_helper.c      |  334 ++++++++++++++++++++++++++++++++++++=
+++---
 target-mips/translate.c      |  154 +++++++++++++++----
 target-mips/translate_init.c |   17 ++-
 4 files changed, 467 insertions(+), 56 deletions(-)

diff --git a/target-mips/helper.h b/target-mips/helper.h
index 133dcfb..61bbda7 100644
--- a/target-mips/helper.h
+++ b/target-mips/helper.h
@@ -207,8 +207,6 @@ DEF_HELPER_4(ctc1, void, env, tl, i32, i32)
 DEF_HELPER_2(float_cvtd_s, i64, env, i32)
 DEF_HELPER_2(float_cvtd_w, i64, env, i32)
 DEF_HELPER_2(float_cvtd_l, i64, env, i64)
-DEF_HELPER_2(float_cvtl_d, i64, env, i64)
-DEF_HELPER_2(float_cvtl_s, i64, env, i32)
 DEF_HELPER_2(float_cvtps_pw, i64, env, i64)
 DEF_HELPER_2(float_cvtpw_ps, i64, env, i64)
 DEF_HELPER_2(float_cvts_d, i32, env, i64)
@@ -216,8 +214,6 @@ DEF_HELPER_2(float_cvts_w, i32, env, i32)
 DEF_HELPER_2(float_cvts_l, i32, env, i64)
 DEF_HELPER_2(float_cvts_pl, i32, env, i32)
 DEF_HELPER_2(float_cvts_pu, i32, env, i32)
-DEF_HELPER_2(float_cvtw_s, i32, env, i32)
-DEF_HELPER_2(float_cvtw_d, i32, env, i64)
=20
 DEF_HELPER_3(float_addr_ps, i64, env, i64, i64)
 DEF_HELPER_3(float_mulr_ps, i64, env, i64, i64)
@@ -242,14 +238,20 @@ FOP_PROTO(mina)
 #undef FOP_PROTO
=20
 #define FOP_PROTO(op)                            \
-DEF_HELPER_2(float_ ## op ## l_s, i64, env, i32) \
-DEF_HELPER_2(float_ ## op ## l_d, i64, env, i64) \
-DEF_HELPER_2(float_ ## op ## w_s, i32, env, i32) \
-DEF_HELPER_2(float_ ## op ## w_d, i32, env, i64)
+DEF_HELPER_2(float_ ## op ## _l_s, i64, env, i32) \
+DEF_HELPER_2(float_ ## op ## _l_d, i64, env, i64) \
+DEF_HELPER_2(float_ ## op ## _w_s, i32, env, i32) \
+DEF_HELPER_2(float_ ## op ## _w_d, i32, env, i64)
+FOP_PROTO(cvt)
 FOP_PROTO(round)
 FOP_PROTO(trunc)
 FOP_PROTO(ceil)
 FOP_PROTO(floor)
+FOP_PROTO(cvt_2008)
+FOP_PROTO(round_2008)
+FOP_PROTO(trunc_2008)
+FOP_PROTO(ceil_2008)
+FOP_PROTO(floor_2008)
 #undef FOP_PROTO
=20
 #define FOP_PROTO(op)                            \
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index ce7ec9c..841f066 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2448,9 +2448,19 @@ void mips_cpu_unassigned_access(CPUState *cs, hwad=
dr addr,
=20
 #define FLOAT_TWO32 make_float32(1 << 30)
 #define FLOAT_TWO64 make_float64(1ULL << 62)
+
 #define FP_TO_INT32_OVERFLOW 0x7fffffff
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
=20
+#define FLT_TO_INT32_OVERFLOW(x)                                        =
     \
+    float32_is_any_nan(x) ? 0 : (float32_is_neg(x) ? INT32_MIN : INT32_M=
AX)
+#define FLT_TO_INT64_OVERFLOW(x)                                        =
     \
+    float32_is_any_nan(x) ? 0 : (float32_is_neg(x) ? INT64_MIN : INT64_M=
AX)
+#define DBL_TO_INT32_OVERFLOW(x)                                        =
     \
+    float64_is_any_nan(x) ? 0 : (float64_is_neg(x) ? INT32_MIN : INT32_M=
AX)
+#define DBL_TO_INT64_OVERFLOW(x)                                        =
     \
+    float64_is_any_nan(x) ? 0 : (float64_is_neg(x) ? INT64_MIN : INT64_M=
AX)
+
 /* convert MIPS rounding mode in FCR31 to IEEE library */
 unsigned int ieee_rm[] =3D {
     float_round_nearest_even,
@@ -2683,7 +2693,7 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uin=
t64_t dt0)
     return fdt2;
 }
=20
-uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2696,7 +2706,7 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_cvtl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2791,7 +2801,7 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, ui=
nt32_t wth0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2804,7 +2814,7 @@ uint32_t helper_float_cvtw_s(CPUMIPSState *env, uin=
t32_t fst0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2817,7 +2827,7 @@ uint32_t helper_float_cvtw_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return wt2;
 }
=20
-uint64_t helper_float_roundl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_round_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2832,7 +2842,7 @@ uint64_t helper_float_roundl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_roundl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_round_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2847,7 +2857,7 @@ uint64_t helper_float_roundl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_roundw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_round_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2862,7 +2872,7 @@ uint32_t helper_float_roundw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_roundw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_round_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2877,7 +2887,7 @@ uint32_t helper_float_roundw_s(CPUMIPSState *env, u=
int32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_truncl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_trunc_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2890,7 +2900,7 @@ uint64_t helper_float_truncl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_truncl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_trunc_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2903,7 +2913,7 @@ uint64_t helper_float_truncl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_truncw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_trunc_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2916,7 +2926,7 @@ uint32_t helper_float_truncw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_truncw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_trunc_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2929,7 +2939,7 @@ uint32_t helper_float_truncw_s(CPUMIPSState *env, u=
int32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_ceill_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_ceil_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2944,7 +2954,7 @@ uint64_t helper_float_ceill_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_ceill_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_ceil_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2959,7 +2969,7 @@ uint64_t helper_float_ceill_s(CPUMIPSState *env, ui=
nt32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_ceil_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2974,7 +2984,7 @@ uint32_t helper_float_ceilw_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_ceil_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2989,7 +2999,7 @@ uint32_t helper_float_ceilw_s(CPUMIPSState *env, ui=
nt32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_floorl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_floor_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -3004,7 +3014,7 @@ uint64_t helper_float_floorl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_floorl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_floor_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -3019,7 +3029,7 @@ uint64_t helper_float_floorl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_floorw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_floor_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -3034,7 +3044,7 @@ uint32_t helper_float_floorw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_floor_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -3049,6 +3059,290 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env,=
 uint32_t fst0)
     return wt2;
 }
=20
+uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_cvt_2008_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D FLT_TO_INT64_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_cvt_2008_w_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint32_t wt2;
+
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D DBL_TO_INT32_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint32_t helper_float_cvt_2008_w_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t wt2;
+
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D FLT_TO_INT32_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_round_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_round_2008_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D FLT_TO_INT64_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_round_2008_w_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D DBL_TO_INT32_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint32_t helper_float_round_2008_w_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D FLT_TO_INT32_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_trunc_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    dt2 =3D float64_to_int64_round_to_zero(fdt0, &env->active_fpu.fp_sta=
tus);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_trunc_2008_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    dt2 =3D float32_to_int64_round_to_zero(fst0, &env->active_fpu.fp_sta=
tus);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D FLT_TO_INT64_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_trunc_2008_w_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint32_t wt2;
+
+    wt2 =3D float64_to_int32_round_to_zero(fdt0, &env->active_fpu.fp_sta=
tus);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D DBL_TO_INT32_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint32_t helper_float_trunc_2008_w_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t wt2;
+
+    wt2 =3D float32_to_int32_round_to_zero(fst0, &env->active_fpu.fp_sta=
tus);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D FLT_TO_INT32_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_ceil_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_ceil_2008_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D FLT_TO_INT64_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_ceil_2008_w_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D DBL_TO_INT32_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint32_t helper_float_ceil_2008_w_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D FLT_TO_INT32_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint64_t helper_float_floor_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D DBL_TO_INT64_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_floor_2008_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        dt2 =3D FLT_TO_INT64_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_floor_2008_w_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D DBL_TO_INT32_OVERFLOW(fdt0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
+uint32_t helper_float_floor_2008_w_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t wt2;
+
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid | float_flag_overflow)) {
+        wt2 =3D FLT_TO_INT32_OVERFLOW(fst0);
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
 /* unary operations, not modifying fp status  */
 #define FLOAT_UNOP(name)                                       \
 uint64_t helper_float_ ## name ## _d(uint64_t fdt0)                \
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 496216d..9f921aa 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1434,6 +1434,8 @@ typedef struct DisasContext {
     bool vp;
     bool cmgcr;
     bool mrp;
+    bool nan2008;
+    bool abs2008;
 } DisasContext;
=20
 enum {
@@ -8879,7 +8881,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_abs_s(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_andi_i32(fp0, fp0, 0x7fffffffUL);
+            } else {
+                gen_helper_float_abs_s(fp0, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8898,7 +8904,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_chs_s(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_xori_i32(fp0, fp0, 1UL << 31);
+            } else {
+                gen_helper_float_chs_s(fp0, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8910,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_roundl_s(fp64, cpu_env, fp32);
+            if (ctx->nan2008) {
+                gen_helper_float_round_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_round_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8923,7 +8937,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_truncl_s(fp64, cpu_env, fp32);
+            if (ctx->nan2008) {
+                gen_helper_float_trunc_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_trunc_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8936,7 +8954,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_ceill_s(fp64, cpu_env, fp32);
+            if (ctx->nan2008) {
+                gen_helper_float_ceil_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_ceil_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8949,7 +8971,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_floorl_s(fp64, cpu_env, fp32);
+            if (ctx->nan2008) {
+                gen_helper_float_floor_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_floor_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8960,7 +8986,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_roundw_s(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_round_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_round_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8970,7 +9000,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_truncw_s(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_trunc_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_trunc_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8980,7 +9014,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_ceilw_s(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_ceil_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_ceil_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8990,7 +9028,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_floorw_s(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_floor_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_floor_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9239,7 +9281,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_cvtw_s(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_cvt_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9251,7 +9297,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_cvtl_s(fp64, cpu_env, fp32);
+            if (ctx->nan2008) {
+                gen_helper_float_cvt_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -9369,7 +9419,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_abs_d(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_andi_i64(fp0, fp0, 0x7fffffffffffffffULL);
+            } else {
+                gen_helper_float_abs_d(fp0, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9390,7 +9444,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_chs_d(fp0, fp0);
+            if (ctx->abs2008) {
+                tcg_gen_xori_i64(fp0, fp0, 1ULL << 63);
+            } else {
+                gen_helper_float_chs_d(fp0, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9401,7 +9459,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_roundl_d(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_round_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_round_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9412,7 +9474,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_truncl_d(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_trunc_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_trunc_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9423,7 +9489,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_ceill_d(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_ceil_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_ceil_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9434,7 +9504,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_floorl_d(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_floor_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_floor_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9446,7 +9520,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_roundw_d(fp32, cpu_env, fp64);
+            if (ctx->nan2008) {
+                gen_helper_float_round_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_round_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9459,7 +9537,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_truncw_d(fp32, cpu_env, fp64);
+            if (ctx->nan2008) {
+                gen_helper_float_trunc_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_trunc_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9472,7 +9554,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_ceilw_d(fp32, cpu_env, fp64);
+            if (ctx->nan2008) {
+                gen_helper_float_ceil_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_ceil_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9485,7 +9571,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_floorw_d(fp32, cpu_env, fp64);
+            if (ctx->nan2008) {
+                gen_helper_float_floor_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_floor_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9758,7 +9848,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_cvtw_d(fp32, cpu_env, fp64);
+            if (ctx->nan2008) {
+                gen_helper_float_cvt_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9770,7 +9864,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_cvtl_d(fp0, cpu_env, fp0);
+            if (ctx->nan2008) {
+                gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -19775,6 +19873,8 @@ void gen_intermediate_code(CPUMIPSState *env, str=
uct TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp =3D (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp =3D (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.nan2008 =3D (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
+    ctx.abs2008 =3D (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
         ctx.mem_idx =3D MIPS_HFLAG_UM;
@@ -20129,7 +20229,11 @@ void cpu_state_reset(CPUMIPSState *env)
     env->CP0_PageGrain =3D env->cpu_model->CP0_PageGrain;
     env->active_fpu.fcr0 =3D env->cpu_model->CP1_fcr0;
     env->active_fpu.fcr31 =3D env->cpu_model->CP1_fcr31;
-    set_snan_bit_is_one(1, &env->active_fpu.fp_status);
+    if ((env->active_fpu.fcr31 >> FCR31_NAN2008) & 1) {
+        set_snan_bit_is_one(0, &env->active_fpu.fp_status);
+    } else {
+        set_snan_bit_is_one(1, &env->active_fpu.fp_status);
+    }
     env->msair =3D env->cpu_model->MSAIR;
     env->insn_flags =3D env->cpu_model->insn_flags;
=20
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index c650dd0..a2404c6 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -273,6 +273,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3678FF1F,
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 32,
         .PABITS =3D 32,
         .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16,
@@ -303,6 +304,7 @@ static const mips_def_t mips_defs[] =3D
                     (0xff << CP0TCSt_TASID),
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
+        .CP1_fcr31 =3D 0,
         .CP0_SRSCtl =3D (0xf << CP0SRSCtl_HSS),
         .CP0_SRSConf0_rw_bitmask =3D 0x3fffffff,
         .CP0_SRSConf0 =3D (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) =
|
@@ -343,6 +345,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3778FF1F,
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
                     (1 << FCR0_D) | (1 << FCR0_S) | (0x93 << FCR0_PRID),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 32,
         .PABITS =3D 32,
         .insn_flags =3D CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_DSPR2,
@@ -434,7 +437,7 @@ static const mips_def_t mips_defs[] =3D
     },
     {
         /* A generic CPU supporting MIPS32 Release 6 ISA.
-           FIXME: Support IEEE 754-2008 FP.
+           FIXME: Complete support for IEEE 754-2008 FP.
                   Eventually this should be replaced by a real CPU model=
. */
         .name =3D "mips32r6-generic",
         .CP0_PRid =3D 0x00010000,
@@ -485,6 +488,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3678FFFF,
         /* The R4000 has a full 64bit FPU but doesn't use the fcr0 bits.=
 */
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS3,
@@ -503,6 +507,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3678FFFF,
         /* The VR5432 has a full 64bit FPU but doesn't use the fcr0 bits=
. */
         .CP1_fcr0 =3D (0x54 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 32,
         .insn_flags =3D CPU_VR54XX,
@@ -548,6 +553,7 @@ static const mips_def_t mips_defs[] =3D
         /* The 5Kf has F64 / L / W but doesn't use the fcr0 bits. */
         .CP1_fcr0 =3D (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x81 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64,
@@ -575,6 +581,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x82 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64 | ASE_MIPS3D,
@@ -601,6 +608,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) =
|
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_R=
EV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64R2 | ASE_MIPS3D,
@@ -653,7 +661,7 @@ static const mips_def_t mips_defs[] =3D
     },
     {
         /* A generic CPU supporting MIPS64 Release 6 ISA.
-           FIXME: Support IEEE 754-2008 FP.
+           FIXME: Complete support for IEEE 754-2008 FP.
                   Eventually this should be replaced by a real CPU model=
. */
         .name =3D "MIPS64R6-generic",
         .CP0_PRid =3D 0x00010000,
@@ -704,6 +712,7 @@ static const mips_def_t mips_defs[] =3D
         .CCRes =3D 2,
         .CP0_Status_rw_bitmask =3D 0x35D0FFFF,
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 40,
         .insn_flags =3D CPU_LOONGSON2E,
@@ -722,6 +731,7 @@ static const mips_def_t mips_defs[] =3D
         .CCRes =3D 2,
         .CP0_Status_rw_bitmask =3D 0xF5D0FF1F,   /* Bits 7:5 not writabl=
e.  */
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 40,
         .insn_flags =3D CPU_LOONGSON2F,
@@ -749,6 +759,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) =
|
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_R=
EV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64R2 | ASE_DSP | ASE_DSPR2,
@@ -894,5 +905,5 @@ static void msa_reset(CPUMIPSState *env)
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
=20
-    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
 }
--=20
1.7.9.5


