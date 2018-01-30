Received: by 10.28.71.27 with SMTP id u27csp1473809wma;
        Tue, 30 Jan 2018 07:02:57 -0800 (PST)
X-Google-Smtp-Source: AH8x227UpQ8+TIJFw0VX8tUO8b0gQHs+wYg3bY8tDdDO3jNsjWLMAuQRJyyvXtR3aC4aa6cuKwN0
X-Received: by 10.37.63.131 with SMTP id m125mr20041578yba.120.1517324574503;
        Tue, 30 Jan 2018 07:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324572; cv=none;
        d=google.com; s=arc-20160816;
        b=bpA6rhFeRbjkS7At1XN95q2Xb8OMBuEwSzCFGg6G5vZNpVj9yl+VUxOCNL/z0WsWsx
         0HW6PWiS5wyqlti71L8M3QrGESBx9qoPtH8QlsUSxVtTyWnQZrGnPkAzzFRUDPfdkI4u
         k25W0AhRh+VBKTXV5v0p/BF4vuXmDmwahxIPmZ+VOTPmIG01S5VWMEWijF8/2dciiRRN
         WpZieXQWtp9En9v0WufiQC8FAnj5a10o1ZID1EdjdbJmP9gdBWAUhTPmdO0WU8rhoLRA
         fv2n5oExkodjg1Ykxsku7fQ6TbPvQ4BeOaXAAPwVUVFBFTjINsEC1sEvjJT0R2lCBkZN
         y+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gQyWH12Yoj43dPBInES9ylzevD9Co84EqcqZwHIN0Jw=;
        b=SLFjP6PAtXLWJAFZwg5BHce3B4d4M8+swTvXzQRe2xLfBjDvhn/wOF/uDNophxU9Ea
         UG/X5BL2KR/k8FBw4DMBjfluVaFTZ1LmBltaTkFRhuBtcz7OU+IKIRKLbrEu0JwGI2B/
         7uyw7BHgl4VrBuSx2MMh+k5D3ypW7KhE5Gx1qyEKtDwFiDF6YIRUaMeaKz6OCu91va7S
         A4jGS3WCXsfrqHZuPUzLosc/RFe59461ReRMtJFIbxs/ORXHnqXrxRmUKK1JHL2QEQ3C
         x5B4yFHe9bTF18egfz+I30sx/RsHH3zsO7rogTpa+flri3g/ve/mAizQXR5wY47uO+wj
         R1KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o63si3710647ybc.685.2018.01.30.07.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42059 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXQy-0000Ek-97
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:02:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQh-0000BJ-52
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQb-0005Wn-25
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQa-0005Uz-Qm; Tue, 30 Jan 2018 10:02:28 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQZ-0005tN-Mu; Tue, 30 Jan 2018 15:02:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:20 +0000
Message-Id: <1517324542-6607-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 5/7] target/arm: Make v7m_push_callee_stack()
 honour MPU
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AcR7AFfi7mtJ

Make v7m_push_callee_stack() honour the MPU by using the
new v7m_stack_write() function. We return a flag to indicate
whether the pushes failed, which we can then use in
v7m_exception_taken() to cause us to handle the derived
exception correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 64 ++++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 007e760..de0031b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6473,7 +6473,7 @@ static uint32_t arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure)
     return addr;
 }
 
-static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
+static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                                   bool ignore_faults)
 {
     /* For v8M, push the callee-saves register part of the stack frame.
@@ -6481,31 +6481,55 @@ static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
      * In the tailchaining case this may not be the current stack.
      */
     CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
     uint32_t *frame_sp_p;
     uint32_t frameptr;
+    ARMMMUIdx mmu_idx;
+    bool stacked_ok;
 
     if (dotailchain) {
-        frame_sp_p = get_v7m_sp_ptr(env, true,
-                                    lr & R_V7M_EXCRET_MODE_MASK,
+        bool mode = lr & R_V7M_EXCRET_MODE_MASK;
+        bool priv = !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_NPRIV_MASK) ||
+            !mode;
+
+        mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, M_REG_S, priv);
+        frame_sp_p = get_v7m_sp_ptr(env, M_REG_S, mode,
                                     lr & R_V7M_EXCRET_SPSEL_MASK);
     } else {
+        mmu_idx = core_to_arm_mmu_idx(env, cpu_mmu_index(env, false));
         frame_sp_p = &env->regs[13];
     }
 
     frameptr = *frame_sp_p - 0x28;
 
-    stl_phys(cs->as, frameptr, 0xfefa125b);
-    stl_phys(cs->as, frameptr + 0x8, env->regs[4]);
-    stl_phys(cs->as, frameptr + 0xc, env->regs[5]);
-    stl_phys(cs->as, frameptr + 0x10, env->regs[6]);
-    stl_phys(cs->as, frameptr + 0x14, env->regs[7]);
-    stl_phys(cs->as, frameptr + 0x18, env->regs[8]);
-    stl_phys(cs->as, frameptr + 0x1c, env->regs[9]);
-    stl_phys(cs->as, frameptr + 0x20, env->regs[10]);
-    stl_phys(cs->as, frameptr + 0x24, env->regs[11]);
+    /* Write as much of the stack frame as we can. A write failure may
+     * cause us to pend a derived exception.
+     */
+    stacked_ok =
+        v7m_stack_write(cpu, frameptr, 0xfefa125b, mmu_idx, ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx,
+                        ignore_faults) &&
+        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx,
+                        ignore_faults);
 
+    /* Update SP regardless of whether any of the stack accesses failed.
+     * When we implement v8M stack limit checking then this attempt to
+     * update SP might also fail and result in a derived exception.
+     */
     *frame_sp_p = frameptr;
+
+    return !stacked_ok;
 }
 
 static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
@@ -6519,6 +6543,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     uint32_t addr;
     bool targets_secure;
     int exc;
+    bool push_failed = false;
 
     armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
 
@@ -6546,8 +6571,8 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                  */
                 if (lr & R_V7M_EXCRET_DCRS_MASK &&
                     !(dotailchain && (lr & R_V7M_EXCRET_ES_MASK))) {
-                    v7m_push_callee_stack(cpu, lr, dotailchain,
-                                          ignore_stackfaults);
+                    push_failed = v7m_push_callee_stack(cpu, lr, dotailchain,
+                                                        ignore_stackfaults);
                 }
                 lr |= R_V7M_EXCRET_DCRS_MASK;
             }
@@ -6589,6 +6614,15 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
         }
     }
 
+    if (push_failed && !ignore_stackfaults) {
+        /* Derived exception on callee-saves register stacking:
+         * we might now want to take a different exception which
+         * targets a different security state, so try again from the top.
+         */
+        v7m_exception_taken(cpu, lr, true, true);
+        return;
+    }
+
     addr = arm_v7m_load_vector(cpu, exc, targets_secure);
 
     /* Now we've done everything that might cause a derived exception
-- 
2.7.4

