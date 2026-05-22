Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBB3CD5BB0
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:08:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXz4-0000rt-NW; Fri, 22 May 2026 18:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxt-0007kw-5s
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:36 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxo-0008Hj-KQ
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-365cae89bf5so3448625a91.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487406; x=1780092206; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQlqDiM3IpQabRMqUoqW7VNQijUxXcEr5l0FSiCvXFk=;
 b=u7lPEDqSQO430BL1Sgm4sHOcmvdy2q1H2V5t5CLVMYO9mSJ2ZmZyoPo8yXYlVtsl1r
 eRac/hhahauLxhF9PyMX3aEjPPNOmHpYa/Fkhey4co2uqeI2tF+hTQyxpRuIiOSdVTz/
 inD7boUmM9kv400glPZp/CL5lOo5olDKAmgJILaVAksP9q44mInef6gv+A7sQaWXNtzt
 otr0ASEyxp1i/BG2pzsXg4XCm7QlEg9FaLkOeEeIB8HRTPNpIAQt+osNlAP6nGCY62N6
 9ejAVAsA1FD3W1Rk5qlt6gx0CK/vBqP5279bLEhLJqN+5d0q/17HwGEQJaWPEu/shOhe
 Ad4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487406; x=1780092206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eQlqDiM3IpQabRMqUoqW7VNQijUxXcEr5l0FSiCvXFk=;
 b=kEwJP0/VrVQ4zZM6JIVwtRx6osWtxd+E+klUY2PUkKdi2Yswcda/OQz/6dTk2rZppU
 NdeYjw6zBpnC7PyjUrUXxLeApf3SY4nL0HIBzNhn11kKPdgcz8eA5VRuIlHgY9WsRP90
 pdpsjy8TH/1PLRLLjEiyECuBMKs1lFqcTkkRFjv8lG6hxixXzHI1xrl/jgWBEPQp0ooE
 gW1atPbv2A5D8uI8VAjB1BUNzZ2l8NfyWkuN7KcJfDF/CxEbrvlA1UjLmSmAPvXSaZWt
 /7/YMr4N3NgIpYsDue1Ih8c1u1bdKt9hw17o1yiBscg5nQMhmsjdO+6rS2maVP7kj2gR
 xvuQ==
X-Gm-Message-State: AOJu0Yw2+VzZMqYpVie7Y4lnwJhgwDPdQ7drLKwQA5f61T8s7E+70hGI
 ReKBW0nWcJHNS2qvYsnwEypvNKLMs24WXBQ6rJTlKkuN257+Kgtap8va57KbZCqmECE=
X-Gm-Gg: Acq92OHih3GatEvfoQCTn7kNRxAqTmDwP4Do15wQODaK2noV8/y9isv8JOyWDxp+UHB
 q4ofOmtoAPa8J1/5vv+5YrU0CMQXbPFfcE7JkuMxLk4lLq4eNCCmA1LeDLSMvzKz4xuf6p2Dz/h
 IVR1eTH5o7gtMmo+4XKzZbFCCiHJdEomUy9ZD6Pu/kVujWlsFJgw21+iZudGdzZBNLmH6mHgMBt
 ePpLXUYh0iDzU3vV/BHmHQy9lM6ZRzW6qPNx9IPcWjrhcxFmcji1L9NpkRsD2s0WYPLm4ykks5L
 X0zd8UQfBK7MOmcS+42ihlBjI0rbNQJe6UVdSZcF7Ga8CPvgBQXfKNbEVAeWBhba6NVcDUlPUT/
 V7WEHMYlgx74wo/FwSdkJcohoJQe0qH8dbNuilO1RQwbLaST+ewfg3q5dbcStbJULiNKNbB3deh
 SP4CJTykxpGuO0x9Fvpl+joawAZAU1
X-Received: by 2002:a17:90b:4d0a:b0:368:f0a:1c48 with SMTP id
 98e67ed59e1d1-36a671e2735mr4989313a91.0.1779487406048; 
 Fri, 22 May 2026 15:03:26 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 18/64] target/arm: Implement ID_AA64FPFR0
Date: Fri, 22 May 2026 15:02:20 -0700
Message-ID: <20260522220306.235200-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
 target/arm/cpu-features.h    |  9 +++++++++
 target/arm/cpu.c             |  1 +
 target/arm/helper.c          | 13 +++++++++++--
 target/arm/cpu-sysregs.h.inc |  1 +
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index e13c1c1331..1bb77d78da 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -410,6 +410,15 @@ FIELD(ID_AA64SMFR0, I16I64, 52, 4)
 FIELD(ID_AA64SMFR0, SMEVER, 56, 4)
 FIELD(ID_AA64SMFR0, FA64, 63, 1)
 
+FIELD(ID_AA64FPFR0, F8E5M2, 0, 1)
+FIELD(ID_AA64FPFR0, F8E4M3, 1, 1)
+FIELD(ID_AA64FPFR0, F8MM4, 26, 1)
+FIELD(ID_AA64FPFR0, F8MM8, 27, 1)
+FIELD(ID_AA64FPFR0, F8DP2, 28, 1)
+FIELD(ID_AA64FPFR0, F8DP4, 29, 1)
+FIELD(ID_AA64FPFR0, F8FMA, 30, 1)
+FIELD(ID_AA64FPFR0, F8CVT, 31, 1)
+
 FIELD(ID_DFR0, COPDBG, 0, 4)
 FIELD(ID_DFR0, COPSDBG, 4, 4)
 FIELD(ID_DFR0, MMAPDBG, 8, 4)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index facd4def38..a13e6dae2a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1768,6 +1768,7 @@ static void arm_clear_aarch64_idregs(ARMCPU *cpu)
     SET_IDREG(&cpu->isar, ID_AA64AFR1, 0);
     SET_IDREG(&cpu->isar, ID_AA64ZFR0, 0);
     SET_IDREG(&cpu->isar, ID_AA64SMFR0, 0);
+    SET_IDREG(&cpu->isar, ID_AA64FPFR0, 0);
 }
 
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3d6e7f1ccc..34487eeaa3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6477,11 +6477,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
               .resetvalue = 0 },
-            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64FPFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64FPFR0) },
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6712,6 +6712,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64SMFR0_I16I64_MASK |
                                R_ID_AA64SMFR0_SMEVER_MASK |
                                R_ID_AA64SMFR0_FA64_MASK },
+            { .name = "ID_AA64FPFR0_EL1",
+              .exported_bits = R_ID_AA64FPFR0_F8E5M2_MASK |
+                               R_ID_AA64FPFR0_F8E4M3_MASK |
+                               R_ID_AA64FPFR0_F8MM4_MASK |
+                               R_ID_AA64FPFR0_F8MM8_MASK |
+                               R_ID_AA64FPFR0_F8DP2_MASK |
+                               R_ID_AA64FPFR0_F8DP4_MASK |
+                               R_ID_AA64FPFR0_F8FMA_MASK |
+                               R_ID_AA64FPFR0_F8CVT_MASK },
             { .name = "ID_AA64MMFR0_EL1",
               .exported_bits = R_ID_AA64MMFR0_ECV_MASK,
               .fixed_bits = (0xfu << R_ID_AA64MMFR0_TGRAN64_SHIFT) |
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index b99579f773..6e8b335b8f 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -3,6 +3,7 @@ DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
 DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
 DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
+DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
 DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
-- 
2.43.0


