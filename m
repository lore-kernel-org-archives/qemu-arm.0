Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251052lfe;
        Mon, 16 Mar 2020 09:07:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuEp3o4gK1bXS6MYEIG4+UwTJqKAJPoliksMd+DXr2R6twRz/YLEpCvMrW1BHBCK+hJG75j
X-Received: by 2002:a05:6902:702:: with SMTP id k2mr421982ybt.127.1584374873720;
        Mon, 16 Mar 2020 09:07:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374873; cv=none;
        d=google.com; s=arc-20160816;
        b=0CHA5duUko3oT/fRVWQTJXL2qj3VgzkU3swTHKrSQ8segDGtvKx2sFeFJLTVmnGdC5
         j6Xa9pQWVZDV3HuM1VhioOSEYb2vRiTwg3I6jGCIR9wIa5d5SRi7JF0knLIF3GZZWNlN
         gLwCoGWZOLuUcllK831BwL3PRSZkj0Nik8B3aTpwAUYIpfnNTdgXRVJQqD3MhQWFO6KV
         HRO97m3xZYo/vwh4+AHr0dS0kKpAhvJ51A4wCes9S7qATMKSPjNogr5qL6uv3mcMxeLD
         hPi8VfynmXkT6eRsq/dvGg7mJpMwfe5MZ2OUZ6ad7dc6f1l/iqyOtOtvkTvpu+YWov8Y
         CZ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=x0ZyIeVBAofuqhcgRt+fU6Yvdf8+u5Qk+4HNNCwjbvc=;
        b=r4WIQdeXjzZzRt41y1dIA+KE1Qda/pyIAkEJwIi1otVdyfcA+yyscxdRb2IgtpfAPD
         xdHgNtm1VGkedRug9cQB3TrGOueyZRh+aBxT57jH59SbTPyDrze9vC623FX84Zc5pjUq
         c761zoLgdoEsGjD4VRl8gFa6KUHJJfBbMy3TjNBEt3yPJILyibIbsku4Wa4ks4Ih8wx9
         azifHGFdufxSqYyhmbUQ8W6B8UuyKxoDeEIsJdQ8YOTzeS7KM4aFw3MhpiFPhtNgDmMm
         Gd1gRh3XBZ47r2bueQA198682y/rGbr6fK2TGCK+WnRqkJ9WfvJLnScFlWlqr0Hsz69o
         Hz0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z4ql9nBJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id b137si135645yba.157.2020.03.16.09.07.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:07:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z4ql9nBJ;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0ZyIeVBAofuqhcgRt+fU6Yvdf8+u5Qk+4HNNCwjbvc=;
	b=Z4ql9nBJD3fpU1NRPnTdG1aIRP6EckujvO+svDWkstluOd7S1BlxJ9XRA+XJ4iuAkEuSYQ
	5kOqe9sIpONn7KOjMEgW4GL9cpy6Pv0qZsYxwoT8woU6XiFqvzXSb2GtZlez9IkIJGu5Cu
	7xnWFAyIMMGDukthstB+mEGnaW92e1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-bWLp6xk-No6pk2ydZ9wSJQ-1; Mon, 16 Mar 2020 12:07:50 -0400
X-MC-Unique: bWLp6xk-No6pk2ydZ9wSJQ-1
Received: by mail-wr1-f69.google.com with SMTP id g4so1600592wrv.12
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruq5flSyrIJQ0ARl8BHVFpMVJrCuW/pkqeZBiZJSNHg=;
        b=Gw11NIVSUvHM9Bq2JeaPLe6lHkagUGZNaUNtU0p3xhZLD66tE4Zr2u2FwLl+QDitUK
         hCuDOjdxHzeM3IY69TWf4jBVPqhHjPBOZQL13p1AVASOorJnC6nH8FsQ5EIropN9KQli
         lfuTOZ4ngw3I9ybi0wvOAWNifcxlKJCXPX0k6WK01amlLe8jVwaiBYW3W3lKlCHLkFqF
         /misMOzAHaPkiI1prC6k3vnpak0Wc1PsWwl+4tsLwP75G65iRxzxhD4aNK3gwlsNKp8j
         zuYsLJ2xGxtf9pWw7KCse7216WzWgvWwQbdxI/jY/hiKGezQ3Tmoz7D9GfzEcg48YQ28
         DDTw==
