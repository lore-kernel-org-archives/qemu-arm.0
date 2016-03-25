Received: by 10.25.208.211 with SMTP id h202csp205981lfg;
        Fri, 25 Mar 2016 07:14:47 -0700 (PDT)
X-Received: by 10.55.74.14 with SMTP id x14mr17832189qka.70.1458915286430;
        Fri, 25 Mar 2016 07:14:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l34si10880103qgf.84.2016.03.25.07.14.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 25 Mar 2016 07:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ajSVh-0005a9-P7
	for alex.bennee@linaro.org; Fri, 25 Mar 2016 10:14:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1ajRCa-0000rx-3J
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 08:51:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1ajRCV-0006cn-FX
	for qemu-arm@nongnu.org; Fri, 25 Mar 2016 08:50:56 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52320 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1ajRCU-0006aM-Pe; Fri, 25 Mar 2016 08:50:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 769451A46B5;
	Fri, 25 Mar 2016 13:50:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 4789F1A23CB;
	Fri, 25 Mar 2016 13:50:25 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 25 Mar 2016 13:50:14 +0100
Message-Id: <1458910214-12239-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1458910214-12239-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
X-Mailman-Approved-At: Fri, 25 Mar 2016 10:14:43 -0400
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, proljc@gmail.com,
	mark.cave-ayland@ilande.co.uk, agraf@suse.de,
	kbastian@mail.uni-paderborn.de, petar.jovanovic@imgtec.com,
	blauwirbel@gmail.com, jcmvbkbc@gmail.com,
	miodrag.dinic@imgtec.com, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, pbonzini@redhat.com, gxt@mprc.pku.edu.cn,
	leon.alrae@imgtec.com, afaerber@suse.de, aurelien@aurel32.net,
	rth@twiddle.net
Subject: [Qemu-arm] [PATCH 2/2] target-mips: Implement IEEE 754-2008
	functionality for R6 and MSA instructions
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
X-TUID: 9MfxpyfaVtnC

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch utilizes provisions from the previous patch, and configures
Mips R6 CPUs and Mips MSA units appropriately with reference to the meani=
ng
of the signaling NaN bit (this is mentioned in point 3 in the list below)=
.
The majority of involved MIPS instructions will be fixed just with that
change. Certain number of other IEEE 754-2008 standard-related MIPS issue=
s
are addreessed with this patch as well.

The changes can be summarized this way:

1) Definitions of Mips processors are updated to reflect supported
   IEEE-754-2008-related features. (file target-mips/translate_init.c)

2) Functions fpu_init() and msa_reset() are updated so that flag
   snan_bit_is_one is properly set for any Mips configuration.
   (file target-mips/translate_init.c)

3) Helpers helper_float_abs_<fmt>() and helper_float_chs_<fmt>() are
   rewritten to reflect new behavior of instructions ABS.fmt and NEG.fmt
   in MIPS Release 6. Affected MIPS instructions are:

   ABS.S
   ABS.D
   NEG.S
   NEG.D

   Note that legacy (pre-R6) ABS and NEG instructions are arithmetic
   (any NaN operand signals invalid operation), while R6 ones are
   non-arithmetic, always changing the sign bit, even for NaN-like operan=
ds.

   Details on these instructions are documented in [1] p. 35 and 359.

   Affected files are target-mips/helper.h and target-mips/op_helper.c.

4) Helpers helper_float_ceilxxx(), helper_float_cvtxxx(),
   helper_float_floorxxx(), helper_float_roundxxx(), and
   helper_float_truncxxx() are rewritten to reflect the behavior of
   relevant instructions if its operands are floating numbers out of
   the range of the integer destination.

   Affected MIPS instructions are:

   CEIL.L.fmt
   CEIL.W.fmt
   CVT.L.fmt
   CVT.W.fmt
   FLOOR.L.fmt
   FLOOR.W.fmt
   ROUND.L.fmt
   ROUND.W.fmt
   TRUNC.L.fmt
   TRUNC.W.fmt

   Details on these instructions are presented in [1] p. 129, 130, 149,
   155, 222, 223, 393, 394, 504, 505.

   Affected files are target-mips/helper.h and target-mips/translate.c.

