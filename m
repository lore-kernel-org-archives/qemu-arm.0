Received: by 10.25.85.209 with SMTP id j200csp71061lfb;
        Fri, 10 Jun 2016 09:27:46 -0700 (PDT)
X-Received: by 10.141.1.86 with SMTP id c83mr2826376qhd.12.1465576066107;
        Fri, 10 Jun 2016 09:27:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si6712282qkn.82.2016.06.10.09.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:43290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPHd-0006mp-DP
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:27:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHQ-0006dP-VI
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1bBPHL-0007gT-NS
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 12:27:31 -0400
Received: from forward20m.cmail.yandex.net ([5.255.216.151]:41505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1bBPHK-0007fz-86; Fri, 10 Jun 2016 12:27:27 -0400
Received: from smtp3m.mail.yandex.net (smtp3m.mail.yandex.net
	[IPv6:2a02:6b8:0:2519::125])
	by forward20m.cmail.yandex.net (Yandex) with ESMTP id 692B12112B;
	Fri, 10 Jun 2016 19:27:07 +0300 (MSK)
Received: from smtp3m.mail.yandex.net (localhost [127.0.0.1])
	by smtp3m.mail.yandex.net (Yandex) with ESMTP id CBB7927A091F;
	Fri, 10 Jun 2016 19:27:04 +0300 (MSK)
Received: by smtp3m.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	700tofVhlY-R46W1p5k; Fri, 10 Jun 2016 19:27:04 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1465576024; bh=SE0HJqgBsorhbYNg4l2a85i9TkXE88ESL5gxMS5Lro0=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
	References;
	b=ln88H9O/a2kwrE6LCgoMqOYsC9B/E93PdmltZYkoWjQ2bx7Kp/Y6QGpTTEJJ1xC8l
	4nryrBzG1YhVRVi76A2TBzhcaaQVkZU2Ntk9lC4dyE/mov+phDImjqaE1DFpWwSFR/
	Zs5TD5yGEaMh0YHRMASSBE3ezXUENpvaZOsnRD/c=
Authentication-Results: smtp3m.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0,
	1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 0, 1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Fri, 10 Jun 2016 19:26:38 +0300
Message-Id: <1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 5.255.216.151
Subject: [Qemu-arm] [PATCH 1/2] Fix confusing argument names of
 do_unaligned_access() functions
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
X-TUID: jtQpUQPF1IDD

There are functions cpu_unaligned_access() and do_unaligned_access() that
are called with access type and mmu index arguments. But these arguments
are named 'is_write' and 'is_user' in their declarations.
The patch fixes the names to avoid a confusion.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 include/qom/cpu.h          |  8 ++++----
 target-alpha/cpu.h         |  4 ++--
 target-alpha/mem_helper.c  |  4 ++--
 target-arm/internals.h     |  4 ++--
 target-arm/op_helper.c     | 17 +++++++++--------
 target-mips/cpu.h          |  4 ++--
 target-mips/op_helper.c    |  2 +-
 target-sparc/cpu.h         |  5 +++--
 target-sparc/ldst_helper.c |  5 +++--
 target-xtensa/cpu.h        |  4 ++--
 target-xtensa/op_helper.c  |  3 ++-
 11 files changed, 32 insertions(+), 28 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 32f3af3..60985c2 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -141,8 +141,8 @@ typedef struct CPUClass {
     bool (*has_work)(CPUState *cpu);
     void (*do_interrupt)(CPUState *cpu);
     CPUUnassignedAccess do_unassigned_access;
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                int is_write, int is_user, uintptr_t retaddr);
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr, int access_type,
+                                int mmu_idx, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -716,12 +716,12 @@ static inline void cpu_unassigned_access(CPUState *cpu, hwaddr addr,
 }
 
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                        int is_write, int is_user,
+                                        int access_type, int mmu_idx,
                                         uintptr_t retaddr)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->do_unaligned_access(cpu, addr, is_write, is_user, retaddr);
+    cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
 #endif
 
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index e71ea70..4e512a2 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -322,8 +322,8 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   int is_write, int is_user, uintptr_t retaddr);
+void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr, int access_type,
+                                   int mmu_idx, uintptr_t retaddr);
 
 #define cpu_list alpha_cpu_list
 #define cpu_exec cpu_alpha_exec
diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
index 7f4d15f..cfb4898 100644
--- a/target-alpha/mem_helper.c
+++ b/target-alpha/mem_helper.c
@@ -98,8 +98,8 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env, uint64_t p, uint64_t v)
     return ret;
 }
 
-void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   int is_write, int is_user, uintptr_t retaddr)
+void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr, int access_type,
+                                   int mmu_idx, uintptr_t retaddr)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
     CPUAlphaState *env = &cpu->env;
