Received: by 10.25.208.211 with SMTP id h202csp850936lfg;
        Mon, 15 Feb 2016 09:27:17 -0800 (PST)
X-Received: by 10.141.2.68 with SMTP id e65mr23244724qhd.64.1455557237393;
        Mon, 15 Feb 2016 09:27:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si35231691qki.76.2016.02.15.09.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMvc-0007JT-Rt
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:27:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrd-0000ZP-1h
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrc-0007oz-3q
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:08 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrb-0007mW-T8; Mon, 15 Feb 2016 12:23:08 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xt-8i; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:55 +0000
Message-Id: <1455556977-3644-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 09/11] target-arm: In v8,
	make illegal AArch32 mode changes set PSTATE.IL
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
X-TUID: p2szz0Xc5ZLs

In v8, the illegal mode changes which are UNPREDICTABLE in v7 are
given architected behaviour:
 * the mode field is unchanged
 * PSTATE.IL is set (so any subsequent instructions will UNDEF)
 * any other CPSR fields are written to as normal

This is pretty much the same behaviour we picked for our
UNPREDICTABLE handling, with the exception that for v8 we
need to set the IL bit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index e7b3eb3..69e93a2 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5291,11 +5291,20 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         (env->uncached_cpsr & CPSR_M) != CPSR_USER &&
         ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
         if (bad_mode_switch(env, val & CPSR_M)) {
-            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE.
-             * We choose to ignore the attempt and leave the CPSR M field
-             * untouched.
+            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
+             * v7, and has defined behaviour in v8:
+             *  + leave CPSR.M untouched
+             *  + allow changes to the other CPSR fields
+             *  + set PSTATE.IL
+             * For user changes via the GDB stub, we don't set PSTATE.IL,
+             * as this would be unnecessarily harsh for a user error.
              */
             mask &= ~CPSR_M;
+            if (write_type != CPSRWriteByGDBStub &&
+                arm_feature(env, ARM_FEATURE_V8)) {
+                mask |= CPSR_IL;
+                val |= CPSR_IL;
+            }
         } else {
             switch_mode(env, val & CPSR_M);
         }
-- 
1.9.1

