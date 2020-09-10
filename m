Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1514466lfq;
        Thu, 10 Sep 2020 10:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDGjLr4TEVAI5LiUYL/Qgoz4VXCVRSw/VBCLPx24FFoZRqTDdf0Fy1SkiNsfaSBM4M3+7E
X-Received: by 2002:a25:1589:: with SMTP id 131mr14466223ybv.205.1599759559030;
        Thu, 10 Sep 2020 10:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599759559; cv=none;
        d=google.com; s=arc-20160816;
        b=moZaJgpD2ug+je/S8Gh1hKcAzTwDUSU5V9TGJnipZqHKoE+KQ9A7gTNqE+CO86jtj6
         VLix/R0f31fBTHJe2cElRpKHNPl7Zml0+ghYihdcLJb+etd3hdFMt+e9ox41JgOD2wid
         vV0ZLy/Uh74NhOQNw5z6qn5uCA+ob7ZsgzS6veJUKA2yKW2lFrkrOsA15OPbrenaQJwV
         LhsWuSvd9qDuXGz9c7UKsJApJPj4H3EjcSGLVPWUIsaTYMNZFoFWyrdYZtQOzf9og8VY
         SzyrNScOpZ0SM2wPfhY3EsG29JKFuSTQMGeE2tpaBem3EkDM3TwB+JI3aXsPEhD44pRF
         1MWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=i49sizGEle/CNz6YFf1v31poCZrNDqt3TFM4SRbr1hY=;
        b=TpDKRrdShiwKDT2vVMkyIcoio9Be1hr4Hktl2z8CjsUSh4fR3WGOK1n0QzDsYdl2wD
         rpCDZi1+gHheP/4LDHHXewUiTgFw8NWVAkuWBjYtudJX/1XVgFTskxYSkTp03CSUlEaT
         n57EVUBXvM1Hi0RItJox7aVCBDdEnMcptyRfD3W17gMZPuBnapStogQ6nwohuk2ZwZUN
         FodRZhY1AYI9acHZwW8qEy2gBjpm7McNajcYwfCJj7ebtuMmu5eJtKtFVasVZkoYSckZ
         +YGe1/AYE/q49nbVLHRqb0B67Slppt8axkC07d7tyS9NuScbCfz5Rr+Fke5YAPSPkWVW
         f0aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5XCi3xk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d141si6099669ybc.75.2020.09.10.10.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Sep 2020 10:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m5XCi3xk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGQXW-0003vQ-Ae
	for alex.bennee@linaro.org; Thu, 10 Sep 2020 13:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXL-0003so-5C
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:07 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kGQXF-0002n8-Iv
 for qemu-arm@nongnu.org; Thu, 10 Sep 2020 13:39:05 -0400
Received: by mail-wr1-x444.google.com with SMTP id o5so7664178wrn.13
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2020 10:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i49sizGEle/CNz6YFf1v31poCZrNDqt3TFM4SRbr1hY=;
 b=m5XCi3xktI1lbciVwwIMQ3C5EuSLHL0BdPRREVkJ26S/Dzyyue43y0Fc2ejWDl8sL2
 j+k+vdGoX3L7JIKskPNMe3BO0XWjSQHZ747LDhxcbiHgW749pDyvbq4UKmZ/tM3FXTwm
 /ArzOSJkR6HsDdqNxiCFxI9WpjYRumz26E/PfAvgdO6z58Tbr8r6derrFl8HbV2+I6tW
 70UsMlOdhzdUADR+p0f3nvsW2xZF0Ut8xDh1F6kgFusXGpoRz24j2XUn3rx6sEg9zWh0
 iyuyuG0awXQOQxJCasYr5VWefdPGrMB3frnaEukCAKkvTLGqojK/JZRvayjd3SRNGZWg
 t7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i49sizGEle/CNz6YFf1v31poCZrNDqt3TFM4SRbr1hY=;
 b=ERx82gYTESJyCDl0Al/tHDd28YZdaf4+rCBLo6XqyW/aqTuyzJRX2X7hwzQv/8Q/WQ
 DwQQBX5XZUjnop7xYKEkGS1tQwFqNCNcBnLU1VwfrRBFo2y/pL0ItCEujlRMCiovjQxw
 isosgzk4zgVd5GjtcghC4/prCOi315eVAypi3EHa9EsM/AoQEqzeCPw+O6jevN/ypBHO
 jyLXUDZ7fdeL0+zn31OPQeXBDtbnYomstOzTLObK60pnCOzBp1VfC5rIQirJIln1B9bc
 ke2azXe+reLnSbF25NclAItgLhHWfVeAG+lT6KlSqdUz+R8BZNoAIrU0IpeEYbYm68bE
 Zo/A==
