Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026678ejo;
        Tue, 12 Dec 2023 08:32:34 -0800 (PST)
X-Received: by 2002:a05:600c:444c:b0:40c:2d8d:ac1f with SMTP id v12-20020a05600c444c00b0040c2d8dac1fmr3758386wmn.61.1702398754728;
        Tue, 12 Dec 2023 08:32:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398754; cv=none;
        d=google.com; s=arc-20160816;
        b=VW8Z9FbAr3HK/xAdhJy1jMHZ4/8uhMWPSVQ7/KPGau4Y2KlLJPxgw3J348spnyKgjn
         VQpA9rRevhOIKFBIZ0RgOh4Mf5WOD16dGajX2IczlXznsLKh5D8SAQG9JYyZSURU4Te+
         k4jc+k5M/LPCcRl2W7qrFBEUM0jOXM589gi/ZJ0h/gZ3PqqtG2sT9mN6u/J7l62QSdNl
         sC+v5+K6bb2/LdcFS97gPPozC/SuU7xxBEmhEndxRvLWTZvE/woxDmPHBWyGh4tcoyxF
         K3KqQZ5AH/ZowE1DbxnMt0H77qUhg6QG1gyhgn8JEXN+We33B4HlJDmn1WhCWelD4/JL
         5Iag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=lnrJeszID6i8q/rfFXlglmf1g+vLhk9+fH8LuiS5wFg=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=tfZtwG/SI9SUna9V5mANE6JbzICAoPnDPnl13fBsb4TIoyDz1AZKKy9GgxT09diU7h
         /MIlbXd4nOj6gIUQhDyJ1QfL+eW4lwUE9CSmBTLLpznE345oHEq5kNOFT4tIeKD1Bg7d
         /djJ8jWnhBc0WA7RUYgRyxVpquaIcOBKG5SnpcmEBWj//hgtzwEuxZ3qqFzWPoWIiq4S
         HzMq0bocblUtl70KLoebgzeLl+OuWgB5oPWd7IHxXk9aOWZSq2LHLazighwBtxNaWZ7A
         CO5CoeTt0guehCeguEjTZqXhX9PkG/fTCRH8Z+roYvvLWlk2caqnBl+hoyidCG54U5J0
         n8zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUBDFGyn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3-20020a05600c220300b0040c07efde7fsor3216305wml.5.2023.12.12.08.32.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:34 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rUBDFGyn;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398754; x=1703003554; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnrJeszID6i8q/rfFXlglmf1g+vLhk9+fH8LuiS5wFg=;
        b=rUBDFGyngt/SkyX/SJWh5T4iMY4vGyXYFHdIkHKliSFs2+BbatCRalvBGsA4QwJCkG
         buPwaOvGLYENHD6UGw5UgitSTPZ5JNzRmhwfr+VbwB7CxalgKzPvfGC3By/2wDEbiMml
         yUnjuEzkecMdi/LH6UB8mBem+FiPfNXJ1AlaCirgXWE2rQ1wuTbLC97TdgXz7Qube/E+
         Aq/N5b3NdColofehcbkl5l+SwxfmoWl5PkZazdPh9UgGz3eNMqqUy37COynbapopIxwl
         enlyF9jguI+w6BRhAD2c3Z1G3QivAR4jieAzK/e06kux9akROsAu1CBXLG+UW0HpxQWL
         t5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398754; x=1703003554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnrJeszID6i8q/rfFXlglmf1g+vLhk9+fH8LuiS5wFg=;
        b=CiLJU5/AfmCnk/OfrZhHwa9FfZM1Ymc2gQyOvCDG7EDklWDJBdOgCF1AX5XDVHp886
         dgLU1BFRL9MzHhUDxlF5Y/x0Szfevp98S6yhwkFWHbGHe9h2E0v3cOvQtAfcrrPHTZ/J
         4v2Zp35se3CNYAPRHENbDV/zpN6yI9CGYMTSFrT5tRBtV7rM5SwhF6OWLEC76WL8njy2
         SV8KBrRSCIWtXs6GZ8lxNJcFtx46Uexi3rZa9HFucWB/C98xQ7q5QuKr1ZsPf/XdlUfR
         zjXmlcEysN2efUt8NIApQ3Z6v/npJVAPU0A8BgMBHvv+FltGnOS82399p4xGickpohpa
         0fIg==
X-Gm-Message-State: AOJu0YxCU6ORii0t7DODCPb0UoTSNw1y9gP3moTka5RscaTvkTxEscl2
	RZAMhdavtm6qBie8zOuOEmc+qxqM
