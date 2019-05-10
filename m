Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp159492wrg;
        Fri, 10 May 2019 11:55:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOU/ZXq5wkSz2SqoEi22qpZF4Y8HacRSWKGi4zPyd198pUnmXjbaTE3ApD1/SwFbIS5KOG
X-Received: by 2002:a50:87ee:: with SMTP id 43mr13247787edz.238.1557514519643;
        Fri, 10 May 2019 11:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557514519; cv=none;
        d=google.com; s=arc-20160816;
        b=Mm/RmnT6eq0HrVJ1hz7wO+pZIlQE4A4qRBDD9HgQ3DV8hmgq426/8dkS2XVGCwkxgd
         veC+s6jUbdi5KmTxdfQmvS28BkGO84bxmmP85pb/g18KJEHEMD0jVW0FewEU2DvpyH6h
         vFptgz1ylvYg8WnWB9WiS9/b7sPMKQKK8R6TBFFtWgPVgTH2b4dM8Tb9ZlY9PgwVCcCP
         0LkqFSKQsybZywOHndvgito0GHzOGuWRfhR+b+JzfR6JKdayH77FiQGPnDnRWUlTgXXm
         mGdeTlP4/LgOr90O+ubdi2SdNpW2rNvbyCDjq5r69gko4T+OAz1LCwhXSzKlaDKxInCD
         mRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=kIP0+bD2TyEk2xdUzlyahVOJ4L+pRPnpI72gFvuwbRA=;
        b=nMfupGnHPJLkC1mFTYe6puXTLjxfI43iehC+plbZguQvpbbTcweIaWlsDObHRGN7ES
         RMbHc+X512p3gFnq1alemGbWGsB8o+a0LQD2CItyI8G02Z1kYEVA4lo79QIl9vByVfKj
         ryTIhf2KeYCpt4cfRixzZjQKDwChcKnkPYpFT28FgQAHXvadjFOtb6HBvcnwac9IvsWX
         gisNwvoWDbirKo4g8vHzeCRKlcVzyrZ1N3XSXO46YyVXApRXRdGbir9PfyZdIqWU5Bz5
         eRaGWm5S1YrMrR+iAsLp1ucrLuhh5FsQ+K1U3NNdS06+ZY594Yt8qdhd6nOJ8lEhRTEL
         beGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mw+PYPGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y23si1992630edc.4.2019.05.10.11.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 May 2019 11:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mw+PYPGi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:48496 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hPAfu-00080e-L7
	for alex.bennee@linaro.org; Fri, 10 May 2019 14:55:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPAfT-0007u8-UG
	for qemu-arm@nongnu.org; Fri, 10 May 2019 14:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hPAfM-0005hh-Cn
	for qemu-arm@nongnu.org; Fri, 10 May 2019 14:54:51 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:38368)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hPAfL-0005dl-W6
	for qemu-arm@nongnu.org; Fri, 10 May 2019 14:54:44 -0400
Received: by mail-pf1-x441.google.com with SMTP id 10so3689472pfo.5
	for <qemu-arm@nongnu.org>; Fri, 10 May 2019 11:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kIP0+bD2TyEk2xdUzlyahVOJ4L+pRPnpI72gFvuwbRA=;
	b=mw+PYPGiEtM5fnbmPVxbWryQ6otCh/D7zbvkm3SMJHW0Ve08Db9c39Tlm2+9a4XdJB
	U18iVDkJZYHvol1aWrtyTuKPhrpt8wM4PAVtdL86pTToPJ7jVfVjChbxGQam66QvmGam
	23tMWAvuc4Dk/XX3fnV/PUiFqzACbTeOOOnrU2D0ckMYr3HTA1v6P4vmCkxVyFOG0z+6
	VJ61T6lNo/rbFAuNAPnEJd7Kb984af+DRIptgFNPl1icT0+mzLlDEwulxA1XvikS2hFT
	8tQfOiZ20NYT46Tw7baAqWndcnaw3Y9sfxLtdwEdQ7xyTlM45Wm/vfpBnnuuqXvxDvNH
	Hkmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kIP0+bD2TyEk2xdUzlyahVOJ4L+pRPnpI72gFvuwbRA=;
	b=I7d8P/YFiEisogphxngbbvZBuXa/3fU1cC8DKpt6zLTu/8OVV+3Uh5r65Hy5qDI3yX
	VdAn6Z0LDVEvAcpQpoehIxfOOs0GXXzz51vMRWLpM0Z9WHqSZqE1Xph21T7jH6+eLjDm
	DHDm+9UTAToj0v0qZsBWDdZ0JYW0EGl/JUJ7FwkHhvjFHe50zCndvH8C6HfPimJCT1Rn
	8KmJG8q/hEp/mgAq5zsixKd4KqgGoHI/MuzGbEUtpIu9mT38glT8me6u9xB6Xd3ICOAj
	nHDFHj28600E6GainCbf3tgSES9KhnvqAtdeJj1RB8u9LgXIsj4L86QQXeCu2nLCog6D
	JSTQ==
X-Gm-Message-State: APjAAAW8SKMR2Mvz5PKEE9yZfixbxipzF+FNBCX/4IDOwhuiFokukACk
	M1eFt+Xce7JDNV9J2+JP+tZi8Q==
