Received: by 10.182.105.169 with SMTP id gn9csp619122obb;
        Thu, 5 Nov 2015 10:16:28 -0800 (PST)
X-Received: by 10.28.146.133 with SMTP id u127mr5804523wmd.94.1446747373012;
        Thu, 05 Nov 2015 10:16:13 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id d3si9567120wjb.4.2015.11.05.10.16.12
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:12 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004l1-FB; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 12/16] qom/cpu: Add MemoryRegion property
Date: Thu,  5 Nov 2015 18:15:54 +0000
Message-Id: <1446747358-18214-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: yhb8VFI8J0Uc

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
 exec.c            | 13 +++++++++++++
 include/qom/cpu.h |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 764ea75..b7c19e0 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1356,7 +1356,9 @@ void qemu_init_vcpu(CPUState *cpu)
         /* If the target cpu hasn't set up any address spaces itself,
          * give it the default one.
          */
-        cpu_address_space_init(cpu, &address_space_memory, 0);
+        AddressSpace *as = address_space_init_shareable(cpu->memory,
+                                                        "cpu-memory");
+        cpu_address_space_init(cpu, as, 0);
     }
 
     if (kvm_enabled()) {
diff --git a/exec.c b/exec.c
index 9998fa0..21b1b57 100644
--- a/exec.c
+++ b/exec.c
@@ -637,6 +637,19 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
 
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
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 10ef5cc..39a9a24 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -292,6 +292,7 @@ struct CPUState {
     CPUAddressSpace *cpu_ases;
     int num_ases;
     AddressSpace *as;
+    MemoryRegion *memory;
 
     void *env_ptr; /* CPUArchState */
     struct TranslationBlock *current_tb;
-- 
1.9.1
