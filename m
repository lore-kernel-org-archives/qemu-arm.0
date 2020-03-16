Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp250986lfe;
        Mon, 16 Mar 2020 09:07:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vukaj9rMcZgU3WrSvo5JCAJqPPpHqxO6IKgXAwQaJ3PBiEh5c4x3EkS5pUHqV29cB2NhUrj
X-Received: by 2002:a19:c116:: with SMTP id r22mr60577lff.123.1584374869745;
        Mon, 16 Mar 2020 09:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374869; cv=none;
        d=google.com; s=arc-20160816;
        b=MXs5KzrX62lgNJsgsRJcZp0WkG/XFWmOs4fvb7DxHYWV1lyMZzQo0n8GIe39Z6nVDc
         zX3FkgAG8fNLm+z1zW5Ngf4Rk9Y1rG71w6UO00MY/TFABE4rC/YDbOD303ekVsZQxkve
         fs8Ee3nUM8FbCu+my4qn5d7E5cumYdxcaQ7fb59iXOP/1mvQUHs1+md1N9tAFwfd69yV
         4hdOwROBNlXPuEFWH2FLpnKT/SnPoRDjlNwjGBTFSJ73mfCdG/DeU17cc5pey/OY2+EG
         elRdTYHsFlLe7DPx3r1qfCvPbTvsqcfvjbavnfnoDreSYlO5+s7bmv31BukhJWAGrEkW
         Q0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Bev69B8UQo4K2rDxR5YSrNIDlGaBvtKUt0JmYj+W6cM=;
        b=OpaHeuVlnxc/nkUv2iX9GmpZZOER2P/LwIwi1aC3LfHXdvvSS8KpCkMbzWGMryoBn4
         Ix26IeBSNUkUJGy/bY3CHxsrPNXBujyttWd2C5g9Bd9lvDTD9rdCD9nBxueKozPIW1fq
         se/G+cv6BQDL5vgM+KHt0g2H5f8dZNvaJEZrdqevWEWWVUCcNOnc8hCh+F5krfK/3cQA
         OjYV56zuyqYeADO/AIRV+XH5OeEj9X2cyC5kwjWbibODKW8X7CceBi06NNgYkelKbMwG
         gHoNy/bh4RvuZfLWfdVlPejt0lksMKcTaT+4hXGcrI96KIubeRKecOjBtwJ6u+YCvvXf
         FpPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qbr2lMqg;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [216.205.24.74])
        by mx.google.com with ESMTPS id 9si241489ljr.305.2020.03.16.09.07.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) client-ip=216.205.24.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Qbr2lMqg;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bev69B8UQo4K2rDxR5YSrNIDlGaBvtKUt0JmYj+W6cM=;
	b=Qbr2lMqgdzIfkpg+MKGyxhDIPGWksKZRwfeFyJpwszf52MZHV6giCAakpHtQNz9Rtaay22
	rmiFI6CG6gpgJG8HAuym6Dlam0+iH6HQKBW8uGmeKQGEID57pdhAiHbUKcurfiT/lNvT1s
	LEmQi4gi0h2lvmyq/O4tI+RZrhP6kDY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-c-WA7gKENGCWlPSkBjVOVQ-1; Mon, 16 Mar 2020 12:07:45 -0400
X-MC-Unique: c-WA7gKENGCWlPSkBjVOVQ-1
Received: by mail-wm1-f72.google.com with SMTP id a23so5992394wmm.8
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wL60xHob88fQ7VIPeFS5XLuacMMTzsdimp2PvDIHEac=;
        b=bTt56T+8LO3lwDa8OoVM8VYTal4/sz7H7vMEyZFNCh+bRrosp0bKjxQ+rI4SrJStjc
         Pgaza2xEGupc5DYRuoAVX6tgj1Ugv1cPJ8PTdZymQhBSGhi2v2ww+Pw7peOixZTG752F
         mG8hZOU5yr68ev9UBWR5/pKrs4zj+C9H+Nzm9ox/65a1sR+O/qPefZA9Vgr7S+Zwkhdp
         DdAGP4YAT9AKGpKZTx6RNZ4QWDxtixX7k4zjoT7g7cvHo8DMVpGTdIaj9cfM/8uHYj/c
         tLcSNwbbXGZfJE736NPCUc0suw8EB5t4Oe84gpj15p5TiOJp0FhhwgCs2mjRVfAeM2ol
         DATQ==
