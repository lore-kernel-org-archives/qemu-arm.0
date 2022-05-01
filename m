Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp494118lfu;
        Sun, 1 May 2022 00:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/BmdIuWMqVv3ARSdWGWsT+NK99ZJ0Nh1d3uoIFXkcY06sRG8CrmpdPcgFJn9RiWQiRpW6
X-Received: by 2002:ac8:5aca:0:b0:2f3:651a:4f8d with SMTP id d10-20020ac85aca000000b002f3651a4f8dmr5799149qtd.651.1651389354023;
        Sun, 01 May 2022 00:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651389354; cv=none;
        d=google.com; s=arc-20160816;
        b=rQkxG8eA3Kya8Kyyl1NlhXo539oj+0Y+thKHnOXe7BUmfv3NbPC3ZUUsjZoOKL/M3V
         0E28eieRAoKzVQApavZMICijBqjsgTir8zPIlI4WXBj0rrR/jGJjM8YblBWfv04lon8J
         NuOuh5CjNSynR1oYGFVCHRB97+K5jkgDlNAsGBPxb4fzHYtzMLMbslsxZaZxPFogM64N
         GY634OHXR+wGb+RVSlPhaDU3infBM4qoLGuslfVAXMcyb24Ok9GAr/M4ZNv4iUpm03M9
         v/+8ZUQw79ynZRVRUjprXonzP6MGU1Mi6NafZI4FiW4xaA3VUK5id4M6DTUnwdVDSu05
         H1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OgK/bg8qfHwwWTHPP3NZqw3YdheAlsDilvaD2LibWrI=;
        b=OMh4IvKA279lAD5z4GmkCofC9fkEyvFjlHo6UTVAR1H9RP0ti0x8cVKoJinPUnS98P
         //gKCGfvi2ZicC4gj6O1U4qfUW13QNnBwUIbL1krAfLxzMXAo3mr/TlP8BEpDUijuqI4
         l2RLvn3wkMfJ9+LAC7yEOpTnY7xpRqTx8+r3UaAbGkXL1XrdMwTDzY7honHekfOqGxUw
         F07s4TGNRmvHtO1ARygS1exIglXLbwh2YllMxsliAhgx7ZK5WuvrKz9iIu0n3322AmcM
         2wPJ2cQiDm1bxup/j6URGxnEnFvCeeh031zlEpsvZ58vb1S7KqZg1KVBSfMEfXLKuFPl
         qPlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1Y6ZakE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b18-20020a05622a021200b002f387563e52si4576708qtx.147.2022.05.01.00.15.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 May 2022 00:15:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U1Y6ZakE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl3o9-0004jl-H9
	for alex.bennee@linaro.org; Sun, 01 May 2022 03:15:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U8-00072F-KC
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:09 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2U4-0001Q5-W4
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:51:07 -0400
Received: by mail-pf1-x42d.google.com with SMTP id g8so7663202pfh.5
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OgK/bg8qfHwwWTHPP3NZqw3YdheAlsDilvaD2LibWrI=;
 b=U1Y6ZakEi2LMpP+oP/YCAbXEpQ97pTuP2QGD8C3UeDqqeWqk6IwK76XqfSV8uZViKH
 GWPfY0bW4IEd4KdqDl+uvhWsDQ7D5Rr+/TWiPDJKh16788mcMczsjJkbuVO35KC1CWHX
 fQOHweNFWbctlp62jf01/mQIiIVkR1MQEM7nrTUbMmaW2HRoHtASd+fojhB4jpPRwwA3
 d6hJ88BwkfFoyBjhQVdmhG6KOaHU5kgdWbYzYqwKcpejiTM47NwSB003PnpVHNkQKAuI
 +T0cyUBnKi9jc7so4Ij1v1Ey77K6JvF8dGTk6bnDak6glhOsqF5+ASvdG+3WCIxNL8cL
 HGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OgK/bg8qfHwwWTHPP3NZqw3YdheAlsDilvaD2LibWrI=;
 b=OyAwWmr3rtPyWfKm0y0ij0gI1iBI/W5IHFDod92xWjJeafR5IXMAzlPElXiG/HuYDi
 mF3GnO+idY4nLu2cNVT3RHKZJNNfnDKFDZK1/qRYhl7YdJMzQePrtqAc+h/0otlN3d+e
 WAUv6I8I7TGmLu/35pfqURxFLZlgjU0yOxn4Y3Mh6b+tojWR6QTmqNSI/0zkF+qeNz5U
 9mXliMhELgguE4bdMuEeLolHOojz+nBwpZV81fFOBAWQ27iEue4YfOtNN7vpa3DnS66V
 4qPxyNxHEY0PN8CptGt89I3JKa38uWcbYC78lW9uTWcanrFlWsIkQFmi5DRbr+nk2WzK
 KVtg==
X-Gm-Message-State: AOAM533a8n31iM+8IH00Bjk0PD4jZTpB8CMUw51I1FhFR9fq0BjthQ5E
 qp5Kz15AtsC71+d2aR0K8dnweA==
X-Received: by 2002:a05:6a00:98b:b0:50d:ac70:c39a with SMTP id
 u11-20020a056a00098b00b0050dac70c39amr6112590pfg.25.1651384262943; 
 Sat, 30 Apr 2022 22:51:02 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:51:02 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 34/45] target/arm: Add minimal RAS registers
Date: Sat, 30 Apr 2022 22:50:16 -0700
Message-Id: <20220501055028.646596-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: pFwjZfU9xGX7

Add only the system registers required to implement zero error
records.  This means we need to save state for ERRSELR, but all
values are out of range, so none of the indexed error record
registers need be implemented.

Add the EL2 registers required for injecting virtual SError.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Leave ERRSELR_EL1 undefined.
v3: Rely on EL3-no-EL2 squashing during registration.
---
 target/arm/cpu.h    |  5 +++
 target/arm/helper.c | 84 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ca01f909a8..a55980d66d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -525,6 +525,11 @@ typedef struct CPUArchState {
         uint64_t tfsr_el[4]; /* tfsre0_el1 is index 0.  */
         uint64_t gcr_el1;
         uint64_t rgsr_el1;
+
+        /* Minimal RAS registers */
+        uint64_t disr_el1;
+        uint64_t vdisr_el2;
+        uint64_t vsesr_el2;
     } cp15;
 
     struct {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index a5741e0ad7..b4bdd4a4a6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5980,6 +5980,87 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
       .access = PL0_R, .type = ARM_CP_CONST|ARM_CP_64BIT, .resetvalue = 0 },
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
+ * and
+ *   ERRSELR_EL1
+ * may generate UNDEFINED, which is the effect we get by not
+ * listing them at all.
+ */
+static const ARMCPRegInfo minimal_ras_reginfo[] = {
+    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
+      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
+    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_terr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
+};
+
 /* Return the exception level to which exceptions should be taken
  * via SVEAccessTrap.  If an exception should be routed through
  * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
@@ -8214,6 +8295,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_ssbs, cpu)) {
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
+    if (cpu_isar_feature(any_ras, cpu)) {
+        define_arm_cp_regs(cpu, minimal_ras_reginfo);
+    }
 
     if (cpu_isar_feature(aa64_vh, cpu) ||
         cpu_isar_feature(aa64_debugv8p2, cpu)) {
-- 
2.34.1

