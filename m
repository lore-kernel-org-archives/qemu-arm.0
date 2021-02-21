Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp1277843lfc;
        Sun, 21 Feb 2021 14:30:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNgN5qIzeWrALxyziE37xhXumrMVCC2hu0eXQfuivwGleH4f6+IWwc2qu5uqpTFlLqN/0+
X-Received: by 2002:a6b:c915:: with SMTP id z21mr10296698iof.32.1613946651978;
        Sun, 21 Feb 2021 14:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613946651; cv=none;
        d=google.com; s=arc-20160816;
        b=dCMZaBFbHUvEGT++zJDOqXCWmrehPhg7oqDSGBbEfnvRWA7cyHQMdENs6xkb+h0HJ3
         935BAdTevTD07jf2axaWi62QodFhb6QvWfKJE2K1jLWySTNY95PZ3RQ6ZqfZTI/QFTMp
         qCkpOQdI8AnDqHL0Bg6LAlgdQaXqG7dkxlsiM2oL29S/3a4lTJZ07lNk4HrIRGJv1P0P
         FGfq4XErlAopc+JCUOGyI3moMBMauz4yx/lAxEqQHZFh76Wl5Ji/yYFnIV5Y6CkaS/fh
         htaetUZtQtSFVUoU4sHWjKmfSEDEQo1IANmuT3aMSpbZ/1/+q44erMRb+cT7IwYvBPRZ
         9JDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=abvYlgbxp+qnt7oGypu6kSIUTyAzh4XUcm0yaEcwfBM=;
        b=WKsIo+TIM6kkRo9waI/+mwJOHb6cMwH2T/LZyryOWiwSMqtNa6FHZiz1zVt9jBCO/j
         qHhRq2cf5AkrCY21om90uU1AtWf5ARxYWs1bM5ZVM93wAxHQTp74UyZFBKVi43zozV9b
         P45BSYl173hN54tZrH/wAIrmZ92latfzxUGAZi6ZaK3BsUqxKto0+Hj7XtUIE7h4R+ER
         JuYV7k+kRBKO3ZlUFKubrhj+k/AirXb+POjltTz9chiaW5h+9hoM7OZyYMHb8jHSiUwq
         nQKTZKMotEt/ySAA+TTEuOpiZYjkOf3/sQk06ao1LPcri9gD87mwmy7lS0BoOH4VNG2a
         XPhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Do39XBpi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si16811789iow.49.2021.02.21.14.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Feb 2021 14:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Do39XBpi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDxFb-0002JH-6R
	for alex.bennee@linaro.org; Sun, 21 Feb 2021 17:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBZ-0006P9-7l; Sun, 21 Feb 2021 17:26:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxBV-0004NI-G9; Sun, 21 Feb 2021 17:26:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id i9so1876265wml.5;
 Sun, 21 Feb 2021 14:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=abvYlgbxp+qnt7oGypu6kSIUTyAzh4XUcm0yaEcwfBM=;
 b=Do39XBpiaCjdx4o3acLIlsdzRldWXhgMtR2yQg9FD963XM0tMo/n9Oq+CoLzHxQbXG
 c9QDNu05tB11IirmGU2xvKEUeIvOpK846DvRU66vZEA9FETswV/qK0Icf3VeIh5htJmY
 8jfwm166sCNBuYj6tc4fTeOciLTIdv4IsLwjkANH6DYVDV7c6euxD06TpoWDeQz+iKsW
 Z1eR/C5+Pcr0q81ZRBkV4ACL4broZlpfmkFqFVotnahggwpAkFITBRcDH0/2EC01cXfW
 GrfUMG4OvMcoK2COLMDHxxKVYRZCxOeH4fD14+J93BK5spndJln+U6FfJseXEQ9MoYME
 Wp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=abvYlgbxp+qnt7oGypu6kSIUTyAzh4XUcm0yaEcwfBM=;
 b=dQOCHiueyWIlJxjdPh2ti+S2+oAaMBKQJNu9gsMTRcZocKAn6s+Ylbg8YsMpqJHAf2
 uCPH83b0pxNRlh1B2IvKwaWjApHzKfocIlrldu6L+He6nw27zaIGgAsoasLn6GH1aoK6
 SNjxwzlz4SciWZtwsxVvKqe406yxSOo88PgLPGluGRfROsfIs0NgDwnc2W2MVwHdZ6aF
 XN+hyvuTU8ZLWGjXk/ALRyoinwUp6U2U20GDV/qBQ9rwW8Z9Oko5AI0XT0cfqkkV5JAr
 /1wQtYOLkXTjYilPXZQRUy96soAz20RSK6PktcWVlGs44VqSJxiYTPLzWT7tfXYIb6dA
 hzIw==
