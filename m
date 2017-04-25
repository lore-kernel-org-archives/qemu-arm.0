Received: by 10.25.0.144 with SMTP id 138csp1835799lfa;
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
X-Received: by 10.25.209.135 with SMTP id i129mr10100177lfg.4.1493122035455;
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id a2si1628963lfh.167.2017.04.25.05.07.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 05:07:15 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d2zFR-0003X9-VD; Tue, 25 Apr 2017 13:07:14 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: [PATCH 04/13] arm: Clean up handling of no-MPU PMSA CPUs
Date: Tue, 25 Apr 2017 13:07:01 +0100
Message-Id: <1493122030-32191-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 71Den/cyoyS/

ARM CPUs come in two flavours:
 * proper MMU ("VMSA")
 * only an MPU ("PMSA")
For PMSA, the MPU may be implemented, or not (in which case there
is default "always acts the same" behaviour, but it isn't guest
programmable).

QEMU is a bit confused about how we indicate this: we have an
ARM_FEATURE_MPU, but it's not clear whether this indicates
"PMSA, not VMSA" or "PMSA and MPU present" , and sometimes we
use it for one purpose and sometimes the other.

Currently trying to implement a PMSA-without-MPU core won't
work correctly because we turn off the ARM_FEATURE_MPU bit
and then a lot of things which should still exist get
turned off too.

As the first step in cleaning this up, rename the feature
bit to ARM_FEATURE_PMSA, which indicates a PMSA CPU (with
or without MPU).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h     |  2 +-
 target/arm/cpu.c     | 12 ++++++------
 target/arm/helper.c  | 12 ++++++------
 target/arm/machine.c |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 253565b..0718955 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1179,7 +1179,7 @@ enum arm_features {
     ARM_FEATURE_V6K,
     ARM_FEATURE_V7,
     ARM_FEATURE_THUMB2,
-    ARM_FEATURE_MPU,    /* Only has Memory Protection Unit, not full MMU.  */
+    ARM_FEATURE_PMSA,   /* no MMU; may have Memory Protection Unit */
     ARM_FEATURE_VFP3,
     ARM_FEATURE_VFP_FP16,
     ARM_FEATURE_NEON,
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b357aee..f17e279 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -586,7 +586,7 @@ static void arm_cpu_post_init(Object *obj)
                                  &error_abort);
     }
 
-    if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
                                  &error_abort);
         if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
@@ -682,7 +682,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
     if (arm_feature(env, ARM_FEATURE_V7) &&
         !arm_feature(env, ARM_FEATURE_M) &&
-        !arm_feature(env, ARM_FEATURE_MPU)) {
+        !arm_feature(env, ARM_FEATURE_PMSA)) {
         /* v7VMSA drops support for the old ARMv5 tiny pages, so we
          * can use 4K pages.
          */
@@ -758,10 +758,10 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
     if (!cpu->has_mpu) {
-        unset_feature(env, ARM_FEATURE_MPU);
+        unset_feature(ARM_FEATURE_PMSA);
     }
 
-    if (arm_feature(env, ARM_FEATURE_MPU) &&
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
         arm_feature(env, ARM_FEATURE_V7)) {
         uint32_t nr = cpu->pmsav7_dregion;
 
@@ -861,7 +861,7 @@ static void arm946_initfn(Object *obj)
 
     cpu->dtb_compatible = "arm,arm946";
     set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_MPU);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
     set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
     cpu->midr = 0x41059461;
     cpu->ctr = 0x0f004006;
@@ -1073,7 +1073,7 @@ static void cortex_r5_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_THUMB_DIV);
     set_feature(&cpu->env, ARM_FEATURE_ARM_DIV);
     set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_MPU);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
     cpu->midr = 0x411fc153; /* r1p3 */
     cpu->id_pfr0 = 0x0131;
     cpu->id_pfr1 = 0x001;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 791332c..404bfdb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -485,7 +485,7 @@ static void contextidr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = arm_env_get_cpu(env);
 
-    if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_MPU)
+    if (raw_read(env, ri) != value && !arm_feature(env, ARM_FEATURE_PMSA)
         && !extended_addresses_enabled(env)) {
         /* For VMSA (when not using the LPAE long descriptor page table
          * format) this register includes the ASID, so do a TLB flush.
@@ -4615,7 +4615,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, v6k_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V7MP) &&
-        !arm_feature(env, ARM_FEATURE_MPU)) {
+        !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
@@ -4969,7 +4969,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 
-    if (arm_feature(env, ARM_FEATURE_MPU)) {
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
         if (arm_feature(env, ARM_FEATURE_V6)) {
             /* PMSAv6 not implemented */
             assert(arm_feature(env, ARM_FEATURE_V7));
@@ -5131,7 +5131,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
         define_arm_cp_regs(cpu, id_cp_reginfo);
-        if (!arm_feature(env, ARM_FEATURE_MPU)) {
+        if (!arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             define_one_arm_cp_reg(cpu, &id_mpuir_reginfo);
@@ -8442,7 +8442,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
     /* pmsav7 has special handling for when MPU is disabled so call it before
      * the common MMU/MPU disabled check below.
      */
-    if (arm_feature(env, ARM_FEATURE_MPU) &&
+    if (arm_feature(env, ARM_FEATURE_PMSA) &&
         arm_feature(env, ARM_FEATURE_V7)) {
         *page_size = TARGET_PAGE_SIZE;
         return get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
@@ -8457,7 +8457,7 @@ static bool get_phys_addr(CPUARMState *env, target_ulong address,
         return 0;
     }
 
-    if (arm_feature(env, ARM_FEATURE_MPU)) {
+    if (arm_feature(env, ARM_FEATURE_PMSA)) {
         /* Pre-v7 MPU */
         *page_size = TARGET_PAGE_SIZE;
         return get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
diff --git a/target/arm/machine.c b/target/arm/machine.c
index d8094a8..ac6b758 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -142,7 +142,7 @@ static bool pmsav7_needed(void *opaque)
     ARMCPU *cpu = opaque;
     CPUARMState *env = &cpu->env;
 
-    return arm_feature(env, ARM_FEATURE_MPU) &&
+    return arm_feature(env, ARM_FEATURE_PMSA) &&
            arm_feature(env, ARM_FEATURE_V7);
 }
 
-- 
2.7.4
