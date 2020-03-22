Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp685301lfi;
        Sun, 22 Mar 2020 14:24:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtL7ess+Py7D6zxrywjZPf+iGYkxD8IbYzykuKPVlnfhWKOk0GUnoZ26anUBzLVO+0KvehX
X-Received: by 2002:a37:a213:: with SMTP id l19mr17322937qke.377.1584912296391;
        Sun, 22 Mar 2020 14:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584912296; cv=none;
        d=google.com; s=arc-20160816;
        b=mjGxTxHBfwiM8Akxl01c/bl1b2lhXayA0DkCyJHIkWWpCc6GTv3OaRhVVadtBfPZEv
         /JZy19F2ZsW52EDMAV81Ct7T2o2m1bNsB7ovi9tI8uiMCCAt9jGoJ62RBlAd9i0GDKjD
         9A5UmPCV3loPWHQ3vCfR4iVUsPmpic/ZiYqOtPPYfssIiIliXzRn6z7TdBxTSJNT+7wO
         vnKLp94w3wd0CQAOzocbtq1OZ6ZAmM5Ih+P4Y7lHk7lxeweFhl//LMYyyNPd/8A8/Thl
         arZatJRGCAEC1Ql2jLShkc8LSw2PcfFZ7qdgRD2grN+sEEt6R40kfSdFZphck/simavk
         l2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/KJgg3GQUYAWBtiiHqyoNKWjmdOXcRV798ZDLG19ILg=;
        b=q4vWQmoS5QzZFrGP91r9Ip20GeclqvWdjzqnjZmK9L8ESqDZpL+I93hB0Qj1TbnDlk
         spLUBIRNLitS/BTEID3p1Zo/dmBf2Zzr3YdjKyTXw3hEaRNtEWDk8Wmo9CLKFG0eIK2o
         Z5jKcrDDMOHe//5AHvn/Ev7AwWdrr1n131UDN31mYvFnXfwks79qK96hwIN6ERM7vf4d
         t8r08IVWr8AXWRLv8eYoTBa72FIxQOtVXUT8NYkj8rXINkpcUZr1eP/ubxfqa6oNyU5r
         1cMCO1bNvrDu8d+8zMD2ChMBZB+lKVa+HGfpwu4P6RuEqtF68FkbfFtgcgodJW29csTt
         FBPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e80G1yMo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si1732148qkg.48.2020.03.22.14.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Mar 2020 14:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e80G1yMo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jG85X-0000vO-SK
	for alex.bennee@linaro.org; Sun, 22 Mar 2020 17:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42841)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jG80O-0002tX-HP
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jG80M-0002ke-4D
 for qemu-devel@nongnu.org; Sun, 22 Mar 2020 17:19:36 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jG80K-0002jf-Q9; Sun, 22 Mar 2020 17:19:32 -0400
Received: by mail-pl1-x643.google.com with SMTP id g2so5002201plo.3;
 Sun, 22 Mar 2020 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/KJgg3GQUYAWBtiiHqyoNKWjmdOXcRV798ZDLG19ILg=;
 b=e80G1yMo8g4WpgqVlt8ECnyB1a18hfmd19HHCr/2hV9y3jpmb2WLC7/QgEKqTGv9gJ
 pfWgsxsMFHixa6ISPY96SXO+FVAhq4w67Owz3J9josn6Se37FBDSnUDsm6w/jsRDQamc
 dBouPjVwcuNt6cK851fSYqwlwgPWsYMfFRzpCdUz9On1GUNcwadE42hMyhTw1Ps80vYq
 DH4gVKAeBtsxMjScDvqW1E+gJa+qBG32WQFWt0dtIBGRsCaNqs6lAfUHnDGLeeSoATot
 yxiw14lHKxovQklVVmBsPJsKYZ+xqCcslrfGOEsuvXsE55c22pb5dbXkZ8FopKIH3d8K
 AdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/KJgg3GQUYAWBtiiHqyoNKWjmdOXcRV798ZDLG19ILg=;
 b=smDldahdZIF4nChogucUIXHewBa5f0tjxoSrpZ1jGk8IQ7LJixdRVppbbEl0HoKxWz
 bQSbhjW0qZyN/fkLUzN80CActB2qTmn2sQMT+98XkdhyCnvzYW/E6E7GLtuvDXmfV8mD
 0qKTFelGM2gCVYVxpDLg1EEu6VboHR7G3K52hqUF+eL4+prSfFxJcEciBH7AFhzgtAkv
 ih8Hz43dkcRRkW4ZuEN9fUO6tdlhG6g6421ejYpnVWfa2p2d3Z/BJs9OWg9kNPCDi8yA
 7kDEZyBM9UHyh8lXCF4ePWN6JX416aIsoMlokSOuYtlRa+P4PvHBI8wVMw6XEJBMapJY
 ntGg==
