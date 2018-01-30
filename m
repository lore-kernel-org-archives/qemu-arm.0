Received: by 10.28.71.27 with SMTP id u27csp1474125wma;
        Tue, 30 Jan 2018 07:03:12 -0800 (PST)
X-Google-Smtp-Source: AH8x227Dx0gQTIZFIWLncECAjF9Dq0yk08tb3Rm7DEd3Uf/ccFBGRvSiHmQKbc8M7vYRUWlOGBHc
X-Received: by 10.37.204.142 with SMTP id l136mr777881ybf.22.1517324592041;
        Tue, 30 Jan 2018 07:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324592; cv=none;
        d=google.com; s=arc-20160816;
        b=C6DNAVBm/uRcT1QepDvRJ1jnk7HrOq68utAdEXHQ4JM77s0dlp5o0tctI9+TwLSfdp
         mySdRFh1eUdls20t4um8ET+kEQg34rJkO0R+KeB+PzcAbVQNN0lOW2ryi1BI5DLwPHlc
         3mz0zc4YEw96KZYW9YPX1aNBS77NDv8TCQTAZoTKasLM6giTEmKntNCZjwkIqBOoMZhP
         sO3Ia+VgU3d4z1Fhm8yug1VLOinuLL8NkOIZqy/lv8nLEx4eCk2YHWk34KZQ5ePBO9Rf
         XPP8tLw3IWtd3HT/51hz82QFyyhrOpiJBdNWUJmlDbdAwCfDDPCy47YvT1Pxx4RIMqIO
         Q1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=cb1ZKKwXL53sHwl4LVcTdR8KHQXWh8A5m23QJpe5FAI=;
        b=NmiCjJLPb0ao2nOaO7i5K1s0pK4U6Yzky6Ul/iEZQ+xL4oFrv9s77GlsDcbRxXgMo9
         zJMg2SpH5xiy0t2AN2K592lOdzydlhQabQJ4MCWqEChrritIpxirFmhXC9dZiH8SAoxg
         b0voh35g3eRCBVVaJv2PA8tFRJWwNoYACD2KKqssdMVgKDXi5h3oIJgj1NI+Xi6UFTEt
         rE/HfAgzRT7ZDqzYulX1wZGpyJwoBvokNzIevP36x1smBSFhR3lougP/hi/eSz9kprE8
         8a24da4mcTNiydsJVsiePLdgm9F4TKIOkM5UuOR1IUSq2cctZmTT1qxWwgBEZucZf1qR
         cd+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 202si2653425yws.623.2018.01.30.07.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:03:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXRH-0000VV-Ec
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:03:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQk-0000Bg-6g
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQc-0005Yb-3z
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:38 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQb-0005Uz-Qp; Tue, 30 Jan 2018 10:02:30 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQY-0005t7-QJ; Tue, 30 Jan 2018 15:02:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:19 +0000
Message-Id: <1517324542-6607-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 4/7] target/arm: Make v7M exception entry stack
 push check MPU
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
X-TUID: Sbqu2BqpONGr

The memory writes done to push registers on the stack
on exception entry in M profile CPUs are supposed to
go via MPU permissions checks, which may cause us to
take a derived exception instead of the original one of
the MPU lookup fails. We were implementing these as
always-succeeds direct writes to physical memory.
Rewrite v7m_push_stack() to do the necessary checks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 103 ++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c713eea..007e760 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6161,12 +6161,66 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
     return target_el;
 }
 
