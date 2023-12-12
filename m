Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1027267ejo;
        Tue, 12 Dec 2023 08:33:17 -0800 (PST)
X-Received: by 2002:adf:f20e:0:b0:336:352b:c449 with SMTP id p14-20020adff20e000000b00336352bc449mr540364wro.142.1702398797643;
        Tue, 12 Dec 2023 08:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398797; cv=none;
        d=google.com; s=arc-20160816;
        b=zfGkAmFjxkYnGqNI582S/NujJuny5PXOqu6UVYQXY1b7hm8ttHtnNIWpcZmgq06KLM
         cSER9p4loiBIoGAKDBMT+na0U9iGH3YZNA079X6FOJMjxbGdWAr6KiNREXKiGOdbVHwi
         g6QMoCFsMBjohZX0m/jgezD3o0+KliS8t5PCxWWIGOUGI4+08u9IZCxZrusLwZR64cZd
         kGsZoyeuGvzoXEhixBNvn7KTaXIfjEM/+VIGS6Lr2DycPt/siWXwJtl+0Eaz2ulWd73t
         H8r8HtMV2e+99E1E6CUs75JyqhiOeKW4McnW4V0SCHd8ByWy+wjDETE6dCsw8En8+9kU
         I0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=SFB3NxAZWWbFr7FqoB9z01YE2CJXVAN7E7QlxKJ0g+s=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=NSIxHpYlmb0+wvH3ynipzSZX0O8jOjAwgB3Wxwe2ve3mUlcywl0lloWqxpYYaRT+mc
         tmR9ecAhr9nXUaTPTZq3nlk9TC27wxADAOtASiMPyt1fZvPyxcjWnYlzC9Tp5SL0sZdY
         52VNp8QCLfv6VH6Jj2ZIW2D0vVcrAZpwxWqi0nG3hr39QVUKcT2c8lBz5mhJuWfNykA8
         IytQhB7ZEzRs/zC8tled98GHf78pVWJ2IYoB24vIoCg+wEPkOKyTGp6ARwOfetFgbOYI
         S4VT2nufRS1UDvMbYZyQ98aRwDEuvA6etEG+vmaQezUDOT0f2Qq3MDxo0DvDdrMcelqR
         A5wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znVEVf8J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n7-20020a5d51c7000000b0033331a50e48sor2797860wrv.4.2023.12.12.08.33.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=znVEVf8J;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398797; x=1703003597; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SFB3NxAZWWbFr7FqoB9z01YE2CJXVAN7E7QlxKJ0g+s=;
        b=znVEVf8Jha+2qJt4YYPv0FEdy0Fu7JlB88zowAGI+B+H60zbMOdwsJ01hpPkg0d8ml
         tffT12q9pc0D2mjHkDAUtSscu2MDdU7WD7+QRhaCGNbpjgCnbpTqqtpdZqy7yggB2grA
         D/qC7p1rQ/UcgJhsZwKWd51P3Z3TiHRq7zuUEguuFFNXEEzD+Wc1daeASUEQIVg2Klcl
         al60ccSigzmV2ME29i5A4q1Y+t3krf/jMzq7XqqNLP0UbF6LgPIOBgmvlyaJ3UTrlNy4
         hdmE070Vr9BGiX96UgIXiVqgoksqHNd7LIu9NLVHVmo+RGlBr01RfCOM6vPIcetMSdq8
         aSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398797; x=1703003597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFB3NxAZWWbFr7FqoB9z01YE2CJXVAN7E7QlxKJ0g+s=;
        b=a+kqodFNf3z+KCHl6A2D5j0HHnoip5TET5qX1EAL+lh2UjqNwCd+Wxp5UF7GLnoIhz
         E4lZ45AEfvXkamwmUutogPq2fVn5CiJwbRACLUiOaqp0JZhN6nRzSry9hRKV6japtJlK
         EnUPj8DTJSEeucXJD8P1jCz0HH8Oi8/4ihaTm5DY3SOxjOKJzLMncRzKV7rSZuKIfcUr
         381sxOhXSby87jkNCYDk4nn7xfM/GN2yRSuyWovYxjVP7/XVXHCZj7Psi09g7SG2KZFc
         2/EknmeEvDKWRwuLOIagxM+UIQCa3k0HrrO2WNuCezofZhg+rLRumiSX/JwNGPwsm+nD
         xxtw==
X-Gm-Message-State: AOJu0Yx9fluk1g8q2tDmJqRSaUCx6JKjde/5XXR6wKRkogdgKwn55PkN
	ERljjS+jUousvmhAtF87gLCIgsmB
