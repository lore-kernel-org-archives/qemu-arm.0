Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1974799lfj;
        Fri, 6 May 2022 11:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCdzmFpNQvYAzkq/r7C5DJp8L4+4UkZMtXXLt7JZSxzIFrtt2t4Jp16AXc9rAzplqXECPG
X-Received: by 2002:ad4:5749:0:b0:459:1c08:f80a with SMTP id q9-20020ad45749000000b004591c08f80amr3535861qvx.56.1651860205211;
        Fri, 06 May 2022 11:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651860205; cv=none;
        d=google.com; s=arc-20160816;
        b=MxhkkiKPU0X2+E/Ky9YmdMz27Rbh8CBdhDJQ6uQzwClvELSXGbOi8fpKZKm9tb/OQr
         E4+hx/ka5ZV28NCaOX+zA9QVX55RHPq8eiSNHloRKpj2Ij3Rp7YIAwh39/VJj+iS9sD7
         0JQJ2c+jflL1YGsd1Ox7DghjodKKKg3CeCBDgjEaECMf+2YFeBYQaPDeU28LJViZY2k8
         vUoBvqjagqtwcULGrquV0R7ok5OPbZbF9Y6EXZj5lNuNTdL4NcTgcfFAETrtyIIawMBU
         8kpHCEoaMCaey+8mPU2k/XuSLzf7YNGQf+df/10s8Y4kYb3sOoY0zl37AqzLeHMd3UKY
         QjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pPugSRT5glzJz0c1TvdvdRW/o0T2XpWhDabDguMkmM4=;
        b=uexVjrHDe2R1jeF1ccfv+zxBspGJ0CXYtUcb+sYtwoW9jcp2ocj1vIHKjMXcXv+T/6
         1jaInbom/3373I15qyPQaB+OABCbirYYc+jacHFLDgj6nNRwQNq2UD4iD1TQp8phwqii
         NHFweNdqKtRquC5ELE08LOjDueumaVJcUbTGXpLMjlpPyR2VifIGHhYPu/es51LVoKsX
         HQLLW/LKBqXG2/IEn9nB92VcHyE3AZFyM54tGlvzvfG6WVuapSCfpTmp+QEL8eE2OAci
         yaGmNEu5MkvBXzZvlpyculJv85w0j7DT/wqGUTSim6Il8H1yVdS/GKlm4ACl1gKs6Bzw
         csoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bkdB5N6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20-20020a05622a001400b002f203861922si3007738qtw.573.2022.05.06.11.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bkdB5N6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2IW-0005EC-Aw
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2I1-0005Bd-7Q
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:53 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:45748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2Hx-0003pR-Bh
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:02:52 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 s18-20020a056830149200b006063fef3e17so5402633otq.12
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPugSRT5glzJz0c1TvdvdRW/o0T2XpWhDabDguMkmM4=;
 b=bkdB5N6Y3g4Bamk90MmALREdPcVnQ3XmydClDf92fkOjCBMqkyCMAWfi4RxXJbi5Wd
 Skm1gcmuUhwu+aTJ1d7S+5Qs9ml18Gd0qiz2OoVQ/R96sJTkZpTk6lZYwTf0gLSI8m4p
 eGvLZj2r7XJG3czv8U4RbYXBsdIGksJRWBAb2LASjm+Lq7d3YsUUUeYD6FVBGUrh+qYl
 BQxDPumy1Fys6CwQ6FMD+b5TXhNBWic9WkOWrP4SdEN6yxtBp7h/b/M8HbY0l2HWGTqt
 2G1wvojr8l7+Kdyl9Mq9BjYLuUWj/6XUgAIRy1+qtJYsrQ4iaUD9lX0HUA7+MyZGv7jc
 Ggvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPugSRT5glzJz0c1TvdvdRW/o0T2XpWhDabDguMkmM4=;
 b=A1DGhNPZBVN2NDef+CzAwe8KzzoQxUseT12bH2Qi74EaOFfEd0f1A6+4A1d+m7Th0u
 q2/+W1UdDAwo9HOXS2BCLKAnFcqxIMWbE4WM7faB0WdtQvU33pgl9pQzZDAe7wjpwP6h
 c6RGaDMATHiiLo3YNt4saGacFlM1AfwFs5KixuT/K+uajV/NxCFdHsy41WmDKs77/OBE
 ofI6hNwl4PdG4/8SDuofS3lA9uADEy5vnT8K2tdPFKSsxJnJTyPECV/leRV7QIkZT7Ra
 QyDqD9YtzYo3GxS+d0hfUcLl371l5vcL01ZxITF9pZrWT0avJzN7NmCwC2l/pHm8F5Bs
 SLsQ==