X-Gm-Message-State: ANhLgQ15r5VAiW97hlQiMah1tbn+KlWbEFL+K4oZdBSlZSaeo3VYeoEa
	uYdZIfM831Le2Ytj92xxHUPG84cuu7U/6zEN1fW13P+NGdocXfhq0BLp881gaxiHYyZfeg7X0D+
	1J5VH2M2jvVT11PYr
X-Received: by 2002:a5d:5089:: with SMTP id a9mr63911wrt.187.1584374869132;
        Mon, 16 Mar 2020 09:07:49 -0700 (PDT)
X-Received: by 2002:a5d:5089:: with SMTP id a9mr63883wrt.187.1584374868815;
        Mon, 16 Mar 2020 09:07:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id k9sm494508wrd.74.2020.03.16.09.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:48 -0700 (PDT)
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
Subject: [PATCH v3 13/19] target/arm: Restrict ARMv7 R-profile cpus to TCG accel
Date: Mon, 16 Mar 2020 17:06:28 +0100
Message-Id: <20200316160634.3386-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: i8wUZ/xaP4fr

A KVM-only build won't be able to run R-profile cpus.

Only enable the following ARMv7 R-Profile CPUs when TCG is available:

  - Cortex-R5
  - Cortex-R5F

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  1 -
 target/arm/cpu.c                    | 51 ------------------
 target/arm/cpu_v7r.c                | 83 +++++++++++++++++++++++++++++
 hw/arm/Kconfig                      |  1 +
 target/arm/Kconfig                  |  4 ++
 target/arm/Makefile.objs            |  1 +
 6 files changed, 89 insertions(+), 52 deletions(-)
 create mode 100644 target/arm/cpu_v7r.c

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-=
softmmu.mak
index 958b1e08e4..a4202f5681 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,6 +3,5 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
=20
-CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
 CONFIG_SBSA_REF=3Dy
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 34908828a0..84be8792f6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1975,55 +1975,6 @@ static void arm_v7m_class_init(ObjectClass *oc, void=
 *data)
     cc->cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt;
 }
