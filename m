Received: by 10.25.208.194 with SMTP id h185csp1434858lfg;
        Mon, 18 Apr 2016 09:04:26 -0700 (PDT)
X-Received: by 10.140.218.82 with SMTP id o79mr34763674qhb.33.1460995462067;
        Mon, 18 Apr 2016 09:04:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v91si24956399qgv.74.2016.04.18.09.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBev-0005eg-4P
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:04:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBeo-0005Xk-RL
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBem-0005Y3-PL
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54502 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBem-0005Xm-En; Mon, 18 Apr 2016 12:04:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 580341A48DA;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 2A12C1A4600;
	Mon, 18 Apr 2016 18:03:47 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:41 +0200
Message-Id: <1460995422-14373-9-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 8/9] target-mips: Clean up position and order
 of helpers for CVT.<L|W>.<S|D>
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
X-TUID: PNfZd+UMV7uS

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

This patch makes position and order of helpers for CVT.<L|W>.<S|D>
within file target-mips/op_helper.c consistent with position and order
of helpers for <CEIL|FLOOR|ROUND|TRUNC>.<L|W>.<S|D>.

Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/op_helper.c | 60 ++++++++++++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 7fecde7..203975e 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2684,32 +2684,6 @@ uint64_t helper_float_cvtd_l(CPUMIPSState *env, uint64_t dt0)
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
@@ -2792,11 +2766,37 @@ uint32_t helper_float_cvts_pu(CPUMIPSState *env, uint32_t wth0)
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
@@ -2805,11 +2805,11 @@ uint32_t helper_float_cvt_w_s(CPUMIPSState *env, uint32_t fst0)
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
1.9.1

