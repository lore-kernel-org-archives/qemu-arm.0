Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3317229ejc;
        Tue, 10 Jan 2023 08:45:16 -0800 (PST)
X-Received: by 2002:adf:eb87:0:b0:263:56a0:4fde with SMTP id t7-20020adfeb87000000b0026356a04fdemr36787189wrn.14.1673369116273;
        Tue, 10 Jan 2023 08:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369116; cv=none;
        d=google.com; s=arc-20160816;
        b=ti2sjAveJG/cIx8H6dOKNtfHT9O1ldCmk2xZ3LZLYMxLKX18MDeVrfBc9bdBHZ3L5C
         wLHgwgfEOnLhX31SYAV80sC31Y5rWWHox+Y3CiWaI9NzcOt/fOEuT40t+pn3vJUAc5/5
         hVSFJLS/DcT82snD/jFRgxMr95+kLJw1HwoYsfQv8YEYRbubGcHmrs9QqvFdce/luUR6
         JGOZXwRcvPCs7TgDz8HdzQHCIXcIGes3JGU6FNEMOxmIu3ttDDmyfaY1Ns4XKYrY6Q44
         xqXOhBpoVC+NmNpM9JETagRrVfy0UOxAuElitsox4KSueJZyYku14AMTRnC2xApRyLgG
         DIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K3l0Ynfg0AmbqqJf0HR+g3W0vw/8lhngqGaDSaJXNM0=;
        b=DeH072VksvnXWVMIreTmqCeT0bMAcS2sqfqXn6Usx3NVk/zlzqz+PESxgNCJRySaPV
         7MlU0VOgTZ7lvOz48pYz5tNAINr98J6xjK+IdWfvqR+CKbxJWkxZko5WKE6n0i3y94J7
         uYI+oRgifSLJTHZzBz4RLpGS7J1132OHNo21TOU76+zFkmww/sh6p7rXd0NMq+bQDOE+
         irat+92UsZ4Eonqh3XirjL0FVxdu4dgCn7M5hNQbr16wTbRiAjLcnmpuonij441226pK
         MP23Cq5NIiweaFsTBx5Wa7XkBjesWXlLkBnQRyboneJN7bnx/dgWYEM2FUgLOrFgj8Iz
         Mq/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAHQ6YqD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o27-20020adfa11b000000b00241e71268cdsor4579485wro.74.2023.01.10.08.45.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qAHQ6YqD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3l0Ynfg0AmbqqJf0HR+g3W0vw/8lhngqGaDSaJXNM0=;
        b=qAHQ6YqDzVjo6VtREvLTuK2lE4b/rDxmTZFAYzRJWGjZYTFRPhlmDtijmGvdWAR3lu
         zmRJkbiBE8CLjnsL86+gcVzA89BS5jLqowasItgajTLo8fgMOQHYodAEzddZhY+2hEDq
         m36H0aPSPMSJw9BXCLRMFMsTMfVSuCc2o4G1uKTL1rIKobUxXg1wNzyu2XHC0P69ip+h
         2B+Dgt0lMWG+G87bCsHdBQdf+E4qDTjKGDi2HQJzZIRPsLzeCSjw04dauAECwDNyBekk
         yEsGpVWNamUoBgRZHJbgZqpOrBcm5ywXC7N6KzS6pMgzGtDQ8Qcuoxww1BK+Il3W5rc0
         y31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3l0Ynfg0AmbqqJf0HR+g3W0vw/8lhngqGaDSaJXNM0=;
        b=Wv1kxfsXPIhEr/V8pKZCkr/MtC/oM0bhCpPxBfcN7oOepCYZx4XQzKtChFOSd+aKfN
         U+dBcBVUxREtuYFB3siMy4D6Iv6zWfLAYQWKoNWdfUyW397JwJ1RFONLjurcTvEIK3ll
         9OBZOcQX81Z9WN2kJUI6s7hJfD5uaTXkbQyBZyv/74tp/Z9tT8EmG9X3QycPYyCYl+Ex
         XfWVmYwCH2gI6v96OwAvCcGa+8NBtgWmInfH1tXM0slUeA1RUzPRK41h2iWZ+Z8foAMJ
         EWzk4cvFE48Nn/F7M+KVyeA+iPRPG5ay9voWesstV5VYIxHy3Tn7AGCZVe3w10zv4sEK
         XUKw==
X-Gm-Message-State: AFqh2kp6mgr0t7Zvu2epPOeqQdXxWCFCgPC3P9pP+SDm9dDplIGnmMTd
	np/rSrEg3YCNzvqMSMUYreQLJxyf
