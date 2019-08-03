Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200978wrv;
        Sat, 3 Aug 2019 11:48:17 -0700 (PDT)
X-Received: by 2002:a17:90a:2768:: with SMTP id o95mr10399527pje.37.1564858097729;
        Sat, 03 Aug 2019 11:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858097; cv=none;
        d=google.com; s=arc-20160816;
        b=EJXjlEk3uC282cJ07jfuscIM4IYYRuIepVcuL8Ro4Gwvl1geJoZS4oR93he1hTUGt1
         N5PRlc9E7hu4MISAY/AqYfqL1iSaDp2AeI6TLOqneLxaskg5YtdJtIAs7nYpseKM8Fb0
         GxrX3qu2HXcoLdXq33TPfNMG8vtH8RYfxxDx75HYXx8c+niGcKqunDz196cjufT8C6kO
         wdEd4w4hKEn3oZ2CBWEECgXovXUO8HP2uOGyOhxmre9IDoiS90oyUu+R6sx9NxWPg4Fk
         xqR8hOxXnA57XVf1JPNth8qXD1p8eRanX+GyzO9ZgtZkKFLtVuAVnoYHsS46/p/JMwtx
         r+Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=mRFuXKk2Gwl0/7zE7hzogtQkhwOwZ57w0oxCxJ+Y7Jc=;
        b=EgaR0V5eEgV7m2RP84HLBqqlOyb2HSUYDO7tbrUP4clx8O0muUYIsqt5g1gRDSsMKh
         MIYK7HUaRQMvgKAWGU2cLq9jnHXgFm32hYEZD4E/roPIEuUzn0yNUfg2o9LypYO8iXc5
         aSxjr5H06kro69kiehzyREn7M7jl38aJ3qVaq0HfU52pBP1o9VTrg3hC/fpN/V2tUivC
         0Rp5XIP4b+pbFLMVGWc9a/ZjHZOdATDjsYyv68X6YHOstx2xUpzFjGO8BYUF5SQKHce/
         my+fyJWR7QXJq/d2laFP7gFwBDglzeI+qwDtjpmfEvE9sghEDQZb3q2Xj9s+GY13nyc1
         vVzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Asj8oSC1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 190sor60299356pfc.65.2019.08.03.11.48.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Asj8oSC1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mRFuXKk2Gwl0/7zE7hzogtQkhwOwZ57w0oxCxJ+Y7Jc=;
        b=Asj8oSC11y4yxglFP8DeXNnuNbhJ5H8rd7ioNjaWzuzsCowqC1mNAPiEIsUeSCozYS
         dvCD/nEkWGZ8z1TAKV8W3HsN+S4Y/tMkc4ZLw06az1z/oR0o9l8VwaC2l8PsSA4m2DJA
         s1mMwV8fYotSxu0bHPk1IPSVEBcwht6j43yPtEBeyC/eaTFzkX/54dYZtFnj3Aj/GZNa
         RYBr6joVWEoXJIEQJj6yvTOcOxG2BzC2OcPcKzW+gClcwfjKwSc05sPG72kV7akdEADY
         6OkX88XnwjFA6iLV5UIgHBLBiFk+TcEWMiDi0p3lNvuB7NHxqxu9/owgAmRzCDNkDVRE
         9Avw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mRFuXKk2Gwl0/7zE7hzogtQkhwOwZ57w0oxCxJ+Y7Jc=;
        b=lmYNJwo7R+VieXs3WkW3EYiv3R7/PEdhlpKmHv6CNgWsiJ1WGt9bnO9fGiUgu2j6ZC
         atIThwXEBMRcWO2FDp7gTY72cBnum3jDIS/qwPPdsa3aA+BjnPEJJV6zQBsic2pY0rZ0
         DkweAiyiknV2C+vi1LTTMf7Qel0rod3ObVz+wQ5Xk5C3EeXYE3ZGaCg27r64Se4TZhTE
         R9rBZNgoPHnRdAe9/uUolAs0xZb/nku895Ax2QPKKosrMvK+1cWzQQBUoJytiS/vq4/k
         nKqghs2tDORznyB31n5qkGmnSgzfxfCtnN9n4kBsz/zQwWRjGAcksOZHBu46o4DJlhp3
         UU4Q==
X-Gm-Message-State: APjAAAXEY3L5M6cP7YVeGUXoUO79XOUkNn3X7vltkFejmaZEIHwmUJRM
	F04FGO+BzHXEAjZVeMzwGGUZscE7
