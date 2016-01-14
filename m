Received: by 10.25.159.19 with SMTP id i19csp1801984lfe;
        Thu, 14 Jan 2016 06:17:51 -0800 (PST)
X-Received: by 10.194.134.134 with SMTP id pk6mr4385116wjb.176.1452781071664;
        Thu, 14 Jan 2016 06:17:51 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id k135si12073907wmg.72.2016.01.14.06.17.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:51 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008Ul-N2; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 12/19] qom/cpu: Add MemoryRegion property
Date: Thu, 14 Jan 2016 13:52:48 +0000
Message-Id: <1452779575-32582-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Zp4lsSHfMFDs

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Add a MemoryRegion property, which if set is used to construct
the CPU's initial (default) AddressSpace.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
[PMM: code is moved from qom/cpu.c to exec.c to avoid having to
 make qom/cpu.o be a non-common object file; code to use the
 MemoryRegion and to default it to system_memory added.]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 cpus.c            |  4 +++-
 exec.c            | 14 ++++++++++++++
 include/qom/cpu.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/cpus.c b/cpus.c
index 725a51d..3efff6b 100644
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
index 0e4f681..5a1b208 100644
--- a/exec.c
+++ b/exec.c
@@ -628,6 +628,20 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
 
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
