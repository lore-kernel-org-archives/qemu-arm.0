Received: by 10.25.208.137 with SMTP id h131csp1291379lfg;
        Mon, 16 May 2016 07:17:49 -0700 (PDT)
X-Received: by 10.140.239.137 with SMTP id k131mr31235718qhc.11.1463408269502;
        Mon, 16 May 2016 07:17:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a35si23167652qgf.66.2016.05.16.07.17.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 May 2016 07:17:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2JLA-0004pB-Su
	for alex.bennee@linaro.org; Mon, 16 May 2016 10:17:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIV-0000Ji-9W
	for qemu-devel@nongnu.org; Mon, 16 May 2016 10:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1b2JIU-00065X-5I
	for qemu-devel@nongnu.org; Mon, 16 May 2016 10:15:03 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:33169 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1b2JIO-00063h-Ls; Mon, 16 May 2016 10:14:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id C802A1A4522;
	Mon, 16 May 2016 16:14:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw197-lin.domain.local (rtrkw197-lin.domain.local
	[10.10.13.82])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 986C21A4521;
	Mon, 16 May 2016 16:14:54 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 May 2016 16:12:42 +0200
Message-Id: <1463407965-19733-7-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1463407965-19733-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 6/9] target-mips: Activate IEEE 754-2008
 signaling NaN bit meaning
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
X-TUID: IocCyjcZWcpd

From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>

Functions mips_cpu_reset() and msa_reset() are updated so that flag
snan_bit_is_one is properly set for any Mips FPU/MSA configuration.
For main FPUs, CPUs with FCR31's FCR31_NAN2008 bit set will invoke
set_snan_bit_is_one(0). For MSA, as it is IEEE 274-2008 compliant
from it inception, set_snan_bit_is_one(0) will always be invoked.

By applying this patch, a number of incorrect behaviors for CPU
configurations that require IEEE 754-2008 compliance will be fixed.
Those are behaviors that (up to the moment of applying this patch)
did not get the desired functionality from SoftFloat library with
respect to distinguishing between quiet and signaling NaN, getting
default NaN values (both quiet and signaling), establishing if a
floating point number is Nan or not, etc.

Two examples:

* <MAX|MAXA>.<D|S> will now correctly detect and propagate NaNs.
* CLASS.<D|S> and FCLASS.<D|S> will now correcty detect NaN flavors.

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
index e81a831..a37d8bb 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -893,5 +893,6 @@ static void msa_reset(CPUMIPSState *env)
     /* clear float_status nan mode */
     set_default_nan_mode(0, &env->active_tc.msa_fp_status);
 
-    set_snan_bit_is_one(1, &env->active_tc.msa_fp_status);
+    /* set proper signanling bit meaning ("1" means "quiet") */
+    set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
 }
-- 
1.9.1