X-Google-Smtp-Source: AGHT+IF/Bv+SYKqQ/vreqMkben2eOy7NiWdMzNo30Nbt3ZjnzqeGSMKoTfcP2S6EA6QlpWI0J9qLLA==
X-Received: by 2002:adf:faca:0:b0:333:85e:a122 with SMTP id a10-20020adffaca000000b00333085ea122mr2648323wrs.7.1702398797275;
        Tue, 12 Dec 2023 08:33:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b0033335d9dcc5sm11246500wrq.64.2023.12.12.08.33.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:33:16 -0800 (PST)
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
Subject: [PATCH 30/33] hw/arm/npcm7xx: Let the A9MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:30 +0100
Message-ID: <20231212162935.42910-31-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: s7X9ryo8I1j3

Set the properties on the mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/npcm7xx.h |  1 -
 hw/arm/npcm7xx.c         | 48 ++++++++++------------------------------
 2 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 7abbf85cbf..e0737fa4de 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -80,7 +80,6 @@ typedef struct NPCM7xxMachineClass {
 struct NPCM7xxState {
     DeviceState         parent;
 
-    ARMCPU              cpu[NPCM7XX_MAX_NUM_CPUS];
     A9MPPrivState       a9mpcore;
 
     MemoryRegion        sram;
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 5b6e968fa9..1154a0f0a5 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -363,9 +363,11 @@ static struct arm_boot_info npcm7xx_binfo = {
 
 void npcm7xx_load_kernel(MachineState *machine, NPCM7xxState *soc)
 {
+    CortexMPPrivState *mp = CORTEX_MPCORE_PRIV(&soc->a9mpcore);
+
     npcm7xx_binfo.ram_size = machine->ram_size;
 
-    arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
+    arm_load_kernel(mp->cpu[0], machine, &npcm7xx_binfo);
 }
 
 static void npcm7xx_init_fuses(NPCM7xxState *s)
@@ -400,11 +402,6 @@ static void npcm7xx_init(Object *obj)
     NPCM7xxState *s = NPCM7XX(obj);
     int i;
 
-    for (i = 0; i < NPCM7XX_MAX_NUM_CPUS; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[i],
-                                ARM_CPU_TYPE_NAME("cortex-a9"));
-    }
-
     object_initialize_child(obj, "a9mpcore", &s->a9mpcore, TYPE_A9MPCORE_PRIV);
     object_initialize_child(obj, "gcr", &s->gcr, TYPE_NPCM7XX_GCR);
     object_property_add_alias(obj, "power-on-straps", OBJECT(&s->gcr),
@@ -471,40 +468,19 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    /* CPUs */
-    for (i = 0; i < nc->num_cpus; i++) {
-        object_property_set_int(OBJECT(&s->cpu[i]), "mp-affinity",
-                                arm_cpu_mp_affinity(i, NPCM7XX_MAX_NUM_CPUS),
-                                &error_abort);
-        object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
-                                NPCM7XX_GIC_CPU_IF_ADDR, &error_abort);
-        object_property_set_bool(OBJECT(&s->cpu[i]), "reset-hivecs", true,
-                                 &error_abort);
-
-        /* Disable security extensions. */
-        object_property_set_bool(OBJECT(&s->cpu[i]), "has_el3", false,
-                                 &error_abort);
-
-        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
-            return;
-        }
-    }
-
     /* A9MPCORE peripherals. Can only fail if we pass bad parameters here. */
-    object_property_set_int(OBJECT(&s->a9mpcore), "num-cores", nc->num_cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->a9mpcore), "num-irq", NPCM7XX_NUM_IRQ,
-                            &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "num-cores", nc->num_cpus);
+    qdev_prop_set_string(DEVICE(&s->a9mpcore), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a9"));
+    /* Disable security extensions. */
+    qdev_prop_set_bit(DEVICE(&s->a9mpcore), "cpu-has-el3", false);
+    qdev_prop_set_uint64(DEVICE(&s->a9mpcore), "cpu-reset-cbar",
+                         NPCM7XX_GIC_CPU_IF_ADDR);
+    qdev_prop_set_bit(DEVICE(&s->a9mpcore), "cpu-reset-hivecs", true);
+    qdev_prop_set_uint32(DEVICE(&s->a9mpcore), "gic-spi-num", NPCM7XX_NUM_IRQ);
     sysbus_realize(SYS_BUS_DEVICE(&s->a9mpcore), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a9mpcore), 0, NPCM7XX_CPUP_BA);
 
-    for (i = 0; i < nc->num_cpus; i++) {
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_IRQ));
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->a9mpcore), i + nc->num_cpus,
-                           qdev_get_gpio_in(DEVICE(&s->cpu[i]), ARM_CPU_FIQ));
-    }
-
     /* L2 cache controller */
     sysbus_create_simple("l2x0", NPCM7XX_L2C_BA, NULL);
 
-- 
2.41.0
