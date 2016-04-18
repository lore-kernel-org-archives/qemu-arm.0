Received: by 10.25.208.194 with SMTP id h185csp1476794lfg;
        Mon, 18 Apr 2016 10:33:10 -0700 (PDT)
X-Received: by 10.141.42.71 with SMTP id t68mr10834012qhe.102.1461000790401;
        Mon, 18 Apr 2016 10:33:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u9si4291419qke.47.2016.04.18.10.33.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 10:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asD2r-0004JJ-Sk
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 13:33:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1asD2l-0004BP-Pe
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 13:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>) id 1asD2i-0007X6-H0
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 13:33:03 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:15895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aleksandar.Markovic@imgtec.com>)
	id 1asD2i-0007Rl-4b; Mon, 18 Apr 2016 13:33:00 -0400
Received: from hhmail02.hh.imgtec.org (unknown [10.100.10.20])
	by Websense Email with ESMTPS id B51596B7F7BD6;
	Mon, 18 Apr 2016 18:32:52 +0100 (IST)
Received: from BAMAIL02.ba.imgtec.org (10.20.40.28) by hhmail02.hh.imgtec.org
	(10.100.10.20) with Microsoft SMTP Server (TLS) id 14.3.266.1;
	Mon, 18 Apr 2016 18:32:56 +0100
Received: from BADAG02.ba.imgtec.org ([fe80::612d:e977:c603:32d6]) by
	bamail02.ba.imgtec.org ([::1]) with mapi id 14.03.0266.001;
	Mon, 18 Apr 2016 10:32:52 -0700
From: Aleksandar Markovic <Aleksandar.Markovic@imgtec.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH v5 7/9] target-mips: Add nan2008 flavor of
	<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
Thread-Index: AQHRmYvss6kqxyQ4FEGR0OIoAsR62p+P/KPA
Date: Mon, 18 Apr 2016 17:32:51 +0000
Message-ID: <EF5FA6C3467F85449672C3E735957B859169B822@BADAG02.ba.imgtec.org>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>,
	<1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>
In-Reply-To: <1460995422-14373-8-git-send-email-aleksandar.markovic@rt-rk.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [82.117.201.26]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-arm] [PATCH v5 7/9] target-mips: Add nan2008 flavor of
 <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"proljc@gmail.com" <proljc@gmail.com>,
	"kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
	"mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
	"agraf@suse.de" <agraf@suse.de>,
	Maciej Rozycki <Maciej.Rozycki@imgtec.com>,
	Petar Jovanovic <Petar.Jovanovic@imgtec.com>,
	"blauwirbel@gmail.com" <blauwirbel@gmail.com>,
	"jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
	Miodrag Dinic <Miodrag.Dinic@imgtec.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>,
	Leon Alrae <Leon.Alrae@imgtec.com>, "afaerber@suse.de" <afaerber@suse.de>,
	"aurelien@aurel32.net" <aurelien@aurel32.net>,
	"rth@twiddle.net" <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RVXKIcBNBmx4

There was a small error in the version of this patch 7/9 sent an hour ago.
Please apply this corrected version.=20

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

New set of helpers for handling nan2008-syle versions of instructions
<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>, for Mips R6.

All involved instructions have float operand and integer result. Their
core functionality is implemented via invocations of appropriate SoftFloat
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

[1] "MIPS=AE Architecture For Programmers Volume II-A:
    The MIPS64=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015

[2] "MIPS=AE Architecture For Programmers Volume II-A:
    The MIPS64=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 5.04, December 11, 2013

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/helper.h    |  18 +--
 target-mips/op_helper.c | 365 ++++++++++++++++++++++++++++++++++++++++++++=
+---
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
index 230aa94..bcc9201 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2448,6 +2448,7 @@ void mips_cpu_unassigned_access(CPUState *cs, hwaddr =
addr,
=20
 #define FLOAT_TWO32 make_float32(1 << 30)
 #define FLOAT_TWO64 make_float64(1ULL << 62)
+
 #define FP_TO_INT32_OVERFLOW 0x7fffffff
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
=20
@@ -2683,7 +2684,7 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uint6=
4_t dt0)
     return fdt2;
 }
