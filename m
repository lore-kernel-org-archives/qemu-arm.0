Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736FBEEB565
	for <qemu-arm@archiver.kernel.org>; Wed, 31 Dec 2025 17:10:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vazhJ-0002dD-2Z; Wed, 31 Dec 2025 12:09:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazhB-0002Xd-Cq
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:14 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vazh7-0000Zw-8d
 for qemu-arm@nongnu.org; Wed, 31 Dec 2025 12:09:12 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-430f5ecaa08so4467053f8f.3
 for <qemu-arm@nongnu.org>; Wed, 31 Dec 2025 09:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767200946; x=1767805746; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=faxhufLw/EIG5Ph8lvEbPCvkCLmmsEhf639jzh+lM9I=;
 b=FhgrI6xhSQAsKXHYTGTOuh4I5xHlFXNNmdj8jFpf0aeri3UFS08rXrvyZy28SL7O8g
 nkG8TFeSz2hSG6G928lIwe9YZhbCW8FI/PoS7MmQEICUlZdK0m67z53qXQECcMef7Wju
 nY5dhdT7b84DPSN26vdvoTrE+QsWogalVl+bAOV8oqp8VSykVokXdhaZqOB2j1WjhovV
 0T8bA4k5st+yQcxIP3haW1hPPHuSMijQkY8qbi58bXMYOAuQBCM6El38O5elQ7qnWjLY
 FusYDPINZe/00d80kIsF/EKKkLcF6Mq3xkyJ2rQqFZviux0ZgHiXmKUxD0gCNj1MT3Qt
 82+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767200946; x=1767805746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=faxhufLw/EIG5Ph8lvEbPCvkCLmmsEhf639jzh+lM9I=;
 b=FgSee677EKYEer9sHHOV83uUyQ8Um4ks/EH1aqOfFPIHrlDjhMOurQ9M0/XT21ZkAj
 Eivf1D/xonz5sL9wJVCh4io9aBApad6BZxExiBg//Dri2RMJDieNuP6YsdnMn4dF9QqR
 3vfFV7hcb/RtV8x7qhWQ5FBoHZQraIE5oYcdMoKeOkn96M36t86nErsgoqI7yJ/ABu+6
 oO6WF24buCgELD1dyBkBkemnUbNpzyrvoLKf456m+cDbTXezrH+MYQoaMx/cofuKjYQD
 0Ba6Y5B6aK5bk+V/jKHM4ggZYdCeZwSm2FNJe4yt/3dKli6lpWIeEhStWcA6zw+DArG8
 kGvA==
X-Gm-Message-State: AOJu0YykL+58vpHDiPZVBw03EUDI9zSDQy5uO8wmaUMC6Lx5hyYiOEfh
 HozLumKDdXD41TR0dor+OCX3zpEi0vD+J95fl06DX4Yb6oNpA1oQ1ozN8dVYAcpMeNyyhpK8M4A
 B1W1s
X-Gm-Gg: AY/fxX5dPCIXm7ReO0jBrBq+Lv0Gy0He2VJtYqcsbjsdZcEWKd4hysyJWvqUNqkM6wI
 hkqItJKoI6NKUef+SwRqP3fWnpPzrCQ8yK1/jtN5Y2lVAJgTMmsbAcVfMsX8xoTKBXnRB3k8zMo
 L3tdCv24jk01AnPaGBqTJ97tIJwSY1f6yNdmdfWJIgSIDaJ5Ok70/SHvOk1isEfTCH708291aPt
 XFUyuuQJSjFCw3MRXSSBdcwf9zoKvHMyWcPhJB03lotMyrY8qHUYDwjb9JpdtthnuMhjQqRRMKa
 1JIIlhgyg17xgiQJPAN42jev0W3IwFayoq3xM3Pg2MaY3hyH+6A6zjZX2+ytCmJ57EILWQ52iJ7
 bazuGnnGhcGtQDXHCeAR2YBr+Xq28yGTFqSJUxcIjzdvMIRd4va3x7ZtOU1u9xzaj/YMBIDoYzv
 pGqBQbXb9WwtdQE42gn3mtlI0uxMSQJ8EvUklwH9Ov0wlXj4wbk3T1TbPmGzM+KQlDx8QGZ/zPW
 j01WNrgHDKKZNYaZHCey0KhiTvIhU4pZUyldIyjAtCekw==
