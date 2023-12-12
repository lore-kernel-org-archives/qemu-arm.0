Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026845ejo;
        Tue, 12 Dec 2023 08:32:49 -0800 (PST)
X-Received: by 2002:a05:600c:35c8:b0:40b:5e22:966 with SMTP id r8-20020a05600c35c800b0040b5e220966mr3248990wmq.85.1702398769124;
        Tue, 12 Dec 2023 08:32:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398769; cv=none;
        d=google.com; s=arc-20160816;
        b=LSmCoIn83vvyFdyRUNIEB4n4mKRLqtTIeedu6EaJchS2lbQusQrSS5dukUMtL4PnmJ
         a5zY2+5f3DLu4++98AqViWCgbpYtKU8Vo8iuGHIJtF4GPUuu0FLnw1P5FCQU/nFj2r5V
         QQty99YALPGW8MoKnU5ok4UIMA6hVIHYCixC3Dse/vN+3ZUCvJf66+n10GHZ+oSiIIFB
         S/hSyPsNiHAuQwMTnDOda3TNl95ndiZ8e0I0tkMoawhT8gXA3JYCp52cGLz4pw/M8CmI
         Y7Bnaez0QWD41GtUT5zmJf0/qBKXx/fAXhACVQUMG3y7P9Df1Y0sJFQxFElJnrTZ0E2W
         0eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uwsCbOQwC9LRQg37XGNzhzNIEGJSgHKY9wlcygMw6kk=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=tFYeHRjkLhBUB1tA4HnqNXPKiB4bNLPVKp5z9Id+ZDieUzE+19FXYtzNrB3PhK8zns
         l/JpiQcxQpVf7ECpFIZxoxnoGyQwwqhuuSWW0eVpsR+M918KcT122xKpdaXpOiN3EK33
         jD5fcLtaQEjZVGzFHEz6bAdzpcIwM2BewtFvO6JgRalxSrlIvvlAgWEzrRLa7lR9jD4a
         3v1lrD1OTDc0T9+NGJ6MTvT97+8DzsvpaiJiclGfM5nqXoDbtxiOMEkSx+ycGXWeMSuu
         oGdeO1XkkXN2OugHnup+tw1ZsSNpJ9esOtix98xxEwqhLdRevOq1PwjnEVF9+CpoHcRW
         VW1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4X6j5H9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v9-20020adfedc9000000b0033636fba4c9sor17024wro.8.2023.12.12.08.32.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S4X6j5H9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398769; x=1703003569; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwsCbOQwC9LRQg37XGNzhzNIEGJSgHKY9wlcygMw6kk=;
        b=S4X6j5H9Ev5VOO57ITxTgzTUT92rkfR+d3qrjHkJKUM4cFTbQH48G4zk7SVrWU1x73
         8V3F6XfjJ7QafXx63Pg4YJnfgl+E/nAcmQsvvr2Fg/aEVpjymRsQZrjyQqvUO97ffkDb
         iJ1kl/Cj4NfpjUXJIQVMK8em59Slc9i7c80NoD/XRHYPwFASF89/Hz5MuvPCXj7NUWPx
         h+FWy7/7ix26WjNHjwzwZxMW8nrRtg+Wj8WlMYH+XnGRXwWxHUWWOsxH1pIA5/YNcOT1
         nMLXr8PgObPGuVRrakJ7En3qHpFSpnVLBm/Zp2puT7FdPz1Bs5PrBcQNtnQyRuUU7P53
         ei5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398769; x=1703003569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwsCbOQwC9LRQg37XGNzhzNIEGJSgHKY9wlcygMw6kk=;
        b=L8W3hALhKzyQwc0vDJuxVeWs/lqggpkb4LabVrwMw28KBW6RqlbEg5tCSjjMnA035P
         vvd5GxhZakFXJbi8jwirMQ1Vs2R5ZLU5VMoRGkLRXM4Gl4hrly2qG+ZQpsMOgGRC3WPV
         mt/yeuB48qfQIfN7ngjIhUlOlBXBP+QRXZxKSWYU18r75wh2qubpRbWE1n3h/wKloHv2
         /UIuBX4BY5pQpLSFXRkaKZ/nIyTDxf/pj8rqMQU8UdAEfQabcrhnujvOcFkJHKBvZP9Z
         SSTSEyHhMIdgjh/lXSYym/3RZ6+HQAgK2tbbw3AIqozpYlYuuImDD6LDKQglFcSJikoR
         ujMw==
X-Gm-Message-State: AOJu0Yz2weXPFP7tcH74HQrxF6+rZj8o5IiSeFie6eR0HOLeQfNIoJK/
	UWbj1CAru7q3ZdbdcSJzXDULWA0A
X-Google-Smtp-Source: AGHT+IHNLFmdvtFn8m/sQjbujNGsQXLq5wQ3u72VZDuHI9d3Z+DgXmGoeA/vWenMC/ayDY9pCkjT8g==
X-Received: by 2002:adf:fcc9:0:b0:336:9f9:6e6 with SMTP id f9-20020adffcc9000000b0033609f906e6mr3118511wrs.97.1702398768756;
        Tue, 12 Dec 2023 08:32:48 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id v4-20020a5d4a44000000b003342e0745absm11105691wrs.93.2023.12.12.08.32.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 26/33] hw/arm/fsl-imx7: Let the A7MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:26 +0100
