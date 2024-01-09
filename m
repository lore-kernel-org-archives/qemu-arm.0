Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp553200ejs;
        Tue, 9 Jan 2024 10:10:32 -0800 (PST)
X-Received: by 2002:a05:600c:4ecf:b0:40e:4e09:1fbd with SMTP id g15-20020a05600c4ecf00b0040e4e091fbdmr847963wmq.0.1704823832019;
        Tue, 09 Jan 2024 10:10:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823832; cv=none;
        d=google.com; s=arc-20160816;
        b=IXXhOqy9TkZi07YiLSKVCL/l5MPo2+FOov3nJ+9l2Wn/EtYzOKwqld812whDw0nHx6
         xUrblKBSwPneABwSLG7QezZtOy6K0Jaec7E1VIDWpWiQzm99hq0fv30S90XMR01Tw27L
         5PMEJv9VYZm3T70iJDs1uS28b1zbdUy3py/kEyu5IgLFVEM0lnlqkk7iv/xKWjlVFYyS
         0vEu9zLF733WXSBhHf2GWO+EBchgp5DB5Rf6FjpQjqYjZiiL8ZkmnP4wc0rs4w+6pLqC
         2fwC258AHJ71OdpdutOAap3zDIiquAx9ZOG624f2e9NJDk6JO0CbUrEn9XqRZpqqAPa1
         JRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Fs9yHmgYAN3jLkfd5xrkR/STV7YHc6sb5NlHxAOGVok=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=DIWhBiQymjePHwTLLprIEFuvnneLrnzyItZ93KFzQBVihrXiT6LpPdVqTgKFywYWs0
         FPzXy5b7B/pAJwt1exZhV0pqzY6zv+xPq1iUTkZxQkQMC2wxzq32XknV6VGydZRR+BeL
         tVVeSf7apXsOJQwKzjF0FpaJ8M926A2XyI4UfKXNkx3kkd2C0jTxLqFEnVM0gNrkhshi
         wM9qvyqRE66U6mJXEP0lkZwW5n1hB62RG0oDfe6cm66e1ufjnPv/PrUETXU+C6dC01Fu
         sYpfGiN/1a7bvYM7gvQ0pZw/sM3/bbjIrb6JE/wOsFTftHajNEeZLNR3ian+/uYVv43k
         uo5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIg9Ewgt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j7-20020adfc687000000b0033661239fdfsor727406wrg.3.2024.01.09.10.10.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIg9Ewgt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823831; x=1705428631; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs9yHmgYAN3jLkfd5xrkR/STV7YHc6sb5NlHxAOGVok=;
        b=ZIg9EwgtHRBwYp9BW6qqzVu03PTzMF1a02Ibzijpwlx80RfPGRfVKVNVZIAv5PCHo8
         G0ynk86wt4m8m8FqrjYttSHiIKWs5vYNQ9oHWUvHnMhYWWlTU/1RS5L9jePV4yBL14SK
         DQ9a0UfAjROOzOqwvcnSRofAvRtcY2HxH1dcEGCUFGLkQv8UYvdN4qelqxFRzihnsWg0
         cD+eZiNr9u4yzie6O41+Fiazx00viNDTulFbRmIVZPwk++R0l6tnWSP13O6baUR+uCJX
         rLuros/sXorX2WneFzOLceRtYLfiSHuJfVlFepgHDsCdQ5JvwpvzLllIbXnOpzU1K4rF
         JvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823831; x=1705428631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fs9yHmgYAN3jLkfd5xrkR/STV7YHc6sb5NlHxAOGVok=;
        b=otecIX6o565m98Px3Kd9uNTpJlfC0f8m6i5gm+Ph4zcUZvWP5glXlb5Wkv8zWgbBcY
         NmZ6VgUQaYewXdBdhHurHDmVwSSpyxvRBCUxSwGkgqsB1mwndy2pm9bY7i4EuHFrgUUt
         Z8dvPnTZfAqX/IIu/ecz1jiM3rkoaC+1PIcw7Nxd4aAk0EGrJYnhAM0pWNQZWQKoIVhF
         KbKr4x7sFRJkJd95JIzyiJtKjSQNy4u+Yy6r0hWlNTmhotucqMM1DfCW9bmMsPn+k82n
         lJXUBdTdjEtAfBHjN9G2JHoaIhHk8k/98KixC4UsSvD24khYGW0zNo6sYj01mvYqvAct
         ZdqQ==
X-Gm-Message-State: AOJu0Yx99jsMGuVpmh65AlujACcwGAU1S71Kqq3Qw3Zj6P2xLE6dzVxJ
	ZKQEV37UowW3dD2MXfEfhOpu7OK7fMnbMHqPulDR4KMhKOMXQjaV
X-Google-Smtp-Source: AGHT+IEPyIfAednS4+GDfQ49cgUJLQ1i/fUsFEriU2Oan+/NHOtQSVv2opbT0ciHGYHdvA3c3VO/wg==
X-Received: by 2002:a5d:4984:0:b0:336:787c:6236 with SMTP id r4-20020a5d4984000000b00336787c6236mr856976wrq.65.1704823831637;
        Tue, 09 Jan 2024 10:10:31 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id f16-20020adffcd0000000b003373ef060d5sm2990432wrs.113.2024.01.09.10.10.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:10:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/14] hw/arm: Prefer arm_feature(EL3) over object_property_find(has_el3)
Date: Tue,  9 Jan 2024 19:09:24 +0100
Message-ID: <20240109180930.90793-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MKqsd0YClcM+

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
 hw/cpu/a15mpcore.c    | 11 +++++++----
 hw/cpu/a9mpcore.c     |  6 +++---
 7 files changed, 18 insertions(+), 17 deletions(-)

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
index bfd8aa5644..cebfe142cf 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -53,7 +53,6 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     DeviceState *gicdev;
     SysBusDevice *busdev;
     int i;
-    bool has_el3;
     bool has_el2 = false;
     Object *cpuobj;
 
@@ -62,13 +61,17 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
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
         has_el2 = object_property_find(cpuobj, "has_el2") &&
             object_property_get_bool(cpuobj, "has_el2", &error_abort);
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
