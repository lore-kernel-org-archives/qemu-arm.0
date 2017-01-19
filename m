Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c202sm54445161wmd.10.2017.01.19.09.05.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2017 09:05:24 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 26A533E2A37;
	Thu, 19 Jan 2017 17:05:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com
Cc: mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	bamvor.zhangjian@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v7 19/27] target-arm/powerctl: defer cpu reset work to CPU context
Date: Thu, 19 Jan 2017 17:04:59 +0000
Message-Id: <20170119170507.16185-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170119170507.16185-1-alex.bennee@linaro.org>
References: <20170119170507.16185-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E5RH+BBg1uVc

When switching a new vCPU on we want to complete a bunch of the setup
work before we start scheduling the vCPU thread. To do this cleanly we
defer vCPU setup to async work which will run the vCPUs execution
context as the thread is woken up. The scheduling of the work will kick
the vCPU awake.

This avoids potential races in MTTCG system emulation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>

---
v7
  - add const to static mode_for_el[] array
  - fix checkpatch long lines
---
 target/arm/arm-powerctl.c | 146 ++++++++++++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 58 deletions(-)

diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index fbb7a15daa..082788e3a4 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -48,11 +48,87 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
     return NULL;
 }
 
+struct cpu_on_info {
+    uint64_t entry;
+    uint64_t context_id;
+    uint32_t target_el;
+    bool target_aa64;
+};
+
+
+static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
+                                      run_on_cpu_data data)
+{
+    ARMCPU *target_cpu = ARM_CPU(target_cpu_state);
+    struct cpu_on_info *info = (struct cpu_on_info *) data.host_ptr;
+
+    /* Initialize the cpu we are turning on */
+    cpu_reset(target_cpu_state);
+    target_cpu->powered_off = false;
+    target_cpu_state->halted = 0;
+
+    if (info->target_aa64) {
+        if ((info->target_el < 3) && arm_feature(&target_cpu->env,
+                                                 ARM_FEATURE_EL3)) {
+            /*
+             * As target mode is AArch64, we need to set lower
+             * exception level (the requested level 2) to AArch64
+             */
+            target_cpu->env.cp15.scr_el3 |= SCR_RW;
+        }
+
+        if ((info->target_el < 2) && arm_feature(&target_cpu->env,
+                                                 ARM_FEATURE_EL2)) {
+            /*
+             * As target mode is AArch64, we need to set lower
+             * exception level (the requested level 1) to AArch64
+             */
+            target_cpu->env.cp15.hcr_el2 |= HCR_RW;
+        }
+
+        target_cpu->env.pstate = aarch64_pstate_mode(info->target_el, true);
+    } else {
+        /* We are requested to boot in AArch32 mode */
+        static const uint32_t mode_for_el[] = { 0,
+                                                ARM_CPU_MODE_SVC,
+                                                ARM_CPU_MODE_HYP,
+                                                ARM_CPU_MODE_SVC };
+
+        cpsr_write(&target_cpu->env, mode_for_el[info->target_el], CPSR_M,
+                   CPSRWriteRaw);
+    }
+
+    if (info->target_el == 3) {
+        /* Processor is in secure mode */
+        target_cpu->env.cp15.scr_el3 &= ~SCR_NS;
+    } else {
+        /* Processor is not in secure mode */
+        target_cpu->env.cp15.scr_el3 |= SCR_NS;
+    }
+
+    /* We check if the started CPU is now at the correct level */
+    assert(info->target_el == arm_current_el(&target_cpu->env));
+
+    if (info->target_aa64) {
+        target_cpu->env.xregs[0] = info->context_id;
+        target_cpu->env.thumb = false;
+    } else {
+        target_cpu->env.regs[0] = info->context_id;
+        target_cpu->env.thumb = info->entry & 1;
+        info->entry &= 0xfffffffe;
+    }
+
+    /* Start the new CPU at the requested address */
+    cpu_set_pc(target_cpu_state, info->entry);
+    g_free(info);
+}
+
 int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
                    uint32_t target_el, bool target_aa64)
 {
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
+    struct cpu_on_info *info;
 
     DPRINTF("cpu %" PRId64 " (EL %d, %s) @ 0x%" PRIx64 " with R0 = 0x%" PRIx64
             "\n", cpuid, target_el, target_aa64 ? "aarch64" : "aarch32", entry,
@@ -109,64 +185,18 @@ int arm_set_cpu_on(uint64_t cpuid, uint64_t entry, uint64_t context_id,
         return QEMU_ARM_POWERCTL_INVALID_PARAM;
     }
 
-    /* Initialize the cpu we are turning on */
-    cpu_reset(target_cpu_state);
-    target_cpu->powered_off = false;
-    target_cpu_state->halted = 0;
-
-    if (target_aa64) {
-        if ((target_el < 3) && arm_feature(&target_cpu->env, ARM_FEATURE_EL3)) {
-            /*
-             * As target mode is AArch64, we need to set lower
-             * exception level (the requested level 2) to AArch64
-             */
-            target_cpu->env.cp15.scr_el3 |= SCR_RW;
-        }
-
-        if ((target_el < 2) && arm_feature(&target_cpu->env, ARM_FEATURE_EL2)) {
-            /*
-             * As target mode is AArch64, we need to set lower
-             * exception level (the requested level 1) to AArch64
-             */
-            target_cpu->env.cp15.hcr_el2 |= HCR_RW;
-        }
-
-        target_cpu->env.pstate = aarch64_pstate_mode(target_el, true);
-    } else {
-        /* We are requested to boot in AArch32 mode */
-        static uint32_t mode_for_el[] = { 0,
-                                          ARM_CPU_MODE_SVC,
-                                          ARM_CPU_MODE_HYP,
-                                          ARM_CPU_MODE_SVC };
-
-        cpsr_write(&target_cpu->env, mode_for_el[target_el], CPSR_M,
-                   CPSRWriteRaw);
-    }
-
-    if (target_el == 3) {
-        /* Processor is in secure mode */
-        target_cpu->env.cp15.scr_el3 &= ~SCR_NS;
-    } else {
-        /* Processor is not in secure mode */
-        target_cpu->env.cp15.scr_el3 |= SCR_NS;
-    }
-
-    /* We check if the started CPU is now at the correct level */
-    assert(target_el == arm_current_el(&target_cpu->env));
-
-    if (target_aa64) {
-        target_cpu->env.xregs[0] = context_id;
-        target_cpu->env.thumb = false;
-    } else {
-        target_cpu->env.regs[0] = context_id;
-        target_cpu->env.thumb = entry & 1;
-        entry &= 0xfffffffe;
-    }
-
-    /* Start the new CPU at the requested address */
-    cpu_set_pc(target_cpu_state, entry);
-
-    qemu_cpu_kick(target_cpu_state);
+    /* To avoid racing with a CPU we are just kicking off we do the
+     * final bit of preparation for the work in the target CPUs
+     * context.
+     */
+    info = g_new(struct cpu_on_info, 1);
+    info->entry = entry;
+    info->context_id = context_id;
+    info->target_el = target_el;
+    info->target_aa64 = target_aa64;
+
+    async_run_on_cpu(target_cpu_state, arm_set_cpu_on_async_work,
+                     RUN_ON_CPU_HOST_PTR(info));
 
     /* We are good to go */
     return QEMU_ARM_POWERCTL_RET_SUCCESS;
-- 
2.11.0
