Received: by 10.25.208.211 with SMTP id h202csp1987521lfg;
        Tue, 12 Apr 2016 05:58:55 -0700 (PDT)
X-Received: by 10.140.41.164 with SMTP id z33mr3650384qgz.78.1460465934500;
        Tue, 12 Apr 2016 05:58:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s201si5961216qke.3.2016.04.12.05.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Apr 2016 05:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1apxu9-0000ZC-DO
	for alex.bennee@linaro.org; Tue, 12 Apr 2016 08:58:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtf-00085z-Gx
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1apxtd-0006vb-35
	for qemu-arm@nongnu.org; Tue, 12 Apr 2016 08:58:23 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43697 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1apxtc-0006v0-Oz; Tue, 12 Apr 2016 08:58:21 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 025AF1A224D;
	Tue, 12 Apr 2016 14:58:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id D09A61A4567;
	Tue, 12 Apr 2016 14:58:17 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 12 Apr 2016 14:58:11 +0200
Message-Id: <1460465891-6142-10-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460465891-6142-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v4 9/9] target-mips: Clean up order of helpers
 for CVT.<L|W>.<S|D>
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
X-TUID: 5YpOQSw+YBHd

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch makes position of helpers for CVT.<L|W>.<S|D> consistent with
position of helpers for <CEIL|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/op_helper.c |   60 +++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 841f066..6b3d5bd 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2693,32 +2693,6 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uint64_t dt0)
     return fdt2;
 }
 
-uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
-{
-    uint64_t dt2;
-
-    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 = FP_TO_INT64_OVERFLOW;
-    }
-    update_fcr31(env, GETPC());
-    return dt2;
-}
-
-uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
-{
-    uint64_t dt2;
-
-    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
-    if (get_float_exception_flags(&env->active_fpu.fp_status)
-        & (float_flag_invalid | float_flag_overflow)) {
-        dt2 = FP_TO_INT64_OVERFLOW;
-    }
-    update_fcr31(env, GETPC());
-    return dt2;
-}
-
 uint64_t helper_float_cvtps_pw(CPUMIPSState *env, uint64_t dt0)
 {
     uint32_t fst2;
@@ -2801,11 +2775,37 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, uint32_t wth0)
     return wt2;
 }
 
-uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
+uint64_t helper_float_cvt_l_d(CPUMIPSState *env, uint64_t fdt0)
+{
+    uint64_t dt2;
+
+    dt2 = float64_to_int64(fdt0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dt2 = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint64_t helper_float_cvt_l_s(CPUMIPSState *env, uint32_t fst0)
+{
+    uint64_t dt2;
+
+    dt2 = float32_to_int64(fst0, &env->active_fpu.fp_status);
+    if (get_float_exception_flags(&env->active_fpu.fp_status)
+        & (float_flag_invalid | float_flag_overflow)) {
+        dt2 = FP_TO_INT64_OVERFLOW;
+    }
+    update_fcr31(env, GETPC());
+    return dt2;
+}
+
+uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
 {
     uint32_t wt2;
 
-    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
+    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
     if (get_float_exception_flags(&env->active_fpu.fp_status)
         & (float_flag_invalid | float_flag_overflow)) {
         wt2 = FP_TO_INT32_OVERFLOW;
@@ -2814,11 +2814,11 @@ uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
     return wt2;
 }
 
-uint32_t helper_float_cvt_w_d(CPUMIPSState *env, uint64_t fdt0)
+uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
 {
     uint32_t wt2;
 
-    wt2 = float64_to_int32(fdt0, &env->active_fpu.fp_status);
+    wt2 = float32_to_int32(fst0, &env->active_fpu.fp_status);
     if (get_float_exception_flags(&env->active_fpu.fp_status)
         & (float_flag_invalid | float_flag_overflow)) {
         wt2 = FP_TO_INT32_OVERFLOW;
-- 
1.7.9.5

