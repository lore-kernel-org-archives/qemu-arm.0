Received: by 10.25.159.19 with SMTP id i19csp1802014lfe;
        Thu, 14 Jan 2016 06:17:55 -0800 (PST)
X-Received: by 10.194.158.135 with SMTP id wu7mr4422643wjb.142.1452781072872;
        Thu, 14 Jan 2016 06:17:52 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id b1si9885839wje.202.2016.01.14.06.17.52
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:52 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UF-AI; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 04/19] cpu: Add new get_phys_page_attrs_debug() method
Date: Thu, 14 Jan 2016 13:52:40 +0000
Message-Id: <1452779575-32582-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: ubL/LH1SHbRm

Add a new optional method get_phys_page_attrs_debug() to CPUClass.
This is like the existing get_phys_page_debug(), but also returns
the memory transaction attributes to use for the access.
This will be necessary for CPUs which have multiple address
spaces and use the attributes to select the correct address
space.

We provide a wrapper function cpu_get_phys_page_attrs_debug()
which falls back to the existing get_phys_page_debug(), so we
don't need to change every target CPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/qom/cpu.h | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index ae17932..58605a5 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -98,6 +98,10 @@ struct TranslationBlock;
  * #TranslationBlock.
  * @handle_mmu_fault: Callback for handling an MMU fault.
  * @get_phys_page_debug: Callback for obtaining a physical address.
+ * @get_phys_page_attrs_debug: Callback for obtaining a physical address and the
+ *       associated memory transaction attributes to use for the access.
+ *       CPUs which use memory transaction attributes should implement this
+ *       instead of get_phys_page_debug.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @debug_excp_handler: Callback for handling debug exceptions.
@@ -152,6 +156,8 @@ typedef struct CPUClass {
     int (*handle_mmu_fault)(CPUState *cpu, vaddr address, int rw,
                             int mmu_index);
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
+    hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
+                                        MemTxAttrs *attrs);
     int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     void (*debug_excp_handler)(CPUState *cpu);
@@ -445,6 +451,32 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
 
 #ifndef CONFIG_USER_ONLY
 /**
+ * cpu_get_phys_page_attrs_debug:
+ * @cpu: The CPU to obtain the physical page address for.
+ * @addr: The virtual address.
+ * @attrs: Updated on return with the memory transaction attributes to use
+ *         for this access.
+ *
+ * Obtains the physical page corresponding to a virtual one, together
+ * with the corresponding memory transaction attributes to use for the access.
+ * Use it only for debugging because no protection checks are done.
+ *
+ * Returns: Corresponding physical page address or -1 if no page found.
+ */
+static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+/**
  * cpu_get_phys_page_debug:
  * @cpu: The CPU to obtain the physical page address for.
  * @addr: The virtual address.
@@ -456,9 +488,9 @@ void cpu_dump_statistics(CPUState *cpu, FILE *f, fprintf_function cpu_fprintf,
  */
 static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
+    MemTxAttrs attrs = {};
 
-    return cc->get_phys_page_debug(cpu, addr);
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
 }
 #endif
 
-- 
1.9.1
