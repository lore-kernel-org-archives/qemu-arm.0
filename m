Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024392ejo;
        Tue, 12 Dec 2023 08:29:56 -0800 (PST)
X-Received: by 2002:a17:907:2cf3:b0:a19:a1ba:da67 with SMTP id hz19-20020a1709072cf300b00a19a1bada67mr2716502ejc.142.1702398596297;
        Tue, 12 Dec 2023 08:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398596; cv=none;
        d=google.com; s=arc-20160816;
        b=kNbaisGSMCQVJe8EcN6/Rsu78dbBW62LEveS2ABSqxSi0Ek2bN9YHJe/c9fK0cLbVf
         hSh4XWvTFnq8KpqHVsnOsOzmtspt7XqoZYC3psBkMUTO8BqdYSgb2fY90/h2uF9rfdk3
         8PQ47K5bkqc6BYyKxUBpf3oHzzvElraIZEed1HLaL5dw9qVPDgtjhgCjFyy7Vn0XTW5j
         IvmL7X+XFcrlGDQWcxSlI3oE+DPgFvt7/TXoLetUEyziX0K1RwdWTEVtX1rdMLv7I+Nk
         oDxCfK+HUho7peR4shUC8vTUA/yeZJbDN1C6M/OZUajN37nGYec6zvekoqsw6Jm7K1Zd
         9wHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wkDSJuoxyBvjP1+SfrO4Sh4Op/iARoVIVoTcT3nNpHc=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=zLOW+UZqP4lxifdFeKixZEU/LR4Gd0QJ0KykVWPHfYgcjfbgGZ8zjQLjQc4io1xkKz
         mzUj3veiEpKUcNut+yobsxHeAdnzkEzjpyotDGDzl0eVxiEMbSf331l11DsZDLg9v2zS
         FWk+rcpkBfpbbfbqoUr2NaMCq1sgkLGZv7dYESltiZ7njqoNfFe4neTnQBeZX5gqDNU/
         gtMHcClgE6vq3PAt4mE7vwKaCozKtH9rimflVh/3LExJewL5t27eJXLpl5HgW4f4Un3Q
         m5aHWG1ThJFVG1yEytV7gC/b5NtDXTUQ4hO1zEh5rX02QmY1tBBn4ziRjCWa3JOOHAUK
         Y8Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hn0W7OiZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e14-20020a170906844e00b00a17b71e6049sor2620335ejy.11.2023.12.12.08.29.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hn0W7OiZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398596; x=1703003396; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wkDSJuoxyBvjP1+SfrO4Sh4Op/iARoVIVoTcT3nNpHc=;
        b=hn0W7OiZ6Sx9ife2XvP+gRFCZk/61/aVsfHl4Ho46+mIVryKXS6zZmujLGfRnFdUeB
         emXONrL+eeEvBtlG02PFxRM74eYZcakqy0z0jsu2P6AmGASmGQc4ZlCsxZuqws4GmEl/
         VOrokRiXqyPPQa1w7eXb7vGEdBiMUeiSu3cq33qhLiYsd22Wiwy76R29xRZjPw7faecR
         Qu1tctjt/Ce3/OmzsSN8YXyVfAR9+dupMQbmfzDN4YsP51yOjlphfTVPoIcCnTAqExwI
         0zxi2AznIYra9oboxRNLCQn7M8nQUkzrHBYDiZxYBR16CxZBaqbXBOEoyc0k5bK0UeSu
         GMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398596; x=1703003396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkDSJuoxyBvjP1+SfrO4Sh4Op/iARoVIVoTcT3nNpHc=;
        b=ww6kaqcYGqrve2wBKpkz6eM64p0g5zw6pYP9gvCYIUFdiMHDWgs4dt7wSohTXHZzRA
         B2LL4MKEIXtND+zp1j2TAWNzlpJQzGQZMnpzG9GDP+LGP2uqW/lpp9j7Q9v3x2Wp7ki/
         w+/gcZaEsXQ+dFuvXF6+cmLebSaVemYpfX2KRymeCNiFxn+BCU+F6HQGSP+NkuDEDIm+
         Ao8dJwgKAl93rG+geM42aMW2d+RrZBgzC4/yRYCgkmGX8S3ncEU6h5lmNhaB/lnretJY
         guWGramjHxrH7qlo1fZRnl+GF7gr8+cVbbLOfj+/UzWgSpyEQEzrH60Anfzkhz5DnKIb
         7EOg==
