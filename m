Received: by 10.25.208.211 with SMTP id h202csp850114lfg;
        Mon, 15 Feb 2016 09:25:28 -0800 (PST)
X-Received: by 10.141.5.213 with SMTP id h204mr22452672qhd.48.1455557128828;
        Mon, 15 Feb 2016 09:25:28 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si35279908qka.36.2016.02.15.09.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMts-0004Mp-6g
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:25:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrb-0000Xa-Li
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMra-0007oF-RA
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMra-0007mW-KU; Mon, 15 Feb 2016 12:23:06 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000y1-CN; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:57 +0000
Message-Id: <1455556977-3644-12-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 11/11] target-arm: Make Monitor->NS PL1 mode
	changes illegal if HCR.TGE is 1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2zNQABDIbEV6

If HCR.TGE is 1 then mode changes via CPS and MSR from Monitor to
NonSecure PL1 modes are illegal mode changes. Implement this check
in bad_mode_switch().

(We don't currently implement HCR.TGE, but this is the only missing
check from the v8 ARM ARM G1.9.3 and so it's worth adding now; the
rest of the HCR.TGE checks can be added later as necessary.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e1af9d5..93a0b63 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5182,6 +5182,7 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
 
     switch (mode) {
     case ARM_CPU_MODE_USR:
+        return 0;
     case ARM_CPU_MODE_SYS:
     case ARM_CPU_MODE_SVC:
     case ARM_CPU_MODE_ABT:
@@ -5191,6 +5192,15 @@ static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
         /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
          * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
          */
+        /* If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
+         * and CPS are treated as illegal mode changes.
+         */
+        if (write_type == CPSRWriteByInstr &&
+            (env->cp15.hcr_el2 & HCR_TGE) &&
+            (env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON &&
+            !arm_is_secure_below_el3(env)) {
+            return 1;
+        }
         return 0;
     case ARM_CPU_MODE_HYP:
         return !arm_feature(env, ARM_FEATURE_EL2)
-- 
1.9.1

