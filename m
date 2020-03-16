Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251195lfe;
        Mon, 16 Mar 2020 09:08:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfTmR84T22AWvI+pUIhKRQ3BgOGRSJjGVH5Mey/FpREOyfYN74n3w24xhoGmyOgI+1kbv2
X-Received: by 2002:a25:854d:: with SMTP id f13mr436056ybn.410.1584374879987;
        Mon, 16 Mar 2020 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374879; cv=none;
        d=google.com; s=arc-20160816;
        b=XB9K3oyrz6UigIHxJjrbGvRVy9JNOsFhUCW3vjMwYDmuwuz4x88J6twLZ/WBe/xqLp
         mVs7cPheJbZqMMUZvxbjHp1rByK4mdz+pkIQxBdUKAnVFlVaGo8+gVcPOuPURJ4UKaIS
         8q3av0RILDZg+BcEm/oxAIZdiCJx2BRG4zBlRXHCpbi1zUkegtBlKJWseQ+o4MwdVCof
         DSL1RNLN8MrEkHY4EqbIRWI4CqbFMkST7OrVKCfJZaar2kaerANqswCzo9ohTbjBZ6VU
         8Lt5x1Y9PP03HGi4CZRvjYbk/XR4nZvjhB8WChpV3pxqiGzQJXK5CyYDGSwUKW+RXYZ+
         D6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xvIh8Ri8MGdsRwEuM5pCIZMdFKEO3pS7XtCgO8xIIro=;
        b=Bcnh7kIEQqzf1fLtbvLu3nE/tGT/vKrTjGjtGtlPO7m4jAKOo89Y3hIm9EJ3T9io8g
         Lv/IW5zWvcJgTBzMaKtztR6ZG+6FUAWrLrHUzgxCSN8F+URG2jXAtZtvTH9T++OMJovg
         qgDGfD+YdQsKJ5BTFOOjzT7RuZ8sPtOVIzfk/HGDop1U7ZRD6m1TPqfMlSF/yRDEBftR
         rgOrLVSqf/+GeIqCaOBF6lffc9vhP2l0cXqSfLqqPrWydjuHqDCzcIBeQDXpFFCk7i7K
         xyBDgCtMtXJySBJZGVAW8MFfg6+EWHhs0eg2oKc+FEde7t9VZHl5XMy8WS0pG0N04vly
         nLoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gcOeP9W1;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id 130si149281ybn.31.2020.03.16.09.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gcOeP9W1;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvIh8Ri8MGdsRwEuM5pCIZMdFKEO3pS7XtCgO8xIIro=;
	b=gcOeP9W1uawSuP/iksLgKBbVuqBdlR9RJdtFWfaQ2aCTps/zsZWnwh+LXIjlb1pySijw5r
	N080MyIHxnkcs73teHHshyVuHlS5aEZZIkE7C4FUHVDKE45EczJXeFam1Q9FlvrLj3QXBc
	VkuiLnk0UQKYUXGUagqr9WtnYZpvybA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-4vq5gO9BM_ucIz5pAye2Hg-1; Mon, 16 Mar 2020 12:07:57 -0400
X-MC-Unique: 4vq5gO9BM_ucIz5pAye2Hg-1
Received: by mail-wr1-f70.google.com with SMTP id n11so8771444wrs.13
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2dfDnran3E3vJVzOwh1qQwExgfNmDOU0PLsSJKRIuHk=;
        b=rW2xT4aicM7R2Q8ARVq99wuuJncke33xU8LM48CiEbfVq24CUd2sWge2MCbbw5CnyK
         lYJz66X/ESUbCEo4Ryqi4JSNqu9boqXL/gyoJDZoNGpvpXJkqdUb5gFJydbiXPivZx1Y
         ynbxcf+84nX1SzJDIC24/EVfU0bK+LUXi2MuWa3wbdVjwvjFqrKFpEc8NvOpF+wWkwAb
         CdGrGJkuyf/jn2qWl5a1xRa36F+r+uEL/oZ8AKC4kYCqi8gl++PnfddDFbZP1kq/RB9x
         t3FdsOnk6GvDgUGJOr/bTGuyrYTF4eYKP0eahsfpEujMAwoUJ2nYKrD/+9+PiAUAe1kx
         pxig==
X-Gm-Message-State: ANhLgQ3xzaeFmRvR4DVKlMuQh/d7Pdt8bmdAG2KFXgIHmPC5CoJ1WcZk
	r55M5CAQpa6sHw7cTMGWx1Ld/PCAmYGJGd42de3AOaXCdRB0CVQUqQ1e/zpHYk3dhyzQK4xHze1
	AXkV79YLdsCNNwfuV
X-Received: by 2002:a1c:a70f:: with SMTP id q15mr29224305wme.66.1584374875542;
        Mon, 16 Mar 2020 09:07:55 -0700 (PDT)
X-Received: by 2002:a1c:a70f:: with SMTP id q15mr29224211wme.66.1584374874213;
        Mon, 16 Mar 2020 09:07:54 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id u25sm215843wml.17.2020.03.16.09.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 14/19] target/arm: Restrict ARMv7 M-profile cpus to TCG accel
