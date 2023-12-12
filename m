Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1024485ejo;
        Tue, 12 Dec 2023 08:30:03 -0800 (PST)
X-Received: by 2002:a17:906:10da:b0:a1f:8f42:ec66 with SMTP id v26-20020a17090610da00b00a1f8f42ec66mr2002877ejv.146.1702398602932;
        Tue, 12 Dec 2023 08:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398602; cv=none;
        d=google.com; s=arc-20160816;
        b=m8/Mv6WnrjL3KSaM6BZ2iVeNkoKheo5hPl9LvPhEuWkh4zDVHO17aiOk3iCUczGr+v
         aFjv783SlMo0ifxwKDRCzQrrhp93lgeWIDB/QoBzqFRfC3PUo5HcIuMjrk/Fux+33jjK
         uAK5OthtOnQ0uvdPQHUdqRxcGGIaq/vu7U82KbDn0j0XMSywUXvu5O9Z4Uov6Zyf2elL
         Iz4tn+mIs3YUgful24TrxFM6KD3Q+PAO+UIwBp6qrsnrgFy9cPoGvvs+TSpgDi9Fzkky
         w7szW+iA00I40O5CHtsXRWhJazQjidpuG0TvtSJ2rdWAeOexv3ZXXT6yAiwwik/VTBWF
         5Mgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Q6IQU5ROwUn//RvfuUSFoOspGxqF5s4e8MRFf4fb5zU=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=ULn3WdRcLp3cIp2Zmm7k/723FsbUUaNMTfJv5S+DkvNFHWbSoQ+MO/ULmTZd8eiT1n
         jc3uKDkY4LBJ3vIezTDDctdSkmpda2zBCYWfKQDScf9cgOFPQJEOk5QeY7rP+P7CRs+A
         FbhmN9/z5uQh9Il3LyQ103chBUeogEJXi6JMJzn2yd9jwxRFSorKxEdyGa7KFI/6zUX8
         dpI/YnckwcCOhycbJcZ3SUDVOYpP/iPtxhcBQ/0/CQo8DOUNxE7zf6qMD6pT9VT4FHio
         GuIxK1JlaPUdB1kH+DXpvc72FCn8mJRPOG6KPL26IjWyE2kgHqW3w/gwUkXfVhWUcFCv
         7KKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdNXECXF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ze12-20020a170906ef8c00b00a22e5cfcb69sor558498ejb.10.2023.12.12.08.30.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OdNXECXF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398602; x=1703003402; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6IQU5ROwUn//RvfuUSFoOspGxqF5s4e8MRFf4fb5zU=;
        b=OdNXECXFi3XhvnVhmcEx57+TZxEKtPKgze2JgkU8jPwVpBFCsqoDSiT8VJSP+U6SDT
         TpzS+K3aw/sEj5SS2gwfbdPXL64+kH8/6nABLfpsiFrDiU0EJbUHWH6tvAjIKjoQE9eI
         pxRseR+7xgEPzPeWgw6kL9n/KYyJRflr5xg9igXMpbe8aFjzZcX4V9Q2KeQ0yUHV94ob
         cs8Xw3Ch/2i9t/FQEjl0xLEhhkYwWRH//Sq+/g6tsS3bmHUhB0J4dgnf5LPtU8mJ+5Z/
         yWAvRBSIW43U2whzWaC+ymPdEFnGAwKwx2s5X4qi5SftAf59noVoSmALgT07sn3gxwFi
         VHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398602; x=1703003402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6IQU5ROwUn//RvfuUSFoOspGxqF5s4e8MRFf4fb5zU=;
        b=WrZU3WToYzUBBAGcR9kvDrtBtuJ1WmXes8egCiXdX/RfTZ0X9w73XTLahIy7PAv/6k
         B+jT/jKgVc7d5pAfWwHbnu2h9Vu8xXS30UeabBvAU+rmb11l3hW/eC7uZFjegg06gqxM
         JTKZp0nMlb5lA0VCFO0tNfdLdEhJADldhZoqpdbZjTkxqB4xc1IEh2spOMwrIna+7teQ
         AdVKJRJDD/IRKTWuQmKjBYHcjSL48f1njipgcGEGVXKEn9kG4s0B0o+CH/dZ8hs3IzJD
         hOuBD3d527nznMd1urCAYbuv5IskfhtXTyDo8XnVOgI4SCh/UE++emBO8qm0LkwtSFu3
         sjFQ==
