Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp655737ejf;
        Thu, 11 Aug 2022 10:26:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6tPN5xdtnb3uTFfYLCQ59S/Btp91jBEdeqL9Z6eB9VPiD9rMcEgnltwYJWtMR+zh6zahO8
X-Received: by 2002:a0c:9101:0:b0:473:9b:d92a with SMTP id q1-20020a0c9101000000b00473009bd92amr60485qvq.17.1660238761407;
        Thu, 11 Aug 2022 10:26:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238761; cv=none;
        d=google.com; s=arc-20160816;
        b=oCpqvSPmDjm5ThRMCi+H9TRp14dCtuJj/LGh1Eh8yvxNsuuQ1Wr73JMkoS+c1ep4sT
         PW4wb3G8dwjZHgTDxEBR2Hl4CXKlQfB6M6p0TGG9uVrWi9By2aXrjINvVWNyA8dRQ56D
         /ccrtIYQugHpC+Vya+NrxhcoCxnalNRoMg7xHoru1SnXSuvGn6CG4WE97RaX/YGE9kGL
         WSQM5lHop8btizm96q3FrXq1QY7FtXDMgPTPqVFRjUeVFjHoGzjQ0gDoagPxVb24jTBn
         8HeqL6jDrVszIg7cfGSnqKPT5wX+AoJConXNkOisnh/vg4lfpp0uJIloFeYQix4JGAK/
         DwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jta6VYli9fUxCKvC9oDLbg0WOBcHV/0I/18N5bFC7OU=;
        b=x5W/7k593X99lUuEdCg7tK9A4BV3iiSjvN68zJ+13h6ZLxHSSVHlNkw7NYpEl8wyGn
         EWSj2VuaBRqVddVvHiyHxZEqFNz9c1/ClRrMN4EN1lzL796RTGuH8nKT4bTe7nOeWDhO
         DmM+1cJv2adpuRFA9DPi3IelGXJBKNUnPK5sGspsZNEfkDcXruLDWCed/GyAYyH+L/hG
         Yoei8TaqPhRJAJZhK19b98JZ2xBp/LLd9FOCJSQ+BOf4reZid7TTVzsMq9ci7NsJel9G
         a06QpH+ZAtL06/j28buKYBrOos9gvohtSnBwCmb+/wdi+AAjgp7M0WYijCaT26sXnf8g
         Hb6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAOTAp4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv21-20020a05620a1b9500b006b8de9c2041si1878448qkb.107.2022.08.11.10.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAOTAp4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBwW-0000FV-Sl
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnL-0006wD-FV
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:31 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnJ-0000vj-1A
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:31 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j1so22098434wrw.1
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=jta6VYli9fUxCKvC9oDLbg0WOBcHV/0I/18N5bFC7OU=;
 b=UAOTAp4D0YW+w30eOIyF+mGJ3ukrzvgW9DRyj90V4uOrpyFkLXYnrk1ilKy/z7zIC/
 5WeIKv9uz+zfkcKTLcjUe7RcjYC+9vqPmIg8I8U3wB1vKNIvgcbTMruWvEvqR8X0MfjP
 g2Omr09mKZyISLT+WepD3PsGA+iJEXuLFcN6ltJqnwz/MA3wV2qLPtSqIZdJRy797v7D
 VfE4iVNObE1fBFDfIdWIyZNCzg1ytSIIDADr+yu3XR3wq49MhNhgl/DorO2TTiLnKIa4
 Qt92KkGuRRsR6UT4rELlJlip67/X5QwiOB+T/i3wY84+quA9Z9fWbTAks/wsDUtgXdSm
 +3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=jta6VYli9fUxCKvC9oDLbg0WOBcHV/0I/18N5bFC7OU=;
 b=Jdu712ImIn0h107c8lkfbOX1/FM7EypVyl2R9pw/H9/e6zESMmbh1FfM+I91HET1rR
 dceXbAUqbXSkNxghUGtBs2hIVxJARWBqZJhW0/fvnUy280egXSVbHRlxKVdicRzxE/7B
 aRj+ckgllY3Etb2h3ihMVGKtxrznK3rGS071Wxg63qeLDuACO3mPmhzjaitsKdb3oUBg
 eh2KgqMYHnAUJ3j8Aq3lstryFHs8KxM46KQgV8H+rQHoFGyE3gv+uZky7mEHf3FKIS05
 BgKy4GAEGPWealUTqxLL9sutin+yGGZ/IE718tW5yr5bXLdWClpztuHDf72LxkUwGdw4
 G4eQ==
X-Gm-Message-State: ACgBeo19W7RWNzYpz12q41jw1RzKcT0hFOrpPnSt5XqHORJeGku63220
 awkQ0+wdSwUQLizLHt6YFQudO6QsNUVIGQ==
X-Received: by 2002:a5d:5964:0:b0:222:ed7f:4418 with SMTP id
 e36-20020a5d5964000000b00222ed7f4418mr14681wri.133.1660238187389; 
 Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/10] target/arm: Rename pmu_8_n feature test functions
