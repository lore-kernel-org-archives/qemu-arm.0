Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A00C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:06:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYt2d-0000SI-EV; Mon, 07 Jul 2025 17:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLb-0005Rt-98
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:22:05 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsLX-0004Ow-Ra
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:54 -0400
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4a5903bceffso53448481cf.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919711; x=1752524511; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AngDFfAbXxT0VBr2TBjfR0UyDG0Wft7yK5h399FKsbU=;
 b=das8aIW5ga1+trD/Lnhi1wtNuQ5fLMU0wsIZI4EHNNxXITfvVvGAAmYY6pGU0NxXcX
 iEjr5F2eoImbKglQqrrd3HF6576NXvve5gcbDZv1TZwF9lfOjv8Lobwf6roKUkY83vB4
 GqHci8as6FN1RhJVWvoGYPELNt3eA5ykeqFufvK9ZXg5gMr6euJRlBEpegSIdkOEWHEi
 0e58rSNlvUs5gtv+tqR+Wu+3dSBXnpRJ8yhUXdNlxbiVdGMCVlasUhC1qD4EHnpVRKv+
 1nWi/GFhyBqEBKP40Ftf91kbZjHcLhZ/ewvPPaJ84q8fnWWt9hH/M5lgWLFWSRw7X/rT
 tibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919711; x=1752524511;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AngDFfAbXxT0VBr2TBjfR0UyDG0Wft7yK5h399FKsbU=;
 b=GUdM294GvWuS2xgQvmTjkY9V6lgfWtnomcJ1iRoNFGUa9YAGeqX6IZ3RfqQ6xSeJ3d
 UEqumpUvRazbYvrKa+AyDV6QMmLSSmCoVZ7mM3m90VUtyEW9wS1Gc0pEmd2vYXKZT+9F
 enFUQGyNZgWL5lEhlF9wiWdi2x5Y7LsUw2V6KwJegQLFJdDrHj77qonbe6nQSHJoeDcr
 hV8Y1+WNe+3/XHfCZYfqS0cMBW7SugOv+UdBxTQzqoDqqJdFhqAhHMlLntGfJwvf6fRv
 eYwnE3NsmQMx5JvFw8MQbnFvq4J4GLLjrXzOMWRJuUMiiKsG9xwE5mDtLY/9kYsDU0Kk
 NrzA==
X-Gm-Message-State: AOJu0YzcY/5EItlfamxjieopCylIYsCXW1opvOWuniwr1Cd//T8f2OrU
 4u17OxWHPAh7CIZ2B/5YbCzmNRC9asvNUMIRSfe0WJxFkd+M/sT1RLHaTLWpbo0Y0DM6F2D2So/
 v8d6wMvg=
X-Gm-Gg: ASbGncul++13MtcPle6ClFneF5G4rRc+KwwXn0OoPnneukzgpJL4/V1dCsptpe51eT1
 +MdUCj3QYxdIWkNneWMG4TI+0aX4EYNjp/JCDlY00yo3a6g1ke0p0wmHBA+W9CCxWyDfuT2PZ1Z
 JyozlUO+9nObfzpHkk0leMwjOapdxo+IyLAiYsz2Z9niUL1S3x1C0lSqQAfyJ9dFGKJ5pnyHhJg
 9WgXplf99yELU/jLE3fBS2t6aKdGWyPNNeK5EhiFGshcR5LxAUhjcOzcqsjZ1jLcSgc08X6EccR
 YhLOEgNnyN99H5RZnDc1CykO31FRYcpRx9cVbwg0XdOVl7wx/qFYL+1hBr3APRsLt3OlZhNskuX
 oMnX9tnOwVnMgRp6v
X-Google-Smtp-Source: AGHT+IFiOG9P+P0Vt7vLU2ovOSbdok2M6F+s7AA57BnaTBjmtkkkElGjCguSuYLjTT6/aFzzH24ZAg==
X-Received: by 2002:a05:622a:34c:b0:4a9:a729:1c35 with SMTP id
 d75a77b69052e-4a9cd7e5289mr6088331cf.37.1751919710672; 
 Mon, 07 Jul 2025 13:21:50 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/20] target/arm: Implement FEAT_ATS1A