X-Gm-Message-State: AOJu0YzioidAqowcVTzb1YGcNICtyRapHZVTwfwSm6ot2cTkaj9ptzb5
	IgMSfYYd/wAqccitiRZmy4B1g2nn
X-Google-Smtp-Source: AGHT+IGPms6kcaGwylnpZ0Tf8WVdt6LbbFm7Rf8FSv1VjTFbe9r66HsstVt6Q7XcCA6FptfFxEcHOA==
X-Received: by 2002:a17:906:c112:b0:9d3:f436:61e5 with SMTP id do18-20020a170906c11200b009d3f43661e5mr3884569ejc.29.1702398602437;
        Tue, 12 Dec 2023 08:30:02 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a097c5162b0sm6421593ejc.87.2023.12.12.08.30.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:30:02 -0800 (PST)
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
Subject: [PATCH 03/33] hw/arm/fsl-imx6ul: Add a local 'gic' variable
Date: Tue, 12 Dec 2023 17:29:03 +0100
Message-ID: <20231212162935.42910-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Ml9xIWtXFdpu

The A7MPCore forward the IRQs from its internal GIC.
To make the code clearer, add a 'gic' variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/fsl-imx6ul.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index e37b69a5e1..59032263cf 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -156,6 +156,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
     FslIMX6ULState *s = FSL_IMX6UL(dev);
+    DeviceState *gic;
     int i;
     char name[NAME_SIZE];
     SysBusDevice *sbd;
@@ -177,6 +178,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                             FSL_IMX6UL_MAX_IRQ + GIC_INTERNAL, &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->a7mpcore), &error_abort);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->a7mpcore), 0, FSL_IMX6UL_A7MPCORE_ADDR);
+    gic = DEVICE(&s->a7mpcore);
 
     sbd = SYS_BUS_DEVICE(&s->a7mpcore);
     d = DEVICE(&s->cpu);
@@ -213,8 +215,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_GPTn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPTn_IRQ[i]));
     }
 
     /*
@@ -238,8 +239,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_EPITn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->epit[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_EPITn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_EPITn_IRQ[i]));
     }
 
     /*
@@ -276,12 +276,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_GPIOn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPIOn_LOW_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPIOn_LOW_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_GPIOn_HIGH_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_GPIOn_HIGH_IRQ[i]));
     }
 
     /*
@@ -335,8 +333,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_SPIn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_SPIn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_SPIn_IRQ[i]));
     }
 
     /*
@@ -361,8 +358,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c[i]), 0, FSL_IMX6UL_I2Cn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_I2Cn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_I2Cn_IRQ[i]));
     }
 
     /*
@@ -399,8 +395,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_UARTn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_UARTn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_UARTn_IRQ[i]));
     }
 
     /*
@@ -449,12 +444,10 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_ENETn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_ENETn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_ENETn_IRQ[i]));
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->eth[i]), 1,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
     }
 
     /*
@@ -490,8 +483,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
                         FSL_IMX6UL_USB02_USBn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_USBn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_USBn_IRQ[i]));
     }
 
     /*
@@ -516,8 +508,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                         FSL_IMX6UL_USDHCn_ADDR[i]);
 
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->usdhc[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_USDHCn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_USDHCn_IRQ[i]));
     }
 
     /*
@@ -549,8 +540,7 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
                         FSL_IMX6UL_WDOGn_ADDR[i]);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt[i]), 0,
-                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
-                                            FSL_IMX6UL_WDOGn_IRQ[i]));
+                           qdev_get_gpio_in(gic, FSL_IMX6UL_WDOGn_IRQ[i]));
     }
 
     /*
-- 
2.41.0
