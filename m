Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963b5072sm578167666b.178.2024.12.18.10.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:15:12 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id B96BD5FBC6;
	Wed, 18 Dec 2024 18:15:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
	Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-stable@nongnu.org,
	Andrei Homescu <ahomescu@google.com>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@google.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi.denis.courmont@huawei.com>
Subject: [PATCH v2 3/5] target/arm: implement SEL2 physical and virtual timers
Date: Wed, 18 Dec 2024 18:15:09 +0000
Message-Id: <20241218181511.3575613-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241218181511.3575613-1-alex.bennee@linaro.org>
References: <20241218181511.3575613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +aGynHx/TKuK

When FEAT_SEL2 was implemented the SEL2 timers where missed. This
shows up when building the latest Hafnium with SPMC_AT_EL=2. The
actual implementation utilises the same logic as the rest of the
timers so all we need to do is:

  - define the timers and their access functions
  - conditionally add the correct system registers
  - create a new accessfn as the rules are subtly different to the
    existing secure timer

Fixes: e9152ee91c (target/arm: add ARMv8.4-SEL2 system registers)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org
Cc: Andrei Homescu <ahomescu@google.com>
Cc: Arve Hjønnevåg <arve@google.com>
Cc: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

---
v1
  - add better comments to GTIMER descriptions
  - also define new timers for sbsa-ref
  - don't conditionally gate qemu_timer creation on the feature
  - take cntvoff_el2 int account for SEC_VEL2 in gt_recalc/g_tval_[read|write]
v2
  - rename IRQ to ARCH_TIMER_S_EL2_VIRT_IRQ
  - split machine enablement into separate patches
  - return CP_ACCESS_TRAP_UNCATEGORIZED for UNDEF cases
---
 include/hw/arm/bsa.h |   2 +
 target/arm/cpu.h     |   2 +
 target/arm/gtimer.h  |   4 +-
 target/arm/cpu.c     |   4 ++
 target/arm/helper.c  | 158 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 169 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/bsa.h b/include/hw/arm/bsa.h
index 8eaab603c0..13ed2d2ac1 100644
--- a/include/hw/arm/bsa.h
+++ b/include/hw/arm/bsa.h
@@ -22,6 +22,8 @@
 #define QEMU_ARM_BSA_H
 
 /* These are architectural INTID values */
+#define ARCH_TIMER_S_EL2_VIRT_IRQ  19
+#define ARCH_TIMER_S_EL2_IRQ       20
 #define VIRTUAL_PMU_IRQ            23
 #define ARCH_GIC_MAINT_IRQ         25
 #define ARCH_TIMER_NS_EL2_IRQ      26
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d86e641280..10b5354d6f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1139,6 +1139,8 @@ void arm_gt_vtimer_cb(void *opaque);
 void arm_gt_htimer_cb(void *opaque);
 void arm_gt_stimer_cb(void *opaque);
 void arm_gt_hvtimer_cb(void *opaque);
+void arm_gt_sel2timer_cb(void *opaque);
+void arm_gt_sel2vtimer_cb(void *opaque);
 
 unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 void gt_rme_post_el_change(ARMCPU *cpu, void *opaque);
diff --git a/target/arm/gtimer.h b/target/arm/gtimer.h
index de016e6da3..f8f7425a5f 100644
--- a/target/arm/gtimer.h
+++ b/target/arm/gtimer.h
@@ -15,7 +15,9 @@ enum {
     GTIMER_HYP      = 2, /* EL2 physical timer */
     GTIMER_SEC      = 3, /* EL3 physical timer */
     GTIMER_HYPVIRT  = 4, /* EL2 virtual timer */
-#define NUM_GTIMERS   5
+    GTIMER_SEC_PEL2 = 5, /* Secure EL2 physical timer */
+    GTIMER_SEC_VEL2 = 6, /* Secure EL2 virtual timer */
+#define NUM_GTIMERS   7
 };
 
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1afa07511e..631cc2728d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2088,6 +2088,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
                                               arm_gt_stimer_cb, cpu);
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
+        cpu->gt_timer[GTIMER_SEC_PEL2] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                                   arm_gt_sel2timer_cb, cpu);
+        cpu->gt_timer[GTIMER_SEC_VEL2] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
+                                                   arm_gt_sel2vtimer_cb, cpu);
     }
 #endif
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5a1b416e18..79894b4802 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2401,6 +2401,41 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
     }
 }
 
