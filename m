Received: by 10.25.208.137 with SMTP id h131csp1290755lfg;
        Mon, 16 May 2016 07:16:09 -0700 (PDT)
X-Received: by 10.140.22.203 with SMTP id 69mr29220909qgn.62.1463408169678;
        Mon, 16 May 2016 07:16:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x189si23136926qkc.224.2016.05.16.07.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JJY-0002DN-VS
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:16:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIx-0001BQ-G1
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIu-0006FS-FL
	for qemu-arm@nongnu.org; Mon, 16 May 2016 10:15:31 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33874 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JIt-0006FC-T5; Mon, 16 May 2016 10:15:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 11F4D1A4539;
	Mon, 16 May 2016 16:15:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id DD0271A452A;
	Mon, 16 May 2016 16:15:25 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:44 +0200
Message-Id: <1463407965-19733-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v6 8/9] target-mips: Add nan2008 flavor of
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
X-TUID: sIPcBpncBpfL

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

New set of helpers for handling nan2008-syle versions of instructions
<CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>, for Mips R6.

All involved instructions have float operand and integer result. Their
core functionality is implemented via invocations of appropriate SoftFloat
functions. The problematic cases are when the operand is a NaN, and also
when the operand (float) is out of the range of the result.

Here one can distinguish three cases:

CASE MIPS-A: (FCR31.NAN2008 == 1)

   1. Operand is a NaN, result should be 0;
   2. Operand is larger than INT_MAX, result should be INT_MAX;
   2. Operand is smaller than INT_MIN, result should be INT_MIN.

CASE MIPS-B: (FCR31.NAN2008 == 0)

   1. Operand is a NaN, result should be INT_MAX;
   2. Operand is larger than INT_MAX, result should be INT_MAX;
   2. Operand is smaller than INT_MIN, result should be INT_MAX.

CASE SOFTFLOAT:

   1. Operand is a NaN, result is INT_MAX;
   2. Operand is larger than INT_MAX, result is INT_MAX;
   2. Operand is smaller than INT_MIN, result is INT_MIN.

It is interesting that neither MIPS-A nor MIPS-B desired behaviors
are in this sense identical to correspondent SoftFloat behavior.

Current implementation of <CEIL|CVT|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>
implements case MIPS-B. This patch relates to case MIPS-A. For case
MIPS-A, only return value for NaN-operands should be corrected after
appropriate SoftFloat library function is called.

Related MSA instructions FTRUNC_S and FTINT_S already handle well
all cases, in the fashion similar to the code from this patch.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/helper.h    |  18 +--
 target-mips/op_helper.c | 369 +++++++++++++++++++++++++++++++++++++++++++++---
 target-mips/translate.c | 122 +++++++++++++---
 3 files changed, 461 insertions(+), 48 deletions(-)

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
 
 DEF_HELPER_3(float_addr_ps, i64, env, i64, i64)
 DEF_HELPER_3(float_mulr_ps, i64, env, i64, i64)
@@ -242,14 +238,20 @@ FOP_PROTO(mina)
 #undef FOP_PROTO
 
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
 
 #define FOP_PROTO(op)                            \
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 9e7e2e0..0d1e959 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2448,6 +2448,7 @@ void mips_cpu_unassigned_access(CPUState *cs, hwaddr addr,
 
 #define FLOAT_TWO32 make_float32(1 << 30)
 #define FLOAT_TWO64 make_float64(1ULL << 62)
+
 #define FP_TO_INT32_OVERFLOW 0x7fffffff
 #define FP_TO_INT64_OVERFLOW 0x7fffffffffffffffULL
 
@@ -2683,7 +2684,7 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uint64_t dt0)
     return fdt2;
 }
 
-uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
 
@@ -2696,7 +2697,7 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, uint64_t fdt0)
     return dt2;
 }
 
-uint64_t helper_float_cvtl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
 
@@ -2791,7 +2792,7 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, uint32_t wth0)
     return wt2;
 }
 
-uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
@@ -2804,7 +2805,7 @@ uint32_t helper_float_cvtw_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
-uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
@@ -2817,7 +2818,7 @@ uint32_t helper_float_cvtw_d(CPUMIPSState *env, uint64_t fdt0)
     return wt2;
 }
 
-uint64_t helper_float_roundl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_round_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
 
@@ -2832,7 +2833,7 @@ uint64_t helper_float_roundl_d(CPUMIPSState *env, uint64_t fdt0)
     return dt2;
 }
 
-uint64_t helper_float_roundl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_round_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
 
@@ -2847,7 +2848,7 @@ uint64_t helper_float_roundl_s(CPUMIPSState *env, uint32_t fst0)
     return dt2;
 }
 
-uint32_t helper_float_roundw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_round_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
@@ -2862,7 +2863,7 @@ uint32_t helper_float_roundw_d(CPUMIPSState *env, uint64_t fdt0)
     return wt2;
 }
 
-uint32_t helper_float_roundw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_round_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
@@ -2877,7 +2878,7 @@ uint32_t helper_float_roundw_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
-uint64_t helper_float_truncl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_trunc_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
 
@@ -2890,7 +2891,7 @@ uint64_t helper_float_truncl_d(CPUMIPSState *env, uint64_t fdt0)
     return dt2;
 }
 
