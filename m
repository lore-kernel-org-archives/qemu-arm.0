Received: by 10.25.205.13 with SMTP id d13csp2126836lfg;
        Tue, 13 Dec 2016 03:04:36 -0800 (PST)
X-Received: by 10.55.164.209 with SMTP id n200mr79171033qke.299.1481627076397;
        Tue, 13 Dec 2016 03:04:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e185si27888202qkd.62.2016.12.13.03.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 03:04:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkss-0002dR-0p
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 06:04:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkT2-0005ok-Ro
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSx-0000Dz-AZ
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:52 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSx-000087-37; Tue, 13 Dec 2016 05:37:47 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRe-0002G7-7B; Tue, 13 Dec 2016 10:36:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:02 +0000
Message-Id: <1481625384-15077-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 01/23] target-arm: Log AArch64 exception returns
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wftKwafcOo7X

We already log exception entry; add logging of the AArch64 exception
return path as well.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/op_helper.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index cd94216..ba796d8 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -17,6 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "internals.h"
@@ -972,6 +973,9 @@ void HELPER(exception_return)(CPUARMState *env)
         } else {
             env->regs[15] = env->elr_el[cur_el] & ~0x3;
         }
+        qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
+                      "AArch32 EL%d PC 0x%" PRIx32 "\n",
+                      cur_el, new_el, env->regs[15]);
     } else {
         env->aarch64 = 1;
         pstate_write(env, spsr);
@@ -980,6 +984,9 @@ void HELPER(exception_return)(CPUARMState *env)
         }
         aarch64_restore_sp(env, new_el);
         env->pc = env->elr_el[cur_el];
+        qemu_log_mask(CPU_LOG_INT, "Exception return from AArch64 EL%d to "
+                      "AArch64 EL%d PC 0x%" PRIx64 "\n",
+                      cur_el, new_el, env->pc);
     }
 
     arm_call_el_change_hook(arm_env_get_cpu(env));
@@ -1002,6 +1009,8 @@ illegal_return:
     if (!arm_singlestep_active(env)) {
         env->pstate &= ~PSTATE_SS;
     }
+    qemu_log_mask(LOG_GUEST_ERROR, "Illegal exception return at EL%d: "
+                  "resuming execution at 0x%" PRIx64 "\n", cur_el, env->pc);
 }
 
 /* Return true if the linked breakpoint entry lbn passes its checks */
-- 
2.7.4

