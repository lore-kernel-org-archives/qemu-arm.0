Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp533255ejx;
        Wed, 22 Nov 2023 10:31:39 -0800 (PST)
X-Received: by 2002:a2e:a498:0:b0:2c5:5926:de52 with SMTP id h24-20020a2ea498000000b002c55926de52mr2183052lji.53.1700677899078;
        Wed, 22 Nov 2023 10:31:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700677899; cv=none;
        d=google.com; s=arc-20160816;
        b=kbAchBVdCE56tQnn61QOh1xkjDhshB9NMz/E41QjLuquBR49I1Bk7HzcnvYMwePRFH
         e2Qch1NeHppvB02VjIE4XZrK/y8V067A1NOMfb4HOGwAd7Sgn40oBORvV0C5cNijA+80
         PjDhZkAugmG1fn4+Nd8xx50cs5NMfXVku94lEjosd2DRA3MQISvAWh5p8vVUsophdICS
         PxSytIbZThphd8L1kjy1XTLymHNaT2V6TLGoA72BYgamIxQxE0JqCuqO4Tu+RFPiO5Au
         z/xY/XxiHC+EqdGwcYl0O4EKQ83+CYLJpCEpnkOU3HKYmqIWEJPGnbqJCk9fdRt2r++v
         qvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=juSImIqOFX4cBg5Zc+Do2T+lJUxoOW0iOapk4mN+Z7o=;
        fh=aTzmneatFEDiKMS1saCdxZb39+p//OutFupiUjvLGTw=;
        b=ng15/+EOpOPHOLEUidQ3GUoaJHbID3s18/U675P+RRuqpzq7Ja6y4ZNAoEX5kZxFDD
         ZS4ViyWwy1Yb4Lrnb+qXZwBRfEWoYfhIeEkX2kioPUueoyTz46RDj53AtbXYON9SUpdw
         2vibFhVz26aKtmenau0xl1ITKmtfUZHFMVM6QOAfl/a4XoUlHDcjNaqVdHQnIl3uspm6
         lPUcpg+xWHjZ17Vhej1qRwu3htiMEq6DLA8kkYhrOIHHLJOHdtmRnfMnT8/22wx0W0xs
         C5cftr/nQZpIenP+WmekEW7NJCLhzO2PRBVuMeufPehg0e0UN8/iCBUxEq9JJQUGhc9W
         jrYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VqcNj+/o";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n40-20020a05600c502800b0040b2bd689fdsor28366wmr.1.2023.11.22.10.31.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Nov 2023 10:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="VqcNj+/o";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700677898; x=1701282698; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juSImIqOFX4cBg5Zc+Do2T+lJUxoOW0iOapk4mN+Z7o=;
        b=VqcNj+/oa0K1WcdMNa0MSh/hIh8XwoHfD4qAUHr0fzeHzfosIG5gx9TTpCOQ7AWhuW
         a5292b2qBwc0M1Fsh13jrjwa5NU/sbyFh3FMEpm6b4ZkSU2zlT+Hm71xPDZiAZ7iZl2W
         4G1dvBJTQqElV/OWTtNFQVWVnMNhq9zcFyyTa6IEoPfqWle/LVyG21i/USR3eNGPG6A7
         nyDbjaX3flBut9lSxqhpRvUyp9GKCfnh8Px13Coh//eu2rfOApIdWPhYI5bOvpOwX/1t
         /6k8cheBGnxSfKYsFnRT8ZiVklHazYU9kb8+Pht+5O846t9pAmjAJp+agt7C8enhNzA4
         3qJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677898; x=1701282698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juSImIqOFX4cBg5Zc+Do2T+lJUxoOW0iOapk4mN+Z7o=;
        b=GkQUwI6eudBijHt8P6j93cJwWXd45x0+DaX2ylD8hSes8avwkk6VAMVal+t4LpUoHx
         CbVhlqmKND+LfY6usP0zFr70aRuWgKH+uDZafdetSDM2Ho110d2X6mImpaymYz1dv07d
         TswumqvGyY8SDjr394xbL2yFHhKeIB5KAWIWkqjABZeKQSGJkwIMPol/h9OHGMyEH9a3
         nAn0eYF/5pcX8Qa1fmb0xQIgjN8yTRhW6Ex/L+eJWhipmsqH18y5OJz2t/BlmfPciWaW
         3JbflbydFv6erkfRsx4ZlRPivwcTprtFxDG8rZWm3V3SvhrQEyuM2QbzqgMnjWTduvMX
         rgaQ==
X-Gm-Message-State: AOJu0YzWrUQMP9JOv1rr3N5O3kRnvJI69s1JJDkdC7l+RDHLVsxP65Dl
	VuVVlmZKCK7V2QhxQkm42xvWigW5
