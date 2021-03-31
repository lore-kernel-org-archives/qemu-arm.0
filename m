Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp601664lfg;
        Wed, 31 Mar 2021 08:54:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZjUDHKOhDQZvZUvO03wdDQstBRq/OgtxSI4tPNPURFgcztSPXC7HkbPmY2Z5tGLAJJv7h
X-Received: by 2002:a92:d68e:: with SMTP id p14mr2975934iln.0.1617206050065;
        Wed, 31 Mar 2021 08:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617206050; cv=none;
        d=google.com; s=arc-20160816;
        b=Lm66W5TMj0Xki7v7fc1EaUIkct2g4byvwISIP5OUVB3uSUdBi74phu+T/Fu4c3ptz9
         aXW+eNE89STk8zUVO0+33GvVXTU4QD2fy80P8fPQ+ev9PjM5X28gdryyuiNcv8opQVRM
         4nzNO1/TML5U2QeZz7GfgPC7eTyoC7w4Ts7nkAzNQi2kOk3iiE7LDbk+fuG3aB4qipDI
         hFhvk+FlAHRVLREb4t5Fp2Lz24dOS+g9Ln8z8bWszpMkTkHjKKUe0Do1eg8xwSEragBF
         cdbHMPLZTYJU2xNSwVaivuz2/M8wc5skDJm+a+ciikhyKR7P8eJnxLdejFnMsUS6/SDQ
         k1pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2HTH7bfVRFqZSDteSdGJ0DTQfjTvfEroWHTNBGdjjDs=;
        b=KzzkyJTcED3VBBeE7EXa5FojrzyD6TykE19cpOc1x5b7CSBKeqAHFbd0UUp5/9yPC8
         VGHVEq7u1nVi+JnUCf8C5KRF5Mz0Ijy0NOn1uW8/BSaU5F5LcdM1XZ4yIwailkPXGotJ
         PMBKYuD2hFr4vOJvUUmJ5Lvu9RgznN3bmLp3OyUhjv2BShri1NzP9Md5QOLqtY6azJMp
         RqE/UcRWuO5AUuZPhoOrlja0n52VTZOcFPTybOM0Bt+3SZ6fqYICB7z7L1AmwZJvbhMB
         UqQkQc6jZGeuIOuaksdZiuPl0doVzPEfiejKrJ++qe3szjBe8gYRi01rJ2t31vHUgrlN
         v+oA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypcLvtZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si1808031ilj.59.2021.03.31.08.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 08:54:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ypcLvtZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRdAX-0000Ti-AM
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 11:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRd55-00033f-Tc
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 11:48:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lRd52-0003YE-AG
 for qemu-arm@nongnu.org; Wed, 31 Mar 2021 11:48:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id o16so20220285wrn.0
 for <qemu-arm@nongnu.org>; Wed, 31 Mar 2021 08:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HTH7bfVRFqZSDteSdGJ0DTQfjTvfEroWHTNBGdjjDs=;
 b=ypcLvtZ05HCLKZnwwSqVJwsKbH2CtWYaz9sds5aR7cYPjqQnv8jZUGl1UvB2S/QbuM
 5MjXiL2tjnDQ87D2sW/5L7jl9vw/qM6gOs+LJfLbR68M+OEp53VED86J2yJcDTf8ixW9
 zZTWM0i85Wqv5+3RDln9EiOJTJzjg2w/qsjZ4ujjiz/y3GeHTROpJwfjte30pH9yxdCb
 dt68odwmQvkEsX3cweP0x9TMSB1LU2/xk9EplB6G9ISvw0jV9XZiz6TM11r7lfLGyZkm
 bMNMJ0DyBoWuPvA6z/rqJ0ol/uhXr4fk25YOMwF2bmDzRZzKw9MMk+N7IsLMFwzGPX/j
 JtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2HTH7bfVRFqZSDteSdGJ0DTQfjTvfEroWHTNBGdjjDs=;
 b=eRtl6ZuY/FTVrq4jfXzQAheb1EX/k59+EbMi4m1hjYxKLkt/52F9JtWiU5M83p5gk8
 PpaINruzfIMMvRzQ2iLSKmPDYQYQowEI3M2P/VT/jLzYmfnP5IOB9F2qn7/vNnbpqlM9
 UAq0hnw1UIG8AMFNCq9yd8mcFtCSIOuGPD6Hs+oYwnNFZI2qeX23idGhY6xJFDwhmdya
 8aZf31ehqgJEhkXLXNxKgVlEVaUIEd0yIBtQQuQedxJuAlXc/tlXLKWRWQCez93ZRDaQ
 zKb41O6KkhUvoLJYC9ZtUc2rJAkovU08lcKleXEAYYbKfeceoZyc5Oiq8mdEsNjLBNLT
 bU1Q==
