Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317534ejc;
        Tue, 10 Jan 2023 08:45:43 -0800 (PST)
X-Received: by 2002:a5d:5405:0:b0:284:8a24:59e6 with SMTP id g5-20020a5d5405000000b002848a2459e6mr30935759wrv.3.1673369143792;
        Tue, 10 Jan 2023 08:45:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369143; cv=none;
        d=google.com; s=arc-20160816;
        b=UYoZGc4z0vEQ9bUKvzFR0Xm4oqeUd9t6cpgLSM9LCBPyYJB2xRPoUJj48Ol0DjTydh
         WGiIQWh25v3OFMhvCfgaIOezF5mGmVX607n+TeHLuINinKzzFFZvHIUfi8NISbwykf5R
         h2IlNuf6Lewo4epvXrlvpbfbEKrjQC26dXpbPEaIsv1gCZd1+YJ1vsuEWYQU36yoUjAH
         RcWU92Sas1j+iWbKr65UYroE4UKOJRgfBWYsj9rWbUWCvBUXtOVVcTM08NfGc5GYHia1
         LZt6loxTlCdBUEiOkWChobb21OX3+r0IiBkd8rahFW7D/ZiRCZU19Dlya4lVoX0bA/Jd
         Yj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KlIENfxWIvMy7wAsOeIIVwXs5j0fqcu2I9CG7fH4FsA=;
        b=WP8H9mTbVGhj/iUkEJ8YuBvgqBkO1dimk0ng2E3TAXH/FoJ6b7A9DaaoS5kp2JaBnj
         Ni6YjVjAJVboN4eORk6cpnUT9nZRcePWIBM6s/ayxGs3CWBEdaROnlsXxMkOQgJDK2L8
         onv3FaqSsY+WdrS1QLX77anL5R0JHabseyhgt8SwOi9fEQ3xY7znbvGgUI99L7S7U/pt
         DAip4075rWGWbV4vvpnT7x+zF5Cup25jd8BOOxADlTtpyQqMszX3JWZjnJcKt5S5q3Kq
         bCNZKmxGV3MI/zXGf0VCC/E7RA9cTrhwJlkhcR1aZh0qz0qmIv52OVg1fQcQ77cNr9iA
         vwCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFoA25AF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d10-20020adfc08a000000b0028977a76cf5sor4795703wrf.49.2023.01.10.08.45.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:43 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XFoA25AF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlIENfxWIvMy7wAsOeIIVwXs5j0fqcu2I9CG7fH4FsA=;
        b=XFoA25AFQNh3XcyQ5WsxQthXlIJZSkkHXnUhiCizmCZitac3oUgajjdv3doVfLbaQl
         iu9FnmlYQulIvoxere8d3r3kDw4sOl5y3B4xdeZOTbLD2Bdd18OAYNBW/zMkKJbaSVAN
         QALwi0iLaVhrsf/rjwZimt/1n2qVG51Zt2S4IL8c+N896jS5pUvv/8JV5qNGV7v5xiX/
         /AKszZ3sCbT3kDmkJM+dn40lNnG5zSkB4CWjWWcYVrhibeTQuOp0KCtVNjgvTjBCdrRr
         JpCsB/Kw9IZzAphlXPdW35k/DmlNnU1Fy9sYzIPDXdkmZQhxv0Drmp79PeA6WtL+R/OF
         9FoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlIENfxWIvMy7wAsOeIIVwXs5j0fqcu2I9CG7fH4FsA=;
        b=iP29E8PWroppW3QGiIstxAwXQLCdU7fZSUFMKIEWuOq5cwKOLjGZ89rSxVJU6qTmWb
         csR7lvbjq25nAqYZO0kD54OGq76Jl3eHO6uZykFWhwrYmp0URMnoP6/z8aR7cmaT/1NJ
         DE+PfIJykUIGeaT7BoK8WQ3d8Wj+TEeMxr3ierWOgOkqJZw/QmzkDRLehZB7kJRf21dz
         RuWAqXJuWKi3xcjFAhCcb4Iy6H/EhD5G7sT2QPPiq5wrR4ATyl3uX9Y0W70oxH6sfkG9
         Ec5UoVRfI6dffoo2Z7mlfNEQuMIRsUADfThI6Y8nd0fpdxqtMAnW1HnDVx4MwYziCsbb
         GcVA==
X-Gm-Message-State: AFqh2koKJxYgcbSziQVk9CDrcZPgDnfdFn751sjay3C0wZVes4Jigf6l
	ylGBoKQIhhTtulgUVQdOWNJczCPLHut68e4T/Qo=
X-Google-Smtp-Source: AMrXdXtxNFtIt6qWNNkhF+OU0z776JO5J5i8j+/7U+ZvyFyQKf1E89J7CQGZ733UHBQJ6NiDqHjFOg==
X-Received: by 2002:a5d:4150:0:b0:286:2b9e:f549 with SMTP id c16-20020a5d4150000000b002862b9ef549mr29669219wrq.66.1673369143506;
        Tue, 10 Jan 2023 08:45:43 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id w10-20020a5d608a000000b0027cfd9463d7sm11722252wrt.110.2023.01.10.08.45.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 17/18] hw/arm/fsl-imx6: Replace object_initialize(ARMCPU) by object_new()
