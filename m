Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026510ejo;
        Tue, 12 Dec 2023 08:32:21 -0800 (PST)
X-Received: by 2002:a05:600c:3c89:b0:40c:4a4d:b53c with SMTP id bg9-20020a05600c3c8900b0040c4a4db53cmr1482017wmb.162.1702398741219;
        Tue, 12 Dec 2023 08:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398741; cv=none;
        d=google.com; s=arc-20160816;
        b=x2wl61f+1lkFjuVQItZCbyaNKa80O1+ix6EwAtlj0MvfXkIBAyaEj2cg4YzOOm2yKv
         w0hhXXSJb+txSBUuOQdejoHxH534l7JpwBOz9Fup6hbl+qKyFlNDTHNGKFGSmCqTzjlh
         xFsS8qq+gOcGYjuYzIfV9bjMDjSlhzso3TR5smx53SjxjoIkdECRfaOUX8VqsYYuaofw
         NYK+tpWqQoWnIRWodnlocqxAJl/TU6ueSNuYKvhKxYJpudsV+Ef9dcqjoPaaMqVxUFWz
         OBXidHbaZ61GrS+OkM4fpUK7gZBndETejMLHok42Wsh7GoVJEU6YRjD/laIXWfU8/Y19
         LQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kzj0QIV76sF9kTXgAEz5Ob/+QDKCBIz99cjFrJTa8Ik=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=WzQ5tvDydI/J+kAGEWZnT/iJzKbHcvPuk91uz+YwX/OfnRNZbAqPtGP+iRPWalSvcJ
         YJiGX29kYPgaHUr8PCo0ZrxR/eXHXEM2RS4GNVrEcred/lKy4bI1DHg+jX+0VQJGMVjh
         lx5bTLuigkTNWCfffjwD1we9axklF2gvR5S+x9PrMlxb+fZoQFTV3bfGwkWalDVs7IWc
         okG5DTNJSqLYVZHqBPLXBTTLJvEU5S3w9/gO7wsKBQJM8BdAN5hRSE3ZZtdUovFkveUz
         lpbf2AWw8BFITIODRYLRa6B/XANa0m507OelZZEu/Yjrz+h0TSHrTlLt+kvnxMHC/nuw
         VyQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ledY1tGT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w34-20020a05600c09a200b0040c261769a3sor3683202wmp.11.2023.12.12.08.32.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:21 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ledY1tGT;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398741; x=1703003541; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzj0QIV76sF9kTXgAEz5Ob/+QDKCBIz99cjFrJTa8Ik=;
        b=ledY1tGTnk9gg2Fsl3RWn5kj5LnQ4CTJRGb9aUNtD0O1Ma31798FgIu3HqUIZljcO/
         Lz7MaFaufAQu4obLEOaXDzPd6tqJ0HMtnMGZqt+6CUq6dNSL/n3T+uLyin5bst/HcZzX
         7Nk837uQWQ6S2GnjD8E/NUrsfavHW2tgsScak772e+qocnZn+M8L2H+njiO7pDbzJqM3
         Pv1bOIEbBO3AknfcbcJHzrfip5rZ1x2cVBUtmFFZcQT3M4/sq770xOv05nJojKwlBycQ
         E1XJMTHz3Vyy9T6ryUr5j3TT0tYSMRB7WN4wLJVnJe8aO5dfm1CxUXkDTD1GXHa9PNTB
         H3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398741; x=1703003541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kzj0QIV76sF9kTXgAEz5Ob/+QDKCBIz99cjFrJTa8Ik=;
        b=jzOckRF291akG6zbuEyYF40euBLZ6wIZ8KCj2MRYiPzRc+9+yuLB6JsM/eftm+bxn9
         bOWWZj+0+HeeENwOjYRl69kobkqnyjRMu5QM4f2g7Nsim3mGpotADH5Dmvo9hwdYjeAf
         0REtNvLaMEaMZg1xZL9em37isqVBVz88wtrz9Rf4CzAffvOVBA2noTKGVARVnr9it718
         obRlBdowpMK99yffZTgRwPQtxKqlSFs+ecDuMMDt0/fLwjKQNu3+Z1It0ra8rQa+MkG1
         vO6yhgspWfnNLXVJO0UdFIiZ9sFsYWpuMeIoORDdy9Z4aCeX6cxPEG24iKcGCz0Q7bJ0
         Uo9g==
X-Gm-Message-State: AOJu0YwmcBvyfxe1DpnbsNkjl4giaN2ObAImCyVbQUya0a0UZeFWCjT0
	Z9Bc7Bwnx0rIIUaGg1mEVTxMho8V
X-Google-Smtp-Source: AGHT+IFvh0mZGIpHP1qTEcoTuOmgm6gU4WNQO3j50QB9RftB4/aBhWiHlumMR0/nxRxAF0gdqqmIug==
X-Received: by 2002:a05:600c:1688:b0:40b:369e:6951 with SMTP id k8-20020a05600c168800b0040b369e6951mr3106268wmn.28.1702398740782;
        Tue, 12 Dec 2023 08:32:20 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c450d00b00405c7591b09sm17152033wmo.35.2023.12.12.08.32.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:20 -0800 (PST)
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
Subject: [PATCH 22/33] hw/arm/aspeed_ast2600: Let the A7MPcore create/wire the CPU cores
Date: Tue, 12 Dec 2023 17:29:22 +0100
Message-ID: <20231212162935.42910-23-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aHq1dF+15hfX