Message-ID: <20231212162935.42910-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pTMakOAshOqu

Set the properties on the a7mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx7.h |  4 ---
 hw/arm/fsl-imx7.c         | 62 +++++----------------------------------
 hw/arm/mcimx7d-sabre.c    |  3 +-
 3 files changed, 10 insertions(+), 59 deletions(-)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index a6f3a96029..77771f916c 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -36,7 +36,6 @@
 #include "hw/net/imx_fec.h"
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
-#include "cpu.h"
 #include "qom/object.h"
 #include "qemu/units.h"
 
@@ -63,11 +62,8 @@ enum FslIMX7Configuration {
 };
 
 struct FslIMX7State {
-    /*< private >*/
     DeviceState    parent_obj;
 
-    /*< public >*/
-    ARMCPU             cpu[FSL_IMX7_NUM_CPUS];
     CortexMPPrivState  a7mpcore;
     IMXGPTState        gpt[FSL_IMX7_NUM_GPTS];
     IMXGPIOState       gpio[FSL_IMX7_NUM_GPIOS];
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index bd9266b8b5..f71ffe7910 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -26,25 +26,16 @@
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "target/arm/cpu.h" /* qom */
 
 #define NAME_SIZE 20
 
 static void fsl_imx7_init(Object *obj)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX7State *s = FSL_IMX7(obj);
     char name[NAME_SIZE];
     int i;
 
-    /*
-     * CPUs
-     */
-    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX7_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
-    }
-
     /*
      * A7MPCORE
      */
@@ -163,7 +154,6 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX7State *s = FSL_IMX7(dev);
     DeviceState *gic;
-    Object *o;
     int i;
     qemu_irq irq;
     char name[NAME_SIZE];
@@ -175,56 +165,20 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    /*
-     * CPUs
-     */
-    for (i = 0; i < smp_cpus; i++) {
-        o = OBJECT(&s->cpu[i]);
-
-        /* On uniprocessor, the CBAR is set to 0 */
-        if (smp_cpus > 1) {
-            object_property_set_int(o, "reset-cbar", FSL_IMX7_A7MPCORE_ADDR,
-                                    &error_abort);
-        }
-
-        if (i) {
-            /*
-             * Secondary CPUs start in powered-down state (and can be
-             * powered up via the SRC system reset controller)
-             */
-            object_property_set_bool(o, "start-powered-off", true,
-                                     &error_abort);
-        }
-
-        qdev_realize(DEVICE(o), NULL, &error_abort);
-    }
-
     /*
      * A7MPCORE
      */
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-cores", smp_cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->a7mpcore), "num-irq",
-                            FSL_IMX7_MAX_IRQ + GIC_INTERNAL, &error_abort);
-
+    qdev_prop_set_uint32(DEVICE(&s->a7mpcore), "num-cores", ms->smp.cpus);
+    qdev_prop_set_string(DEVICE(&s->a7mpcore), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a7"));
+    qdev_prop_set_uint64(DEVICE(&s->a7mpcore), "cpu-reset-cbar",
+                         FSL_IMX7_A7MPCORE_ADDR);
+    qdev_prop_set_uint32(DEVICE(&s->a7mpcore), "gic-spi-num",
+                         FSL_IMX7_MAX_IRQ + GIC_INTERNAL);
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX7_A7MPCORE_ADDR);
     gic = DEVICE(&s->a7mpcore);
 
-    for (i = 0; i < smp_cpus; i++) {
-        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
-        DeviceState  *d   = DEVICE(qemu_get_cpu(i));
-
-        irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
-        sysbus_connect_irq(sbd, i, irq);
-        irq = qdev_get_gpio_in(d, ARM_CPU_FIQ);
-        sysbus_connect_irq(sbd, i + smp_cpus, irq);
-        irq = qdev_get_gpio_in(d, ARM_CPU_VIRQ);
-        sysbus_connect_irq(sbd, i + 2 * smp_cpus, irq);
-        irq = qdev_get_gpio_in(d, ARM_CPU_VFIQ);
-        sysbus_connect_irq(sbd, i + 3 * smp_cpus, irq);
-    }
-
     /*
      * A7MPCORE DAP
      */
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 693a1023b6..782f7591db 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -20,6 +20,7 @@
 #include "hw/qdev-properties.h"
 #include "qemu/error-report.h"
 #include "sysemu/qtest.h"
+#include "target/arm/cpu.h" /* qom */
 
 static void mcimx7d_sabre_init(MachineState *machine)
 {
@@ -64,7 +65,7 @@ static void mcimx7d_sabre_init(MachineState *machine)
     }
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &boot_info);
+        arm_load_kernel(s->a7mpcore.cpu[0], machine, &boot_info);
     }
 }
 
-- 
2.41.0