X-Received: by 2002:a63:5c5b:: with SMTP id n27mr16053073pgm.52.1557514482716; 
	Fri, 10 May 2019 11:54:42 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231]) by smtp.gmail.com with ESMTPSA id
	q20sm12733146pfi.166.2019.05.10.11.54.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 11:54:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 11:54:32 -0700
Message-Id: <20190510185438.29533-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510185438.29533-1-richard.henderson@linaro.org>
References: <20190510185438.29533-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-arm] [PULL v2 03/27] target/arm: Convert to CPUClass::tlb_fill
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+W1AS/Xdq+S

Cc: qemu-arm@nongnu.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 10 +++--
 target/arm/cpu.c       | 22 +---------
 target/arm/helper.c    | 98 ++++++++++++++++++++++++++----------------
 target/arm/op_helper.c | 29 ++-----------
 4 files changed, 73 insertions(+), 86 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 587a1ddf58..5a02f458f3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -761,10 +761,12 @@ static inline bool arm_extabort_type(MemTxResult result)
     return result != MEMTX_DECODE_ERROR;
 }
 
-/* Do a page table walk and add page to TLB if possible */
-bool arm_tlb_fill(CPUState *cpu, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi);
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr);
+
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
+                       int mmu_idx, ARMMMUFaultInfo *fi) QEMU_NORETURN;
 
 /* Return true if the stage 1 translation regime is using LPAE format page
  * tables */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a181fa8dc1..8eee1d8c59 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2133,23 +2133,6 @@ static Property arm_cpu_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
-#ifdef CONFIG_USER_ONLY
-static int arm_cpu_handle_mmu_fault(CPUState *cs, vaddr address, int size,
-                                    int rw, int mmu_idx)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    env->exception.vaddress = address;
-    if (rw == 2) {
-        cs->exception_index = EXCP_PREFETCH_ABORT;
-    } else {
-        cs->exception_index = EXCP_DATA_ABORT;
-    }
-    return 1;
-}
-#endif
-
 static gchar *arm_gdb_arch_name(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -2182,9 +2165,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->gdb_read_register = arm_cpu_gdb_read_register;
     cc->gdb_write_register = arm_cpu_gdb_write_register;
-#ifdef CONFIG_USER_ONLY
-    cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
-#else
+#ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
@@ -2209,6 +2190,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 #ifdef CONFIG_TCG
     cc->tcg_initialize = arm_translate_init;
+    cc->tlb_fill = arm_cpu_tlb_fill;
 #endif
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1e6eb0d0f3..f1a2b94ddb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12596,43 +12596,6 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
     }
 }
 
-/* Walk the page table and (if the mapping exists) add the page
- * to the TLB. Return false on success, or true on failure. Populate
- * fsr with ARM DFSR/IFSR fault register format value on failure.
- */
-bool arm_tlb_fill(CPUState *cs, vaddr address,
-                  MMUAccessType access_type, int mmu_idx,
-                  ARMMMUFaultInfo *fi)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot;
-    int ret;
-    MemTxAttrs attrs = {};
-
-    ret = get_phys_addr(env, address, access_type,
-                        core_to_arm_mmu_idx(env, mmu_idx), &phys_addr,
-                        &attrs, &prot, &page_size, fi, NULL);
-    if (!ret) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return 0;
-    }
-
-    return ret;
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
@@ -13111,6 +13074,67 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
 
 #endif
 
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+#ifdef CONFIG_USER_ONLY
+    cpu->env.exception.vaddress = address;
+    if (access_type == MMU_INST_FETCH) {
+        cs->exception_index = EXCP_PREFETCH_ABORT;
+    } else {
+        cs->exception_index = EXCP_DATA_ABORT;
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs = {};
+    ARMMMUFaultInfo fi = {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret = get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size, &fi, NULL);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+#endif
+}
+
+#ifndef CONFIG_USER_ONLY
+void tlb_fill(CPUState *cs, target_ulong addr, int size,
+              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+    arm_cpu_tlb_fill(cs, addr, size, access_type, mmu_idx, false, retaddr);
+}
+#endif
+
 void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
 {
     /* Implement DC ZVA, which zeroes a fixed-length block of memory.
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 8698b4dc83..8ee15a4bd4 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -126,8 +126,8 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
-                          int mmu_idx, ARMMMUFaultInfo *fi)
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
+                       int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
@@ -179,27 +179,6 @@ static void deliver_fault(ARMCPU *cpu, vaddr addr, MMUAccessType access_type,
     raise_exception(env, exc, syn, target_el);
 }
 
-/* try to fill the TLB and return an exception if error. If retaddr is
- * NULL, it means that the function was called in C code (i.e. not
- * from generated code or from helper.c)
- */
-void tlb_fill(CPUState *cs, target_ulong addr, int size,
-              MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
-{
-    bool ret;
-    ARMMMUFaultInfo fi = {};
-
-    ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fi);
-    if (unlikely(ret)) {
-        ARMCPU *cpu = ARM_CPU(cs);
-
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-
-        deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
-    }
-}
-
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  MMUAccessType access_type,
@@ -212,7 +191,7 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     cpu_restore_state(cs, retaddr, true);
 
     fi.type = ARMFault_Alignment;
-    deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
+    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
 
 /* arm_cpu_do_transaction_failed: handle a memory system error response
@@ -233,7 +212,7 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
 
     fi.ea = arm_extabort_type(response);
     fi.type = ARMFault_SyncExternal;
-    deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
+    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
 }
 
 #endif /* !defined(CONFIG_USER_ONLY) */
-- 
2.17.1

