Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A0BC83F1B
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 14:12:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaERf-0007Xb-EF; Fri, 11 Jul 2025 10:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaER0-00068E-Jf
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:09:10 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uaEQy-0005vi-29
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 10:09:06 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so2073326b3a.3
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752242942; x=1752847742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwRQLnEoG97izyLOTDiqhhYLVzx/WTnQ2WqIw3IjXFE=;
 b=po0z+yqae/aDp/0ZFVCk3QT03RU11fViztFvFiuCKhFPrRTKyJUAYziW+cLOP4iMhV
 YWqWIw6ettYBTvlxKzkRt5oWgrs5Le71/f34pdN7AIKP2ku4XRNSRzYbuWJbEdGhbX8p
 0O82FX6cGRwoYOYytQ8Q+AFGyQQj1gafERUJ4wruE4bcgst11wkNGEniLOt9RTkDjXL4
 ANYw3HFA23v8ERYVyBIB88gNuNDYe5F/Arg9b3/MvBnFDJqLfBrjCKPYEnqXbp/A3G+m
 Ty2ORe1E6pwByvBQMjywcWpQ/a0oq1IqCL0PM9MuGX8k7zFH8yGRUCYSLhQ1axsxTqQ4
 cg2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752242942; x=1752847742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwRQLnEoG97izyLOTDiqhhYLVzx/WTnQ2WqIw3IjXFE=;
 b=ipNwYDpu0Fj+kQcjb2PBj8uaNRx14L9AN8Ei1OiUHNC9/Ie/9udGzW7ju7YMFe4RgL
 KiHwZk1YiSjQheoAyiDska5hUYB9rKbEAiCZQQT88joxb6s1nQVOgkGCF95DbjmHAf+b
 xhuTbo56QJuWduXzu5hhJ/LBDG62u4ZdCLZqj9h62oZJ3D0dYwuJ19IUAZbY2BhYVU2q
 muqio3MpMFtGNxuILbpRIMvyWzKvEmvpQ8eOfMflZJC1OJugXv4XKxA2kA3BftmB24gs
 /qS0kA3Nqr0aOTxtrIt2emuu9gcICZzhB+tfafe2nYVM7EN3LZkgdqvD7ohhZw13MLhj
 tsmA==
X-Gm-Message-State: AOJu0Yx15SytZVKOHbum/V4ESTXU1cDEF+wzawKz3Pam84SiBVPAkgib
 I63G4dU+3PvhH3UbrUMpZFltRqUpptCBAxbDrX6ELENFPWcUtxeHIM3I2lyUCmqp88qgnM3dZIT
 LNDoS1Mc=
X-Gm-Gg: ASbGncs5g1vixjHEop+LDArrCqIQV11hrqNs1JfAyt16ZuY5ryPAh5PdZmlbrNYsjyA
 PRlxEGYBK2J62f6CUrTswG5PVvfIBfa5Ms7/UaIXmDREaGzDnAXTI2dl1gmCki9Il2UZ7ZgAimn
 9z690kdDJ3Vkya05pr6KUwQBxriKcp73GPCjOxEcFZkODWNxzIsXOpqeCeWpRtASkZhFyMPkAnv
 xp4U1tbQSHiyTZwPfTsxBn2cKc82KQWlNALdUKGPKYqMOM0SbyWlZIghebJ74GqYPgfk2oKjiIC
 nSw627I7QXiPVIbmnzZbqPn9wzQpOpa3+q47Jz+D+g1GncR2LKDz8WItaljTQhl0sSrt5D05bse
 cSSOXUQsuMIlejS0mzh29oDqJkx+QCJ+zu10qER2k3HpdZeFEOduAXW8Nag==
X-Google-Smtp-Source: AGHT+IHqbgBjKc+f/G+eJLlHmA5r/UFnrjbpcz6chvrLyzP4ABr0C/YL2E59EW3By+N1KYzBOLYCkQ==
X-Received: by 2002:a05:6a00:883:b0:748:e38d:fecc with SMTP id
 d2e1a72fcca58-74f1eeca967mr3060443b3a.22.1752242941872; 
 Fri, 11 Jul 2025 07:09:01 -0700 (PDT)
Received: from gromero0.. (189-47-46-41.dsl.telesp.net.br. [189.47.46.41])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9dd5d3esm5702280b3a.4.2025.07.11.07.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 07:09:01 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v7 5/6] target/arm: Implement FEAT_MEC cache instructions
Date: Fri, 11 Jul 2025 14:08:27 +0000
Message-Id: <20250711140828.1714666-6-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711140828.1714666-1-gustavo.romero@linaro.org>
References: <20250711140828.1714666-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x436.google.com
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

This commit implements the two cache maintenance instructions introduced
by FEAT_MEC, DC CIPAE and DC CIGDPAE.

Because QEMU does not model the cache topology, all cache maintenance
instructions are implemented as NOPs, hence these new instructions are
implemented as NOPs too.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 973b276d90..ce981191b3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5225,6 +5225,18 @@ static void mecid_write(CPUARMState *env, const ARMCPRegInfo *ri,
     raw_write(env, ri, value);
 }
 
+static CPAccessResult cipae_access(CPUARMState *env, const ARMCPRegInfo *ri,
+                                   bool isread)
+{
+    switch (arm_security_space(env)) {
+    case ARMSS_Root:  /* EL3 */
+    case ARMSS_Realm: /* Realm EL2 */
+        return CP_ACCESS_OK;
+    default:
+        return CP_ACCESS_UNDEFINED;
+    }
+}
+
 static const ARMCPRegInfo mec_reginfo[] = {
     { .name = "MECIDR_EL2", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 4, .opc2 = 7, .crn = 10, .crm = 8,
@@ -5264,6 +5276,15 @@ static const ARMCPRegInfo mec_reginfo[] = {
       .access = PL2_RW, .accessfn = mecid_access,
       .writefn = mecid_write,
       .fieldoffset = offsetof(CPUARMState, cp15.vmecid_a_el2) },
+    { .name = "DC_CIPAE", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 14, .opc2 = 0,
+      .access = PL2_W, .accessfn = cipae_access, .type = ARM_CP_NOP },
+};
+
+static const ARMCPRegInfo mec_mte_reginfo[] = {
+    { .name = "DC_CIGDPAE", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 4, .crn = 7, .crm = 14, .opc2 = 7,
+      .access = PL2_W, .accessfn = cipae_access, .type = ARM_CP_NOP },
 };
 
 #ifndef CONFIG_USER_ONLY
@@ -7425,6 +7446,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
 
     if (cpu_isar_feature(aa64_mec, cpu)) {
         define_arm_cp_regs(cpu, mec_reginfo);
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            define_arm_cp_regs(cpu, mec_mte_reginfo);
+        }
     }
 
     if (cpu_isar_feature(aa64_sctlr2, cpu)) {
-- 
2.34.1