diff --git a/target-arm/internals.h b/target-arm/internals.h
index 728ecba..6d469bf 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -476,7 +476,7 @@ bool arm_tlb_fill(CPUState *cpu, vaddr address, int rw, int mmu_idx,
 bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
 /* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
-                                 int is_user, uintptr_t retaddr);
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int access_type,
+                                 int mmu_idx, uintptr_t retaddr);
 
 #endif
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 35912a1..04316b5 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -79,7 +79,7 @@ uint32_t HELPER(neon_tbl)(CPUARMState *env, uint32_t ireg, uint32_t def,
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
                                             bool same_el,
-                                            bool s1ptw, int is_write,
+                                            bool s1ptw, bool is_write,
                                             int fsc)
 {
     uint32_t syn;
@@ -97,7 +97,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
      */
     if (!(template_syn & ARM_EL_ISV) || target_el != 2 || s1ptw) {
         syn = syn_data_abort_no_iss(same_el,
-                                    0, 0, s1ptw, is_write == 1, fsc);
+                                    0, 0, s1ptw, is_write, fsc);
     } else {
         /* Fields: IL, ISV, SAS, SSE, SRT, SF and AR come from the template
          * syndrome created at translation time.
@@ -105,7 +105,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
          */
         syn = syn_data_abort_with_iss(same_el,
                                       0, 0, 0, 0, 0,
-                                      0, 0, s1ptw, is_write == 1, fsc,
+                                      0, 0, s1ptw, is_write, fsc,
                                       false);
         /* Merge the runtime syndrome with the template syndrome.  */
         syn |= template_syn;
@@ -154,7 +154,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
             exc = EXCP_PREFETCH_ABORT;
         } else {
             syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                                       same_el, fi.s1ptw, is_write, syn);
+                                       same_el, fi.s1ptw, is_write == 1, syn);
             if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -168,8 +168,8 @@ void tlb_fill(CPUState *cs, target_ulong addr, int is_write, int mmu_idx,
 }
 
 /* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
-                                 int is_user, uintptr_t retaddr)
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int access_type,
+                                 int mmu_idx, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -196,12 +196,13 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
         env->exception.fsr = 0x1;
     }
 
-    if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
+    if (access_type == MMU_DATA_STORE && arm_feature(env, ARM_FEATURE_V6)) {
         env->exception.fsr |= (1 << 11);
     }
 
     syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                               same_el, 0, is_write, 0x21);
+                               same_el, 0, access_type == MMU_DATA_STORE,
+                               0x21);
     raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
 }
 
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 4ce9d47..ffd5baa 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -650,8 +650,8 @@ void mips_cpu_dump_state(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
 hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  int is_write, int is_user, uintptr_t retaddr);
+void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr, int access_type,
+                                  int mmu_idx, uintptr_t retaddr);
 
 #if !defined(CONFIG_USER_ONLY)
 int no_mmu_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index 7cf9807..b5f1641 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2383,7 +2383,7 @@ void helper_wait(CPUMIPSState *env)
 #if !defined(CONFIG_USER_ONLY)
 
 void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                  int access_type, int is_user,
+                                  int access_type, int mmu_idx,
                                   uintptr_t retaddr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index ba37f4b..48298d4 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -541,8 +541,9 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu,
-                                                 vaddr addr, int is_write,
-                                                 int is_user, uintptr_t retaddr);
+                                                 vaddr addr, int access_type,
+                                                 int mmu_idx,
+                                                 uintptr_t retaddr);
 
 #ifndef NO_CPU_IO_DEFS
 /* cpu_init.c */
diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
index f73cf6d..f1cb821 100644
--- a/target-sparc/ldst_helper.c
+++ b/target-sparc/ldst_helper.c
@@ -2421,8 +2421,9 @@ void sparc_cpu_unassigned_access(CPUState *cs, hwaddr addr,
 
 #if !defined(CONFIG_USER_ONLY)
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs,
-                                                 vaddr addr, int is_write,
-                                                 int is_user, uintptr_t retaddr)
+                                                 vaddr addr, int access_type,
+                                                 int mmu_idx,
+                                                 uintptr_t retaddr)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
index 442176a..4b05847 100644
--- a/target-xtensa/cpu.h
+++ b/target-xtensa/cpu.h
@@ -413,8 +413,8 @@ void xtensa_cpu_dump_state(CPUState *cpu, FILE *f,
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
-void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    int is_write, int is_user, uintptr_t retaddr);
+void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr, int access_type,
+                                    int mmu_idx, uintptr_t retaddr);
 
 #define cpu_exec cpu_xtensa_exec
 #define cpu_signal_handler cpu_xtensa_signal_handler
diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
index bc3667f..32dcbdf 100644
--- a/target-xtensa/op_helper.c
+++ b/target-xtensa/op_helper.c
@@ -35,7 +35,8 @@
 #include "qemu/timer.h"
 
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
-        vaddr addr, int is_write, int is_user, uintptr_t retaddr)
+        vaddr addr, int access_type,
+        int mmu_idx, uintptr_t retaddr)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
     CPUXtensaState *env = &cpu->env;
-- 
1.9.3

