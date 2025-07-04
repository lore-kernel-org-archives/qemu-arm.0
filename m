Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1282990dyc;
        Fri, 4 Jul 2025 08:15:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8ZgrdzWvi3W4TfwmnUD0o02iRlvNZ3q1FtFifdaIo6HKdDSqIkaCsmlFKmgvUTifJ8Gj46K7R2Azk6w==@linaro.org
X-Received: by 2002:a05:6214:3305:b0:702:bc78:a1ef with SMTP id 6a1803df08f44-702c4e0aab6mr48554756d6.3.1751642111799;
        Fri, 04 Jul 2025 08:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751642111; cv=none;
        d=google.com; s=arc-20240605;
        b=AEX20b0PDIY1sI6c2Id/MDB8qZP0j8djCNT6jfDVZTattA6uTL1plbscYioFX72K9c
         r90lkoRVD/v/o30lE1RNEYKvLv7jtyEOCIZycs0eBPKVMIQxkqh39P2/el0eewr7LwAz
         ZZlI1+EGFSE4TFD828YybpJ7gTkb+s8K8xmLrbrQJuUbVajnZoNGQvSGwhqMBLpkr4Il
         RP0AuzJcSNl8BJjXYXjMZFlLoSARaAxnAxyKItFEu5rEf1tTpdUFc8lzXk+q9K5leJjk
         ZdWxdLakjTawtHpG0iKRCmUfCLmnWTYqAR3MkW17McZh70TLeNzX+mOMDtXtd5HvBaQK
         xXug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yr3RJolVtussDq6YKwTZ6SpmMIjNcR9PpcE47YPrlUU=;
        fh=Q3tyTiGq51c4K/RTvBm+udtgyBNX2/smginYGN2UE1g=;
        b=JUR5CGK3NnZoTBuvT5xIQpV2QrYaY6U+WvO7jX0SZqeb6dR5uifF2O64rNE722VBdw
         4+u7M3SPtS+Mmqsf/gIX/95rRUXMWe3K1xvfQAlzVklu5/V2wj6QJyLJ3XgtCkfQs1EX
         zB8ID0CJC+M7dJbE3E6QzBiAeovuJtNqXn3rip3yXQzXxXsdkyZWTNL/f+k0YSXe3g8d
         Kd6OGMOwqeHeLbgIMwPwYh0ekYxkO06XCkpE9rT5adiCIqjLvEQDLzBs0r/laoOZ4vBj
         nC8oQ0nIXeCdt//NYNffJjV3uQoIyDCmh8Ug4ZAcVghYDUUj7k4qZmIhDHn5XqXuxOAR
         5b4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2vIULse;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 6a1803df08f44-702c3b3c48esor18972006d6.5.2025.07.04.08.15.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jul 2025 08:15:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u2vIULse;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751642111; x=1752246911; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yr3RJolVtussDq6YKwTZ6SpmMIjNcR9PpcE47YPrlUU=;
        b=u2vIULsekmf18wNlnjVRXUHVt9Bpcx+C4ao1h1K7IZxaOWeBNe+l9l0bzGttWyrJ1U
         j9UVvgCff1T5oD44sm7Izmadf1l3DFXLCJpRy1LDev1WkBG0aMS7YIWJwbEhC95ckZli
         A2ve4u4THnwE1vSVzhF5tb1tx5aBls/JqB67v/sBBAXPuW+ZZtcpDVzSjhP59Ubh9/m5
         4nYx4AmJnEx/gSemUbXIpON+4sssr2CulQOJMGoVnLxmcS7GgA8mhxLdWaGMnEi62AOh
         sx6aVnXRUQTNyQaRl6mN5/f8198u1v6bQ5WhuzHD37G31imzV7pqRChTgONdKNC/NGEp
         tOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642111; x=1752246911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yr3RJolVtussDq6YKwTZ6SpmMIjNcR9PpcE47YPrlUU=;
        b=fIpyjlO/hPyPg+PpUjYpd1QGbn0N4hPNHqZkhUunTn++txO6gzdDBYh5dCuHNYiINz
         LlW3YDgq0EEb3pucAW98jOkVVnzTH8AwtjULdmvA4plvfYMC0PaEJixB7DpvnBI5yWTk
         OWW6Np0ktyYAziNOuRAz4Ulvsfx3KdlF0kz+HC6be8nbK13JbALwsXhme4LI1dY2kajH
         2zvUMaCgi3/PpWJpZZi6YpGDyfJInEv3FhX/ZvjKpx1QoOItZeB495fY79TyG41jDw1g
         14pmff/88+ov888vZa2+vbsavu0NhhAGepRoDiH8MY6Fjcg3ZWLln1gB7cbu+Q3AflbF
         Gm3w==
