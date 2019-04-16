Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3907722wrx;
        Tue, 16 Apr 2019 06:09:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsR9u8kSkYTbXawtbYuslxA/brmugVQd3zuTg5Zaez9XbgPpdFFL/JxrPfoqlyKS0CdWtg
X-Received: by 2002:a7b:c458:: with SMTP id l24mr25583913wmi.75.1555420189822;
        Tue, 16 Apr 2019 06:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420189; cv=none;
        d=google.com; s=arc-20160816;
        b=xbk11XvWqKpWU5F1gaF5Qj3v1GTSa7tl7u4QG02A9CBw1XAQnhaOWAfKHd+DZuoD2E
         PFDs80uaB3gnd0mAQ/H4EFTHZeMh0aDfhtov/fCZyRTgqq+D0TSQMvwyjPMyKaXUaYwE
         EUOrEbFjaApa7pMGj3QWAysmErAsPm2ELx/dduFM5f1RHqrt93hu/zdjfSmacuFp6Qjb
         ViHqABCBrqKg1SMCAM7V0+vWOeu+bwCw2bzjyBzsFGTfbN2JXF7VTP1Q/4rGZvAHfzLt
         fN3U73V1vziFMZkqFwbkd8EztT7BfG75pNp89tl+pGLB1m3dnh96GJQwKXk/HAcXiEvw
         JK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=BzHkJFvKAiz/tlfhEM+yVQrC/PFkZx9GRWTUJ1dPqLQ=;
        b=V5KjTqBCn6X/gcSSOGgcCizjvl/IPpgZ7b2pp09e7K8tMdbZ2V3ZxtClzkwsdG5Qqw
         lONZsSOjsEkcoyx5YLzu9F/5Lk64OMwxAA6FD8UTLHXfVSrFKqLmF2laxqZrg+aPDii9
         NIoWN1ikWBEtTgjBrp0rujR7nEOKTi8/YEClHZuV2khbCpWf2AhtWsF6OlK8kgHTanUL
         YoUpSfcS+nuFMaSFJKg0zH2eUbEjYEfLs6a8sSr26yqMT+/JEBiMmjBc0lxg7YcZ2TeT
         DumXRrA1Bw5bUpZMcYw8BPbC1gkY8pHGSe9V7ga1tJdKdKYgNBAF79azOaiS8daZELRx
         mPWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpPJxqaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si13286964wmj.156.2019.04.16.06.09.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CpPJxqaw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36431 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNqO-0005wa-LJ
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:09:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfa-00058R-KV
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfY-0001WJ-Io
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:38 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45796)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfV-0001Sr-7x
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:34 -0400
Received: by mail-wr1-x443.google.com with SMTP id s15so26896448wra.12
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BzHkJFvKAiz/tlfhEM+yVQrC/PFkZx9GRWTUJ1dPqLQ=;
	b=CpPJxqawwEkeQg2hqGYbIiLUiWSFo7xA6g6Mnh5Szd8aESdmkwQXoMu+4/UCBLcuwZ
	9CaFEnnJUM7CWtrPee3AEdxoItgYVUgNjQC5l5FEuu3O4q2onhnlVLzlp0IkmR2rUfxi
	X9XAVjqcVrGJ7lSErXShdnRQJx78o4aTnUGJam24EEU/3WCAaxDjlIrVanodFi3oyYXE
	nSIAtpoj++xOyg/4dzhJBKHdPy7dXjYIlhjIL8AXi0wiRYiEG4ToqFnI+6aDL0q+AyrZ
	F9qOsZcGuSe/pMt88EuKrv30KrVtfGHZfRqewWpqkxOOYWMq4vCWIftuUbu03vj0ddyF
	/tJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BzHkJFvKAiz/tlfhEM+yVQrC/PFkZx9GRWTUJ1dPqLQ=;
	b=YYfTkKGGMWYeVUnmVrRJfnvDGC57Ag+CaE6QBNpWT2Hsqv3J6T6fuLrjEDs24SbBW+
	pOze0g3LUZIfeXDRxdcEs5UfgIkvqQXVdlQ6SY6d0FSyvRMyxDKXTr5FjVQNWS/oRNkE
	Ir4+krAyb8trapRkvfrcmPqB15Xn38FI2MBAcIk30wd7+TWcI3Ud4CjoxwrpiRRVOGG/
	wiK3/KFRmMFCP+1ePA6kVHRdtQNpa4Zwkmsc//p6rmc27zLSgtcKl19KyT/akKztndfe
	7P5TMttbWI/HZg3DwmuZWtUBADf/PAAo78iw40pGCEsGUoyMwgl5cPCHH7Z2l9ZFmKIQ
	85Xg==