Date: Thu, 11 Aug 2022 18:16:16 +0100
Message-Id: <20220811171619.1154755-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yFTDGTSdlsmY

Our feature test functions that check the PMU version are named
isar_feature_{aa32,aa64,any}_pmu_8_{1,4}.  This doesn't match the
current Arm ARM official feature names, which are FEAT_PMUv3p1 and
FEAT_PMUv3p4.  Rename these functions to _pmuv3p1 and _pmuv3p4.

This commit was created with:
  sed -i -e 's/pmu_8_/pmuv3p/g' target/arm/*.[ch]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    | 16 ++++++++--------
 target/arm/helper.c | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5168e3d837e..122ec8a47ec 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3710,14 +3710,14 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
     return FIELD_EX32(id->id_mmfr3, ID_MMFR3, PAN) >= 2;
 }
 
-static inline bool isar_feature_aa32_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_aa32_pmuv3p1(const ARMISARegisters *id)
 {
     /* 0xf means "non-standard IMPDEF PMU" */
     return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 4 &&
         FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) != 0xf;
 }
 
-static inline bool isar_feature_aa32_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_aa32_pmuv3p4(const ARMISARegisters *id)
 {
     /* 0xf means "non-standard IMPDEF PMU" */
     return FIELD_EX32(id->id_dfr0, ID_DFR0, PERFMON) >= 5 &&
@@ -4036,13 +4036,13 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
 }
 
-static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pmuv3p1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
 }
 
-static inline bool isar_feature_aa64_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_aa64_pmuv3p4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 5 &&
         FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) != 0xf;
@@ -4211,14 +4211,14 @@ static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
     return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(id);
 }
 
-static inline bool isar_feature_any_pmu_8_1(const ARMISARegisters *id)
+static inline bool isar_feature_any_pmuv3p1(const ARMISARegisters *id)
 {
-    return isar_feature_aa64_pmu_8_1(id) || isar_feature_aa32_pmu_8_1(id);
+    return isar_feature_aa64_pmuv3p1(id) || isar_feature_aa32_pmuv3p1(id);
 }
 
-static inline bool isar_feature_any_pmu_8_4(const ARMISARegisters *id)
+static inline bool isar_feature_any_pmuv3p4(const ARMISARegisters *id)
 {
-    return isar_feature_aa64_pmu_8_4(id) || isar_feature_aa32_pmu_8_4(id);
+    return isar_feature_aa64_pmuv3p4(id) || isar_feature_aa32_pmuv3p4(id);
 }
 
 static inline bool isar_feature_any_ccidx(const ARMISARegisters *id)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7a420981f8..9507375b8e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -879,16 +879,16 @@ static int64_t instructions_ns_per(uint64_t icount)
 }
 #endif
 
-static bool pmu_8_1_events_supported(CPUARMState *env)
+static bool pmuv3p1_events_supported(CPUARMState *env)
 {
     /* For events which are supported in any v8.1 PMU */
-    return cpu_isar_feature(any_pmu_8_1, env_archcpu(env));
+    return cpu_isar_feature(any_pmuv3p1, env_archcpu(env));
 }
 
-static bool pmu_8_4_events_supported(CPUARMState *env)
+static bool pmuv3p4_events_supported(CPUARMState *env)
 {
     /* For events which are supported in any v8.1 PMU */
-    return cpu_isar_feature(any_pmu_8_4, env_archcpu(env));
+    return cpu_isar_feature(any_pmuv3p4, env_archcpu(env));
 }
 
 static uint64_t zero_event_get_count(CPUARMState *env)
@@ -922,17 +922,17 @@ static const pm_event pm_events[] = {
     },
 #endif
     { .number = 0x023, /* STALL_FRONTEND */
-      .supported = pmu_8_1_events_supported,
+      .supported = pmuv3p1_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
     { .number = 0x024, /* STALL_BACKEND */
-      .supported = pmu_8_1_events_supported,
+      .supported = pmuv3p1_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
     { .number = 0x03c, /* STALL */
-      .supported = pmu_8_4_events_supported,
+      .supported = pmuv3p4_events_supported,
       .get_count = zero_event_get_count,
       .ns_per_count = zero_event_ns_per,
     },
@@ -6400,7 +6400,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         g_free(pmevtyper_name);
         g_free(pmevtyper_el0_name);
     }
-    if (cpu_isar_feature(aa32_pmu_8_1, cpu)) {
+    if (cpu_isar_feature(aa32_pmuv3p1, cpu)) {
         ARMCPRegInfo v81_pmu_regs[] = {
             { .name = "PMCEID2", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 4,
@@ -6413,7 +6413,7 @@ static void define_pmu_regs(ARMCPU *cpu)
         };
         define_arm_cp_regs(cpu, v81_pmu_regs);
     }
-    if (cpu_isar_feature(any_pmu_8_4, cpu)) {
+    if (cpu_isar_feature(any_pmuv3p4, cpu)) {
         static const ARMCPRegInfo v84_pmmir = {
             .name = "PMMIR_EL1", .state = ARM_CP_STATE_BOTH,
             .opc0 = 3, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 6,
-- 
2.25.1

