Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id yr4sm38304303wjc.18.2016.06.17.09.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 09:33:56 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id F22513E09BD;
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
Subject: [RFC 4/7] break/watchpoints: store inside array
Date: Fri, 17 Jun 2016 17:33:44 +0100
Message-Id: <1466181227-14934-5-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: emZP2XHBrQW6

Instead of dynamically allocating each break/watchpoint just include in
the array. This will make it easier to use RCU to update the array as
well as make the scanning of the current list more cache-line friendly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 cpu-exec.c                 |  2 +-
 exec.c                     | 68 ++++++++++++++++++++++------------------------
 include/qom/cpu.h          |  2 +-
 linux-user/main.c          |  4 +--
 target-arm/translate-a64.c |  2 +-
 target-arm/translate.c     |  2 +-
 target-i386/bpt_helper.c   |  2 +-
 target-lm32/helper.c       |  2 +-
 8 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 2b49337..2736a27 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -392,7 +392,7 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
 
     if (!cpu->watchpoint_hit && cpu->watchpoints) {
         for (i = 0; i < cpu->watchpoints->len; i++) {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             wp->flags &= ~BP_WATCHPOINT_HIT;
         }
     }
diff --git a/exec.c b/exec.c
index e80c9fe..c8e8823 100644
--- a/exec.c
+++ b/exec.c
@@ -772,8 +772,8 @@ CPUWatchpoint *cpu_watchpoint_get_by_ref(CPUState *cpu, int ref)
     CPUWatchpoint *wp = NULL;
     int i = 0;
     do {
-        wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i++);
-    } while (wp && wp->ref != ref);
+        wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i++);
+    } while (i < cpu->watchpoints->len && wp && wp->ref != ref);
 
     return wp;
 }
@@ -793,7 +793,7 @@ int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
 
     /* Allocate if no previous watchpoints */
     if (!cpu->watchpoints) {
-        cpu->watchpoints = g_array_new(true, false, sizeof(CPUWatchpoint *));
+        cpu->watchpoints = g_array_new(false, true, sizeof(CPUWatchpoint));
     }
 
     /* Find old watchpoint */
@@ -807,18 +807,17 @@ int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
         wp->flags = flags;
         wp->ref = ref;
     } else {
-        wp = g_malloc(sizeof(*wp));
-
-        wp->vaddr = addr;
-        wp->len = len;
-        wp->flags = flags;
-        wp->ref = ref;
+        CPUWatchpoint watch;
+        watch.vaddr = addr;
+        watch.len = len;
+        watch.flags = flags;
+        watch.ref = ref;
 
         /* keep all GDB-injected watchpoints in front */
         if (flags & BP_GDB) {
-            g_array_prepend_val(cpu->watchpoints, wp);
+            g_array_prepend_val(cpu->watchpoints, watch);
         } else {
-            g_array_append_val(cpu->watchpoints, wp);
+            g_array_append_val(cpu->watchpoints, watch);
         }
     }
 
@@ -836,10 +835,9 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len, int flags)
 static void cpu_watchpoint_delete(CPUState *cpu, int index)
 {
     CPUWatchpoint *wp;
-    wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, index);
-    g_array_remove_index(cpu->watchpoints, index);
+    wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, index);
     tlb_flush_page(cpu, wp->vaddr);
-    g_free(wp);
+    g_array_remove_index(cpu->watchpoints, index);
 }
 
 /* Remove a specific watchpoint.  */
@@ -851,7 +849,7 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
 
     if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
         do {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             if (wp && addr == wp->vaddr && len == wp->len
                 && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
                 cpu_watchpoint_delete(cpu, i);
@@ -871,7 +869,7 @@ int cpu_watchpoint_remove_by_ref(CPUState *cpu, int ref)
 
     if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
         do {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             if (wp && wp->ref == ref) {
                 cpu_watchpoint_delete(cpu, i);
                 return 0;
@@ -890,7 +888,7 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
     if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
         int i = cpu->watchpoints->len;
         do {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             if (wp->flags & mask) {
                 cpu_watchpoint_delete(cpu, i);
             } else {
@@ -927,8 +925,8 @@ CPUBreakpoint *cpu_breakpoint_get_by_ref(CPUState *cpu, int ref)
     CPUBreakpoint *bp = NULL;
     int i = 0;
     do {
-        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i++);
-    } while (bp && bp->ref != ref);
+        bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i++);
+    } while (i < cpu->breakpoints->len && bp && bp->ref != ref);
 
     return bp;
 }
@@ -936,11 +934,11 @@ CPUBreakpoint *cpu_breakpoint_get_by_ref(CPUState *cpu, int ref)
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert_with_ref(CPUState *cpu, vaddr pc, int flags, int ref)
 {
-    CPUBreakpoint *bp;
+    CPUBreakpoint *bp = NULL;
 
     /* Allocate if no previous breakpoints */
     if (!cpu->breakpoints) {
-        cpu->breakpoints = g_array_new(false, false, sizeof(CPUBreakpoint *));
+        cpu->breakpoints = g_array_new(false, true, sizeof(CPUBreakpoint));
     }
 
     /* Find old watchpoint */
@@ -953,17 +951,16 @@ int cpu_breakpoint_insert_with_ref(CPUState *cpu, vaddr pc, int flags, int ref)
         bp->flags = flags;
         bp->ref = ref;
     } else {
-        bp = g_malloc(sizeof(*bp));
-
-        bp->pc = pc;
-        bp->flags = flags;
-        bp->ref = ref;
+        CPUBreakpoint brk;
+        brk.pc = pc;
+        brk.flags = flags;
+        brk.ref = ref;
 
         /* keep all GDB-injected breakpoints in front */
         if (flags & BP_GDB) {
-            g_array_prepend_val(cpu->breakpoints, bp);
+            g_array_prepend_val(cpu->breakpoints, brk);
         } else {
-            g_array_append_val(cpu->breakpoints, bp);
+            g_array_append_val(cpu->breakpoints, brk);
         }
     }
 
@@ -980,10 +977,9 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags)
 static void cpu_breakpoint_delete(CPUState *cpu, int index)
 {
     CPUBreakpoint *bp;
-    bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, index);
-    g_array_remove_index(cpu->breakpoints, index);
+    bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, index);
     breakpoint_invalidate(cpu, bp->pc);