X-Gm-Message-State: ANhLgQ0/fAX0BKP0oXZq7v2s5nTMNDMQoQMIOkjDcZVC+PQF5nwZGVyA
	y6IC9gZAYjcACZ2y6vx51a/YCeI1CnQ74Saale7osA6ND22eqaNuyqwGTzK5PlE1XFKCr5kWy3j
	V6F5nGvw7nZtjKgYK
X-Received: by 2002:a1c:7e57:: with SMTP id z84mr27973266wmc.148.1584374863912;
        Mon, 16 Mar 2020 09:07:43 -0700 (PDT)
X-Received: by 2002:a1c:7e57:: with SMTP id z84mr27973218wmc.148.1584374863467;
        Mon, 16 Mar 2020 09:07:43 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id 96sm549814wrm.63.2020.03.16.09.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:42 -0700 (PDT)
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
Subject: [PATCH v3 12/19] target/arm: Restrict ARMv6 cpus to TCG accel
Date: Mon, 16 Mar 2020 17:06:27 +0100
Message-Id: <20200316160634.3386-13-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /UWjQ9OXPxJ+

KVM requires a cpu based on (at least) the ARMv7 architecture.

Only enable the following ARMv6 CPUs when TCG is available:

  - ARM1136
  - ARM1176
  - ARM11MPCore
  - Cortex-M0

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |   2 -
 target/arm/cpu.c                | 137 -------------------------
 target/arm/cpu_v6.c             | 171 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                  |   2 +
 target/arm/Kconfig              |   4 +
 target/arm/Makefile.objs        |   1 +
 6 files changed, 178 insertions(+), 139 deletions(-)
 create mode 100644 target/arm/cpu_v6.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index f176a98296..3aa27f3b40 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -13,9 +13,7 @@ CONFIG_ARM_VIRT=3Dy
 CONFIG_CUBIEBOARD=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
-CONFIG_FSL_IMX31=3Dy
 CONFIG_MUSCA=3Dy
-CONFIG_NSERIES=3Dy
 CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VEXPRESS=3Dy
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f1d1ba8451..34908828a0 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1834,135 +1834,6 @@ static ObjectClass *arm_cpu_class_by_name(const cha=
r *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
=20
-static void arm1136_r2_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    /* What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
-     * older core than plain "arm1136". In particular this does not
-     * have the v6K features.
-     * These ID register values are correct for 1136 but may be wrong
-     * for 1136_r2 (in particular r0p2 does not actually implement most
-     * of the ID registers).
-     */
-
-    cpu->dtb_compatible =3D "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr =3D 0x4107b362;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0x2;
-    cpu->id_afr0 =3D 0x3;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222110;
-    cpu->isar.id_isar0 =3D 0x00140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231111;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm1136_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr =3D 0x4117b363;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0x2;
-    cpu->id_afr0 =3D 0x3;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222110;
-    cpu->isar.id_isar0 =3D 0x00140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231111;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm1176_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1176";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    cpu->midr =3D 0x410fb767;
-    cpu->reset_fpsid =3D 0x410120b5;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x11;
-    cpu->isar.id_dfr0 =3D 0x33;
-    cpu->id_afr0 =3D 0;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222100;
-    cpu->isar.id_isar0 =3D 0x0140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231121;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x01141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm11mpcore_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm11mpcore";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_MPIDR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x410fb022;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1d192992; /* 32K icache 32K dcache */
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0;
-    cpu->id_afr0 =3D 0x2;
-    cpu->isar.id_mmfr0 =3D 0x01100103;
-    cpu->isar.id_mmfr1 =3D 0x10020302;
-    cpu->isar.id_mmfr2 =3D 0x01222000;
-    cpu->isar.id_isar0 =3D 0x00100011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11221011;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 1;
-}
-
 static void cortex_m0_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -2452,14 +2323,6 @@ static void arm_max_initfn(Object *obj)
