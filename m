Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CA0CAC5A5
	for <qemu-arm@archiver.kernel.org>; Tue, 23 Sep 2025 17:59:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v17HD-0003YF-SS; Tue, 23 Sep 2025 13:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v17HC-0003Xp-Cl
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 13:58:06 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v17H8-00033O-DT
 for qemu-arm@nongnu.org; Tue, 23 Sep 2025 13:58:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so5138041f8f.0
 for <qemu-arm@nongnu.org>; Tue, 23 Sep 2025 10:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758650280; x=1759255080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BW5jVmojF7BTekEQU23zqKenHHzqa5Btf2NwoKDIct4=;
 b=Tn5Ch5PnPf1gDLD1/6pH8X9082XKI907Ma1evTEGht2BVMg8grE+vHe1OZiuVH8cuP
 mW+m/vibcQX4FSjMCO7Gx3VClHRLkLY72JFomUK/eVenGoFLxcKa42/EAaK3MKDEMeyI
 i7jYktP0eLb4SeCuOZDJc1ZXoTNjLq1kprD7cmI2x/XpeCvfb3eHvYHPhyxAjycrOtQR
 00JvP+RrW94nvMR4zjLTqD8exJPwx1vuPR5iXbqqPwo+quTaINC5NZNOTTcfweOC0SZo
 Fi0z44uQRMtduRSSu2qoWvUn8axVCQkkHeKyinuQ3mPHNUubdedZU14FT/2fIqrR9tCF
 6kPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758650280; x=1759255080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BW5jVmojF7BTekEQU23zqKenHHzqa5Btf2NwoKDIct4=;
 b=lHgQIQUM0wBSZ0M3ld+CustnfDpAf8yxHNELReTIIgPkePuCLHm8nydLdChYw78Yn8
 +8U/We9gIFVQExAvSGSOzpIZGi3+F4PrKUeIUhT+9CW5B1zeUDc3ZbLTiZbpHWMwebwc
 YdnNRpLa2198ZaZpcRNGic5Q8PesbP6CbM0ZbpeFQhyK6UvUNQPw1FknUuyzmAg+4JmU
 QteVS1f8BKhksbDjFO2wd0xAnifaSv5dQW8otdJLoCKzw1MUnT/THst8F8Cb8Yxyukiu
 oMIi1zgM01wvSOwFvnr/kjKJZuDsPDWglzytkvr7T0bquSdoM1EVDZpGRPYiPkWHuxpJ
 s1Aw==
X-Gm-Message-State: AOJu0Yz1zCemWjE/bZVFBL1Qorx0kJnH3QR1H67fvaShSNbWGxJxhimc
 xV2Qx8JhftYmN6RK69c8M7HfnOk6dsuyNQRrYkdrBWFB6yMFR/KU03RsIlIbOdmBQqS2Lo0nln3
 SMkNj
X-Gm-Gg: ASbGncvuz38QfZr6JMqW9EqBiCC8/NtXozDb7ubBkZMApH0TbOWz+hIQH+GYXYctH4W
 NIJPN2zErIUr7LJM6RixX2GZgw2NXkRNdI/QnnGHMVJejnyBi5fSagLxHDK2JpM7WSInZpezEtH
 h/0ZsV/ewn1WfMbugJQqDpfmr5bHb6HuIxxKQjQ6XBCdL+v9JnFCcaiNBbQdmIyMP9Qu5YA0B9C
 FeEgeGX5A0u7mNEcnQZzeLuI5jvtI6BLVTOWnLJ33i5rJ/Z2Xon7bVGEpoEoKPiaSrZ38a5NpFW
 EU2WW2jsOSIwEMXpUax3fUhFma7FKt/f+deWVhyVFKijgikTrWdYtaWQO87xMdRIgWrY3iv48PV
 avMQX7SccqH2VM1CRT0Dw65HVZcOh
X-Google-Smtp-Source: AGHT+IEu4dh2QD5E/jWeaaJq9bfDRd9SBgZlv+QJkCdUTo5Aleu4KwHJ/FfAw983hajWiV4GMKgygg==
X-Received: by 2002:a05:6000:26cf:b0:3ee:1125:fb6d with SMTP id
 ffacd0b85a97d-405c49a2bf2mr2445224f8f.9.1758650279747; 
 Tue, 23 Sep 2025 10:57:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46d1c97a87csm97657155e9.20.2025.09.23.10.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 10:57:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/arm: Implement ID_AA64PFR2_EL1