Date: Tue, 10 Jan 2023 17:44:05 +0100
Message-Id: <20230110164406.94366-18-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: F2yTJJBYyp9j

Replace the ARMCPU field in FslIMX6[UL]State by a reference
to an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx6.c
 - fsl-imx6ul.c
 - mcimx6ul-evk.c
 - sabrelite.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6.c           | 14 +++++++-------
 hw/arm/fsl-imx6ul.c         |  8 ++++----
 hw/arm/mcimx6ul-evk.c       |  2 +-
 hw/arm/meson.build          |  6 +++---
 hw/arm/sabrelite.c          |  2 +-
 include/hw/arm/fsl-imx6.h   |  4 ++--
 include/hw/arm/fsl-imx6ul.h |  4 ++--
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 00dafe3f62..085cd3b1c8 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -43,8 +43,8 @@ static void fsl_imx6_init(Object *obj)
 
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a9"));
+        s->cpu[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a9")));
+        object_property_add_child(obj, name, OBJECT(s->cpu[i]));
     }
 
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
@@ -120,17 +120,17 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         /* On uniprocessor, the CBAR is set to 0 */
         if (smp_cpus > 1) {
-            object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
+            object_property_set_int(OBJECT(s->cpu[i]), "reset-cbar",
                                     FSL_IMX6_A9MPCORE_ADDR, &error_abort);
         }
 
         /* All CPU but CPU 0 start in power off mode */
         if (i) {
-            object_property_set_bool(OBJECT(&s->cpu[i]), "start-powered-off",
+            object_property_set_bool(OBJECT(s->cpu[i]), "start-powered-off",
                                      true, &error_abort);
         }
 
-        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
+        if (!qdev_realize(DEVICE(s->cpu[i]), NULL, errp)) {
             return;
         }
     }
@@ -148,9 +148,9 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
     for (i = 0; i < smp_cpus; i++) {
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
+                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + smp_cpus,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
+                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_FIQ));
     }
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index 568317117c..be0573a243 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -34,8 +34,8 @@ static void fsl_imx6ul_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    object_initialize_child(obj, "cpu0", &s->cpu,
-                            ARM_CPU_TYPE_NAME("cortex-a7"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+    object_property_add_child(obj, "cpu0", OBJECT(s->cpu));
 
     /*
      * A7MPCORE
@@ -166,7 +166,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    qdev_realize(DEVICE(&s->cpu), NULL, &error_abort);
+    qdev_realize(DEVICE(s->cpu), NULL, &error_abort);
 
     /*
      * A7MPCORE
@@ -178,7 +178,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
 
     sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-    d = DEVICE(&s->cpu);
+    d = DEVICE(s->cpu);
 
     sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(d, ARM_CPU_IRQ));
     sysbus_connect_irq(sbd, 1, qdev_get_gpio_in(d, ARM_CPU_FIQ));
diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index d83c3c380e..89a65e4c4b 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -61,7 +61,7 @@ static void mcimx6ul_evk_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu, machine, &boot_info);
+        arm_load_kernel(s->cpu, machine, &boot_info);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 53ce301cbe..a7ee21e32f 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -9,7 +9,6 @@ arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_ss.add(when: 'CONFIG_VERSATILE', if_true: files('versatilepb.c'))
 arm_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 arm_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
-arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
@@ -20,7 +19,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_soc.c',
   'aspeed.c',
@@ -28,7 +26,6 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed_ast10x0.c',
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
@@ -40,6 +37,8 @@ softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX6UL', if_true: files('fsl-imx6ul.c', 'mcimx6ul-evk.c'))
 softmmu_ss.add(when: 'CONFIG_FSL_IMX7', if_true: files('fsl-imx7.c', 'mcimx7d-sabre.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
@@ -55,6 +54,7 @@ softmmu_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
 softmmu_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_soc.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c'))
+softmmu_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 softmmu_ss.add(when: 'CONFIG_SPITZ', if_true: files('spitz.c'))
 softmmu_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F100_SOC', if_true: files('stm32f100_soc.c'))
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 41191245b8..acd1d344b9 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -98,7 +98,7 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
+        arm_load_kernel(s->cpu[0], machine, &sabrelite_binfo);
     }
 }
 
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 9d24d98189..ba42047b21 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -32,8 +32,8 @@
 #include "hw/net/imx_fec.h"
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
+#include "hw/arm/cpu.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl-imx6"
@@ -55,7 +55,7 @@ struct FslIMX6State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu[FSL_IMX6_NUM_CPUS];
+    ARMCPU         *cpu[FSL_IMX6_NUM_CPUS];
     A9MPPrivState  a9mpcore;
     IMX6CCMState   ccm;
     IMX6SRCState   src;
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 4f42fe4192..f49d0c9b83 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -37,7 +37,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl-imx6ul"
@@ -66,7 +66,7 @@ struct FslIMX6ULState {
     DeviceState    parent_obj;
 
     /*< public >*/
-    ARMCPU             cpu;
+    ARMCPU             *cpu;
     A15MPPrivState     a7mpcore;
     IMXGPTState        gpt[FSL_IMX6UL_NUM_GPTS];
     IMXEPITState       epit[FSL_IMX6UL_NUM_EPITS];
-- 
2.38.1