=20
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    /* What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
-     * older core than plain "arm1136". In particular this does not
-     * have the v6K features.
-     */
-    { .name =3D "arm1136-r2",  .initfn =3D arm1136_r2_initfn },
-    { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
-    { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
-    { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
     { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
diff --git a/target/arm/cpu_v6.c b/target/arm/cpu_v6.c
new file mode 100644
index 0000000000..1c73c881f3
--- /dev/null
+++ b/target/arm/cpu_v6.c
@@ -0,0 +1,171 @@
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
+static void arm1136_r2_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    /*
+     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
+     * older core than plain "arm1136". In particular this does not
+     * have the v6K features.
+     * These ID register values are correct for 1136 but may be wrong
+     * for 1136_r2 (in particular r0p2 does not actually implement most
+     * of the ID registers).
+     */
+
+    cpu->dtb_compatible =3D "arm,arm1136";
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    cpu->midr =3D 0x4107b362;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0x2;
+    cpu->id_afr0 =3D 0x3;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222110;
+    cpu->isar.id_isar0 =3D 0x00140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231111;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm1136_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1136";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    cpu->midr =3D 0x4117b363;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0x2;
+    cpu->id_afr0 =3D 0x3;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222110;
+    cpu->isar.id_isar0 =3D 0x00140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231111;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm1176_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1176";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VAPA);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->midr =3D 0x410fb767;
+    cpu->reset_fpsid =3D 0x410120b5;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x11;
+    cpu->isar.id_dfr0 =3D 0x33;
+    cpu->id_afr0 =3D 0;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222100;
+    cpu->isar.id_isar0 =3D 0x0140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231121;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x01141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm11mpcore_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm11mpcore";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VAPA);
+    set_feature(&cpu->env, ARM_FEATURE_MPIDR);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x410fb022;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1d192992; /* 32K icache 32K dcache */
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0;
+    cpu->id_afr0 =3D 0x2;
+    cpu->isar.id_mmfr0 =3D 0x01100103;
+    cpu->isar.id_mmfr1 =3D 0x10020302;
+    cpu->isar.id_mmfr2 =3D 0x01222000;
+    cpu->isar.id_isar0 =3D 0x00100011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11221011;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 1;
+}
+
+static const ARMCPUInfo arm_v6_cpus[] =3D {
+    /*
+     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e.
+     * an older core than plain "arm1136". In particular this does
+     * not have the v6K features.
+     */
+    { .name =3D "arm1136-r2",  .initfn =3D arm1136_r2_initfn },
+    { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
+    { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
+    { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
+    { .name =3D NULL }
+};
+
+static void arm_v6_cpu_register_types(void)
+{
+    const ARMCPUInfo *info =3D arm_v6_cpus;
+
+    while (info->name) {
+        arm_cpu_register(info);
+        info++;
+    }
+}
+
+type_init(arm_v6_cpu_register_types)
+
+#endif
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3b78471de0..e87dd611f2 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -113,6 +113,7 @@ config NETDUINOPLUS2
=20
 config NSERIES
     bool
+    select ARM_V6
     select OMAP
     select TMP105   # tempature sensor
     select BLIZZARD # LCD/TV controller
@@ -367,6 +368,7 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select ARM_V6
     select SERIAL
     select IMX
     select IMX_I2C
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 028d8382fe..df5f8dff42 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -6,5 +6,9 @@ config ARM_V5
     depends on TCG
     bool
=20
+config ARM_V6
+    depends on TCG
+    bool
+
 config ARM_V7M
     bool
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index f66f7f1158..0473c559c6 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -70,6 +70,7 @@ obj-y +=3D m_helper.o
=20
 obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
 obj-$(CONFIG_ARM_V5) +=3D cpu_v5.o
+obj-$(CONFIG_ARM_V6) +=3D cpu_v6.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
--=20
2.21.1
