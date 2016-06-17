Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a198sm163645wme.16.2016.06.17.09.33.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jun 2016 09:33:56 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C10D63E0747;
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
	Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC 2/7] exec: keep CPUWatchpoint references internal
Date: Fri, 17 Jun 2016 17:33:42 +0100
Message-Id: <1466181227-14934-3-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
References: <1466181227-14934-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HZeQm+uGzWjN

In preparation for the conversion to an RCU controlled list of
watchpoints I've removed all $ARCH local copies of the watchpoint
structures. They can be accessed with cpu_watchpoint_get_by_ref() which
will eventually offer them for the lifetime of the rcu_read_lock().

Instead of using pointers as handles to architecture specific registers
they now use plain integer references.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 exec.c                    | 121 ++++++++++++++++++++++++++++++++--------------
 gdbstub.c                 |   2 +-
 include/qom/cpu.h         |  63 ++++++++++++++++++++++--
 linux-user/main.c         |   2 +-
 target-arm/cpu.h          |   1 -
 target-arm/helper.c       |  12 ++---
 target-arm/op_helper.c    |   4 +-
 target-i386/bpt_helper.c  |  25 +++++-----
 target-i386/cpu.h         |   3 +-
 target-lm32/cpu.h         |   1 -
 target-lm32/helper.c      |  15 ++----
 target-s390x/helper.c     |  10 ++--
 target-xtensa/cpu.h       |   3 --
 target-xtensa/helper.c    |   4 +-
 target-xtensa/op_helper.c |  16 ++----
 15 files changed, 177 insertions(+), 105 deletions(-)

diff --git a/exec.c b/exec.c
index e73c909..3dc3332 100644
--- a/exec.c
+++ b/exec.c
@@ -747,21 +747,42 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
     return -ENOSYS;
 }
 
-void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
+int cpu_watchpoint_remove_by_ref(CPUState *cpu, int ref)
 {
+    return -ENOENT;
 }
 
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags, CPUWatchpoint **watchpoint)
+int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
+                                   int flags, int ref)
+{
+    return -ENOSYS;
+}
+int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len, int flags)
 {
     return -ENOSYS;
 }
+CPUWatchpoint *cpu_watchpoint_get_by_ref(CPUState *cpu, int ref)
+{
+    return NULL;
+}
 #else
+/* Find watchpoint with external reference */
+CPUWatchpoint *cpu_watchpoint_get_by_ref(CPUState *cpu, int ref)
+{
+    CPUWatchpoint *wp = NULL;
+    int i = 0;
+    do {
+        wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i++);
+    } while (wp && wp->ref != ref);
+
+    return wp;
+}
+
 /* Add a watchpoint.  */
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags, CPUWatchpoint **watchpoint)
+int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
+                                   int flags, int ref)
 {
-    CPUWatchpoint *wp;
+    CPUWatchpoint *wp = NULL;
 
     /* forbid ranges which are empty or run off the end of the address space */
     if (len == 0 || (addr + len - 1) < addr) {
@@ -772,28 +793,55 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 
     /* Allocate if no previous watchpoints */
     if (!cpu->watchpoints) {
-        cpu->watchpoints = g_array_new(false, false, sizeof(CPUWatchpoint *));
+        cpu->watchpoints = g_array_new(true, false, sizeof(CPUWatchpoint *));
     }
 
-    wp = g_malloc(sizeof(*wp));
-    wp->vaddr = addr;
-    wp->len = len;
-    wp->flags = flags;
+    /* Find old watchpoint */
+    if (ref != WP_NOREF) {
+        wp = cpu_watchpoint_get_by_ref(cpu, ref);
+    }
 
-    /* keep all GDB-injected watchpoints in front */
-    if (flags & BP_GDB) {
-        g_array_prepend_val(cpu->watchpoints, wp);
+    if (wp) {
+        wp->vaddr = addr;
+        wp->len = len;
+        wp->flags = flags;
+        wp->ref = ref;
     } else {
-        g_array_append_val(cpu->watchpoints, wp);
+        wp = g_malloc(sizeof(*wp));
+
+        wp->vaddr = addr;
+        wp->len = len;
+        wp->flags = flags;
+        wp->ref = ref;
+
+        /* keep all GDB-injected watchpoints in front */
+        if (flags & BP_GDB) {
+            g_array_prepend_val(cpu->watchpoints, wp);
+        } else {
+            g_array_append_val(cpu->watchpoints, wp);
+        }
     }
 
+
     tlb_flush_page(cpu, addr);
 
-    if (watchpoint)
-        *watchpoint = wp;
     return 0;
 }
 
+int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len, int flags)
+{
+    return cpu_watchpoint_insert_with_ref(cpu, addr, len, flags, WP_NOREF);
+}
+
+static void cpu_watchpoint_delete(CPUState *cpu, int index)
+{
+    CPUWatchpoint *wp;
+    wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, index);
+    g_array_remove_index(cpu->watchpoints, index);
+    tlb_flush_page(cpu, wp->vaddr);
+    g_free(wp);
+}
+
 /* Remove a specific watchpoint.  */
 int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
                           int flags)
