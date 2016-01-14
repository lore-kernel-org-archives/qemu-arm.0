Received: by 10.25.159.19 with SMTP id i19csp1786275lfe;
        Thu, 14 Jan 2016 05:53:18 -0800 (PST)
X-Received: by 10.107.131.40 with SMTP id f40mr5066735iod.190.1452779581712;
        Thu, 14 Jan 2016 05:53:01 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 82si12935816ioo.17.2016.01.14.05.53.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:53:01 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008Ux-T8; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 15/19] target-arm: Implement cpu_get_phys_page_attrs_debug
Date: Thu, 14 Jan 2016 13:52:51 +0000
Message-Id: <1452779575-32582-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: pdXnGtzvWUzG

Implement cpu_get_phys_page_attrs_debug instead of cpu_get_phys_page_debug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/cpu-qom.h | 3 ++-
 target-arm/cpu.c     | 2 +-
 target-arm/helper.c  | 9 +++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 8cb5bd5..e4d4270 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -219,7 +219,8 @@ bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
                         int flags);
 
-hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                         MemTxAttrs *attrs);
 
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index ab0021e..4b21e24 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1450,7 +1450,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
-    cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
+    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_is_big_endian;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 59d5a41..26cd74b 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7341,7 +7341,8 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
     return ret;
 }
 
-hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -7350,16 +7351,16 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     bool ret;
     uint32_t fsr;
-    MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
 
+    *attrs = (MemTxAttrs) {};
+
     ret = get_phys_addr(env, addr, 0, cpu_mmu_index(env, false), &phys_addr,
-                        &attrs, &prot, &page_size, &fsr, &fi);
+                        attrs, &prot, &page_size, &fsr, &fi);
 
     if (ret) {
         return -1;
     }
-
     return phys_addr;
 }
 
-- 
1.9.1
