Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1258865ejs;
        Wed, 10 Jan 2024 11:54:30 -0800 (PST)
X-Received: by 2002:adf:f609:0:b0:337:61aa:9682 with SMTP id t9-20020adff609000000b0033761aa9682mr1671wrp.110.1704916469890;
        Wed, 10 Jan 2024 11:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704916469; cv=none;
        d=google.com; s=arc-20160816;
        b=H6+4aF6SuPp13d8vM7S8h4fV+BRMC0I1u49aZ4FEofQt+P5F8jBhvfucLwYkKlViBm
         Y4Fhkj6cAePFRw6w3Je006chxsUrZLVjjuPRo3lsVRUL4uMQXQp7GA5J7g6xNKyl1swd
         ci/zoJt4OY7Uct/3OhdTV+Z5/rhDjJlxKzMawCaY2Efm6Vb5CvjXu8lwBopiGQbVjV9s
         eXxnTlH63iky/JF0/a40lWC4zna6EwNwEuseeWBlxkTfaU9w/yh8TJSCx5YwcQrrYYjb
         304CiP3ck2c9Xq5VCrZlayQ2xyYOev7fITmCx/EwNn+CP8g4zCyquWpWHj0DFSAU80dc
         TD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OowX4efGlp2L11zIDE/JPwBjb6bv53ZLeGSFw+1liNI=;
        fh=0Bn9ysFO5uhdOoEvdDNDnkwY7yFMuDt2XLw3k0zcWt8=;
        b=jqD4DK9w0c3T+etyTnXO9Sq/SbdiLjtUdp2AQRTAqhQUx430L50opslMf7BEwG7PZm
         Z9i66aTbpR1m1A9ReaakXqrYAK5hpq9J4r3KgGXLy0lzQsRXaT0CvDOUYPEAItRFHSqj
         xQNSlJHCc/jJ1/9oTmvYsYAgQc1n1NzIWKX6ZbEZT6XwOiMCCz8IKApLYBko9ai4U076
         XQ0pm+9cZI8lzVjJcKc4roShVknSJdGFQPuPYeDDyZ8Z3yGKITjcgGOCU1kPKn+AJeLC
         h7brdFMugdGkDAAvMnxYAJuS+efrd7eI+KlO4sH7gNMGnOqxQHI/ZJ1CfoS0C7J6WjjL
         3KFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLIWVx7J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j7-20020adfc687000000b00336ee9c3477sor1685908wrg.8.2024.01.10.11.54.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 10 Jan 2024 11:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fLIWVx7J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704916469; x=1705521269; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OowX4efGlp2L11zIDE/JPwBjb6bv53ZLeGSFw+1liNI=;
        b=fLIWVx7JfxgiWMhOYMz2C23AdAJfVjjNU0t6SPshg8aCxwMk0OnHR1A6sLFcSCBNKK
         Lxe/s+tx5fR26CAPUOqY/e47kKsklnrYpSOfANeUutxQ7eTSgD+rcWaI2Elr2b4AQbZa
         ClNpju3WyzHCznlmhXFmtCUBkAthYkuKxjwAOFs2OxLfD0Ctw6PEJpa7+QYVE8SElGOL
         3di2RH/r6r+PFfcP9xnm4tG/dcOdWumTRhKGTcjZz1uH8SfKyZG25/4yLbATHbadeO39
         xro6UznRJCqcewl8yscz1pUHW60jE8bkDfUWJ9NjwyEId9AluXfKvzeyRVBLVa4wt4jy
         /Cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704916469; x=1705521269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OowX4efGlp2L11zIDE/JPwBjb6bv53ZLeGSFw+1liNI=;
        b=sw97kas00p+BJHVlrGHrdG98FFfue8lgK+42Gy1oNoJUk14RDuRoS5WlMd08dYqVUE
         8WX61icJnPMLWfQTLvDV1MhlDGD2f8XxZU7ltJAO1Dnyy77/K+D7NDPXZeK1LPytj0VW
         lxCT8G1cnGLniIWCX0OJxbj+1bMQXe2q0E6MoXsf0y9DDnLbRplReanNQgy6hxQRcCBy
         malHnjj8x/X6D4qIwfG9bOoTUg7gt3rl/9RufkUww/gYxeWNo3Wp4i2hcnfv1qR1gGo/
         89vKnZu3JZwS8Faz0yC3WyWmwIP5X5wDsLhNG/db00WJLAFHHHAjdcZJOT+q2sCUGgA3
         aN7Q==
