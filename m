Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1306988lfj;
        Thu, 5 May 2022 12:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfCS7Zbc+k613OL6CNuFY/TJwxszzj2ro4FOsBHTK6wf0CSwamhFGvPfK94M8DyW41hqeI
X-Received: by 2002:ac8:5a05:0:b0:2e1:a657:54ce with SMTP id n5-20020ac85a05000000b002e1a65754cemr25402366qta.161.1651778941131;
        Thu, 05 May 2022 12:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651778941; cv=none;
        d=google.com; s=arc-20160816;
        b=F9sQvIl6zaDQcunmqAJyGwAkCKvqd+XAUIQmUE//sIH/Fa71P3SAbBeRIEkCRSMZIF
         j1MPvNTnV0DDXjYWBJFYIckexIChhc7AwOKld+67MlPeU5bNr+nn7TYtyVw/y0H2BUBa
         v17A30goKFF2BqvWPVFQa+YeXjWnm1/cLbIV1ol7Ry8C+ke5+3MPqIX6w5o8z9ApEsYF
         loqo55XVC4Qh6gtyx3EXQvq/1xpptpAUGTf0R0AFMapTAO8H+ib6JnlkQKQtJ3pJUi7i
         Z9nJEoBtaTBeb8Em4mghko5cp453ej9MQZEEZC1JEX8NzGBnw/vVCv7OyRhPZWWhBInS
         ZbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
        b=uYjD/pYJZZoHJZ6tMxUEzlK8yG75R4ZQapUd8DrvOYS2T6XNpFonH+E/DKp3UbuyRX
         40q5Qne24F0qcZ95t8iN18AMy0wYt5cjenYewnxE6jRqdJmmBkWdjFko/pr55atoMbYK
         6TB6TbAhaQuvDOkEpjc9TS9uqad5BsBeyxbhQxQEzkJcDSPY4w7NLQCy2GRVM9V+Pxaf
         gqL+8moFaaBggiNCLdYiL+1uMAcQ1ydehGbvKtmbM3R/WpSGOJRV0Ybd8o73DxX1P644
         JMFWLGSR1PifbwTAoCeuxcH8TjCJBgkyXlRmpOv+TxXQPJLjvsIrwCq4CVuoXXwID0os
         daMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFpk7fi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020ac85909000000b002f3b53ca6afsi1538369qty.241.2022.05.05.12.29.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eFpk7fi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmh9o-00017q-JW
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYb-0002vb-AR
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:33 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYW-0004NR-19
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:32 -0400
Received: by mail-oi1-x233.google.com with SMTP id m11so5238885oib.11
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=eFpk7fi+O0eX7rAA55+q8wDhsDE9OPPW+cGEH3OAQfBrcYbQXBozwdH45bClv6dG+M
 dneCKh96yFN8MXg3/I5BeLPY+cnMPB5JSGsfEimFKAd4VPRsOda23T0mQHOJI7UbjB7G
 Z9gFjcHhF/wwWErtvoQsp44XptqrMLYv8GFdTPsl+NURIGKEU/tBW8zxRS56CsUuHkkc
 MZbusHKQUrvZK4FYaFEUhAJKVHBZMuHsxYPUwgSFvxgx9lw7YUeS8LCHthWGgXlLqze6
 wLEATV9/s3VIN8OWDLNQ2AomPgE3XlUZQCWbYYsR/Rq1eU5iurNwiIyJ7Ailj21d6pGr
 3Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=R8LJK0vcoEZcnaWcvdVtbUl/+78sE6AFZrLqXORVWvXalFDMVOQnETwYea1YcQ4Fka
 tR3NWXun6QwjNd0jJlzZX1lO5Dt8dcVgJ6etx3RwD8NKkyX33jip3Ip7zWwI9T9+E1wn
 f5aiuZ/2ZoDGwyCQpqqBbv01lerMAEnioW19PPPjFkdyH/VYbx+6/ONBiRVJq1Nw0KTm
 iPSF80hX102QSPG1jZKPo1v22F3j85qrMk5Gtyyxmt8mNro7yT5UhelSzpQvgiQlrg4L
 QoEBwDSjBZSceRTHCk445gU/Q+9CvYtnRuijMXvb0nKLNhsCq7rMFaCEHBfyZIkH8kWv
 gLgg==
X-Gm-Message-State: AOAM532FVrya79Ki+ZcrZMni/BLYSZX1SlIg+UWJcZwXnnoPtF5bnRqN
 7P4FFCjoJLboFx05D/f4/DS96w==
X-Received: by 2002:a05:6808:ec9:b0:2f9:a831:7df2 with SMTP id
 q9-20020a0568080ec900b002f9a8317df2mr3034298oiv.119.1651776627321; 
 Thu, 05 May 2022 11:50:27 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 13/24] target/arm: Add minimal RAS registers
Date: Thu,  5 May 2022 13:49:55 -0500
Message-Id: <20220505185006.200555-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x233.google.com
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
X-TUID: RgaGcI8wP6gX

Add only the system registers required to implement zero error
records.  This means that all values for ERRSELR are out of range,
which means that it and all of the indexed error record registers
need not be implemented.

Add the EL2 registers required for injecting virtual SError.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 7b31c71980..37c5e42bc0 100644
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
@@ -8217,6 +8298,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

