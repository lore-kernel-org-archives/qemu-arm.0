Received: by 10.182.105.169 with SMTP id gn9csp619140obb;
        Thu, 5 Nov 2015 10:16:30 -0800 (PST)
X-Received: by 10.28.19.7 with SMTP id 7mr5651409wmt.89.1446747373832;
        Thu, 05 Nov 2015 10:16:13 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id r187si11512383wmg.44.2015.11.05.10.16.13
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004l5-Gr; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 13/16] target-arm: Add QOM property for Secure memory region
Date: Thu,  5 Nov 2015 18:15:55 +0000
Message-Id: <1446747358-18214-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: ECwO8ls94ndO

Add QOM property to the ARM CPU which boards can use to tell us what
memory region to use for secure accesses. Nonsecure accesses
go via the memory region specified with the base CPU class 'memory'
property.

By default, if no secure region is specified it is the same as the
nonsecure region, and if no nonsecure region is specified we will use
address_space_memory.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h |  3 +++
 target-arm/cpu.c     | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 53d3129..75dc74e 100644
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
index 7789d50..85e2bc8 100644
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
@@ -665,6 +674,23 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     init_cpreg_list(cpu);
 
+#ifndef CONFIG_USER_ONLY
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
 
-- 
1.9.1
