Received: by 10.182.158.201 with SMTP id ww9csp129402obb;
        Mon, 16 Nov 2015 06:22:01 -0800 (PST)
X-Received: by 10.28.100.69 with SMTP id y66mr20042394wmb.98.1447683721153;
        Mon, 16 Nov 2015 06:22:01 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id t63si7542511wmd.18.2015.11.16.06.22.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00012w-Ej; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 05/19] include/qom/cpu.h: Add new asidx_from_attrs method
Date: Mon, 16 Nov 2015 14:05:09 +0000
Message-Id: <1447682723-3977-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: Dm6IAdOgOoY/

Add a new method to CPUClass which the memory system core can
use to obtain the correct address space index to use for a memory
access with a given set of transaction attributes, together
with the wrapper function cpu_asidx_from_attrs() which implements
the default behaviour ("always use asidx 0") for CPU classes
which don't provide the method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qom/cpu.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 58605a5..ed23246 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -102,6 +102,8 @@ struct TranslationBlock;
  *       associated memory transaction attributes to use for the access.
  *       CPUs which use memory transaction attributes should implement this
  *       instead of get_phys_page_debug.
+ * @asidx_from_attrs: Callback to return the CPU AddressSpace to use for
+ *       a memory access with the specified memory transaction attributes.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
  * @debug_excp_handler: Callback for handling debug exceptions.
@@ -158,6 +160,7 @@ typedef struct CPUClass {
     hwaddr (*get_phys_page_debug)(CPUState *cpu, vaddr addr);
     hwaddr (*get_phys_page_attrs_debug)(CPUState *cpu, vaddr addr,
                                         MemTxAttrs *attrs);
+    int (*asidx_from_attrs)(CPUState *cpu, MemTxAttrs attrs);
     int (*gdb_read_register)(CPUState *cpu, uint8_t *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     void (*debug_excp_handler)(CPUState *cpu);
@@ -492,6 +495,23 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
 
     return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
 }
+
+/** cpu_asidx_from_attrs:
+ * @cpu: CPU
+ * @attrs: memory transaction attributes
+ *
+ * Returns the address space index specifying the CPU AddressSpace
+ * to use for a memory access with the given transaction attributes.
+ */
+static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->asidx_from_attrs) {
+        return cc->asidx_from_attrs(cpu, attrs);
+    }
+    return 0;
+}
 #endif
 
 /**
-- 
1.9.1
