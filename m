Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C76C56205
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 17:28:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws1sM-0001Yd-24; Thu, 06 Aug 2026 13:27:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sJ-0001We-OV
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:24 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws1sF-0000dw-AO
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 13:27:22 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c966b9ee9cbso1693307a12.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 10:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786037236; x=1786642036; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yTbT9t6sSIWGH/+VDyfLnWOBo7BbphlpX1el6XSlxGU=;
 b=ktURoK9e8GRqHSMbwUdnhVgIZ4e+R81vIey/r+XVw6R4sZtoZjMtoLG7dKMnHJMdC0
 2Jj3+ecQ9Gm8I68sghnJr6wTFfT7Aydq3s3PqarnHQAgfsznU6sWr2/RURyT4g9lRcS5
 H1DLXIl/8jbOAL+U9e/1y4m0MEgsXpugEHSbpuWnfg81zhLhFr+BigeshA4Ej0TkhlP4
 5gy6l1yNg4n2kxguy45+qe0gRs7TNFVdr7faJ/RcaoEOHEuDaKdWv/7X8/jEg15bsu2n
 rguBicVW9Qfo+Z4Iy7olB9bwmB+Ji0HsS81jsCSlX/RIONVRhgNDEqAZj8G934uKTPbk
 gWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786037236; x=1786642036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yTbT9t6sSIWGH/+VDyfLnWOBo7BbphlpX1el6XSlxGU=;
 b=E5py5jD5uQZH3arG/ocgz3QZTxgjuzPGxQZXzQNworBWKE7YIVyMmTqR+1/bYXDI7B
 +dQpwARI/tlxePgony+8Zk2txYcGas7qzM1mOkku0reTg3H2EEFHBdVE+9MCf7aufgJ2
 yxiTiliNIpUTjbyuLHk3QjN45c/ey0inQ+4DL+eTC0lGgIYCBpouGY4JA3HsGEoLryhq
 MGdY4Hp5iyoXjwie2uOqOzF/uU5T+CLIHscKxMleZqOb3XNyGP54gp73a7BOIok7KEV8
 idgQv9nlKeIH3fuE/aH7027RITZGh0tuTHg1mUihZKpZ4DFIJRLPHIB325KPRpYmgRrG
 u+ig==
X-Gm-Message-State: AOJu0YzNpD40wCmpzN0kQHGR/V/lrE79kVKlnhgAKCuWW1fmJINrgzqW
 iLue73GeCLLFcuR1JDkQmSpGKV6gk9mJccwlYhJarvi83FG7qp691B0GSL5ToTDgE/4=
X-Gm-Gg: AR+sD13qoe+eSKz/ftyWDwq+eoxq7VOv5s+hyobtvYk4M4/Y2OcVlXdj5qNfKL8b4jj
 Mg0oXZg3xTPJdUJc03LLjgpLdi+L56zoAIlBAvoJ3vK7QpAXr7GUpJlZx716xprxovaO28FoXKR
 v9cxnIn6GhfFw5S2nY5VVvlKvc0UQGKjftIe2VlTtuWKZAEtoRpjseuMNp6txvhE/Y2tqqSWX9i
 MumU3W4vxKdMATRlHUJ3S2bS20dsqqJ1BYk8XvkBZ5HL+/uuqx7fNssN+jQ+0E+w1IhccTB4gPS
 9RHE4Of2ncz9ElOpW9YBoNqcfgM44pSfdD010bAtpxDR1BR0Aw+xt1wI7ScQYqaCBjXShW6+/iT
 Ry0/a5jpUEREOwjhjBSuauKQEFo+S+2hkaYvVNbFNzepsxry7aBeOVGwV5AVTxjoev7dcMjFxku
 y4H5ikliHjEpOB51zIpFe27vasswNOX0tt9IKk3PJEshLww5eMlGxXTQcj0MtXtLXtM6EdRp7f7
 mGWrVMqtwW03dVFx4rE
X-Received: by 2002:a05:6a00:1310:b0:848:8027:cac with SMTP id
 d2e1a72fcca58-84f2e04d03fmr18396096b3a.23.1786037236337; 
 Thu, 06 Aug 2026 10:27:16 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84f45389e68sm1803272b3a.4.2026.08.06.10.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 10:27:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 5/6] target/arm: Set fgt in cpregs for FGWTE3