X-Google-Smtp-Source: APXvYqzsaC67n2A0m1GBWOP9CIskQBg0V0QJ7GRrNjvXmnzRoHkx79LP8TnMs0CtCeh1Z8BfQgptQw==
X-Received: by 2002:aa7:9407:: with SMTP id x7mr68060916pfo.163.1564858097201;
        Sat, 03 Aug 2019 11:48:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 12/34] target/arm: Add VHE system register redirection and aliasing
Date: Sat,  3 Aug 2019 11:47:38 -0700
Message-Id: <20190803184800.8221-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: jFSnkf4MUEN+

Several of the EL1/0 registers are redirected to the EL2 version when in
EL2 and HCR_EL2.E2H is set.  Many of these registers have side effects.
Link together the two ARMCPRegInfo structures after they have been
properly instantiated.  Install common dispatch routines to all of the
relevant registers.

The same set of registers that are redirected also have additional
EL12/EL02 aliases created to access the original register that was
redirected.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  44 +++++++----
 target/arm/helper.c | 175 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bba4e1f984..a0f10b60eb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2455,19 +2455,6 @@ struct ARMCPRegInfo {
      */
     ptrdiff_t fieldoffset; /* offsetof(CPUARMState, field) */
 
-    /* Offsets of the secure and non-secure fields in CPUARMState for the
-     * register if it is banked.  These fields are only used during the static
-     * registration of a register.  During hashing the bank associated
-     * with a given security state is copied to fieldoffset which is used from
-     * there on out.
-     *
-     * It is expected that register definitions use either fieldoffset or
-     * bank_fieldoffsets in the definition but not both.  It is also expected
-     * that both bank offsets are set when defining a banked register.  This
-     * use indicates that a register is banked.
-     */
-    ptrdiff_t bank_fieldoffsets[2];
-
     /* Function for making any access checks for this register in addition to
      * those specified by the 'access' permissions bits. If NULL, no extra
      * checks required. The access check is performed at runtime, not at
@@ -2502,6 +2489,37 @@ struct ARMCPRegInfo {
      * fieldoffset is 0 then no reset will be done.
      */
     CPResetFn *resetfn;
+
+    union {
+        /*
+         * Offsets of the secure and non-secure fields in CPUARMState for
+         * the register if it is banked.  These fields are only used during
+         * the static registration of a register.  During hashing the bank
+         * associated with a given security state is copied to fieldoffset
+         * which is used from there on out.
+         *
+         * It is expected that register definitions use either fieldoffset
+         * or bank_fieldoffsets in the definition but not both.  It is also
+         * expected that both bank offsets are set when defining a banked
+         * register.  This use indicates that a register is banked.
+         */
+        ptrdiff_t bank_fieldoffsets[2];
+
+        /*
+         * "Original" writefn and readfn.
+         * For ARMv8.1-VHE register aliases, we overwrite the read/write
+         * accessor functions of various EL1/EL0 to perform the runtime
+         * check for which sysreg should actually be modified, and then
+         * forwards the operation.  Before overwriting the accessors,
+         * the original function is copied here, so that accesses that
+         * really do go to the EL1/EL0 version proceed normally.
+         * (The corresponding EL2 register is linked via opaque.)
+         */
+        struct {
+            CPReadFn *orig_readfn;
+            CPWriteFn *orig_writefn;
+        };
+    };
 };
 
 /* Macros which are lvalues for the field in CPUARMState for the
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0f5627218..e9f4cae5e8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5225,6 +5225,171 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+#ifndef CONFIG_USER_ONLY
+/* Test if system register redirection is to occur in the current state.  */
+static bool redirect_for_e2h(CPUARMState *env)
+{
+    return arm_current_el(env) == 2 && (arm_hcr_el2_eff(env) & HCR_E2H);
+}
+
+static uint64_t el2_e2h_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    CPReadFn *readfn;
+
+    if (redirect_for_e2h(env)) {
+        /* Switch to the saved EL2 version of the register.  */
+        ri = ri->opaque;
+        readfn = ri->readfn;
+    } else {
+        readfn = ri->orig_readfn;
+    }
+    if (readfn == NULL) {
+        readfn = raw_read;
+    }
+    return readfn(env, ri);
+}
+
+static void el2_e2h_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    CPWriteFn *writefn;
+
+    if (redirect_for_e2h(env)) {
+        /* Switch to the saved EL2 version of the register.  */
+        ri = ri->opaque;
+        writefn = ri->writefn;
+    } else {
+        writefn = ri->orig_writefn;
+    }
+    if (writefn == NULL) {
+        writefn = raw_write;
+    }
+    writefn(env, ri, value);
+}
+
+static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
+{
+    struct E2HAlias {
+        uint32_t src_key, dst_key, new_key;
+        const char *src_name, *dst_name, *new_name;
+        bool (*feature)(const ARMISARegisters *id);
+    };
+
+#define K(op0, op1, crn, crm, op2) \
+    ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
+
+    static const struct E2HAlias aliases[] = {
+        { K(3, 0,  1, 0, 0), K(3, 4,  1, 0, 0), K(3, 5, 1, 0, 0),
+          "SCTLR", "SCTLR_EL2", "SCTLR_EL12" },
+        { K(3, 0,  1, 0, 2), K(3, 4,  1, 1, 2), K(3, 5, 1, 0, 2),
+          "CPACR", "CPTR_EL2", "CPACR_EL12" },
+        { K(3, 0,  2, 0, 0), K(3, 4,  2, 0, 0), K(3, 5, 2, 0, 0),
+          "TTBR0_EL1", "TTBR0_EL2", "TTBR0_EL12" },
+        { K(3, 0,  2, 0, 1), K(3, 4,  2, 0, 1), K(3, 5, 2, 0, 1),
+          "TTBR1_EL1", "TTBR1_EL2", "TTBR1_EL12" },
+        { K(3, 0,  2, 0, 2), K(3, 4,  2, 0, 2), K(3, 5, 2, 0, 2),
+          "TCR_EL1", "TCR_EL2", "TCR_EL12" },
+        { K(3, 0,  4, 0, 0), K(3, 4,  4, 0, 0), K(3, 5, 4, 0, 0),
+          "SPSR_EL1", "SPSR_EL2", "SPSR_EL12" },
+        { K(3, 0,  4, 0, 1), K(3, 4,  4, 0, 1), K(3, 5, 4, 0, 1),
+          "ELR_EL1", "ELR_EL2", "ELR_EL12" },
+        { K(3, 0,  5, 1, 0), K(3, 4,  5, 1, 0), K(3, 5, 5, 1, 0),
+          "AFSR0_EL1", "AFSR0_EL2", "AFSR0_EL12" },
+        { K(3, 0,  5, 1, 1), K(3, 4,  5, 1, 1), K(3, 5, 5, 1, 1),
+          "AFSR1_EL1", "AFSR1_EL2", "AFSR1_EL12" },
+        { K(3, 0,  5, 2, 0), K(3, 4,  5, 2, 0), K(3, 5, 5, 2, 0),
+          "ESR_EL1", "ESR_EL2", "ESR_EL12" },
+        { K(3, 0,  6, 0, 0), K(3, 4,  6, 0, 0), K(3, 5, 6, 0, 0),
+          "FAR_EL1", "FAR_EL2", "FAR_EL12" },
+        { K(3, 0, 10, 2, 0), K(3, 4, 10, 2, 0), K(3, 5, 10, 2, 0),
+          "MAIR_EL1", "MAIR_EL2", "MAIR_EL12" },
+        { K(3, 0, 10, 3, 0), K(3, 4, 10, 3, 0), K(3, 5, 10, 3, 0),
+          "AMAIR0", "AMAIR_EL2", "AMAIR_EL12" },
+        { K(3, 0, 12, 0, 0), K(3, 4, 12, 0, 0), K(3, 5, 12, 0, 0),
+          "VBAR", "VBAR_EL2", "VBAR_EL12" },
+        { K(3, 0, 13, 0, 1), K(3, 4, 13, 0, 1), K(3, 5, 13, 0, 1),
+          "CONTEXTIDR_EL1", "CONTEXTIDR_EL2", "CONTEXTIDR_EL12" },
+        { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
+          "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
+        { K(3, 3, 14, 2, 0), K(3, 4, 14, 2, 0), K(3, 5, 14, 2, 0),
+          "CNTP_TVAL_EL0", "CNTHP_TVAL_EL2", "CNTP_TVAL_EL02" },
+        { K(3, 3, 14, 2, 1), K(3, 4, 14, 2, 1), K(3, 5, 14, 2, 1),
+          "CNTP_CTL_EL0", "CNTHP_CTL_EL2", "CNTP_CTL_EL02" },
+        { K(3, 3, 14, 2, 2), K(3, 4, 14, 2, 2), K(3, 5, 14, 2, 2),
+          "CNTP_CVAL_EL0", "CNTHP_CVAL_EL2", "CNTP_CVAL_EL02" },
+        { K(3, 3, 14, 3, 0), K(3, 4, 14, 3, 0), K(3, 5, 14, 3, 0),
+          "CNTV_TVAL_EL0", "CNTHV_TVAL_EL2", "CNTV_TVAL_EL02" },
+        { K(3, 3, 14, 3, 1), K(3, 4, 14, 3, 1), K(3, 5, 14, 3, 1),
+          "CNTV_CTL_EL0", "CNTHV_CTL_EL2", "CNTV_CTL_EL02" },
+        { K(3, 3, 14, 3, 2), K(3, 4, 14, 3, 2), K(3, 5, 14, 3, 2),
+          "CNTV_CVAL_EL0", "CNTHV_CVAL_EL2", "CNTV_CVAL_EL02" },
+        /*
+         * CNTHV_CVAL is a special case because there is no separate
+         * AArch32 EL2 register to which CNTV_CVAL may be directed.
+         * The effect can be achieved via CNTHV_CVAL_EL2.
+         */
+        { ENCODE_CP_REG(15, 1, 1, 0, 14, 3, 0), K(3, 4, 14, 3, 2), 0,
+          "CNTV_CVAL", "CNTHV_CVAL_EL2", NULL },
+
+        /*
+         * Note that redirection of ZCR is mentioned in the description
+         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
+         * not in the summary table.
+         */
+        { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
+          "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
+
+        /* TODO: ARMv8.2-SPE -- PMSCR_EL2 */
+        /* TODO: ARMv8.4-Trace -- TRFCR_EL2 */
+    };
+#undef K
+
+    size_t i;
+
+    for (i = 0; i < ARRAY_SIZE(aliases); i++) {
+        const struct E2HAlias *a = &aliases[i];
+        ARMCPRegInfo *src_reg, *dst_reg;
+
+        if (a->feature && !a->feature(&cpu->isar)) {
+            continue;
+        }
+
+        src_reg = g_hash_table_lookup(cpu->cp_regs, &a->src_key);
+        dst_reg = g_hash_table_lookup(cpu->cp_regs, &a->dst_key);
+        g_assert(src_reg != NULL);
+        g_assert(dst_reg != NULL);
+
+        /* Cross-compare names to detect typos in the keys.  */
+        g_assert(strcmp(src_reg->name, a->src_name) == 0);
+        g_assert(strcmp(dst_reg->name, a->dst_name) == 0);
+
+        /* None of the core system registers use opaque; we will.  */
+        g_assert(src_reg->opaque == NULL);
+
+        /* Create alias before redirection so we dup the right data. */
+        if (a->new_key) {
+            ARMCPRegInfo *new_reg = g_memdup(src_reg, sizeof(ARMCPRegInfo));
+            uint32_t *new_key = g_memdup(&a->new_key, sizeof(uint32_t));
+            bool ok;
+
+            new_reg->name = a->new_name;
+            new_reg->type |= ARM_CP_ALIAS;
+            /* Remove PL1/PL0 access, leaving PL2/PL3 R/W in place.  */
+            new_reg->access &= 0xf0;
+
+            ok = g_hash_table_insert(cpu->cp_regs, new_key, new_reg);
+            g_assert(ok);
+        }
+
+        src_reg->opaque = dst_reg;
+        src_reg->orig_readfn = src_reg->readfn;
+        src_reg->orig_writefn = src_reg->writefn;
+        src_reg->readfn = el2_e2h_read;
+        src_reg->writefn = el2_e2h_write;
+    }
+}
+#endif
+
 static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
@@ -6942,6 +7107,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         : cpu_isar_feature(aa32_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
+
+#ifndef CONFIG_USER_ONLY
+    /*
+     * Register redirections and aliases must be done last,
+     * after the registers from the other extensions have been defined.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu)) {
+        define_arm_vh_e2h_redirects_aliases(cpu);
+    }
+#endif
 }
 
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
-- 
2.17.1