5) Helpers helper_msa_class_s() and helper_msa_class_d() added so that
   MSA version of instruction CLASS can operate independently of the one
   from the base set of instructions. Affected MIPS instructions are:

   FCLASS.W
   FCLASS.D

   Details on these instructions can be found in [2] p. 158.

   Affected source code files are target-mips/helper.h and
   target-mips/msa_helper.c.

6) Handling og instructions CVT.S.PU and CVT.S.PL is updated to reflect
   the fact that they are removed in Mips R6 architecture and belong to
   so-called paired-single class of instructions. Details on these
   instructions can be found in [1], p. 152 and 153. Affected source
   code file is target-mips/translate.c.

[1] "MIPS=C2=AE Architecture For Programmers Volume II-A:
    The MIPS64=C2=AE Instruction Set Reference Manual",
    Imagination Technologies LTD, Revision 6.04, November 13, 2015
    (https://imagination-technologies-cloudfront-assets.s3.amazonaws.com/
     documentation/MD00087-2B-MIPS64BIS-AFP-06.04.pdf)

[2] "MIPS Architecture for Programmers Volume IV-j:
    The MIPS32=C2=AE SIMD Architecture Module",
    Imagination Technologies LTD, Revision 1.12, February 3, 2016
    (https://imagination-technologies-cloudfront-assets.s3.amazonaws.com/
     documentation/MD00866-2B-MSA32-AFP-01.12.pdf)

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/helper.h         |  10 +-
 target-mips/msa_helper.c     |  60 ++++-
 target-mips/op_helper.c      | 516 ++++++++++++++++++++++++++++++++++++-=
------
 target-mips/translate.c      |  16 +-
 target-mips/translate_init.c |  22 +-
 5 files changed, 520 insertions(+), 104 deletions(-)

diff --git a/target-mips/helper.h b/target-mips/helper.h
index 1aaa316..952af63 100644
--- a/target-mips/helper.h
+++ b/target-mips/helper.h
@@ -254,10 +254,10 @@ FOP_PROTO(recip)
 FOP_PROTO(rint)
 #undef FOP_PROTO