Date: Thu,  6 Aug 2026 10:27:08 -0700
Message-ID: <20260806172709.333300-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806172709.333300-1-richard.henderson@linaro.org>
References: <20260806172709.333300-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs-gcs.c |  5 +++--
 target/arm/helper.c     | 49 ++++++++++++++++++++++-------------------
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index e31827342d..9c9ae9cd71 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -97,7 +97,7 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[2]) },
     { .name = "GCSCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 5, .opc2 = 0,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_GCSCR_EL3,
       .fieldoffset = offsetof(CPUARMState, cp15.gcscr_el[3]) },
 
     { .name = "GCSPR_EL0", .state = ARM_CP_STATE_AA64,
@@ -119,7 +119,8 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[2]) },
     { .name = "GCSPR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 5, .opc2 = 1,
-      .access = PL3_RW, .writefn = gcspr_write,
+      .access = PL3_RW, .fgt = FGT_GCSPR_EL3,
+      .writefn = gcspr_write,
       .fieldoffset = offsetof(CPUARMState, cp15.gcspr_el[2]) },
 
     { .name = "GCSPUSHM", .state = ARM_CP_STATE_AA64,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 853daf2e39..c88af981e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1013,7 +1013,8 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .resetvalue = 0 },
     { .name = "MAIR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 2, .opc2 = 0,
-      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mair_el[3]),
+      .access = PL3_RW, .fgt = FGT_MAIR_EL3,
+      .fieldoffset = offsetof(CPUARMState, cp15.mair_el[3]),
       .resetvalue = 0 },
     /*
      * For non-long-descriptor page tables these are PRRR and NMRR;
@@ -3685,7 +3686,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .type = ARM_CP_IO,
       .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
       .resetvalue = 0,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_MDCR_EL3,
       .writefn = mdcr_el3_write,
       .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
     { .name = "SDCR", .type = ARM_CP_ALIAS | ARM_CP_IO,
@@ -4435,11 +4436,11 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
     { .name = "TTBR0_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 0,
-      .access = PL3_RW, .resetvalue = 0,
+      .access = PL3_RW, .fgt = FGT_TTBR0_EL3,
       .fieldoffset = offsetof(CPUARMState, cp15.ttbr0_el[3]) },
     { .name = "TCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 0, .opc2 = 2,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_TCR_EL3,
       /* no .writefn needed as this can't cause an ASID change */
       .resetvalue = 0,
       .fieldoffset = offsetof(CPUARMState, cp15.tcr_el[3]) },
@@ -4461,7 +4462,7 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_MON]) },
     { .name = "VBAR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 0,
-      .access = PL3_RW, .writefn = vbar_write,
+      .access = PL3_RW, .fgt = FGT_VBAR_EL3, .writefn = vbar_write,
       .fieldoffset = offsetof(CPUARMState, cp15.vbar_el[3]),
       .resetvalue = 0 },
     { .name = "CPTR_EL3", .state = ARM_CP_STATE_AA64,
@@ -4470,20 +4471,20 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.cptr_el[3]) },
     { .name = "TPIDR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 13, .crm = 0, .opc2 = 2,
-      .access = PL3_RW, .resetvalue = 0,
+      .access = PL3_RW, .fgt = FGT_TPIDR_EL3,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidr_el[3]) },
     { .name = "AMAIR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 3, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL3_RW, .fgt = FGT_AMAIR_EL3,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AFSR0_EL3", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 1, .opc2 = 0,
-      .access = PL3_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL3_RW, .fgt = FGT_AFSR0_EL3,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AFSR1_EL3", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 6, .crn = 5, .crm = 1, .opc2 = 1,
-      .access = PL3_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL3_RW, .fgt = FGT_AFSR1_EL3,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -5051,15 +5052,17 @@ static void gpcbw_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo rme_reginfo[] = {
     { .name = "GPCCR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 6,
-      .access = PL3_RW, .writefn = gpccr_write, .resetfn = gpccr_reset,
+      .access = PL3_RW, .fgt = FGT_GPCCR_EL3,
+      .writefn = gpccr_write, .resetfn = gpccr_reset,
       .fieldoffset = offsetof(CPUARMState, cp15.gpccr_el3) },
     { .name = "GPCBW_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 5,
-      .access = PL3_RW, .writefn = gpcbw_write,
+      .access = PL3_RW, .fgt = FGT_GPCBW_EL3, .writefn = gpcbw_write,
       .fieldoffset = offsetof(CPUARMState, cp15.gpcbw_el3) },
     { .name = "GPTBR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 2, .crm = 1, .opc2 = 4,
-      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.gptbr_el3) },
+      .access = PL3_RW, .fgt = FGT_GPTBR_EL3,
+      .fieldoffset = offsetof(CPUARMState, cp15.gptbr_el3) },
     { .name = "MFAR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 6, .crm = 0, .opc2 = 5,
       .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mfar_el3) },