=20
-uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2696,7 +2697,7 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint6=
4_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_cvtl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2791,7 +2792,7 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, uint=
32_t wth0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2804,7 +2805,7 @@ uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint3=
2_t fst0)
     return wt2;
 }
=20
-uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2817,7 +2818,7 @@ uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint6=
4_t fdt0)
     return wt2;
 }
=20
-uint64_t helper_float_roundl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_round_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2832,7 +2833,7 @@ uint64_t helper_float_roundl_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_roundl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_round_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2847,7 +2848,7 @@ uint64_t helper_float_roundl_s(CPUMIPSState *env, uin=
t32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_roundw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_round_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2862,7 +2863,7 @@ uint32_t helper_float_roundw_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_roundw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_round_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2877,7 +2878,7 @@ uint32_t helper_float_roundw_s(CPUMIPSState *env, uin=
t32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_truncl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_trunc_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2890,7 +2891,7 @@ uint64_t helper_float_truncl_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_truncl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_trunc_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2903,7 +2904,7 @@ uint64_t helper_float_truncl_s(CPUMIPSState *env, uin=
t32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_truncw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_trunc_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2916,7 +2917,7 @@ uint32_t helper_float_truncw_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_truncw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_trunc_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2929,7 +2930,7 @@ uint32_t helper_float_truncw_s(CPUMIPSState *env, uin=
t32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_ceill_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_ceil_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -2944,7 +2945,7 @@ uint64_t helper_float_ceill_d(CPUMIPSState *env, uint=
64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_ceill_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_ceil_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -2959,7 +2960,7 @@ uint64_t helper_float_ceill_s(CPUMIPSState *env, uint=
32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_ceil_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -2974,7 +2975,7 @@ uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint=
64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_ceil_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -2989,7 +2990,7 @@ uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint=
32_t fst0)
     return wt2;
 }
=20
-uint64_t helper_float_floorl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_floor_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
=20
@@ -3004,7 +3005,7 @@ uint64_t helper_float_floorl_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return dt2;
 }
=20
-uint64_t helper_float_floorl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_floor_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
=20
@@ -3019,7 +3020,7 @@ uint64_t helper_float_floorl_s(CPUMIPSState *env, uin=
t32_t fst0)
     return dt2;
 }
=20
-uint32_t helper_float_floorw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_floor_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
=20
@@ -3034,7 +3035,7 @@ uint32_t helper_float_floorw_d(CPUMIPSState *env, uin=
t64_t fdt0)
     return wt2;
 }
=20
-uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_floor_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
=20
@@ -3049,6 +3050,330 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env, u=
int32_t fst0)
     return wt2;
 }
=20
+uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.fp_=
status);
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.fp_=
status);
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.fp_=
status);
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.fp_=
status);
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    dt2 =3D float64_to_int64_round_to_zero(fdt0, &env->active_fpu.fp_statu=
s);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    dt2 =3D float32_to_int64_round_to_zero(fst0, &env->active_fpu.fp_statu=
s);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    wt2 =3D float64_to_int32_round_to_zero(fdt0, &env->active_fpu.fp_statu=
s);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    wt2 =3D float32_to_int32_round_to_zero(fst0, &env->active_fpu.fp_statu=
s);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
+    set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status);
+    wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & (float_flag_invalid)) {
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
@@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8932,7 +8937,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8945,7 +8954,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8958,7 +8971,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8969,7 +8986,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8979,7 +9000,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8989,7 +9014,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -8999,7 +9028,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9248,7 +9281,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9260,7 +9297,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9418,7 +9459,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9429,7 +9474,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9440,7 +9489,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9451,7 +9504,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9463,7 +9520,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9476,7 +9537,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9489,7 +9554,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9502,7 +9571,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9775,7 +9848,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -9787,7 +9864,11 @@ static void gen_farith (DisasContext *ctx, enum fopc=
ode op1,
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
@@ -19792,6 +19873,7 @@ void gen_intermediate_code(CPUMIPSState *env, struc=
t TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp =3D (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp =3D (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.nan2008 =3D (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx.abs2008 =3D (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
--=20
1.9.1