X-Google-Smtp-Source: AMrXdXuWjJh1Th++nXBH4Taufu66ecbLbhvMfVIIvnbFPN7z73mF6+B79oWF/yP4uiTD6zIUn465GQ==
X-Received: by 2002:a05:6000:1f14:b0:242:5a34:fb7b with SMTP id bv20-20020a0560001f1400b002425a34fb7bmr44629557wrb.70.1673369116060;
        Tue, 10 Jan 2023 08:45:16 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id e35-20020a5d5963000000b00276d8c2332fsm13010729wri.108.2023.01.10.08.45.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:45:15 -0800 (PST)
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
Subject: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by object_new(ARMCPU)
Date: Tue, 10 Jan 2023 17:44:00 +0100
Message-Id: <20230110164406.94366-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GxlSPTvqFOAh

Replace the ARMCPU field in DigicState by a reference to
an allocated ARMCPU. Instead of initializing the field
with object_initialize(), allocate it with object_new().

As we don't access ARMCPU internal fields or size, we can
move digic.c from arm_ss[] to the more generic softmmu_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/digic.c         | 7 ++++---
 hw/arm/meson.build     | 7 ++-----
 include/hw/arm/digic.h | 4 ++--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 6df5547977..fe24b91db6 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -36,7 +36,8 @@ static void digic_init(Object *obj)
     DigicState *s = DIGIC(obj);
     int i;
 
-    object_initialize_child(obj, "cpu", &s->cpu, ARM_CPU_TYPE_NAME("arm946"));
+    s->cpu = ARM_CPU(object_new(ARM_CPU_TYPE_NAME("arm946")));
+    object_property_add_child(obj, "cpu", OBJECT(s->cpu));
 
     for (i = 0; i < DIGIC4_NB_TIMERS; i++) {
         g_autofree char *name = g_strdup_printf("timer[%d]", i);
@@ -52,12 +53,12 @@ static void digic_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd;
     int i;
 
-    if (!object_property_set_bool(OBJECT(&s->cpu), "reset-hivecs", true,
+    if (!object_property_set_bool(OBJECT(s->cpu), "reset-hivecs", true,
                                   errp)) {
         return;
     }
 
-    if (!qdev_realize(DEVICE(&s->cpu), NULL, errp)) {
+    if (!qdev_realize(DEVICE(s->cpu), NULL, errp)) {
         return;
     }
 
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index f7e1d4add6..0c7554b763 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -2,10 +2,6 @@ arm_ss = ss.source_set()
 arm_ss.add(files('boot.c'), fdt)
 arm_ss.add(when: 'CONFIG_ARM_VIRT', if_true: files('virt.c'))
 arm_ss.add(when: 'CONFIG_ACPI', if_true: files('virt-acpi-build.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
-arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
-arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
-arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
 arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
 arm_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
@@ -18,7 +14,6 @@ arm_ss.add(when: 'CONFIG_SABRELITE', if_true: files('sabrelite.c'))
 arm_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m.c'))
 arm_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210.c'))
 arm_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx.c', 'pxa2xx_gpio.c', 'pxa2xx_pic.c'))
-arm_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
 arm_ss.add(when: 'CONFIG_OMAP', if_true: files('omap1.c', 'omap2.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_A10', if_true: files('allwinner-a10.c', 'cubieboard.c'))
 arm_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3.c', 'orangepi.c'))
@@ -42,6 +37,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_SMMUV3', if_true: files('smmu-common.c'))
 softmmu_ss.add(when: 'CONFIG_ARMSSE', if_true: files('armsse.c'))
 softmmu_ss.add(when: 'CONFIG_CHEETAH', if_true: files('palm.c'))
 softmmu_ss.add(when: 'CONFIG_COLLIE', if_true: files('collie.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic.c'))
+softmmu_ss.add(when: 'CONFIG_DIGIC', if_true: files('digic_boards.c'))
 softmmu_ss.add(when: 'CONFIG_EMCRAFT_SF2', if_true: files('msf2-som.c'))
 softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4_boards.c'))
 softmmu_ss.add(when: 'CONFIG_GUMSTIX', if_true: files('gumstix.c'))
diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 646802806e..1bfd6788c9 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -18,7 +18,7 @@
 #ifndef HW_ARM_DIGIC_H
 #define HW_ARM_DIGIC_H
 
-#include "target/arm/cpu.h"
+#include "hw/arm/cpu.h"
 #include "hw/timer/digic-timer.h"
 #include "hw/char/digic-uart.h"
 #include "qom/object.h"
@@ -34,7 +34,7 @@ struct DigicState {
     DeviceState parent_obj;
     /*< public >*/
 
-    ARMCPU cpu;
+    ARMCPU *cpu;
 
     DigicTimerState timer[DIGIC4_NB_TIMERS];
     DigicUartState uart;
-- 
2.38.1
