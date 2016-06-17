Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t1sm49624710wjy.3.2016.06.17.09.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 09:33:53 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id A40443E03F5;
	Fri, 17 Jun 2016 17:33:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org,
	bobby.prani@gmail.com
Cc: mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC 1/7] cpu: move break/watchpoints into arrays.
Date: Fri, 17 Jun 2016 17:33:41 +0100
Message-Id: <1466181227-14934-2-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nDPvfnCDTZCb

Before we can protect the lists we need a structure a little more
amenable to RCU protection. This moves all the lists into a re-sizeable
array. The array still only points to allocated structures because a
number of the architectures still need to look at the results of a hit
by examining the field.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 cpu-exec.c                 |   6 +-
 exec.c                     | 167 ++++++++++++++++++++++++++++++---------------
 include/qom/cpu.h          |  22 +++---
 linux-user/main.c          |  22 +++---
 qom/cpu.c                  |   2 -
 target-arm/translate-a64.c |   6 +-
 target-arm/translate.c     |   6 +-
 target-i386/bpt_helper.c   |   6 +-
 target-lm32/helper.c       |   6 +-
 9 files changed, 157 insertions(+), 86 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index b840e1d..2b49337 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -388,9 +388,11 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUWatchpoint *wp;
+    int i;
 
-    if (!cpu->watchpoint_hit) {
-        QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+    if (!cpu->watchpoint_hit && cpu->watchpoints) {
+        for (i = 0; i < cpu->watchpoints->len; i++) {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
             wp->flags &= ~BP_WATCHPOINT_HIT;
         }
     }
diff --git a/exec.c b/exec.c
index 0122ef7..e73c909 100644
--- a/exec.c
+++ b/exec.c
@@ -769,17 +769,22 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
                      VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
         return -EINVAL;
     }
-    wp = g_malloc(sizeof(*wp));
 
+    /* Allocate if no previous watchpoints */
+    if (!cpu->watchpoints) {
+        cpu->watchpoints = g_array_new(false, false, sizeof(CPUWatchpoint *));
+    }
+
+    wp = g_malloc(sizeof(*wp));
     wp->vaddr = addr;
     wp->len = len;
     wp->flags = flags;
 
     /* keep all GDB-injected watchpoints in front */
     if (flags & BP_GDB) {
-        QTAILQ_INSERT_HEAD(&cpu->watchpoints, wp, entry);
+        g_array_prepend_val(cpu->watchpoints, wp);
     } else {
-        QTAILQ_INSERT_TAIL(&cpu->watchpoints, wp, entry);
+        g_array_append_val(cpu->watchpoints, wp);
     }
 
     tlb_flush_page(cpu, addr);
@@ -794,13 +799,17 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
                           int flags)
 {
     CPUWatchpoint *wp;
+    int i = 0;
 
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (addr == wp->vaddr && len == wp->len
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        do {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            if (wp && addr == wp->vaddr && len == wp->len
                 && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
-            cpu_watchpoint_remove_by_ref(cpu, wp);
-            return 0;
-        }
+                cpu_watchpoint_remove_by_ref(cpu, wp);
+                return 0;
+            }
+        } while (i++ < cpu->watchpoints->len);
     }
     return -ENOENT;
 }
