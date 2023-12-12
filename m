Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024619ejo;
        Tue, 12 Dec 2023 08:30:11 -0800 (PST)
X-Received: by 2002:a2e:bc10:0:b0:2cb:2d10:1619 with SMTP id b16-20020a2ebc10000000b002cb2d101619mr3057725ljf.22.1702398611216;
        Tue, 12 Dec 2023 08:30:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398611; cv=none;
        d=google.com; s=arc-20160816;
        b=anAWIYBLj2ujj67NOZv9n8Kr4Ry+xVYM+9z4NuqJXp9dXZER5bBr8dZN48lHytv0pf
         6wHbX47oqXfIUuxU02GIwfC1vkYVt7hHhPgVybrCzApo5+nyEI6ws0NMKbHPNiSAiYYj
         StHbghaaYCYJSrkq0uXvBVAMUhizq55z3NS4DCIxhZVMfR5tpM+8rIx8SoGvKDd5x26o
         qDcoMy/qSlNQk/YcKxxQrjK9uyKRQwfLTp4dTSi4y6U35LYfgiMnpO6xdLeSQ8p+clGY
         L5Y9Xnq3jMf3udCu7xu+bxXErPZckD27xPq+igVCNsPTXCFEGFdwQwryxtbBLs6aTJOk
         zjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ntmhn8CuDxjNGoVZ5yGIEeRznutb1/fx3IdQEKhFga0=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=Y9aGCVIuDzUUGA0rktFUwzm8zTrimfWUqpO1GmYxNt37poBfB37uQuJntiCzCV79VL
         Zw2xeUnP0afKSEqhTbOuzI0kecfrbW5EZhC5CfJE4JjFp1q8BsSzLquuv0pxImYKK7lX
         LuiQX8mERySzJTw2wNQPB+tEJdQWbkS70sLf/v+SjEM4DkeSaVyQ16UdFVUnNWg9Gh6Z
         hw/KIKNNDbEJaJk4F2IBbd8UoCjxsDYboBNngoBdzGP+GrEuVkwFPKEA4TZRlLMX4Na2
         FkZq++cq5U/K/y73V7IYRrNT3T8GeGxmUxZWGHrDV0kPxxOZkBr0eCfN/mr9CVt1A6nF
         VTjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ6M6NVf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c21-20020a05651c015500b002c9fdadca47sor2183459ljd.15.2023.12.12.08.30.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJ6M6NVf;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398611; x=1703003411; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ntmhn8CuDxjNGoVZ5yGIEeRznutb1/fx3IdQEKhFga0=;
        b=nJ6M6NVfVTcIqecInxfL3b/XW7/jBkf6zmt18Ht7IWuVNqkhAxF0UDyrEx7jWmFrdu
         4BFDgsfgJ0CeIyOAt7/+kdA2vcJPgvSeh9NORPpjHXG5G1joNCHL1krYkpnl4a8FzkH8
         p0UOJfXjKhR1flgR4qwSoT8SuZcjTcRqaPHqCmucIejxEYmvqslPKtMjBdHVVxgKF9RS
         uBFSS4ZizfZyblEQ75F4plSLbANMlKzeefjFEYu+f4QOMVhULzwjGby6P3w8D6XzfrrS
         /wBlPZD1ekXZKLg1cGIl77DKFygzzR4vXYBW8o7+wndlv0+87hn0955V/l6UxBK3ysNa
         ufbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398611; x=1703003411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ntmhn8CuDxjNGoVZ5yGIEeRznutb1/fx3IdQEKhFga0=;
        b=ED+v01Z9ee5l9nLjoYVGu5vGpVjKU8LfdB2/AKKA8MTBAKTWm0Q5kpjkCkJdZQnhVE
         i+iOTmzUqxUrguE87VaDpvJusjXYrIdTCG2TVTI1KAx5vzQqZbU/9KbZOZxv6QhQBQxL
         hr5Zcb4FXbXj1SGOIJFoCZt9YKsiH6rh37uzpHliBvr2bqB8O4WucSdLh65+Q+Ya/dkc
         FygrN6P5EAaASrOcoxOAl9NoOSI3TbEqug1JdO3OIt8nl1OaEpAM30ScNGenc5C9ahvW
         H8DrCFX5w3Oa++nHp50tEjoQsnECKb3RwdNZwwIxYFAiSz4Qb2SKn3d5RFePwLk0r1i3
         87sA==
