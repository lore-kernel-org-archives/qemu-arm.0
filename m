Received: by 10.25.85.209 with SMTP id j200csp72711lfb;
        Fri, 10 Jun 2016 09:31:58 -0700 (PDT)
X-Received: by 10.140.98.174 with SMTP id o43mr2645507qge.73.1465576318052;
        Fri, 10 Jun 2016 09:31:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si6728044qkb.24.2016.06.10.09.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPLh-0001Er-Gb
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:31:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHR-0006dY-4F
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHL-0007ga-Se
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:32 -0400
Received: from forward13m.cmail.yandex.net ([5.255.216.144]:40930)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBPHK-0007gA-ER; Fri, 10 Jun 2016 12:27:27 -0400
Received: from smtp3m.mail.yandex.net (smtp3m.mail.yandex.net
	[IPv6:2a02:6b8:0:2519::125])
	by forward13m.cmail.yandex.net (Yandex) with ESMTP id 2F3EE2138C;
	Fri, 10 Jun 2016 19:27:09 +0300 (MSK)
Received: from smtp3m.mail.yandex.net (localhost [127.0.0.1])
	by smtp3m.mail.yandex.net (Yandex) with ESMTP id A1E0027A0927;
	Fri, 10 Jun 2016 19:27:06 +0300 (MSK)
Received: by smtp3m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	700tofVhlY-R66KQGDh; Fri, 10 Jun 2016 19:27:06 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465576026; bh=qZS2K89HDoDzLDGbgNoRfMyUboXKLee81E/qLhPDTPg=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	References;
	b=oYQmaIdx0BFKKLfVtLVaJtxrkfl9ihKCAx/W3quoim6zwPIXNdKydOo0vxOafMW38
	0E5GMWFg8okdonvQBl/1qREgQNvXe/L/77F5Ixs9rXubZtXAyNybg48ONUPTS4Y0it
	OLP1CsGed9/H0U3MwGW5YXa1RUdmgIe4FYzUoRJw=
Authentication-Results: smtp3m.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Fri, 10 Jun 2016 19:26:39 +0300
Message-Id: <1465575999-3594234-3-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.144
Subject: [Qemu-arm] [PATCH 2/2] Fix a confusing argument name in tlb_fill()
 function
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Sergey Sorokin <afarallax@yandex.ru>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8h2Q51cVF1bi

The function tlb_fill() is called with access type argument which is named
'is_write' in its declaration. The patch fixes the argument name
to avoid a confusion.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 include/exec/exec-all.h       |  2 +-
 target-alpha/mem_helper.c     |  4 ++--
 target-arm/op_helper.c        | 12 +++++++-----
 target-cris/op_helper.c       |  4 ++--
 target-i386/mem_helper.c      |  4 ++--
 target-lm32/op_helper.c       |  4 ++--
 target-m68k/op_helper.c       |  4 ++--
 target-microblaze/op_helper.c |  4 ++--
 target-mips/op_helper.c       |  4 ++--
 target-moxie/helper.c         |  4 ++--
 target-openrisc/mmu_helper.c  |  4 ++--
 target-ppc/mmu_helper.c       |  6 +++---
 target-s390x/mem_helper.c     |  4 ++--
 target-sh4/op_helper.c        |  4 ++--
 target-sparc/ldst_helper.c    |  4 ++--
 target-tricore/op_helper.c    |  4 ++--
 target-unicore32/op_helper.c  |  4 ++--
 target-xtensa/op_helper.c     |  7 ++++---
 18 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e076397..f425576 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -363,7 +363,7 @@ extern uintptr_t tci_tb_ptr;
 struct MemoryRegion *iotlb_to_region(CPUState *cpu,
                                      hwaddr index, MemTxAttrs attrs);
 
-void tlb_fill(CPUState *cpu, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cpu, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr);
 
 #endif
diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
index cfb4898..53fdae4 100644
--- a/target-alpha/mem_helper.c
+++ b/target-alpha/mem_helper.c
@@ -144,12 +144,12 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwaddr addr,
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
 