=20
-#define FOP_PROTO(op)                       \
-DEF_HELPER_1(float_ ## op ## _s, i32, i32)  \
-DEF_HELPER_1(float_ ## op ## _d, i64, i64)  \
-DEF_HELPER_1(float_ ## op ## _ps, i64, i64)
+#define FOP_PROTO(op)                            \
+DEF_HELPER_2(float_ ## op ## _s, i32, env, i32)  \
+DEF_HELPER_2(float_ ## op ## _d, i64, env, i64)  \
+DEF_HELPER_2(float_ ## op ## _ps, i64, env, i64)
 FOP_PROTO(abs)
 FOP_PROTO(chs)
 #undef FOP_PROTO
@@ -924,6 +924,8 @@ DEF_HELPER_4(msa_pcnt_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_nloc_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_nlzc_df, void, env, i32, i32, i32)
=20
+DEF_HELPER_2(msa_class_s, i32, env, i32)
+DEF_HELPER_2(msa_class_d, i64, env, i64)
 DEF_HELPER_4(msa_fclass_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ftrunc_s_df, void, env, i32, i32, i32)
 DEF_HELPER_4(msa_ftrunc_u_df, void, env, i32, i32, i32)
diff --git a/target-mips/msa_helper.c b/target-mips/msa_helper.c
index 47fbba0..fed430d 100644
--- a/target-mips/msa_helper.c
+++ b/target-mips/msa_helper.c
@@ -2924,19 +2924,67 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint=
32_t df, uint32_t wd,
     msa_move_v(pwd, pwx);
 }
=20
+#define MSA_CLASS_SIGNALING_NAN      0x001
+#define MSA_CLASS_QUIET_NAN          0x002
+#define MSA_CLASS_NEGATIVE_INFINITY  0x004
+#define MSA_CLASS_NEGATIVE_NORMAL    0x008
+#define MSA_CLASS_NEGATIVE_SUBNORMAL 0x010
+#define MSA_CLASS_NEGATIVE_ZERO      0x020
+#define MSA_CLASS_POSITIVE_INFINITY  0x040
+#define MSA_CLASS_POSITIVE_NORMAL    0x080
+#define MSA_CLASS_POSITIVE_SUBNORMAL 0x100
+#define MSA_CLASS_POSITIVE_ZERO      0x200
+
+#define MSA_CLASS(name, bits)                                        \
+uint ## bits ## _t helper_msa_ ## name (CPUMIPSState *env,           \
+                                        uint ## bits ## _t arg)      \
+{                                                                    \
+    if (float ## bits ## _is_signaling_nan(arg,                      \
+                &env->active_tc.msa_fp_status)) {                    \
+        return MSA_CLASS_SIGNALING_NAN;                              \
+    } else if (float ## bits ## _is_quiet_nan(arg,                   \
+                    &env->active_tc.msa_fp_status)) {                \
+        return MSA_CLASS_QUIET_NAN;                                  \
+    } else if (float ## bits ## _is_neg(arg)) {                      \
+        if (float ## bits ## _is_infinity(arg)) {                    \
+            return MSA_CLASS_NEGATIVE_INFINITY;                      \
+        } else if (float ## bits ## _is_zero(arg)) {                 \
+            return MSA_CLASS_NEGATIVE_ZERO;                          \
+        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
+            return MSA_CLASS_NEGATIVE_SUBNORMAL;                     \
+        } else {                                                     \
+            return MSA_CLASS_NEGATIVE_NORMAL;                        \
+        }                                                            \
+    } else {                                                         \
+        if (float ## bits ## _is_infinity(arg)) {                    \
+            return MSA_CLASS_POSITIVE_INFINITY;                      \
+        } else if (float ## bits ## _is_zero(arg)) {                 \
+            return MSA_CLASS_POSITIVE_ZERO;                          \
+        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
+            return MSA_CLASS_POSITIVE_SUBNORMAL;                     \
+        } else {                                                     \
+            return MSA_CLASS_POSITIVE_NORMAL;                        \
+        }                                                            \
+    }                                                                \
+}
+
+MSA_CLASS(class_s, 32)
+MSA_CLASS(class_d, 64)
+#undef FLOAT_MSA_CLASS
+
 void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
         uint32_t wd, uint32_t ws)
 {
     wr_t *pwd =3D &(env->active_fpu.fpr[wd].wr);
     wr_t *pws =3D &(env->active_fpu.fpr[ws].wr);
     if (df =3D=3D DF_WORD) {
-        pwd->w[0] =3D helper_float_class_s(env, pws->w[0]);
-        pwd->w[1] =3D helper_float_class_s(env, pws->w[1]);
-        pwd->w[2] =3D helper_float_class_s(env, pws->w[2]);
-        pwd->w[3] =3D helper_float_class_s(env, pws->w[3]);
+        pwd->w[0] =3D helper_msa_class_s(env, pws->w[0]);
+        pwd->w[1] =3D helper_msa_class_s(env, pws->w[1]);
+        pwd->w[2] =3D helper_msa_class_s(env, pws->w[2]);
+        pwd->w[3] =3D helper_msa_class_s(env, pws->w[3]);
     } else {
-        pwd->d[0] =3D helper_float_class_d(env, pws->d[0]);
-        pwd->d[1] =3D helper_float_class_d(env, pws->d[1]);
+        pwd->d[0] =3D helper_msa_class_d(env, pws->d[0]);
+        pwd->d[1] =3D helper_msa_class_d(env, pws->d[1]);
     }
 }
=20
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 0d22b25..407d5e0 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2621,9 +2621,23 @@ uint64_t helper_float_cvtl_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     uint64_t dt2;
=20
     dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                dt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2634,14 +2648,29 @@ uint64_t helper_float_cvtl_s(CPUMIPSState *env, u=
int32_t fst0)
     uint64_t dt2;
=20
     dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                dt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
 }
=20
+
 uint64_t helper_float_cvtps_pw(CPUMIPSState *env, uint64_t dt0)
 {
     uint32_t fst2;
@@ -2729,9 +2758,23 @@ uint32_t helper_float_cvtw_s(CPUMIPSState *env, ui=
nt32_t fst0)
     uint32_t wt2;
=20
     wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                wt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2742,9 +2785,23 @@ uint32_t helper_float_cvtw_d(CPUMIPSState *env, ui=
nt64_t fdt0)
     uint32_t wt2;
=20
     wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                wt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2757,9 +2814,23 @@ uint64_t helper_float_roundl_d(CPUMIPSState *env, =
uint64_t fdt0)
     set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
     dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                dt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2772,9 +2843,23 @@ uint64_t helper_float_roundl_s(CPUMIPSState *env, =
uint32_t fst0)
     set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
     dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                dt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2787,9 +2872,23 @@ uint32_t helper_float_roundw_d(CPUMIPSState *env, =
uint64_t fdt0)
     set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
     wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                wt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2802,9 +2901,23 @@ uint32_t helper_float_roundw_s(CPUMIPSState *env, =
uint32_t fst0)
     set_float_rounding_mode(float_round_nearest_even, &env->active_fpu.f=
p_status);
     wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                wt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2815,9 +2928,23 @@ uint64_t helper_float_truncl_d(CPUMIPSState *env, =
uint64_t fdt0)
     uint64_t dt2;
=20
     dt2 =3D float64_to_int64_round_to_zero(fdt0, &env->active_fpu.fp_sta=
tus);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                dt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2828,9 +2955,23 @@ uint64_t helper_float_truncl_s(CPUMIPSState *env, =
uint32_t fst0)
     uint64_t dt2;
=20
     dt2 =3D float32_to_int64_round_to_zero(fst0, &env->active_fpu.fp_sta=
tus);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                dt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2841,9 +2982,23 @@ uint32_t helper_float_truncw_d(CPUMIPSState *env, =
uint64_t fdt0)
     uint32_t wt2;
=20
     wt2 =3D float64_to_int32_round_to_zero(fdt0, &env->active_fpu.fp_sta=
tus);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                wt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2854,9 +3009,23 @@ uint32_t helper_float_truncw_s(CPUMIPSState *env, =
uint32_t fst0)
     uint32_t wt2;
=20
     wt2 =3D float32_to_int32_round_to_zero(fst0, &env->active_fpu.fp_sta=
tus);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                wt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2869,9 +3038,23 @@ uint64_t helper_float_ceill_d(CPUMIPSState *env, u=
int64_t fdt0)
     set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
     dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                dt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2884,9 +3067,23 @@ uint64_t helper_float_ceill_s(CPUMIPSState *env, u=
int32_t fst0)
     set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
     dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                dt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2899,9 +3096,23 @@ uint32_t helper_float_ceilw_d(CPUMIPSState *env, u=
int64_t fdt0)
     set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
     wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                wt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+               & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2914,9 +3125,23 @@ uint32_t helper_float_ceilw_s(CPUMIPSState *env, u=
int32_t fst0)
     set_float_rounding_mode(float_round_up, &env->active_fpu.fp_status);
     wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                wt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2929,9 +3154,23 @@ uint64_t helper_float_floorl_d(CPUMIPSState *env, =
uint64_t fdt0)
     set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
     dt2 =3D float64_to_int64(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                dt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2944,9 +3183,23 @@ uint64_t helper_float_floorl_s(CPUMIPSState *env, =
uint32_t fst0)
     set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
     dt2 =3D float32_to_int64(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 =3D FP_TO_INT64_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                dt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    dt2 =3D INT64_MIN;
+                else
+                    dt2 =3D INT64_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            dt2 =3D FP_TO_INT64_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return dt2;
@@ -2959,9 +3212,23 @@ uint32_t helper_float_floorw_d(CPUMIPSState *env, =
uint64_t fdt0)
     set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
     wt2 =3D float64_to_int32(fdt0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float64_is_any_nan(fdt0)) {
+                wt2 =3D 0;
+            } else {
+                if (float64_is_neg(fdt0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
@@ -2974,36 +3241,121 @@ uint32_t helper_float_floorw_s(CPUMIPSState *env=
, uint32_t fst0)
     set_float_rounding_mode(float_round_down, &env->active_fpu.fp_status=
);
     wt2 =3D float32_to_int32(fst0, &env->active_fpu.fp_status);
     restore_rounding_mode(env);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        wt2 =3D FP_TO_INT32_OVERFLOW;
+    if (env->active_fpu.fcr31 & (1 << FCR31_NAN2008)) {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            if (float32_is_any_nan(fst0)) {
+                wt2 =3D 0;
+            } else {
+                if (float32_is_neg(fst0))
+                    wt2 =3D INT32_MIN;
+                else
+                    wt2 =3D INT32_MAX;
+            }
+        }
+    } else {
+        if (get_float_exception_flags(&env->active_fpu.fp_status)
+                & (float_flag_invalid | float_flag_overflow)) {
+            wt2 =3D FP_TO_INT32_OVERFLOW;
+        }
     }
     update_fcr31(env, GETPC());
     return wt2;
 }
=20
-/* unary operations, not modifying fp status  */
-#define FLOAT_UNOP(name)                                       \
-uint64_t helper_float_ ## name ## _d(uint64_t fdt0)                \
-{                                                              \
-    return float64_ ## name(fdt0);                             \
-}                                                              \
-uint32_t helper_float_ ## name ## _s(uint32_t fst0)                \
-{                                                              \
-    return float32_ ## name(fst0);                             \
-}                                                              \
-uint64_t helper_float_ ## name ## _ps(uint64_t fdt0)               \
-{                                                              \
-    uint32_t wt0;                                              \
-    uint32_t wth0;                                             \
-                                                               \
-    wt0 =3D float32_ ## name(fdt0 & 0XFFFFFFFF);                 \
-    wth0 =3D float32_ ## name(fdt0 >> 32);                       \
-    return ((uint64_t)wth0 << 32) | wt0;                       \
-}
-FLOAT_UNOP(abs)
-FLOAT_UNOP(chs)
-#undef FLOAT_UNOP
+uint64_t helper_float_abs_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t fdt1;
+
+    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
+        fdt1 =3D float64_abs(fdt0);
+    } else {
+        if (float64_is_neg(fdt0)) {
+            fdt1 =3D float64_sub(0, fdt0, &env->active_fpu.fp_status);
+        } else {
+            fdt1 =3D float64_add(0, fdt0, &env->active_fpu.fp_status);
+        }
+        update_fcr31(env, GETPC());
+    }
+    return fdt1;
+}
+
+uint32_t helper_float_abs_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t fst1;
+
+    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
+        fst1 =3D float32_abs(fst0);
+    } else {
+        if (float32_is_neg(fst0)) {
+            fst1 =3D float32_sub(0, fst0, &env->active_fpu.fp_status);
+        } else {
+            fst1 =3D float32_add(0, fst0, &env->active_fpu.fp_status);
+        }
+        update_fcr31(env, GETPC());
+    }
+    return fst1;
+}
+
+uint64_t helper_float_abs_ps(CPUMIPSState *env, uint64_t fpst0)
+{
+    uint32_t fst0 =3D fpst0 & 0XFFFFFFFF;
+    uint32_t fsth0 =3D fpst0 >> 32;
+    uint32_t fst1;
+    uint32_t fsth1;
+
+    if (float32_is_neg(fst0)) {
+        fst1 =3D float32_sub(0, fst0, &env->active_fpu.fp_status);
+    } else {
+        fst1 =3D float32_add(0, fst0, &env->active_fpu.fp_status);
+    }
+    if (float32_is_neg(fsth0)) {
+        fsth1 =3D float32_sub(0, fsth0, &env->active_fpu.fp_status);
+    } else {
+        fsth1 =3D float32_add(0, fsth0, &env->active_fpu.fp_status);
+    }
+    update_fcr31(env, GETPC());
+    return ((uint64_t)fsth1 << 32) | fst1;
+}
+
+uint64_t helper_float_chs_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t fdt1;
+
+    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
+        fdt1 =3D float64_chs(fdt0);
+    } else {
+        fdt1 =3D float64_sub(0, fdt0, &env->active_fpu.fp_status);
+        update_fcr31(env, GETPC());
+    }
+    return fdt1;
+}
+
+uint32_t helper_float_chs_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint32_t fst1;
+
+    if (env->active_fpu.fcr31 & (1 << FCR31_ABS2008)) {
+        fst1 =3D float32_chs(fst0);
+    } else {
+        fst1 =3D float32_sub(0, fst0, &env->active_fpu.fp_status);
+        update_fcr31(env, GETPC());
+    }
+    return fst1;
+}
+
+uint64_t helper_float_chs_ps(CPUMIPSState *env, uint64_t fpst0)
+{
+    uint32_t fst0 =3D fpst0 & 0XFFFFFFFF;
+    uint32_t fsth0 =3D fpst0 >> 32;
+    uint32_t fst1;
+    uint32_t fsth1;
+
+    fst1 =3D float32_sub(0, fst0, &env->active_fpu.fp_status);
+    fsth1 =3D float32_sub(0, fsth0, &env->active_fpu.fp_status);
+    update_fcr31(env, GETPC());
+    return ((uint64_t)fsth1 << 32) | fst1;
+}
=20
 /* MIPS specific unary operations */
 uint64_t helper_float_recip_d(CPUMIPSState *env, uint64_t fdt0)
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 669bd0c..327c532 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -8792,7 +8792,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_abs_s(fp0, fp0);
+            gen_helper_float_abs_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -8811,7 +8811,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
             gen_load_fpr32(ctx, fp0, fs);
