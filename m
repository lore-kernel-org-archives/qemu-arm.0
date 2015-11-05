Received: by 10.182.105.169 with SMTP id gn9csp619059obb;
        Thu, 5 Nov 2015 10:16:21 -0800 (PST)
X-Received: by 10.194.192.167 with SMTP id hh7mr11617413wjc.79.1446747370997;
        Thu, 05 Nov 2015 10:16:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id o188si12432359wmg.47.2015.11.05.10.16.10
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kd-5x; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 06/16] include/qom/cpu.h: Add new get_phys_page_asidx_debug method
Date: Thu,  5 Nov 2015 18:15:48 +0000
Message-Id: <1446747358-18214-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: xgU+cYLZSppb

Add a new optional method get_phys_page_asidx_debug to CPUClass.
This is like the existing get_phys_page_debug, but also returns
the address space index to use for the access. This is necessary
for CPUs which have multiple address spaces.

We provide a wrapper function cpu_get_phys_page_asidx_debug()
which falls back to the existing get_phys_page_debug(), so we
don't need to change every target CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qom/cpu.h | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index ae17932..10ef5cc 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -98,6 +98,9 @@ struct TranslationBlock;
  * #TranslationBlock.
  * @handle_mmu_fault: Callback for handling an MMU fault.
  * @get_phys_page_debug: Callback for obtaining a physical address.
+ * @get_phys_page_asidx_debug: Callback for obtaining a physical address and the
+ *       associated address index. CPUs which have more than one AddressSpace
+ *       should implement this instead of get_phys_page_debug.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @debug_excp_handler: Callback for handling debug exceptions.
@@ -152,6 +155,7 @@ typedef struct CPUClass {
     int (*handle_mmu_fault)(CPUState *cpu, vaddr address, int rw,
                             int mmu_index);
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    hwaddr (*get_phys_page_asidx_debug)(CPUState *cpu, vaddr addr, int *asidx);
     int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     void (*debug_excp_handler)(CPUState *cpu);
@@ -445,6 +449,32 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
 
 #ifndef CONFIG_USER_ONLY
 /**
+ * cpu_get_phys_page_asidx_debug:
+ * @cpu: The CPU to obtain the physical page address for.
+ * @addr: The virtual address.
+ * @asidx: Updated on return with the address space index for this access.
+ *
+ * Obtains the physical page corresponding to a virtual one, together
+ * with the corresponding address space index indicating which AddressSpace
+ * to look the physical address up in.
+ * Use it only for debugging because no protection checks are done.
+ *
+ * Returns: Corresponding physical page address or -1 if no page found.
+ */
+static inline hwaddr cpu_get_phys_page_asidx_debug(CPUState *cpu, vaddr addr,
+                                                   int *asidx)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_asidx_debug) {
+        return cc->get_phys_page_asidx_debug(cpu, addr, asidx);
+    }
+    /* Fallback for CPUs which don't have multiple address spaces */
+    *asidx = 0;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+/**
  * cpu_get_phys_page_debug:
  * @cpu: The CPU to obtain the physical page address for.
  * @addr: The virtual address.
@@ -456,9 +486,9 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
  */
 static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int asidx;
 
-    return cc->get_phys_page_debug(cpu, addr);
+    return cpu_get_phys_page_asidx_debug(cpu, addr, &asidx);
 }
 #endif
 
-- 
1.9.1
