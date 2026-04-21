Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A51DEA71A4
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:19:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3S1-0008LE-LF; Tue, 21 Apr 2026 01:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RS-00081G-OM
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3RO-0006TB-5q
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:14:32 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-35fc2b18363so4279854a91.0
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748468; x=1777353268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMD0VgSvOctoffSNQ7zz1Fm9S+qkzJ2gc0NItSVQ7FU=;
 b=tiv6PUTgpIdId0Sas1N18w8OCiOsJJ5Y1D9NRZGNpaBciBpnRjxJsNkMPoFiPi0dR+
 Ib4ANY07pxSPEM6FQlEQgiHkN5Af6EAdV/Mqt0noGaqmb8BdrTBN4UYIq2NvkIc+mCxO
 /ouoxLwtJuynxjtzN9GXQM2H5ik24fQ8iFXnLPaHUdEx0EDt34QXTFF0ijyWYDnSRE0W
 RYt0LA4c4HcEdHCGGjSpLSK9FiW0LiJl0ZjR4ECSnjVUONCYwRd/6ximKFhRj02WzikQ
 At9YzIKXjLT1J/vAyJjFOlotZAP+1T7Ov/uESUBbMy2MWTqnEo90xVSbrsSK492EukeN
 SYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748468; x=1777353268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZMD0VgSvOctoffSNQ7zz1Fm9S+qkzJ2gc0NItSVQ7FU=;
 b=aRhPlhZpW4092dOXoxmb4/XdWRURFLl/nJJcgXIlniBrpya17uxnIhBDxhKS1njkCK
 y94AnzO0CNaxXIlYStUlFHWP/KUiihwskZipHNKeoL9HI+iYclROo2QMNx9YGdUQwXrq
 K3j5rNR/bPeKxmTCxy+OwelBCcAUQrubUhZHmOuW/I2S197i2nFysFF6ySZ0nMN5f4Tn
 3BMtnfrbGCZn+bmlVpqAEZs6fKnQIHvedWt+7BREQqr+vPotDsZ1ENRClyo2WUqHrGLT
 ZG2YUX4X6jO3gOWVr1jeIvFa+0aWY7V+ZYKPIdDHrWJ7StesMZX+ZnYm8pJSPvB2k718
 nBUQ==
X-Gm-Message-State: AOJu0YwGayZQVTq9xdtMb6PDBTbA7Jw/z7b0hPnU1doFWXrMa17MUlhQ
 NQ32tFuQkxhBlyY0XOqqEaNe/SMbmw/EkfmeQIC7xa/08Co53AsjCnrDp7CX8QTRTjSib/kaaYP
 T+tnsGOc=
X-Gm-Gg: AeBDieun2Woaf1aCGCt35nLE8AvMPEmltZv0G5vMwtbI+5x3RXpb9RlrRqFdGwp/E+u
 PLQHlJadkkomj78FharvBI+ZfiGz9CGACWSOTAazHANa63Qq7cRk2mbzFdR6kVNnI2AbytaTK8g
 h29RZ04YAUwlYHNTbyxGTDPi4VKOi5iSaDlWVOtxu2WIoOF9sJD5mKXahW9D229OfNYR5z28uYi
 tYFZo+tR5QgNPrFZN+3tLkWCdvVEfro8Px3jDJtCUWDGvr7JfNbXR+jkrVyZAJoroDLtRJynhTf
 1Q/f2H089r7rHNn5slHSIHe9WY/rvxZskfNq/Edda832/eXHflzA4D1pf9TkHe4p8TLiS3hmY2Z
 p952wtnrW2YsxxaKfxUPtcibh01Y1741EQYuceWeMnUVvKQS9WuafLOoHWusGRKlobK8aPHfyfK
 ckmQm7JYCaV3KX4P1gHXWhjqoj0OImTmD9wO107El8
X-Received: by 2002:a17:902:9a4a:b0:2b2:4eec:9806 with SMTP id
 d9443c01a7336-2b5f9e78234mr121062975ad.8.1776748467533; 
 Mon, 20 Apr 2026 22:14:27 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:14:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 15/37] target/arm: Implement ID_AA64FPFR0
Date: Tue, 21 Apr 2026 15:13:24 +1000
Message-ID: <20260421051346.41106-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h    |  9 +++++++++
 target/arm/helper.c          | 13 +++++++++++--
 target/arm/cpu-sysregs.h.inc |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index ddef6fbeb0..df070afdbf 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -401,6 +401,15 @@ FIELD(ID_AA64SMFR0, I16I64, 52, 4)
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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6ebd121050..f0f00c6eff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6510,11 +6510,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -6745,6 +6745,15 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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


