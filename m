Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B459CD4F47
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:14:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtHU-0000jS-JX; Fri, 15 May 2026 10:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHQ-0000Yu-3r
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:44 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wNtHN-0004Kx-OG
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:12:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso88906055e9.0
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854360; x=1779459160; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJU/tawq5MhlfIuua7L/PMVdYR5OjanFKkQ3nbDCxFI=;
 b=Lb9Iwyu7KVs9SqoTaPvwbUhHFVmIrE638YmI7FiTrB5EK19wPTRy6XtLQJCsohqv3U
 5B5SUhZti+7LhAkWwoAqQ9aI6FpUEZOXxMB3xMY6L9Y9/ZRltzEHynd4ZptLuKjq2RVL
 tRRa8oAm3AF8N2VHWaY/TH6NQsCITBeZ/XmaX+KUlWVoTgstDpAVQGserVYy+lbonkOy
 NNGjTlTb/6bh1DngXxJhPzIIxUucTd+/Ebr6V3bOAlNF4bZ+ieFqIW1KeQNfRsdYxmRP
 KOof08EKu5jlOkUFY8RvqS6hpGhudUGcxiHodPzIBARXbTpOigZIBpMSyHsH6/9I71lZ
 Hl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854360; x=1779459160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pJU/tawq5MhlfIuua7L/PMVdYR5OjanFKkQ3nbDCxFI=;
 b=aMb6SLdc9wpVYYOTFUc0mq3DtIbxBvRiqDiiD1VK7GCn1fzvZyF987Zfe0BkC24BND
 Mb0SV1yU2EUMORTyKZozHvY6Sde0QD0zuGfD849xMurjc6pe7EnXoyRDKhcS1uWNZ3GU
 HN9KkXF7fEZpmNA+WtbiRmm/hMTzqRkDut4IHLb9rwOZsBQKpUQ35xohTHXUSkmXNNPq
 hq7K2m5nK5BFT/ttneBiyGBkUCn87wiCADhjhL98XfqebH7CfCNMGksCNEiV3hIcJLHG
 +MqHMFkWatDVPBfUz0VUifToCKxKULhsCSe0gxyI6OzAVXEPOVnHD+AbvloCd4jJjJ1l
 f6Uw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9GkDgVDenWFctl1FpQ8FNiJREbybaEsAoHNfkqRh6dnxfMa7XYh0TCj9NOKQ1M0mOdlJIuKzwW9w==@nongnu.org
X-Gm-Message-State: AOJu0YzMpzowKgMgDltsqWwIgbIzd5SjG3jNudgF9kYzTGDB/sdVdloS
 EK+hJreE3XG3TulyVSlXRsPRCsmv37BI4jRRvS0139gaBzL8nUbuw3va1V6MdJjZmuM=
X-Gm-Gg: Acq92OFH2CQSJ1veGv9y6sxtWunTIKZ41s6JLbhb0i18WvHNnLtjnpKQp4CB1rrzYi6
 LQDZhWT21nBy87wnx/0CCYlB7xTShmydNY82YgYbrdWdW1q5S9vCla9/dVOzpKi7El8vs62tTg3
 GEwNPOqSD6gI9iTIE4udSJBmuhSPCesYthXDg/1HpBz94eEEczXwiUtaV7gg/AREcNw5WINa/Um
 qaDxQkFboJFzofvjxAqNth4Q2ZYbX6cXkKucqrhLzVIkArluDobZCvImz3gyTg4A2VMzQEYPMm7
 BE+Uk+J7hU09cNQDEv8hWMYGK2LX2PUqwkR/VZd7kySJWcnfvxSWsInRq+D4IxSFKnRQiiJ+YM6
 Dq1PsbzpXgnPN13I4mQk4Ofkp1co8NQWZ/x4Bcuw8OZYNVOhEH6FWEE/erv53/jzIxP19BPOTLT
 qUryCcAWRCPA9E3eo6pVnhYjVlB24UrcxETExh381nqqgEhO9JyWtmh4Y8qf8gbGtOsGBYJpcK
X-Received: by 2002:a05:600c:3b12:b0:488:b14f:b8ed with SMTP id
 5b1f17b1804b1-48fe59ab80emr62410105e9.0.1778854360119; 
 Fri, 15 May 2026 07:12:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe1a41sm16017840f8f.31.2026.05.15.07.12.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 May 2026 07:12:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v6 17/20] target/arm: Re-use common aarch64_aa32_a57_init()
 helper
