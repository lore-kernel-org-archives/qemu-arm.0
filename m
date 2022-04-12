Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2008433lfq;
        Mon, 11 Apr 2022 17:44:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxoQMtiF2GTR4a2hUMVTVRLMAujz0NG3g+pCZHaj8QSuKYCtChb+HVq08o9bXd/QEbn0UP
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id t5-20020a5b0dc5000000b00624f16d7069mr24541129ybr.295.1649724255432;
        Mon, 11 Apr 2022 17:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724255; cv=none;
        d=google.com; s=arc-20160816;
        b=UOwVqtggFYPUejXYDFhEkfw+5vTyvpSLzL7dIc2hRCY82Khpbt9q+iKOo241Fc2K1J
         xGnQnDtoTHeVu376VUn+oHXWXkPUD4HF9ROEDtPB3Eo19SNLuNodU5hGIqy8NOwFved5
         a4e4sK3z3xgToE0yR2rbS6rzSjPikYEoegnGY9udD+Izb2/bIPdYNCJtZJqDgrkOKM/E
         QbrSLGi1v5eYPWnEcIX7lc/HVQN1TBQfX5/Blr/UyLETkFOilWAabSVjcP52yIcT6ZVm
         g18JKn3a+htanfSPRvojDq6lkOOozui6g2aBwvskGah5n//IXJDlKQlvrhVeLy6H3sgo
         sYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MftKlUzQkDeseaXdslWqkBX8Dus++JIPMAYpy80Nik0=;
        b=biRKKrQi15YVKIbBpO/IMkcugONwu3APvftWeW6yNUDOxFbM2983YSWnlRzaOt8+nL
         ee7vJUtPgeP15i5MyhErjrP5tR4gkjfuCpth7E3ov3YvqEy6/WHmoXu+xHWCsaplajBy
         B5HJ+blOFFAmmvaFkuHCBGOWJ2P4f4UuDA2q5kpnLnd99RzjhsNC43JHN0EZFTLxfrgc
         cIkF7k7ScnaZpKZoS6AIevqNQK4qz+XOKhv0erzinW1G3pnqpD8kkfO1wbuPqk/1D7Sd
         OQXTEloiolcbq4XyxK3wAw6aK+eomEWoiMwPlvVGnjHGgteF3QvHEQlUlOjmXqiz1ArO
         IArg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/BtuWPy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s189-20020a255ec6000000b00633994043d9si5175478ybb.67.2022.04.11.17.44.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="H/BtuWPy";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4di-0001Lj-P1
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TX-0001ur-R5
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:47 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TU-0001rF-HM
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:43 -0400
Received: by mail-pl1-x636.google.com with SMTP id 12so3506743pll.12
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MftKlUzQkDeseaXdslWqkBX8Dus++JIPMAYpy80Nik0=;
 b=H/BtuWPyvDyXbcxeihUa5X1usoa7Npv4JXuQA8lyyuhuAWAyU8M7Jgr093DhB4D63Y
 CaHDMDqIjnHEpX4KJ77ugEGfDmuxkPk7eyADWGsrkl9MgyEIxeDv8bifCvqm1ijjnFog
 3wcvgtupGvNM4CPFth6QmTawzCBspU6q77uOkdlqBD5YQBe9Y3s3gd6xA/+9AEY0RfPX
 7wrzs51gK74KOtXE7ToYbsAxZ9hxuGJMn2JFBG5cFYrVotOQ0gKwzIictpAUNjw0oqFv
 vL+7Du2XIp+8Whvx8eiN/g9NVmRNJ1pz3ZF1xll/43TKz6aOdhBUvDZZP5gIXaf+ITLD
 6roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MftKlUzQkDeseaXdslWqkBX8Dus++JIPMAYpy80Nik0=;
 b=HEbq9BXRTRhlpotjwuDgYbG+ssJxWO5rCgIaHhLVqjVlyCpvjuPFK2EdcxK8olg4Ms
 hNvPMq93FaxJXBZcCX4fM8T2vqJuUxq+p4hmiBY+jer4ZrP7JpQBN4tYx98iZI6RF0pb
 cjxBxMX1AJtGAJ9wMeyd67wz9eq0fGiIVnPNFjn6j3tIBvgdsE94zY3wqht6bIy91T6o
 Ct2oXOQvZJ2WqD7iStp/ReGJL2IlN3kk6hlTSXfxG3Ys3JtUua5O3jOaXUvmyt3++vaU
 TPMAAienwrIJJAMlzxFdyQgg7g1NaaV0N/ZP91/2VeR6imT7FRcYS4/p6pTa0uDs6sAN
 Xw8g==
X-Gm-Message-State: AOAM531EaO4aiuevjzEpWC4UadimtDJvUA7XODTOpOgQWfvZORwhkgLu
 VZe7jWCx9sm3F9bH8B7YamcHqN6UubkYDw==
X-Received: by 2002:a17:902:7244:b0:158:41d3:b79b with SMTP id
 c4-20020a170902724400b0015841d3b79bmr12745945pll.50.1649723618691; 
 Mon, 11 Apr 2022 17:33:38 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/24] target/arm: Add minimal RAS registers
Date: Mon, 11 Apr 2022 17:33:14 -0700
Message-Id: <20220412003326.588530-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FeVzm68hoEV1

Add only the system registers required to implement zero error
records.  This means we need to save state for ERRSELR, but all
values are out of range, so none of the indexed error record
registers need be implemented.

Add the EL2 registers required for injecting virtual SError.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Leave ERRSELR_EL1 undefined.
---
 target/arm/cpu.h    |   5 +++
 target/arm/helper.c | 105 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 890001f26b..1f24eeee8b 100644
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
index 210c139818..b066a86f04 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6147,6 +6147,102 @@ static const ARMCPRegInfo debug_lpae_cp_reginfo[] = {
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
+ * and
+ *   ERRSELR_EL1
+ * may generate UNDEFINED, which is the effect we get by not
+ * listing them at all.
+ */
+static const ARMCPRegInfo minimal_ras_reginfo_el1[] = {
+    { .name = "DISR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL1_RW, .fieldoffset = offsetof(CPUARMState, cp15.disr_el1),
+      .readfn = disr_read, .writefn = disr_write, .raw_writefn = raw_write },
+    { .name = "ERRIDR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 5, .crm = 3, .opc2 = 0,
+      .access = PL1_R, .accessfn = access_terr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo minimal_ras_reginfo_el2[] = {
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vdisr_el2) },
+    { .name = "VSESR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 2, .opc2 = 3,
+      .access = PL2_RW, .fieldoffset = offsetof(CPUARMState, cp15.vsesr_el2) },
+    REGINFO_SENTINEL
+};
+
+static const ARMCPRegInfo minimal_ras_reginfo_no_el2[] = {
+    { .name = "VDISR_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 1, .opc2 = 1,
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
@@ -8452,6 +8548,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

