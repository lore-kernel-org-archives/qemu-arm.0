Received: by 10.182.105.169 with SMTP id gn9csp618944obb;
        Thu, 5 Nov 2015 10:16:08 -0800 (PST)
X-Received: by 10.194.60.5 with SMTP id d5mr10889349wjr.97.1446747364945;
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ln5si9485969wjb.201.2015.11.05.10.16.04
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:04 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004kt-C0; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 10/16] target-arm: Implement cpu_get_phys_page_asidx_debug
Date: Thu,  5 Nov 2015 18:15:52 +0000
Message-Id: <1446747358-18214-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: AZxfF1QoLGmx

Implement cpu_get_phys_page_asidx_debug instead of cpu_get_phys_page_debug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h | 2 +-
 target-arm/cpu.c     | 2 +-
 target-arm/helper.c  | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 25fb1ce..53d3129 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -216,7 +216,7 @@ bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
                         int flags);
 
-hwaddr arm_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+hwaddr arm_cpu_get_phys_page_asidx_debug(CPUState *cpu, vaddr addr, int *asidx);
 
 int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 30739fc..7789d50 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1417,7 +1417,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->handle_mmu_fault = arm_cpu_handle_mmu_fault;
 #else
     cc->do_interrupt = arm_cpu_do_interrupt;
-    cc->get_phys_page_debug = arm_cpu_get_phys_page_debug;
+    cc->get_phys_page_asidx_debug = arm_cpu_get_phys_page_asidx_debug;
     cc->vmsd = &vmstate_arm_cpu;
     cc->virtio_is_big_endian = arm_cpu_is_big_endian;
 #endif
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 242928d..db7e81a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7327,7 +7327,7 @@ bool arm_tlb_fill(CPUState *cs, vaddr address,
     return ret;
 }
 
-hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+hwaddr arm_cpu_get_phys_page_asidx_debug(CPUState *cs, vaddr addr, int *asidx)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -7346,6 +7346,7 @@ hwaddr arm_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
         return -1;
     }
 
+    *asidx = arm_asidx(cs, attrs.secure);
     return phys_addr;
 }
 
-- 
1.9.1