Date: Mon, 16 Mar 2020 17:06:29 +0100
Message-Id: <20200316160634.3386-15-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ORFMeWUFe4so

A KVM-only build won't be able to run M-profile cpus.

Only enable the following ARMv7 M-Profile CPUs when TCG is available:

  - Cortex-M3
  - Cortex-M4
  - Cortex-M33

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |   8 --
 target/arm/cpu.c                | 176 ---------------------------
 target/arm/cpu_v7m.c            | 207 ++++++++++++++++++++++++++++++++
 target/arm/Kconfig              |   1 +
 target/arm/Makefile.objs        |   1 +
 5 files changed, 209 insertions(+), 184 deletions(-)
 create mode 100644 target/arm/cpu_v7m.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 3aa27f3b40..511d74da58 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -12,19 +12,11 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
-CONFIG_HIGHBANK=3Dy
-CONFIG_MUSCA=3Dy
-CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VEXPRESS=3Dy
 CONFIG_ZYNQ=3Dy
-CONFIG_NETDUINO2=3Dy
-CONFIG_NETDUINOPLUS2=3Dy
-CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_SABRELITE=3Dy
-CONFIG_EMCRAFT_SF2=3Dy
-CONFIG_MICROBIT=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_ALLWINNER_H3=3Dy
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 84be8792f6..dfa7e64c7e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -573,31 +573,6 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)
     return true;
 }
