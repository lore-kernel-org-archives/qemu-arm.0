Received: by 10.182.158.201 with SMTP id ww9csp129816obb;
        Mon, 16 Nov 2015 06:22:42 -0800 (PST)
X-Received: by 10.28.16.72 with SMTP id 69mr7562440wmq.100.1447683762174;
        Mon, 16 Nov 2015 06:22:42 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id x9si14446325wjf.139.2015.11.16.06.22.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:42 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00012k-A8; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 02/19] exec.c: Allow target CPUs to define multiple AddressSpaces
Date: Mon, 16 Nov 2015 14:05:06 +0000
Message-Id: <1447682723-3977-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: GMiEsBGWR2T8

Allow multiple calls to cpu_address_space_init(); each
call adds an entry to the cpu->ases array at the specified
index. It is up to the target-specific CPU code to actually use
these extra address spaces.

Since this multiple AddressSpace support won't work with
KVM, add an assertion to avoid confusing failures.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cpus.c                  |  1 +
 exec.c                  | 25 +++++++++++++++----------
 include/exec/exec-all.h |  4 ++++
 include/qom/cpu.h       |  2 ++
 target-i386/cpu.c       |  1 +
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/cpus.c b/cpus.c
index b347e42..4cea798 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1375,6 +1375,7 @@ void qemu_init_vcpu(CPUState *cpu)
         /* If the target cpu hasn't set up any address spaces itself,
          * give it the default one.
          */
+        cpu->num_ases = 1;
         cpu_address_space_init(cpu, &address_space_memory, 0);
     }
 
diff --git a/exec.c b/exec.c
index 1313fad..ddb692c 100644
--- a/exec.c
+++ b/exec.c
@@ -553,25 +553,29 @@ CPUState *qemu_get_cpu(int index)
 #if !defined(CONFIG_USER_ONLY)
 void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
 {
+    CPUAddressSpace *newas;
+
+    /* Target code should have set num_ases before calling us */
+    assert(asidx < cpu->num_ases);
+
     if (asidx == 0) {
         /* address space 0 gets the convenience alias */
         cpu->as = as;
     }
 
-    /* We only support one address space per cpu at the moment.  */
-    assert(cpu->as == as);
+    /* KVM cannot currently support multiple address spaces. */
+    assert(asidx == 0 || !kvm_enabled());
 
-    if (cpu->cpu_ases) {
-        /* We've already registered the listener for our only AS */
-        return;
+    if (!cpu->cpu_ases) {
+        cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
     }
 
-    cpu->cpu_ases = g_new0(CPUAddressSpace, 1);
-    cpu->cpu_ases[0].cpu = cpu;
-    cpu->cpu_ases[0].as = as;
+    newas = &cpu->cpu_ases[asidx];
+    newas->cpu = cpu;
+    newas->as = as;
     if (tcg_enabled()) {
-        cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
-        memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
+        newas->tcg_as_listener.commit = tcg_commit;
+        memory_listener_register(&newas->tcg_as_listener, as);
     }
 }
 #endif
@@ -628,6 +632,7 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     Error *local_err = NULL;
 
     cpu->as = NULL;
+    cpu->num_ases = 0;
 
 #ifndef CONFIG_USER_ONLY
     cpu->thread_id = qemu_get_thread_id();
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index eb3890a..9be0165 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -96,6 +96,10 @@ void cpu_reloading_memory_map(void);
  * The target-specific code which registers ASes is responsible
  * for defining what semantics address space 0, 1, 2, etc have.
  *
+ * Before the first call to this function, the caller must set
+ * cpu->num_ases to the total number of address spaces it needs
+ * to support.
+ *
  * Note that with KVM only one address space is supported.
  */
 void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx);
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 51a1323..ae17932 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -236,6 +236,7 @@ struct kvm_run;
  * so that interrupts take effect immediately.
  * @cpu_ases: Pointer to array of CPUAddressSpaces (which define the
  *            AddressSpaces this CPU has)
+ * @num_ases: number of CPUAddressSpaces in @cpu_ases
  * @as: Pointer to the first AddressSpace, for the convenience of targets which
  *      only have a single AddressSpace
  * @env_ptr: Pointer to subclass-specific CPUArchState field.
@@ -285,6 +286,7 @@ struct CPUState {
     struct qemu_work_item *queued_work_first, *queued_work_last;
 
     CPUAddressSpace *cpu_ases;
+    int num_ases;
     AddressSpace *as;
 
     void *env_ptr; /* CPUArchState */
diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index 9cf9f02..3f90323 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -2874,6 +2874,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         memory_region_add_subregion_overlap(cpu->cpu_as_root, 0, cpu->cpu_as_mem, 0);
         memory_region_set_enabled(cpu->cpu_as_mem, true);
         address_space_init(newas, cpu->cpu_as_root, "CPU");
+        cs->num_ases = 1;
         cpu_address_space_init(cs, newas, 0);
 
         /* ... SMRAM with higher priority, linked from /machine/smram.  */
-- 
1.9.1
