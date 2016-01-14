Received: by 10.25.159.19 with SMTP id i19csp1786076lfe;
        Thu, 14 Jan 2016 05:52:57 -0800 (PST)
X-Received: by 10.194.241.228 with SMTP id wl4mr4261748wjc.11.1452779577490;
        Thu, 14 Jan 2016 05:52:57 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id av1si9732725wjc.216.2016.01.14.05.52.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:52:57 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKd-0008Up-Ox; Thu, 14 Jan 2016 13:52:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 13/19] target-arm: Add QOM property for Secure memory region
Date: Thu, 14 Jan 2016 13:52:49 +0000
Message-Id: <1452779575-32582-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: PQkVFCqRqf1+

Add QOM property to the ARM CPU which boards can use to tell us what
memory region to use for secure accesses. Nonsecure accesses
go via the memory region specified with the base CPU class 'memory'
property.

By default, if no secure region is specified it is the same as the
nonsecure region, and if no nonsecure region is specified we will use
address_space_memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/cpu-qom.h |  3 +++
 target-arm/cpu.c     | 32 ++++++++++++++++++++++++++++++++
 target-arm/cpu.h     |  6 ++++++
 3 files changed, 41 insertions(+)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 25fb1ce..8cb5bd5 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -87,6 +87,9 @@ typedef struct ARMCPU {
     /* GPIO outputs for generic timer */
     qemu_irq gt_timer_outputs[NUM_GTIMERS];
 
+    /* MemoryRegion to use for secure physical accesses */
+    MemoryRegion *secure_memory;
+
     /* 'compatible' string for this CPU for Linux device trees */
     const char *dtb_compatible;
 
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 35a1f12..34caa1b 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -542,6 +542,15 @@ static void arm_cpu_post_init(Object *obj)
          */
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_el3_property,
                                  &error_abort);
+
+#ifndef CONFIG_USER_ONLY
+        object_property_add_link(obj, "secure-memory",
+                                 TYPE_MEMORY_REGION,
+                                 (Object **)&cpu->secure_memory,
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_UNREF_ON_RELEASE,
+                                 &error_abort);
+#endif
     }
 
     if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
@@ -665,6 +674,29 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     init_cpreg_list(cpu);
 
+#ifndef CONFIG_USER_ONLY
+    if (cpu->has_el3) {
+        cs->num_ases = 2;
+    } else {
+        cs->num_ases = 1;
+    }
+
+    if (cpu->has_el3) {
+        AddressSpace *as;
+
+        if (!cpu->secure_memory) {
+            cpu->secure_memory = cs->memory;
+        }
+        as = address_space_init_shareable(cpu->secure_memory,
+                                          "cpu-secure-memory");
+        cpu_address_space_init(cs, as, ARMASIdx_S);
+    }
+    cpu_address_space_init(cs,
+                           address_space_init_shareable(cs->memory,
+                                                        "cpu-memory"),
+                           ARMASIdx_NS);
+#endif
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 815fef8..9108b5b 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1720,6 +1720,12 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
     return el;
 }
 
+/* Indexes used when registering address spaces with cpu_address_space_init */
+typedef enum ARMASIdx {
+    ARMASIdx_NS = 0,
+    ARMASIdx_S = 1,
+} ARMASIdx;
+
 /* Return the Exception Level targeted by debug exceptions;
  * currently always EL1 since we don't implement EL2 or EL3.
  */
-- 
1.9.1
