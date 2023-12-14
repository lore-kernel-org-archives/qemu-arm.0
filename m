Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2477287ejo;
        Thu, 14 Dec 2023 09:14:52 -0800 (PST)
X-Received: by 2002:a05:620a:149c:b0:77f:3da0:61fa with SMTP id w28-20020a05620a149c00b0077f3da061famr10768406qkj.144.1702574092682;
        Thu, 14 Dec 2023 09:14:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702574092; cv=none;
        d=google.com; s=arc-20160816;
        b=dkZD6I5RvVLYd+vJUEdGGhsy6+jIcH5Pyc0pX9TGLgtL2gNxjikVVeJrChNjthUo0Z
         x6Y4efXV4eXaEQ5RC3wQIkQxzvoWKop2nd9rqp1kZ2zLp+a4cWEay2BIfmQdUNVwmxK/
         ElVk5xHQZv5mecJHj1nHCW8HmgIyrsl07KzhuqW9MwCd067JDrw0+dBpifJe9nwDKe0A
         y7wHqBrvzzwQnYHUMuY+R73lixUH6ciFLmsEd0J/t/y+Fz9MJNGHIMiajApOD+j7vprO
         5MeWDvANglYKX1iK4mkmLvwdEh+KmBxto2HeWmllgHPFKmtbOg54TyiduRCHv5N7D9Cp
         UloQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=ybFjpmrQhoMzGt+cU1/IIP+BUJDHHqNKMtENaaJvu/s=;
        fh=y/MB9kxfGhaRLLlr0QSQIj5BXzaYU/M6w5jfpe73tc4=;
        b=vu6FORXCQDPurVCXwF0/2W2QHCZiHEnz0KMwkG6w+E/6tJPHAAdcHqcBgodmFNk7WA
         CJUtfcm3fALoZknaX3DVJeq5mdzHmFlDqI+EUGTN73j+2AaUVZgp4nuXPVF8YsNHrZul
         7vDx6uppq8OnhfneJ2rTe2JC+JOjpiSdZine/3+VhobGQ0PDRQO+QMSiVnm4Sxd8LTZ6
         QSicOQrio0l7tKtPbYA44QkbRotSYHnNtdeE99N858XJaG/5ZOB5CZWTCgvlWXNzS4Hz
         1y+XHspxp4nmBpsnKH1ZScED9FXewx6RH7v9uIyuHtkQKb6Q0hzU0LJw1AvXClSGcGkD
         XO+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6iVQqPM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 10-20020a05620a048a00b0077d67560192sor8646484qkr.0.2023.12.14.09.14.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Dec 2023 09:14:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w6iVQqPM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702574092; x=1703178892; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ybFjpmrQhoMzGt+cU1/IIP+BUJDHHqNKMtENaaJvu/s=;
        b=w6iVQqPMfPVfGJ0Eou4xjr6ZKDRpVF/L36xEAojN/5RjYIIWFU7VR4Pv2kB+svqbq6
         RMThG1FtITH+kIu040EeGH0vfPfU/nDtpyVIjY+prLeh5YGldkduSX4JzaHO5wSEr2T4
         bIzkmDYHDEKdFdiJ0fbbsxv9CU5Cr6QId+wd+zr5dISSMBIfo/QuEsHEVIy2cWuOuzRP
         dDfswmSDVHtToTcD+694q52AsfkamxFgxYcCarf7eClT2+jf+UT4r5SHZHG5a/XJ1Wor
         mJizZcrLST7vJNLfQUxG09J+qBOP9wqEwCzumV/1J1VSne+zuEDRCCcmF1ARioCiHrFe
         SI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574092; x=1703178892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybFjpmrQhoMzGt+cU1/IIP+BUJDHHqNKMtENaaJvu/s=;
        b=PpzsF8G6T/iYjCWdaGL0nwE6Nay5HzXK0uH6sBQTQuSbHQBMbAYjMLZIqF7IHFw/9U
         phIhSK0z2y1Jch0dBIwDlU3C0zGGUOOFUmTVukPfDEo7ueijOsZw+oqhYknnPegL46ew
         M9Vw2eKRfm1EPO27bFBHDN5682anT7o5mOJCFY3CUQmZepYipRo+sDtoHzPD5eerTlLw
         ZUlb4qHInjFLbyuzwzSdYTundmz2EaGM56tEHxnXT+ElfX5qdNMO+24ay+wrLTsBIQ6k
         442qCwAKMe89EwSYXEcg5Qj516Qty6NxvtaCa2xqD7XTtptAXAhP8irGMmy5jHUfYDVk
         qbDg==