X-Google-Smtp-Source: AGHT+IEDhZssPByOJSwxEJVD+BQeS0gJKpv55Tt6F3/9rP1iAZJ3KJSnJODJSNYMYHo+HTAjjtT9mw==
X-Received: by 2002:a05:600c:4f01:b0:409:773:cf62 with SMTP id l1-20020a05600c4f0100b004090773cf62mr2223036wmq.39.1700677898695;
        Wed, 22 Nov 2023 10:31:38 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (pas38-h02-176-184-5-64.dsl.sta.abo.bbox.fr. [176.184.5.64])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b003feae747ff2sm261799wmq.35.2023.11.22.10.31.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Nov 2023 10:31:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH-for-9.0 09/11] hw/arm/bcm2836: Allocate ARM CPU state with object_new()
Date: Wed, 22 Nov 2023 19:30:45 +0100
Message-ID: <20231122183048.17150-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122183048.17150-1-philmd@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RZAV7BHjsFsh

The ARMCPU type is forward declared as a pointer to all hw/ files.
Its declaration is restricted to target/arm/ files. By using a
pointer in BCM283XState instead of embedding the whole CPU state,
we don't need to include "cpu.h" which is target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/bcm2836.h |  4 ++--
 hw/arm/bcm2836.c         | 19 ++++++++++---------
 hw/arm/raspi.c           |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 6f90cabfa3..784bab0aad 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -14,7 +14,7 @@
 
 #include "hw/arm/bcm2835_peripherals.h"
 #include "hw/intc/bcm2836_control.h"
-#include "target/arm/cpu.h"
+#include "target/arm/cpu-qom.h"
 #include "qom/object.h"
 
 #define TYPE_BCM283X "bcm283x"
@@ -38,7 +38,7 @@ struct BCM283XState {
     uint32_t enabled_cpus;
 
     struct {
-        ARMCPU core;
+        ARMCPU *core;
     } cpu[BCM283X_NCPUS];
     BCM2836ControlState control;
     BCM2835PeripheralState peripherals;
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8031a74600..4f5acee77e 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -39,8 +39,9 @@ static void bcm2836_init(Object *obj)
     int n;
 
     for (n = 0; n < bc->core_count; n++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[n].core,
-                                bc->cpu_type);
+        s->cpu[n].core = ARM_CPU(object_new(bc->cpu_type));
+        object_property_add_child(obj, "cpu[*]", OBJECT(s->cpu[n].core));
+        qdev_realize_and_unref(DEVICE(s->cpu[n].core), NULL, &error_abort);
     }
     if (bc->core_count > 1) {
         qdev_property_add_static(DEVICE(obj), &bcm2836_enabled_cores_property);
@@ -139,24 +140,24 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
         object_property_set_bool(OBJECT(&s->cpu[n].core), "start-powered-off",
                                  n >= s->enabled_cpus, &error_abort);
 
-        if (!qdev_realize(DEVICE(&s->cpu[n].core), NULL, errp)) {
+        if (!qdev_realize(DEVICE(s->cpu[n].core), NULL, errp)) {
             return;
         }
 
         /* Connect irq/fiq outputs from the interrupt controller. */
         qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_IRQ));
+                qdev_get_gpio_in(DEVICE(s->cpu[n].core), ARM_CPU_IRQ));
         qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
-                qdev_get_gpio_in(DEVICE(&s->cpu[n].core), ARM_CPU_FIQ));
+                qdev_get_gpio_in(DEVICE(s->cpu[n].core), ARM_CPU_FIQ));
 
         /* Connect timers from the CPU to the interrupt controller */
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_PHYS,
+        qdev_connect_gpio_out(DEVICE(s->cpu[n].core), GTIMER_PHYS,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_VIRT,
+        qdev_connect_gpio_out(DEVICE(s->cpu[n].core), GTIMER_VIRT,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_HYP,
+        qdev_connect_gpio_out(DEVICE(s->cpu[n].core), GTIMER_HYP,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq", n));
-        qdev_connect_gpio_out(DEVICE(&s->cpu[n].core), GTIMER_SEC,
+        qdev_connect_gpio_out(DEVICE(s->cpu[n].core), GTIMER_SEC,
                 qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq", n));
     }
 }
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index cc4c4ec9bf..01c391b90a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -252,7 +252,7 @@ static void setup_boot(MachineState *machine, RaspiProcessorId processor_id,
         s->binfo.firmware_loaded = true;
     }
 
-    arm_load_kernel(&s->soc.cpu[0].core, machine, &s->binfo);
+    arm_load_kernel(s->soc.cpu[0].core, machine, &s->binfo);
 }
 
 static void raspi_machine_init(MachineState *machine)
-- 
2.41.0
