Received: by 10.25.208.194 with SMTP id h185csp1435951lfg;
        Mon, 18 Apr 2016 09:06:14 -0700 (PDT)
X-Received: by 10.55.76.15 with SMTP id z15mr46430538qka.32.1460995574885;
        Mon, 18 Apr 2016 09:06:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g17si47587905qhc.119.2016.04.18.09.06.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:06:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBgj-0000DU-W5
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:06:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBex-0005or-IA
	for qemu-devel@nongnu.org; Mon, 18 Apr 2016 12:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBet-0005bQ-Pq
	for qemu-devel@nongnu.org; Mon, 18 Apr 2016 12:04:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54503 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBem-0005Xo-Fu; Mon, 18 Apr 2016 12:04:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 3C4D61A48D9;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 0B6CC1A4611;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:40 +0200
Message-Id: <1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v5 7/9] target-mips: Add nan2008 flavor of
 <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, proljc@gmail.com, kbastian@mail.uni-paderborn.de,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	maciej.rozycki@imgtec.com, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	aleksandar.markovic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, edgar.iglesias@gmail.com,
	miodrag.dinic@imgtec.com, pbonzini@redhat.com,
	gxt@mprc.pku.edu.cn, leon.alrae@imgtec.com, afaerber@suse.de,
	aurelien@aurel32.net, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YijfNm5tLEBM

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

New set of helpers for handling nan2008-syle versions of instructions
<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>, for Mips R6.

All involved instructions have float operand and integer result. Their
core functionality is implemented via invocations of appropriate SoftFloa=
t
functions. The problematic cases are when the operand is a NaN, and also
when the operand (float) is out of the range of the result.

Here one can distinguish three cases:

CASE MIPS-A: (MIPS64R6, FCR31.NAN2008 =3D=3D 1)

   1. Operand is a NaN, result should be 0;
   2. Operand is larger than INT_MAX, result should be INT_MAX;
   2. Operand is smaller than INT_MIN, result should be INT_MIN.

CASE MIPS-B: (MIPS64R6, FCR31.NAN2008 =3D=3D 0), (MIPS64R5)

   1. Operand is a NaN, result should be INT_MAX;
   2. Operand is larger than INT_MAX, result should be INT_MAX;
   2. Operand is smaller than INT_MIN, result should be INT_MAX.

CASE SOFTFLOAT:

   1. Operand is a NaN, result is INT_MAX;
   2. Operand is larger than INT_MAX, result is INT_MAX;
   2. Operand is smaller than INT_MIN, result is INT_MIN.

It is interesting that neither R6 nor R5 desired behaviors are in this
sense identical to correspondent SoftFloat behavior.

Current implementation of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
implements CASEMIPS-B. This patch relates to CASE-A. For CASE-A,
only return value for NaN-operands should be corrected, after
appropriate SoftFloat library function is called.

Related MSA instructions FTRUNC_S and FTINT_S already handle well
all cases, in the fashion similar to the code from this patch.

Details on <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D> instructions
can be found in [1] p. 129, 130, 149, 155, 222, 223, 393, 394, 504, 505,
(for R6) and [2] (for R5).

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 5.04, December 11, 2013

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/helper.h    |  18 +--
 target-mips/op_helper.c | 365 ++++++++++++++++++++++++++++++++++++++++++=
+++---
 target-mips/translate.c | 122 +++++++++++++---
 3 files changed, 457 insertions(+), 48 deletions(-)

diff --git a/target-mips/helper.h b/target-mips/helper.h
index 8546177..666936c 100644
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
index 230aa94..7fecde7 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2448,6 +2448,7 @@ void mips_cpu_unassigned_access(CPUState *cs, hwadd=
r addr,
=20
 #define FLOAT_TWO32 make_float32(1 << 30)
 #define FLOAT_TWO64 make_float64(1ULL << 62)
+
 #define FP_TO_INT32_OVERFLOW 0x7fffffff
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
=20
@@ -2683,7 +2684,7 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uin=
t64_t dt0)
     return fdt2;
 }
=20
-uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2696,7 +2697,7 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_cvtl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2791,7 +2792,7 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, ui=
nt32_t wth0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2804,7 +2805,7 @@ uint32_t helper_float_cvtw_s(CPUMIPSState *env, uin=
t32_t fst0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2817,7 +2818,7 @@ uint32_t helper_float_cvtw_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return wt2;
 }
