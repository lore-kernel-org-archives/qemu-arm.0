Received: by 10.25.159.131 with SMTP id i125csp2206645lfe;
        Tue, 6 Dec 2016 10:11:25 -0800 (PST)
X-Received: by 10.55.43.212 with SMTP id r81mr23784739qkr.196.1481047885604;
        Tue, 06 Dec 2016 10:11:25 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v6si12278532qkl.115.2016.12.06.10.11.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 10:11:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEKD6-0004gn-Sp
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 13:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEK9B-0001Ms-78
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 13:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEK9A-00068V-3l
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 13:07:21 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cEK99-00064f-TY; Tue, 06 Dec 2016 13:07:20 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cEJor-0005sv-CX; Tue, 06 Dec 2016 17:46:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 17:46:17 +0000
Message-Id: <1481046379-32632-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
References: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] target-arm: Log AArch64 exception returns
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SYZ+pn+VgV9B

We already log exception entry; add logging of the AArch64 exception
return path as well.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

