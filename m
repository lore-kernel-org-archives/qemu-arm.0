Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57537FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9d-0006Rl-Uq; Wed, 29 Apr 2026 20:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9V-0006Nb-2h
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:16 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9T-0006G3-D4
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:12 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8296d553142so211188b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508470; x=1778113270; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=73otMSm/BuymaPP3YE3sIV7Wl7PcxvDt8khsJ+zToKU=;
 b=Tu7VGxMXw83S2Iu4tUFkFXu9MorQ7OxPXFZf2LUfKgtN6kgLoZj8TnBda880tdDsv3
 EksPOz3Bv/le7XNWm4Angpi/pmxs1VheF70T6jafruXV3xlzcRc5htR6utF4m8JnRhWS
 mUPQwEcWUdoX7axPZ7Nl4/bgIe/nZ1DAmWClDMO2Qc5DYKPSP/dfQYAdvLhaaqsyYT90
 5hXnnYZjHvvxtcpGoUBJ+hBu9mfUEI0Hc34upzIgrodVahCRisV6vWVNbo4ggGbDyNBa
 bfoa6N7fUlsjwLT+TrnFQmtZfmiCCkf9CC39NYn8wN6jsft+fFA3QwFXnxQrKvZFR0J7
 afgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508470; x=1778113270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=73otMSm/BuymaPP3YE3sIV7Wl7PcxvDt8khsJ+zToKU=;
 b=j0+RNlSJn0d9X8faw+lt86ZvSM68qTs7zzW/Wsftq/FaIxSoQIWnZeqsEHpheZ5+iW
 cJkmVh3G+Fl3jQ4tNCJg6YR5vvenkQHm0sejlAron/0Lml7O1e22vGD8jiiNl9u2IFKv
 X86JrEKdi9V96Wd6Wr8DyLqR/ibxKy+Z68TsFiW8eG5GHmju9D8H90g5t3YJk9sUwx9+
 W1CLvo99HastmwiKNy6w+al5AMB8jXuSqV/GYLnVi+feB4aKmB5baa7elaK4KcRIQ2Nr
 BMB/NJ+6W1mQr1nlMoYlxFKo+01nKtQ4DHByfT6CDOmohMJ9MBbKz/v2n3/TNmJwjwG7
 C9tg==
X-Gm-Message-State: AOJu0YzOzeppZ3MAgMq3bPb925UOEIGDSiCBLt2YanlXjUknkyUvNZJL
 96qQgduixJVOeSpseGlYkuQ6I575sZ+e4Kiz/GsG+gK7yXyxv4eZeXIEF7+kN9Bcz2dTuVMpnkr
 rDzoh4Ag=
X-Gm-Gg: AeBDiev+ZlmywLcMr48++AQSNV2Hu2a8SUpj5WFKUqFOXCTBxi3Il9gJpHLrjgClmRK
 fv9T40e2K2Gzew4/30Ugzp4WoT0+Q/LpOCRbTmA/fryvfyO9ZjsWxeWQmOARHbvKSLW6LKokCIF
 B3cVtBGV0qrZ6+yvGl6GIFXUULs3/bCzJK26yW2yjipjUdUtQzMFglCc6CzhpmT8NZmtSyESwp3
 F4+rAMTPSB/ou8Pz8yrp+i1ZFATNOPFehFBu7I7rR9C3LRobWCoY0ZBKx5rpib+aLBtkULaHjhd
 I0PVWaMnQ4gPK3Ne/iOj8kdHMa6LQOvSgZBHX4aeDM9xs8nPENhSuCHFBG1Zez4+8Kqzs8ZIAim
 IfhfDjP/1raCE2kg40WXF1HvckBvW4IZJUQ/11ZNy5GBPIz0ODRRcLJBKHwJOfZwc/pVO1C8Eaa
 vHi6PWjipLVixHSMlk2u6FFimKmK3i/9tVgn/AgV+XkAUvbmOzBmI=
X-Received: by 2002:a05:6a00:a256:b0:82a:6de8:fa50 with SMTP id
 d2e1a72fcca58-834fdb87d67mr842175b3a.18.1777508469869; 
 Wed, 29 Apr 2026 17:21:09 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 08/47] target/arm: Introduce FPMR
