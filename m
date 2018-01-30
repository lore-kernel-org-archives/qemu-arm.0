Received: by 10.28.71.27 with SMTP id u27csp1474248wma;
        Tue, 30 Jan 2018 07:03:17 -0800 (PST)
X-Google-Smtp-Source: AH8x2271PSYUWwudBdn+GSnWjjpcJWoq72KAeGJBjN6oQy1TXY2PVA0dckilg0EXL0mEmL6MiReQ
X-Received: by 10.13.234.145 with SMTP id t139mr19264212ywe.346.1517324597058;
        Tue, 30 Jan 2018 07:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324597; cv=none;
        d=google.com; s=arc-20160816;
        b=KY+9y62b7aOkQxs4082krmFy4pNbOiXuWGsylIivpJK2usL1eK5g/o9JiE1hGHltaF
         U7PlHsD7sIrh7hgmx32my13QmgZ7yNzFEXX1fgNydJE4MhBKooFB2l+PRfHhOkmz7lKv
         VBeAUCAqB542j3q5iD3UjkvgjLpues14bh7XpduJzP+n9FUjPAAhgHz1YRwwUfuH6oP/
         WCjwAT2n5b3PWZmNkPDWSHqlDIj59VXfJOFCRfkBEjwoPO0CUr7iZTbx+reQwmTjyoO7
         sKLKcJsnT6avgBBHAXd3CGm0apLk8v9yYcdbqOgnoS2kyTbWfhkDTcXnbpvwV6hab9/1
         IohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Lh6zGnpU5JaLnTKKpNHhY4C4cjeZgmES1vp5Win0pFA=;
        b=FdCAe/fESEp24p6jxGAfe7oTsVYsXaTCaNhOfDcAUwtbegvmb6WvFXsYXI3gJP36lh
         XfYiK0CxnZwj1uUENT2AOunqokHBCgH4mK36at/6l9nLjhQVz6jWj5Ho42So4OcM2veF
         hWQ8CD+nezy7qnoyoERhG3IJbs6VQj/IjxM6/gWZ0Xk4zbREdr5kTFMZP95LRmS1zYyg
         qxRCz/bkQUSavLErcczNpUkJaVqcOIw3ttjanFqhdfqoaLNeh+xF++Ephc+fTmI7N0o/
         9gOoQwokX0dX+BUTkwSPZCZ5dpkOaKKp9Cyip9uxqWlRnZpIjvOXG9GNP+JFZ8/8+s78
         L4Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si2695855ywa.301.2018.01.30.07.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:03:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXRM-0000aq-CQ
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:03:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQh-0000BO-GQ
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQc-0005ZT-N4
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQc-0005Xp-ER; Tue, 30 Jan 2018 10:02:30 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQb-0005tt-Ac; Tue, 30 Jan 2018 15:02:29 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:22 +0000
Message-Id: <1517324542-6607-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 7/7] target/arm: Handle exceptions during
 exception stack pop
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
X-TUID: XD8MXWX5eM8O

Handle possible MPU faults, SAU faults or bus errors when
popping register state off the stack during exception return.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 115 ++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 94 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6931a9d..3332565 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6223,6 +6223,67 @@ pend_fault:
     return false;
 }
 
+static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
+                           ARMMMUIdx mmu_idx)
+{
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    MemTxAttrs attrs = {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    ARMMMUFaultInfo fi;
+    bool secure = mmu_idx & ARM_MMU_IDX_M_S;
+    int exc;
+    bool exc_secure;
+    uint32_t value;
+
+    if (get_phys_addr(env, addr, MMU_DATA_LOAD, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, NULL)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type == ARMFault_QEMU_SFault) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault with SFSR.AUVIOL during unstack\n");
+            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
+            env->v7m.sfar = addr;
+            exc = ARMV7M_EXCP_SECURE;
+            exc_secure = true;
+        } else {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...MemManageFault with CFSR.MUNSTKERR\n");
+            env->v7m.cfsr[secure] |= R_V7M_CFSR_MUNSTKERR_MASK;
+            exc = ARMV7M_EXCP_MEM;
+            exc_secure = secure;
+        }
+        goto pend_fault;
+    }
+
+    value = address_space_ldl(arm_addressspace(cs, attrs), physaddr,
+                              attrs, &txres);
+    if (txres != MEMTX_OK) {
+        /* BusFault trying to read the data */
+        qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.UNSTKERR\n");
+        env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_UNSTKERR_MASK;
+        exc = ARMV7M_EXCP_BUS;
+        exc_secure = false;
+        goto pend_fault;
+    }
+
+    *dest = value;
+    return true;
+
+pend_fault:
+    /* By pending the exception at this point we are making
+     * the IMPDEF choice "overridden exceptions pended" (see the
+     * MergeExcInfo() pseudocode). The other choice would be to not
+     * pend them now and then make a choice about which to throw away
+     * later if we have two derived exceptions.
+     */
+    armv7m_nvic_set_pending(env->nvic, exc, exc_secure);
+    return false;
+}
+
 /* Return true if we're using the process stack pointer (not the MSP) */
 static bool v7m_using_psp(CPUARMState *env)
 {
@@ -6912,6 +6973,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                                               !return_to_handler,
                                               return_to_sp_process);
         uint32_t frameptr = *frame_sp_p;