X-Gm-Message-State: AOJu0YwbSCkB47KRaYUXP02Q8S5d751WYDfkcRsBzZDbEtl86xhw+Nwy
	aDmrCeuUOCiWLlvJng2u/8PTgeQ5
X-Google-Smtp-Source: AGHT+IG2n/mkkrzU6O/7FEa2IagQJ2ZThg/CzYjwQY5mkZy28sYU219Jw2K1kBO+hgF/bpS+R3vJ6w==
X-Received: by 2002:ad4:5cc1:0:b0:67a:a721:caf6 with SMTP id iu1-20020ad45cc1000000b0067aa721caf6mr13054985qvb.87.1702574092148;
        Thu, 14 Dec 2023 09:14:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from M1X.pond.sub.org (p50902f8f.dip0.t-ipconnect.de. [80.144.47.143])
        by smtp.gmail.com with ESMTPSA id de4-20020ad45844000000b0067a97f6b0c6sm6122862qvb.32.2023.12.14.09.14.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 14 Dec 2023 09:14:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	qemu-arm@nongnu.org,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>
Subject: [RFC PATCH] hw/arm: Prefer arm_feature() over object_property_find()
Date: Thu, 14 Dec 2023 18:14:47 +0100
Message-ID: <20231214171447.44025-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lGtNA1zOfZmB

QOM properties are added on the ARM vCPU object when a
feature is present. Rather than checking the property
is present, check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
RFC: If there is no objection on this patch, I can split
     as a per-feature series if necessary.

Based-on: <20231123143813.42632-1-philmd@linaro.org>
  "hw: Simplify accesses to CPUState::'start-powered-off' property"
---
 hw/arm/armv7m.c       | 21 ++++++++++++---------
 hw/arm/exynos4210.c   |  4 ++--
 hw/arm/highbank.c     |  3 ++-
 hw/arm/integratorcp.c |  5 ++---
 hw/arm/realview.c     |  2 +-
 hw/arm/sbsa-ref.c     |  3 ++-
 hw/arm/versatilepb.c  |  5 ++---
 hw/arm/vexpress.c     |  6 ++++--
 hw/arm/virt.c         | 27 +++++++++++++++------------
 hw/arm/xilinx_zynq.c  |  2 +-
 hw/cpu/a15mpcore.c    | 17 +++++++++++------
 hw/cpu/a9mpcore.c     |  6 +++---
 12 files changed, 57 insertions(+), 44 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 3a6d72b0f3..932061c11a 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -302,28 +302,29 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
-    if (object_property_find(OBJECT(s->cpu), "idau")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
         object_property_set_link(OBJECT(s->cpu), "idau", s->idau,
                                  &error_abort);
-    }
-    if (object_property_find(OBJECT(s->cpu), "init-svtor")) {
         if (!object_property_set_uint(OBJECT(s->cpu), "init-svtor",
                                       s->init_svtor, errp)) {
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "init-nsvtor")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
         if (!object_property_set_uint(OBJECT(s->cpu), "init-nsvtor",
                                       s->init_nsvtor, errp)) {
             return;
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "vfp")) {
-        if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
-            return;
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_AARCH64)) {
+        if (cpu_isar_feature(aa64_fp_simd, s->cpu)) {
+            if (!object_property_set_bool(OBJECT(s->cpu), "vfp", s->vfp, errp)) {
+                return;
+            }
         }
     }
-    if (object_property_find(OBJECT(s->cpu), "dsp")) {
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M) &&
+        arm_feature(&s->cpu->env, ARM_FEATURE_THUMB_DSP)) {
         if (!object_property_set_bool(OBJECT(s->cpu), "dsp", s->dsp, errp)) {
             return;
         }
@@ -342,12 +343,14 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         return;
     }
     if (s->mpu_ns_regions != UINT_MAX &&
-        object_property_find(OBJECT(s->cpu), "pmsav7-dregion")) {
+        arm_feature(&s->cpu->env, ARM_FEATURE_PMSA)) {
+        if (arm_feature(&s->cpu->env, ARM_FEATURE_V7)) {
         if (!object_property_set_uint(OBJECT(s->cpu), "pmsav7-dregion",
                                       s->mpu_ns_regions, errp)) {
             return;
         }
     }
+    }
 
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index de39fb0ece..5efaa538cd 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -554,14 +554,14 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
         Object *cpuobj = object_new(ARM_CPU_TYPE_NAME("cortex-a9"));
 