X-Gm-Message-State: AOAM531FDJwiDwrnsmKzsNX+Z4Dc6L4BshASMYOi6tBhZTOjvc4PMhlm
 uKVk1cYDkK74riA9gyDHQ5m75g==
X-Received: by 2002:a9d:2f61:0:b0:5e9:4bfb:61cc with SMTP id
 h88-20020a9d2f61000000b005e94bfb61ccmr1435051otb.355.1651860167851; 
 Fri, 06 May 2022 11:02:47 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:02:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 01/24] target/arm: Handle cpreg registration for missing EL
Date: Fri,  6 May 2022 13:02:19 -0500
Message-Id: <20220506180242.216785-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
X-TUID: EXLMAXmHuYmJ

More gracefully handle cpregs when EL2 and/or EL3 are missing.
If the reg is entirely inaccessible, do not register it at all.
If the reg is for EL2, and EL3 is present but EL2 is not,
either discard, squash to res0, const, or keep unchanged.

Per rule RJFFP, mark the 4 aarch32 hypervisor access registers
with ARM_CP_EL3_NO_EL2_KEEP, and mark all of the EL2 address
translation and tlb invalidation "regs" ARM_CP_EL3_NO_EL2_UNDEF.
Mark the 2 virtualization processor id regs ARM_CP_EL3_NO_EL2_C_NZ.