@@ -808,7 +817,18 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
 /* Remove a specific watchpoint by reference.  */
 void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
 {
-    QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
+    CPUWatchpoint *wp;
+    int i;
+
+    g_assert(cpu->watchpoints);
+
+    for (i = 0; i < cpu->watchpoints->len; i++) {
+        wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+        if (wp == watchpoint) {
+            g_array_remove_index_fast(cpu->watchpoints, i);
+            break;
+        }
+    }
 
     tlb_flush_page(cpu, watchpoint->vaddr);
 
@@ -818,11 +838,15 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
 /* Remove all matching watchpoints.  */
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
-    CPUWatchpoint *wp, *next;
+    CPUWatchpoint *wp;
+    int i;
 
-    QTAILQ_FOREACH_SAFE(wp, &cpu->watchpoints, entry, next) {
-        if (wp->flags & mask) {
-            cpu_watchpoint_remove_by_ref(cpu, wp);
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        for (i = cpu->watchpoints->len; i == 0; i--) {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            if (wp->flags & mask) {
+                cpu_watchpoint_remove_by_ref(cpu, wp);
+            }
         }
     }
 }
@@ -855,6 +879,11 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 {
     CPUBreakpoint *bp;
 
+    /* Allocate if no previous breakpoints */
+    if (!cpu->breakpoints) {
+        cpu->breakpoints = g_array_new(false, false, sizeof(CPUBreakpoint *));
+    }
+
     bp = g_malloc(sizeof(*bp));
 
     bp->pc = pc;
@@ -862,9 +891,9 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 
     /* keep all GDB-injected breakpoints in front */
     if (flags & BP_GDB) {
-        QTAILQ_INSERT_HEAD(&cpu->breakpoints, bp, entry);
+        g_array_prepend_val(cpu->breakpoints, bp);
     } else {
-        QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
+        g_array_append_val(cpu->breakpoints, bp);
     }
 
     breakpoint_invalidate(cpu, pc);
@@ -879,8 +908,12 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 {
     CPUBreakpoint *bp;
+    int i;
+
+    g_assert(cpu->breakpoints);
 
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+    for (i = 0; i < cpu->breakpoints->len; i++) {
+        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
         if (bp->pc == pc && bp->flags == flags) {
             cpu_breakpoint_remove_by_ref(cpu, bp);
             return 0;
@@ -892,7 +925,16 @@ int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 /* Remove a specific breakpoint by reference.  */
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint)
 {
-    QTAILQ_REMOVE(&cpu->breakpoints, breakpoint, entry);
+    CPUBreakpoint *bp;
+    int i;
+
+    for (i = 0; i < cpu->breakpoints->len; i++) {
+        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+        if (bp == breakpoint) {
+            g_array_remove_index_fast(cpu->breakpoints, i);
+            break;
+        }
+    }
 
     breakpoint_invalidate(cpu, breakpoint->pc);
 
@@ -902,11 +944,15 @@ void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint)
 /* Remove all matching breakpoints. */
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
 {
-    CPUBreakpoint *bp, *next;
+    CPUBreakpoint *bp;
+    int i;
 
-    QTAILQ_FOREACH_SAFE(bp, &cpu->breakpoints, entry, next) {
-        if (bp->flags & mask) {
-            cpu_breakpoint_remove_by_ref(cpu, bp);
+    if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
+        for (i = cpu->breakpoints->len; i == 0; i--) {
+            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            if (bp->flags & mask) {
+                cpu_breakpoint_remove_by_ref(cpu, bp);
+            }
         }
     }
 }
@@ -1068,7 +1114,6 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
                                        target_ulong *address)
 {
     hwaddr iotlb;
-    CPUWatchpoint *wp;
 
     if (memory_region_is_ram(section->mr)) {
         /* Normal RAM.  */
@@ -1088,13 +1133,18 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
 
     /* Make accesses to pages with watchpoints go via the
        watchpoint trap routines.  */
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (cpu_watchpoint_address_matches(wp, vaddr, TARGET_PAGE_SIZE)) {
-            /* Avoid trapping reads of pages with a write breakpoint. */
-            if ((prot & PAGE_WRITE) || (wp->flags & BP_MEM_READ)) {
-                iotlb = PHYS_SECTION_WATCH + paddr;
-                *address |= TLB_MMIO;
-                break;
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        CPUWatchpoint *wp;
+        int i;
+        for (i = 0; i < cpu->watchpoints->len; i++) {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            if (cpu_watchpoint_address_matches(wp, vaddr, TARGET_PAGE_SIZE)) {
+                /* Avoid trapping reads of pages with a write breakpoint. */
+                if ((prot & PAGE_WRITE) || (wp->flags & BP_MEM_READ)) {
+                    iotlb = PHYS_SECTION_WATCH + paddr;
+                    *address |= TLB_MMIO;
+                    break;
+                }
             }
         }
     }
@@ -2055,7 +2105,6 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
     CPUArchState *env = cpu->env_ptr;
     target_ulong pc, cs_base;
     target_ulong vaddr;
-    CPUWatchpoint *wp;
     uint32_t cpu_flags;
 
     if (cpu->watchpoint_hit) {
@@ -2066,35 +2115,41 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
         return;
     }
     vaddr = (cpu->mem_io_vaddr & TARGET_PAGE_MASK) + offset;
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (cpu_watchpoint_address_matches(wp, vaddr, len)
-            && (wp->flags & flags)) {
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
-            wp->hitaddr = vaddr;
-            wp->hitattrs = attrs;
-            if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU &&
-                    !cc->debug_check_watchpoint(cpu, wp)) {
-                    wp->flags &= ~BP_WATCHPOINT_HIT;
-                    continue;
-                }
-                cpu->watchpoint_hit = wp;
-                tb_check_watchpoint(cpu);
-                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                    cpu->exception_index = EXCP_DEBUG;
-                    cpu_loop_exit(cpu);
+
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        CPUWatchpoint *wp;
+        int i;
+        for (i = 0; i < cpu->watchpoints->len; i++) {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            if (cpu_watchpoint_address_matches(wp, vaddr, len)
+                && (wp->flags & flags)) {
+                if (flags == BP_MEM_READ) {
+                    wp->flags |= BP_WATCHPOINT_HIT_READ;
                 } else {
-                    cpu_get_tb_cpu_state(env, &pc, &cs_base, &cpu_flags);
-                    tb_gen_code(cpu, pc, cs_base, cpu_flags, 1);
-                    cpu_loop_exit_noexc(cpu);
+                    wp->flags |= BP_WATCHPOINT_HIT_WRITE;
+                }
+                wp->hitaddr = vaddr;
+                wp->hitattrs = attrs;
+                if (!cpu->watchpoint_hit) {
+                    if (wp->flags & BP_CPU &&
+                        !cc->debug_check_watchpoint(cpu, wp)) {
+                        wp->flags &= ~BP_WATCHPOINT_HIT;
+                        continue;
+                    }
+                    cpu->watchpoint_hit = wp;
+                    tb_check_watchpoint(cpu);
+                    if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                        cpu->exception_index = EXCP_DEBUG;
+                        cpu_loop_exit(cpu);
+                    } else {
+                        cpu_get_tb_cpu_state(env, &pc, &cs_base, &cpu_flags);
+                        tb_gen_code(cpu, pc, cs_base, cpu_flags, 1);
+                        cpu_loop_exit_noexc(cpu);
+                    }
                 }
+            } else {
+                wp->flags &= ~BP_WATCHPOINT_HIT;
             }
-        } else {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
         }
     }
 }
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 32f3af3..820a56d 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -204,7 +204,6 @@ typedef struct icount_decr_u16 {
 typedef struct CPUBreakpoint {
     vaddr pc;
     int flags; /* BP_* */
-    QTAILQ_ENTRY(CPUBreakpoint) entry;
 } CPUBreakpoint;
 
 struct CPUWatchpoint {
@@ -213,7 +212,6 @@ struct CPUWatchpoint {
     vaddr hitaddr;
     MemTxAttrs hitattrs;
     int flags; /* BP_* */
-    QTAILQ_ENTRY(CPUWatchpoint) entry;
 };
 
 struct KVMState;
@@ -321,10 +319,13 @@ struct CPUState {
     int gdb_num_g_regs;
     QTAILQ_ENTRY(CPUState) node;
 
-    /* ice debug support */
-    QTAILQ_HEAD(breakpoints_head, CPUBreakpoint) breakpoints;
-
-    QTAILQ_HEAD(watchpoints_head, CPUWatchpoint) watchpoints;
+    /* Debugging support:
+     *
+     * Both the gdbstub and architectural debug support will add
+     * references to these arrays.
+     */
+    GArray *breakpoints;
+    GArray *watchpoints;
     CPUWatchpoint *watchpoint_hit;
 
     void *opaque;
@@ -823,10 +824,11 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mask);
 /* Return true if PC matches an installed breakpoint.  */
 static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
 {
-    CPUBreakpoint *bp;
-
-    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+    if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
+        CPUBreakpoint *bp;
+        int i;
+        for (i = 0; i < cpu->breakpoints->len; i++) {
+            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
             if (bp->pc == pc && (bp->flags & mask)) {
                 return true;
             }
diff --git a/linux-user/main.c b/linux-user/main.c
index b9a4e0e..84a1ede 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3802,8 +3802,6 @@ CPUArchState *cpu_copy(CPUArchState *env)
     CPUState *cpu = ENV_GET_CPU(env);
     CPUState *new_cpu = cpu_init(cpu_model);
     CPUArchState *new_env = new_cpu->env_ptr;
-    CPUBreakpoint *bp;
-    CPUWatchpoint *wp;
 
     /* Reset non arch specific state */
     cpu_reset(new_cpu);
@@ -3813,13 +3811,21 @@ CPUArchState *cpu_copy(CPUArchState *env)
     /* Clone all break/watchpoints.
        Note: Once we support ptrace with hw-debug register access, make sure
        BP_CPU break/watchpoints are handled correctly on clone. */
-    QTAILQ_INIT(&new_cpu->breakpoints);
-    QTAILQ_INIT(&new_cpu->watchpoints);
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+    if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
+        CPUBreakpoint *bp;
+        int i;
+        for (i = 0; i < cpu->breakpoints->len; i++) {
+            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+        }
     }
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        CPUWatchpoint *wp;
+        int i;
+        for (i = 0; i < cpu->watchpoints->len; i++) {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
+        }
     }
 
     return new_env;
diff --git a/qom/cpu.c b/qom/cpu.c
index 751e992..7943194 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -328,8 +328,6 @@ static void cpu_common_initfn(Object *obj)
     cpu->cpu_index = -1;
     cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
     qemu_mutex_init(&cpu->work_mutex);
-    QTAILQ_INIT(&cpu->breakpoints);
-    QTAILQ_INIT(&cpu->watchpoints);
 }
 
 static void cpu_common_finalize(Object *obj)
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index f5e29d2..597e973 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11201,9 +11201,11 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
         tcg_gen_insn_start(dc->pc, 0, 0);
         num_insns++;
 
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
+        if (unlikely(cs->breakpoints) && unlikely(cs->breakpoints->len)) {
             CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+            int i;
+            for (i = 0; i < cs->breakpoints->len; i++) {
+                bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
                         gen_a64_set_pc_im(dc->pc);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 3e71467..4e20ab5 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11783,9 +11783,11 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
         }
 #endif
 
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
+        if (unlikely(cs->breakpoints) && unlikely(cs->breakpoints->len)) {
             CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+            int i;
+            for (i = 0; i < cs->breakpoints->len; i++) {
+                bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
                         gen_set_condexec(dc);
diff --git a/target-i386/bpt_helper.c b/target-i386/bpt_helper.c
index 6fd7fe0..84adf71 100644
--- a/target-i386/bpt_helper.c
+++ b/target-i386/bpt_helper.c
@@ -210,7 +210,6 @@ void breakpoint_handler(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
     CPUX86State *env = &cpu->env;
-    CPUBreakpoint *bp;
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
@@ -222,7 +221,10 @@ void breakpoint_handler(CPUState *cs)
             }
         }
     } else {
-        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+        CPUBreakpoint *bp;
+        int i;
+        for (i = 0; i < cs->breakpoints->len; i++) {
+            bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
             if (bp->pc == env->eip) {
                 if (bp->flags & BP_CPU) {
                     check_hw_breakpoints(env, true);
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index 891da18..ff61a1f 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -133,7 +133,6 @@ void lm32_debug_excp_handler(CPUState *cs)
 {
     LM32CPU *cpu = LM32_CPU(cs);
     CPULM32State *env = &cpu->env;
-    CPUBreakpoint *bp;
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
@@ -145,7 +144,10 @@ void lm32_debug_excp_handler(CPUState *cs)
             }
         }
     } else {
-        QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
+        CPUBreakpoint *bp;
+        int i;
+        for (i = 0; i < cs->breakpoints->len; i++) {
+            bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
             if (bp->pc == env->pc) {
                 if (bp->flags & BP_CPU) {
                     raise_exception(env, EXCP_BREAKPOINT);
-- 
2.7.4