Date: Tue, 23 Sep 2025 18:57:51 +0100
Message-ID: <20250923175751.966795-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923175751.966795-1-peter.maydell@linaro.org>
References: <20250923175751.966795-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Currently we define the ID_AA64PFR2_EL1 encoding as reserved (with
the required RAZ behaviour for unassigned system registers in the ID
register encoding space).  Newer architecture versions start to
define fields in this ID register, so define the appropriate
constants and implement it as an ID register backed by a field in
cpu->isar.  Since none of our CPUs set that isar field to non-zero,
there is no behavioural change here (other than the name exposed to
the user via the gdbstub), but this paves the way for implementing
the new features that use fields in this register.

The fields here are the ones documented in rev L.b of the Arm ARM.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h    | 5 +++++
 target/arm/cpu-sysregs.h.inc | 1 +
 target/arm/helper.c          | 6 ++++--
 target/arm/hvf/hvf.c         | 2 ++
 target/arm/kvm.c             | 1 +
 5 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index ad571e2ffee..602f6a88e53 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -277,6 +277,11 @@ FIELD(ID_AA64PFR1, MTEX, 52, 4)
 FIELD(ID_AA64PFR1, DF2, 56, 4)
 FIELD(ID_AA64PFR1, PFAR, 60, 4)
 
+FIELD(ID_AA64PFR2, MTEPERM, 0, 4)
+FIELD(ID_AA64PFR2, MTESTOREONLY, 4, 4)
+FIELD(ID_AA64PFR2, MTEFAR, 8, 4)
+FIELD(ID_AA64PFR2, FPMR, 32, 4)
+
 FIELD(ID_AA64MMFR0, PARANGE, 0, 4)
 FIELD(ID_AA64MMFR0, ASIDBITS, 4, 4)
 FIELD(ID_AA64MMFR0, BIGEND, 8, 4)
diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
index f48a9daa7c1..2bb2861c623 100644
--- a/target/arm/cpu-sysregs.h.inc
+++ b/target/arm/cpu-sysregs.h.inc
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
 DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
+DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
 DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
 DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
 DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c44294711f8..258cda4e90e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6278,11 +6278,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
               .resetvalue = GET_IDREG(isar, ID_AA64PFR1)},
-            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
+            { .name = "ID_AA64PFR2_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
               .access = PL1_R, .type = ARM_CP_CONST,
               .accessfn = access_aa64_tid3,
-              .resetvalue = 0 },
+              .resetvalue = GET_IDREG(isar, ID_AA64PFR2)},
             { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
               .access = PL1_R, .type = ARM_CP_CONST,
@@ -6510,6 +6510,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
                                R_ID_AA64PFR1_SSBS_MASK |
                                R_ID_AA64PFR1_MTE_MASK |
                                R_ID_AA64PFR1_SME_MASK },
+            { .name = "ID_AA64PFR2_EL1",
+              .exported_bits = 0 },
             { .name = "ID_AA64PFR*_EL1_RESERVED",
               .is_glob = true },
             { .name = "ID_AA64ZFR0_EL1",
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index b77db99079e..90e438e4e16 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -495,6 +495,7 @@ static struct hvf_sreg_match hvf_sreg_match[] = {
     { HV_SYS_REG_ID_AA64PFR0_EL1, HVF_SYSREG(0, 4, 3, 0, 0) },
 #endif
     { HV_SYS_REG_ID_AA64PFR1_EL1, HVF_SYSREG(0, 4, 3, 0, 1) },
+    /* Add ID_AA64PFR2_EL1 here when HVF supports it */
     { HV_SYS_REG_ID_AA64DFR0_EL1, HVF_SYSREG(0, 5, 3, 0, 0) },
     { HV_SYS_REG_ID_AA64DFR1_EL1, HVF_SYSREG(0, 5, 3, 0, 1) },
     { HV_SYS_REG_ID_AA64ISAR0_EL1, HVF_SYSREG(0, 6, 3, 0, 0) },
@@ -869,6 +870,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
     } regs[] = {
         { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },
         { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.idregs[ID_AA64PFR1_EL1_IDX] },
+        /* Add ID_AA64PFR2_EL1 here when HVF supports it */
         { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.idregs[ID_AA64DFR0_EL1_IDX] },
         { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.idregs[ID_AA64DFR1_EL1_IDX] },
         { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index c1ec6654ca6..65a262529a7 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -324,6 +324,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         err = 0;
     } else {
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR1_EL1_IDX);
+        err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR2_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64SMFR0_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR0_EL1_IDX);
         err |= get_host_cpu_reg(fd, ahcf, ID_AA64DFR1_EL1_IDX);
-- 
2.43.0


