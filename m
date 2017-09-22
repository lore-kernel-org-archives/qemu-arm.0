Received: by 10.223.172.38 with SMTP id v35csp3213203wrc;
        Fri, 22 Sep 2017 08:03:39 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBYHsfipwm5QUmQhpwAbLbM6rCxThsY8K282YJ3MIlDTxp0f6cvfqVsmUHVvzUqc58gbqVW
X-Received: by 10.200.24.5 with SMTP id q5mr8555981qtj.293.1506092619680;
        Fri, 22 Sep 2017 08:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092619; cv=none;
        d=google.com; s=arc-20160816;
        b=Lu83V4Nw0tPQeOHvHswaci9LLPvBhoyoms44lUcrEqVjl9xRjt+Y4Y6U5nfFUkZ9yp
         uNajjz69B8ZUkB50j8Ooo65EiPLY3xXJSsgK7C7TWOKxq/w5fwdQ3voZSkhbHnlxyI3L
         COqdV5rriWSvGpDbVBcHZzezn+oSiJdV5n/gkuRYwal4yd3tVw+rqnMpm0KjlWR0HnMX
         jySDB5SO1aj9yOWiSeOzo+skQXjryBfDlJ1bMKmSrxTqQs0NmUbebVhMw3Txba306Tow
         kXhd4dADENT0teEFVQBprGyeqdIoS6ym3GSXhWk7J9noQudcWM3SWzz/tZpzb2Omx+TW
         G2fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=BOoCOfC+1qbvuvyfjQ9poLtH5D60YCc2sPGh1InuxKE=;
        b=M//frI9yP+N1BX7u7dpIct27P+Y6fsYmSkh4TjCg64AHnEm3XaEvGhsOjhs8tn2Css
         QAqXq6+CcH0OZAN/UVAsrYstVHYYrhJFkaVbq9fxuZNsHtFkblvmKWOpmEFLIQMF6Uc2
         ssaMzwdrM+t+5WFtRHyG2pA0v8oezksiQKvq5GlWKJNapUXLalJHRisVrHfDoaxUG18h
         Kl5LZ3ZP9kuhLNbdIioRkRsDU70L5zoKsRtI5Q2br4rbAPiKjTYPZ6AsfOdwengw7rW/
         J1Ao/fi7OJRZp8z+V1+H6pW2ugo5IsaalBYB62QxxfxmYT3lFXVNwaWhfqShg1+KI69f
         jk/w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l72si14971qke.386.2017.09.22.08.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPUP-0002jE-Ca
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:03:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQe-00083h-9s
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQc-0004Da-VO
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQc-0004CN-MR; Fri, 22 Sep 2017 10:59:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQb-0007Fb-Hk; Fri, 22 Sep 2017 15:59:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 16:00:04 +0100
Message-Id: <1506092407-26985-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 17/20] target/arm: Implement SG instruction
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
X-TUID: FPi+R2SytSEA

Implement the SG instruction, which we emulate 'by hand' in the
exception handling code path.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 129 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 124 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b1ecb66..8df819d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -41,6 +41,10 @@ typedef struct V8M_SAttributes {
     bool irvalid;
 } V8M_SAttributes;
 
+static void v8m_security_lookup(CPUARMState *env, uint32_t address,
+                                MMUAccessType access_type, ARMMMUIdx mmu_idx,
+                                V8M_SAttributes *sattrs);
+
 /* Definitions for the PMCCNTR and PMCR registers */
 #define PMCRD   0x8
 #define PMCRC   0x4
@@ -6724,6 +6728,123 @@ static void arm_log_exception(int idx)
     }
 }
 
