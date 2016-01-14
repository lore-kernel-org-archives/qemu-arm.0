Received: by 10.25.159.19 with SMTP id i19csp1786096lfe;
        Thu, 14 Jan 2016 05:52:59 -0800 (PST)
X-Received: by 10.25.153.79 with SMTP id b76mr1121201lfe.102.1452779578070;
        Thu, 14 Jan 2016 05:52:58 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id mp5si254613lbb.171.2016.01.14.05.52.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:52:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008UJ-Br; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 05/19] cpu: Add new asidx_from_attrs() method
Date: Thu, 14 Jan 2016 13:52:41 +0000
Message-Id: <1452779575-32582-6-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: h+9gQieawbkx

Add a new method to CPUClass which the memory system core can
use to obtain the correct address space index to use for a memory
access with a given set of transaction attributes, together
with the wrapper function cpu_asidx_from_attrs() which implements
the default behaviour ("always use asidx 0") for CPU classes
which don't provide the method.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
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