@@ -806,48 +854,49 @@ int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len,
             wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
             if (wp && addr == wp->vaddr && len == wp->len
                 && flags == (wp->flags & ~BP_WATCHPOINT_HIT)) {
-                cpu_watchpoint_remove_by_ref(cpu, wp);
+                cpu_watchpoint_delete(cpu, i);
                 return 0;
             }
         } while (i++ < cpu->watchpoints->len);
     }
+
     return -ENOENT;
 }
 
-/* Remove a specific watchpoint by reference.  */
-void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
+/* Remove a specific watchpoint by external reference.  */
+int cpu_watchpoint_remove_by_ref(CPUState *cpu, int ref)
 {
     CPUWatchpoint *wp;
-    int i;
-
-    g_assert(cpu->watchpoints);
+    int i = 0;
 
-    for (i = 0; i < cpu->watchpoints->len; i++) {
-        wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
-        if (wp == watchpoint) {
-            g_array_remove_index_fast(cpu->watchpoints, i);
-            break;
-        }
+    if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
+        do {
+            wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
+            if (wp && wp->ref == ref) {
+                cpu_watchpoint_delete(cpu, i);
+                return 0;
+            }
+        } while (wp && i++ < cpu->watchpoints->len);
     }
 
-    tlb_flush_page(cpu, watchpoint->vaddr);
-
-    g_free(watchpoint);
+    return -ENOENT;
 }
 
 /* Remove all matching watchpoints.  */
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
 {
     CPUWatchpoint *wp;
-    int i;
 
     if (unlikely(cpu->watchpoints) && unlikely(cpu->watchpoints->len)) {
-        for (i = cpu->watchpoints->len; i == 0; i--) {
+        int i = cpu->watchpoints->len;
+        do {
             wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
             if (wp->flags & mask) {
-                cpu_watchpoint_remove_by_ref(cpu, wp);
+                cpu_watchpoint_delete(cpu, i);
+            } else {
+                i--;
             }
-        }
+        } while (cpu->watchpoints->len && i >= 0);
     }
 }
 
diff --git a/gdbstub.c b/gdbstub.c
index 5da66f1..548144e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -688,7 +688,7 @@ static int gdb_breakpoint_insert(target_ulong addr, target_ulong len, int type)
     case GDB_WATCHPOINT_ACCESS:
         CPU_FOREACH(cpu) {
             err = cpu_watchpoint_insert(cpu, addr, len,
-                                        xlat_gdb_type(cpu, type), NULL);
+                                        xlat_gdb_type(cpu, type));
             if (err) {
                 break;
             }
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 820a56d..81edfdb 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -206,12 +206,15 @@ typedef struct CPUBreakpoint {
     int flags; /* BP_* */
 } CPUBreakpoint;
 
+#define WP_NOREF -1
+
 struct CPUWatchpoint {
     vaddr vaddr;
     vaddr len;
     vaddr hitaddr;
     MemTxAttrs hitattrs;
     int flags; /* BP_* */
+    int ref; /* reference or WP_NOREF */
 };
 
 struct KVMState;
