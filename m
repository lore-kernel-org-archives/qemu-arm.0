Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087260lfc;
        Thu, 12 Mar 2020 12:42:31 -0700 (PDT)
X-Received: by 2002:a63:e4d:: with SMTP id 13mr8999048pgo.343.1584042151280;
        Thu, 12 Mar 2020 12:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042151; cv=none;
        d=google.com; s=arc-20160816;
        b=VWTVcS6ULJ6wQbBCCEZE+HUqw+YISeHj6GjvoQ5tmdIBeLT4r8QNRi3rhOoqS5Vpri
         Y5jZYJHxOlo8L8DVNmLqCPi2KiG7kdyC0IMeLBAoA2QxvjKvWRUoEebxsCYi4GDxuD9s
         i/tOpABc3NRnURJ/Bwe/ymYDDotlgkCfB0CZpAhZEPtrIA0rD6W4Myhu54UQzUI9l+Y+
         87HT6Zpc+EPD7DEYmRH3eNuCUgJ5LAM4XjJI6XdA2tDzMo0ZP18e/ChilfzxOSvhOFHg
         M/fMNqXygusoThEJ3TKVICaT0gze7h7e6Gjax68ZWGt6yIPBsut0tlux1SfYJpod08tA
         +vmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nHCew20BijBgDTCdBkWUv5DBbqMwI8TECdarYx84Be0=;
        b=ZLrDeI0Z2UYMyLNIFNYanXO1s2tnF0FmPfOTzoyYeNvSVrNY5SBAfxkEITSJu62cWj
         on5TaJkf1VVNHKEg+UBH/DgCzjvddma5ec3QCYTdfANCx6WQGuOQddFBttcWBWmy5++K
         HlxbjUzggCYEFX3g/SM5Mumt+2cpQU2TjJvi8FoI1w1N+p1AQtV9iEpBNF2PdCkm3Rx1
         kWPQCTGDquABbQSGpnXW62cYPAbikfi0zvA0c9mX7si6ZcKuD7NqzhZZM4iI3Qvhl/M8
         i4nQH9HREeGoI9UdsEfZ28lBcvxjDo8nCYFW9mT9y7FdFBgE8WZTQsgnUOqdB5DyEhyF
         0hYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+LMHNsn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c30sor7068809pfj.8.2020.03.12.12.42.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V+LMHNsn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nHCew20BijBgDTCdBkWUv5DBbqMwI8TECdarYx84Be0=;
        b=V+LMHNsnOVSXALkvL48rkdPvfQ2i2bNIt3vpd28RpLdIpTdHAvnW36jQS3M7iZ8s/D
         e6dv+vkt63XIuUR3IeLYwfh6V5qRIIN5H5WuPe5CFZ+6/WCcOjizs0r18zuz5OaK4hZQ
         nX9utMDBGeCmdBSkxyqGyY1XW+YXUCtRh8CM41XngGGg6roum2QVnumOo+AKsj6CeEEx
         Y08uceS9ihn31NzaxSc+3s9GB+wISnmRmh3sXsTR6Zsi8vdG2LLDLweSeJKS4zPyJaHL
         q6DsHgKgnB9oxRONcvcFmoJvPM5M36IJtFJ3RC8868UCsCce1mV0hwS6EB/qBPsIYrE1
         28UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHCew20BijBgDTCdBkWUv5DBbqMwI8TECdarYx84Be0=;
        b=TQI2NK4J12JQrTIBznul5dBqskh0h2wu0QZ+sbnThnoGAr+KhCV8DKr44reTlvDOSz
         bKRXK5LR2BXqT3FldSCfP/mJRT1EhACabaQQWG5tF2ZBTn4Z3jov+jZN1rSbgnmi9xEN
         dEFwxwnJS3xe9iJg+6MevLo9BtxrQh7CNFgH62rGIzo2O7Og0lar0Bc4JdR7j5Ju4oqA
         YGYW12xX8qCOIMiMAGzKFy6epjujk5ogDrltkRrzKN7oBEld0crkoUX7POex4DmCgyDd
         NPmc6glNNFq1rgPzU5QxbemoFVl8NBleQgCdghkQjObScwyrb9AZuAAcWuo/dezfsqEk
         O+YQ==
X-Gm-Message-State: ANhLgQ2brc0jreSaxKyg7uSIIihZKe2mBbSMEdEVQQEW0FH8jvzEMx7Z
	35+Xau65qpJIv9V9DDxNSjg5P7t7
X-Google-Smtp-Source: ADFU+vsZVTOdt+XD+UWal4aT2qMdJ8GwZJTc7l306+QMFq9t4F6bhikps2AAcwLdAfr0rZwEHGqMTA==
X-Received: by 2002:aa7:9811:: with SMTP id e17mr9387051pfl.33.1584042150533;
        Thu, 12 Mar 2020 12:42:30 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 07/42] target/arm: Add MTE system registers
Date: Thu, 12 Mar 2020 12:41:44 -0700
Message-Id: <20200312194219.24406-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: cU9TEVoxRVBp