Date: Fri, 15 May 2026 16:10:28 +0200
Message-ID: <20260515141032.3271-18-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260515141032.3271-1-philmd@linaro.org>
References: <20260515141032.3271-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

Make aarch64_aa32_a57_init() common by exposing its prototype
and defining it in cpu-max.c. Call it in arm_max_initfn()
restricted to AArch32.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/internals.h |  1 +
 target/arm/cpu-max.c   | 74 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c     | 71 ----------------------------------------
 target/arm/tcg/cpu32.c | 48 ++-------------------------
 4 files changed, 77 insertions(+), 117 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 00830b17248..c95f3d63138 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1758,6 +1758,7 @@ void aarch64_max_tcg_initfn(Object *obj);
 void aarch64_add_pauth_properties(Object *obj);
 void aarch64_add_sve_properties(Object *obj);
 void aarch64_add_sme_properties(Object *obj);
+void aarch64_aa32_a57_init(Object *obj, bool aa32_only);
 
 /* Return true if the gdbstub is presenting an AArch64 CPU */
 static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
diff --git a/target/arm/cpu-max.c b/target/arm/cpu-max.c
index 9fd48ce46e2..6fc54ebe74e 100644
--- a/target/arm/cpu-max.c
+++ b/target/arm/cpu-max.c
@@ -7,7 +7,81 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "system/kvm.h"
 #include "target/arm/internals.h"
+#include "target/arm/cpregs.h"
+
+void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+    ARMISARegisters *isar = &cpu->isar;
+    const bool aarch64_enabled = !aa32_only;
+
+    cpu->dtb_compatible = "arm,cortex-a57";
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
+    if (aarch64_enabled) {
+        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
+    }
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    if (kvm_enabled()) {
+        cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
+    }
+    cpu->midr = 0x411fd070;
+    cpu->revidr = 0x00000000;
+    cpu->reset_fpsid = 0x41034070;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x12111111;
+    cpu->isar.mvfr2 = 0x00000043;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50838;
+    SET_IDREG(isar, ID_PFR0, 0x00000131);
+    SET_IDREG(isar, ID_PFR1, 0x00011011);
+    SET_IDREG(isar, ID_DFR0, 0x03010066);
+    SET_IDREG(isar, ID_AFR0, 0x00000000);
+    SET_IDREG(isar, ID_MMFR0, 0x10101105);
+    SET_IDREG(isar, ID_MMFR1, 0x40000000);
+    SET_IDREG(isar, ID_MMFR2, 0x01260000);
+    SET_IDREG(isar, ID_MMFR3, 0x02102211);
+    SET_IDREG(isar, ID_ISAR0, 0x02101110);
+    SET_IDREG(isar, ID_ISAR1, 0x13112111);
+    SET_IDREG(isar, ID_ISAR2, 0x21232042);
+    SET_IDREG(isar, ID_ISAR3, 0x01112131);
+    SET_IDREG(isar, ID_ISAR4, 0x00011142);
+    SET_IDREG(isar, ID_ISAR5, 0x00011121);
+    SET_IDREG(isar, ID_ISAR6, 0);
+    if (aarch64_enabled) {
+        SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
+        SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
+        SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
+        SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
+    }
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
+    cpu->isar.reset_pmcr_el0 = 0x41013000;
+    SET_IDREG(isar, CLIDR, 0x0a200023);
+    /* 32KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
+    /* 48KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
+    /* 2048KB L2 cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
+    if (aarch64_enabled) {
+        set_dczid_bs(cpu, 4); /* 64 bytes */
+        cpu->gic_num_lrs = 4;
+        cpu->gic_vpribits = 5;
+        cpu->gic_vprebits = 5;
+        cpu->gic_pribits = 5;
+    }
+    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+}
 
 /* Share AArch32 -cpu max features with AArch64. */
 void aa32_max_features(ARMCPU *cpu)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 7dce17fdb20..499d154dace 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -686,77 +686,6 @@ void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
     SET_IDREG(&cpu->isar, ID_AA64MMFR0, t);
 }
 