+static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, uint16_t *insn)
+{
+    /* Load a 16-bit portion of a v7M instruction, returning true on success,
+     * or false on failure (in which case we will have pended the appropriate
+     * exception).
+     * We need to do the instruction fetch's MPU and SAU checks
+     * like this because there is no MMU index that would allow
+     * doing the load with a single function call. Instead we must
+     * first check that the security attributes permit the load
+     * and that they don't mismatch on the two halves of the instruction,
+     * and then we do the load as a secure load (ie using the security
+     * attributes of the address, not the CPU, as architecturally required).
+     */
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    V8M_SAttributes sattrs = {};
+    MemTxAttrs attrs = {};
+    ARMMMUFaultInfo fi = {};
+    MemTxResult txres;
+    target_ulong page_size;
+    hwaddr physaddr;
+    int prot;
+    uint32_t fsr;
+
+    v8m_security_lookup(env, env->regs[15], MMU_INST_FETCH, mmu_idx, &sattrs);
+    if (!sattrs.nsc || sattrs.ns) {
+        /* This must be the second half of the insn, and it straddles a
+         * region boundary with the second half not being S&NSC.
+         */
+        env->v7m.sfsr |= R_V7M_SFSR_INVEP_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+        qemu_log_mask(CPU_LOG_INT,
+                      "...really SecureFault with SFSR.INVEP\n");
+        return false;
+    }
+    if (get_phys_addr(env, env->regs[15], MMU_INST_FETCH, mmu_idx,
+                      &physaddr, &attrs, &prot, &page_size, &fsr, &fi)) {
+        /* the MPU lookup failed */
+        env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_IACCVIOL_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM, env->v7m.secure);
+        qemu_log_mask(CPU_LOG_INT, "...really MemManage with CFSR.IACCVIOL\n");
+        return false;
+    }
+    *insn = address_space_lduw_le(arm_addressspace(cs, attrs), physaddr,
+                                 attrs, &txres);
+    if (txres != MEMTX_OK) {
+        env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_IBUSERR_MASK;
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS, false);
+        qemu_log_mask(CPU_LOG_INT, "...really BusFault with CFSR.IBUSERR\n");
+        return false;
+    }
+    return true;
+}
+
+static bool v7m_handle_execute_nsc(ARMCPU *cpu)
+{
+    /* Check whether this attempt to execute code in a Secure & NS-Callable
+     * memory region is for an SG instruction; if so, then emulate the
+     * effect of the SG instruction and return true. Otherwise pend
+     * the correct kind of exception and return false.
+     */
+    CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx;
+    uint16_t insn;
+
+    /* We should never get here unless get_phys_addr_pmsav8() caused
+     * an exception for NS executing in S&NSC memory.
+     */
+    assert(!env->v7m.secure);
+    assert(arm_feature(env, ARM_FEATURE_M_SECURITY));
+
+    /* We want to do the MPU lookup as secure; work out what mmu_idx that is */
+    mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
+
+    if (!v7m_read_half_insn(cpu, mmu_idx, &insn)) {
+        return false;
+    }
+
+    if (!env->thumb) {
+        goto gen_invep;
+    }
+
+    if (insn != 0xe97f) {
+        /* Not an SG instruction first half (we choose the IMPDEF
+         * early-SG-check option).
+         */
+        goto gen_invep;
+    }
+
+    if (!v7m_read_half_insn(cpu, mmu_idx, &insn)) {
+        return false;
+    }
+
+    if (insn != 0xe97f) {
+        /* Not an SG instruction second half */
+        goto gen_invep;
+    }
+
+    /* OK, we have confirmed that we really have an SG instruction.
+     * We know we're NS in S memory so don't need to repeat those checks.
+     */
+    qemu_log_mask(CPU_LOG_INT, "...really an SG instruction at 0x%08" PRIx32
+                  ", executing it\n", env->regs[15]);
+    env->regs[14] &= ~1;
+    switch_v7m_security_state(env, true);
+    xpsr_write(env, 0, XPSR_IT);
+    env->regs[15] += 4;
+    return true;
+
+gen_invep:
+    env->v7m.sfsr |= R_V7M_SFSR_INVEP_MASK;
+    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
+    qemu_log_mask(CPU_LOG_INT,
+                  "...really SecureFault with SFSR.INVEP\n");
+    return false;
+}
+
 void arm_v7m_cpu_do_interrupt(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -6766,12 +6887,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
              * the SG instruction have the same security attributes.)
              * Everything else must generate an INVEP SecureFault, so we
              * emulate the SG instruction here.
-             * TODO: actually emulate SG.
              */
-            env->v7m.sfsr |= R_V7M_SFSR_INVEP_MASK;
-            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-            qemu_log_mask(CPU_LOG_INT,
-                          "...really SecureFault with SFSR.INVEP\n");
+            if (v7m_handle_execute_nsc(cpu)) {
+                return;
+            }
             break;
         case M_FAKE_FSR_SFAULT:
             /* Various flavours of SecureFault for attempts to execute or
-- 
2.7.4