This is TFSRE0_EL1, TFSR_EL1, TFSR_EL2, TFSR_EL3,
RGSR_EL1, GCR_EL1, GMID_EL1, and PSTATE.TCO.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Add GMID; add access_mte.
v4: Define only TCO at mte_insn_reg.
v6: Define RAZ/WI version of TCO at mte_insn_reg;
    honor TID5 for GMID_EL1; fix TFS crn/crm; recalc hflags after TCO.
---
 target/arm/cpu.h           |  4 ++
 target/arm/internals.h     |  6 +++
 target/arm/helper.c        | 94 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 21 +++++++++
 4 files changed, 125 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a77b0d97ac..25351abd15 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -492,6 +492,9 @@ typedef struct CPUARMState {
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
+        uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
+        uint64_t gcr_el1;
+        uint64_t rgsr_el1;
     } cp15;
 
     struct {
@@ -1259,6 +1262,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index a833e3941d..0591f30526 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1233,4 +1233,10 @@ void arm_log_exception(int idx);
 
 #endif /* !CONFIG_USER_ONLY */
 
+/*
+ * The log2 of the words in the tag block, for GMID_EL1.BS.
+ * The is the maximum, 256 bytes, which manipulates 64-bits of tags.
+ */
+#define GMID_EL1_BS  6
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b9267ddbc2..b47209be64 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5869,6 +5869,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
 
+        { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
+          "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -6840,6 +6843,86 @@ static const ARMCPRegInfo dcpodp_reg[] = {
 };
 #endif /*CONFIG_USER_ONLY*/
 
+static CPAccessResult access_aa64_tid5(CPUARMState *env, const ARMCPRegInfo *ri,
+                                       bool isread)
+{
+    if ((arm_current_el(env) < 2) && (arm_hcr_el2_eff(env) & HCR_TID5)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult access_mte(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 &&
+        arm_feature(env, ARM_FEATURE_EL2) &&
+        !(arm_hcr_el2_eff(env) & HCR_ATA)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 &&
+        arm_feature(env, ARM_FEATURE_EL3) &&
+        !(env->cp15.scr_el3 & SCR_ATA)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t tco_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return env->pstate & PSTATE_TCO;
+}
+
+static void tco_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    env->pstate = (env->pstate & ~PSTATE_TCO) | (val & PSTATE_TCO);
+}
+
+static const ARMCPRegInfo mte_reginfo[] = {
+    { .name = "TFSRE0_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 6, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[0]) },
+    { .name = "TFSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[1]) },
+    { .name = "TFSR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL2_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[2]) },
+    { .name = "TFSR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 6, .opc2 = 0,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(CPUARMState, cp15.tfsr_el[3]) },
+    { .name = "RGSR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 5,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.rgsr_el1) },
+    { .name = "GCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 6,
+      .access = PL1_RW, .accessfn = access_mte,
+      .fieldoffset = offsetof(CPUARMState, cp15.gcr_el1) },
+    { .name = "GMID_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 4,
+      .access = PL1_R, .accessfn = access_aa64_tid5,
+      .type = ARM_CP_CONST, .resetvalue = GMID_EL1_BS },
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_NO_RAW,
+      .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
+    { .name = "TCO", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
+      .type = ARM_CP_CONST, .access = PL0_RW, },
+    REGINFO_SENTINEL
+};
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -7957,6 +8040,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         }
     }
 #endif /*CONFIG_USER_ONLY*/
+
+    /*
+     * If full MTE is enabled, add all of the system registers.
+     * If only "instructions available at EL0" are enabled,
+     * then define only a RAZ/WI version of PSTATE.TCO.
+     */
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        define_arm_cp_regs(cpu, mte_reginfo);
+    } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
+        define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
+    }
 #endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 943d6034de..528f608408 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1664,6 +1664,27 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         s->base.is_jmp = DISAS_UPDATE_EXIT;
         break;
 
+    case 0x1c: /* TCO */
+        if (dc_isar_feature(aa64_mte, s)) {
+            /* Full MTE is enabled -- set the TCO bit as directed. */
+            if (crm & 1) {
+                set_pstate_bits(PSTATE_TCO);
+            } else {
+                clear_pstate_bits(PSTATE_TCO);
+            }
+            t1 = tcg_const_i32(s->current_el);
+            gen_helper_rebuild_hflags_a64(cpu_env, t1);
+            tcg_temp_free_i32(t1);
+            /* Many factors, including TCO, go into MTE_ACTIVE. */
+            s->base.is_jmp = DISAS_UPDATE_NOCHAIN;
+        } else if (dc_isar_feature(aa64_mte_insn_reg, s)) {
+            /* Only "instructions accessible at EL0" -- PSTATE.TCO is WI.  */
+            s->base.is_jmp = DISAS_NEXT;
+        } else {
+            goto do_unallocated;
+        }
+        break;
+
     default:
     do_unallocated:
         unallocated_encoding(s);
-- 
2.20.1
