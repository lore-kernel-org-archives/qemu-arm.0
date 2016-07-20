Received: by 10.25.21.156 with SMTP id 28csp1960503lfv;
        Tue, 19 Jul 2016 22:03:40 -0700 (PDT)
X-Received: by 10.66.146.69 with SMTP id ta5mr68124008pab.157.1468991019595;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d10si1260915pat.143.2016.07.19.22.03.39;
        Tue, 19 Jul 2016 22:03:39 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1751487AbcGTFDb (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 01:03:31 -0400
Received: from mail-pa0-f65.google.com ([209.85.220.65]:35370 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751061AbcGTFDX (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 01:03:23 -0400
Received: by mail-pa0-f65.google.com with SMTP id cf3so2560144pad.2
        for <kvm@vger.kernel.org>; Tue, 19 Jul 2016 22:03:23 -0700 (PDT)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XuKwa27F2+qYvnuD8XlQHHUfvjw6KgQdcpU++zsZQ9E=;
        b=tUmliYaXQpBFSCW8qJ+hu0QQazwDFrrPoa09Kkx7BeYgA20Lm/n7Ds2YZlFWec3yEH
         WHm2xR28k1iT9aWZPEQ8udbrxfsRIypvU0OEiZH+iDVy7Oz/pDoMhn/yEikMYzkON9jq
         lO+i7Fsy1lUq1H5RvM2F7/hI81Jnz+WHTstrkwctS1998Cx10s2jmfM1YN/YcnjBCPrQ
         14MLe7pg49rfa+r4odGmowqtHbfsR/Oa/GhGgDZvMN5Moqshm9uiMUx83RAyQ1R0xp3q
         /FU/BQCHew1HvfF9LYDoiHdeSs8k4HFdmZCFjLr7FSIScOxRdm0R32BhkweKIXQnyJmD
         X7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=XuKwa27F2+qYvnuD8XlQHHUfvjw6KgQdcpU++zsZQ9E=;
        b=hFys8SpTMfYNEP/tg1V4xUeEnvgm2+I10y9EmHivLoPhmNucouzjx6DxU1p7m9Qzvo
         jGvuDiyK+mY3IOfmyl8lec05TXC8hQtquSTnRSfq5M8Bbl+9RgzPR7zrkxDyuk9lYJNa
         jgUZst9cesplY/ok43dBci5VIgx5GMBsui9nupOpEJXBQYnZWfhtJ3lX+6eSOc/gT3oA
         aLCJbRcC0sL4Rgm5cIsfgDImzmstllz6wTTk+mXirzlKnxxnnNI2nLGh04AtQk9sL0mF
         rhdH/0Jmyoue8igK1RGuLNbD+QtXiMw7wH42ZpRLPARgzzONZpi/dg74rb5Y1u1PkdMa
         S7sw==
X-Gm-Message-State: ALyK8tLVYWWxpQa5Zf8xu8pZsyXqXAFT1qKk5AcI4IeN7IaHn2iZ0QLxgdWzRfHRlRRpJQ==
X-Received: by 10.66.158.170 with SMTP id wv10mr8892061pab.153.1468991002347;
        Tue, 19 Jul 2016 22:03:22 -0700 (PDT)
Received: from squirtle.localdomain.localdomain (c-73-225-163-254.hsd1.wa.comcast.net. [73.225.163.254])
        by smtp.gmail.com with ESMTPSA id c66sm1031757pfd.24.2016.07.19.22.03.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jul 2016 22:03:21 -0700 (PDT)
From:	Andrey Smirnov <andrew.smirnov@gmail.com>
To:	qemu-devel@nongnu.org
Cc:	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v3 05/10] Rename MMUAccessType to MemoryAccessType
Date:	Tue, 19 Jul 2016 22:02:55 -0700
Message-Id: <1468990980-4598-6-git-send-email-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: oo5z8FTOHQQD

Rename MMUAccessType to MemoryAccessType and MMU_*
constants to corresponding MEM_* constants, so it would be possible to
re-use these defenitions in other, non MMU-related, contexts.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 include/exec/exec-all.h       |  2 +-
 include/qom/cpu.h             | 14 +++++++-------
 softmmu_template.h            | 18 +++++++++---------
 target-alpha/cpu.h            |  2 +-
 target-alpha/mem_helper.c     |  4 ++--
 target-arm/internals.h        |  2 +-
 target-arm/op_helper.c        | 14 +++++++-------
 target-cris/op_helper.c       |  2 +-
 target-i386/mem_helper.c      |  2 +-
 target-lm32/op_helper.c       |  2 +-
 target-m68k/op_helper.c       |  2 +-
 target-microblaze/op_helper.c |  2 +-
 target-mips/cpu.h             |  2 +-
 target-mips/helper.c          | 14 +++++++-------
 target-mips/op_helper.c       |  8 ++++----
 target-moxie/helper.c         |  2 +-
 target-openrisc/mmu_helper.c  |  2 +-
 target-ppc/mmu_helper.c       |  2 +-
 target-s390x/helper.c         |  2 +-
 target-s390x/mem_helper.c     |  8 ++++----
 target-s390x/mmu_helper.c     | 10 +++++-----
 target-sh4/op_helper.c        |  2 +-
 target-sparc/cpu.h            |  2 +-
 target-sparc/ldst_helper.c    |  4 ++--
 target-tricore/op_helper.c    |  2 +-
 target-unicore32/op_helper.c  |  2 +-
 target-xtensa/cpu.h           |  2 +-
 target-xtensa/op_helper.c     |  4 ++--
 28 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index acda7b6..1d5c71e 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -361,7 +361,7 @@ extern uintptr_t tci_tb_ptr;
 struct MemoryRegion *iotlb_to_region(CPUState *cpu,
                                      hwaddr index, MemTxAttrs attrs);
 
-void tlb_fill(CPUState *cpu, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cpu, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr);
 
 #endif
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index a6c6ed8..b23b4b1 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -60,11 +60,11 @@ typedef uint64_t vaddr;
 #define CPU_CLASS(class) OBJECT_CLASS_CHECK(CPUClass, (class), TYPE_CPU)
 #define CPU_GET_CLASS(obj) OBJECT_GET_CLASS(CPUClass, (obj), TYPE_CPU)
 
-typedef enum MMUAccessType {
-    MMU_DATA_LOAD  = 0,
-    MMU_DATA_STORE = 1,
-    MMU_INST_FETCH = 2
-} MMUAccessType;
+typedef enum MemoryAccessType {
+    MEM_DATA_LOAD  = 0,
+    MEM_DATA_STORE = 1,
+    MEM_INST_FETCH = 2
+} MemoryAccessType;
 
 typedef struct CPUWatchpoint CPUWatchpoint;
 
@@ -148,7 +148,7 @@ typedef struct CPUClass {
     void (*do_interrupt)(CPUState *cpu);
     CPUUnassignedAccess do_unassigned_access;
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
+                                MemoryAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
@@ -723,7 +723,7 @@ static inline void cpu_unassigned_access(CPUState *cpu, hwaddr addr,
 }
 
 static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                        MMUAccessType access_type,
+                                        MemoryAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
diff --git a/softmmu_template.h b/softmmu_template.h
index 284ab2c..e872a21 100644
--- a/softmmu_template.h
+++ b/softmmu_template.h
@@ -67,10 +67,10 @@
 #endif
 
 #ifdef SOFTMMU_CODE_ACCESS
-#define READ_ACCESS_TYPE MMU_INST_FETCH
+#define READ_ACCESS_TYPE MEM_INST_FETCH
 #define ADDR_READ addr_code
 #else
-#define READ_ACCESS_TYPE MMU_DATA_LOAD
+#define READ_ACCESS_TYPE MEM_DATA_LOAD
 #define ADDR_READ addr_read
 #endif
 
@@ -338,7 +338,7 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     retaddr -= GETPC_ADJ;
 
     if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, MEM_DATA_STORE,
                              mmu_idx, retaddr);
     }
 
@@ -346,7 +346,7 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     if ((addr & TARGET_PAGE_MASK)
         != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
         if (!VICTIM_TLB_HIT(addr_write, addr)) {
-            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, retaddr);
+            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, retaddr);
         }
         tlb_addr = env->tlb_table[mmu_idx][index].addr_write;
     }