+        s->cpu[n] = ARM_CPU(cpuobj);
         /* By default A9 CPUs have EL3 enabled.  This board does not currently
          * support EL3 so the CPU EL3 property is disabled before realization.
          */
-        if (object_property_find(cpuobj, "has_el3")) {
+        if (arm_feature(&s->cpu[n]->env, ARM_FEATURE_EL3)) {
             object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
         }
 
-        s->cpu[n] = ARM_CPU(cpuobj);
         object_property_set_int(cpuobj, "mp-affinity",
                                 exynos4210_calc_affinity(n), &error_abort);
         object_property_set_int(cpuobj, "reset-cbar",
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index f12aacea6b..0b5def8015 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -211,7 +211,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         object_property_set_int(cpuobj, "psci-conduit", QEMU_PSCI_CONDUIT_SMC,
                                 &error_abort);
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
+            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar", MPCORE_PERIPHBASE,
                                     &error_abort);
         }
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index d176e9af7e..5ec840ce89 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -599,19 +599,18 @@ static void integratorcp_init(MachineState *machine)
     int i;
 
     cpuobj = object_new(machine->cpu_type);
+    cpu = ARM_CPU(cpuobj);
 
     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(cpuobj, "has_el3")) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
     }
 
     qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
 
-    cpu = ARM_CPU(cpuobj);
-
     /* ??? On a real system the first 1Mb is mapped as SSRAM or boot flash.  */
     /* ??? RAM should repeat to fill physical memory space.  */
     /* SDRAM at address zero*/
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 132217b2ed..433fe72ced 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -123,7 +123,7 @@ static void realview_init(MachineState *machine,
          * does not currently support EL3 so the CPU EL3 property is disabled
          * before realization.
          */
-        if (object_property_find(cpuobj, "has_el3")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
             object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
         }
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f3c9704693..ecb05f6007 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -796,7 +796,8 @@ static void sbsa_ref_init(MachineState *machine)
         numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
                           &error_fatal);
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_CBAR) ||
+            arm_feature(cpu_env(cs), ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     sbsa_ref_memmap[SBSA_CPUPERIPHS].base,
                                     &error_abort);
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 2f22dc890f..addd7a6988 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -208,19 +208,18 @@ static void versatile_init(MachineState *machine, int board_id)
     }
 
     cpuobj = object_new(machine->cpu_type);
+    cpu = ARM_CPU(cpuobj);
 
     /* By default ARM1176 CPUs have EL3 enabled.  This board does not
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(cpuobj, "has_el3")) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         object_property_set_bool(cpuobj, "has_el3", false, &error_fatal);
     }
 
     qdev_realize(DEVICE(cpuobj), NULL, &error_fatal);
 
-    cpu = ARM_CPU(cpuobj);
-
     /* ??? RAM should repeat to fill physical memory space.  */
     /* SDRAM at address zero.  */
     memory_region_add_subregion(sysmem, 0, machine->ram);
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index fd981f4c33..ea3c76f3e1 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -218,17 +218,19 @@ static void init_cpus(MachineState *ms, const char *cpu_type,
     /* Create the actual CPUs */
     for (n = 0; n < smp_cpus; n++) {
         Object *cpuobj = object_new(cpu_type);
+        ARMCPU *cpu = ARM_CPU(cpuobj);
 
         if (!secure) {
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
         if (!virt) {
-            if (object_property_find(cpuobj, "has_el2")) {
+            if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
                 object_property_set_bool(cpuobj, "has_el2", false, NULL);
             }
         }
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
+            arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar", periphbase,
                                     &error_abort);
         }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index be2856c018..e5d883c4c3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2182,21 +2182,22 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "has_el3", false, NULL);
         }
 