-uint64_t helper_float_truncl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_trunc_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
 
@@ -2903,7 +2904,7 @@ uint64_t helper_float_truncl_s(CPUMIPSState *env, uint32_t fst0)
     return dt2;
 }
 
-uint32_t helper_float_truncw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_trunc_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
@@ -2916,7 +2917,7 @@ uint32_t helper_float_truncw_d(CPUMIPSState *env, uint64_t fdt0)
     return wt2;
 }
 
-uint32_t helper_float_truncw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_trunc_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
@@ -2929,7 +2930,7 @@ uint32_t helper_float_truncw_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
-uint64_t helper_float_ceill_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_ceil_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
 
@@ -2944,7 +2945,7 @@ uint64_t helper_float_ceill_d(CPUMIPSState *env, uint64_t fdt0)
     return dt2;
 }
 
-uint64_t helper_float_ceill_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_ceil_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
 
@@ -2959,7 +2960,7 @@ uint64_t helper_float_ceill_s(CPUMIPSState *env, uint32_t fst0)
     return dt2;
 }
 
-uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_ceil_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
@@ -2974,7 +2975,7 @@ uint32_t helper_float_ceilw_d(CPUMIPSState *env, uint64_t fdt0)
     return wt2;
 }
 
-uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_ceil_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
@@ -2989,7 +2990,7 @@ uint32_t helper_float_ceilw_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
-uint64_t helper_float_floorl_d(CPUMIPSState *env, uint64_t fdt0)
+uint64_t helper_float_floor_l_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint64_t dt2;
 
@@ -3004,7 +3005,7 @@ uint64_t helper_float_floorl_d(CPUMIPSState *env, uint64_t fdt0)
     return dt2;
 }
 
-uint64_t helper_float_floorl_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_floor_l_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint64_t dt2;
 
@@ -3019,7 +3020,7 @@ uint64_t helper_float_floorl_s(CPUMIPSState *env, uint32_t fst0)
     return dt2;
 }
 
-uint32_t helper_float_floorw_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_floor_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
@@ -3034,7 +3035,7 @@ uint32_t helper_float_floorw_d(CPUMIPSState *env, uint64_t fdt0)
     return wt2;
 }
 
-uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
+uint32_t helper_float_floor_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
@@ -3049,6 +3050,334 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
+uint64_t helper_float_cvt_2008_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 = 0;
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
+    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 = 0;
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
+    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 = 0;
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
+    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 = 0;
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
+    set_float_rounding_mode(float_round_nearest_even,
+            &env->active_fpu.fp_status);
+    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 = 0;
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
+    set_float_rounding_mode(float_round_nearest_even,
+            &env->active_fpu.fp_status);
+    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 = 0;
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
+    set_float_rounding_mode(float_round_nearest_even,
+            &env->active_fpu.fp_status);
+    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 = 0;
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
+    set_float_rounding_mode(float_round_nearest_even,
+            &env->active_fpu.fp_status);
+    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 = 0;
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
+    dt2 = float64_to_int64_round_to_zero(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 = 0;
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
+    dt2 = float32_to_int64_round_to_zero(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 = 0;
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
+    wt2 = float64_to_int32_round_to_zero(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 = 0;
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
+    wt2 = float32_to_int32_round_to_zero(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 = 0;
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
+    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 = 0;
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
+    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 = 0;
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
+    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 = 0;
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
+    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 = 0;
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
+    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            dt2 = 0;
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
+    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            dt2 = 0;
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
+    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float64_is_any_nan(fdt0)) {
+            wt2 = 0;
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
+    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
+    restore_rounding_mode(env);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+            & float_flag_invalid) {
+        if (float32_is_any_nan(fst0)) {
+            wt2 = 0;
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
index 3b6b3b5..52fc2bb 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -1434,6 +1434,7 @@ typedef struct DisasContext {
     bool vp;
     bool cmgcr;
     bool mrp;
+    bool nan2008;
     bool abs2008;
 } DisasContext;
 
@@ -8919,7 +8920,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -8932,7 +8937,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -8945,7 +8954,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -8958,7 +8971,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -8969,7 +8986,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
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
@@ -8979,7 +9000,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
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
@@ -8989,7 +9014,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
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
@@ -8999,7 +9028,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
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
@@ -9248,7 +9281,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i32 fp0 = tcg_temp_new_i32();
 
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
@@ -9260,7 +9297,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9418,7 +9459,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
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
@@ -9429,7 +9474,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
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
@@ -9440,7 +9489,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
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
@@ -9451,7 +9504,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
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
@@ -9463,7 +9520,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9476,7 +9537,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9489,7 +9554,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9502,7 +9571,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9775,7 +9848,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp64 = tcg_temp_new_i64();
 
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
@@ -9787,7 +9864,11 @@ static void gen_farith (DisasContext *ctx, enum fopcode op1,
             TCGv_i64 fp0 = tcg_temp_new_i64();
 
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
@@ -19792,6 +19873,7 @@ void gen_intermediate_code(CPUMIPSState *env, struct TranslationBlock *tb)
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
     ctx.vp = (env->CP0_Config5 >> CP0C5_VP) & 1;
     ctx.mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx.nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx.abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     restore_cpu_state(env, &ctx);
 #ifdef CONFIG_USER_ONLY
-- 
1.9.1