@@ -381,7 +381,7 @@ void helper_le_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
         tlb_addr2 = env->tlb_table[mmu_idx][index2].addr_write;
         if (page2 != (tlb_addr2 & (TARGET_PAGE_MASK | TLB_INVALID_MASK))
             && !VICTIM_TLB_HIT(addr_write, page2)) {
-            tlb_fill(ENV_GET_CPU(env), page2, MMU_DATA_STORE,
+            tlb_fill(ENV_GET_CPU(env), page2, MEM_DATA_STORE,
                      mmu_idx, retaddr);
         }
 
@@ -421,7 +421,7 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     retaddr -= GETPC_ADJ;
 
     if (a_bits > 0 && (addr & ((1 << a_bits) - 1)) != 0) {
-        cpu_unaligned_access(ENV_GET_CPU(env), addr, MMU_DATA_STORE,
+        cpu_unaligned_access(ENV_GET_CPU(env), addr, MEM_DATA_STORE,
                              mmu_idx, retaddr);
     }
 
@@ -429,7 +429,7 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
     if ((addr & TARGET_PAGE_MASK)
         != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
         if (!VICTIM_TLB_HIT(addr_write, addr)) {
-            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, retaddr);
+            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, retaddr);
         }
         tlb_addr = env->tlb_table[mmu_idx][index].addr_write;
     }