+static CPAccessResult gt_sel2timer_access(CPUARMState *env,
+                                          const ARMCPRegInfo *ri,
+                                          bool isread)
+{
+    /*
+     * The AArch64 register view of the secure EL2 timers are mostly
+     * accessible from EL3 and EL2 although can also be trapped to EL2
+     * from EL1 depending on nested virt config.
+     */
+    switch (arm_current_el(env)) {
+    case 0:
+        return CP_ACCESS_TRAP;
+    case 1:
+        if (!arm_is_secure(env)) {
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        } else if (arm_hcr_el2_eff(env) & HCR_NV) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        return CP_ACCESS_TRAP;
+    case 2:
+        if (!arm_is_secure(env)) {
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+        return CP_ACCESS_OK;
+    case 3:
+        if (env->cp15.scr_el3 & SCR_EEL2) {
+            return CP_ACCESS_OK;
+        } else {
+            return CP_ACCESS_TRAP_UNCATEGORIZED;
+        }
+    default:
+        g_assert_not_reached();
+    }
+}
+
 uint64_t gt_get_countervalue(CPUARMState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -2477,6 +2512,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
         switch (timeridx) {
         case GTIMER_VIRT:
         case GTIMER_HYPVIRT:
+        case GTIMER_SEC_VEL2:
             offset = cpu->env.cp15.cntvoff_el2;
             break;
         default:
@@ -2591,6 +2627,7 @@ static uint64_t gt_tval_read(CPUARMState *env, const ARMCPRegInfo *ri,
     switch (timeridx) {
     case GTIMER_VIRT:
     case GTIMER_HYPVIRT:
+    case GTIMER_SEC_VEL2:
         offset = gt_virt_cnt_offset(env);
         break;
     case GTIMER_PHYS:
@@ -2611,6 +2648,7 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
     switch (timeridx) {
     case GTIMER_VIRT:
     case GTIMER_HYPVIRT:
+    case GTIMER_SEC_VEL2:
         offset = gt_virt_cnt_offset(env);
         break;
     case GTIMER_PHYS:
@@ -2919,6 +2957,62 @@ static void gt_sec_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gt_ctl_write(env, ri, GTIMER_SEC, value);
 }
 
+static void gt_sec_pel2_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    gt_timer_reset(env, ri, GTIMER_SEC_PEL2);
+}
+
+static void gt_sec_pel2_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    gt_cval_write(env, ri, GTIMER_SEC_PEL2, value);
+}
+
+static uint64_t gt_sec_pel2_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return gt_tval_read(env, ri, GTIMER_SEC_PEL2);
+}
+
+static void gt_sec_pel2_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_tval_write(env, ri, GTIMER_SEC_PEL2, value);
+}
+
+static void gt_sec_pel2_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_ctl_write(env, ri, GTIMER_SEC_PEL2, value);
+}
+
+static void gt_sec_vel2_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    gt_timer_reset(env, ri, GTIMER_SEC_VEL2);
+}
+
+static void gt_sec_vel2_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_cval_write(env, ri, GTIMER_SEC_VEL2, value);
+}
+
+static uint64_t gt_sec_vel2_tval_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return gt_tval_read(env, ri, GTIMER_SEC_VEL2);
+}
+
+static void gt_sec_vel2_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   uint64_t value)
+{
+    gt_tval_write(env, ri, GTIMER_SEC_VEL2, value);
+}
+
+static void gt_sec_vel2_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    gt_ctl_write(env, ri, GTIMER_SEC_VEL2, value);
+}
+
 static void gt_hv_timer_reset(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     gt_timer_reset(env, ri, GTIMER_HYPVIRT);
@@ -2975,6 +3069,20 @@ void arm_gt_stimer_cb(void *opaque)
     gt_recalc_timer(cpu, GTIMER_SEC);
 }
 
+void arm_gt_sel2timer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    gt_recalc_timer(cpu, GTIMER_SEC_PEL2);
+}
+
+void arm_gt_sel2vtimer_cb(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    gt_recalc_timer(cpu, GTIMER_SEC_VEL2);
+}
+
 void arm_gt_hvtimer_cb(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -5696,6 +5804,56 @@ static const ARMCPRegInfo el2_sec_cp_reginfo[] = {
       .access = PL2_RW, .accessfn = sel2_access,
       .nv2_redirect_offset = 0x48,
       .fieldoffset = offsetof(CPUARMState, cp15.vstcr_el2) },
+#ifndef CONFIG_USER_ONLY
+    /* Secure EL2 Physical Timer */
+    { .name = "CNTHPS_TVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 0,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .readfn = gt_sec_pel2_tval_read,
+      .writefn = gt_sec_pel2_tval_write,
+      .resetfn = gt_sec_pel2_timer_reset,
+    },
+    { .name = "CNTHPS_CTL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 1,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC_PEL2].ctl),
+      .resetvalue = 0,
+      .writefn = gt_sec_pel2_ctl_write, .raw_writefn = raw_write,
+    },
+    { .name = "CNTHPS_CVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 5, .opc2 = 2,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC_PEL2].cval),
+      .writefn = gt_sec_pel2_cval_write, .raw_writefn = raw_write,
+    },
+    /* Secure EL2 Virtual Timer */
+    { .name = "CNTHVS_TVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 0,
+      .type = ARM_CP_NO_RAW | ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .readfn = gt_sec_vel2_tval_read,
+      .writefn = gt_sec_vel2_tval_write,
+      .resetfn = gt_sec_vel2_timer_reset,
+    },
+    { .name = "CNTHVS_CTL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 1,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC_VEL2].ctl),
+      .resetvalue = 0,
+      .writefn = gt_sec_vel2_ctl_write, .raw_writefn = raw_write,
+    },
+    { .name = "CNTHVS_CVAL_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 14, .crm = 4, .opc2 = 2,
+      .type = ARM_CP_IO, .access = PL2_RW,
+      .accessfn = gt_sel2timer_access,
+      .fieldoffset = offsetof(CPUARMState, cp15.c14_timer[GTIMER_SEC_VEL2].cval),
+      .writefn = gt_sec_vel2_cval_write, .raw_writefn = raw_write,
+    },
+#endif
 };
 
 static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.39.5