-    ret = alpha_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = alpha_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret != 0)) {
         if (retaddr) {
             cpu_restore_state(cs, retaddr);
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 04316b5..dd97760 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -117,14 +117,14 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     bool ret;
     uint32_t fsr = 0;
     ARMMMUFaultInfo fi = {};
 
-    ret = arm_tlb_fill(cs, addr, is_write, mmu_idx, &fsr, &fi);
+    ret = arm_tlb_fill(cs, addr, access_type, mmu_idx, &fsr, &fi);
     if (unlikely(ret)) {
         ARMCPU *cpu = ARM_CPU(cs);
         CPUARMState *env = &cpu->env;
@@ -149,13 +149,15 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
         /* For insn and data aborts we assume there is no instruction syndrome
          * information; this is always true for exceptions reported to EL1.
          */
-        if (is_write == 2) {
+        if (access_type == MMU_INST_FETCH) {
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
             syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                       same_el, fi.s1ptw, is_write == 1, syn);
-            if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
+                                       same_el, fi.s1ptw,
+                                       access_type == MMU_DATA_STORE, syn);
+            if (access_type == MMU_DATA_STORE
+                && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
             exc = EXCP_DATA_ABORT;
diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
index 675ab86..fbb71bc 100644
--- a/target-cris/op_helper.c
+++ b/target-cris/op_helper.c
@@ -41,7 +41,7 @@
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
@@ -50,7 +50,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
 
     D_LOG("%s pc=%x tpc=%x ra=%p\n", __func__,
           env->pc, env->pregs[PR_EDA], (void *)retaddr);
-    ret = cris_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = cris_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             /* now we have a real cpu fault */
diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
index c2f4769..b1ea08c 100644
--- a/target-i386/mem_helper.c
+++ b/target-i386/mem_helper.c
@@ -140,12 +140,12 @@ void helper_boundl(CPUX86State *env, target_ulong a0, int v)
  * from generated code or from helper.c)
  */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = x86_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = x86_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (ret) {
         X86CPU *cpu = X86_CPU(cs);
         CPUX86State *env = &cpu->env;
diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
index 7a550d1..5f29343 100644
--- a/target-lm32/op_helper.c
+++ b/target-lm32/op_helper.c
@@ -144,12 +144,12 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = lm32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = lm32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             /* now we have a real cpu fault */
diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
index ff32e35..12d942e 100644
--- a/target-m68k/op_helper.c
+++ b/target-m68k/op_helper.c
@@ -39,12 +39,12 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = m68k_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = m68k_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             /* now we have a real cpu fault */
diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
index 0533939..8bdd9f4 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -33,12 +33,12 @@
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = mb_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = mb_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             /* now we have a real cpu fault */
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index b5f1641..8f440e8 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2405,12 +2405,12 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     do_raise_exception_err(env, excp, error_code, retaddr);
 }
 
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = mips_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = mips_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (ret) {
         MIPSCPU *cpu = MIPS_CPU(cs);
         CPUMIPSState *env = &cpu->env;
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index d51e9b9..8097004 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -29,12 +29,12 @@
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = moxie_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = moxie_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             cpu_restore_state(cs, retaddr);
diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_helper.c
index c0658c3..37ea725 100644
--- a/target-openrisc/mmu_helper.c
+++ b/target-openrisc/mmu_helper.c
@@ -25,12 +25,12 @@
 
 #ifndef CONFIG_USER_ONLY
 
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
 
-    ret = openrisc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = openrisc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
 
     if (ret) {
         if (retaddr) {
diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
index 485d5b8..78179ee 100644
--- a/target-ppc/mmu_helper.c
+++ b/target-ppc/mmu_helper.c
@@ -2878,7 +2878,7 @@ void helper_check_tlb_flush(CPUPPCState *env)
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -2887,9 +2887,9 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
     int ret;
 
     if (pcc->handle_mmu_fault) {
-        ret = pcc->handle_mmu_fault(cpu, addr, is_write, mmu_idx);
+        ret = pcc->handle_mmu_fault(cpu, addr, access_type, mmu_idx);
     } else {
-        ret = cpu_ppc_handle_mmu_fault(env, addr, is_write, mmu_idx);
+        ret = cpu_ppc_handle_mmu_fault(env, addr, access_type, mmu_idx);
     }
     if (unlikely(ret != 0)) {
         if (likely(retaddr)) {
diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
index ec8059a..acc9eb9 100644
--- a/target-s390x/mem_helper.c
+++ b/target-s390x/mem_helper.c
@@ -36,12 +36,12 @@
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = s390_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = s390_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret != 0)) {
         if (likely(retaddr)) {
             /* now we have a real cpu fault */
diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
index 303e83e..49bd57a 100644
--- a/target-sh4/op_helper.c
+++ b/target-sh4/op_helper.c
@@ -24,12 +24,12 @@
 
 #ifndef CONFIG_USER_ONLY
 
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = superh_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = superh_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (ret) {
         /* now we have a real cpu fault */
         if (retaddr) {
diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
index f1cb821..bc60325 100644
--- a/target-sparc/ldst_helper.c
+++ b/target-sparc/ldst_helper.c
@@ -2442,12 +2442,12 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs,
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
 
-    ret = sparc_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = sparc_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (ret) {
         if (retaddr) {
             cpu_restore_state(cs, retaddr);
diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
index a73ed53..64337b7 100644
--- a/target-tricore/op_helper.c
+++ b/target-tricore/op_helper.c
@@ -2833,11 +2833,11 @@ static inline void QEMU_NORETURN do_raise_exception_err(CPUTriCoreState *env,
     cpu_loop_exit(cs);
 }
 
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type, int mmu_idx,
               uintptr_t retaddr)
 {
     int ret;
-    ret = cpu_tricore_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = cpu_tricore_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (ret) {
         TriCoreCPU *cpu = TRICORE_CPU(cs);
         CPUTriCoreState *env = &cpu->env;
diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_helper.c
index a782d33..2eadb81 100644
--- a/target-unicore32/op_helper.c
+++ b/target-unicore32/op_helper.c
@@ -244,12 +244,12 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *env, uint32_t x, uint32_t i)
 }
 
 #ifndef CONFIG_USER_ONLY
-void tlb_fill(CPUState *cs, target_ulong addr, int is_write,
+void tlb_fill(CPUState *cs, target_ulong addr, int access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
 
-    ret = uc32_cpu_handle_mmu_fault(cs, addr, is_write, mmu_idx);
+    ret = uc32_cpu_handle_mmu_fault(cs, addr, access_type, mmu_idx);
     if (unlikely(ret)) {
         if (retaddr) {
             /* now we have a real cpu fault */
diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
index 32dcbdf..e9aab6d 100644
--- a/target-xtensa/op_helper.c
+++ b/target-xtensa/op_helper.c
@@ -50,18 +50,19 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
 }
 
 void tlb_fill(CPUState *cs,
-              target_ulong vaddr, int is_write, int mmu_idx, uintptr_t retaddr)
+              target_ulong vaddr, int access_type,
+              int mmu_idx, uintptr_t retaddr)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
     uint32_t paddr;
     uint32_t page_size;
     unsigned access;
-    int ret = xtensa_get_physical_addr(env, true, vaddr, is_write, mmu_idx,
+    int ret = xtensa_get_physical_addr(env, true, vaddr, access_type, mmu_idx,
             &paddr, &page_size, &access);
 
     qemu_log_mask(CPU_LOG_MMU, "%s(%08x, %d, %d) -> %08x, ret = %d\n",
-                  __func__, vaddr, is_write, mmu_idx, paddr, ret);
+                  __func__, vaddr, access_type, mmu_idx, paddr, ret);
 
     if (ret == 0) {
         tlb_set_page(cs,
-- 
1.9.3