X-Gm-Message-State: AOJu0Yxuve7qz/mFeQrZ5RrHxUN5uxmEkXZbq3wQ+stUR18TElRH5IyE
	xycr5ObdopWMjHAvhLxmAD12bXkol7wUJlY0
X-Google-Smtp-Source: AGHT+IFWby61uJ0ne9sJLI7LEPySlIqlyEyfxcveQWgGiW6+NlQFSatSdvJvgCxT7CD5nZwLtOoy4Q==
X-Received: by 2002:a5d:5150:0:b0:337:6f4a:1238 with SMTP id u16-20020a5d5150000000b003376f4a1238mr3581wrt.103.1704916469496;
        Wed, 10 Jan 2024 11:54:29 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (vau06-h02-176-184-43-236.dsl.sta.abo.bbox.fr. [176.184.43.236])
        by smtp.gmail.com with ESMTPSA id c6-20020adfed86000000b00336751cd4ebsm5631000wro.72.2024.01.10.11.54.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 10 Jan 2024 11:54:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 08/14] hw/arm: Prefer arm_feature(EL3) over object_property_find(has_el3)
Date: Wed, 10 Jan 2024 20:53:22 +0100
Message-ID: <20240110195329.3995-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240110195329.3995-1-philmd@linaro.org>
References: <20240110195329.3995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: dPeqflPomYxD

The "has_el3" property is added to ARMCPU when the
ARM_FEATURE_EL3 feature is available. Rather than
checking whether the QOM property is present, directly
check the feature.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/exynos4210.c   |  4 ++--
 hw/arm/integratorcp.c |  5 ++---
 hw/arm/realview.c     |  2 +-
 hw/arm/versatilepb.c  |  5 ++---
 hw/arm/xilinx_zynq.c  |  2 +-
 hw/cpu/a15mpcore.c    | 14 +++++++++-----
 hw/cpu/a9mpcore.c     |  9 +++++----
 7 files changed, 22 insertions(+), 19 deletions(-)

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
diff --git a/hw/arm/integratorcp.c b/hw/arm/integratorcp.c
index 1830e1d785..7685527eb2 100644
--- a/hw/arm/integratorcp.c
+++ b/hw/arm/integratorcp.c
@@ -596,19 +596,18 @@ static void integratorcp_init(MachineState *machine)
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
 
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 4b2257787b..1969bb4608 100644
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
index bfd8aa5644..afe3897901 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -53,7 +53,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     DeviceState *gicdev;
     SysBusDevice *busdev;
     int i;
-    bool has_el3;
     bool has_el2 = false;
     Object *cpuobj;
 
@@ -62,13 +61,18 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     qdev_prop_set_uint32(gicdev, "num-irq", s->num_irq);
 
     if (!kvm_irqchip_in_kernel()) {
+        CPUState *cpu;
+
         /* Make the GIC's TZ support match the CPUs. We assume that
          * either all the CPUs have TZ, or none do.
          */
-        cpuobj = OBJECT(qemu_get_cpu(0));
-        has_el3 = object_property_find(cpuobj, "has_el3") &&
-            object_property_get_bool(cpuobj, "has_el3", &error_abort);
-        qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+        cpu = qemu_get_cpu(0);
+        cpuobj = OBJECT(cpu);
+        if (arm_feature(cpu_env(cpu), ARM_FEATURE_EL3)) {
+            qdev_prop_set_bit(gicdev, "has-security-extensions",
+                              object_property_get_bool(cpuobj, "has_el3",
+                                                       &error_abort));
+        }
         /* Similarly for virtualization support */
         has_el2 = object_property_find(cpuobj, "has_el2") &&
             object_property_get_bool(cpuobj, "has_el2", &error_abort);
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579..3e1fef149f 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -52,7 +52,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
                  *wdtbusdev;
     int i;
-    bool has_el3;
     CPUState *cpu0;
     Object *cpuobj;
 
@@ -81,9 +80,11 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
     /* Make the GIC's TZ support match the CPUs. We assume that
      * either all the CPUs have TZ, or none do.
      */
-    has_el3 = object_property_find(cpuobj, "has_el3") &&
-        object_property_get_bool(cpuobj, "has_el3", &error_abort);
-    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
+    if (arm_feature(cpu_env(cpu0), ARM_FEATURE_EL3)) {
+        qdev_prop_set_bit(gicdev, "has-security-extensions",
+                          object_property_get_bool(cpuobj, "has_el3",
+                                                   &error_abort));
+    }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
         return;
-- 
2.41.0