X-Gm-Message-State: APjAAAU7qnpLChb0/FDNYHetuzP68m0zJlwDxPubJnsHrXnGuvpxV+k8
	ylxhc3+28AWDBGwPcwzY+oqG/fvQuR4=
X-Received: by 2002:adf:f30a:: with SMTP id i10mr51156723wro.111.1555419510156;
	Tue, 16 Apr 2019 05:58:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:40 +0100
Message-Id: <20190416125744.27770-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 22/26] target/arm: Add lazy-FP-stacking support
 to v7m_stack_write()
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
X-TUID: CbcuqBhBOWUF

Pushing registers to the stack for v7M needs to handle three cases:
 * the "normal" case where we pend exceptions
 * an "ignore faults" case where we set FSR bits but
   do not pend exceptions (this is used when we are
   handling some kinds of derived exception on exception entry)
 * a "lazy FP stacking" case, where different FSR bits
   are set and the exception is pended differently

Implement this by changing the existing flag argument that
tells us whether to ignore faults or not into an enum that
specifies which of the 3 modes we should handle.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 118 +++++++++++++++++++++++++++++---------------
 1 file changed, 79 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c8e30b40366..975ac9c6fc4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7580,8 +7580,18 @@ static bool v7m_cpacr_pass(CPUARMState *env, bool is_secure, bool is_priv)
     }
 }
 
+/*
+ * What kind of stack write are we doing? This affects how exceptions
+ * generated during the stacking are treated.
+ */
+typedef enum StackingMode {
+    STACK_NORMAL,
+    STACK_IGNFAULTS,
+    STACK_LAZYFP,
+} StackingMode;
+
 static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
-                            ARMMMUIdx mmu_idx, bool ignfault)
+                            ARMMMUIdx mmu_idx, StackingMode mode)
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
@@ -7599,15 +7609,31 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
                       &attrs, &prot, &page_size, &fi, NULL)) {
         /* MPU/SAU lookup failed */
         if (fi.type == ARMFault_QEMU_SFault) {
-            qemu_log_mask(CPU_LOG_INT,
-                          "...SecureFault with SFSR.AUVIOL during stacking\n");
-            env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK | R_V7M_SFSR_SFARVALID_MASK;
+            if (mode == STACK_LAZYFP) {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...SecureFault with SFSR.LSPERR "
+                              "during lazy stacking\n");
+                env->v7m.sfsr |= R_V7M_SFSR_LSPERR_MASK;
+            } else {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...SecureFault with SFSR.AUVIOL "
+                              "during stacking\n");
+                env->v7m.sfsr |= R_V7M_SFSR_AUVIOL_MASK;
+            }
+            env->v7m.sfsr |= R_V7M_SFSR_SFARVALID_MASK;
             env->v7m.sfar = addr;
             exc = ARMV7M_EXCP_SECURE;
             exc_secure = false;
         } else {
-            qemu_log_mask(CPU_LOG_INT, "...MemManageFault with CFSR.MSTKERR\n");
-            env->v7m.cfsr[secure] |= R_V7M_CFSR_MSTKERR_MASK;
+            if (mode == STACK_LAZYFP) {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...MemManageFault with CFSR.MLSPERR\n");
+                env->v7m.cfsr[secure] |= R_V7M_CFSR_MLSPERR_MASK;
+            } else {
+                qemu_log_mask(CPU_LOG_INT,
+                              "...MemManageFault with CFSR.MSTKERR\n");
+                env->v7m.cfsr[secure] |= R_V7M_CFSR_MSTKERR_MASK;
+            }
             exc = ARMV7M_EXCP_MEM;
             exc_secure = secure;
         }