@@ -837,11 +840,61 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags, CPUWatchpoint **watchpoint);
-int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-                          vaddr len, int flags);
-void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
+/**
+ * cpu_watchpoint_insert:
+ *
+ * @cpu: CPU to monitor
+ * @addr: address of watchpoint
+ * @len: length of watched region
+ * @flags: accesss/type flags
+ *
+ * Watchpoints added this way can only be removed by resetting all
+ * watchpoints.
+ */
+int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len, int flags);
+
+/**
+ * cpu_watchpoint_insert_with_ref:
+ *
+ * @cpu: CPU to monitor
+ * @addr: address of watchpoint
+ * @len: length of watched region
+ * @flags: accesss/type flags
+ * @ref: unique reference
+ *
+ * Inserting a watchpoint with a matching reference will replace any
+ * current watchpoint with the same reference.
+ */
+int cpu_watchpoint_insert_with_ref(CPUState *cpu, vaddr addr, vaddr len,
+                                   int flags, int ref);
+
+/**
+ * cpu_watchpoint_get_by_ref:
+ *
+ * @cpu: CPU to monitor
+ * @ref: unique reference
+ *
+ * @return: a pointer to working copy of the watchpoint.
+ *
+ * Return a working copy of the current referenced watchpoint. This
+ * obviously only works for watchpoints inserted with a reference. The
+ * lifetime of this objected will be limited and should not be kept
+ * beyond its immediate use. Otherwise return NULL.
+ */
+CPUWatchpoint *cpu_watchpoint_get_by_ref(CPUState *cpu, int ref);
+
+/**
+ * cpu_watchpoint_remove_by_ref:
+ *
+ * @cpu: CPU to monitor
+ * @ref: unique reference
+ *
+ * Remove a referenced watchpoint
+ */
+int cpu_watchpoint_remove_by_ref(CPUState *cpu, int ref);
+int cpu_watchpoint_remove(CPUState *cpu, vaddr addr, vaddr len, int flags);
+
+
 void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
 
 /**
diff --git a/linux-user/main.c b/linux-user/main.c
index 84a1ede..2d65508 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -3824,7 +3824,7 @@ CPUArchState *cpu_copy(CPUArchState *env)
         int i;
         for (i = 0; i < cpu->watchpoints->len; i++) {
             wp = g_array_index(cpu->watchpoints, CPUWatchpoint *, i);
-            cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
+            cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags);
         }
     }
 
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 942aa36..4d04a76 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -494,7 +494,6 @@ typedef struct CPUARMState {
 #endif
 
     struct CPUBreakpoint *cpu_breakpoint[16];
-    struct CPUWatchpoint *cpu_watchpoint[16];
 
     CPU_COMMON
 
diff --git a/target-arm/helper.c b/target-arm/helper.c
index c9730d6..50d70ce 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -3942,13 +3942,10 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
     int mask;
     int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
 
-    if (env->cpu_watchpoint[n]) {
-        cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[n]);
-        env->cpu_watchpoint[n] = NULL;
-    }
 
     if (!extract64(wcr, 0, 1)) {
         /* E bit clear : watchpoint disabled */
+        cpu_watchpoint_remove_by_ref(CPU(cpu), n);
         return;
     }
 
@@ -4012,22 +4009,19 @@ void hw_watchpoint_update(ARMCPU *cpu, int n)
         wvr += basstart;
     }
 
