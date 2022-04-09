Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp174009lfq;
        Fri, 8 Apr 2022 17:14:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpI7cMVCWj+A8wJTODFrwFwejB/oSV2VVbPcfbkmQ6tR90MCB7dnqxtiDxYN8yWVv3LFAY
X-Received: by 2002:ac8:5d94:0:b0:2e1:ce44:5041 with SMTP id d20-20020ac85d94000000b002e1ce445041mr18725368qtx.356.1649463278698;
        Fri, 08 Apr 2022 17:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463278; cv=none;
        d=google.com; s=arc-20160816;
        b=UgAo4fDr7NY2GP86bMua5myGo5CkZv6RrFDDaFf9myqZKAOxj5M3w2d9ZD5MQxtZk5
         Jy6En079vXf0g1V6jhNDr/YJpJY7CaqB+1Ba050JDtHikUMSj9ueqEYkGSOt2/148P8M
         swrV+oSVaP01CeSUVduIulgU9UPQxUSp1W0uUIP6hY97WlfwKW3Psomae4P7o+/W+wVE
         YUgjGyUy0Ih2k/E6XpUJDNrhMAgKSFyvH5UggIpFyaz/tVHdInUEgLCyxfV84j+gHgAX
         oLkG16edVl7nn6/CKDof/OO1Nim+Wvvr6iTPPxGItSG1hgEl8TuZ11YayrohXXpiu74G
         AOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6rBOq0Nv8/vTaxT5E/RtnNmWUY7SzIzq03s+HMA2Ob4=;
        b=KBdLRIIqjreEyb1p117Fbe91Tr1LrjkiN8ZdGo3qRVOu3NLnfWfZLFeBkkPD8JmH42
         fZ2h6qyqdxGT9W38qCH2qtsLK7tlw9DuJPao6MkadhSi7LrxmXhLc2XeiyEiAJEBp3Ii
         Dn+ArTHhuNjMCdYpPoPrlkXwmwGtfGbYdyB4owKEyaSyuYAH1ctWA4ayklQyOrRhFTy6
         UVNxU64ZpCm2idNLpKEfog9IKf9kAvV5YH9lYiaHukUFVU9x2tWN5ieNBsfOdQbo2L6p
         eGGNIvxnwz41kokzuUuJ3lwBswWpuQgpHkFblbHiQBjx1FgPCJQMHLj+8fKKoY++TMZL
         hrvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biIoclTy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fw7-20020a056214238700b00443c58b5a9bsi1234015qvb.532.2022.04.08.17.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=biIoclTy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncykQ-0005Im-6W
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydw-0008UR-S8
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:57 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydv-0003UM-04
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:56 -0400
Received: by mail-pl1-x633.google.com with SMTP id f10so9251504plr.6
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rBOq0Nv8/vTaxT5E/RtnNmWUY7SzIzq03s+HMA2Ob4=;
 b=biIoclTyfmv3tUiqGsSGzh1sEfoHF0/CK4ZRzQuJxEcZ4SSov70cbzjxs9v6vNcEt6
 WAXjirgIi7C3JNms/QF4iYbd1OC9mBCocIL0cA8xlLPWdhICN22MnN4Au8ZPbhIOKrSk
 pelOrqx9APQUcID569kpfXmLnILgihAUkSR7Ieub8tcQ5UrJWUtVQt/8yjCpIHkGDwI8
 wedO5SMSu+6nlgS78IFlPWw1nB951zY2t5XsXueId5qNWckkJ6elDdHVU7XARA3drevG
 g1LUHWgJRUqlg0cX10kNP6R+PwuytCnEJIGNIdWtDlyMQ1NSIOk1GS+PrvZ36u8Ppack
 NMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rBOq0Nv8/vTaxT5E/RtnNmWUY7SzIzq03s+HMA2Ob4=;
 b=AFXeamKw4xbf+EEXm/Z1nfewDKLO8IsiqEP0qe3Fs895qFM9m7cev1KluGSsRy1PaD
 7tVDGmc/Uug+4x3+tCfjeYipm+ApiPvALieH/Br5t9bTJeXicb5pYpolo17VE21M133j
 3ZQaiDenh7FGBXnf9Ojo5mhmAuXFrwfKNdw1+HdkQjiRMLNWUbSY/31dVQHc1kmXHks6
 E2gPLj0ulCGv+6q4WDxiSo8FkTvKuE9y3EMM1MHZjE2MWtowIKOdLUOyViRFko5z0mQF
 /iq1eamnypLJK7Z6UxtmnYHNshRV5cEgR8IJopA03zSD4f+42QwuhV9XNLfSE/9EmXkC
 M9MA==