X-Forwarded-Encrypted: i=1; AJvYcCXfIj8SXkkNiYe1+GKP7o24LIsZ0HcI5lwpA1e/kefAc7SgqYK93w6ZvTbomULpL+s+o3d1Wp6aBXcGLw==@linaro.org
X-Gm-Message-State: AOJu0Yz3aydkpiOoZac9vW8Typq0OERgJAFkHeuCOvAY8HgkhgQfASJb
	FICqqUqC1akpSoLi8HGqEdHZsB4mfAj4yyJWW8Q5XpVVjfDwXK0EqXa4VTwaeNCpHJ9le8DOP3D
	+VxFkjjI=
X-Gm-Gg: ASbGncsQk04RMBSPJTQwRwb4l1s9QgufxepoC992MpHu3hU9+U67a3yMSNjrnmItMkY
	DqXY6FxQTGsMfmVN/4BbDC8QYbE7IEVwvhPfRGwDzSiIU5aUpXYpAs1nl/BeQ25IBPdgbJMKJK/
	bFUTFyiH2nWN9wnFhGoe/NRWAV+GSZenahh1nKW8vy8cHcmBAXbtywybwEwoRoBZSho7OyZHpO4
	6TnA4X4VuNKwoSG5ZnmE9m2T0cKfbOe0zqHpANxXeflO4MiTRs2cQa+uKLeo7LsHUiqjwBLVBho
	Eg0FIa/W1YOz5/EMul773SBlK0GWMgOhGGxJndnGH/3vpyUuux58mh1mqx2bIwOu+Ug=
X-Google-Smtp-Source: AGHT+IGb0d6mLe5Le5q6CRhYLRQurVslXtDA4+cFMrWolUuID3mv/A624CRy2w+FhQB29VXYYKpF8g==
X-Received: by 2002:a05:6214:21e7:b0:702:c038:af78 with SMTP id 6a1803df08f44-702c5695e64mr52295166d6.5.1751642110694;
        Fri, 04 Jul 2025 08:15:10 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([189.110.24.38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d6039fsm13658666d6.111.2025.07.04.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:15:10 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [WIP-for-10.1 v2 3/5] target/arm: Add FEAT_SCTLR2
Date: Fri,  4 Jul 2025 15:14:29 +0000
Message-Id: <20250704151431.1033520-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704151431.1033520-1-gustavo.romero@linaro.org>
References: <20250704151431.1033520-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iqwH8CFRqITP

Add FEAT_SCTLR2, which introduces the SCTLR2_EL1, SCTLR2_EL2, and
SCTLR2_EL3 registers. These registers are extension of the SCTLR_ELx
ones.

Because the bits in these registers depend on other CPU features, and
only FEAT_MEC is supported at the moment, this commit only implements
the EMEC bits related to FEAT_MEC in CTLR2_EL2 and SCTLR2_EL3.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-features.h     |  5 ++++
 target/arm/cpu.h              | 15 +++++++++++
 target/arm/helper.c           | 51 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/cpu64.c        |  1 +
 5 files changed, 73 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 78c2fd2113..5a82c602f2 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -121,6 +121,7 @@ the following architecture extensions:
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
+- FEAT_SCTLR2 (Extension to SCTLR_ELx)
 - FEAT_SEL2 (Secure EL2)
 - FEAT_SHA1 (SHA1 instructions)
 - FEAT_SHA256 (SHA256 instructions)
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4452e7c21e..a42d1133c2 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -296,6 +296,11 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) >= 2;
 }
 
+static inline bool isar_feature_aa64_sctlr2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_mmfr3, ID_AA64MMFR3, SCTLRX) == 1;
+}
+
 static inline bool isar_feature_aa32_pmuv3p1(const ARMISARegisters *id)
 {
     /* 0xf means "non-standard IMPDEF PMU" */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9509217486..ac38306873 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -326,6 +326,7 @@ typedef struct CPUArchState {
             };
             uint64_t sctlr_el[4];
         };
