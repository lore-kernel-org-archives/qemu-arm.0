Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250773lfe;
        Mon, 16 Mar 2020 09:07:39 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vugW3NbHgxtLRVigOPYJS2U12xkt3ejuAYp/7vLgtfbSC/usGj1hbpmG6P9vVQTfiiI8xlw
X-Received: by 2002:a1c:7f10:: with SMTP id a16mr23622153wmd.1.1584374859431;
        Mon, 16 Mar 2020 09:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374859; cv=none;
        d=google.com; s=arc-20160816;
        b=kIy0LqlR5ss0hk8q3eSBdV/N+Y+gLuPZv6fixMAnKj98V30OT6qbR7SksDt0BTvpx6
         lQbxM/u5qNUwl0TVJTixOKCEq6qlqKjqdmCKGN0shtFjkv8V1GN1DQNLg3bWDytCv/eZ
         83TvIUjYU1sBen4KL8tgjJNT2kInHvHFYM2b/9lrvZKE1PBHuIe8GGFGV0XQvzW/ivYN
         dQHyR/XLLeJdjRRP00WFkeNgUa/cQYyMhQJueayo5HaxOU1dHQsXPO07AHpYjFe5BLe1
         2J+Sohr8MMV5tFDkI9jJssZdd5PhrWrwfUxpPAXpKCoCMeuQFJBNhSH8bvNpUByz/Rng
         gUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dh0QaW36S0ly7XnA717+46Hg5QZjkgBSBDC6x6/CnNM=;
        b=AzeFj+VBnXylgMrV8tBiNU36DMHtlG+KrIHGvxV6pjxmSzEMl5bmntZUF3vf3TZckx
         hcTOcRbf9LcgaMOuggG3Dy+101lqtr+9qeccBFBseitR1afc9cqGQsnM2Vz470wOT5/Y
         DLUxiNhsPoySHZj2Xb3DzU+bKWU2CLFnjrL7k5a4cYrMcyNNDLaSg9fI8oOrhqDZSgC6
         yFEh2Xx2C98fbuyh+2rWbIrxiPdLOP0jSPG2nnpTPU3jEU3zpjWbkdy8+vVsPtldwVLX
         WpD3gGiZ8LKO1HbZwCSRXL33MYcp1bgECtGHSNRYa5ch2dssDv8lV+NaZWxrCz0uQjIS
         gmdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPfHrByt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id c18si276802wrt.344.2020.03.16.09.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KPfHrByt;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dh0QaW36S0ly7XnA717+46Hg5QZjkgBSBDC6x6/CnNM=;
	b=KPfHrByt36t+s+oOTrfWoo3/zMPi/T7JM+UcDTVEnYRsmrQ2Xw+tBmyyjKa/Cwl2bJfX/6
	/77yvsXFcBu9Wmr7GoSHa++g7YiG4SgefFfEhzgIi5FyvVnfBb+je90ouo+ODfD7uZ5s+r
	c2CfEtQLMcID8okf41fUzOs0CDbolaQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-FBRFHo2ZN5SDamJR6EdvNg-1; Mon, 16 Mar 2020 12:07:34 -0400
X-MC-Unique: FBRFHo2ZN5SDamJR6EdvNg-1
Received: by mail-wr1-f71.google.com with SMTP id c6so9182887wrm.18
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HJ4BPrTTJoaZ0DIQ+Bm5OwC5QHXxR7lFDDNNHr42oA=;
        b=hp8o2VISH539Ur8lLBRSRSXlRQjjPdAS6wu4tQmaq8kexqUB/2bQt/roMyRJILVtyH
         ccFkcs7cKQtoXhwep4W3lyHoFEXEptzJw7RnsJrd6MeTate7w1R2zojtLKY6kQ6DJrkx
         NiwIpCe0UVXlM9wJe1eTOkZzC79r4ywY4vzZOWW5Uad2iyWCuVhWhKbBc1APSjDCQxCy
         utbWLmMo00pc43v2X5iNmzXheHRqKxDoXeFYYW6RxqwDrx9BEWlP9EeCLBAgr6d75PgN
         7BnJ31yb9s0IpJFtBhPrGVD2dvPJf1tsL6ZrPHnqHJl+CF7t9nBPlcM/e6YUza+6/8KD
         2BqQ==