X-Gm-Message-State: AOAM530Alzt86QNYazSe9HYbLw9xN2BNDnJIY1FAPwL0lhQElWEi+LeJ
 ZolVC6YvvsNL8Me/xCB2kGb0tUCNIKvQYQ==
X-Received: by 2002:a17:90a:fac:b0:1ca:5eb8:f3b2 with SMTP id
 41-20020a17090a0fac00b001ca5eb8f3b2mr24878076pjz.37.1649462873563; 
 Fri, 08 Apr 2022 17:07:53 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/16] target/arm: Add minimal RAS registers
Date: Fri,  8 Apr 2022 17:07:37 -0700
Message-Id: <20220409000742.293691-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KBrVnR2c5z8C

Add only the system registers required to implement zero error
records.  This means we need to save state for ERRSELR, but all
values are out of range, so none of the indexed error record
registers need be implemented.

Add the EL2 registers required for injecting virtual SError.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |   6 +++
 target/arm/helper.c | 107 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 890001f26b..66becc47f2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -524,6 +524,12 @@ typedef struct CPUArchState {
         uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
         uint64_t gcr_el1;
         uint64_t rgsr_el1;
+
+        /* Minimal RAS registers */
+        uint64_t disr_el1;
+        uint64_t errselr_el1;
+        uint64_t vdisr_el2;
+        uint64_t vsesr_el2;
     } cp15;
 
     struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 210c139818..01f8558fca 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6147,6 +6147,104 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
     REGINFO_SENTINEL
 };
 
+/*
+ * Check for traps to RAS registers, which are controlled
+ * by HCR_EL2.TERR and SCR_EL3.TERR.
+ */
+static CPAccessResult access_terr(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_TERR)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_TERR)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
+static uint64_t disr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        return env->cp15.vdisr_el2;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return 0; /* RAZ/WI */
+    }
+    return env->cp15.disr_el1;
+}
+
+static void disr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t val)
+{
+    int el = arm_current_el(env);
+
+    if (el < 2 && (arm_hcr_el2_eff(env) & HCR_AMO)) {
+        env->cp15.vdisr_el2 = val;
+        return;
+    }
+    if (el < 3 && (env->cp15.scr_el3 & SCR_EA)) {
+        return; /* RAZ/WI */
+    }
+    env->cp15.disr_el1 = val;
+}
+
+/*
+ * Minimal RAS implementation with no Error Records.
+ * Which means that all of the Error Record registers:
+ *   ERXADDR_EL1
+ *   ERXCTLR_EL1
+ *   ERXFR_EL1
+ *   ERXMISC0_EL1
+ *   ERXMISC1_EL1
+ *   ERXMISC2_EL1
+ *   ERXMISC3_EL1
+ *   ERXPFGCDN_EL1  (RASv1p1)
+ *   ERXPFGCTL_EL1  (RASv1p1)
+ *   ERXPFGF_EL1    (RASv1p1)
+ *   ERXSTATUS_EL1
+ * may generate UNDEFINED, which is the effect we get by not
+ * listing them at all.
+ */
+static const ARMCPRegInfo minimal_ras_reginfo_el1[] = {
+    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 0xc, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
+      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
+    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_terr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "ERRSELR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 1,
+      .access = PL1_RW, .accessfn = access_terr,
+      .fieldoffset = offsetof(CPUARMState, cp15.errselr_el1) },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo minimal_ras_reginfo_el2[] = {
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo minimal_ras_reginfo_no_el2[] = {
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 0xc, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
@@ -8452,6 +8550,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
 
+    if (cpu_isar_feature(any_ras, cpu)) {
+        define_arm_cp_regs(cpu, minimal_ras_reginfo_el1);
+        if (arm_feature(env, ARM_FEATURE_EL2)) {
+            define_arm_cp_regs(cpu, minimal_ras_reginfo_el2);
+        } else {
+            define_arm_cp_regs(cpu, minimal_ras_reginfo_no_el2);
+        }
+    }
+
     if (cpu_isar_feature(aa64_vh, cpu) ||
         cpu_isar_feature(aa64_debugv8p2, cpu)) {
         if (arm_feature(env, ARM_FEATURE_EL2)) {
-- 
2.25.1