@@ -464,7 +464,7 @@ void helper_be_st_name(CPUArchState *env, target_ulong addr, DATA_TYPE val,
         tlb_addr2 = env->tlb_table[mmu_idx][index2].addr_write;
         if (page2 != (tlb_addr2 & (TARGET_PAGE_MASK | TLB_INVALID_MASK))
             && !VICTIM_TLB_HIT(addr_write, page2)) {
-            tlb_fill(ENV_GET_CPU(env), page2, MMU_DATA_STORE,
+            tlb_fill(ENV_GET_CPU(env), page2, MEM_DATA_STORE,
                      mmu_idx, retaddr);
         }
 
@@ -504,7 +504,7 @@ void probe_write(CPUArchState *env, target_ulong addr, int mmu_idx,
         != (tlb_addr & (TARGET_PAGE_MASK | TLB_INVALID_MASK))) {
         /* TLB entry is for a different page */
         if (!VICTIM_TLB_HIT(addr_write, addr)) {
-            tlb_fill(ENV_GET_CPU(env), addr, MMU_DATA_STORE, mmu_idx, retaddr);
+            tlb_fill(ENV_GET_CPU(env), addr, MEM_DATA_STORE, mmu_idx, retaddr);
         }
     }
 }
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index ac5e801..700f616 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -323,7 +323,7 @@ hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                   MMUAccessType access_type,
+                                   MemoryAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr);
 
 #define cpu_list alpha_cpu_list
diff --git a/target-alpha/mem_helper.c b/target-alpha/mem_helper.c
index 1b2be50..d6ffabe 100644
--- a/target-alpha/mem_helper.c
+++ b/target-alpha/mem_helper.c
@@ -99,7 +99,7 @@ uint64_t helper_stq_c_phys(CPUAlphaState *env, uint64_t p, uint64_t v)
 }
 
 void alpha_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type,
