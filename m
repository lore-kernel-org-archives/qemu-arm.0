Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b77sm710911wme.0.2016.06.17.09.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 09:33:56 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DB1A43E097F;
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
Subject: [RFC 3/7] exec: keep CPUBreakpoint references internal
Date: Fri, 17 Jun 2016 17:33:43 +0100
Message-Id: <1466181227-14934-4-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kLmvubQrgAWo

In preparation for the conversion to an RCU controlled list of
breakpoints I've removed all $ARCH local references to breakpoint
structures. They can be accessed with cpu_breakpoint_get_by_ref() which
will eventually offer them for the lifetime of the rcu_read_lock().

Instead of using pointers as handles to architecture specific registers
they now use plain integer references.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 exec.c                   | 116 +++++++++++++++++++++++++++++++----------------
 gdbstub.c                |   2 +-
 include/qom/cpu.h        |  59 +++++++++++++++++++++---
 linux-user/main.c        |   2 +-
 target-arm/cpu.h         |   2 -
 target-arm/helper.c      |  12 ++---
 target-arm/op_helper.c   |   6 +--
 target-i386/bpt_helper.c |  25 ++++------
 target-i386/cpu.h        |   3 --
 target-lm32/cpu.h        |   2 -
 target-lm32/helper.c     |  10 +---
 11 files changed, 148 insertions(+), 91 deletions(-)

diff --git a/exec.c b/exec.c
index 3dc3332..e80c9fe 100644
--- a/exec.c
+++ b/exec.c
@@ -797,7 +797,7 @@ int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
     }
 
     /* Find old watchpoint */
-    if (ref != WP_NOREF) {
+    if (ref != BPWP_NOREF) {
         wp = cpu_watchpoint_get_by_ref(cpu, ref);
     }
 
@@ -830,7 +830,7 @@ int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
 
 int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len, int flags)
 {
-    return cpu_watchpoint_insert_with_ref(cpu, addr, len, flags, WP_NOREF);
+    return cpu_watchpoint_insert_with_ref(cpu, addr, len, flags, BPWP_NOREF);
 }
 
 static void cpu_watchpoint_delete(CPUState *cpu, int index)
@@ -921,10 +921,20 @@ static inline bool cpu_watchpoint_address_matches(CPUWatchpoint *wp,
 }
 
 #endif
+/* Find watchpoint with external reference */
+CPUBreakpoint *cpu_breakpoint_get_by_ref(CPUState *cpu, int ref)
+{
+    CPUBreakpoint *bp = NULL;
+    int i = 0;
+    do {
+        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i++);
+    } while (bp && bp->ref != ref);
+
+    return bp;
+}
 
 /* Add a breakpoint.  */
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
-                          CPUBreakpoint **breakpoint)
+int cpu_breakpoint_insert_with_ref(CPUState *cpu, vaddr pc, int flags, int ref)
 {
     CPUBreakpoint *bp;
 
@@ -933,76 +943,102 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
         cpu->breakpoints = g_array_new(false, false, sizeof(CPUBreakpoint *));
     }
 
-    bp = g_malloc(sizeof(*bp));
-
-    bp->pc = pc;
-    bp->flags = flags;
+    /* Find old watchpoint */
+    if (ref != BPWP_NOREF) {
+        bp = cpu_breakpoint_get_by_ref(cpu, ref);
+    }
 