-    cpu_watchpoint_insert(CPU(cpu), wvr, len, flags,
-                          &env->cpu_watchpoint[n]);
+    cpu_watchpoint_insert_with_ref(CPU(cpu), wvr, len, flags, n);
 }
 
 void hw_watchpoint_update_all(ARMCPU *cpu)
 {
     int i;
-    CPUARMState *env = &cpu->env;
 
     /* Completely clear out existing QEMU watchpoints and our array, to
      * avoid possible stale entries following migration load.
      */
     cpu_watchpoint_remove_all(CPU(cpu), BP_CPU);
-    memset(env->cpu_watchpoint, 0, sizeof(env->cpu_watchpoint));
 
-    for (i = 0; i < ARRAY_SIZE(cpu->env.cpu_watchpoint); i++) {
+    for (i = 0; i < 16; i++) {
         hw_watchpoint_update(cpu, i);
     }
 }
diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index 35912a1..02d6265 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -1056,7 +1056,7 @@ static bool bp_wp_matches(ARMCPU *cpu, int n, bool is_wp)
     int access_el = arm_current_el(env);
 
     if (is_wp) {
-        CPUWatchpoint *wp = env->cpu_watchpoint[n];
+        CPUWatchpoint *wp = cpu_watchpoint_get_by_ref(CPU(cpu), n);
 
         if (!wp || !(wp->flags & BP_WATCHPOINT_HIT)) {
             return false;
@@ -1153,7 +1153,7 @@ static bool check_watchpoints(ARMCPU *cpu)
         return false;
     }
 
-    for (n = 0; n < ARRAY_SIZE(env->cpu_watchpoint); n++) {
+    for (n = 0; n < 16; n++) {
         if (bp_wp_matches(cpu, n, true)) {
             return true;
         }
diff --git a/target-i386/bpt_helper.c b/target-i386/bpt_helper.c
index 84adf71..1793e17 100644
--- a/target-i386/bpt_helper.c
+++ b/target-i386/bpt_helper.c
@@ -73,19 +73,17 @@ static int hw_breakpoint_insert(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_WRITE,
-                                        &env->cpu_watchpoint[index]);
+            err = cpu_watchpoint_insert_with_ref(cs, drN,
+                                                 hw_breakpoint_len(dr7, index),
+                                                 BP_CPU | BP_MEM_WRITE, index);
         }
         break;
 
     case DR7_TYPE_DATA_RW:
         if (hw_breakpoint_enabled(dr7, index)) {
-            err = cpu_watchpoint_insert(cs, drN,
-                                        hw_breakpoint_len(dr7, index),
-                                        BP_CPU | BP_MEM_ACCESS,
-                                        &env->cpu_watchpoint[index]);
+            err = cpu_watchpoint_insert_with_ref(cs, drN,
+                                                 hw_breakpoint_len(dr7, index),
+                                                 BP_CPU | BP_MEM_ACCESS, index);
         }
         break;
     }
@@ -109,10 +107,7 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
 
     case DR7_TYPE_DATA_WR:
     case DR7_TYPE_DATA_RW:
-        if (env->cpu_breakpoint[index]) {
-            cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[index]);
-            env->cpu_breakpoint[index] = NULL;
-        }
+        cpu_watchpoint_remove_by_ref(cs, index);
         break;
 
     case DR7_TYPE_IO_RW:
@@ -183,11 +178,13 @@ static bool check_hw_breakpoints(CPUX86State *env, bool force_dr6_update)
             break;
         case DR7_TYPE_DATA_WR:
         case DR7_TYPE_DATA_RW:
-            if (env->cpu_watchpoint[reg] &&
-                env->cpu_watchpoint[reg]->flags & BP_WATCHPOINT_HIT) {
+        {
+            CPUWatchpoint *wp = cpu_watchpoint_get_by_ref(CPU(env), reg);
+            if (wp && wp->flags & BP_WATCHPOINT_HIT) {
                 wp_match = true;
             }
             break;
+        }
         case DR7_TYPE_IO_RW:
             break;
         }
diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index d9ab884..87f62be 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -1059,8 +1059,7 @@ typedef struct CPUX86State {
     target_ulong dr[8]; /* debug registers; note dr4 and dr5 are unused */
     union {
         struct CPUBreakpoint *cpu_breakpoint[4];
-        struct CPUWatchpoint *cpu_watchpoint[4];
-    }; /* break/watchpoints for dr[0..3] */
+    }; /* breakpoints for dr[0..3] */
     int old_exception;  /* exception in flight */
 
     uint64_t vm_vmcb;
diff --git a/target-lm32/cpu.h b/target-lm32/cpu.h
index 62880f7..1512119 100644
--- a/target-lm32/cpu.h
+++ b/target-lm32/cpu.h
@@ -163,7 +163,6 @@ struct CPULM32State {
     uint32_t wp[4];     /* watchpoints */
 
     struct CPUBreakpoint *cpu_breakpoint[4];
-    struct CPUWatchpoint *cpu_watchpoint[4];
 
     CPU_COMMON
 
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index ff61a1f..8c6ae52 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -98,21 +98,14 @@ void lm32_watchpoint_insert(CPULM32State *env, int idx, target_ulong address,
     }
 
     if (flags != 0) {
-        cpu_watchpoint_insert(CPU(cpu), address, 1, flags,
-                &env->cpu_watchpoint[idx]);
+        cpu_watchpoint_insert_with_ref(CPU(cpu), address, 1, flags, idx);
     }
 }
 
 void lm32_watchpoint_remove(CPULM32State *env, int idx)
 {
     LM32CPU *cpu = lm32_env_get_cpu(env);
-
-    if (!env->cpu_watchpoint[idx]) {
-        return;
-    }
-
-    cpu_watchpoint_remove_by_ref(CPU(cpu), env->cpu_watchpoint[idx]);
-    env->cpu_watchpoint[idx] = NULL;
+    cpu_watchpoint_remove_by_ref(CPU(cpu), idx);
 }
 
 static bool check_watchpoints(CPULM32State *env)
@@ -121,8 +114,8 @@ static bool check_watchpoints(CPULM32State *env)
     int i;
 
     for (i = 0; i < cpu->num_watchpoints; i++) {
-        if (env->cpu_watchpoint[i] &&
-                env->cpu_watchpoint[i]->flags & BP_WATCHPOINT_HIT) {
+        CPUWatchpoint *wp = cpu_watchpoint_get_by_ref(CPU(cpu), i);
+        if (wp && wp->flags & BP_WATCHPOINT_HIT) {
             return true;
         }
     }
diff --git a/target-s390x/helper.c b/target-s390x/helper.c
index 9a744df..cfa2b20 100644
--- a/target-s390x/helper.c
+++ b/target-s390x/helper.c
@@ -646,19 +646,19 @@ void s390_cpu_recompute_watchpoints(CPUState *cs)
     if (env->cregs[10] == 0 && env->cregs[11] == -1LL) {
         /* We can't create a watchoint spanning the whole memory range, so
            split it in two parts.   */
-        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags, NULL);
-        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags, NULL);
+        cpu_watchpoint_insert(cs, 0, 1ULL << 63, wp_flags);
+        cpu_watchpoint_insert(cs, 1ULL << 63, 1ULL << 63, wp_flags);
     } else if (env->cregs[10] > env->cregs[11]) {
         /* The address range loops, create two watchpoints.  */
         cpu_watchpoint_insert(cs, env->cregs[10], -env->cregs[10],
-                              wp_flags, NULL);
-        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags, NULL);
+                              wp_flags);
+        cpu_watchpoint_insert(cs, 0, env->cregs[11] + 1, wp_flags);
 
     } else {
         /* Default case, create a single watchpoint.  */
         cpu_watchpoint_insert(cs, env->cregs[10],
                               env->cregs[11] - env->cregs[10] + 1,
-                              wp_flags, NULL);
+                              wp_flags);
     }
 }
 
diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
index 442176a..5d1ea4a 100644
--- a/target-xtensa/cpu.h
+++ b/target-xtensa/cpu.h
@@ -374,9 +374,6 @@ typedef struct CPUXtensaState {
 
     int exception_taken;
 
-    /* Watchpoints for DBREAK registers */
-    struct CPUWatchpoint *cpu_watchpoint[MAX_NDBREAK];
-
     CPU_COMMON
 } CPUXtensaState;
 
diff --git a/target-xtensa/helper.c b/target-xtensa/helper.c
index 768b32c..9505701 100644
--- a/target-xtensa/helper.c
+++ b/target-xtensa/helper.c
@@ -86,8 +86,8 @@ static uint32_t check_hw_breakpoints(CPUXtensaState *env)
     unsigned i;
 
     for (i = 0; i < env->config->ndbreak; ++i) {
-        if (env->cpu_watchpoint[i] &&
-                env->cpu_watchpoint[i]->flags & BP_WATCHPOINT_HIT) {
+        CPUWatchpoint *wp = cpu_watchpoint_get_by_ref(CPU(env), i);
+        if (wp && wp->flags & BP_WATCHPOINT_HIT) {
             return DEBUGCAUSE_DB | (i << DEBUGCAUSE_DBNUM_SHIFT);
         }
     }
diff --git a/target-xtensa/op_helper.c b/target-xtensa/op_helper.c
index bc3667f..01656b2 100644
--- a/target-xtensa/op_helper.c
+++ b/target-xtensa/op_helper.c
@@ -797,9 +797,6 @@ static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
     int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
     uint32_t mask = dbreakc | ~DBREAKC_MASK;
 
-    if (env->cpu_watchpoint[i]) {
-        cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[i]);
-    }
     if (dbreakc & DBREAKC_SB) {
         flags |= BP_MEM_WRITE;
     }
@@ -812,9 +809,8 @@ static void set_dbreak(CPUXtensaState *env, unsigned i, uint32_t dbreaka,
         /* cut mask after the first zero bit */
         mask = 0xffffffff << (32 - clo32(mask));
     }
-    if (cpu_watchpoint_insert(cs, dbreaka & mask, ~mask + 1,
-            flags, &env->cpu_watchpoint[i])) {
-        env->cpu_watchpoint[i] = NULL;
+    if (cpu_watchpoint_insert_with_ref(cs, dbreaka & mask, ~mask + 1,
+                                       flags, i)) {
         qemu_log_mask(LOG_GUEST_ERROR, "Failed to set data breakpoint at 0x%08x/%d\n",
                       dbreaka & mask, ~mask + 1);
     }
@@ -837,12 +833,8 @@ void HELPER(wsr_dbreakc)(CPUXtensaState *env, uint32_t i, uint32_t v)
         if (v & DBREAKC_SB_LB) {
             set_dbreak(env, i, env->sregs[DBREAKA + i], v);
         } else {
-            if (env->cpu_watchpoint[i]) {
-                CPUState *cs = CPU(xtensa_env_get_cpu(env));
-
-                cpu_watchpoint_remove_by_ref(cs, env->cpu_watchpoint[i]);
-                env->cpu_watchpoint[i] = NULL;
-            }
+            CPUState *cs = CPU(xtensa_env_get_cpu(env));
+            cpu_watchpoint_remove_by_ref(cs, i);
         }
     }
     env->sregs[DBREAKC + i] = v;
-- 
2.7.4