+                                   MemoryAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr)
 {
     AlphaCPU *cpu = ALPHA_CPU(cs);
@@ -145,7 +145,7 @@ void alpha_cpu_unassigned_access(CPUState *cs, hwaddr addr,
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-arm/internals.h b/target-arm/internals.h
index cd57401..d6fafc5 100644
--- a/target-arm/internals.h
+++ b/target-arm/internals.h
@@ -477,7 +477,7 @@ bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
 
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
+                                 MemoryAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr);
 
 /* Call the EL change hook if one has been registered */
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 3e8588e..74526a2 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -117,7 +117,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     bool ret;
@@ -149,14 +149,14 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
         /* For insn and data aborts we assume there is no instruction syndrome
          * information; this is always true for exceptions reported to EL1.
          */
-        if (access_type == MMU_INST_FETCH) {
+        if (access_type == MEM_INST_FETCH) {
             syn = syn_insn_abort(same_el, 0, fi.s1ptw, syn);
             exc = EXCP_PREFETCH_ABORT;
         } else {
             syn = merge_syn_data_abort(env->exception.syndrome, target_el,
                                        same_el, fi.s1ptw,
-                                       access_type == MMU_DATA_STORE, syn);
-            if (access_type == MMU_DATA_STORE
+                                       access_type == MEM_DATA_STORE, syn);
+            if (access_type == MEM_DATA_STORE
                 && arm_feature(env, ARM_FEATURE_V6)) {
                 fsr |= (1 << 11);
             }
@@ -171,7 +171,7 @@ void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
 
 /* Raise a data fault alignment exception for the specified virtual address */
 void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
+                                 MemoryAccessType access_type,
                                  int mmu_idx, uintptr_t retaddr)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -199,12 +199,12 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
         env->exception.fsr = 0x1;
     }
 
-    if (access_type == MMU_DATA_STORE && arm_feature(env, ARM_FEATURE_V6)) {
+    if (access_type == MEM_DATA_STORE && arm_feature(env, ARM_FEATURE_V6)) {
         env->exception.fsr |= (1 << 11);
     }
 
     syn = merge_syn_data_abort(env->exception.syndrome, target_el,
-                               same_el, 0, access_type == MMU_DATA_STORE,
+                               same_el, 0, access_type == MEM_DATA_STORE,
                                0x21);
     raise_exception(env, EXCP_DATA_ABORT, syn, target_el);
 }
diff --git a/target-cris/op_helper.c b/target-cris/op_helper.c
index 5043039..c83e955 100644
--- a/target-cris/op_helper.c
+++ b/target-cris/op_helper.c
@@ -41,7 +41,7 @@
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     CRISCPU *cpu = CRIS_CPU(cs);
diff --git a/target-i386/mem_helper.c b/target-i386/mem_helper.c
index 5bc0594..679322c 100644
--- a/target-i386/mem_helper.c
+++ b/target-i386/mem_helper.c
@@ -140,7 +140,7 @@ void helper_boundl(CPUX86State *env, target_ulong a0, int v)
  * from generated code or from helper.c)
  */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-lm32/op_helper.c b/target-lm32/op_helper.c
index 2177c8a..bc78f3c 100644
--- a/target-lm32/op_helper.c
+++ b/target-lm32/op_helper.c
@@ -144,7 +144,7 @@ uint32_t HELPER(rcsr_jrx)(CPULM32State *env)
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-m68k/op_helper.c b/target-m68k/op_helper.c
index e41ae46..43f556e 100644
--- a/target-m68k/op_helper.c
+++ b/target-m68k/op_helper.c
@@ -39,7 +39,7 @@ static inline void do_interrupt_m68k_hardirq(CPUM68KState *env)
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-microblaze/op_helper.c b/target-microblaze/op_helper.c
index 4a856e6..1e1690a 100644
--- a/target-microblaze/op_helper.c
+++ b/target-microblaze/op_helper.c
@@ -33,7 +33,7 @@
  * NULL, it means that the function was called in C code (i.e. not
  * from generated code or from helper.c)
  */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 5182dc7..55a3e34 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -657,7 +657,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int mips_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int mips_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                  MMUAccessType access_type,
