Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp987672ejy;
        Wed, 14 Sep 2022 06:14:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6J+uupgxczwHuy8i3Dt9CfNaYPPswjW+/TSZpaFXr8nEKuxWJSNekVDhx2HoGFEb4OoENA
X-Received: by 2002:a05:622a:f:b0:35b:a648:5871 with SMTP id x15-20020a05622a000f00b0035ba6485871mr19510915qtw.43.1663161290283;
        Wed, 14 Sep 2022 06:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663161290; cv=none;
        d=google.com; s=arc-20160816;
        b=P1qtWs7qQGJ4Hy+EqTcloG/1Jvtwgq0GhPBdBPU92RL0OlEu7tud25x0IQ+VV9jFOv
         yQ5YGbgcXBbHxXVFhRBWiwfMOZW4T+CUxq1aUNb/Eu/D02Z10FFCqhiuhbmvwo5bq9gt
         ZBR0T9Eoa0QRIGs7lq94VFjR3k4y6yMo7CKX0wrTUrShQahCIeNbPbV6RlchYeXBlG3r
         i+XnZ7336TlvkULMMoWfTFtfqKS2fd/KKwIidNJGFc+X+venFaiUe4PsGgXd5H+aE2lt
         0REKGHFB8FhodjplwskOPPOILXJBh7Xiz6J064RaW/LVc1CB9VpTSc1EVmP1mfEeM7Hm
         HWuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/Zv1141lSqg4CG9ilpWiN4/CwNcObP9cE5AABDghOqA=;
        b=Zc2sohnK7Q2WwM7RUzHIT68ZDW9ONvlTtmOKYfq34nZNYB/NSY9P2Fi1N+FDqIU7Te
         rCoraLgFxk1xE7wDa3ZMG+F0cfVrybKhIzlfWzg+DG7j1DRereJoDYSEBewTpQtukqMH
         /SVWqcqYpOKCCd9Ud5Fd4TG/jxOeC34vI+K5iebbu4SwI4G9lhw7TWrCTOZ1r+m85INg
         HtSSzRzjyDaaJdXQP9XML+YqDZFKUVU+Zv939bsCgW7Gm/d/4NmpYglM4k98QIs+fw4P
         G64y4jSH+euI5On4HCrgmwFHpjNcr60pnc5CzVOuyHDknB52jnBqRxzl1iEe4I14HYRd
         dEaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNFqB7wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020a05620a408800b006ce46fc5dd9si1592153qko.334.2022.09.14.06.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 06:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HNFqB7wa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYSE5-0006oO-Hn
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 09:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwd-0000Zs-Fp
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:43 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwV-000070-6q
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:43 -0400
Received: by mail-wm1-x32b.google.com with SMTP id n8so3866265wmr.5
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/Zv1141lSqg4CG9ilpWiN4/CwNcObP9cE5AABDghOqA=;
 b=HNFqB7wabDyOYbg3wrbgk3vCA7ZeoWHR7o0/is21iDPQpt3/WLgQ2RRGkyXSNG8tZL
 7bubfg69RhteXePIPQeLJa2xCG/5xAuiJQDsK/MDi8zNS1Q4Jls7KJ5Vy0bZssUw2rd1
 +Kps8N0rrgPOfdbRjtbqo630CXKGPuazisOaNwdcGldsX6y5BABj+BvK7x+JG2qw0cVR
 Ii60JMG7vByQj6IKXgaNSx0rWkYfYRvDMs0wpm47vpBSzpn6JJLYvqzioY6fLqt9bVuz
 kMYmh4vmbN2OzS75lT6AuHwWF5VETF/FH20gF6lfgnCvWIzNlHs3XNmB3Rzo0sXdp+X5
 oCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/Zv1141lSqg4CG9ilpWiN4/CwNcObP9cE5AABDghOqA=;
 b=nn8hg+jlK0wkGsSnaTvEAvAXL5A+KVjC1Ak9+nPFfR3OvyljrEOI8uJnzstILS89u0
 aG6DIHNBRehhJFUHBTfvOmVHY1WjbaTpd2dQFE6EFVLwWRqT3rbFRHVwzscphq8TvbfK
 Lk28bYtRBnCAav0QcjjLShZ6zZ4pzbMqI8nl04w+kZZ6tBumCzy238lzkjg6sS3sS4wr
 3awjDKJkfu3pR/BhOjNYmK4XR4GrdUbCIjXNfgyU+JLDvjaf/bm10Co+z2rkmDJA9V9b
 StWQOUjaBXOnVV+HrdN/65zE5TDxAs2Iv9VXkI/Pm3woi5Ep6izkXKmkTu4OZTa9D2yC
 BWRw==
X-Gm-Message-State: ACgBeo2UKRqa+AnEpYVGFLzYj3leAdcWAsPNB1tmlwt4VAR3xHMsoIJC
 ams1yrKpWCEzC5D+LE6PxvRHIQ==
X-Received: by 2002:a05:600c:a02:b0:3ad:455c:b710 with SMTP id
 z2-20020a05600c0a0200b003ad455cb710mr2880798wmp.56.1663156353747; 
 Wed, 14 Sep 2022 04:52:33 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 15/20] target/arm: Rename pmu_8_n feature test functions
Date: Wed, 14 Sep 2022 12:52:12 +0100
Message-Id: <20220914115217.117532-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kBUMosHHip9/

From: Peter Maydell <peter.maydell@linaro.org>

Our feature test functions that check the PMU version are named
isar_feature_{aa32,aa64,any}_pmu_8_{1,4}.  This doesn't match the
current Arm ARM official feature names, which are FEAT_PMUv3p1 and
FEAT_PMUv3p4.  Rename these functions to _pmuv3p1 and _pmuv3p4.

This commit was created with:
  sed -i -e 's/pmu_8_/pmuv3p/g' target/arm/*.[ch]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-8-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 16 ++++++++--------
 target/arm/helper.c | 18 +++++++++---------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index fa24ce9f96..d86e51992a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3712,14 +3712,14 @@ static inline bool isar_feature_aa32_ats1e1(const ARMISARegisters *id)
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
@@ -4038,13 +4038,13 @@ static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
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
@@ -4213,14 +4213,14 @@ static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
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
index 11a7a57710..987ac19fe8 100644
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
2.34.1

