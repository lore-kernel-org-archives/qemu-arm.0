Received: by 10.25.77.65 with SMTP id a62csp125319lfb;
        Fri, 20 Jan 2017 10:45:16 -0800 (PST)
X-Received: by 10.55.93.195 with SMTP id r186mr14047726qkb.109.1484937916191;
        Fri, 20 Jan 2017 10:45:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si5424753qkf.251.2017.01.20.10.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeBV-0003Js-HE
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBF-00035B-B4
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBE-0002X2-8t
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:57 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeBE-0002QO-1h; Fri, 20 Jan 2017 13:44:56 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeB3-00047B-EN; Fri, 20 Jan 2017 18:44:45 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:44:40 +0000
Message-Id: <1484937883-1068-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/6] armv7m: Explicit error for bad vector table
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QLHlXLlP4EzR

From: Michael Davidsaver <mdavidsaver@gmail.com>

Give an explicit error and abort when a load
from the vector table fails. Architecturally this
should HardFault (which will then immediately
fail to load the HardFault vector and go into Lockup).
Since we don't model Lockup, just report this guest
error via cpu_abort(). This is more helpful than the
previous behaviour of reading a zero, which is the
address of the reset stack pointer and not a sensible
location to jump to.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: expanded commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ad23de3..8edb08c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6014,6 +6014,30 @@ static void arm_log_exception(int idx)
     }
 }
 
+static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
+
+{
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    MemTxResult result;
+    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
+    uint32_t addr;
+
+    addr = address_space_ldl(cs->as, vec,
+                             MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
+         * which would then be immediately followed by our failing to load
+         * the entry vector for that HardFault, which is a Lockup case.
+         * Since we don't model Lockup, we just report this guest error
+         * via cpu_abort().
+         */
+        cpu_abort(cs, "Failed to read from exception vector table "
+                  "entry %08x\n", (unsigned)vec);
+    }
+    return addr;
+}
+
 void arm_v7m_cpu_do_interrupt(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -6095,7 +6119,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
-    addr = ldl_phys(cs->as, env->v7m.vecbase + env->v7m.exception * 4);
+    addr = arm_v7m_load_vector(cpu);
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
 }
-- 
2.7.4

