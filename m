Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1979098lfj;
        Fri, 6 May 2022 11:10:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6frka/ldkm1fbOgZHo5uKGNynnPdgZhfBTP9X8MlDGM67LqiA3KmdG3LhZ/Kz86Yq1mNy
X-Received: by 2002:a05:6214:2388:b0:441:37e5:baec with SMTP id fw8-20020a056214238800b0044137e5baecmr3883118qvb.66.1651860602247;
        Fri, 06 May 2022 11:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860602; cv=none;
        d=google.com; s=arc-20160816;
        b=HXSOTekwXAxyRf7CTOeJxCkZt5ctmBnaqaRpX+s+CxaCCzH4MBAfDF7QNQ+vQODS1J
         AkxMC3ibH19KjACFzykTJKqfkdT5ai7WRQP7GUTRsTb+Y50xOtr33KGT59XAAwhLon6G
         p8CCvMe38wq/aAwxK6HFkAeFOOU8L2AVfFqwuARxJjtuTiln5v+cssg9Ulrj9LqxdoYU
         p6zgoqbXxmA1XtcubVYDEXpud7xA7bN+4sQCzM4ufXCXbPOx0GX1xqJcBQhSZt23v7+/
         9oDyW9ah+S4Y4OnymdnGwhuiDkEpJ7thx5MFCDSFab078/KUVadcgHInuMaBF8UUbocf
         ffQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
        b=0XPPBwYYJpSXcnvB+Av3DwPH/Gxh7mIgP2vqm6JOmd2v2yWFYbBjSd5onJTbnbaONK
         wRAus+O2FRVmi9A/27fUMEdRkyAvgTNUWB4F73NnGEliBxriuQnS+xSqUajIKnThhqXJ
         g44cE6L7TC4yk9MsIkotomwZjxkX391HEQO3yPLhM9KXq78i7pv/9YvBGMgHGdlHOFnW
         1TgpGYxBPYCWJshD5jaBMkopGzfTS2Vt++y0eYQKfrTB6AB59WRh+BhFByL7BdI9MS3A
         hBaZwlq3vsel5MFJNNXXx42gWJCnPJ7nTP0Kb0ten/+sXZ5QvwDrPM+qMN1HgpT0ZxQE
         ANhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRFI4zne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo23-20020a056214501700b00446684c8010si3748361qvb.155.2022.05.06.11.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRFI4zne;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2Ov-00019V-NA
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2II-0005xA-0y
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:11 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IF-0003nt-Bv
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:09 -0400
Received: by mail-oi1-x236.google.com with SMTP id m25so8306404oih.2
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=aRFI4zneLPQxf9CcVlLWt780H/tT5AIzROUd+wJ7HRYpF4o0jb4LclaNatwsKxk/12
 BKh6HpRag0rQY8QKEC94x2N6OkhO79gI9jfkGOuo1Veel7IIpL3FDlyqop5MHtL2gZol
 qvKx1k6UuuPHPgxka8GlpbEGtner8svwF5XNPQ3zcYL3lTvP3EVtFit0UUI2+fwKvCNM
 2frxtGejcZY8FBTpt73BRXzp31wOBFOVDzkoZP/1gkJoD3BPSqfKqXUIeIw3MJKrCaeL
 lW1ygSy8TkYGkAzklsrI86/cgSUe9ed8zHn2FF2vn1UZq+y13oGODUqik7ChKyFZDe4V
 yhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIDwI53sbDfS6sZLOTp4bVChNWHZq2iqQlUmdFQmUA0=;
 b=h2QHVSFGOOwmc24zyCu90gfvmjHHi0FmxIqgPB7v+/kS1x2GZ7XgG63qOq+KcO2ffC
 d7QEqi+IeiI3BfUxsP4sMc1Tht1hpFXaflYd/MgaTPwHPW/O9vvwA4mbGofJtO9tl6x8
 YrRxrc9foZrygQQopCECBc+y0hyHOOVOOC1QKoAkPkxth9DiT+xMcmSCDmXzny8DkefH
 PgbPvnW9ILkWqna/rDzFAq7p4HQyKriJZXRwDyx+Jzxd+DL+/YXZ1H0Yrq47d0lAPeQh
 VFcBv98P5DpNb0mi/A5PCLk1nruCPGX4AduzOIsiclD1YIltnwZjb5MLth1GrAIM9ED8
 1cwg==
X-Gm-Message-State: AOAM5331wnG9kHa3qafbtPjyfMxWGpCRQuo4tDVvcFuRI7lz62jv/ztJ
 ZJwgbSkRM6C03gUtaczIKUWOrQ==
X-Received: by 2002:a05:6808:1385:b0:325:efe5:b340 with SMTP id
 c5-20020a056808138500b00325efe5b340mr1923424oiw.249.1651860186658; 
 Fri, 06 May 2022 11:03:06 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 13/24] target/arm: Add minimal RAS registers
Date: Fri,  6 May 2022 13:02:31 -0500
Message-Id: <20220506180242.216785-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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
X-TUID: g4plLId+Qku5

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

