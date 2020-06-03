Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp33518lfc;
        Tue, 2 Jun 2020 18:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFPUCx1zlnUqqQdiIoVE1o8qQ6FnrJJ8ZSjxeinmnur2lK6BDA1eZqWW8EJqN9v6qdC3lZ
X-Received: by 2002:a25:b8b:: with SMTP id 133mr22275037ybl.373.1591147108743;
        Tue, 02 Jun 2020 18:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147108; cv=none;
        d=google.com; s=arc-20160816;
        b=fggtfcmvjMAN/lTtZvNZz3rVXtZeuBI7y79c4ZgyEBhTVq1aiqwOT3fqyqnu2MmLZz
         adQXBNK9qN+Ho4e+5Ob6Sptxq7Ga+UR1AgsajWEAre9jqh0xtPT5F3vd/A9Fcb4J7McD
         9RA8+LxdFWn+0d7vf+NO+Q+SB86i9FgWJUMv8dtoivWQejSvGwZ3CoTVxL7iFCySKOIA
         4sBEzZ6NoUiyPPlJcM7tv5sqaCBOkyU2Kn8OWV0f6UDOCjSwlMocU8hBllGYEjWEe7uI
         vOjSvGzlKMySR3dUCRr2wru91/fQvIkYhxTzcELneTFcivfRAfXr55OYGZF2GvgEr3XA
         By6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=03LJNoH/ukVkl3mS8L9CmNVy1qT1M4Av2oRp35Y7po4=;
        b=erdjx1UCB7WzweIw3wZ3+aii4/Kg4fZUoGqNm5Ew7AD4HWqP2tpDb6xEFmlZDB7qO6
         BMuhcQzOtSPUV8TAzj4Y8D3cyohvr54nBeG2r/w/otKCZG7kBQGuxJZ8Q36mhWjZfBQZ
         +dvw5xr/aJdsk8GYax965yccu07uEW95W55M2uXqKGVO1Pwqjqidd4KzZ3Zm81eXr9yH
         2dQEYcfDhNaeb9nRK3MOyVairvOQlLqWicXJDC44EnDsrfS+ROk6A9UAI/Ms6mEjIKqJ
         cGLU6b8Q/zma73MfhhvrTsw2VcfSTI1642nVuLAnGpAsEJN4SkT5Tg3gzhRifQKZ6yGO
         GV5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LTudRNbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u1si312678ybg.412.2020.06.02.18.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LTudRNbQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI32-0004OA-21
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyE-0003Ya-6h
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:30 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyC-0003XH-UF
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:29 -0400
Received: by mail-pg1-x542.google.com with SMTP id t7so571912pgt.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03LJNoH/ukVkl3mS8L9CmNVy1qT1M4Av2oRp35Y7po4=;
 b=LTudRNbQwV+6JZ3antNWvutWhJSI6eVhnwYj31lmyuO7qaDahrCHjRsv8sQY0CCW71
 iMxwHvcrv7F4lPWD/cpM8Qv7QVJznDNBmT0MkrAUm3PuwlsxpLhUrDJRdLEXP3ISoufr
 jNPX+x3aueQMhm60uQH6cKiNVFJuSDz9J98DDk/Zd5Nfwatzs/b9wTQ9Sfq9yWSrI93n
 31fXyeYIxxIRPgkzVXgU0P87QNuXcyaqz4ECImFWBzpB9xPfJ+bccGvSqXYMmY7TTk8q
 UEqxd1kLGEjf1CUDjzXYB1L4PZs/HnUzCPaXdF7i9Z7xNILEVNZ9c+LunYc0YHvLbX35
 A2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03LJNoH/ukVkl3mS8L9CmNVy1qT1M4Av2oRp35Y7po4=;
 b=rjsBqnDUnha36HAbaJkKK53OCDFobkC75OZnDttHn7OYeA9nE9ur+mfP0UVUKen1RH
 XTLs2L8zQ9LyAF8vjA7XiaWFgNA267U9Sv/qnaio3lyWJrHzgnpJj1DWIrA6iE+sFGri
 X4YeD1NDXbBQHwOHRhKtNVtZJy6w0GxpfCDa1p2JKlg4IfmwVAGSxO3r5HFAxKT1px/e
 hv2QVsmHQ8T5REnqfMkasdayWNB0EqgH6hboqTN2dWa3KIwdhHlYK5S46awCqGLyvkQ1
 ElxE7Qm+J5bOpgWbt3+zLyOnG9JdLf2bhBYbszmr2BlAZxGjGpHKL/uTKoJzeDi7+guH
 RmbA==
X-Gm-Message-State: AOAM5337VQUkxljYvUnZ1bHwuPTM6B7ahCwFLXzqUwLuCLRQI/1XE6us
 sEIzt0rsYJ0TmgokcZHa1sJA7g==
X-Received: by 2002:a17:90a:950e:: with SMTP id
 t14mr2108841pjo.99.1591146807570; 
 Tue, 02 Jun 2020 18:13:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 07/42] target/arm: Add MTE system registers
Date: Tue,  2 Jun 2020 18:12:42 -0700
Message-Id: <20200603011317.473934-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aE/bMoRtoO8G

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
 target/arm/internals.h     |  9 ++++
 target/arm/helper.c        | 94 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c | 21 +++++++++
 4 files changed, 128 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f8ac11e73b..49cf37d43b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -502,6 +502,9 @@ typedef struct CPUARMState {
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
+        uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
+        uint64_t gcr_el1;
+        uint64_t rgsr_el1;
     } cp15;
 
     struct {
@@ -1282,6 +1285,7 @@ void pmu_init(ARMCPU *cpu);
 #define PSTATE_SS (1U << 21)
 #define PSTATE_PAN (1U << 22)
 #define PSTATE_UAO (1U << 23)
+#define PSTATE_TCO (1U << 25)
 #define PSTATE_V (1U << 28)
 #define PSTATE_C (1U << 29)
 #define PSTATE_Z (1U << 30)
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 4bdbc3a8ac..56b4672685 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1159,6 +1159,9 @@ static inline uint32_t aarch64_pstate_valid_mask(const ARMISARegisters *id)
     if (isar_feature_aa64_uao(id)) {
         valid |= PSTATE_UAO;
     }
+    if (isar_feature_aa64_mte(id)) {
+        valid |= PSTATE_TCO;
+    }
 
     return valid;
 }
@@ -1234,4 +1237,10 @@ void arm_log_exception(int idx);
 
 #endif /* !CONFIG_USER_ONLY */
 
+/*
+ * The log2 of the words in the tag block, for GMID_EL1.BS.
+ * The is the maximum, 256 bytes, which manipulates 64-bits of tags.
+ */
+#define GMID_EL1_BS  6
+
 #endif
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f2ead07ead..88ca07ad0f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5879,6 +5879,9 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
 
+        { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
+          "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
+
         /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
         /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
     };
@@ -6853,6 +6856,86 @@ static const ARMCPRegInfo dcpodp_reg[] = {
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
@@ -7978,6 +8061,17 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
index d4d2f69d87..284266be67 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1610,6 +1610,27 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
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
2.25.1