X-Google-Smtp-Source: AGHT+IGVSVrvMOLQ+ITS353Z2MIs7pQPiWP+RahxI1tDpsL409+UZGMkoGrghgVPbRnsvsRqZGcAsA==
X-Received: by 2002:a5d:5392:0:b0:42f:edb6:3642 with SMTP id
 ffacd0b85a97d-4324e704c03mr37383761f8f.60.1767200942921; 
 Wed, 31 Dec 2025 09:09:02 -0800 (PST)
Received: from mnementh.archaic.org.uk
 (f.7.f.1.7.5.e.f.f.f.c.5.d.8.2.4.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:1d0:0:428d:5cff:fe57:1f7f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eaa64cesm75208990f8f.35.2025.12.31.09.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Dec 2025 09:09:02 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 3/4] target/arm: Correctly trap HCR.TID1 registers in v7A
Date: Wed, 31 Dec 2025 17:08:57 +0000
Message-ID: <20251231170858.254594-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251231170858.254594-1-peter.maydell@linaro.org>
References: <20251231170858.254594-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

In v7A HCR.TID1 is defined to trap for TCMTR, TLBTR, REVIDR and AIDR.
We incorrectly use an accessfn for REVIDR and AIDR that only traps on
v8A cores.  Fix this by collapsing access_aa64_tid1() and
access_aa32_tid1() together and never doing a check for v8 vs v7.

The accessfn is also used for SMIDR_EL1, which is fine as this
register is AArch64 only.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index c4f73eb3f3..0896e90965 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -924,8 +924,8 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return ret;
 }
 
-static CPAccessResult access_aa64_tid1(CPUARMState *env, const ARMCPRegInfo *ri,
-                                       bool isread)
+static CPAccessResult access_tid1(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
 {
     if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TID1)) {
         return CP_ACCESS_TRAP_EL2;
@@ -934,16 +934,6 @@ static CPAccessResult access_aa64_tid1(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult access_aa32_tid1(CPUARMState *env, const ARMCPRegInfo *ri,
-                                       bool isread)
-{
-    if (arm_feature(env, ARM_FEATURE_V8)) {
-        return access_aa64_tid1(env, ri, isread);
-    }
-
-    return CP_ACCESS_OK;
-}
-
 static const ARMCPRegInfo v7_cp_reginfo[] = {
     /* the old v6 WFI, UNPREDICTABLE in v7 but we choose to NOP */
     { .name = "NOP", .cp = 15, .crn = 7, .crm = 0, .opc1 = 0, .opc2 = 4,
@@ -969,7 +959,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
     { .name = "AIDR", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 7,
       .access = PL1_R, .type = ARM_CP_CONST,
-      .accessfn = access_aa64_tid1,
+      .accessfn = access_tid1,
       .fgt = FGT_AIDR_EL1,
       .resetvalue = 0 },
     /*
@@ -4997,7 +4987,7 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .writefn = smcr_write, .raw_writefn = raw_write },
     { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
-      .access = PL1_R, .accessfn = access_aa64_tid1,
+      .access = PL1_R, .accessfn = access_tid1,
       /*
        * IMPLEMENTOR = 0 (software)
        * REVISION    = 0 (implementation defined)
@@ -7094,7 +7084,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "REVIDR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 0, .opc2 = 6,
               .access = PL1_R,
-              .accessfn = access_aa64_tid1,
+              .accessfn = access_tid1,
               .fgt = FGT_REVIDR_EL1,
               .type = ARM_CP_CONST, .resetvalue = cpu->revidr },
         };
@@ -7118,7 +7108,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "TCMTR",
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 2,
               .access = PL1_R,
-              .accessfn = access_aa32_tid1,
+              .accessfn = access_tid1,
               .type = ARM_CP_CONST, .resetvalue = 0 },
         };
         /* TLBTR is specific to VMSA */
@@ -7126,7 +7116,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .name = "TLBTR",
               .cp = 15, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 3,
               .access = PL1_R,
-              .accessfn = access_aa32_tid1,
+              .accessfn = access_tid1,
               .type = ARM_CP_CONST, .resetvalue = 0,
         };
         /* MPUIR is specific to PMSA V6+ */
-- 
2.47.3