-    g_free(bp);
+    g_array_remove_index(cpu->breakpoints, index);
 }
 
 /* Remove a specific breakpoint.  */
@@ -994,7 +990,7 @@ int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
     if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
         int i = 0;
         do {
-            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i);
             if (bp && bp->pc == pc && bp->flags == flags) {
                 cpu_breakpoint_delete(cpu, i);
             } else {
@@ -1014,7 +1010,7 @@ void cpu_breakpoint_remove_by_ref(CPUState *cpu, int ref)
     if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
         int i = 0;
         do {
-            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i);
             if (bp && bp->ref == ref) {
                 cpu_breakpoint_delete(cpu, i);
             } else {
@@ -1032,7 +1028,7 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
     if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
         int i = 0;
         do {
-            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i);
             if (bp->flags & mask) {
                 cpu_breakpoint_delete(cpu, i);
             } else {
@@ -1222,7 +1218,7 @@ hwaddr memory_region_section_get_iotlb(CPUState *cpu,
         CPUWatchpoint *wp;
         int i;
         for (i = 0; i < cpu->watchpoints->len; i++) {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             if (cpu_watchpoint_address_matches(wp, vaddr, TARGET_PAGE_SIZE)) {
                 /* Avoid trapping reads of pages with a write breakpoint. */
                 if ((prot & PAGE_WRITE) || (wp->flags & BP_MEM_READ)) {
@@ -2205,7 +2201,7 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
         CPUWatchpoint *wp;
         int i;
         for (i = 0; i < cpu->watchpoints->len; i++) {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             if (cpu_watchpoint_address_matches(wp, vaddr, len)
                 && (wp->flags & flags)) {
                 if (flags == BP_MEM_READ) {
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index e582da0..f695afb 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -878,7 +878,7 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
         CPUBreakpoint *bp;
         int i;
         for (i = 0; i < cpu->breakpoints->len; i++) {
-            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i);
             if (bp->pc == pc && (bp->flags & mask)) {
                 return true;
             }
diff --git a/linux-user/main.c b/linux-user/main.c
index 8f71608..179f2f2 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3815,7 +3815,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
         CPUBreakpoint *bp;
         int i;
         for (i = 0; i < cpu->breakpoints->len; i++) {
-            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cpu->breakpoints, CPUBreakpoint, i);
             cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags);
         }
     }
@@ -3823,7 +3823,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
         CPUWatchpoint *wp;
         int i;
         for (i = 0; i < cpu->watchpoints->len; i++) {
-            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            wp = &g_array_index(cpu->watchpoints, CPUWatchpoint, i);
             cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags);
         }
     }
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 597e973..8bee51e 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11205,7 +11205,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
             CPUBreakpoint *bp;
             int i;
             for (i = 0; i < cs->breakpoints->len; i++) {
-                bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
+                bp = &g_array_index(cs->breakpoints, CPUBreakpoint, i);
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
                         gen_a64_set_pc_im(dc->pc);
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 4e20ab5..a5393dc 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11787,7 +11787,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
             CPUBreakpoint *bp;
             int i;
             for (i = 0; i < cs->breakpoints->len; i++) {
-                bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
+                bp = &g_array_index(cs->breakpoints, CPUBreakpoint, i);
                 if (bp->pc == dc->pc) {
                     if (bp->flags & BP_CPU) {
                         gen_set_condexec(dc);
diff --git a/target-i386/bpt_helper.c b/target-i386/bpt_helper.c
index 4f2c75f..d7426af 100644
--- a/target-i386/bpt_helper.c
+++ b/target-i386/bpt_helper.c
@@ -214,7 +214,7 @@ void breakpoint_handler(CPUState *cs)
         CPUBreakpoint *bp;
         int i;
         for (i = 0; i < cs->breakpoints->len; i++) {
-            bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cs->breakpoints, CPUBreakpoint, i);
             if (bp->pc == env->eip) {
                 if (bp->flags & BP_CPU) {
                     check_hw_breakpoints(env, true);
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index 029fbc5..3d07a5e 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -134,7 +134,7 @@ void lm32_debug_excp_handler(CPUState *cs)
         CPUBreakpoint *bp;
         int i;
         for (i = 0; i < cs->breakpoints->len; i++) {
-            bp = g_array_index(cs->breakpoints, CPUBreakpoint *, i);
+            bp = &g_array_index(cs->breakpoints, CPUBreakpoint, i);
             if (bp->pc == env->pc) {
                 if (bp->flags & BP_CPU) {
                     raise_exception(env, EXCP_BREAKPOINT);
-- 
2.7.4