X-Gm-Message-State: AOAM533cpNvmHVewbwGQTuQmqrBXiwfxuN78fGsVZklvfJEMbT98nRj4
 /EgXhin+JVZdi6qStCBDmWqSHK0wozs=
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr8094446wmi.66.1613946394619; 
 Sun, 21 Feb 2021 14:26:34 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm14379006wrm.33.2021.02.21.14.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:26:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] target/arm: Restrict v7A TCG cpus to TCG accel
Date: Sun, 21 Feb 2021 23:26:17 +0100
Message-Id: <20210221222617.2579610-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221222617.2579610-1-f4bug@amsat.org>
References: <20210221222617.2579610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z+CGfEn9FB2r

KVM requires the target cpu to be at least ARMv8 architecture
(support on ARMv7 has been dropped in commit 82bf7ae84ce:
"target/arm: Remove KVM support for 32-bit Arm hosts").

A KVM-only build won't be able to run TCG cpus, move the
v7A CPU definitions to cpu_tcg.c.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/cpu.c     | 331 -------------------------------------------
 target/arm/cpu_tcg.c | 314 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 314 insertions(+), 331 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6865ea76466..ae04884408c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1922,327 +1922,6 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-/* CPU models. These are not needed for the AArch64 linux-user build. */
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-
-static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
-    { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a8_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a8";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    cpu->midr = 0x410fc080;
-    cpu->reset_fpsid = 0x410330c0;
-    cpu->isar.mvfr0 = 0x11110222;
-    cpu->isar.mvfr1 = 0x00011111;
-    cpu->ctr = 0x82048004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x1031;
-    cpu->isar.id_pfr1 = 0x11;
-    cpu->isar.id_dfr0 = 0x400;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x31100003;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01202000;
-    cpu->isar.id_mmfr3 = 0x11;
-    cpu->isar.id_isar0 = 0x00101111;
-    cpu->isar.id_isar1 = 0x12112111;
-    cpu->isar.id_isar2 = 0x21232031;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x00111142;
-    cpu->isar.dbgdidr = 0x15141000;
-    cpu->clidr = (1 << 27) | (2 << 24) | 3;
-    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
-    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
-    cpu->reset_auxcr = 2;
-    define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
-}
-
-static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
-    /*
-     * power_control should be set to maximum latency. Again,
-     * default to 0 and set by private hook
-     */
-    { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_control) },
-    { .name = "A9_DIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 1,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_diagnostic) },
-    { .name = "A9_PWRDIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0,
-      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_diagnostic) },
-    { .name = "NEONBUSY", .cp = 15, .crn = 15, .crm = 1, .opc1 = 0, .opc2 = 0,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    /* TLB lockdown control */
-    { .name = "TLB_LOCKR", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 2,
-      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
-    { .name = "TLB_LOCKW", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 4,
-      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
-    { .name = "TLB_VA", .cp = 15, .crn = 15, .crm = 5, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    { .name = "TLB_PA", .cp = 15, .crn = 15, .crm = 6, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a9_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a9";
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    /*
-     * Note that A9 supports the MP extensions even for
-     * A9UP and single-core A9MP (which are both different
-     * and valid configurations; we don't model A9UP).
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR);
-    cpu->midr = 0x410fc090;
-    cpu->reset_fpsid = 0x41033090;
-    cpu->isar.mvfr0 = 0x11110222;
-    cpu->isar.mvfr1 = 0x01111111;
-    cpu->ctr = 0x80038003;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x1031;
-    cpu->isar.id_pfr1 = 0x11;
-    cpu->isar.id_dfr0 = 0x000;
-    cpu->id_afr0 = 0;
-    cpu->isar.id_mmfr0 = 0x00100103;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01230000;
-    cpu->isar.id_mmfr3 = 0x00002111;
-    cpu->isar.id_isar0 = 0x00101111;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x00111142;
-    cpu->isar.dbgdidr = 0x35141000;
-    cpu->clidr = (1 << 27) | (1 << 24) | 3;
-    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
-    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
-    define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
-}
-
-#ifndef CONFIG_USER_ONLY
-static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
-{
-    MachineState *ms = MACHINE(qdev_get_machine());
-
-    /*
-     * Linux wants the number of processors from here.
-     * Might as well set the interrupt-controller bit too.
-     */
-    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
-}
-#endif
-
-static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
-#ifndef CONFIG_USER_ONLY
-    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
-      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
-      .writefn = arm_cp_write_ignore, },
-#endif
-    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
-    REGINFO_SENTINEL
-};
-
-static void cortex_a7_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a7";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
-    cpu->midr = 0x410fc075;
-    cpu->reset_fpsid = 0x41023075;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x84448003;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10101105;
-    cpu->isar.id_mmfr1 = 0x40000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    /*
-     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
-     * table 4-41 gives 0x02101110, which includes the arm div insns.
-     */
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f005;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
-}
-
-static void cortex_a15_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cpu->dtb_compatible = "arm,cortex-a15";
-    set_feature(&cpu->env, ARM_FEATURE_V7VE);
-    set_feature(&cpu->env, ARM_FEATURE_NEON);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
-    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
-    set_feature(&cpu->env, ARM_FEATURE_EL2);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
-    cpu->reset_fpsid = 0x410430f0;
-    cpu->isar.mvfr0 = 0x10110222;
-    cpu->isar.mvfr1 = 0x11111111;
-    cpu->ctr = 0x8444c004;
-    cpu->reset_sctlr = 0x00c50078;
-    cpu->isar.id_pfr0 = 0x00001131;
-    cpu->isar.id_pfr1 = 0x00011011;
-    cpu->isar.id_dfr0 = 0x02010555;
-    cpu->id_afr0 = 0x00000000;
-    cpu->isar.id_mmfr0 = 0x10201105;
-    cpu->isar.id_mmfr1 = 0x20000000;
-    cpu->isar.id_mmfr2 = 0x01240000;
-    cpu->isar.id_mmfr3 = 0x02102211;
-    cpu->isar.id_isar0 = 0x02101110;
-    cpu->isar.id_isar1 = 0x13112111;
-    cpu->isar.id_isar2 = 0x21232041;
-    cpu->isar.id_isar3 = 0x11112131;
-    cpu->isar.id_isar4 = 0x10011142;
-    cpu->isar.dbgdidr = 0x3515f021;
-    cpu->clidr = 0x0a200023;
-    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
-    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
-    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
-    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
-}
-
-#ifndef TARGET_AARCH64
-/*
- * -cpu max: a CPU with as many features enabled as our emulation supports.
- * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
- * this only needs to handle 32 bits, and need not care about KVM.
- */
-static void arm_max_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    cortex_a15_initfn(obj);
-
-    /* old-style VFP short-vector support */
-    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-
-#ifdef CONFIG_USER_ONLY
-    /*
-     * We don't set these in system emulation mode for the moment,
-     * since we don't correctly set (all of) the ID registers to
-     * advertise them.
-     */
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    {
-        uint32_t t;
-
-        t = cpu->isar.id_isar5;
-        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
-        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
-        cpu->isar.id_isar5 = t;
-
-        t = cpu->isar.id_isar6;
-        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-        cpu->isar.id_isar6 = t;
-
-        t = cpu->isar.mvfr1;
-        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
-        cpu->isar.mvfr1 = t;
-
-        t = cpu->isar.mvfr2;
-        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-        cpu->isar.mvfr2 = t;
-
-        t = cpu->isar.id_mmfr3;
-        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
-        cpu->isar.id_mmfr3 = t;
-
-        t = cpu->isar.id_mmfr4;
-        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
-        cpu->isar.id_mmfr4 = t;
-
-        t = cpu->isar.id_pfr0;
-        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
-        cpu->isar.id_pfr0 = t;
-    }
-#endif
-}
-#endif
-
-#endif /* !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64) */
-
-static const ARMCPUInfo arm_cpus[] = {
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
-    { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
-    { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
-    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
-#ifndef TARGET_AARCH64
-    { .name = "max",         .initfn = arm_max_initfn },
-#endif
-#ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_max_initfn },
-#endif
-#endif
-};
-
 static Property arm_cpu_properties[] = {
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT64("midr", ARMCPU, midr, 0),
@@ -2386,21 +2065,11 @@ static const TypeInfo arm_cpu_type_info = {
 
 static void arm_cpu_register_types(void)
 {
-    const size_t cpu_count = ARRAY_SIZE(arm_cpus);
-
     type_register_static(&arm_cpu_type_info);
 
 #ifdef CONFIG_KVM
     type_register_static(&host_arm_cpu_type_info);
 #endif
-
-    if (cpu_count) {
-        size_t i;
-
-        for (i = 0; i < cpu_count; ++i) {
-            arm_cpu_register(&arm_cpus[i]);
-        }
-    }
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index fb07a336939..b420c8c555c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -15,6 +15,9 @@
 #endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
+#if !defined(CONFIG_USER_ONLY)
+#include "hw/boards.h"
+#endif
 
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
@@ -255,6 +258,236 @@ static void arm11mpcore_initfn(Object *obj)
     cpu->reset_auxcr = 1;
 }
 
+static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
+    { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 0,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "L2AUXCR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a8_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a8";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->midr = 0x410fc080;
+    cpu->reset_fpsid = 0x410330c0;
+    cpu->isar.mvfr0 = 0x11110222;
+    cpu->isar.mvfr1 = 0x00011111;
+    cpu->ctr = 0x82048004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x1031;
+    cpu->isar.id_pfr1 = 0x11;
+    cpu->isar.id_dfr0 = 0x400;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x31100003;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01202000;
+    cpu->isar.id_mmfr3 = 0x11;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x12112111;
+    cpu->isar.id_isar2 = 0x21232031;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00111142;
+    cpu->isar.dbgdidr = 0x15141000;
+    cpu->clidr = (1 << 27) | (2 << 24) | 3;
+    cpu->ccsidr[0] = 0xe007e01a; /* 16k L1 dcache. */
+    cpu->ccsidr[1] = 0x2007e01a; /* 16k L1 icache. */
+    cpu->ccsidr[2] = 0xf0000000; /* No L2 icache. */
+    cpu->reset_auxcr = 2;
+    define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
+}
+
+static const ARMCPRegInfo cortexa9_cp_reginfo[] = {
+    /*
+     * power_control should be set to maximum latency. Again,
+     * default to 0 and set by private hook
+     */
+    { .name = "A9_PWRCTL", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 0,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_control) },
+    { .name = "A9_DIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 1,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_diagnostic) },
+    { .name = "A9_PWRDIAG", .cp = 15, .crn = 15, .crm = 0, .opc1 = 0, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0,
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_power_diagnostic) },
+    { .name = "NEONBUSY", .cp = 15, .crn = 15, .crm = 1, .opc1 = 0, .opc2 = 0,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    /* TLB lockdown control */
+    { .name = "TLB_LOCKR", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 2,
+      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
+    { .name = "TLB_LOCKW", .cp = 15, .crn = 15, .crm = 4, .opc1 = 5, .opc2 = 4,
+      .access = PL1_W, .resetvalue = 0, .type = ARM_CP_NOP },
+    { .name = "TLB_VA", .cp = 15, .crn = 15, .crm = 5, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    { .name = "TLB_PA", .cp = 15, .crn = 15, .crm = 6, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    { .name = "TLB_ATTR", .cp = 15, .crn = 15, .crm = 7, .opc1 = 5, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .type = ARM_CP_CONST },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a9_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a9";
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    /*
+     * Note that A9 supports the MP extensions even for
+     * A9UP and single-core A9MP (which are both different
+     * and valid configurations; we don't model A9UP).
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V7MP);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR);
+    cpu->midr = 0x410fc090;
+    cpu->reset_fpsid = 0x41033090;
+    cpu->isar.mvfr0 = 0x11110222;
+    cpu->isar.mvfr1 = 0x01111111;
+    cpu->ctr = 0x80038003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x1031;
+    cpu->isar.id_pfr1 = 0x11;
+    cpu->isar.id_dfr0 = 0x000;
+    cpu->id_afr0 = 0;
+    cpu->isar.id_mmfr0 = 0x00100103;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01230000;
+    cpu->isar.id_mmfr3 = 0x00002111;
+    cpu->isar.id_isar0 = 0x00101111;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x00111142;
+    cpu->isar.dbgdidr = 0x35141000;
+    cpu->clidr = (1 << 27) | (1 << 24) | 3;
+    cpu->ccsidr[0] = 0xe00fe019; /* 16k L1 dcache. */
+    cpu->ccsidr[1] = 0x200fe019; /* 16k L1 icache. */
+    define_arm_cp_regs(cpu, cortexa9_cp_reginfo);
+}
+
+#ifndef CONFIG_USER_ONLY
+static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    MachineState *ms = MACHINE(qdev_get_machine());
+
+    /*
+     * Linux wants the number of processors from here.
+     * Might as well set the interrupt-controller bit too.
+     */
+    return ((ms->smp.cpus - 1) << 24) | (1 << 23);
+}
+#endif
+
+static const ARMCPRegInfo cortexa15_cp_reginfo[] = {
+#ifndef CONFIG_USER_ONLY
+    { .name = "L2CTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 2,
+      .access = PL1_RW, .resetvalue = 0, .readfn = a15_l2ctlr_read,
+      .writefn = arm_cp_write_ignore, },
+#endif
+    { .name = "L2ECTLR", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1, .opc2 = 3,
+      .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
+    REGINFO_SENTINEL
+};
+
+static void cortex_a7_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a7";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
+    cpu->midr = 0x410fc075;
+    cpu->reset_fpsid = 0x41023075;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x84448003;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10101105;
+    cpu->isar.id_mmfr1 = 0x40000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    /*
+     * a7_mpcore_r0p5_trm, page 4-4 gives 0x01101110; but
+     * table 4-41 gives 0x02101110, which includes the arm div insns.
+     */
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f005;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo); /* Same as A15 */
+}
+
+static void cortex_a15_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cpu->dtb_compatible = "arm,cortex-a15";
+    set_feature(&cpu->env, ARM_FEATURE_V7VE);
+    set_feature(&cpu->env, ARM_FEATURE_NEON);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
+    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
+    set_feature(&cpu->env, ARM_FEATURE_EL2);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
+    cpu->midr = 0x412fc0f1;
+    cpu->reset_fpsid = 0x410430f0;
+    cpu->isar.mvfr0 = 0x10110222;
+    cpu->isar.mvfr1 = 0x11111111;
+    cpu->ctr = 0x8444c004;
+    cpu->reset_sctlr = 0x00c50078;
+    cpu->isar.id_pfr0 = 0x00001131;
+    cpu->isar.id_pfr1 = 0x00011011;
+    cpu->isar.id_dfr0 = 0x02010555;
+    cpu->id_afr0 = 0x00000000;
+    cpu->isar.id_mmfr0 = 0x10201105;
+    cpu->isar.id_mmfr1 = 0x20000000;
+    cpu->isar.id_mmfr2 = 0x01240000;
+    cpu->isar.id_mmfr3 = 0x02102211;
+    cpu->isar.id_isar0 = 0x02101110;
+    cpu->isar.id_isar1 = 0x13112111;
+    cpu->isar.id_isar2 = 0x21232041;
+    cpu->isar.id_isar3 = 0x11112131;
+    cpu->isar.id_isar4 = 0x10011142;
+    cpu->isar.dbgdidr = 0x3515f021;
+    cpu->clidr = 0x0a200023;
+    cpu->ccsidr[0] = 0x701fe00a; /* 32K L1 dcache */
+    cpu->ccsidr[1] = 0x201fe00a; /* 32K L1 icache */
+    cpu->ccsidr[2] = 0x711fe07a; /* 4096K L2 unified cache */
+    define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
+}
+
 static void cortex_m0_initfn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -695,6 +928,77 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
+#ifndef TARGET_AARCH64
+/*
+ * -cpu max: a CPU with as many features enabled as our emulation supports.
+ * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
+ * this only needs to handle 32 bits, and need not care about KVM.
+ */
+static void arm_max_initfn(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    cortex_a15_initfn(obj);
+
+    /* old-style VFP short-vector support */
+    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We don't set these in system emulation mode for the moment,
+     * since we don't correctly set (all of) the ID registers to
+     * advertise them.
+     */
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    {
+        uint32_t t;
+
+        t = cpu->isar.id_isar5;
+        t = FIELD_DP32(t, ID_ISAR5, AES, 2);
+        t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
+        t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+        t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
+        t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
+        t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+        cpu->isar.id_isar5 = t;
+
+        t = cpu->isar.id_isar6;
+        t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
+        t = FIELD_DP32(t, ID_ISAR6, DP, 1);
+        t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SB, 1);
+        t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        cpu->isar.id_isar6 = t;
+
+        t = cpu->isar.mvfr1;
+        t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
+        t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+        cpu->isar.mvfr1 = t;
+
+        t = cpu->isar.mvfr2;
+        t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
+        t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+        cpu->isar.mvfr2 = t;
+
+        t = cpu->isar.id_mmfr3;
+        t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+        cpu->isar.id_mmfr3 = t;
+
+        t = cpu->isar.id_mmfr4;
+        t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
+        t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
+        t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
+        t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+        cpu->isar.id_mmfr4 = t;
+
+        t = cpu->isar.id_pfr0;
+        t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+        cpu->isar.id_pfr0 = t;
+    }
+#endif /* CONFIG_USER_ONLY */
+}
+#endif /* !TARGET_AARCH64 */
+
 static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm926",      .initfn = arm926_initfn },
     { .name = "arm946",      .initfn = arm946_initfn },
@@ -708,6 +1012,10 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "arm1136",     .initfn = arm1136_initfn },
     { .name = "arm1176",     .initfn = arm1176_initfn },
     { .name = "arm11mpcore", .initfn = arm11mpcore_initfn },
+    { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
+    { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
+    { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
+    { .name = "cortex-a15",  .initfn = cortex_a15_initfn },
     { .name = "cortex-m0",   .initfn = cortex_m0_initfn,
                              .class_init = arm_v7m_class_init },
     { .name = "cortex-m3",   .initfn = cortex_m3_initfn,
@@ -738,6 +1046,12 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
     { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
     { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
     { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
+#ifndef TARGET_AARCH64
+    { .name = "max",         .initfn = arm_max_initfn },
+#endif
+#ifdef CONFIG_USER_ONLY
+    { .name = "any",         .initfn = arm_max_initfn },
+#endif
 };
 
 static const TypeInfo idau_interface_type_info = {
-- 
2.26.2

