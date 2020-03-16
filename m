Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250860lfe;
        Mon, 16 Mar 2020 09:07:43 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsDgv4nJaeCrkY2kxQeSkm3tRtNnXh8iIc5CGu7AVmSU3Q0X3vF9QoQ3rPs3OJBYg3CvNcN
X-Received: by 2002:adf:b245:: with SMTP id y5mr104587wra.136.1584374863657;
        Mon, 16 Mar 2020 09:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374863; cv=none;
        d=google.com; s=arc-20160816;
        b=w4nJ7uhmltrPfnI7Gt+d/t9pC5M+qGLZ1RiM672+KUR6obTSSqp4+4KUK//VaRdCGe
         0tiaXOuGaqzSAtvLtbEqXmOKu8M7vxy/O/bIgTdAl8nzBdtb/GZY3GskHjTatHmkhp+d
         W1u8eOuNaSlzH71sbMD6UUyYhS8fW0oUApHLIbIc67Jhtg/B959Zvo9qvQuWmeUiHoMj
         8T+9FoTuzxWjCbjCUt4NcGb4zYukkpZ9qvmltKpzZdZ52XK+wFbijHzx8M4B3BAHtlpX
         nZgLNyXpbjFzXh8QIZDYchZMYpTC2BGb7aHTpfJ3pWA5oiMXBlHk10YidNXlRyeUK0WC
         yveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=E6imTlgemnO4l8fO3+EjkoMb/LcYFsVXBVbYJMCxv6M=;
        b=C0z/Q6z1VFql8xESTBag+iNyFrffPV3J38N7pYnKwmosbT2nH1Wuvw02rJns6A5+mB
         debR0bSs5epODnnqIwmS4+1fU0h0EVdNZZWjLgvHtbeeaEhrD2p8OdPyZr3NBBXrsi+B
         7iumT/GMnipUUN4sDqGm4OIip0ntzxmhL19CtjrEpp6e+Hv4v6b8uK6aaGJuVd+uK52v
         pBUF+E5Ib+7iO7NYa5TqyOxFrXst0aIwXfR1d7Jq/aNW8VvggusBqsf6wIrrm0/sUzLL
         OV/ScfLNBhDfqsR6fynABzVebNvRGENRTMSUSqmMlnhOexp6+bDRSK2jvGQ8Yei3t080
         0f8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrzWGe6k;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id p4si306046wrq.135.2020.03.16.09.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JrzWGe6k;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6imTlgemnO4l8fO3+EjkoMb/LcYFsVXBVbYJMCxv6M=;
	b=JrzWGe6kAuWn3DbWvMkrComqzbM6EKxXhl3Dl7TenCr1GFADXPMFEtI/YD5KHRDY3ukHq6
	8edHrnXs7d9En5dhGxcddt+esn7nYCS9GwAJ0+0ikswRW7/CQSHudh9k+MfFukS/+bzG1T
	7Yz6LZtCQZJfwOF79KN5K2B5B2CYSR4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-XPdfUhGIPBSzfg8MuIfU_A-1; Mon, 16 Mar 2020 12:07:40 -0400
X-MC-Unique: XPdfUhGIPBSzfg8MuIfU_A-1
Received: by mail-wr1-f70.google.com with SMTP id 94so4577325wrr.3
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UM67HGSwESPGxRuh3RiuHLraRXWOuFjnUtJ3FzN+nLQ=;
        b=KOFUEbcMlqlm4XN3E+MfyaNgYXVi4uUM8E6rlOKs/UUxvMf6qBk06eXTlYabC85Gwj
         2wepKPUZnaKlWv0haWjKbHnWgCInD8vguhim7TLjsNpJht+qyqrBmqgsQFRxXUYifkIQ
         4wCbHuthwYeaZNkNwMVqwcLONfs5C+/IZ2RDp9qOYGccMq8xBuF5oAgBm5zs5XBayJK/
         22BxgZIMb3KN+oKxqKbf1tfTX9YvARW8WWcwEeKVT1MBY4m5SWK9VNcrPiGxO6mraNa2
         Bw6+DlIzBk1ZCjfmPXnJOrT0vgv7bUWmU5MsQmk/93CwJWLkOKZBOxvz7OZawJuKgdOL
         SRsA==
X-Gm-Message-State: ANhLgQ0xYJvPHWHcAeMOn1jja28DyKeCGSe6AttlG/c67fzNqmjxYKps
	UQkSt5VuUsc4I5gXMMeUcn/IbrPUpO0ehh2aQC3mXRxdQVOFO/rtivG1V/Ugj3nMfl+KXwsR+MI
	mnzEQlPIRbLzdDGcf
X-Received: by 2002:adf:83c4:: with SMTP id 62mr73129wre.105.1584374858397;
        Mon, 16 Mar 2020 09:07:38 -0700 (PDT)