X-Gm-Message-State: AOJu0Ywtz2ZNI0UNxSZTLXYJqwE+faYV+k/DBpj1k24Er+c1dgjKPZuY
	dePtiwdoLcWFTbz6OzyjVy/MSelE
X-Google-Smtp-Source: AGHT+IGsFKkYN3lv0vuskgvb8T6VOZUqpgjBDYUxlBVV6cC9UkAdsg4Jarhsh0UTbfBa0oxIEC9ZXg==
X-Received: by 2002:a17:906:8:b0:a18:8cf8:d632 with SMTP id 8-20020a170906000800b00a188cf8d632mr2786947eja.20.1702398595847;
        Tue, 12 Dec 2023 08:29:55 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id ss22-20020a170907c01600b00a1d781068e8sm6477375ejc.8.2023.12.12.08.29.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:29:55 -0800 (PST)
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
Subject: [PATCH 02/33] hw/arm/fsl-imx6: Add a local 'gic' variable
Date: Tue, 12 Dec 2023 17:29:02 +0100
Message-ID: <20231212162935.42910-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 03VYUDHt6Adb

The A9MPCore forward the IRQs from its internal GIC.
To make the code clearer, add a 'gic' variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6.c | 37 +++++++++++++------------------------
 1 file changed, 13 insertions(+), 24 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 7dc42cbfe6..f6edbd7465 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -111,6 +111,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     uint16_t i;
     Error *err = NULL;
     unsigned int smp_cpus = ms->smp.cpus;
+    DeviceState *gic = DEVICE(&s->a9mpcore);
 
     if (smp_cpus > FSL_IMX6_NUM_CPUS) {
         error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
@@ -186,8 +187,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->uart[i]), 0, serial_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            serial_table[i].irq));
+                           qdev_get_gpio_in(gic, serial_table[i].irq));
     }
 
     s->gpt.ccm = IMX_CCM(&s->ccm);
@@ -198,8 +198,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt), 0, FSL_IMX6_GPT_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt), 0,
-                       qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                        FSL_IMX6_GPT_IRQ));
+                       qdev_get_gpio_in(gic, FSL_IMX6_GPT_IRQ));
 
     /* Initialize all EPIT timers */
     for (i = 0; i < FSL_IMX6_NUM_EPITS; i++) {
@@ -219,8 +218,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->epit[i]), 0, epit_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->epit[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            epit_table[i].irq));
+                           qdev_get_gpio_in(gic, epit_table[i].irq));
     }
 
     /* Initialize all I2C */
@@ -240,8 +238,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, i2c_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            i2c_table[i].irq));
+                           qdev_get_gpio_in(gic, i2c_table[i].irq));
     }
 
     /* Initialize all GPIOs */
@@ -298,11 +295,9 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpio[i]), 0, gpio_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            gpio_table[i].irq_low));
+                           qdev_get_gpio_in(gic, gpio_table[i].irq_low));
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            gpio_table[i].irq_high));
+                           qdev_get_gpio_in(gic, gpio_table[i].irq_high));
     }
 
     /* Initialize all SDHC */
@@ -329,8 +324,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         }
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->esdhc[i]), 0, esdhc_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->esdhc[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            esdhc_table[i].irq));
+                           qdev_get_gpio_in(gic, esdhc_table[i].irq));
     }
 
     /* USB */
@@ -351,8 +345,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX6_USBOH3_USB_ADDR + i * 0x200);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            FSL_IMX6_USBn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6_USBn_IRQ[i]));
     }
 
     /* Initialize all ECSPI */
@@ -375,8 +368,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_table[i].addr);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            spi_table[i].irq));
+                           qdev_get_gpio_in(gic, spi_table[i].irq));
     }
 
     object_property_set_uint(OBJECT(&s->eth), "phy-num", s->phy_num,
@@ -387,11 +379,9 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->eth), 0, FSL_IMX6_ENET_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth), 0,
-                       qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                        FSL_IMX6_ENET_MAC_IRQ));
+                       qdev_get_gpio_in(gic, FSL_IMX6_ENET_MAC_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth), 1,
-                       qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                        FSL_IMX6_ENET_MAC_1588_IRQ));
+                       qdev_get_gpio_in(gic, FSL_IMX6_ENET_MAC_1588_IRQ));
 
     /*
      * SNVS
@@ -418,8 +408,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
 
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, FSL_IMX6_WDOGn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
-                                            FSL_IMX6_WDOGn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6_WDOGn_IRQ[i]));
     }
 
     /* ROM memory */
-- 
2.41.0