@@ -5169,7 +5172,7 @@ static const ARMCPRegInfo mec_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.mecid_a1_el2) },
     { .name = "MECID_RL_A_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .opc2 = 1, .crn = 10, .crm = 10,
-      .access = PL3_RW, .accessfn = mecid_access,
+      .access = PL3_RW, .accessfn = mecid_access, .fgt = FGT_MECID_RL_A_EL3,
       .writefn = mecid_write,
       .fieldoffset = offsetof(CPUARMState, cp15.mecid_rl_a_el3) },
     { .name = "VMECID_P_EL2", .state = ARM_CP_STATE_AA64,
@@ -6119,7 +6122,7 @@ static const ARMCPRegInfo sctlr2_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[2]) },
     { .name = "SCTLR2_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .opc2 = 3, .crn = 1, .crm = 0,
-      .access = PL3_RW, .writefn = sctlr2_el3_write,
+      .access = PL3_RW, .fgt = FGT_SCTLR2_EL3, .writefn = sctlr2_el3_write,
       .fieldoffset = offsetof(CPUARMState, cp15.sctlr2_el[3]) },
 };
 
@@ -6245,7 +6248,7 @@ static const ARMCPRegInfo s1pie_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pir_el[2]) },
     { .name = "PIR_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .opc2 = 3, .crn = 10, .crm = 2,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_PIR_EL3,
       .fieldoffset = offsetof(CPUARMState, cp15.pir_el[3]) },
     { .name = "PIRE0_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .opc2 = 2, .crn = 10, .crm = 2,
@@ -6303,7 +6306,7 @@ static const ARMCPRegInfo aie_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.mair2_el[2]) },
     { .name = "MAIR2_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 1, .opc2 = 1,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_MAIR2_EL3,
       .fieldoffset = offsetof(CPUARMState, cp15.mair2_el[3]) },
 
     { .name = "AMAIR2_EL1", .state = ARM_CP_STATE_AA64,
@@ -6319,7 +6322,7 @@ static const ARMCPRegInfo aie_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "AMAIR2_EL3", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 6, .crn = 10, .crm = 3, .opc2 = 1,
-      .access = PL3_RW,
+      .access = PL3_RW, .fgt = FGT_AMAIR2_EL3,
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
@@ -7047,7 +7050,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = arm_feature(env, ARM_FEATURE_AARCH64) },
             { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 0,
-              .access = PL3_RW,
+              .access = PL3_RW, .fgt = FGT_SCTLR_EL3,
               .raw_writefn = raw_write, .writefn = sctlr_write,
               .fieldoffset = offsetof(CPUARMState, cp15.sctlr_el[3]),
               .resetvalue = cpu->reset_sctlr },
@@ -7422,8 +7425,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .resetvalue = 0 },
             { .name = "ACTLR_EL3", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 0, .opc2 = 1,
-              .access = PL3_RW, .type = ARM_CP_CONST,
-              .resetvalue = 0 },
+              .access = PL3_RW, .fgt = FGT_ACTLR_EL3,
+              .type = ARM_CP_CONST, .resetvalue = 0 },
         };
         define_arm_cp_regs(cpu, auxcr_reginfo);
         if (cpu_isar_feature(aa32_ac2, cpu)) {
-- 
2.43.0


