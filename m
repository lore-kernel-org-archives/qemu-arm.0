Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317373ejc;
        Tue, 10 Jan 2023 08:45:27 -0800 (PST)
X-Received: by 2002:a5d:6ac2:0:b0:2bd:bdad:4cd6 with SMTP id u2-20020a5d6ac2000000b002bdbdad4cd6mr1362795wrw.60.1673369127601;
        Tue, 10 Jan 2023 08:45:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369127; cv=none;
        d=google.com; s=arc-20160816;
        b=dSoELIRcYzvYZObKfPKe4cW5SuJnAFh+MT/cQysAMSHYUUD7lslEZwoXg2JX0D3cxP
         FVxdoe2QOwTSeQgiCO/HFQf/1CyJZA5++618prhBV8DepcXjw+i1fOELtnI0MQcVF/Ur
         pIywAebI8W9AvxmYqqPem1+z5feCIRxNucvYSuNF5DY//RiNkJxAmGC2oELGmTrkBelG
         Sn1kXDfX1p9/9CzvlQfTJSn72A8ilJneTrwqcKCqmnwVJ7rU1eR+8HY8ed7JrKHUtfVQ
         Y6nPhwtvseMwBZKRiDaYo19HqJVy22FuFeL9E7QvgrM9crkmDmUMMN44Lrk82qcyVN2F
         /oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Jw5bJZJ8xtvZB9vBJ7QEumcG+hXUdxVdMxAlu6Wbtrc=;
        b=zOYRKOQI/J4peC8hsN5J/ha+ENU5YbCXvn32dPceWLEbn60IcM38gAgOpWyDZ6y2ja
         zIlsRtky+giiWSU/IURhRjPpzLGyYVLnwxcBnKmPNPkXFtFewxItVFMTYkxW3NegHFou
         zWpuDDQivvKIBC13bPEQDARs3YaBKtx1jEzV4wtwg4DXcVRpJRss1F4MmeFTYg9Swj2w
         RkMlCLzZZ6u8Rl7Hezi6qGb/rKIA1oWqrJO/DaXRP7vtcDNtaMD4I8OWdtQLvXj0JXDq
         WiGnOI07ac/HifcCnc4ztGv483+Z0SVnjn9CVPfsLL1ilWllJAF5Ymo+cpmK+hcKGdyq
         MVyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hl8jOjdb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15-20020a05600003cf00b00277090be837sor4735304wrg.11.2023.01.10.08.45.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:27 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hl8jOjdb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw5bJZJ8xtvZB9vBJ7QEumcG+hXUdxVdMxAlu6Wbtrc=;
        b=Hl8jOjdbKH2R38BAeI6ASttWVsQavPQfsuy5IQUVlTFCjGlc4djljtxqV+iQAputSm
         F4LtNrZnQD1ipXn3bCj/BxdmuGjbLlv5LYy5wnjpTMyjAXFsKy+2Z7op0X7EmPvS7vEn
         UaTTtfCtIKWLNezAphhYiM8Sfxh0yV5/VasDlpRHQXtGIgarVjd3qOIJSQyRHQczYx51
         HHAAcIWRaY4vvlzA1mnfq6pAkqWZruwLWdJE2dwNQi/Innb9UlRwSsrINZvAsdgm3BLt
         ZwzcA1FgtZGYveocet5QsazphNSjtDVGYklJIPwZ8D4+eOEiIADTgcR+TaITaapmb0ur
         ZyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw5bJZJ8xtvZB9vBJ7QEumcG+hXUdxVdMxAlu6Wbtrc=;
        b=7WXfxVOsx8cg4NPIapB1+5mX9MOvGis0B4RsUKWKkPEstGjg/uKnAy3Tmi9MJndinU
         IMLvBkXVTgLESiyukPzpmeniOE5P/oaCupH9CVpzEiO1b/5vCCHngYZgT9kaaR5xw8ej
         2+xDK7YZjdxcqFymKuliDiFrzuqFR893jN6t6McDs92KBO/SNbSS5kmRyIiOrohRRAuN
         pVWNKDYCFU+J4bWn7TvqkDkmtBNQyCGFjPIlh9ouGptaDy5zaaiF1+lGx7VBk8UyPI2R
         QImZY27W0CjZnQbGAjZcgK+TYPE7bBRA5HBZhlsiEPYzDFGWrPGcjnDntgavSriACJdM
         Nltw==
X-Gm-Message-State: AFqh2kosLFsb2KAFiIdPr84Fhb9D4IEhapgAs20lFVAG9N/aGjY2TgNq
	NtMBRuPsre2OhhRFbH9i+AelOzGA
X-Google-Smtp-Source: AMrXdXvTJgF900lEII2ecG1KpIa1Yy6xKTgj7RZHtvwbpI55WJY0Lc7o3cdsimloWFOhsnJdbrg4KQ==
X-Received: by 2002:a5d:5c12:0:b0:242:800:9a7f with SMTP id cc18-20020a5d5c12000000b0024208009a7fmr46571768wrb.65.1673369127328;
        Tue, 10 Jan 2023 08:45:27 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id t17-20020adff611000000b00236488f62d6sm11447536wrp.79.2023.01.10.08.45.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:27 -0800 (PST)
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
Subject: [PATCH 14/18] hw/arm/fsl-imx25: Replace object_initialize(ARMCPU) by object_new()
Date: Tue, 10 Jan 2023 17:44:02 +0100
Message-Id: <20230110164406.94366-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2Q8tuIglh9ax

Replace the ARMCPU field in FslIMX25State by a reference to
an allocated ARMCPU. Instead of initializing the field with
object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - fsl-imx25.c
 - imx25_pdk.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx25.c         | 9 +++++----
 hw/arm/imx25_pdk.c         | 2 +-
 hw/arm/meson.build         | 2 +-
 include/hw/arm/fsl-imx25.h | 4 ++--
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 24c4374590..5213c1ac23 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -36,7 +36,8 @@ static void fsl_imx25_init(Object *obj)
     FslIMX25State *s = FSL_IMX25(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm926"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm926")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "avic", &s->avic, TYPE_IMX_AVIC);
 
@@ -83,7 +84,7 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     uint8_t i;
     Error *err = NULL;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -92,9 +93,9 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->avic), 0, FSL_IMX25_AVIC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->avic), 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
index b4f7f4e8a7..26fc0ef5ae 100644
--- a/hw/arm/imx25_pdk.c
+++ b/hw/arm/imx25_pdk.c
@@ -136,7 +136,7 @@ static void imx25_pdk_init(MachineState *machine)
      * fail.
      */
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->soc.cpu, machine, &imx25_pdk_binfo);
+        arm_load_kernel(s->soc.cpu, machine, &imx25_pdk_binfo);
     }
 }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 0c7554b763..ccda1f5149 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -20,7 +20,6 @@ arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orange
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
-arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
@@ -41,6 +40,7 @@ softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
+softmmu_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
 softmmu_ss.add(when: 'CONFIG_HIGHBANK', if_true: files('highbank.c'))
 softmmu_ss.add(when: 'CONFIG_INTEGRATOR', if_true: files('integratorcp.c'))
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 1b1086e945..9ad95073c2 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -31,7 +31,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX25 "fsl-imx25"
@@ -50,7 +50,7 @@ struct FslIMX25State {
     DeviceState parent_obj;
 
     /*< public >*/
-    ARMCPU         cpu;
+    ARMCPU         *cpu;
     IMXAVICState   avic;
     IMX25CCMState  ccm;
     IMXSerialState uart[FSL_IMX25_NUM_UARTS];
-- 
2.38.1