-    /* keep all GDB-injected breakpoints in front */
-    if (flags & BP_GDB) {
-        g_array_prepend_val(cpu->breakpoints, bp);
+    if (bp) {
+        bp->pc = pc;
+        bp->flags = flags;
+        bp->ref = ref;
     } else {
-        g_array_append_val(cpu->breakpoints, bp);
+        bp = g_malloc(sizeof(*bp));
+
+        bp->pc = pc;
+        bp->flags = flags;
+        bp->ref = ref;
+
+        /* keep all GDB-injected breakpoints in front */
+        if (flags & BP_GDB) {
+            g_array_prepend_val(cpu->breakpoints, bp);
+        } else {
+            g_array_append_val(cpu->breakpoints, bp);
+        }
     }
 
     breakpoint_invalidate(cpu, pc);
 
-    if (breakpoint) {
-        *breakpoint = bp;
-    }
     return 0;
 }
 
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags)
+{
+    return cpu_breakpoint_insert_with_ref(cpu, pc, flags, BPWP_NOREF);
+}
+
+static void cpu_breakpoint_delete(CPUState *cpu, int index)
+{
+    CPUBreakpoint *bp;
+    bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, index);
+    g_array_remove_index(cpu->breakpoints, index);
+    breakpoint_invalidate(cpu, bp->pc);
+    g_free(bp);
+}
+
 /* Remove a specific breakpoint.  */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 {
     CPUBreakpoint *bp;
-    int i;
 
-    g_assert(cpu->breakpoints);
-
-    for (i = 0; i < cpu->breakpoints->len; i++) {
-        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
-        if (bp->pc == pc && bp->flags == flags) {
-            cpu_breakpoint_remove_by_ref(cpu, bp);
-            return 0;
-        }
+    if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
+        int i = 0;
+        do {
+            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            if (bp && bp->pc == pc && bp->flags == flags) {
+                cpu_breakpoint_delete(cpu, i);
+            } else {
+                i++;
+            }
+        } while (i < cpu->breakpoints->len);
     }
+
     return -ENOENT;
 }
 
 /* Remove a specific breakpoint by reference.  */
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint)
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, int ref)
 {
     CPUBreakpoint *bp;
-    int i;
 
-    for (i = 0; i < cpu->breakpoints->len; i++) {
-        bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
-        if (bp == breakpoint) {
-            g_array_remove_index_fast(cpu->breakpoints, i);
-            break;
-        }
+    if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
+        int i = 0;
+        do {
+            bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
+            if (bp && bp->ref == ref) {
+                cpu_breakpoint_delete(cpu, i);
+            } else {
+                i++;
+            }
+        } while (i < cpu->breakpoints->len);
     }
-
-    breakpoint_invalidate(cpu, breakpoint->pc);
-
-    g_free(breakpoint);
 }
 
 /* Remove all matching breakpoints. */
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
 {
     CPUBreakpoint *bp;
-    int i;
 
     if (unlikely(cpu->breakpoints) && unlikely(cpu->breakpoints->len)) {
-        for (i = cpu->breakpoints->len; i == 0; i--) {
+        int i = 0;
+        do {
             bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
             if (bp->flags & mask) {
-                cpu_breakpoint_remove_by_ref(cpu, bp);
+                cpu_breakpoint_delete(cpu, i);
+            } else {
+                i++;
             }
-        }
+        } while (i < cpu->breakpoints->len);
     }
 }
 
diff --git a/gdbstub.c b/gdbstub.c
index 548144e..c73ea42 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -676,7 +676,7 @@ static int gdb_breakpoint_insert(target_ulong addr, target_ulong len, int type)
     case GDB_BREAKPOINT_SW:
     case GDB_BREAKPOINT_HW:
         CPU_FOREACH(cpu) {
-            err = cpu_breakpoint_insert(cpu, addr, BP_GDB, NULL);
+            err = cpu_breakpoint_insert(cpu, addr, BP_GDB);
             if (err) {
                 break;
             }
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 81edfdb..e582da0 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -201,20 +201,21 @@ typedef struct icount_decr_u16 {
 } icount_decr_u16;
 #endif
 
+#define BPWP_NOREF -1
+
 typedef struct CPUBreakpoint {
     vaddr pc;
     int flags; /* BP_* */
+    int ref; /* reference or WPBP_NOREF */
 } CPUBreakpoint;
 
-#define WP_NOREF -1
-
 struct CPUWatchpoint {
     vaddr vaddr;
     vaddr len;
     vaddr hitaddr;
     MemTxAttrs hitattrs;
     int flags; /* BP_* */
-    int ref; /* reference or WP_NOREF */
+    int ref; /* reference or WPBP_NOREF */
 };
 
 struct KVMState;
@@ -818,10 +819,56 @@ void cpu_single_step(CPUState *cpu, int enabled);
 #define BP_WATCHPOINT_HIT_WRITE 0x80
 #define BP_WATCHPOINT_HIT (BP_WATCHPOINT_HIT_READ | BP_WATCHPOINT_HIT_WRITE)
 
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
-                          CPUBreakpoint **breakpoint);
+/*
+ * cpu_breakpoint_insert:
+ *
+ * @cpu: CPU to monitor
+ * @pc: address of breakpoint
+ * @flags: accesss/type flags
+ *
+ * Breakpoints added this way can only be removed by resetting all
+ * breakpoints.
+ */
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags);
+
+/*
+ * cpu_breakpoint_insert_with_ref:
+ *
+ * @cpu: CPU to monitor
+ * @pc: address of breakpoint
+ * @flags: accesss/type flags
+ *
+ * Inserting a breakpoint with a matching reference will replace any
+ * current breakpoint with the same reference.
+ */
+int cpu_breakpoint_insert_with_ref(CPUState *cpu, vaddr pc, int flags, int ref);
+
+/**
+ * cpu_breakpoint_get_by_ref:
+ *
+ * @cpu: CPU to monitor
+ * @ref: unique reference
+ *
+ * @return: a pointer to working copy of the breakpoint.
+ *
+ * Return a working copy of the current referenced breakpoint. This
+ * obviously only works for breakpoints inserted with a reference. The
+ * lifetime of this objected will be limited and should not be kept
+ * beyond its immediate use. Otherwise return NULL.
+ */
+CPUBreakpoint *cpu_breakpoint_get_by_ref(CPUState *cpu, int ref);
+
+/**
+ * cpu_breakpoint_remove_by_ref:
+ *
+ * @cpu: CPU to monitor
+ * @ref: unique reference
+ *
+ * Remove a referenced breakpoint
+ */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags);
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, int ref);
+
 void cpu_breakpoint_remove_all(CPUState *cpu, int mask);
 
 /* Return true if PC matches an installed breakpoint.  */
