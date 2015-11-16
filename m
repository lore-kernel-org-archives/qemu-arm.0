Received: by 10.182.158.201 with SMTP id ww9csp129698obb;
        Mon, 16 Nov 2015 06:22:30 -0800 (PST)
X-Received: by 10.28.87.67 with SMTP id l64mr18117605wmb.72.1447683745109;
        Mon, 16 Nov 2015 06:22:25 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id kp6si46218206wjc.145.2015.11.16.06.22.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013O-QK; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 12/19] qom/cpu: Add MemoryRegion property
Date: Mon, 16 Nov 2015 14:05:16 +0000
Message-Id: <1447682723-3977-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: /U+Md2f9/5LF

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Add a MemoryRegion property, which if set is used to construct
the CPU's initial (default) AddressSpace.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
[PMM: code is moved from qom/cpu.c to exec.c to avoid having to
 make qom/cpu.o be a non-common object file; code to use the
 MemoryRegion and to default it to system_memory added.]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cpus.c            |  4 +++-
 exec.c            | 14 ++++++++++++++
 include/qom/cpu.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 4cea798..aedcdd1 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1375,8 +1375,10 @@ void qemu_init_vcpu(CPUState *cpu)
         /* If the target cpu hasn't set up any address spaces itself,
          * give it the default one.
          */
+        AddressSpace *as = address_space_init_shareable(cpu->memory,
+                                                        "cpu-memory");
         cpu->num_ases = 1;
-        cpu_address_space_init(cpu, &address_space_memory, 0);
+        cpu_address_space_init(cpu, as, 0);
     }
 
     if (kvm_enabled()) {
diff --git a/exec.c b/exec.c
index a455632..ab55248 100644
--- a/exec.c
+++ b/exec.c
@@ -643,6 +643,20 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     cpu->thread_id = qemu_get_thread_id();
+
+    /* This is a softmmu CPU object, so create a property for it
+     * so users can wire up its memory. (This can't go in qom/cpu.c
+     * because that file is compiled only once for both user-mode
+     * and system builds.) The default if no link is set up is to use
+     * the system address space.
+     */
+    object_property_add_link(OBJECT(cpu), "memory", TYPE_MEMORY_REGION,
+                             (Object **)&cpu->memory,
+                             qdev_prop_allow_set_link_before_realize,
+                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
+                             &error_abort);
+    cpu->memory = system_memory;
+    object_ref(OBJECT(cpu->memory));
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index ed23246..2e5229d 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -297,6 +297,7 @@ struct CPUState {
     CPUAddressSpace *cpu_ases;
     int num_ases;
     AddressSpace *as;
+    MemoryRegion *memory;
 
     void *env_ptr; /* CPUArchState */
     struct TranslationBlock *current_tb;
-- 
1.9.1