-static void v7m_push(CPUARMState *env, uint32_t val)
+static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
+                            ARMMMUIdx mmu_idx, bool ignfault)
 {
-    CPUState *cs = CPU(arm_env_get_cpu(env));
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
 
-    env->regs[13] -= 4;
-    stl_phys(cs->as, env->regs[13], val);
+    if (get_phys_addr(env, addr, MMU_DATA_STORE, mmu_idx, &physaddr,
+                      &attrs, &prot, &page_size, &fi, NULL)) {
+        /* MPU/SAU lookup failed */
+        if (fi.type == ARMFault_QEMU_SFault) {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...SecureFault with SFSR.AUVIOL during stacking\n");
+            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
+            env->v7m.sfar = addr;
+            exc = ARMV7M_EXCP_SECURE;
+            exc_secure = true;
+        } else {
+            qemu_log_mask(CPU_LOG_INT, "...MemManageFault with CFSR.MSTKERR\n");
+            env->v7m.cfsr[secure] |= R_V7M_CFSR_MSTKERR_MASK;
+            exc = ARMV7M_EXCP_MEM;
+            exc_secure = secure;
+        }
+        goto pend_fault;
+    }
+    address_space_stl_le(arm_addressspace(cs, attrs), physaddr, value,
+                         attrs, &txres);
+    if (txres != MEMTX_OK) {
+        /* BusFault trying to write the data */
+        qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.STKERR\n");
+        env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_STKERR_MASK;
+        exc = ARMV7M_EXCP_BUS;
+        exc_secure = false;
+        goto pend_fault;
+    }
+    return true;
+
+pend_fault:
+    /* By pending the exception at this point we are making
+     * the IMPDEF choice "overridden exceptions pended" (see the
+     * MergeExcInfo() pseudocode). The other choice would be to not
+     * pend them now and then make a choice about which to throw away
+     * later if we have two derived exceptions.
+     * The only case when we must not pend the exception but instead
+     * throw it away is if we are doing the push of the callee registers
+     * and we've already generated a derived exception. Even in this
+     * case we will still update the fault status registers.
+     */
+    if (!ignfault) {
+        armv7m_nvic_set_pending_derived(env->nvic, exc, exc_secure);
+    }
+    return false;
 }
 
 /* Return true if we're using the process stack pointer (not the MSP) */
@@ -6562,26 +6616,43 @@ static bool v7m_push_stack(ARMCPU *cpu)
      * should ignore further stack faults trying to process
      * that derived exception.)
      */
+    bool stacked_ok;
     CPUARMState *env = &cpu->env;
     uint32_t xpsr = xpsr_read(env);
+    uint32_t frameptr = env->regs[13];
+    ARMMMUIdx mmu_idx = core_to_arm_mmu_idx(env, cpu_mmu_index(env, false));
 
     /* Align stack pointer if the guest wants that */
-    if ((env->regs[13] & 4) &&
+    if ((frameptr & 4) &&
         (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKALIGN_MASK)) {
-        env->regs[13] -= 4;
+        frameptr -= 4;
         xpsr |= XPSR_SPREALIGN;
     }
-    /* Switch to the handler mode.  */
-    v7m_push(env, xpsr);
-    v7m_push(env, env->regs[15]);
-    v7m_push(env, env->regs[14]);
-    v7m_push(env, env->regs[12]);
-    v7m_push(env, env->regs[3]);
-    v7m_push(env, env->regs[2]);
-    v7m_push(env, env->regs[1]);
-    v7m_push(env, env->regs[0]);
 
-    return false;
+    frameptr -= 0x20;
+
+    /* Write as much of the stack frame as we can. If we fail a stack
+     * write this will result in a derived exception being pended
+     * (which may be taken in preference to the one we started with
+     * if it has higher priority).
+     */
+    stacked_ok =
+        v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 4, env->regs[1], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 8, env->regs[2], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 12, env->regs[3], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 16, env->regs[12], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 20, env->regs[14], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 24, env->regs[15], mmu_idx, false) &&
+        v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, false);
+
+    /* Update SP regardless of whether any of the stack accesses failed.
+     * When we implement v8M stack limit checking then this attempt to
+     * update SP might also fail and result in a derived exception.
+     */
+    env->regs[13] = frameptr;
+
+    return !stacked_ok;
 }
 
 static void do_v7m_exception_exit(ARMCPU *cpu)
-- 
2.7.4