+                                  MemoryAccessType access_type,
                                   int mmu_idx, uintptr_t retaddr);
 
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target-mips/helper.c b/target-mips/helper.c
index 9fbca26..bd3f7cd 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -88,13 +88,13 @@ int r4k_map_address (CPUMIPSState *env, hwaddr *physical, int *prot,
             if (!(n ? tlb->V1 : tlb->V0)) {
                 return TLBRET_INVALID;
             }
-            if (rw == MMU_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
+            if (rw == MEM_INST_FETCH && (n ? tlb->XI1 : tlb->XI0)) {
                 return TLBRET_XI;
             }
-            if (rw == MMU_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
+            if (rw == MEM_DATA_LOAD && (n ? tlb->RI1 : tlb->RI0)) {
                 return TLBRET_RI;
             }
-            if (rw != MMU_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
+            if (rw != MEM_DATA_STORE || (n ? tlb->D1 : tlb->D0)) {
                 *physical = tlb->PFN[n] | (address & (mask >> 1));
                 *prot = PAGE_READ;
                 if (n ? tlb->D1 : tlb->D0)
@@ -338,7 +338,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     CPUState *cs = CPU(mips_env_get_cpu(env));
     int exception = 0, error_code = 0;
 
-    if (rw == MMU_INST_FETCH) {
+    if (rw == MEM_INST_FETCH) {
         error_code |= EXCP_INST_NOTAVAIL;
     }
 
@@ -347,7 +347,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
     case TLBRET_BADADDR:
         /* Reference to kernel address from user mode or supervisor mode */
         /* Reference to supervisor address from user mode */
-        if (rw == MMU_DATA_STORE) {
+        if (rw == MEM_DATA_STORE) {
             exception = EXCP_AdES;
         } else {
             exception = EXCP_AdEL;
@@ -355,7 +355,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_NOMATCH:
         /* No TLB match for a mapped address */
-        if (rw == MMU_DATA_STORE) {
+        if (rw == MEM_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
@@ -364,7 +364,7 @@ static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
         break;
     case TLBRET_INVALID:
         /* TLB match with no valid bit */
-        if (rw == MMU_DATA_STORE) {
+        if (rw == MEM_DATA_STORE) {
             exception = EXCP_TLBS;
         } else {
             exception = EXCP_TLBL;
diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index ea2f2ab..dd705f2 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2384,7 +2384,7 @@ void helper_wait(CPUMIPSState *env)
 #if !defined(CONFIG_USER_ONLY)
 
 void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                  MMUAccessType access_type,
+                                  MemoryAccessType access_type,
                                   int mmu_idx, uintptr_t retaddr)
 {
     MIPSCPU *cpu = MIPS_CPU(cs);
@@ -2394,11 +2394,11 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     env->CP0_BadVAddr = addr;
 
-    if (access_type == MMU_DATA_STORE) {
+    if (access_type == MEM_DATA_STORE) {
         excp = EXCP_AdES;
     } else {
         excp = EXCP_AdEL;
-        if (access_type == MMU_INST_FETCH) {
+        if (access_type == MEM_INST_FETCH) {
             error_code |= EXCP_INST_NOTAVAIL;
         }
     }
@@ -2406,7 +2406,7 @@ void mips_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     do_raise_exception_err(env, excp, error_code, retaddr);
 }
 
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 330299f..a7b7b08 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -29,7 +29,7 @@
 /* Try to fill the TLB and return an exception if error. If retaddr is
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-openrisc/mmu_helper.c b/target-openrisc/mmu_helper.c
index a44d0aa..e26116c 100644
--- a/target-openrisc/mmu_helper.c
+++ b/target-openrisc/mmu_helper.c
@@ -25,7 +25,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-ppc/mmu_helper.c b/target-ppc/mmu_helper.c
index 3eb3cd7..be436c1 100644
--- a/target-ppc/mmu_helper.c
+++ b/target-ppc/mmu_helper.c
@@ -2878,7 +2878,7 @@ void helper_check_tlb_flush(CPUPPCState *env)
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
diff --git a/target-s390x/helper.c b/target-s390x/helper.c
index 54a5177..136c6be 100644
--- a/target-s390x/helper.c
+++ b/target-s390x/helper.c
@@ -199,7 +199,7 @@ hwaddr s390_cpu_get_phys_page_debug(CPUState *cs, vaddr vaddr)
         vaddr &= 0x7fffffff;
     }
 
-    if (mmu_translate(env, vaddr, MMU_INST_FETCH, asc, &raddr, &prot, false)) {
+    if (mmu_translate(env, vaddr, MEM_INST_FETCH, asc, &raddr, &prot, false)) {
         return -1;
     }
     return raddr;
diff --git a/target-s390x/mem_helper.c b/target-s390x/mem_helper.c
index 99bc5e2..c56cfa0 100644
--- a/target-s390x/mem_helper.c
+++ b/target-s390x/mem_helper.c
@@ -36,7 +36,7 @@
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
@@ -77,7 +77,7 @@ static void fast_memset(CPUS390XState *env, uint64_t dest, uint8_t byte,
     int mmu_idx = cpu_mmu_index(env, false);
 
     while (l > 0) {
-        void *p = tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, mmu_idx);
+        void *p = tlb_vaddr_to_host(env, dest, MEM_DATA_STORE, mmu_idx);
         if (p) {
             /* Access to the whole page in write mode granted.  */
             int l_adj = adj_len_to_page(l, dest);
@@ -100,8 +100,8 @@ static void fast_memmove(CPUS390XState *env, uint64_t dest, uint64_t src,
     int mmu_idx = cpu_mmu_index(env, false);
 
     while (l > 0) {
-        void *src_p = tlb_vaddr_to_host(env, src, MMU_DATA_LOAD, mmu_idx);
-        void *dest_p = tlb_vaddr_to_host(env, dest, MMU_DATA_STORE, mmu_idx);
+        void *src_p = tlb_vaddr_to_host(env, src, MEM_DATA_LOAD, mmu_idx);
+        void *dest_p = tlb_vaddr_to_host(env, dest, MEM_DATA_STORE, mmu_idx);
         if (src_p && dest_p) {
             /* Access to both whole pages granted.  */
             int l_adj = adj_len_to_page(l, src);
diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
index b11a027..5324dfb 100644
--- a/target-s390x/mmu_helper.c
+++ b/target-s390x/mmu_helper.c
@@ -71,7 +71,7 @@ static void trigger_prot_fault(CPUS390XState *env, target_ulong vaddr,
 {
     uint64_t tec;
 
-    tec = vaddr | (rw == MMU_DATA_STORE ? FS_WRITE : FS_READ) | 4 | asc >> 46;
+    tec = vaddr | (rw == MEM_DATA_STORE ? FS_WRITE : FS_READ) | 4 | asc >> 46;
 
     DPRINTF("%s: trans_exc_code=%016" PRIx64 "\n", __func__, tec);
 
@@ -88,7 +88,7 @@ static void trigger_page_fault(CPUS390XState *env, target_ulong vaddr,
     int ilen = ILEN_LATER;
     uint64_t tec;
 
-    tec = vaddr | (rw == MMU_DATA_STORE ? FS_WRITE : FS_READ) | asc >> 46;
+    tec = vaddr | (rw == MEM_DATA_STORE ? FS_WRITE : FS_READ) | asc >> 46;
 
     DPRINTF("%s: trans_exc_code=%016" PRIx64 "\n", __func__, tec);
 
@@ -97,7 +97,7 @@ static void trigger_page_fault(CPUS390XState *env, target_ulong vaddr,
     }
 
     /* Code accesses have an undefined ilc.  */
-    if (rw == MMU_INST_FETCH) {
+    if (rw == MEM_INST_FETCH) {
         ilen = 2;
     }
 
@@ -291,7 +291,7 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
 
     r = mmu_translate_region(env, vaddr, asc, asce, level, raddr, flags, rw,
                              exc);
-    if (rw == MMU_DATA_STORE && !(*flags & PAGE_WRITE)) {
+    if (rw == MEM_DATA_STORE && !(*flags & PAGE_WRITE)) {
         trigger_prot_fault(env, vaddr, asc, rw, exc);
         return -1;
     }
@@ -348,7 +348,7 @@ int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
          * Instruction: Primary
          * Data: Secondary
          */
-        if (rw == MMU_INST_FETCH) {
+        if (rw == MEM_INST_FETCH) {
             r = mmu_translate_asce(env, vaddr, PSW_ASC_PRIMARY, env->cregs[1],
                                    raddr, flags, rw, exc);
             *flags &= ~(PAGE_READ | PAGE_WRITE);
diff --git a/target-sh4/op_helper.c b/target-sh4/op_helper.c
index 0204b03..b00addd 100644
--- a/target-sh4/op_helper.c
+++ b/target-sh4/op_helper.c
@@ -24,7 +24,7 @@
 
 #ifndef CONFIG_USER_ONLY
 
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index a3d64a4..5134f1d 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -541,7 +541,7 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int sparc_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                                 MMUAccessType access_type,
+                                                 MemoryAccessType access_type,
                                                  int mmu_idx,
                                                  uintptr_t retaddr);
 
diff --git a/target-sparc/ldst_helper.c b/target-sparc/ldst_helper.c
index 6ce5ccc..042227c 100644
--- a/target-sparc/ldst_helper.c
+++ b/target-sparc/ldst_helper.c
@@ -2351,7 +2351,7 @@ void sparc_cpu_unassigned_access(CPUState *cs, hwaddr addr,
 
 #if !defined(CONFIG_USER_ONLY)
 void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                                 MMUAccessType access_type,
+                                                 MemoryAccessType access_type,
                                                  int mmu_idx,
                                                  uintptr_t retaddr)
 {
@@ -2372,7 +2372,7 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
    NULL, it means that the function was called in C code (i.e. not
    from generated code or from helper.c) */
 /* XXX: fix it to restore all registers */
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-tricore/op_helper.c b/target-tricore/op_helper.c
index ac02e0a..ead24e7 100644
--- a/target-tricore/op_helper.c
+++ b/target-tricore/op_helper.c
@@ -2828,7 +2828,7 @@ static inline void QEMU_NORETURN do_raise_exception_err(CPUTriCoreState *env,
     cpu_loop_exit(cs);
 }
 
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-unicore32/op_helper.c b/target-unicore32/op_helper.c
index 0872c29..1927efe 100644
--- a/target-unicore32/op_helper.c
+++ b/target-unicore32/op_helper.c
@@ -244,7 +244,7 @@ uint32_t HELPER(ror_cc)(CPUUniCore32State *env, uint32_t x, uint32_t i)
 }
 
 #ifndef CONFIG_USER_ONLY
-void tlb_fill(CPUState *cs, target_ulong addr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong addr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     int ret;
diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
index 7fe82a3..22c4471 100644
--- a/target-xtensa/cpu.h
+++ b/target-xtensa/cpu.h
@@ -414,7 +414,7 @@ hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int xtensa_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
-                                    MMUAccessType access_type,
+                                    MemoryAccessType access_type,
                                     int mmu_idx, uintptr_t retaddr);
 
 #define cpu_signal_handler cpu_xtensa_signal_handler
diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
index 0a4b214..11e0432 100644
--- a/target-xtensa/op_helper.c
+++ b/target-xtensa/op_helper.c
@@ -35,7 +35,7 @@
 #include "qemu/timer.h"
 
 void xtensa_cpu_do_unaligned_access(CPUState *cs,
-        vaddr addr, MMUAccessType access_type,
+        vaddr addr, MemoryAccessType access_type,
         int mmu_idx, uintptr_t retaddr)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
@@ -49,7 +49,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
     }
 }
 
-void tlb_fill(CPUState *cs, target_ulong vaddr, MMUAccessType access_type,
+void tlb_fill(CPUState *cs, target_ulong vaddr, MemoryAccessType access_type,
               int mmu_idx, uintptr_t retaddr)
 {
     XtensaCPU *cpu = XTENSA_CPU(cs);
-- 
2.5.5