X-Gm-Message-State: AOAM533ot+LnPUGObBFJpgcQCD+urQAmMinllW7TB17DzTs2GaLeBp9w
 e+pOn2OC6bczuDsGteTZ7eikNOCM9wN+fitD
X-Received: by 2002:a5d:6048:: with SMTP id j8mr4599251wrt.115.1617205706755; 
 Wed, 31 Mar 2021 08:48:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e17sm6400815wra.65.2021.03.31.08.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 08:48:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0] Revert "target/arm: Make number of counters in PMCR
 follow the CPU"
Date: Wed, 31 Mar 2021 16:48:22 +0100
Message-Id: <20210331154822.23332-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NjNC9KPcSyLv

This reverts commit f7fb73b8cdd3f77e26f9fcff8cf24ff1b58d200f.

This change turned out to be a bit half-baked, and doesn't
work with KVM, which fails with the error:
   "qemu-system-aarch64: Failed to retrieve host CPU features"

because KVM does not allow accessing of the PMCR_EL0 value in
the scratch "query CPU ID registers" VM unless we have first
set the KVM_ARM_VCPU_PMU_V3 feature on the VM.

Revert the change for 6.0.

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I suspect the changes required to make KVM work are not very
complicated -- it's going to look pretty much like the way we
deal with getting SVE vector lengths, where we do it after
we have decided we need to enable the feature. But I don't
have time to work on this right now, hence punting to 6.1.
---
 target/arm/cpu.h     |  1 -
 target/arm/cpu64.c   |  3 ---
 target/arm/cpu_tcg.c |  5 -----
 target/arm/helper.c  | 29 ++++++++++++-----------------
 target/arm/kvm64.c   |  2 --
 5 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fe68f464b3a..193a49ec7fa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -942,7 +942,6 @@ struct ARMCPU {
         uint64_t id_aa64mmfr2;
         uint64_t id_aa64dfr0;
         uint64_t id_aa64dfr1;
-        uint64_t reset_pmcr_el0;
     } isar;
     uint64_t midr;
     uint32_t revidr;
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5d9d56a33c3..f0a9e968c9c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -141,7 +141,6 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -195,7 +194,6 @@ static void aarch64_a53_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41033000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
@@ -247,7 +245,6 @@ static void aarch64_a72_initfn(Object *obj)
     cpu->gic_num_lrs = 4;
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
-    cpu->isar.reset_pmcr_el0 = 0x41023000;
     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
 }
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 8252fd29f90..046e476f65f 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -301,7 +301,6 @@ static void cortex_a8_initfn(Object *obj)
     cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
     cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
     cpu->reset_auxcr = 2;
-    cpu->isar.reset_pmcr_el0 = 0x41002000;
     define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
 }
 
@@ -374,7 +373,6 @@ static void cortex_a9_initfn(Object *obj)
     cpu->clidr = (1 << 27) | (1 << 24) | 3;
     cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
     cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
-    cpu->isar.reset_pmcr_el0 = 0x41093000;
     define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
 }
 
