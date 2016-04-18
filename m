Received: by 10.25.208.194 with SMTP id h185csp1434769lfg;
        Mon, 18 Apr 2016 09:04:17 -0700 (PDT)
X-Received: by 10.55.168.195 with SMTP id r186mr9566551qke.24.1460995457358;
        Mon, 18 Apr 2016 09:04:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x62si23978742qke.0.2016.04.18.09.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 09:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asBeq-0005aC-U5
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 12:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBeo-0005Xh-QU
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1asBem-0005Xi-6y
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 12:04:14 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:54501 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1asBel-0005XM-W5; Mon, 18 Apr 2016 12:04:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id EF0F41A48BC;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id B88081A4611;
	Mon, 18 Apr 2016 18:03:46 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 18:03:38 +0200
Message-Id: <1460995422-14373-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1460995422-14373-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-arm] [PATCH v5 5/9] target-mips: Activate IEEE 274-2008
 signaling NaN bit meaning
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
X-TUID: MrJFSkrhRYaD

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Functions mips_cpu_reset() and msa_reset() are updated so that flag
snan_bit_is_one is properly set for any Mips FPU/MSA configuration.
For main FPUs, CPUs with FCR31's FCR31_NAN2008 bit set will invoke
set_snan_bit_is_one(0). For MSA, as it is IEEE 274-2008 compliant
from it inception, set_snan_bit_is_one(0) will always be invoked.

By applying this patch, a number of incorrect behaviors for CPU
configurations that require IEEE 274-2008 compliance will be fixed.
Those are behaviors that (up to the moment of applying this patch)
did not get the desired functionality from SoftFloat library with
respect to distinguishing between quiet and signaling NaN, getting
default NaN values (both quiet and signaling), establishing if a
floating point number is Nan or not, etc.

Just two examples:

* <MAX|MAXA>.<D|S> will now correctly detect and propagate NaNs.
* CLASS.<D|S> will now correcty detect NaN flavors, both their
  CPU FPU and MSA version.

Signed-off-by: Thomas Schwinge <thomas@codesourcery.com>
Signed-off-by: Maciej W. Rozycki <macro@codesourcery.com>
Signed-off-by: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
---
 target-mips/translate.c      | 6 +++++-
 target-mips/translate_init.c | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index e934884..2cdd2bd 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -20129,7 +20129,11 @@ void cpu_state_reset(CPUMIPSState *env)
     env->CP0_PageGrain = env->cpu_model->CP0_PageGrain;
     env->active_fpu.fcr0 = env->cpu_model->CP1_fcr0;
     env->active_fpu.fcr31 = env->cpu_model->CP1_fcr31;
-    set_snan_bit_is_one(1, &env->active_fpu.fp_status);
+    if ((env->active_fpu.fcr31 >> FCR31_NAN2008) & 1) {
+        set_snan_bit_is_one(0, &env->active_fpu.fp_status);
+    } else {
+        set_snan_bit_is_one(1, &env->active_fpu.fp_status);
+    }
     env->msair = env->cpu_model->MSAIR;
     env->insn_flags = env->cpu_model->insn_flags;
 
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 1094baa..bae6183 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -904,5 +904,6 @@ static void msa_reset(CPUMIPSState *env)
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
 
-    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
+    /* set proper signanling bit meaning ("1" means "quiet") */
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
 }
-- 
1.9.1