-static void aarch64_aa32_a57_init(Object *obj, bool aa32_only)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-    ARMISARegisters *isar = &cpu->isar;
-    const bool aarch64_enabled = !aa32_only;
-
-    cpu->dtb_compatible = "arm,cortex-a57";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
-    if (aarch64_enabled) {
-        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
-    }
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    if (kvm_enabled()) {
-        cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
-    }
-    cpu->midr = 0x411fd070;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    SET_IDREG(isar, ID_PFR0, 0x00000131);
-    SET_IDREG(isar, ID_PFR1, 0x00011011);
-    SET_IDREG(isar, ID_DFR0, 0x03010066);
-    SET_IDREG(isar, ID_AFR0, 0x00000000);
-    SET_IDREG(isar, ID_MMFR0, 0x10101105);
-    SET_IDREG(isar, ID_MMFR1, 0x40000000);
-    SET_IDREG(isar, ID_MMFR2, 0x01260000);
-    SET_IDREG(isar, ID_MMFR3, 0x02102211);
-    SET_IDREG(isar, ID_ISAR0, 0x02101110);
-    SET_IDREG(isar, ID_ISAR1, 0x13112111);
-    SET_IDREG(isar, ID_ISAR2, 0x21232042);
-    SET_IDREG(isar, ID_ISAR3, 0x01112131);
-    SET_IDREG(isar, ID_ISAR4, 0x00011142);
-    SET_IDREG(isar, ID_ISAR5, 0x00011121);
-    SET_IDREG(isar, ID_ISAR6, 0);
-    if (aarch64_enabled) {
-        SET_IDREG(isar, ID_AA64PFR0, 0x00002222);
-        SET_IDREG(isar, ID_AA64DFR0, 0x10305106);
-        SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
-        SET_IDREG(isar, ID_AA64MMFR0, 0x00001124);
-    }
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
-    SET_IDREG(isar, CLIDR, 0x0a200023);
-    /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
-    /* 48KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
-    /* 2048KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
-    if (aarch64_enabled) {
-        set_dczid_bs(cpu, 4); /* 64 bytes */
-        cpu->gic_num_lrs = 4;
-        cpu->gic_vpribits = 5;
-        cpu->gic_vprebits = 5;
-        cpu->gic_pribits = 5;
-    }
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
-}
-
 static void aarch64_a57_initfn(Object *obj)
 {
     aarch64_aa32_a57_init(obj, false);
diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 2e8afc28602..a2f730451fb 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -720,53 +720,9 @@ static void sa1110_initfn(Object *obj)
 static void arm_max_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
-    ARMISARegisters *isar = &cpu->isar;
 
-    /* aarch64_a57_initfn, advertising none of the aarch64 features */
-    cpu->dtb_compatible = "arm,cortex-a57";
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr = 0x411fd070;
-    cpu->revidr = 0x00000000;
-    cpu->reset_fpsid = 0x41034070;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x12111111;
-    cpu->isar.mvfr2 = 0x00000043;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50838;
-    SET_IDREG(isar, ID_PFR0, 0x00000131);
-    SET_IDREG(isar, ID_PFR1, 0x00011011);
-    SET_IDREG(isar, ID_DFR0, 0x03010066);
-    SET_IDREG(isar, ID_AFR0, 0x00000000);
-    SET_IDREG(isar, ID_MMFR0, 0x10101105);
-    SET_IDREG(isar, ID_MMFR1, 0x40000000);
-    SET_IDREG(isar, ID_MMFR2, 0x01260000);
-    SET_IDREG(isar, ID_MMFR3, 0x02102211);
-    SET_IDREG(isar, ID_ISAR0, 0x02101110);
-    SET_IDREG(isar, ID_ISAR1, 0x13112111);
-    SET_IDREG(isar, ID_ISAR2, 0x21232042);
-    SET_IDREG(isar, ID_ISAR3, 0x01112131);
-    SET_IDREG(isar, ID_ISAR4, 0x00011142);
-    SET_IDREG(isar, ID_ISAR5, 0x00011121);
-    SET_IDREG(isar, ID_ISAR6, 0);
-    cpu->isar.dbgdidr = 0x3516d000;
-    cpu->isar.dbgdevid = 0x01110f13;
-    cpu->isar.dbgdevid1 = 0x2;
-    cpu->isar.reset_pmcr_el0 = 0x41013000;
-    SET_IDREG(isar, CLIDR, 0x0a200023);
-    /* 32KB L1 dcache */
-    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 32 * KiB, 7);
-    /* 48KB L1 icache */
-    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 3, 64, 48 * KiB, 2);
-    /* 2048KB L2 cache */
-    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 16, 64, 2 * MiB, 7);
-    define_cortex_a72_a57_a53_cp_reginfo(cpu);
+    /* Cortex-A57 advertising none of the aarch64 features */
+    aarch64_aa32_a57_init(obj, true);
 
     aa32_max_features(cpu);
 
-- 
2.53.0


