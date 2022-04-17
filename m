Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1281380lfk;
        Sun, 17 Apr 2022 11:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDdtYQGKK2Ih2zB2AQf2mXdDqrxj4kmeurpuQx+XrqmKjFwGd9xStUxieT/sd9M4Hf/U41
X-Received: by 2002:a05:6214:27ea:b0:446:54c7:a504 with SMTP id jt10-20020a05621427ea00b0044654c7a504mr2082744qvb.20.1650220443970;
        Sun, 17 Apr 2022 11:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650220443; cv=none;
        d=google.com; s=arc-20160816;
        b=kkNkINbohPfQkmakpQsrxhjuQ0DPp/k/yduOzZX1s7AGy4FN+XoEgbRE1Fr8Ew0g1s
         W+pLSKHT4Jte6nfxleVwxM6oCMaEgF0ImYO4Qo9cCPPJ6ld/Brug9x66VqRIwWvmIhf8
         D4zYgVtER5i9uH6JJWUbCEAXJrHCfK/CWsn8mUmDfyqhij+4SfwWcytRu22+ZcQLfc/e
         P1hOpXxk39Eu7zdAXU4fDK+BiFKKDjOMpBYnob76Pvc/6Yy03d640KrxbL97ZaeNa6wa
         vGovC+WvotiJmGeLzIuaRQYSusIY094SDVDplQ0E4smgtfccp7yXjT1lXtB/q7hWJOJX
         qizg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/2nhgssP4ozHtkanpGxF4AjgUdqOVfu1fnJToSIqjPk=;
        b=EsWX7qk2Febka3GAc0s4pdMOt471VT7z8O/U3eEJFwP5JnS4rO+nb7NR1Y9xYmXU/0
         Qi7Vl/Wl8aJ+wOtqsKJ9lom4Qomfe5BxZIiQy2c+9ir1COff3rmwiqScm2f9pMoaxc3+
         KMhCnCck9SkRVJVsoW8MFqV7JKWEEbpaAiySI45TyWPG1+dAiyrY/cBoyY3Uq3LiSpT/
         61AHObeSmMXp3P/g6Fm2CfdE79bsc3qMM74we8EHkvbdb5A9xyp5ex9OUaLynNFBI5a9
         J9w7ASowgFdvyqa4RUHQFWl4OKHHrqatFmH2rb1Chfx9JXDiBmGvhTp+C2iA6Dk9vqn+
         61Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCpPlrx2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6-20020ac85a06000000b002f1fd16cf0bsi456563qta.14.2022.04.17.11.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UCpPlrx2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9il-0005yt-Eh
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90R-0004Zm-Rw
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:15 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:45847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Q-000446-18
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:48:15 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 12so10725921pll.12
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2nhgssP4ozHtkanpGxF4AjgUdqOVfu1fnJToSIqjPk=;
 b=UCpPlrx21KIcmgbDRdTOFwmykcYLUpzv/jUoYAou4AyXOn4fRDpyIHwk3ZHR4dUIUJ
 yxad8LsJb8UPnr9Mys9L5N+b7Ydv+IwlEI6sy6ghylOs0HfMioRIedXyTkE99702dlww
 nn1LgmlyoZdQ+0UiJVvT05+zqbzit2eJK609QdBSnHIXx63HocpVU8SHKxVqCT2GfMM+
 UqkG4yVzNHO9PLZx2xFrEcrsHJBTlZCcQNTZXMfpxKcO21nyIiU8L4rH/UJk40/ndIlk
 0Bd6qx40T1Jf9qWR+efRZvuMHnG/bpNSEzwvgdNJPel88peciE9FrEV/MMjdkrRJyzkj
 NtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2nhgssP4ozHtkanpGxF4AjgUdqOVfu1fnJToSIqjPk=;
 b=doOLZC9j/anoMLiwN8OELaC7xkFSiB8+d1hGDwG6dBAKzD+kHyhr3EHuy/6FlT9ZGX
 RoNkwe2sRZ1SsbDZijgmPXzpqBsYZ7PtcQcJ1az/z7vlumP5qUd8kxDmTYMEkvO2RpvM
 UkV+N7RkXLr/HV2wkT9ol2rBl/g05FbKlnF+ds2bsYF/+Wn2pH9bir4CRaQtUqQ1hg9z
 uxaY7OLP/pijUyDq0+16zjV8I/DeS5wm/E9HUpYizzeCaqjKjs093X+tO2O/4lAlNOx3
 X3j6toB3ah+7CozFrTxOf8I7/diyDtBEuuetScEptx6cqq4zXi0pcpLZCZk7LiLd7cm6
 kVXQ==
X-Gm-Message-State: AOAM533bwWDpLgPRUNcRCRMXxLCfXJS4ZtQQgZD/rVbe2s9jq7NaVpWv
 Ezye5oJz6DMzrLm6A1ydHchy+VHsBNfdQQ==
X-Received: by 2002:a17:902:7c01:b0:156:17a5:a68 with SMTP id
 x1-20020a1709027c0100b0015617a50a68mr7612430pll.166.1650217692666; 
 Sun, 17 Apr 2022 10:48:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 49/60] target/arm: Add minimal RAS registers
Date: Sun, 17 Apr 2022 10:44:15 -0700
Message-Id: <20220417174426.711829-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: GnEhbpszbJb+

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
index d71edfc1c1..a6d1923a78 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -524,6 +524,11 @@ typedef struct CPUArchState {
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
index 3570212089..655beba3d6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5990,6 +5990,87 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
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
@@ -8224,6 +8305,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_ssbs, cpu)) {
         define_one_arm_cp_reg(cpu, &ssbs_reginfo);
     }
+    if (cpu_isar_feature(any_ras, cpu)) {
+        define_arm_cp_regs(cpu, minimal_ras_reginfo);
+    }
 
     if (cpu_isar_feature(aa64_vh, cpu) ||
         cpu_isar_feature(aa64_debugv8p2, cpu)) {
-- 
2.25.1