X-Gm-Message-State: ANhLgQ1ucE5qemnx8+ES/KVh/mpj7SESWaeQZvYJ8jc6BafvN5BL/KD6
	WLlalVrpX6g4VnQm9gFurAh0QV+0jMr3Jyrjry0jYCX79mX/m5nduLgv6O7BDMjB+2z2rKPVF1N
	BT4PiNEhb+lEO8Pg9
X-Received: by 2002:a5d:69c1:: with SMTP id s1mr47293wrw.351.1584374852711;
        Mon, 16 Mar 2020 09:07:32 -0700 (PDT)
X-Received: by 2002:a5d:69c1:: with SMTP id s1mr47263wrw.351.1584374852435;
        Mon, 16 Mar 2020 09:07:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id 127sm68345wmd.38.2020.03.16.09.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:31 -0700 (PDT)
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
Subject: [PATCH v3 10/19] target/arm: Restrict ARMv4 cpus to TCG accel
Date: Mon, 16 Mar 2020 17:06:25 +0100
Message-Id: <20200316160634.3386-11-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kbBhma7Q+gAP

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv4 CPUs when TCG is available:

  - StrongARM (SA1100/1110)
  - OMAP1510 (TI925T)

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 -
 target/arm/cpu.c                | 33 -----------------
 target/arm/cpu_v4.c             | 65 +++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                  |  2 +
 target/arm/Kconfig              |  4 ++
 target/arm/Makefile.objs        |  2 +
 6 files changed, 73 insertions(+), 35 deletions(-)
 create mode 100644 target/arm/cpu_v4.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 8b89d8c4c0..0652396296 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -17,8 +17,6 @@ CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
 CONFIG_MUSICPAL=3Dy
 CONFIG_MUSCA=3Dy
-CONFIG_CHEETAH=3Dy
-CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2813eb81a..b08b6933be 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2459,36 +2459,6 @@ static void cortex_a15_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
=20
-static void ti925t_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V4T);
-    set_feature(&cpu->env, ARM_FEATURE_OMAPCP);
-    cpu->midr =3D ARM_CPUID_TI925T;
-    cpu->ctr =3D 0x5109149;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
-static void sa1100_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "intel,sa1100";
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x4401A11B;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
-static void sa1110_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x6901B119;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
 static void pxa250_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2727,9 +2697,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
     { .name =3D "cortex-a15",  .initfn =3D cortex_a15_initfn },
-    { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
-    { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
-    { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
     { .name =3D "pxa250",      .initfn =3D pxa250_initfn },
     { .name =3D "pxa255",      .initfn =3D pxa255_initfn },
     { .name =3D "pxa260",      .initfn =3D pxa260_initfn },
diff --git a/target/arm/cpu_v4.c b/target/arm/cpu_v4.c
new file mode 100644
index 0000000000..1de00a03ee
--- /dev/null
+++ b/target/arm/cpu_v4.c
@@ -0,0 +1,65 @@
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
+static void ti925t_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V4T);
+    set_feature(&cpu->env, ARM_FEATURE_OMAPCP);
+    cpu->midr =3D ARM_CPUID_TI925T;
+    cpu->ctr =3D 0x5109149;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static void sa1100_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "intel,sa1100";
+    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x4401A11B;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static void sa1110_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x6901B119;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static const ARMCPUInfo arm_v4_cpus[] =3D {
+    { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
+    { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
+    { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
+    { .name =3D NULL }
+};
+
+static void arm_v4_cpu_register_types(void)
+{
+    const ARMCPUInfo *info =3D arm_v4_cpus;
+
+    while (info->name) {
+        arm_cpu_register(info);
+        info++;
+    }
+}
+
+type_init(arm_v4_cpu_register_types)
+
+#endif
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e3d7e7694a..7fc0cff776 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -28,6 +28,7 @@ config ARM_VIRT
=20
 config CHEETAH
     bool
+    select ARM_V4
     select OMAP
     select TSC210X
=20
@@ -242,6 +243,7 @@ config COLLIE
=20
 config SX1
     bool
+    select ARM_V4
     select OMAP
=20
 config VERSATILE
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index e68c71a6ff..0d496d318a 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,2 +1,6 @@
+config ARM_V4
+    depends on TCG
+    bool
+
 config ARM_V7M
     bool
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index fa278bb4c1..bc0f63ebbc 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -68,6 +68,8 @@ obj-y +=3D crypto_helper.o
 obj-y +=3D iwmmxt_helper.o vec_helper.o neon_helper.o
 obj-y +=3D m_helper.o
=20
+obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
+
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
 obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
--=20
2.21.1