-        if (!vms->virt && object_property_find(cpuobj, "has_el2")) {
+        if (!vms->virt &&  arm_feature(cpu_env(cs), ARM_FEATURE_EL2)) {
             object_property_set_bool(cpuobj, "has_el2", false, NULL);
         }
 
-        if (vmc->kvm_no_adjvtime &&
-            object_property_find(cpuobj, "kvm-no-adjvtime")) {
-            object_property_set_bool(cpuobj, "kvm-no-adjvtime", true, NULL);
+        if (kvm_enabled()) {
+            if (arm_feature(cpu_env(cs), ARM_FEATURE_GENERIC_TIMER)) {
+                object_property_set_bool(cpuobj, "kvm-no-adjvtime",
+                                         vmc->kvm_no_adjvtime, NULL);
+            }
+
+            if (vmc->no_kvm_steal_time) {
+                object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
+            }
         }
 
-        if (vmc->no_kvm_steal_time &&
-            object_property_find(cpuobj, "kvm-steal-time")) {
-            object_property_set_bool(cpuobj, "kvm-steal-time", false, NULL);
-        }
-
-        if (vmc->no_pmu && object_property_find(cpuobj, "pmu")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_PMU) && vmc->no_pmu) {
             object_property_set_bool(cpuobj, "pmu", false, NULL);
         }
 
@@ -2204,7 +2205,8 @@ static void machvirt_init(MachineState *machine)
             object_property_set_bool(cpuobj, "lpa2", false, NULL);
         }
 
-        if (object_property_find(cpuobj, "reset-cbar")) {
+        if (arm_feature(cpu_env(cs), ARM_FEATURE_CBAR) ||
+            arm_feature(cpu_env(cs), ARM_FEATURE_CBAR_RO)) {
             object_property_set_int(cpuobj, "reset-cbar",
                                     vms->memmap[VIRT_CPUPERIPHS].base,
                                     &error_abort);
@@ -2224,7 +2226,8 @@ static void machvirt_init(MachineState *machine)
                  * The property exists only if MemTag is supported.
                  * If it is, we must allocate the ram to back that up.
                  */
-                if (!object_property_find(cpuobj, "tag-memory")) {
+                if (!(arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64)
+                      && cpu_isar_feature(aa64_mte, ARM_CPU(cs)))) {
                     error_report("MTE requested, but not supported "
                                  "by the guest CPU");
                     exit(1);
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index dbb9793aa1..33e57dceef 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -198,7 +198,7 @@ static void zynq_init(MachineState *machine)
      * currently support EL3 so the CPU EL3 property is disabled before
      * realization.
      */
-    if (object_property_find(OBJECT(cpu), "has_el3")) {
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
         object_property_set_bool(OBJECT(cpu), "has_el3", false, &error_fatal);
     }
 
diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index bfd8aa5644..1fa079b3b8 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -53,7 +53,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     DeviceState *gicdev;
     SysBusDevice *busdev;
     int i;
-    bool has_el3;
     bool has_el2 = false;
     Object *cpuobj;
 
@@ -62,17 +61,23 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
 
     if (!kvm_irqchip_in_kernel()) {
+        CPUState *cpu;
+
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0));
-        has_el3 = object_property_find(cpuobj, "has_el3") &&
+        cpu = qemu_get_cpu(0);
+        cpuobj = OBJECT(cpu);
+        if (arm_feature(cpu_env(cpu), ARM_FEATURE_EL3)) {
             object_property_get_bool(cpuobj, "has_el3", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+            qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+        }
         /* Similarly for virtualization support */
-        has_el2 = object_property_find(cpuobj, "has_el2") &&
+        has_el2 = arm_feature(cpu_env(cpu), ARM_FEATURE_EL2);
+        if (has_el2) {
             object_property_get_bool(cpuobj, "has_el2", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
+            qdev_prop_set_bit(gicdev, "has-virtualization-extensions", true);
+        }
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579..9355e8443b 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -52,7 +52,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
                  *wdtbusdev;
     int i;
-    bool has_el3;
     CPUState *cpu0;
     Object *cpuobj;
 
@@ -81,9 +80,10 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
      */
-    has_el3 = object_property_find(cpuobj, "has_el3") &&
+    if (arm_feature(cpu_env(cpu0), ARM_FEATURE_EL3)) {
         object_property_get_bool(cpuobj, "has_el3", &error_abort);
-    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
+    }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
-- 
2.41.0