This will simplify cpreg registration for conditional arm features.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v4: Add ARM_CP_EL3_NO_EL2_{UNDEF,KEEP}.
v5: Add ARM_CP_EL3_NO_EL2_C_NZ.
---
 target/arm/cpregs.h |  11 +++
 target/arm/helper.c | 178 ++++++++++++++++++++++++++++++--------------
 2 files changed, 133 insertions(+), 56 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 73984549d2..db03d6a7e1 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -102,6 +102,17 @@ enum {
     ARM_CP_SVE                   = 1 << 14,
     /* Flag: Do not expose in gdb sysreg xml. */
     ARM_CP_NO_GDB                = 1 << 15,
+    /*
+     * Flags: If EL3 but not EL2...
+     *   - UNDEF: discard the cpreg,
+     *   -  KEEP: retain the cpreg as is,
+     *   -  C_NZ: set const on the cpreg, but retain resetvalue,
+     *   -  else: set const on the cpreg, zero resetvalue, aka RES0.
+     * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+     */
+    ARM_CP_EL3_NO_EL2_UNDEF      = 1 << 16,
+    ARM_CP_EL3_NO_EL2_KEEP       = 1 << 17,
+    ARM_CP_EL3_NO_EL2_C_NZ       = 1 << 18,
 };
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b4daf4f076..9ab8b65e7b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5056,16 +5056,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
     { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
-      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_FPU,
+      .access = PL2_RW,
+      .type = ARM_CP_ALIAS | ARM_CP_FPU | ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]) },
     { .name = "DACR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 3, .crm = 0, .opc2 = 0,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .type = ARM_CP_EL3_NO_EL2_KEEP,
       .writefn = dacr_write, .raw_writefn = raw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.dacr32_el2) },
     { .name = "IFSR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 0, .opc2 = 1,
-      .access = PL2_RW, .resetvalue = 0,
+      .access = PL2_RW, .resetvalue = 0, .type = ARM_CP_EL3_NO_EL2_KEEP,
       .fieldoffset = offsetof(CPUARMState, cp15.ifsr32_el2) },
     { .name = "SPSR_IRQ", .state = ARM_CP_STATE_AA64,
       .type = ARM_CP_ALIAS,
@@ -5542,27 +5543,27 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
       .writefn = tlbimva_hyp_is_write },
     { .name = "TLBI_ALLE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 0,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2_write },
     { .name = "TLBI_VAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2_write },
     { .name = "TLBI_VALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 7, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2_write },
     { .name = "TLBI_ALLE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 0,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2is_write },
     { .name = "TLBI_VAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 1,
-      .type = ARM_CP_NO_RAW, .access = PL2_W,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
     { .name = "TLBI_VALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 3, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
 #ifndef CONFIG_USER_ONLY
     /* Unlike the other EL2-related AT operations, these must
@@ -5572,11 +5573,13 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
     { .name = "AT_S1E2R", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 0,
       .access = PL2_W, .accessfn = at_s1e2_access,
-      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC, .writefn = ats_write64 },
+      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC | ARM_CP_EL3_NO_EL2_UNDEF,
+      .writefn = ats_write64 },
     { .name = "AT_S1E2W", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 8, .opc2 = 1,
       .access = PL2_W, .accessfn = at_s1e2_access,
-      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC, .writefn = ats_write64 },
+      .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC | ARM_CP_EL3_NO_EL2_UNDEF,
+      .writefn = ats_write64 },
     /* The AArch32 ATS1H* operations are CONSTRAINED UNPREDICTABLE
      * if EL2 is not implemented; we choose to UNDEF. Behaviour at EL3
      * with SCR.NS == 0 outside Monitor mode is UNPREDICTABLE; we choose
@@ -6076,7 +6079,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
     { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
       .access = PL2_RW, .accessfn = access_tda,
-      .type = ARM_CP_NOP },
+      .type = ARM_CP_NOP | ARM_CP_EL3_NO_EL2_KEEP },
     /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
      * Channel but Linux may try to access this register. The 32-bit
      * alias is DBGDCCINT.
@@ -6892,11 +6895,11 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NOP },
     { .name = "TLBI_RVAE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
    { .name = "TLBI_RVALE2IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 2, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RIPAS2E1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 4, .opc2 = 2,
@@ -6906,19 +6909,19 @@ static const ARMCPRegInfo tlbirange_reginfo[] = {
       .access = PL2_W, .type = ARM_CP_NOP },
    { .name = "TLBI_RVAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
    { .name = "TLBI_RVALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 5, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2is_write },
     { .name = "TLBI_RVAE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2_write },
    { .name = "TLBI_RVALE2", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 6, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_rvae2_write },
    { .name = "TLBI_RVAE3IS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 6, .crn = 8, .crm = 2, .opc2 = 1,
@@ -6973,11 +6976,11 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .writefn = tlbi_aa64_vae1is_write },
     { .name = "TLBI_ALLE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 0,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_alle2is_write },
     { .name = "TLBI_VAE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 1,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
    { .name = "TLBI_ALLE1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 4,
@@ -6985,7 +6988,7 @@ static const ARMCPRegInfo tlbios_reginfo[] = {
       .writefn = tlbi_aa64_alle1is_write },
     { .name = "TLBI_VALE2OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 5,
-      .access = PL2_W, .type = ARM_CP_NO_RAW,
+      .access = PL2_W, .type = ARM_CP_NO_RAW | ARM_CP_EL3_NO_EL2_UNDEF,
       .writefn = tlbi_aa64_vae2is_write },
     { .name = "TLBI_VMALLS12E1OS", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 4, .crn = 8, .crm = 1, .opc2 = 6,
@@ -7905,21 +7908,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "VPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = cpu->midr, .type = ARM_CP_ALIAS,
+              .resetvalue = cpu->midr,
+              .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vpidr_el2) },
             { .name = "VPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 0,
               .access = PL2_RW, .resetvalue = cpu->midr,
+              .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vpidr_el2) },
             { .name = "VMPIDR", .state = ARM_CP_STATE_AA32,
               .cp = 15, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
               .access = PL2_RW, .accessfn = access_el3_aa32ns,
-              .resetvalue = vmpidr_def, .type = ARM_CP_ALIAS,
+              .resetvalue = vmpidr_def,
+              .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetoflow32(CPUARMState, cp15.vmpidr_el2) },
             { .name = "VMPIDR_EL2", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 4, .crn = 0, .crm = 0, .opc2 = 5,
-              .access = PL2_RW,
-              .resetvalue = vmpidr_def,
+              .access = PL2_RW, .resetvalue = vmpidr_def,
+              .type = ARM_CP_EL3_NO_EL2_C_NZ,
               .fieldoffset = offsetof(CPUARMState, cp15.vmpidr_el2) },
         };
         define_arm_cp_regs(cpu, vpidr_regs);
@@ -8506,13 +8512,14 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
+    CPUARMState *env = &cpu->env;
     uint32_t key;
     ARMCPRegInfo *r2;
     bool is64 = r->type & ARM_CP_64BIT;
     bool ns = secstate & ARM_CP_SECSTATE_NS;
     int cp = r->cp;
-    bool isbanked;
     size_t name_len;
+    bool make_const;
 
     switch (state) {
     case ARM_CP_STATE_AA32:
@@ -8547,6 +8554,32 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         }
     }
 
+    /*
+     * Eliminate registers that are not present because the EL is missing.
+     * Doing this here makes it easier to put all registers for a given
+     * feature into the same ARMCPRegInfo array and define them all at once.
+     */
+    make_const = false;
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        /*
+         * An EL2 register without EL2 but with EL3 is (usually) RES0.
+         * See rule RJFFP in section D1.1.3 of DDI0487H.a.
+         */
+        int min_el = ctz32(r->access) / 2;
+        if (min_el == 2 && !arm_feature(env, ARM_FEATURE_EL2)) {
+            if (r->type & ARM_CP_EL3_NO_EL2_UNDEF) {
+                return;
+            }
+            make_const = !(r->type & ARM_CP_EL3_NO_EL2_KEEP);
+        }
+    } else {
+        CPAccessRights max_el = (arm_feature(env, ARM_FEATURE_EL2)
+                                 ? PL2_RW : PL1_RW);
+        if ((r->access & max_el) == 0) {
+            return;
+        }
+    }
+
     /* Combine cpreg and name into one allocation. */
     name_len = strlen(name) + 1;
     r2 = g_malloc(sizeof(*r2) + name_len);
@@ -8567,44 +8600,77 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
         r2->opaque = opaque;
     }
 
-    isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
-    if (isbanked) {
+    if (make_const) {
+        /* This should not have been a very special register to begin. */
+        int old_special = r2->type & ARM_CP_SPECIAL_MASK;
+        assert(old_special == 0 || old_special == ARM_CP_NOP);
         /*
-         * Register is banked (using both entries in array).
-         * Overwriting fieldoffset as the array is only used to define
-         * banked registers but later only fieldoffset is used.
+         * Set the special function to CONST, retaining the other flags.
+         * This is important for e.g. ARM_CP_SVE so that we still
+         * take the SVE trap if CPTR_EL3.EZ == 0.
          */
-        r2->fieldoffset = r->bank_fieldoffsets[ns];
-    }
+        r2->type = (r2->type & ~ARM_CP_SPECIAL_MASK) | ARM_CP_CONST;
+        /*
+         * Usually, these registers become RES0, but there are a few
+         * special cases like VPIDR_EL2 which have a constant non-zero
+         * value with writes ignored.
+         */
+        if (!(r->type & ARM_CP_EL3_NO_EL2_C_NZ)) {
+            r2->resetvalue = 0;
+        }
+        /*
+         * ARM_CP_CONST has precedence, so removing the callbacks and
+         * offsets are not strictly necessary, but it is potentially
+         * less confusing to debug later.
+         */
+        r2->readfn = NULL;
+        r2->writefn = NULL;
+        r2->raw_readfn = NULL;
+        r2->raw_writefn = NULL;
+        r2->resetfn = NULL;
+        r2->fieldoffset = 0;
+        r2->bank_fieldoffsets[0] = 0;
+        r2->bank_fieldoffsets[1] = 0;
+    } else {
+        bool isbanked = r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1];
 
-    if (state == ARM_CP_STATE_AA32) {
         if (isbanked) {
             /*
-             * If the register is banked then we don't need to migrate or
-             * reset the 32-bit instance in certain cases:
-             *
-             * 1) If the register has both 32-bit and 64-bit instances then we
-             *    can count on the 64-bit instance taking care of the
-             *    non-secure bank.
-             * 2) If ARMv8 is enabled then we can count on a 64-bit version
-             *    taking care of the secure bank.  This requires that separate
-             *    32 and 64-bit definitions are provided.
+             * Register is banked (using both entries in array).
+             * Overwriting fieldoffset as the array is only used to define
+             * banked registers but later only fieldoffset is used.
              */
-            if ((r->state == ARM_CP_STATE_BOTH && ns) ||
-                (arm_feature(&cpu->env, ARM_FEATURE_V8) && !ns)) {
+            r2->fieldoffset = r->bank_fieldoffsets[ns];
+        }
+        if (state == ARM_CP_STATE_AA32) {
+            if (isbanked) {
+                /*
+                 * If the register is banked then we don't need to migrate or
+                 * reset the 32-bit instance in certain cases:
+                 *
+                 * 1) If the register has both 32-bit and 64-bit instances
+                 *    then we can count on the 64-bit instance taking care
+                 *    of the non-secure bank.
+                 * 2) If ARMv8 is enabled then we can count on a 64-bit
+                 *    version taking care of the secure bank.  This requires
+                 *    that separate 32 and 64-bit definitions are provided.
+                 */
+                if ((r->state == ARM_CP_STATE_BOTH && ns) ||
+                    (arm_feature(env, ARM_FEATURE_V8) && !ns)) {
+                    r2->type |= ARM_CP_ALIAS;
+                }
+            } else if ((secstate != r->secure) && !ns) {
+                /*
+                 * The register is not banked so we only want to allow
+                 * migration of the non-secure instance.
+                 */
                 r2->type |= ARM_CP_ALIAS;
             }
-        } else if ((secstate != r->secure) && !ns) {
-            /*
-             * The register is not banked so we only want to allow migration
-             * of the non-secure instance.
-             */
-            r2->type |= ARM_CP_ALIAS;
-        }
 
-        if (HOST_BIG_ENDIAN &&
-            r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
-            r2->fieldoffset += sizeof(uint32_t);
+            if (HOST_BIG_ENDIAN &&
+                r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
+                r2->fieldoffset += sizeof(uint32_t);
+            }
         }
     }
 
@@ -8615,7 +8681,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if (r->type & ARM_CP_SPECIAL_MASK) {
+    if (r2->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
-- 
2.34.1

