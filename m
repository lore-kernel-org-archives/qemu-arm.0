Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317577ejc;
        Tue, 10 Jan 2023 08:45:49 -0800 (PST)
X-Received: by 2002:a5d:670e:0:b0:2b1:a576:57ce with SMTP id o14-20020a5d670e000000b002b1a57657cemr13455815wru.43.1673369149488;
        Tue, 10 Jan 2023 08:45:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369149; cv=none;
        d=google.com; s=arc-20160816;
        b=UXW6e3A4KBxA+7NoabUccYxMnFFZHzvBjHNWcwHXPj/sbFVJrcjkO/D4t3pi0/T2f2
         pUWmeDDBTdlbgMi9p6tCtALWQRf/Q0nZpONuzU/w0ZDcrE5AsllkVUn2h3pqFuPlJ6mq
         EyWMg6khWalAdIMpgoyTZ0K1LR1rXuqLEJEst4I2dtv9PSGM/lVfbQrm3mjYSggJgEp4
         0g1Y4yikZTnNWSe6wR5Lc83dltNBTjPAwIrzJaJqvjmW1MrJECQiTaY8sf+m6e4Q1+n2
         a0zndzXfr0R4GqYR0bzCorFrwn8gicXZsdgY7cU+hb9hDRCU7WOqDY6bouLrR0n5oYQx
         8qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iBydh7B8hYLxHUy1ooqqzKsa7vKzeuojzCpUBa1Purc=;
        b=qaj930rO/gcPAVssWkO+7M+fiKQGsV+o6BANUbeUMvfrQIniSSWx2qTE4GU4KrOwrT
         uCaCMDfmHgiI4hhmGBELmFSFFVl2U66s7dc65CEajFcjFZxdoa2TW6LefRi1HBZDMphn
         QDl4Csr4NO4gh0kkp43qbcl3CyoqquTYadpIdRGPpUOojLCLUfvf9r0zhY9IVirNGqId
         8oHYS5NBVJouK/aeNJIFqH53lTfmCGaSVD7LfB7hOonBZu0ENF6BSj830wJ9WXQK2MpW
         YevRsq1WEIsZG1jSXX0pDez4FsjDMbjupiMTa60mWuMyrl/gF66cRTIVliRCV4TjMBvp
         Ll7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsXTB0IF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g2-20020adfa482000000b00288bc0af3b3sor4515772wrb.64.2023.01.10.08.45.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsXTB0IF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBydh7B8hYLxHUy1ooqqzKsa7vKzeuojzCpUBa1Purc=;
        b=xsXTB0IF08/MO+3CseRttkpCsNVVcSxRSzu4td5RO8H6MZyVine2ioY4WowLOpzIs8
         GGf3/Ghud6upzcyRBITSig5QICfqF7PeYBsRHH5dFLFiiEsgqYt2FmQz3sB7V2xnlV06
         F5KuAdoIzimrBxH/pR60dR4RI6luYbwLjEVtj/Px9FXyAMduVhSttWO6wDSNm2SSwAQV
         CNLR7gLqitswepayEhyMf7oa/Ca04PcFGiXDx+ny6YPpxpCLc9FJu8q1dlx5verHlGAT
         SIXEaYGO+gb9xZSfYGELeAW/hxwoazQAxFLUqM3VwjEM89ObaWmtMkKn8VkJwk0jUvwg
         2B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBydh7B8hYLxHUy1ooqqzKsa7vKzeuojzCpUBa1Purc=;
        b=Lr3LDYdZD5NGjy8suwzLJpwS0XfbuSE2iqi4Q/Dre2pBAvXsKECSLHajDKwAHbZPQa
         JXMiGUbK7ohmBYJ1KkiaAFz2SzgJt72dxCDjdMzLq1bKYfM1vuB6kaXw3SHI/pYirSsY
         iK7I4j3py8Fukow3EXSWM+H3V7rSOKS5RZUFURuLoEl3RZDquLO2fALRGUbOo47W7AhT
         bAlunR6zMYnZBpJY9piDH2m3Fpshlnk0F6/AZkSl4yJZ067Myas8y8o0Xs9ohR+tn0Wd
         pbduYbd3PebSu5ujfzW3LB99QQwfJjZmt++dD6jRuKOekXj4V/frDZ+/aVE6kg065RMP
         InKA==
X-Gm-Message-State: AFqh2kqAbSQHvZ5eTCT1eL0c+eqrYwklV8nt1Dkh9PY/JAPVM9OWWtlc
	QWF2jav4HKjBkmo9LMSx3JhW3izz
X-Google-Smtp-Source: AMrXdXvXRgn1kFIfW4g2RqxLe1FCZ1jLr20UXAN8+RiQUwl/DL0v+RuQT4cszAUSkyb2cPOHvt3cKQ==
X-Received: by 2002:adf:eb89:0:b0:24f:a289:b422 with SMTP id t9-20020adfeb89000000b0024fa289b422mr38744329wrn.16.1673369149211;
        Tue, 10 Jan 2023 08:45:49 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id q11-20020adf9dcb000000b00268aae5fb5bsm11894429wre.3.2023.01.10.08.45.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:48 -0800 (PST)
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
Subject: [PATCH 18/18] hw/arm/allwinner: Replace object_initialize(ARMCPU) by object_new()
Date: Tue, 10 Jan 2023 17:44:06 +0100
Message-Id: <20230110164406.94366-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3k7ibs31vwcw

