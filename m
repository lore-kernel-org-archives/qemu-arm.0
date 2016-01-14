Received: by 10.25.159.19 with SMTP id i19csp1802083lfe;
        Thu, 14 Jan 2016 06:18:01 -0800 (PST)
X-Received: by 10.112.166.33 with SMTP id zd1mr1126325lbb.71.1452781073940;
        Thu, 14 Jan 2016 06:17:53 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id o193si3258386lfb.247.2016.01.14.06.17.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:53 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008U3-5p; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 01/19] exec.c: Don't set cpu->as until cpu_address_space_init
Date: Thu, 14 Jan 2016 13:52:37 +0000
Message-Id: <1452779575-32582-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 3A3nQDRKeh/+

Rather than setting cpu->as unconditionally in cpu_exec_init
(and then having target-i386 override this later), don't set
it until the first call to cpu_address_space_init.

This requires us to initialise the address space for
both TCG and KVM (KVM doesn't need the AS listener but
it does require cpu->as to be set).

For target CPUs which don't set up any address spaces (currently
everything except i386), add the default address_space_memory
in qemu_init_vcpu().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 cpus.c                  | 10 ++++++++--
 exec.c                  | 16 ++++++++++++----
 include/exec/exec-all.h | 16 +++++++++++++++-
 target-i386/cpu.c       |  6 ++++--
 4 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/cpus.c b/cpus.c
index ea29584..787877a 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1310,8 +1310,6 @@ static void qemu_tcg_init_vcpu(CPUState *cpu)
     static QemuCond *tcg_halt_cond;
     static QemuThread *tcg_cpu_thread;
 
-    tcg_cpu_address_space_init(cpu, cpu->as);
-
     /* share a single thread for all cpus with TCG */
     if (!tcg_cpu_thread) {
         cpu->thread = g_malloc0(sizeof(QemuThread));
@@ -1372,6 +1370,14 @@ void qemu_init_vcpu(CPUState *cpu)
     cpu->nr_cores = smp_cores;
     cpu->nr_threads = smp_threads;
     cpu->stopped = true;
+
+    if (!cpu->as) {
+        /* If the target cpu hasn't set up any address spaces itself,
+         * give it the default one.
+         */
+        cpu_address_space_init(cpu, &address_space_memory, 0);
+    }
+
     if (kvm_enabled()) {
         qemu_kvm_start_vcpu(cpu);
     } else if (tcg_enabled()) {
diff --git a/exec.c b/exec.c
index 7f0ce42..f34d556 100644
--- a/exec.c
+++ b/exec.c
@@ -536,8 +536,13 @@ CPUState *qemu_get_cpu(int index)
 }
 
 #if !defined(CONFIG_USER_ONLY)
-void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as)
+void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
 {
+    if (asidx == 0) {
+        /* address space 0 gets the convenience alias */
+        cpu->as = as;
+    }
+
     /* We only support one address space per cpu at the moment.  */
     assert(cpu->as == as);
 
@@ -549,8 +554,10 @@ void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as)
     cpu->cpu_ases = g_new0(CPUAddressSpace, 1);
     cpu->cpu_ases[0].cpu = cpu;
     cpu->cpu_ases[0].as = as;
-    cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
-    memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
+    if (tcg_enabled()) {
+        cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
+        memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
+    }
 }
 #endif
 
@@ -605,8 +612,9 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     int cpu_index;
     Error *local_err = NULL;
 
+    cpu->as = NULL;
+
 #ifndef CONFIG_USER_ONLY
-    cpu->as = &address_space_memory;
     cpu->thread_id = qemu_get_thread_id();
 #endif
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d900b0d..eb3890a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -84,7 +84,21 @@ void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 
 #if !defined(CONFIG_USER_ONLY)
 void cpu_reloading_memory_map(void);
-void tcg_cpu_address_space_init(CPUState *cpu, AddressSpace *as);
+/**
+ * cpu_address_space_init:
+ * @cpu: CPU to add this address space to
+ * @as: address space to add
+ * @asidx: integer index of this address space
+ *
+ * Add the specified address space to the CPU's cpu_ases list.
+ * The address space added with @asidx 0 is the one used for the
+ * convenience pointer cpu->as.
+ * The target-specific code which registers ASes is responsible
+ * for defining what semantics address space 0, 1, 2, etc have.
+ *
+ * Note that with KVM only one address space is supported.
+ */
+void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx);
 /* cputlb.c */
 /**
  * tlb_flush_page:
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 0d447b5..36fae2d 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2861,9 +2861,10 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     if (tcg_enabled()) {
+        AddressSpace *newas = g_new(AddressSpace, 1);
+
         cpu->cpu_as_mem = g_new(MemoryRegion, 1);
         cpu->cpu_as_root = g_new(MemoryRegion, 1);
-        cs->as = g_new(AddressSpace, 1);
 
         /* Outer container... */
         memory_region_init(cpu->cpu_as_root, OBJECT(cpu), "memory", ~0ull);
@@ -2876,7 +2877,8 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
                                  get_system_memory(), 0, ~0ull);
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
         memory_region_set_enabled(cpu->cpu_as_mem, true);
-        address_space_init(cs->as, cpu->cpu_as_root, "CPU");
+        address_space_init(newas, cpu->cpu_as_root, "CPU");
+        cpu_address_space_init(cs, newas, 0);
 
         /* ... SMRAM with higher priority, linked from /machine/smram.  */
         cpu->machine_done.notify = x86_cpu_machine_done;
-- 
1.9.1