@@ -445,7 +443,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x41072000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
 }
 
@@ -488,7 +485,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
     cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
     cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    cpu->isar.reset_pmcr_el0 = 0x410F3000;
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
 
@@ -721,7 +717,6 @@ static void cortex_r5_initfn(Object *obj)
     cpu->isar.id_isar6 = 0x0;
     cpu->mp_is_up = true;
     cpu->pmsav7_dregion = 16;
-    cpu->isar.reset_pmcr_el0 = 0x41151800;
     define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8fb6cc96e4d..d9220be7c5a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -38,6 +38,7 @@
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
+#define PMCR_NUM_COUNTERS 4 /* QEMU IMPDEF choice */
 
 #ifndef CONFIG_USER_ONLY
 
@@ -1148,9 +1149,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
-    ARMCPU *cpu = env_archcpu(env);
-
-    return (cpu->isar.reset_pmcr_el0 & PMCRN_MASK) >> PMCRN_SHIFT;
+  return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
 }
 
 /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
@@ -5754,6 +5753,13 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .resetvalue = 0,
       .writefn = gt_hyp_ctl_write, .raw_writefn = raw_write },
 #endif
+    /* The only field of MDCR_EL2 that has a defined architectural reset value
+     * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
+     */
+    { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .resetvalue = PMCR_NUM_COUNTERS,
+      .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2), },
     { .name = "HPFAR", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 6, .crm = 0, .opc2 = 4,
       .access = PL2_RW, .accessfn = access_el3_aa32ns,
@@ -6683,7 +6689,7 @@ static void define_pmu_regs(ARMCPU *cpu)
      * field as main ID register, and we implement four counters in
      * addition to the cycle count register.
      */
-    unsigned int i, pmcrn = pmu_num_counters(&cpu->env);
+    unsigned int i, pmcrn = PMCR_NUM_COUNTERS;
     ARMCPRegInfo pmcr = {
         .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
         .access = PL0_RW,
@@ -6698,10 +6704,10 @@ static void define_pmu_regs(ARMCPU *cpu)
         .access = PL0_RW, .accessfn = pmreg_access,
         .type = ARM_CP_IO,
         .fieldoffset = offsetof(CPUARMState, cp15.c9_pmcr),
-        .resetvalue = cpu->isar.reset_pmcr_el0,
+        .resetvalue = (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHIFT) |
+                      PMCRLC,
         .writefn = pmcr_write, .raw_writefn = raw_write,
     };
-
     define_one_arm_cp_reg(cpu, &pmcr);
     define_one_arm_cp_reg(cpu, &pmcr64);
     for (i = 0; i < pmcrn; i++) {
@@ -7819,17 +7825,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
             REGINFO_SENTINEL
         };
-        /*
-         * The only field of MDCR_EL2 that has a defined architectural reset
-         * value is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N.
-         */
-        ARMCPRegInfo mdcr_el2 = {
-            .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
-            .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 1, .opc2 = 1,
-            .access = PL2_RW, .resetvalue = pmu_num_counters(env),
-            .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el2),
-        };
-        define_one_arm_cp_reg(cpu, &mdcr_el2);
         define_arm_cp_regs(cpu, vpidr_regs);
         define_arm_cp_regs(cpu, el2_cp_reginfo);
         if (arm_feature(env, ARM_FEATURE_V8)) {
diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 581335e49d3..dff85f6db94 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -566,8 +566,6 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
                               ARM64_SYS_REG(3, 0, 0, 7, 1));
         err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr2,
                               ARM64_SYS_REG(3, 0, 0, 7, 2));
-        err |= read_sys_reg64(fdarray[2], &ahcf->isar.reset_pmcr_el0,
-                              ARM64_SYS_REG(3, 3, 9, 12, 0));
 
         /*
          * Note that if AArch32 support is not present in the host,
-- 
2.20.1

