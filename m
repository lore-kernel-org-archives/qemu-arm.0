Received: by 10.182.158.201 with SMTP id ww9csp129844obb;
        Mon, 16 Nov 2015 06:22:44 -0800 (PST)
X-Received: by 10.28.136.15 with SMTP id k15mr18350163wmd.51.1447683764795;
        Mon, 16 Nov 2015 06:22:44 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id n126si9109703wmf.19.2015.11.16.06.22.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:44 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPL-00013a-VZ; Mon, 16 Nov 2015 14:05:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 15/19] target-arm: Implement cpu_get_phys_page_attrs_debug
Date: Mon, 16 Nov 2015 14:05:19 +0000
Message-Id: <1447682723-3977-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: U01os1xy8BSM

Implement cpu_get_phys_page_attrs_debug instead of cpu_get_phys_page_debug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h | 3 ++-
 target-arm/cpu.c     | 2 +-
 target-arm/helper.c  | 7 +++----
 3 files changed, 6 insertions(+), 6 deletions(-)

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
index 32d0b5c..6b3cf32 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1449,7 +1449,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
-    cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
+    cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_is_big_endian;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4ecae61..ac388d1 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7323,7 +7323,8 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
     return ret;
 }
 
-hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -7332,16 +7333,14 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int prot;
     bool ret;
     uint32_t fsr;
-    MemTxAttrs attrs = {};
     ARMMMUFaultInfo fi = {};
 
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