=20
-static const ARMCPRegInfo cortexr5_cp_reginfo[] =3D {
-    /* Dummy the TCM region regs for the moment */
-    { .name =3D "ATCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 0,
-      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
-    { .name =3D "BTCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 1,
-      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
-    { .name =3D "DCACHE_INVAL", .cp =3D 15, .opc1 =3D 0, .crn =3D 15, .crm=
 =3D 5,
-      .opc2 =3D 0, .access =3D PL1_W, .type =3D ARM_CP_NOP },
-    REGINFO_SENTINEL
-};
-
-static void cortex_r5_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr =3D 0x411fc153; /* r1p3 */
-    cpu->id_pfr0 =3D 0x0131;
-    cpu->id_pfr1 =3D 0x001;
-    cpu->isar.id_dfr0 =3D 0x010400;
-    cpu->id_afr0 =3D 0x0;
-    cpu->isar.id_mmfr0 =3D 0x0210030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01200000;
-    cpu->isar.id_mmfr3 =3D 0x0211;
-    cpu->isar.id_isar0 =3D 0x02101111;
-    cpu->isar.id_isar1 =3D 0x13112111;
-    cpu->isar.id_isar2 =3D 0x21232141;
-    cpu->isar.id_isar3 =3D 0x01112131;
-    cpu->isar.id_isar4 =3D 0x0010142;
-    cpu->isar.id_isar5 =3D 0x0;
-    cpu->isar.id_isar6 =3D 0x0;
-    cpu->mp_is_up =3D true;
-    cpu->pmsav7_dregion =3D 16;
-    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
-}
-
-static void cortex_r5f_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cortex_r5_initfn(obj);
-    cpu->isar.mvfr0 =3D 0x10110221;
-    cpu->isar.mvfr1 =3D 0x00000011;
-}
-
 static const ARMCPRegInfo cortexa8_cp_reginfo[] =3D {
     { .name =3D "L2LOCKDOWN", .cp =3D 15, .crn =3D 9, .crm =3D 0, .opc1 =
=3D 1, .opc2 =3D 0,
       .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
@@ -2333,8 +2284,6 @@ static const ARMCPUInfo arm_cpus[] =3D {
                              .class_init =3D arm_v7m_class_init },
     { .name =3D "cortex-m33",  .initfn =3D cortex_m33_initfn,
                              .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
-    { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },
     { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
diff --git a/target/arm/cpu_v7r.c b/target/arm/cpu_v7r.c
new file mode 100644
index 0000000000..9576844b5c
--- /dev/null
+++ b/target/arm/cpu_v7r.c
@@ -0,0 +1,83 @@
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
+static const ARMCPRegInfo cortexr5_cp_reginfo[] =3D {
+    /* Dummy the TCM region regs for the moment */
+    { .name =3D "ATCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 0,
+      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
+    { .name =3D "BTCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 1,
+      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
+    { .name =3D "DCACHE_INVAL", .cp =3D 15, .opc1 =3D 0, .crn =3D 15, .crm=
 =3D 5,
+      .opc2 =3D 0, .access =3D PL1_W, .type =3D ARM_CP_NOP },
+    REGINFO_SENTINEL
+};
+
+static void cortex_r5_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7MP);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr =3D 0x411fc153; /* r1p3 */
+    cpu->id_pfr0 =3D 0x0131;
+    cpu->id_pfr1 =3D 0x001;
+    cpu->isar.id_dfr0 =3D 0x010400;
+    cpu->id_afr0 =3D 0x0;
+    cpu->isar.id_mmfr0 =3D 0x0210030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01200000;
+    cpu->isar.id_mmfr3 =3D 0x0211;
+    cpu->isar.id_isar0 =3D 0x02101111;
+    cpu->isar.id_isar1 =3D 0x13112111;
+    cpu->isar.id_isar2 =3D 0x21232141;
+    cpu->isar.id_isar3 =3D 0x01112131;
+    cpu->isar.id_isar4 =3D 0x0010142;
+    cpu->isar.id_isar5 =3D 0x0;
+    cpu->isar.id_isar6 =3D 0x0;
+    cpu->mp_is_up =3D true;
+    cpu->pmsav7_dregion =3D 16;
+    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
+}
+
+static void cortex_r5f_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cortex_r5_initfn(obj);
+    cpu->isar.mvfr0 =3D 0x10110221;
+    cpu->isar.mvfr1 =3D 0x00000011;
+}
+
+static const ARMCPUInfo arm_v7r_cpus[] =3D {
+    { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
+    { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },
+    { .name =3D NULL }
+};
+
+static void arm_v7r_cpu_register_types(void)
+{
+    const ARMCPUInfo *info =3D arm_v7r_cpus;
+
+    while (info->name) {
+        arm_cpu_register(info);
+        info++;
+    }
+}
+
+type_init(arm_v7r_cpu_register_types)
+
+#endif
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index e87dd611f2..d0903d8544 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -340,6 +340,7 @@ config XLNX_ZYNQMP_ARM
     bool
     select AHCI
     select ARM_GIC
+    select ARM_V7R
     select CADENCE
     select DDC
     select DPCD
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index df5f8dff42..9768f9180f 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -10,5 +10,9 @@ config ARM_V6
     depends on TCG
     bool
=20
+config ARM_V7R
+    depends on TCG
+    bool
+
 config ARM_V7M
     bool
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 0473c559c6..a2508f0655 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -71,6 +71,7 @@ obj-y +=3D m_helper.o
 obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
 obj-$(CONFIG_ARM_V5) +=3D cpu_v5.o
 obj-$(CONFIG_ARM_V6) +=3D cpu_v6.o
+obj-$(CONFIG_ARM_V7R) +=3D cpu_v7r.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
--=20
2.21.1