Replace the ARMCPU field in both AwA10State / AwH3State by a
reference to an allocated ARMCPU. Instead of initializing the
field with object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move from arm_ss[] to the more generic softmmu_ss[] the followin
units:

 - allwinner-a10.c
 - allwinner-h3.c
 - cubieboard.c
 - orangepi.c

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/allwinner-a10.c         | 10 +++++-----
 hw/arm/allwinner-h3.c          | 14 +++++++-------
 hw/arm/cubieboard.c            |  2 +-
 hw/arm/meson.build             |  4 ++--
 include/hw/arm/allwinner-a10.h |  4 ++--
 include/hw/arm/allwinner-h3.h  |  4 ++--
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 79082289ea..685673e7bd 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -39,8 +39,8 @@ static void aw_a10_init(Object *obj)
 {
     AwA10State *s = AW_A10(obj);
 
-    object_initialize_child(obj, "cpu", &s->cpu,
-                            ARM_CPU_TYPE_NAME("cortex-a8"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a8")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     object_initialize_child(obj, "intc", &s->intc, TYPE_AW_A10_PIC);
 
@@ -71,7 +71,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     AwA10State *s = AW_A10(dev);
     SysBusDevice *sysbusdev;
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
@@ -81,9 +81,9 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbusdev = SYS_BUS_DEVICE(&s->intc);
     sysbus_mmio_map(sysbusdev, 0, AW_A10_PIC_REG_BASE);
     sysbus_connect_irq(sysbusdev, 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(sysbusdev, 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
     qdev_pass_gpios(DEVICE(&s->intc), dev, NULL);
 
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 308ed15552..1409101b3a 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -192,8 +192,8 @@ static void allwinner_h3_init(Object *obj)
     s->memmap = allwinner_h3_memmap;
 
     for (int i = 0; i < AW_H3_NUM_CPUS; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpus[i],
-                                ARM_CPU_TYPE_NAME("cortex-a7"));
+        s->cpus[i] = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("cortex-a7")));
+        object_property_add_child(obj, "cpu[*]", OBJECT(s->cpus[i]));
     }
 
     object_initialize_child(obj, "gic", &s->gic, TYPE_ARM_GIC);
@@ -239,15 +239,15 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
          * Disable secondary CPUs. Guest EL3 firmware will start
          * them via CPU reset control registers.
          */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "start-powered-off",
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "start-powered-off",
                           i > 0);
 
         /* All exception levels required */
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el3", true);
-        qdev_prop_set_bit(DEVICE(&s->cpus[i]), "has_el2", true);
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "has_el3", true);
+        qdev_prop_set_bit(DEVICE(s->cpus[i]), "has_el2", true);
 
         /* Mark realized */
-        qdev_realize(DEVICE(&s->cpus[i]), NULL, &error_fatal);
+        qdev_realize(DEVICE(s->cpus[i]), NULL, &error_fatal);
     }
 
     /* Generic Interrupt Controller */
@@ -270,7 +270,7 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
     for (i = 0; i < AW_H3_NUM_CPUS; i++) {
-        DeviceState *cpudev = DEVICE(&s->cpus[i]);
+        DeviceState *cpudev = DEVICE(s->cpus[i]);
         int ppibase = AW_H3_GIC_NUM_SPI + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
         /*
diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index 5e3372a3c7..fcb366d4ac 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -96,7 +96,7 @@ static void cubieboard_init(MachineState *machine)
     /* TODO create and connect IDE devices for ide_drive_get() */
 
     cubieboard_binfo.ram_size = machine->ram_size;
-    arm_load_kernel(&a10->cpu, machine, &cubieboard_binfo);
+    arm_load_kernel(a10->cpu, machine, &cubieboard_binfo);
 }
 
 static void cubieboard_machine_init(MachineClass *mc)
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index a7ee21e32f..06c9f1c86b 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -14,8 +14,6 @@ arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
-arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2836.c', 'raspi.c'))
 arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
 arm_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal.c', 'xlnx-versal-virt.c'))
@@ -27,6 +25,8 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmuv3.c'))
 
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
 softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index f9240ffa64..3a3ccc390f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,8 +13,8 @@
 #include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
+#include "hw/arm/cpu.h"
 
-#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 
@@ -30,7 +30,7 @@ struct AwA10State {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpu;
+    ARMCPU *cpu;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index 63025fb27c..5e8be4392e 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -47,7 +47,7 @@
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/net/allwinner-sun8i-emac.h"
 #include "hw/rtc/allwinner-rtc.h"
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "sysemu/block-backend.h"
 
 /**
@@ -121,7 +121,7 @@ struct AwH3State {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpus[AW_H3_NUM_CPUS];
+    ARMCPU *cpus[AW_H3_NUM_CPUS];
     const hwaddr *memmap;
     AwA10PITState timer;
     AwH3ClockCtlState ccu;
-- 
2.38.1