@@ -7617,8 +7643,13 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
                          attrs, &txres);
     if (txres != MEMTX_OK) {
         /* BusFault trying to write the data */
-        qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.STKERR\n");
-        env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_STKERR_MASK;
+        if (mode == STACK_LAZYFP) {
+            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.LSPERR\n");
+            env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_LSPERR_MASK;
+        } else {
+            qemu_log_mask(CPU_LOG_INT, "...BusFault with BFSR.STKERR\n");
+            env->v7m.cfsr[M_REG_NS] |= R_V7M_CFSR_STKERR_MASK;
+        }
         exc = ARMV7M_EXCP_BUS;
         exc_secure = false;
         goto pend_fault;
@@ -7633,11 +7664,19 @@ pend_fault:
      * later if we have two derived exceptions.
      * The only case when we must not pend the exception but instead
      * throw it away is if we are doing the push of the callee registers
-     * and we've already generated a derived exception. Even in this
-     * case we will still update the fault status registers.
+     * and we've already generated a derived exception (this is indicated
+     * by the caller passing STACK_IGNFAULTS). Even in this case we will
+     * still update the fault status registers.
      */
-    if (!ignfault) {
+    switch (mode) {
+    case STACK_NORMAL:
         armv7m_nvic_set_pending_derived(env->nvic, exc, exc_secure);
+        break;
+    case STACK_LAZYFP:
+        armv7m_nvic_set_pending_lazyfp(env->nvic, exc, exc_secure);
+        break;
+    case STACK_IGNFAULTS:
+        break;
     }
     return false;
 }
@@ -8014,6 +8053,7 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     uint32_t limit;
     bool want_psp;
     uint32_t sig;
+    StackingMode smode = ignore_faults ? STACK_IGNFAULTS : STACK_NORMAL;
 
     if (dotailchain) {
         bool mode = lr & R_V7M_EXCRET_MODE_MASK;
@@ -8057,23 +8097,15 @@ static bool v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain,
      */
     sig = v7m_integrity_sig(env, lr);
     stacked_ok =
-        v7m_stack_write(cpu, frameptr, sig, mmu_idx, ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx,
-                        ignore_faults) &&
-        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx,
-                        ignore_faults);
+        v7m_stack_write(cpu, frameptr, sig, mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x8, env->regs[4], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0xc, env->regs[5], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x10, env->regs[6], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x14, env->regs[7], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x18, env->regs[8], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x1c, env->regs[9], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x20, env->regs[10], mmu_idx, smode) &&
+        v7m_stack_write(cpu, frameptr + 0x24, env->regs[11], mmu_idx, smode);
 
     /* Update SP regardless of whether any of the stack accesses failed. */
     *frame_sp_p = frameptr;
@@ -8352,14 +8384,20 @@ static bool v7m_push_stack(ARMCPU *cpu)
      * if it has higher priority).
      */
     stacked_ok = stacked_ok &&
-        v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 4, env->regs[1], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 8, env->regs[2], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 12, env->regs[3], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 16, env->regs[12], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 20, env->regs[14], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 24, env->regs[15], mmu_idx, false) &&
-        v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, false);
+        v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 4, env->regs[1],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 8, env->regs[2],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 12, env->regs[3],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 16, env->regs[12],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 20, env->regs[14],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 24, env->regs[15],
+                        mmu_idx, STACK_NORMAL) &&
+        v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, STACK_NORMAL);
 
     if (env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) {
         /* FPU is active, try to save its registers */
@@ -8409,12 +8447,14 @@ static bool v7m_push_stack(ARMCPU *cpu)
                         faddr += 8; /* skip the slot for the FPSCR */
                     }
                     stacked_ok = stacked_ok &&
-                        v7m_stack_write(cpu, faddr, slo, mmu_idx, false) &&
-                        v7m_stack_write(cpu, faddr + 4, shi, mmu_idx, false);
+                        v7m_stack_write(cpu, faddr, slo,
+                                        mmu_idx, STACK_NORMAL) &&
+                        v7m_stack_write(cpu, faddr + 4, shi,
+                                        mmu_idx, STACK_NORMAL);
                 }
                 stacked_ok = stacked_ok &&
                     v7m_stack_write(cpu, frameptr + 0x60,
-                                    vfp_get_fpscr(env), mmu_idx, false);
+                                    vfp_get_fpscr(env), mmu_idx, STACK_NORMAL);
                 if (cpacr_pass) {
                     for (i = 0; i < ((framesize == 0xa8) ? 32 : 16); i += 2) {
                         *aa32_vfp_dreg(env, i / 2) = 0;
-- 
2.20.1