diff --git a/linux-user/main.c b/linux-user/main.c
index 2d65508..8f71608 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3816,7 +3816,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
         int i;
         for (i = 0; i < cpu->breakpoints->len; i++) {
             bp = g_array_index(cpu->breakpoints, CPUBreakpoint *, i);
-            cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
+            cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags);
         }
     }
     if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 4d04a76..279ae42 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -493,8 +493,6 @@ typedef struct CPUARMState {
     int eabi;
 #endif
 
-    struct CPUBreakpoint *cpu_breakpoint[16];
-
     CPU_COMMON
 
     /* These fields after the common ones so they are preserved on reset.  */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 50d70ce..3c751a4 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -4061,12 +4061,8 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
     int bt;
     int flags = BP_CPU;
 
-    if (env->cpu_breakpoint[n]) {
-        cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[n]);
-        env->cpu_breakpoint[n] = NULL;
-    }
-
     if (!extract64(bcr, 0, 1)) {
+        cpu_breakpoint_remove_by_ref(CPU(cpu), n);
         /* E bit clear : watchpoint disabled */
         return;
     }
@@ -4125,21 +4121,19 @@ void hw_breakpoint_update(ARMCPU *cpu, int n)
         return;
     }
 
-    cpu_breakpoint_insert(CPU(cpu), addr, flags, &env->cpu_breakpoint[n]);
+    cpu_breakpoint_insert_with_ref(CPU(cpu), addr, flags, n);
 }
 
 void hw_breakpoint_update_all(ARMCPU *cpu)
 {
     int i;
-    CPUARMState *env = &cpu->env;
 
     /* Completely clear out existing QEMU breakpoints and our array, to
      * avoid possible stale entries following migration load.
      */
     cpu_breakpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_breakpoint, 0, sizeof(env->cpu_breakpoint));
 
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_breakpoint); i++) {
+    for (i = 0; i < 16; i++) {
         hw_breakpoint_update(cpu, i);
     }
 }
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 02d6265..2a24720 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -1071,8 +1071,8 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
         }
     } else {
         uint64_t pc = is_a64(env) ? env->pc : env->regs[15];
-
-        if (!env->cpu_breakpoint[n] || env->cpu_breakpoint[n]->pc != pc) {
+        CPUBreakpoint *bp = cpu_breakpoint_get_by_ref(CPU(cpu), n);
+        if (!bp || bp->pc != pc) {
             return false;
         }
         cr = env->cp15.dbgbcr[n];
@@ -1174,7 +1174,7 @@ static bool check_breakpoints(ARMCPU *cpu)
         return false;
     }
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_breakpoint); n++) {
+    for (n = 0; n < 16; n++) {
         if (bp_wp_matches(cpu, n, false)) {
             return true;
         }
diff --git a/target-i386/bpt_helper.c b/target-i386/bpt_helper.c
index 1793e17..4f2c75f 100644
--- a/target-i386/bpt_helper.c
+++ b/target-i386/bpt_helper.c
@@ -56,13 +56,11 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
     CPUState *cs = CPU(x86_env_get_cpu(env));
     target_ulong dr7 = env->dr[7];
     target_ulong drN = env->dr[index];
-    int err = 0;
 
     switch (hw_breakpoint_type(dr7, index)) {
     case DR7_TYPE_BP_INST:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_breakpoint_insert(cs, drN, BP_CPU,
-                                        &env->cpu_breakpoint[index]);
+            cpu_breakpoint_insert_with_ref(cs, drN, BP_CPU, index);
         }
         break;
 
@@ -73,23 +71,21 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert_with_ref(cs, drN,
-                                                 hw_breakpoint_len(dr7, index),
-                                                 BP_CPU | BP_MEM_WRITE, index);
+            cpu_watchpoint_insert_with_ref(cs, drN,
+                                           hw_breakpoint_len(dr7, index),
+                                           BP_CPU | BP_MEM_WRITE, index);
         }
         break;
 
     case DR7_TYPE_DATA_RW:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert_with_ref(cs, drN,
-                                                 hw_breakpoint_len(dr7, index),
-                                                 BP_CPU | BP_MEM_ACCESS, index);
+            cpu_watchpoint_insert_with_ref(cs, drN,
+                                           hw_breakpoint_len(dr7, index),
+                                           BP_CPU | BP_MEM_ACCESS, index);
         }
         break;
     }