+        uint64_t sctlr2_el[4]; /* Extension to System control register. */
         uint64_t vsctlr; /* Virtualization System control register. */
         uint64_t cpacr_el1; /* Architectural feature access control register */
         uint64_t cptr_el[4];  /* ARMv8 feature trap registers */
@@ -1401,6 +1402,19 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
 #define SCTLR_TIDCP   (1ULL << 63) /* FEAT_TIDCP1 */
 
+#define SCTLR2_EMEC (1ULL << 1) /* FEAT_MEC */
+#define SCTLR2_NMEA (1ULL << 2) /* FEAT_DoubleFault2 */
+#define SCTLR2_ENADERR (1ULL << 3) /* FEAT_ADERR */
+#define SCTLR2_ENANERR (1ULL << 4) /* FEAT_ANERR */
+#define SCTLR2_EASE (1ULL << 5) /* FEAT_DoubleFault2 */
+#define SCTLR2_ENIDCP128 (1ULL << 6) /* FEAT_SYSREG128 */
+#define SCTLR2_ENPACM (1ULL << 7) /* FEAT_PAuth_LR */
+#define SCTLR2_ENPACM0 (1ULL << 8 /* FEAT_PAuth_LR */
+#define SCTLR2_CPTA (1ULL << 9) /* FEAT_CPA2 */
+#define SCTLR2_CPTA0 (1ULL << 10) /* FEAT_CPA2 */
+#define SCTLR2_CPTM (1ULL << 11) /* FEAT_CPA2 */
+#define SCTLR2_CPTM0 (1ULL << 12) /* FEAT_CAP2 */
+
 #define CPSR_M (0x1fU)
 #define CPSR_T (1U << 5)
 #define CPSR_F (1U << 6)
@@ -1692,6 +1706,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_HXEN              (1ULL << 38)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
+#define SCR_SCTLR2EN          (1ULL << 42)
 #define SCR_GPF               (1ULL << 48)
 #define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9f8a284261..413672174b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7840,6 +7840,53 @@ static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
       .resetvalue = 0 },
 };
 
+static CPAccessResult sctlr2_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                    bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (!cpu_isar_feature(aa64_sctlr2, env_archcpu(env))) {
+        return CP_ACCESS_UNDEFINED;
+    }
+
+    if ((el < 3)  && !(env->cp15.scr_el3 & SCR_SCTLR2EN)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+};
+
+static void sctlr2_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    int el = arm_current_el(env);
+    uint64_t valid_mask = 0ULL;
+
+    if (el > 1 && cpu_isar_feature(aa64_mec, env_archcpu(env))) {
+        /* SCTLR2_EL1 does not implement the EMEC bit */
+        valid_mask |= SCTLR2_EMEC;
+    }
+    value &= valid_mask;
+    raw_write(env, ri, value);
+};
+
+static const ARMCPRegInfo sctlr2_reginfo[] = {
+    { .name = "SCTLR2_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .opc2 = 3, .crn = 1, .crm = 0,
+      .access = PL1_RW, .accessfn = sctlr2_access,
+      .writefn = sctlr2_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[1]) },
+    { .name = "SCTLR2_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .opc2 = 3, .crn = 1, .crm = 0,
+      .access = PL2_RW, .accessfn = sctlr2_access,
+      .writefn = sctlr2_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[2]) },
+    { .name = "SCTLR2_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .opc2 = 3, .crn = 1, .crm = 0,
+      .access = PL3_RW, .accessfn = sctlr2_access,
+      .writefn = sctlr2_write,
+      .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[3]) },
+};
+
 void register_cp_regs_for_features(ARMCPU *cpu)
 {
     /* Register all the coprocessor registers based on feature bits */
@@ -9106,6 +9153,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_arm_cp_regs(cpu, mec_reginfo);
     }
 
+    if (cpu_isar_feature(aa64_sctlr2, cpu)) {
+        define_arm_cp_regs(cpu, sctlr2_reginfo);
+    }
+
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
     }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5d8ed2794d..5f77d320ea 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1242,6 +1242,7 @@ void aarch64_max_tcg_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr3;
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     cpu->isar.id_aa64mmfr3 = t;
 
     t = cpu->isar.id_aa64zfr0;
-- 
2.34.1