X-Received: by 2002:adf:83c4:: with SMTP id 62mr73091wre.105.1584374857928;
        Mon, 16 Mar 2020 09:07:37 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id w204sm241548wma.1.2020.03.16.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:37 -0700 (PDT)
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
Subject: [PATCH v3 11/19] target/arm: Restrict ARMv5 cpus to TCG accel
Date: Mon, 16 Mar 2020 17:06:26 +0100
Message-Id: <20200316160634.3386-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: RZ8d2TddljGW

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv5 CPUs when TCG is available:

  - ARM926
  - ARM946
  - ARM1026
  - XScale (PXA250/255/260/261/262/270)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |  12 --
 target/arm/cpu.c                | 234 ----------------------------
 target/arm/cpu_v5.c             | 266 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                  |   7 +
 target/arm/Kconfig              |   4 +
 target/arm/Makefile.objs        |   1 +
 6 files changed, 278 insertions(+), 246 deletions(-)
 create mode 100644 target/arm/cpu_v5.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 0652396296..f176a98296 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -13,32 +13,20 @@ CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
-CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
-CONFIG_MUSICPAL=3Dy
 CONFIG_MUSCA=3Dy
 CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
-CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
 CONFIG_ZYNQ=3Dy
-CONFIG_MAINSTONE=3Dy
-CONFIG_GUMSTIX=3Dy
-CONFIG_SPITZ=3Dy
-CONFIG_TOSA=3Dy
-CONFIG_Z2=3Dy
-CONFIG_COLLIE=3Dy
-CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_NETDUINOPLUS2=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
 CONFIG_MICROBIT=3Dy
-CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
 CONFIG_ALLWINNER_H3=3Dy
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index b08b6933be..f1d1ba8451 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1834,86 +1834,6 @@ static ObjectClass *arm_cpu_class_by_name(const char=
 *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
=20
-static void arm926_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm926";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr =3D 0x41069265;
-    cpu->reset_fpsid =3D 0x41011090;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00090078;
-
-    /*
-     * ARMv5 does not have the ID_ISAR registers, but we can still
-     * set the field to indicate Jazelle support within QEMU.
-     */
-    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
-    /*
-     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
-     * support even though ARMv5 doesn't have this register.
-     */
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
-}
-
-static void arm946_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm946";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x41059461;
-    cpu->ctr =3D 0x0f004006;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void arm1026_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1026";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr =3D 0x4106a262;
-    cpu->reset_fpsid =3D 0x410110a0;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00090078;
-    cpu->reset_auxcr =3D 1;
-
-    /*
-     * ARMv5 does not have the ID_ISAR registers, but we can still
-     * set the field to indicate Jazelle support within QEMU.
-     */
-    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
-    /*
-     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
-     * support even though ARMv5 doesn't have this register.
-     */
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
-
-    {
-        /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0=
,2 */
-        ARMCPRegInfo ifar =3D {
-            .name =3D "IFAR", .cp =3D 15, .crn =3D 6, .crm =3D 0, .opc1 =
=3D 0, .opc2 =3D 1,
-            .access =3D PL1_RW,
-            .fieldoffset =3D offsetof(CPUARMState, cp15.ifar_ns),
-            .resetvalue =3D 0
-        };
-        define_one_arm_cp_reg(cpu, &ifar);
-    }
-}
-
 static void arm1136_r2_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2459,144 +2379,6 @@ static void cortex_a15_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
=20
-static void pxa250_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052100;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa255_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d00;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa260_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052903;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa261_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d05;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa262_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d06;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270a0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054110;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270a1_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054111;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270b0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054112;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270b1_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054113;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270c0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054114;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270c5_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054117;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
 #ifndef TARGET_AARCH64
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this ho=
st);
  * otherwise, a CPU with as many features enabled as our emulation support=