-    if (err) {
-        env->cpu_breakpoint[index] = NULL;
-    }
+
     return 0;
 }
 
@@ -99,10 +95,7 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
 
     switch (hw_breakpoint_type(env->dr[7], index)) {
     case DR7_TYPE_BP_INST:
-        if (env->cpu_breakpoint[index]) {
-            cpu_breakpoint_remove_by_ref(cs, env->cpu_breakpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
-        }
+        cpu_breakpoint_remove_by_ref(cs, index);
         break;
 
     case DR7_TYPE_DATA_WR:
diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 87f62be..fd5eed3 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -1057,9 +1057,6 @@ typedef struct CPUX86State {
     int exception_is_int;
     target_ulong exception_next_eip;
     target_ulong dr[8]; /* debug registers; note dr4 and dr5 are unused */
-    union {
-        struct CPUBreakpoint *cpu_breakpoint[4];
-    }; /* breakpoints for dr[0..3] */
     int old_exception;  /* exception in flight */
 
     uint64_t vm_vmcb;
diff --git a/target-lm32/cpu.h b/target-lm32/cpu.h
index 1512119..8a64acd 100644
--- a/target-lm32/cpu.h
+++ b/target-lm32/cpu.h
@@ -162,8 +162,6 @@ struct CPULM32State {
     uint32_t bp[4];     /* breakpoints */
     uint32_t wp[4];     /* watchpoints */
 
-    struct CPUBreakpoint *cpu_breakpoint[4];
-
     CPU_COMMON
 
     /* Fields from here on are preserved across CPU reset. */
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index 8c6ae52..029fbc5 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -60,20 +60,14 @@ void lm32_breakpoint_insert(CPULM32State *env, int idx, target_ulong address)
 {
     LM32CPU *cpu = lm32_env_get_cpu(env);
 
-    cpu_breakpoint_insert(CPU(cpu), address, BP_CPU,
-                          &env->cpu_breakpoint[idx]);
+    cpu_breakpoint_insert_with_ref(CPU(cpu), address, BP_CPU, idx);
 }
 
 void lm32_breakpoint_remove(CPULM32State *env, int idx)
 {
     LM32CPU *cpu = lm32_env_get_cpu(env);
 
-    if (!env->cpu_breakpoint[idx]) {
-        return;
-    }
-
-    cpu_breakpoint_remove_by_ref(CPU(cpu), env->cpu_breakpoint[idx]);
-    env->cpu_breakpoint[idx] = NULL;
+    cpu_breakpoint_remove_by_ref(CPU(cpu), idx);
 }
 
 void lm32_watchpoint_insert(CPULM32State *env, int idx, target_ulong address,
-- 
2.7.4