X-Gm-Message-State: ANhLgQ29trN5x14qxxFhfLY8tTJpXaez9rK6kiScRIOfN2d3xYDhVQ6Q
 h1Ubp9ydkZ1RNX0k0yIHEfc=
X-Received: by 2002:a17:90a:2149:: with SMTP id
 a67mr21943829pje.190.1584911970883; 
 Sun, 22 Mar 2020 14:19:30 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y30sm11707064pff.67.2020.03.22.14.19.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Mar 2020 14:19:30 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/8] hw/arm/fsl-imx25: Wire up watchdog
Date: Sun, 22 Mar 2020 14:19:14 -0700
Message-Id: <20200322211919.11335-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200322211919.11335-1-linux@roeck-us.net>
References: <20200322211919.11335-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-devel@nongnu.org,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bpfotcPQqNhl

With this commit, the watchdog on imx25-pdk is fully operational,
including pretimeout support.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Select WDT_IMX2 explicitly
    Added Philippe's Reviewed-by: tag

 hw/arm/Kconfig             |  1 +
 hw/arm/fsl-imx25.c         | 10 ++++++++++
 include/hw/arm/fsl-imx25.h |  5 +++++
 3 files changed, 16 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index adf401e827..54a49aeabd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -358,6 +358,7 @@ config FSL_IMX25
     select IMX
     select IMX_FEC
     select IMX_I2C
+    select WDT_IMX2
     select DS1338
 
 config FSL_IMX31
diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index 6f1a82ce3d..cdaa79c26b 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -87,6 +87,7 @@ static void fsl_imx25_init(Object *obj)
                               TYPE_CHIPIDEA);
     }
 
+    sysbus_init_child_obj(obj, "wdt", &s->wdt, sizeof(s->wdt), TYPE_IMX2_WDT);
 }
 
 static void fsl_imx25_realize(DeviceState *dev, Error **errp)
@@ -302,6 +303,15 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                             usb_table[i].irq));
     }
 
+    /* Watchdog */
+    object_property_set_bool(OBJECT(&s->wdt), true, "pretimeout-support",
+                             &error_abort);
+    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, FSL_IMX25_WDT_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->wdt), 0,
+                                      qdev_get_gpio_in(DEVICE(&s->avic),
+                                                       FSL_IMX25_WDT_IRQ));
+
     /* initialize 2 x 16 KB ROM */
     memory_region_init_rom(&s->rom[0], OBJECT(dev), "imx25.rom0",
                            FSL_IMX25_ROM0_SIZE, &err);
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index 5e196bbf05..9e228dacea 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -29,6 +29,7 @@
 #include "hw/gpio/imx_gpio.h"
 #include "hw/sd/sdhci.h"
 #include "hw/usb/chipidea.h"
+#include "hw/watchdog/wdt_imx2.h"
 #include "exec/memory.h"
 #include "target/arm/cpu.h"
 
@@ -60,6 +61,7 @@ typedef struct FslIMX25State {
     IMXGPIOState   gpio[FSL_IMX25_NUM_GPIOS];
     SDHCIState     esdhc[FSL_IMX25_NUM_ESDHCS];
     ChipideaState  usb[FSL_IMX25_NUM_USBS];
+    IMX2WdtState   wdt;
     MemoryRegion   rom[2];
     MemoryRegion   iram;
     MemoryRegion   iram_alias;
@@ -229,6 +231,8 @@ typedef struct FslIMX25State {
 #define FSL_IMX25_GPIO1_SIZE    0x4000
 #define FSL_IMX25_GPIO2_ADDR    0x53FD0000
 #define FSL_IMX25_GPIO2_SIZE    0x4000
+#define FSL_IMX25_WDT_ADDR      0x53FDC000
+#define FSL_IMX25_WDT_SIZE      0x4000
 #define FSL_IMX25_USB1_ADDR     0x53FF4000
 #define FSL_IMX25_USB1_SIZE     0x0200
 #define FSL_IMX25_USB2_ADDR     0x53FF4400
@@ -268,5 +272,6 @@ typedef struct FslIMX25State {
 #define FSL_IMX25_ESDHC2_IRQ    8
 #define FSL_IMX25_USB1_IRQ      37
 #define FSL_IMX25_USB2_IRQ      35
+#define FSL_IMX25_WDT_IRQ       55
 
 #endif /* FSL_IMX25_H */
-- 
2.17.1