X-Gm-Message-State: AOAM531921jpTZENcC5Lpj9U/H5HH+r6DCObYkkXPxIox3jsoy9YGjE3
 xpor2VXYxrZzb/APDOx+oiG3O2ze9n00Wad2
X-Received: by 2002:a5d:4d8f:: with SMTP id b15mr10297440wru.341.1599759539645; 
 Thu, 10 Sep 2020 10:38:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q186sm4603128wma.45.2020.09.10.10.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 10:38:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/5] handle M-profile in fp16_arith isar_feature test
Date: Thu, 10 Sep 2020 18:38:50 +0100
Message-Id: <20200910173855.4068-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: jVzK+02KbtOq

Awkwardly, M-profile uses a different ID register field from
A-profile to indicate presence of 16-bit floating point arithmetic.
This patchset corrects the feature test function. In order to
use the correct test, we need to be able to ask "is this M-profile?"
in the isar_feature function, and we don't have the 'env' pointer
there so we can't use the existing ARM_FEATURE_M feature bit check.

So we have to test the ID_PFR1 MProgMode field, but to do that we
need to give Cortex-M0 (a 'baseline' M-profile CPU which doesn't have
guest-visible ID registers) some ID register values which correspond
to what it implements, but hide those values from the guest. We
also need to do the usual move of id_pfr* into ARMISARegisters.

Patch 1 is unrelated: it's just a simple removal of an ARM_FEATURE
bit that was easy to convert to an isar feature field check because
we only test the condition in two places.

This series leaves us with two different ways to check for "is this
M-profile?" -- the old ARM_FEATURE_M bit, and also the new
isar_feature_aa32_mprofile() test.  We could in theory convert the
users of ARM_FEATURE_M, but I haven't, because there are a lot of
callsites, and it can't be done automatically:

 * arm_feature() takes the CPUARMState* whereas cpu_isar_feature()
   takes the ARMCPU*, so each callsite needs manual attention to
   identify whether it already has a 'cpu' local variable and
   add one if it doesn't
 * awkwardly, the KVM-on-AArch64-only host case does not zero
   out these ID register fields (see the comment in kvm64.c
   kvm_arm_get_host_cpu_features()), so calling the
   isar_feature function is only valid if we already know that
   this CPU is AArch32 -- this would need manually checking
   at all callsites. (Unless we wanted to change our minds about
   leaving UNKNOWN values in the ID register fields.)

thanks
-- PMM

Peter Maydell (5):
  target/arm: Replace ARM_FEATURE_PXN with ID_MMFR0.VMSA check
  target/arm: Move id_pfr0, id_pfr1 into ARMISARegisters
  hw/intc/armv7m_nvic: Only show ID register values for Main Extension
    CPUs
  target/arm: Add ID register values for Cortex-M0
  target/arm: Make isar_feature_aa32_fp16_arith() handle M-profile

 target/arm/cpu.h      | 50 ++++++++++++++++++++++++++++++------
 hw/intc/armv7m_nvic.c | 46 +++++++++++++++++++++++++++++++--
 target/arm/cpu.c      | 21 ++++++++-------
 target/arm/cpu64.c    | 12 ++++-----
 target/arm/cpu_tcg.c  | 60 ++++++++++++++++++++++++++++++-------------
 target/arm/helper.c   |  9 ++++---
 target/arm/kvm64.c    |  4 +++
 7 files changed, 153 insertions(+), 49 deletions(-)

-- 
2.20.1

