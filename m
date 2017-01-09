Received: by 10.25.205.13 with SMTP id d13csp11572239lfg;
        Mon, 9 Jan 2017 08:28:02 -0800 (PST)
X-Received: by 10.200.45.103 with SMTP id o36mr24206670qta.266.1483979282786;
        Mon, 09 Jan 2017 08:28:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n12si56624342qtn.239.2017.01.09.08.28.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:28:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcnf-0003No-TP
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:27:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcTI-0000vM-Ld
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:06:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcTH-0004D0-I0
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:06:56 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48054)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcTH-0004CV-Ah; Mon, 09 Jan 2017 11:06:55 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRx-0001oM-93; Mon, 09 Jan 2017 16:05:33 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:22 +0000
Message-Id: <1483977924-14522-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 16/18] target/arm/psci.c: If EL2 implemented,
 start CPUs in EL2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z46Hl73hUMMO

The PSCI spec states that a CPU_ON call should cause the new
CPU to be started in the highest implemented Non-secure
exception level. We were incorrectly starting it at the
exception level of the caller, which happens to be correct
if EL2 is not implemented. Implement the correct logic
as described in the PSCI 1.0 spec section 6.4:
 * if EL2 exists and SCR_EL3.HCE is set: start in EL2
 * otherwise start in EL1

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/psci.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/arm/psci.c b/target/arm/psci.c
index 14316eb..64bf82e 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -148,17 +148,28 @@ void arm_handle_psci_call(ARMCPU *cpu)
     case QEMU_PSCI_0_1_FN_CPU_ON:
     case QEMU_PSCI_0_2_FN_CPU_ON:
     case QEMU_PSCI_0_2_FN64_CPU_ON:
+    {
+        /* The PSCI spec mandates that newly brought up CPUs start
+         * in the highest exception level which exists and is enabled
+         * on the calling CPU. Since the QEMU PSCI implementation is
+         * acting as a "fake EL3" or "fake EL2" firmware, this for us
+         * means that we want to start at the highest NS exception level
+         * that we are providing to the guest.
+         * The execution mode should be that which is currently in use
+         * by the same exception level on the calling CPU.
+         * The CPU should be started with the context_id value
+         * in x0 (if AArch64) or r0 (if AArch32).
+         */
+        int target_el = arm_feature(env, ARM_FEATURE_EL2) ? 2 : 1;
+        bool target_aarch64 = arm_el_is_aa64(env, target_el);
+
         mpidr = param[1];
         entry = param[2];
         context_id = param[3];
-        /*
-         * The PSCI spec mandates that newly brought up CPUs enter the
-         * exception level of the caller in the same execution mode as
-         * the caller, with context_id in x0/r0, respectively.
-         */
-        ret = arm_set_cpu_on(mpidr, entry, context_id, arm_current_el(env),
-                             is_a64(env));
+        ret = arm_set_cpu_on(mpidr, entry, context_id,
+                             target_el, target_aarch64);
         break;
+    }
     case QEMU_PSCI_0_1_FN_CPU_OFF:
     case QEMU_PSCI_0_2_FN_CPU_OFF:
         goto cpu_off;
-- 
2.7.4