=20
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
-{
-    CPUClass *cc =3D CPU_GET_CLASS(cs);
-    ARMCPU *cpu =3D ARM_CPU(cs);
-    CPUARMState *env =3D &cpu->env;
-    bool ret =3D false;
-
-    /* ARMv7-M interrupt masking works differently than -A or -R.
-     * There is no FIQ/IRQ distinction. Instead of I and F bits
-     * masking FIQ and IRQ interrupts, an exception is taken only
-     * if it is higher priority than the current execution priority
-     * (which depends on state like BASEPRI, FAULTMASK and the
-     * currently active exception).
-     */
-    if (interrupt_request & CPU_INTERRUPT_HARD
-        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
-        cs->exception_index =3D EXCP_IRQ;
-        cc->do_interrupt(cs);
-        ret =3D true;
-    }
-    return ret;
-}
-#endif
-
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
     /*
@@ -1834,147 +1809,6 @@ static ObjectClass *arm_cpu_class_by_name(const cha=
r *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
=20
-static void cortex_m0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-
-    cpu->midr =3D 0x410cc200;
-}
-
-static void cortex_m3_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    cpu->midr =3D 0x410fc231;
-    cpu->pmsav7_dregion =3D 8;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00000030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x00000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01141110;
-    cpu->isar.id_isar1 =3D 0x02111000;
-    cpu->isar.id_isar2 =3D 0x21112231;
-    cpu->isar.id_isar3 =3D 0x01111110;
-    cpu->isar.id_isar4 =3D 0x01310102;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m4_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x410fc240; /* r0p0 */
-    cpu->pmsav7_dregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110021;
-    cpu->isar.mvfr1 =3D 0x11000011;
-    cpu->isar.mvfr2 =3D 0x00000000;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00000030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x00000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01141110;
-    cpu->isar.id_isar1 =3D 0x02111000;
-    cpu->isar.id_isar2 =3D 0x21112231;
-    cpu->isar.id_isar3 =3D 0x01111110;
-    cpu->isar.id_isar4 =3D 0x01310102;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m7_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x411fc272; /* r1p2 */
-    cpu->pmsav7_dregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110221;
-    cpu->isar.mvfr1 =3D 0x12000011;
-    cpu->isar.mvfr2 =3D 0x00000040;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00100030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01101110;
-    cpu->isar.id_isar1 =3D 0x02112000;
-    cpu->isar.id_isar2 =3D 0x20232231;
-    cpu->isar.id_isar3 =3D 0x01111131;
-    cpu->isar.id_isar4 =3D 0x01310132;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m33_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x410fd213; /* r0p3 */
-    cpu->pmsav7_dregion =3D 16;
-    cpu->sau_sregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110021;
-    cpu->isar.mvfr1 =3D 0x11000011;
-    cpu->isar.mvfr2 =3D 0x00000040;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000210;
-    cpu->isar.id_dfr0 =3D 0x00200000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00101F40;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01101110;
-    cpu->isar.id_isar1 =3D 0x02212000;
-    cpu->isar.id_isar2 =3D 0x20232232;
-    cpu->isar.id_isar3 =3D 0x01111131;
-    cpu->isar.id_isar4 =3D 0x01310132;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-    cpu->clidr =3D 0x00000000;
-    cpu->ctr =3D 0x8000c000;
-}
-
-static void arm_v7m_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
-    CPUClass *cc =3D CPU_CLASS(oc);
-
-    acc->info =3D data;
-#ifndef CONFIG_USER_ONLY
-    cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
-#endif
-
-    cc->cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt;
-}
-
 static const ARMCPRegInfo cortexa8_cp_reginfo[] =3D {
     { .name =3D "L2LOCKDOWN", .cp =3D 15, .crn =3D 9, .crm =3D 0, .opc1 =
=3D 1, .opc2 =3D 0,
       .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
@@ -2274,16 +2108,6 @@ static void arm_max_initfn(Object *obj)
=20
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m7",   .initfn =3D cortex_m7_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m33",  .initfn =3D cortex_m33_initfn,
-                             .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
diff --git a/target/arm/cpu_v7m.c b/target/arm/cpu_v7m.c
new file mode 100644
index 0000000000..529259b9cd
--- /dev/null
+++ b/target/arm/cpu_v7m.c
@@ -0,0 +1,207 @@
+/*
+ * ARM generic helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+/* CPU models. These are not needed for the AArch64 linux-user build. */
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+
+static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
+{
+    CPUClass *cc =3D CPU_GET_CLASS(cs);
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    bool ret =3D false;
+
+    /*
+     * ARMv7-M interrupt masking works differently than -A or -R.
+     * There is no FIQ/IRQ distinction. Instead of I and F bits
+     * masking FIQ and IRQ interrupts, an exception is taken only
+     * if it is higher priority than the current execution priority
+     * (which depends on state like BASEPRI, FAULTMASK and the
+     * currently active exception).
+     */
+    if (interrupt_request & CPU_INTERRUPT_HARD
+        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
+        cs->exception_index =3D EXCP_IRQ;
+        cc->do_interrupt(cs);
+        ret =3D true;
+    }
+    return ret;
+}
+
+static void cortex_m0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+
+    cpu->midr =3D 0x410cc200;
+}
+
+static void cortex_m3_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    cpu->midr =3D 0x410fc231;
+    cpu->pmsav7_dregion =3D 8;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00000030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x00000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01141110;
+    cpu->isar.id_isar1 =3D 0x02111000;
+    cpu->isar.id_isar2 =3D 0x21112231;
+    cpu->isar.id_isar3 =3D 0x01111110;
+    cpu->isar.id_isar4 =3D 0x01310102;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m4_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x410fc240; /* r0p0 */
+    cpu->pmsav7_dregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110021;
+    cpu->isar.mvfr1 =3D 0x11000011;
+    cpu->isar.mvfr2 =3D 0x00000000;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00000030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x00000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01141110;
+    cpu->isar.id_isar1 =3D 0x02111000;
+    cpu->isar.id_isar2 =3D 0x21112231;
+    cpu->isar.id_isar3 =3D 0x01111110;
+    cpu->isar.id_isar4 =3D 0x01310102;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m7_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x411fc272; /* r1p2 */
+    cpu->pmsav7_dregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110221;
+    cpu->isar.mvfr1 =3D 0x12000011;
+    cpu->isar.mvfr2 =3D 0x00000040;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00100030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01101110;
+    cpu->isar.id_isar1 =3D 0x02112000;
+    cpu->isar.id_isar2 =3D 0x20232231;
+    cpu->isar.id_isar3 =3D 0x01111131;
+    cpu->isar.id_isar4 =3D 0x01310132;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m33_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x410fd213; /* r0p3 */
+    cpu->pmsav7_dregion =3D 16;
+    cpu->sau_sregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110021;
+    cpu->isar.mvfr1 =3D 0x11000011;
+    cpu->isar.mvfr2 =3D 0x00000040;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000210;
+    cpu->isar.id_dfr0 =3D 0x00200000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00101F40;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01101110;
+    cpu->isar.id_isar1 =3D 0x02212000;
+    cpu->isar.id_isar2 =3D 0x20232232;
+    cpu->isar.id_isar3 =3D 0x01111131;
+    cpu->isar.id_isar4 =3D 0x01310132;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+    cpu->clidr =3D 0x00000000;
+    cpu->ctr =3D 0x8000c000;
+}
+
+static void arm_v7m_class_init(ObjectClass *oc, void *data)
+{
+    ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
+    CPUClass *cc =3D CPU_CLASS(oc);
+
+    acc->info =3D data;
+#ifndef CONFIG_USER_ONLY
+    cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
+#endif
+
+    cc->cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt;
+}
+
+static const ARMCPUInfo arm_v7m_cpus[] =3D {
+    { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m7",   .initfn =3D cortex_m7_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m33",  .initfn =3D cortex_m33_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D NULL }
+};
+
+static void arm_v7m_cpu_register_types(void)
+{
+    const ARMCPUInfo *info =3D arm_v7m_cpus;
+
+    while (info->name) {
+        arm_cpu_register(info);
+        info++;
+    }
+}
+
+type_init(arm_v7m_cpu_register_types)
+
+#endif
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 9768f9180f..929e252d89 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -15,4 +15,5 @@ config ARM_V7R
     bool
=20
 config ARM_V7M
+    depends on TCG
     bool
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index a2508f0655..a0df58526b 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -72,6 +72,7 @@ obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
 obj-$(CONFIG_ARM_V5) +=3D cpu_v5.o
 obj-$(CONFIG_ARM_V6) +=3D cpu_v6.o
 obj-$(CONFIG_ARM_V7R) +=3D cpu_v7r.o
+obj-$(CONFIG_ARM_V7M) +=3D cpu_v7m.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
--=20
2.21.1