Date: Thu, 30 Apr 2026 10:20:07 +1000
Message-ID: <20260430002046.59739-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Introduce the special register FPMR and its fields.
Migrate it when present.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h       |  5 +++++
 target/arm/cpu-features.h |  5 +++++
 target/arm/cpu.h          |  1 +
 target/arm/internals.h    |  9 +++++++++
 target/arm/helper.c       | 12 +++++++++++-
 target/arm/machine.c      | 20 ++++++++++++++++++++
 6 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index f5ec7484c1..391c0e322b 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -149,6 +149,11 @@ enum {
      * should not trap to EL2 when HCR_EL2.NV is set.
      */
     ARM_CP_NV_NO_TRAP            = 1 << 22,
+    /*
+     * Flag: Access check for this sysreg is constrained by the
+     * ARM pseudocode function CheckFPMREnabled().
+     */
+    ARM_CP_FPMR                  = 1 << 23,
 };
 
 /*
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5b1c0cf76d..35e281699c 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1178,6 +1178,11 @@ static inline bool isar_feature_aa64_gcs(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64PFR1, GCS) != 0;
 }
 
+static inline bool isar_feature_aa64_fpmr(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64PFR2, FPMR) != 0;
+}
+
 static inline bool isar_feature_aa64_tgran4_lpa2(const ARMISARegisters *id)
 {
     return FIELD_SEX64_IDREG(id, ID_AA64MMFR0, TGRAN4) >= 1;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index da1b7fde1d..1a55275e80 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -692,6 +692,7 @@ typedef struct CPUArchState {
          */
         uint64_t fpsr;
         uint64_t fpcr;
+        uint64_t fpmr;
 
         uint32_t xregs[16];
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 6376ae1ca3..08024943c3 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -292,6 +292,15 @@ FIELD(CNTHCTL, EVNTIS, 17, 1)
 FIELD(CNTHCTL, CNTVMASK, 18, 1)
 FIELD(CNTHCTL, CNTPMASK, 19, 1)
 
+FIELD(FPMR, F8S1, 0, 3)
+FIELD(FPMR, F8S2, 3, 3)
+FIELD(FPMR, F8D, 6, 3)
+FIELD(FPMR, OSM, 14, 1)
+FIELD(FPMR, OSC, 15, 1)
+FIELD(FPMR, LSCALE, 16, 7)
+FIELD(FPMR, NSCALE, 24, 8)
+FIELD(FPMR, LSCALE2, 32, 6)
+
 /* We use a few fake FSR values for internal purposes in M profile.
  * M profile cores don't have A/R format FSRs, but currently our
  * get_phys_addr() code assumes A/R profile and reports failures via
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66813bb298..304db1a479 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6209,6 +6209,14 @@ static const ARMCPRegInfo aie_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+static const ARMCPRegInfo fpmr_reginfo[] = {
+    { .name = "FPMR", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 4, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_FPU | ARM_CP_FPMR,
+      .fieldoffset = offsetof(CPUARMState, vfp.fpmr),
+    }
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -7481,10 +7489,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_arm_cp_regs(cpu, mec_mte_reginfo);
         }
     }
-
     if (cpu_isar_feature(aa64_aie, cpu)) {
         define_arm_cp_regs(cpu, aie_reginfo);
     }
+    if (cpu_isar_feature(aa64_fpmr, cpu)) {
+        define_arm_cp_regs(cpu, fpmr_reginfo);
+    }
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 8dc766d322..58f8dfd53c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -960,6 +960,25 @@ static const VMStateDescription vmstate_syndrome64 = {
     },
 };
 
+static bool fpmr_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
+           && cpu_isar_feature(aa64_fpmr, cpu);
+}
+
+static const VMStateDescription vmstate_fpmr = {
+    .name = "cpu/fpmr",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = fpmr_needed,
+    .fields = (const VMStateField[]) {
+        VMSTATE_UINT64(env.vfp.fpmr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -1323,6 +1342,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_syndrome64,
         &vmstate_pstate64,
         &vmstate_event,
+        &vmstate_fpmr,
         NULL
     }
 };
-- 
2.43.0