-            gen_helper_float_chs_s(fp0, fp0);
+            gen_helper_float_chs_s(fp0, cpu_env, fp0);
             gen_store_fpr32(ctx, fp0, fd);
             tcg_temp_free_i32(fp0);
         }
@@ -9282,7 +9282,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_abs_d(fp0, fp0);
+            gen_helper_float_abs_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9303,7 +9303,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_chs_d(fp0, fp0);
+            gen_helper_float_chs_d(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9794,7 +9794,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_abs_ps(fp0, fp0);
+            gen_helper_float_abs_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9815,7 +9815,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
             TCGv_i64 fp0 =3D tcg_temp_new_i64();
=20
             gen_load_fpr64(ctx, fp0, fs);
-            gen_helper_float_chs_ps(fp0, fp0);
+            gen_helper_float_chs_ps(fp0, cpu_env, fp0);
             gen_store_fpr64(ctx, fp0, fd);
             tcg_temp_free_i64(fp0);
         }
@@ -9934,7 +9934,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
         }
         break;
     case OPC_CVT_S_PU:
-        check_cp1_64bitmode(ctx);
+        check_ps(ctx);
         {
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
@@ -9956,7 +9956,7 @@ static void gen_farith (DisasContext *ctx, enum fop=
code op1,
         }
         break;
     case OPC_CVT_S_PL:
-        check_cp1_64bitmode(ctx);
+        check_ps(ctx);
         {
             TCGv_i32 fp0 =3D tcg_temp_new_i32();
=20
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 3e48680..18bc7cb 100644
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
@@ -433,8 +436,7 @@ static const mips_def_t mips_defs[] =3D
     },
     {
         /* A generic CPU supporting MIPS32 Release 6 ISA.
-           FIXME: Support IEEE 754-2008 FP.
-                  Eventually this should be replaced by a real CPU model=
. */
+           FIXME: Eventually this should be replaced by a real CPU model=
. */
         .name =3D "mips32r6-generic",
         .CP0_PRid =3D 0x00010000,
         .CP0_Config0 =3D MIPS_CONFIG0 | (0x2 << CP0C0_AR) |
@@ -484,6 +486,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3678FFFF,
         /* The R4000 has a full 64bit FPU but doesn't use the fcr0 bits.=
 */
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS3,
@@ -502,6 +505,7 @@ static const mips_def_t mips_defs[] =3D
         .CP0_Status_rw_bitmask =3D 0x3678FFFF,
         /* The VR5432 has a full 64bit FPU but doesn't use the fcr0 bits=
. */
         .CP1_fcr0 =3D (0x54 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 32,
         .insn_flags =3D CPU_VR54XX,
@@ -547,6 +551,7 @@ static const mips_def_t mips_defs[] =3D
         /* The 5Kf has F64 / L / W but doesn't use the fcr0 bits. */
         .CP1_fcr0 =3D (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x81 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64,
@@ -574,6 +579,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_3D) | (1 << FCR0_PS) |
                     (1 << FCR0_D) | (1 << FCR0_S) |
                     (0x82 << FCR0_PRID) | (0x0 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64 | ASE_MIPS3D,
@@ -600,6 +606,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) =
|
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_R=
EV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64R2 | ASE_MIPS3D,
@@ -702,6 +709,7 @@ static const mips_def_t mips_defs[] =3D
         .CCRes =3D 2,
         .CP0_Status_rw_bitmask =3D 0x35D0FFFF,
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 40,
         .insn_flags =3D CPU_LOONGSON2E,
@@ -720,6 +728,7 @@ static const mips_def_t mips_defs[] =3D
         .CCRes =3D 2,
         .CP0_Status_rw_bitmask =3D 0xF5D0FF1F,   /* Bits 7:5 not writabl=
e.  */
         .CP1_fcr0 =3D (0x5 << FCR0_PRID) | (0x1 << FCR0_REV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 40,
         .PABITS =3D 40,
         .insn_flags =3D CPU_LOONGSON2F,
@@ -747,6 +756,7 @@ static const mips_def_t mips_defs[] =3D
         .CP1_fcr0 =3D (1 << FCR0_F64) | (1 << FCR0_3D) | (1 << FCR0_PS) =
|
                     (1 << FCR0_L) | (1 << FCR0_W) | (1 << FCR0_D) |
                     (1 << FCR0_S) | (0x00 << FCR0_PRID) | (0x0 << FCR0_R=
EV),
+        .CP1_fcr31 =3D 0,
         .SEGBITS =3D 42,
         .PABITS =3D 36,
         .insn_flags =3D CPU_MIPS64R2 | ASE_DSP | ASE_DSPR2,
@@ -834,7 +844,11 @@ static void fpu_init (CPUMIPSState *env, const mips_=
def_t *def)
=20
     for (i =3D 0; i < MIPS_FPU_MAX; i++) {
         env->fpus[i].fcr0 =3D def->CP1_fcr0;
-        set_snan_bit_is_one(1, &env->fpus[i].fp_status);
+        if (env->insn_flags & ISA_MIPS32R6) {
+            set_snan_bit_is_one(0, &env->fpus[i].fp_status);
+        } else {
+            set_snan_bit_is_one(1, &env->fpus[i].fp_status);
+        }
     }
=20
     memcpy(&env->active_fpu, &env->fpus[0], sizeof(env->active_fpu));
@@ -893,5 +907,5 @@ static void msa_reset(CPUMIPSState *env)
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
=20
-    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
 }
--=20
1.9.1


