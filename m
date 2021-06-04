Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b8sm5400497wmd.35.2021.06.04.09.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 378FA1FFDE;
	Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 70/99] target/arm: move TCG gt timer creation code in tcg/
Date: Fri,  4 Jun 2021 16:52:43 +0100
Message-Id: <20210604155312.15902-71-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: C++rkWrCpYAc

From: Claudio Fontana <cfontana@suse.de>

we need to be careful not to use

if (tcg_enabled())

here, because of the VMSTATE definitions in machine.c,
which are only protected by CONFIG_TCG, and thus
it would break the --enable-tcg --enable-kvm build.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-cpu.h        |  1 +
 target/arm/cpu.c                | 30 ++++---------------------
 target/arm/tcg/sysemu/tcg-cpu.c | 40 +++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index dd08587949..3e4ce2c355 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -33,6 +33,7 @@ void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
 /* Do semihosting call and set the appropriate return value. */
 void tcg_handle_semihosting(CPUState *cs);
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 945dfbbe9d..2fef8ca471 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -859,32 +859,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     bool no_aa32 = false;
 
 #if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
-    {
-        uint64_t scale;
-
-        if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
-            if (!cpu->gt_cntfrq_hz) {
-                error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
-                           cpu->gt_cntfrq_hz);
-                return;
-            }
-            scale = gt_cntfrq_period_ns(cpu);
-        } else {
-            scale = GTIMER_SCALE;
-        }
-
-        cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_ptimer_cb, cpu);
-        cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                               arm_gt_vtimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_htimer_cb, cpu);
-        cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                              arm_gt_stimer_cb, cpu);
-        cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
-                                                  arm_gt_hvtimer_cb, cpu);
-    }
-#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
+    if (!tcg_cpu_realize_gt_timers(cs, errp)) {
+        return;
+    }
+#endif
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 115ac523dc..1c6df15092 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -54,6 +54,46 @@ void tcg_handle_semihosting(CPUState *cs)
     }
 }
 
+/*
+ * we cannot use tcg_enabled() to condition the call to this function,
+ * due to the fields VMSTATE definitions in machine.c : it would break
+ * the --enable-tcg --enable-kvm build. We need to run this code whenever
+ * CONFIG_TCG is true, regardless of the chosen accelerator.
+ *
+ * So we cannot call this from tcg_cpu_realizefn, as this needs to
+ * be called whenever TCG is built-in, regardless of whether it is
+ * enabled or not.
+ */
+bool tcg_cpu_realize_gt_timers(CPUState *cs, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t scale;
+
+    if (arm_feature(env, ARM_FEATURE_GENERIC_TIMER)) {
+        if (!cpu->gt_cntfrq_hz) {
+            error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz",
+                       cpu->gt_cntfrq_hz);
+            return false;
+        }
+        scale = gt_cntfrq_period_ns(cpu);
+    } else {
+        scale = GTIMER_SCALE;
+    }
+
+    cpu->gt_timer[GTIMER_PHYS] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_ptimer_cb, cpu);
+    cpu->gt_timer[GTIMER_VIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                           arm_gt_vtimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYP] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_htimer_cb, cpu);
+    cpu->gt_timer[GTIMER_SEC] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                          arm_gt_stimer_cb, cpu);
+    cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                              arm_gt_hvtimer_cb, cpu);
+    return true;
+}
+
 bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(cs);
-- 
2.20.1