=20
-uint64_t helper_float_roundl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_round_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2832,7 +2833,7 @@ uint64_t helper_float_roundl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_roundl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_round_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2847,7 +2848,7 @@ uint64_t helper_float_roundl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_roundw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_round_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2862,7 +2863,7 @@ uint32_t helper_float_roundw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_roundw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_round_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2877,7 +2878,7 @@ uint32_t helper_float_roundw_s(CPUMIPSState *env, u=
int32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_truncl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_trunc_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2890,7 +2891,7 @@ uint64_t helper_float_truncl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_truncl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_trunc_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2903,7 +2904,7 @@ uint64_t helper_float_truncl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_truncw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_trunc_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2916,7 +2917,7 @@ uint32_t helper_float_truncw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_truncw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_trunc_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2929,7 +2930,7 @@ uint32_t helper_float_truncw_s(CPUMIPSState *env, u=
int32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_ceill_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_ceil_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2944,7 +2945,7 @@ uint64_t helper_float_ceill_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_ceill_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_ceil_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2959,7 +2960,7 @@ uint64_t helper_float_ceill_s(CPUMIPSState *env, ui=
nt32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_ceil_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2974,7 +2975,7 @@ uint32_t helper_float_ceilw_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_ceil_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2989,7 +2990,7 @@ uint32_t helper_float_ceilw_s(CPUMIPSState *env, ui=
nt32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_floorl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_floor_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -3004,7 +3005,7 @@ uint64_t helper_float_floorl_d(CPUMIPSState *env, u=
int64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_floorl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_floor_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -3019,7 +3020,7 @@ uint64_t helper_float_floorl_s(CPUMIPSState *env, u=
int32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_floorw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_floor_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -3034,7 +3035,7 @@ uint32_t helper_float_floorw_d(CPUMIPSState *env, u=
int64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_floor_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -3049,6 +3050,330 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env,=
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 =3D 0;
+        }
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
+            & (float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 =3D 0;
+        }
+    }
+    update_fcr31(env, GETPC());
+    return wt2;
+}
+
 /* unary operations, not modifying fp status  */
 #define FLOAT_UNOP(name)                                       \
 uint64_t helper_float_ ## name ## _d(uint64_t fdt0)                \
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 3b6b3b5..b7ab98a 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1435,6 +1435,7 @@ typedef struct DisasContext {
     bool cmgcr;
     bool mrp;
     bool abs2008;
+    bool nan2008;
 } DisasContext;
=20
 enum {
@@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_roundl_s(fp64, cpu_env, fp32);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_round_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_round_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8932,7 +8937,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_truncl_s(fp64, cpu_env, fp32);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_trunc_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_trunc_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8945,7 +8954,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_ceill_s(fp64, cpu_env, fp32);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_ceil_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_ceil_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8958,7 +8971,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_floorl_s(fp64, cpu_env, fp32);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_floor_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_floor_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -8969,7 +8986,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_roundw_s(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_round_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_round_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8979,7 +9000,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_truncw_s(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_trunc_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_trunc_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8989,7 +9014,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_ceilw_s(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_ceil_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_ceil_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8999,7 +9028,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_floorw_s(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_floor_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_floor_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9248,7 +9281,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_cvtw_s(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_w_s(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_cvt_w_s(fp0, cpu_env, fp0);
+            }
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9260,7 +9297,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr32(ctx, fp32, fs);
-            gen_helper_float_cvtl_s(fp64, cpu_env, fp32);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_l_s(fp64, cpu_env, fp32);
+            } else {
+                gen_helper_float_cvt_l_s(fp64, cpu_env, fp32);
+            }
             tcg_temp_free_i32(fp32);
             gen_store_fpr64(ctx, fp64, fd);
             tcg_temp_free_i64(fp64);
@@ -9418,7 +9459,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_roundl_d(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_round_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_round_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9429,7 +9474,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_truncl_d(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_trunc_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_trunc_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9440,7 +9489,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_ceill_d(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_ceil_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_ceil_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9451,7 +9504,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_floorl_d(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_floor_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_floor_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9463,7 +9520,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_roundw_d(fp32, cpu_env, fp64);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_round_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_round_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9476,7 +9537,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_truncw_d(fp32, cpu_env, fp64);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_trunc_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_trunc_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9489,7 +9554,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_ceilw_d(fp32, cpu_env, fp64);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_ceil_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_ceil_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9502,7 +9571,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_floorw_d(fp32, cpu_env, fp64);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_floor_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_floor_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9775,7 +9848,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp64 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp64, fs);
-            gen_helper_float_cvtw_d(fp32, cpu_env, fp64);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_w_d(fp32, cpu_env, fp64);
+            } else {
+                gen_helper_float_cvt_w_d(fp32, cpu_env, fp64);
+            }
             tcg_temp_free_i64(fp64);
             gen_store_fpr32(ctx, fp32, fd);
             tcg_temp_free_i32(fp32);
@@ -9787,7 +9864,11 @@ static void gen_farith (DisasContext *ctx, enum fo=
pcode op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_cvtl_d(fp0, cpu_env, fp0);
+            if ((ctx->insn_flags & ISA_MIPS32R6) && (ctx->nan2008)) {
+                gen_helper_float_cvt_2008_l_d(fp0, cpu_env, fp0);
+            } else {
+                gen_helper_float_cvt_l_d(fp0, cpu_env, fp0);
+            }
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -19792,6 +19873,7 @@ void gen_intermediate_code(CPUMIPSState *env, str=
uct TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp =3D (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp =3D (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.nan2008 =3D (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx.abs2008 =3D (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
--=20
1.9.1