X-Gm-Message-State: AOJu0YxMyaJRDCTSeNDxVyJ+QjVupyGF3enK3WUKgEKrHKsei3W1RBYi
	u4mwMXKQDId3OkynEEb/LCVu0LX8
X-Google-Smtp-Source: AGHT+IHmcKLv23YcK+tsyfDylj0DqqIiRyVrHKUDnOrMisblwcfnWQWZ8TIDJqz1FNLpYJRB+MzSrA==
X-Received: by 2002:a05:651c:b0c:b0:2cb:2f4a:4ee1 with SMTP id b12-20020a05651c0b0c00b002cb2f4a4ee1mr2683827ljr.11.1702398610911;
        Tue, 12 Dec 2023 08:30:10 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id c27-20020a50d65b000000b0054c9bbd07e7sm5049547edj.54.2023.12.12.08.30.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:10 -0800 (PST)
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
Subject: [PATCH 04/33] hw/arm/fsl-imx7: Add a local 'gic' variable
Date: Tue, 12 Dec 2023 17:29:04 +0100
Message-ID: <20231212162935.42910-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LTzg433JQbxR

The A7MPCore forward the IRQs from its internal GIC.
To make the code clearer, add a 'gic' variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx7.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 474cfdc87c..a283dcb45f 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -163,6 +163,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX7State *s = FSL_IMX7(dev);
+    DeviceState *gic;
     Object *o;
     int i;
     qemu_irq irq;
@@ -209,6 +210,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX7_A7MPCORE_ADDR);
+    gic = DEVICE(&s->a7mpcore);
 
     for (i = 0; i < smp_cpus; i++) {
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->a7mpcore);
@@ -252,8 +254,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_realize(SYS_BUS_DEVICE(&s->gpt[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPTn_IRQ[i]));
     }
 
     /*
@@ -295,12 +296,10 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
                         FSL_IMX7_GPIOn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPIOn_LOW_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPIOn_LOW_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_GPIOn_HIGH_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
@@ -352,8 +351,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0,
                         FSL_IMX7_SPIn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_SPIn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_SPIn_IRQ[i]));
     }
 
     /*
@@ -378,8 +376,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, FSL_IMX7_I2Cn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_I2Cn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_I2Cn_IRQ[i]));
     }
 
     /*
@@ -413,7 +410,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, FSL_IMX7_UARTn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_UARTn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_UARTn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0, irq);
     }
 
@@ -451,9 +448,9 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth[i]), 0, FSL_IMX7_ENETn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 0));
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_ENET_IRQ(i, 0));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 0, irq);
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_ENET_IRQ(i, 3));
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_ENET_IRQ(i, 3));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 1, irq);
     }
 
@@ -480,7 +477,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
                         FSL_IMX7_USDHCn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USDHCn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_USDHCn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0, irq);
     }
 
@@ -519,8 +516,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX7_WDOGn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX7_WDOGn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX7_WDOGn_IRQ[i]));
     }
 
     /*
@@ -596,13 +592,13 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->pcie), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->pcie), 0, FSL_IMX7_PCIE_REG_ADDR);
 
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTA_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTA_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 0, irq);
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTB_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTB_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 1, irq);
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTC_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTC_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 2, irq);
-    irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_PCI_INTD_IRQ);
+    irq = qdev_get_gpio_in(gic, FSL_IMX7_PCI_INTD_IRQ);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->pcie), 3, irq);
 
     /*
@@ -631,7 +627,7 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX7_USBn_ADDR[i]);
 
-        irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore), FSL_IMX7_USBn_IRQ[i]);
+        irq = qdev_get_gpio_in(gic, FSL_IMX7_USBn_IRQ[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0, irq);
 
         snprintf(name, NAME_SIZE, "usbmisc%d", i);
-- 
2.41.0