+        bool pop_ok = true;
+        ARMMMUIdx mmu_idx;
+
+        mmu_idx = arm_v7m_mmu_idx_for_secstate_and_priv(env, return_to_secure,
+                                                        !return_to_handler);
 
         if (!QEMU_IS_ALIGNED(frameptr, 8) &&
             arm_feature(env, ARM_FEATURE_V8)) {
@@ -6938,29 +7004,38 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 return;
             }
 
-            env->regs[4] = ldl_phys(cs->as, frameptr + 0x8);
-            env->regs[5] = ldl_phys(cs->as, frameptr + 0xc);
-            env->regs[6] = ldl_phys(cs->as, frameptr + 0x10);
-            env->regs[7] = ldl_phys(cs->as, frameptr + 0x14);
-            env->regs[8] = ldl_phys(cs->as, frameptr + 0x18);
-            env->regs[9] = ldl_phys(cs->as, frameptr + 0x1c);
-            env->regs[10] = ldl_phys(cs->as, frameptr + 0x20);
-            env->regs[11] = ldl_phys(cs->as, frameptr + 0x24);
+            pop_ok =
+                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[4], frameptr + 0x8, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[5], frameptr + 0xc, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[6], frameptr + 0x10, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[7], frameptr + 0x14, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[8], frameptr + 0x18, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[9], frameptr + 0x1c, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[10], frameptr + 0x20, mmu_idx) &&
+                v7m_stack_read(cpu, &env->regs[11], frameptr + 0x24, mmu_idx);
 
             frameptr += 0x28;
         }
 
-        /* Pop registers. TODO: make these accesses use the correct
-         * attributes and address space (S/NS, priv/unpriv) and handle
-         * memory transaction failures.
-         */
-        env->regs[0] = ldl_phys(cs->as, frameptr);
-        env->regs[1] = ldl_phys(cs->as, frameptr + 0x4);
-        env->regs[2] = ldl_phys(cs->as, frameptr + 0x8);
-        env->regs[3] = ldl_phys(cs->as, frameptr + 0xc);
-        env->regs[12] = ldl_phys(cs->as, frameptr + 0x10);
-        env->regs[14] = ldl_phys(cs->as, frameptr + 0x14);
-        env->regs[15] = ldl_phys(cs->as, frameptr + 0x18);
+        /* Pop registers */
+        pop_ok = pop_ok &&
+            v7m_stack_read(cpu, &env->regs[0], frameptr, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[1], frameptr + 0x4, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[2], frameptr + 0x8, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[3], frameptr + 0xc, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[12], frameptr + 0x10, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[14], frameptr + 0x14, mmu_idx) &&
+            v7m_stack_read(cpu, &env->regs[15], frameptr + 0x18, mmu_idx) &&
+            v7m_stack_read(cpu, &xpsr, frameptr + 0x1c, mmu_idx);
+
+        if (!pop_ok) {
+            /* v7m_stack_read() pended a fault, so take it (as a tail
+             * chained exception on the same stack frame)
+             */
+            v7m_exception_taken(cpu, excret, true, false);
+            return;
+        }
 
         /* Returning from an exception with a PC with bit 0 set is defined
          * behaviour on v8M (bit 0 is ignored), but for v7M it was specified
@@ -6979,8 +7054,6 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             }
         }
 
-        xpsr = ldl_phys(cs->as, frameptr + 0x1c);
-
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* For v8M we have to check whether the xPSR exception field
              * matches the EXCRET value for return to handler/thread
-- 
2.7.4

