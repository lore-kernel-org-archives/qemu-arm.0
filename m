Received: by 10.182.105.169 with SMTP id gn9csp619079obb;
        Thu, 5 Nov 2015 10:16:23 -0800 (PST)
X-Received: by 10.194.114.70 with SMTP id je6mr9928259wjb.7.1446747371614;
        Thu, 05 Nov 2015 10:16:11 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id q71si7898020wmb.14.2015.11.05.10.16.11
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4o-0004kN-VY; Thu, 05 Nov 2015 18:15:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 02/16] exec.c: Allow target CPUs to define multiple AddressSpaces
Date: Thu,  5 Nov 2015 18:15:44 +0000
Message-Id: <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: R8J/w0yQdzvT

Allow multiple calls to cpu_address_space_init(); each
call adds an entry to the cpu->ases array at the specified
index. It is up to the target-specific CPU code to actually use
these extra address spaces.

Since this multiple AddressSpace support won't work with
KVM, add an assertion to avoid confusing failures.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 exec.c            | 28 ++++++++++++++++++----------
 include/qom/cpu.h |  2 ++
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/exec.c b/exec.c
index b5490c8..6a2a694 100644
--- a/exec.c
+++ b/exec.c
@@ -552,25 +552,32 @@ CPUState *qemu_get_cpu(int index)
 #if !defined(CONFIG_USER_ONLY)
 void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
 {
+    CPUAddressSpace *newas;
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
+    if (asidx >= cpu->num_ases) {
+        if (cpu->num_ases == 0) {
+            cpu->cpu_ases = g_new(CPUAddressSpace, asidx + 1);
+        } else {
+            cpu->cpu_ases = g_renew(CPUAddressSpace, cpu->cpu_ases, asidx + 1);
+        }
+        cpu->num_ases = asidx + 1;
     }
 
-    cpu->cpu_ases = g_new0(CPUAddressSpace, 1);
-    cpu->cpu_ases[0].cpu = cpu;
-    cpu->cpu_ases[0].as = as;
+    newas = &cpu->cpu_ases[asidx];
+    memset(newas, 0, sizeof(*newas));
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
@@ -627,6 +634,7 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     Error *local_err = NULL;
 
     cpu->as = NULL;
+    cpu->num_ases = 0;
 
 #ifndef CONFIG_USER_ONLY
     cpu->thread_id = qemu_get_thread_id();
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
-- 
1.9.1