X-Google-Smtp-Source: AGHT+IEhW3hPy0t/OW5VOfIFyP55JLvXgdi7wpqvG7SRznYraFPkiWLXOuJE1nlKRmvwPMhtNIbh8g==
X-Received: by 2002:a05:600c:3648:b0:40c:2671:1550 with SMTP id y8-20020a05600c364800b0040c26711550mr3735117wmq.24.1702398754443;
        Tue, 12 Dec 2023 08:32:34 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm19428074wms.30.2023.12.12.08.32.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:34 -0800 (PST)
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
Subject: [PATCH 24/33] hw/arm/fsl-imx6: Let the A9MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:24 +0100
Message-ID: <20231212162935.42910-25-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: j2BgpZmQM5vY

Set the properties on the a9mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/fsl-imx6.h |  4 ----
 hw/arm/fsl-imx6.c         | 47 +++++++--------------------------------
 hw/arm/sabrelite.c        |  4 +++-
 3 files changed, 11 insertions(+), 44 deletions(-)

diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 21a3b035a4..643c3160c7 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -33,7 +33,6 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl-imx6"
@@ -51,11 +50,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(FslIMX6State, FSL_IMX6)
 #define FSL_IMX6_NUM_USBS 4
 
 struct FslIMX6State {
-    /*< private >*/
     DeviceState parent_obj;
 
-    /*< public >*/
-    ARMCPU         cpu[FSL_IMX6_NUM_CPUS];
     A9MPPrivState  a9mpcore;
     IMX6CCMState   ccm;
     IMX6SRCState   src;
diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 65c7c1a0f9..f05ea62351 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -29,6 +29,7 @@
 #include "chardev/char.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "target/arm/cpu.h"
 
 #define IMX6_ESDHC_CAPABILITIES     0x057834b4
 
@@ -36,17 +37,10 @@
 
 static void fsl_imx6_init(Object *obj)
 {
-    MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6State *s = FSL_IMX6(obj);
     char name[NAME_SIZE];
     int i;
 
-    for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
-        snprintf(name, NAME_SIZE, "cpu%d", i);
-        object_initialize_child(obj, name, &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a9"));
-    }
-
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
 
     object_initialize_child(obj, "ccm", &s->ccm, TYPE_IMX6_CCM);
@@ -119,43 +113,18 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    for (i = 0; i < smp_cpus; i++) {
-
-        /* On uniprocessor, the CBAR is set to 0 */
-        if (smp_cpus > 1) {
-            object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
-                                    FSL_IMX6_A9MPCORE_ADDR, &error_abort);
-        }
-
-        /* All CPU but CPU 0 start in power off mode */
-        if (i) {
-            object_property_set_bool(OBJECT(&s->cpu[i]), "start-powered-off",
-                                     true, &error_abort);
-        }
-
-        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
-            return;
-        }
-    }
-
-    object_property_set_int(OBJECT(&s->a9mpcore), "num-cores", smp_cpus,
-                            &error_abort);
-
-    object_property_set_int(OBJECT(&s->a9mpcore), "num-irq",
-                            FSL_IMX6_MAX_IRQ + GIC_INTERNAL, &error_abort);
-
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cores", smp_cpus);
+    qdev_prop_set_string(DEVICE(&s->a9mpcore), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a9"));
+    qdev_prop_set_uint64(DEVICE(&s->a9mpcore), "cpu-reset-cbar",
+                         FSL_IMX6_A9MPCORE_ADDR);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "gic-spi-num",
+                         FSL_IMX6_MAX_IRQ + GIC_INTERNAL);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->a9mpcore), errp)) {
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a9mpcore), 0, FSL_IMX6_A9MPCORE_ADDR);
 
-    for (i = 0; i < smp_cpus; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + smp_cpus,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
-    }
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->ccm), errp)) {
         return;
     }
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 56f184b9ae..751053e8e3 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -99,7 +99,9 @@ static void sabrelite_init(MachineState *machine)
     sabrelite_binfo.secondary_cpu_reset_hook = sabrelite_reset_secondary;
 
     if (!qtest_enabled()) {
-        arm_load_kernel(&s->cpu[0], machine, &sabrelite_binfo);
+        CortexMPPrivState *mp = CORTEX_MPCORE_PRIV(&s->a9mpcore);
+
+        arm_load_kernel(mp->cpu[0], machine, &sabrelite_binfo);
     }
 }
 
-- 
2.41.0