s.
@@ -2670,9 +2452,6 @@ static void arm_max_initfn(Object *obj)
=20
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    { .name =3D "arm926",      .initfn =3D arm926_initfn },
-    { .name =3D "arm946",      .initfn =3D arm946_initfn },
-    { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
     /* What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
      * older core than plain "arm1136". In particular this does not
      * have the v6K features.
@@ -2697,19 +2476,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
     { .name =3D "cortex-a15",  .initfn =3D cortex_a15_initfn },
-    { .name =3D "pxa250",      .initfn =3D pxa250_initfn },
-    { .name =3D "pxa255",      .initfn =3D pxa255_initfn },
-    { .name =3D "pxa260",      .initfn =3D pxa260_initfn },
-    { .name =3D "pxa261",      .initfn =3D pxa261_initfn },
-    { .name =3D "pxa262",      .initfn =3D pxa262_initfn },
-    /* "pxa270" is an alias for "pxa270-a0" */
-    { .name =3D "pxa270",      .initfn =3D pxa270a0_initfn },
-    { .name =3D "pxa270-a0",   .initfn =3D pxa270a0_initfn },
-    { .name =3D "pxa270-a1",   .initfn =3D pxa270a1_initfn },
-    { .name =3D "pxa270-b0",   .initfn =3D pxa270b0_initfn },
-    { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
-    { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
-    { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
 #ifndef TARGET_AARCH64
     { .name =3D "max",         .initfn =3D arm_max_initfn },
 #endif
diff --git a/target/arm/cpu_v5.c b/target/arm/cpu_v5.c
new file mode 100644
index 0000000000..7a231ef649
--- /dev/null
+++ b/target/arm/cpu_v5.c
@@ -0,0 +1,266 @@
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
+static void arm926_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm926";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    cpu->midr =3D 0x41069265;
+    cpu->reset_fpsid =3D 0x41011090;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00090078;
+
+    /*
+     * ARMv5 does not have the ID_ISAR registers, but we can still
+     * set the field to indicate Jazelle support within QEMU.
+     */
+    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
+     * support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+}
+
+static void arm946_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm946";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x41059461;
+    cpu->ctr =3D 0x0f004006;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void arm1026_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1026";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    cpu->midr =3D 0x4106a262;
+    cpu->reset_fpsid =3D 0x410110a0;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00090078;
+    cpu->reset_auxcr =3D 1;
+
+    /*
+     * ARMv5 does not have the ID_ISAR registers, but we can still
+     * set the field to indicate Jazelle support within QEMU.
+     */
+    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
+     * support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+
+    {
+        /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0=
,2 */
+        ARMCPRegInfo ifar =3D {
+            .name =3D "IFAR", .cp =3D 15, .crn =3D 6, .crm =3D 0, .opc1 =
=3D 0, .opc2 =3D 1,
+            .access =3D PL1_RW,
+            .fieldoffset =3D offsetof(CPUARMState, cp15.ifar_ns),
+            .resetvalue =3D 0
+        };
+        define_one_arm_cp_reg(cpu, &ifar);
+    }
+}
+
+static void pxa250_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052100;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa255_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d00;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa260_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052903;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa261_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d05;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa262_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d06;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270a0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054110;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270a1_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054111;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270b0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054112;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270b1_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054113;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270c0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054114;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270c5_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054117;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static const ARMCPUInfo arm_v5_cpus[] =3D {
+    { .name =3D "arm926",      .initfn =3D arm926_initfn },
+    { .name =3D "arm946",      .initfn =3D arm946_initfn },
+    { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
+    { .name =3D "pxa250",      .initfn =3D pxa250_initfn },
+    { .name =3D "pxa255",      .initfn =3D pxa255_initfn },
+    { .name =3D "pxa260",      .initfn =3D pxa260_initfn },
+    { .name =3D "pxa261",      .initfn =3D pxa261_initfn },
+    { .name =3D "pxa262",      .initfn =3D pxa262_initfn },
+    /* "pxa270" is an alias for "pxa270-a0" */
+    { .name =3D "pxa270",      .initfn =3D pxa270a0_initfn },
+    { .name =3D "pxa270-a0",   .initfn =3D pxa270a0_initfn },
+    { .name =3D "pxa270-a1",   .initfn =3D pxa270a1_initfn },
+    { .name =3D "pxa270-b0",   .initfn =3D pxa270b0_initfn },
+    { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
+    { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
+    { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
+    { .name =3D NULL }
+};
+
+static void arm_v5_cpu_register_types(void)
+{
+    const ARMCPUInfo *info =3D arm_v5_cpus;
+
+    while (info->name) {
+        arm_cpu_register(info);
+        info++;
+    }
+}
+
+type_init(arm_v5_cpu_register_types)
+
+#endif
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7fc0cff776..3b78471de0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -38,6 +38,7 @@ config CUBIEBOARD
=20
 config DIGIC
     bool
+    select ARM_V5
     select PTIMER
     select PFLASH_CFI02
=20
@@ -67,6 +68,7 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_V5
     select ARM_TIMER
     select INTEGRATOR_DEBUG
     select PL011 # UART
@@ -93,6 +95,7 @@ config MUSCA
=20
 config MUSICPAL
     bool
+    select ARM_V5
     select BITBANG_I2C
     select MARVELL_88W8618
     select PTIMER
@@ -132,6 +135,7 @@ config OMAP
=20
 config PXA2XX
     bool
+    select ARM_V5
     select FRAMEBUFFER
     select I2C
     select SERIAL
@@ -248,6 +252,7 @@ config SX1
=20
 config VERSATILE
     bool
+    select ARM_V5
     select ARM_TIMER # sp804
     select PFLASH_CFI01
     select LSI_SCSI_PCI
@@ -354,6 +359,7 @@ config XLNX_VERSAL
=20
 config FSL_IMX25
     bool
+    select ARM_V5
     select IMX
     select IMX_FEC
     select IMX_I2C
@@ -376,6 +382,7 @@ config FSL_IMX6
=20
 config ASPEED_SOC
     bool
+    select ARM_V5
     select DS1338
     select FTGMAC100
     select I2C
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 0d496d318a..028d8382fe 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -2,5 +2,9 @@ config ARM_V4
     depends on TCG
     bool
=20
+config ARM_V5
+    depends on TCG
+    bool
+
 config ARM_V7M
     bool
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index bc0f63ebbc..f66f7f1158 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -69,6 +69,7 @@ obj-y +=3D iwmmxt_helper.o vec_helper.o neon_helper.o
 obj-y +=3D m_helper.o
=20
 obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
+obj-$(CONFIG_ARM_V5) +=3D cpu_v5.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
--=20
2.21.1
