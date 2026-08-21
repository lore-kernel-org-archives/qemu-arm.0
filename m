Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EC0C5DF87
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 12:01:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxNvh-0004QC-Nh; Fri, 21 Aug 2026 08:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxNvT-0004M7-6O
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 08:00:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxNvQ-000549-0v
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 08:00:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-499b2981a7bso9938635e9.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787313640; x=1787918440; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iDp4JFzF0yKxoajjfXO1PCWxHO5x9h0WjZDpv8t289M=;
 b=oTIGy83SY4RmUn6iXZxTdaZRiFgGaCuOFG9cq4XNGh/pVKMJqGSSRrPDQPsd9MUBcv
 i0tRPH1Spocg9gq8yL7vLF8zPqRCVu6h79hnh25+xySNMrH4mt7o5CCm4HuQFCB5nWkS
 uUrzh13nT2OHaoQDIWoiuV7Qth6VfRp36kk3N73w/lnEDEjePwYw0GSxNUeFKiWANo8z
 zbVpB9PFEAfZIIwMAEcLAGRXZEt/DwiHWzHifs7+FpWyf+WzjxhFTA1uhTwI2Bo7Cu0V
 cEfChfIENX/nEcT3S/HYpUlEHaxfUeHq/I09Nhe/rIKWZcNhK/Er3o4sfbcW41qiaJSp
 UPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787313640; x=1787918440;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=iDp4JFzF0yKxoajjfXO1PCWxHO5x9h0WjZDpv8t289M=;
 b=ZBnqRw54k9FCkWjA0mftEnFjwJQzgrno71D+0KWXsjjwsvCvrkOEv9nL0swZzNRLY0
 wtwDDMelefSD3HBXV5H2fEvdwIBVMnUAguLNXSzkwZWEX8azUAfCqRq7TzlVyHKlvgay
 8pbxKY3IgL/L87Mei1WnVME7hAwVfbTU2B0ZxvjYIFrDtbhLaZC3FcHm/vw6az2WwlpN
 XoqDOZ83mjV25EIKvUuugjfNehrRdAzupwvo7Iwm08fJVl+a1TufOzoxcG8jISPeR4fR
 3Zjczpdmhpny3Y93emFl9H5QmO+i9Im6RcbMcS8GlyoVHLG2K3AI6XLS6p4owzY+ubE8
 +m7g==
X-Gm-Message-State: AOJu0YwF9abhpttzU861laEX4Z+7BtMkPd04Lvh4RggFUuT5FEvLbNeK
 Oi90uOzeCdwgwAytFF52cGCBNvgA02WAweM5ilZ7i/iexAGvsvOqjyvlPyvNXUTuytO7aCpOcB3
 azzjR
X-Gm-Gg: AR+sD11jU4KRMIIKYrcT29pQGg32FJDCZ7enwoX+Q3Cqb2V2hUKrbZeIXObmUCJKTmL
 WqOffSDWLd04lfyUPUdWLx0mjsIefRqDaRsqPtI10AX46TfUqSUx78DYOR3RPgPrXptINZTNbca
 ogx1YCHp/kjApHO/4VkMz/1spOZ6TH186WCduKWZi07F3xEBpm3f9/AxGLBu0GYgGurDpG9osFO
 KFHdR2i5faVKGPqaCbExfDYyw4WK3ESgQjXL/O/ZGX0uoxdVCUZ0NJ//j0ZhBLytTkpaeNlTMZ/
 mSRDn7xR12YE8yYQZHbLj4q03iBHM9drYPInzuUq1YmBqtK4sSVLOK5fBrqUwRul2+bt+UPO9+8
 jPkvGca3AI7uG3ZphXuLorRgvUn5oQvFP5bFrFaaJxDoLFTIj/93z539Q+RLdSK1HlG1hySy00U
 lymAkcGEGSle9U1pofOO87dcDerAa8qEOdac+yLap0hP08otsLzW3qdhqNJHhLEW/axMnFiBfRE
 wzG0gNnwlAnaNisqdXwSucmZe5bQlEUzS6U8hkBj0CbVWfNjwNBXb2Uv+xx+toIEGCa3A==
X-Received: by 2002:a05:600c:4f54:b0:496:bbce:fc with SMTP id
 5b1f17b1804b1-499b8354a65mr69967595e9.12.1787313639925; 
 Fri, 21 Aug 2026 05:00:39 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499b911724bsm24219315e9.15.2026.08.21.05.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 05:00:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't provide TLBTR for pre-v6 CPUs
Date: Fri, 21 Aug 2026 13:00:36 +0100
Message-ID: <20260821120036.4161792-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

The TLBTR register (encoding cp15, 0, c0, c0, 3) is listed in the v7A
Arm ARM appendix O as being present in v4 and v5 (section O.7.1,
diagram "Organization of CP15 registers in an ARMv4 or ARMv5 VMSA
implementation").  However, it isn't listed in the v5 Arm ARM, and
checking individual TRMs for the arm926, arm1026, sa1100, sa1110 and
ti925 shows that none of them implement it, so it seems much more
likely that TLBTR was new for v6.  It's also confirmed not to be
present on a real arm926.

Gate the register on ARM_FEATURE_V6 being present; this means that on
pre-v6 cores the encoding will fall back to reporting the MIDR (due
to the CP_ANY wildcarding), matching the hardware behaviour.

We can also remove the "make id_tlbtr_reginfo r/w for strongarm and
omap" code, because those CPUs are pre-v6 so won't be using that
reginfo struct now.

Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4207
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index af45234ad2a..db7a0c55380 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7290,7 +7290,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                 id_cp_reginfo[i].access = PL1_RW;
             }
             id_mpuir_reginfo.access = PL1_RW;
-            id_tlbtr_reginfo.access = PL1_RW;
         }
         if (arm_feature(env, ARM_FEATURE_V8)) {
             define_arm_cp_regs(cpu, id_v8_midr_cp_reginfo);
@@ -7301,7 +7300,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             define_arm_cp_regs(cpu, id_pre_v8_midr_cp_reginfo);
         }
         define_arm_cp_regs(cpu, id_cp_reginfo);
-        if (!arm_feature(env, ARM_FEATURE_PMSA)) {
+        if (arm_feature(env, ARM_FEATURE_V6) &&
+            !arm_feature(env, ARM_FEATURE_PMSA)) {
             define_one_arm_cp_reg(cpu, &id_tlbtr_reginfo);
         } else if (arm_feature(env, ARM_FEATURE_PMSA) &&
                    arm_feature(env, ARM_FEATURE_V8)) {
-- 
2.43.0