Date: Mon,  7 Jul 2025 14:21:11 -0600
Message-ID: <20250707202111.293787-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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

Implement FEAT_ATS1A and enable for -cpu max.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h           |  1 +
 target/arm/cpu-features.h     |  5 ++++
 target/arm/tcg/cpregs-at.c    | 44 +++++++++++++++++++++++++++++++++++
 target/arm/tcg/cpu64.c        |  1 +
 docs/system/arm/emulation.rst |  1 +
 5 files changed, 52 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 88b3d63424..58c6326fce 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -835,6 +835,7 @@ typedef enum FGTBit {
     DO_BIT(HFGITR, DVPRCTX),
     DO_BIT(HFGITR, CPPRCTX),
     DO_BIT(HFGITR, DCCVAC),
+    DO_BIT(HFGITR, ATS1E1A),
 } FGTBit;
 
 #undef DO_BIT
diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5d8adfb73b..91e6c5b7d2 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -604,6 +604,11 @@ static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
 }
 
+static inline bool isar_feature_aa64_ats1a(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, ATS1A);
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
diff --git a/target/arm/tcg/cpregs-at.c b/target/arm/tcg/cpregs-at.c
index 39141c83aa..b764dd54c3 100644
--- a/target/arm/tcg/cpregs-at.c
+++ b/target/arm/tcg/cpregs-at.c
@@ -490,6 +490,47 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
       .writefn = ats_write },
 };
 
+static void ats_s1e1a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    bool regime_e20 = (hcr_el2 & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE);
+    ARMMMUIdx mmu_idx = regime_e20 ? ARMMMUIdx_E20_2 : ARMMMUIdx_Stage1_E1;
+    ARMSecuritySpace ss = arm_security_space_below_el3(env);
+
+    env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
+}
+
+static void ats_s1e2a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    ARMMMUIdx mmu_idx = hcr_el2 & HCR_E2H ? ARMMMUIdx_E20_2 : ARMMMUIdx_E2;
+    ARMSecuritySpace ss = arm_security_space_below_el3(env);
+
+    env->cp15.par_el[1] = do_ats_write(env, value, 0, mmu_idx, ss);
+}
+
+static void ats_s1e3a(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
+{
+    env->cp15.par_el[1] = do_ats_write(env, value, 0, ARMMMUIdx_E3,
+                                       arm_security_space(env));
+}
+
+static const ARMCPRegInfo ats1a_reginfo[] = {
+    { .name = "AT_S1E1A", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 2,
+      .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .fgt = FGT_ATS1E1A,
+      .accessfn = at_s1e01_access, .writefn = ats_s1e1a },
+    { .name = "AT_S1E2A", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 9, .opc2 = 2,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .accessfn = at_s1e2_access, .writefn = ats_s1e2a },
+    { .name = "AT_S1E3A", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 6, .crn = 7, .crm = 9, .opc2 = 2,
+      .access = PL3_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
+      .writefn = ats_s1e3a },
+};
+
 void define_at_insn_regs(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
@@ -511,4 +552,7 @@ void define_at_insn_regs(ARMCPU *cpu)
     if (cpu_isar_feature(aa32_ats1e1, cpu)) {
         define_arm_cp_regs(cpu, ats1cp_reginfo);
     }
+    if (cpu_isar_feature(aa64_ats1a, cpu)) {
+        define_arm_cp_regs(cpu, ats1a_reginfo);
+    }
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 937f29e253..5916a32043 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1178,6 +1178,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
+    t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
     t = GET_IDREG(isar, ID_AA64PFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 78c2fd2113..1c3da23623 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -23,6 +23,7 @@ the following architecture extensions:
 - FEAT_AFP (Alternate floating-point behavior)
 - FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)
 - FEAT_ASID16 (16 bit ASID)
+- FEAT_ATS1A (Address Translation operations that ignore stage 1 permissions)
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
 - FEAT_BF16 (AArch64 BFloat16 instructions)
 - FEAT_BTI (Branch Target Identification)
-- 
2.43.0