Set the properties on the a7mpcore object to let it create and
wire the CPU cores. Remove the redundant code.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h |  1 -
 hw/arm/aspeed_ast2600.c     | 58 ++++++++++++-------------------------
 2 files changed, 18 insertions(+), 41 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 2f51d78e22..a824679b1e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -109,7 +109,6 @@ struct Aspeed2600SoCState {
     AspeedSoCState parent;
 
     CortexMPPrivState a7mpcore;
-    ARMCPU cpu[ASPEED_CPUS_NUM]; /* XXX belong to a7mpcore */
 };
 
 #define TYPE_ASPEED2600_SOC "aspeed2600-soc"
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 88e2a23514..1000fac675 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -156,10 +156,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
         g_assert_not_reached();
     }
 
-    for (i = 0; i < sc->num_cpus; i++) {
-        object_initialize_child(obj, "cpu[*]", &a->cpu[i], sc->cpu_type);
-    }
-
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
     object_initialize_child(obj, "scu", &s->scu, typename);
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
@@ -270,11 +266,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
  *
  * https://developer.arm.com/documentation/ddi0388/e/the-system-control-coprocessors/summary-of-system-control-coprocessor-registers/multiprocessor-affinity-register
  */
-static uint64_t aspeed_calc_affinity(int cpu)
-{
-    return (0xf << ARM_AFF1_SHIFT) | cpu;
-}
-
 static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
 {
     int i;
@@ -284,6 +275,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     qemu_irq irq;
     g_autofree char *sram_name = NULL;
+    DeviceState *mpdev;
+    CortexMPPrivState *mppriv;
 
     /* Default boot region (SPI memory or ROMs) */
     memory_region_init(&s->spi_boot_container, OBJECT(s),
@@ -305,42 +298,26 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                                   "aspeed.emmc-boot-controller",
                                   sc->memmap[ASPEED_DEV_EMMC_BC], 0x1000);
 
-    /* CPU */
-    for (i = 0; i < sc->num_cpus; i++) {
-        if (sc->num_cpus > 1) {
-            object_property_set_int(OBJECT(&a->cpu[i]), "reset-cbar",
-                                    ASPEED_A7MPCORE_ADDR, &error_abort);
-        }
-        object_property_set_int(OBJECT(&a->cpu[i]), "mp-affinity",
-                                aspeed_calc_affinity(i), &error_abort);
-
-        object_property_set_int(OBJECT(&a->cpu[i]), "cntfrq", 1125000000,
-                                &error_abort);
-        object_property_set_bool(OBJECT(&a->cpu[i]), "neon", false,
-                                &error_abort);
-        object_property_set_bool(OBJECT(&a->cpu[i]), "vfp-d32", false,
-                                &error_abort);
-        object_property_set_link(OBJECT(&a->cpu[i]), "memory",
-                                 OBJECT(s->memory), &error_abort);
-
-        if (!qdev_realize(DEVICE(&a->cpu[i]), NULL, errp)) {
-            return;
-        }
-    }
-
     /* A7MPCORE */
-    object_property_set_int(OBJECT(&a->a7mpcore), "num-cores", sc->num_cpus,
-                            &error_abort);
-    object_property_set_int(OBJECT(&a->a7mpcore), "num-irq",
-                            ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32),
-                            &error_abort);
-
+    mpdev = DEVICE(&a->a7mpcore);
+    qdev_prop_set_uint32(mpdev, "cluster-id", 0xf);
+    qdev_prop_set_uint32(mpdev, "num-cores", sc->num_cpus);
+    qdev_prop_set_string(mpdev, "cpu-type", sc->cpu_type);
+    qdev_prop_set_uint64(mpdev, "cpu-freq-hz", 1125000000);
+    qdev_prop_set_bit(mpdev, "cpu-has-neon", false);
+    qdev_prop_set_bit(mpdev, "cpu-has-vfp-d32", false);
+    qdev_prop_set_uint64(mpdev, "cpu-reset-cbar", ASPEED_A7MPCORE_ADDR);
+    object_property_set_link(OBJECT(&a->a7mpcore), "cpu-memory",
+                             OBJECT(s->memory), &error_abort);
+    qdev_prop_set_uint32(mpdev, "gic-spi-num",
+                         ROUND_UP(AST2600_MAX_IRQ + GIC_INTERNAL, 32));
     sysbus_realize(SYS_BUS_DEVICE(&a->a7mpcore), &error_abort);
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->a7mpcore), 0, ASPEED_A7MPCORE_ADDR);
+    mppriv = CORTEX_MPCORE_PRIV(&a->a7mpcore);
 
     for (i = 0; i < sc->num_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&a->a7mpcore);
-        DeviceState  *d   = DEVICE(&a->cpu[i]);
+        DeviceState  *d   = DEVICE(mppriv->cpu[i]);
 
         irq = qdev_get_gpio_in(d, ARM_CPU_IRQ);
         sysbus_connect_irq(sbd, i, irq);
@@ -353,7 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* SRAM */
-    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
+    sram_name = g_strdup_printf("aspeed.sram.%d",
+                                CPU(mppriv->cpu[0])->cpu_index);
     memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.41.0
