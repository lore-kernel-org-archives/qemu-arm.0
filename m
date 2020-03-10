Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1226617lfc;
        Tue, 10 Mar 2020 14:32:15 -0700 (PDT)
X-Received: by 2002:adf:e804:: with SMTP id o4mr5715817wrm.24.1583875935135;
        Tue, 10 Mar 2020 14:32:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583875935; cv=none;
        d=google.com; s=arc-20160816;
        b=M4ExbUMSRXRRHYkwCpMuWhBi9x68tf/ttPTo6eCazOkh/Oxy5e88u4J72TohfIrwiF
         PaI3sDOdtmNLZ6ar854pOvZ74gsXsk/f+je5fRxYXlB6s42LyRHlv9pjorNMUD66+Le6
         v6u50ZU1D8A1QEzDwxczcmtqJjJyrGIyXAYEatmV9WQK2ByW+7fbO+H0Z5zjUb839VX0
         o8tF2lZnypJDEMH7Ta6JCSVYW5nn0B07pbFCsakBqtwkZ3TwbG9TGq1ZyQ9DBsnxn6CG
         nq211UqHcdDl9zRPAeNINds1cGv5Um5aIhRXzIT6LuQsMGSdQ1ycUjMCTOjga7Xi26lg
         0rYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=kPDl1Na75bdlMQOnRrv1g9Cg/4z7BEEN7oR6IojZw07P1ikMyeYSCZiIL23ybZ4xwu
         2n6tB/TzAjme1P4L+mZoMIsFerAN14webANHOhgxwNcojzpI486iveMz+TAGP53FJJLn
         aDjcUHQyzei3SHevwRJAlqAoKZ374uWCqEgIdjut908Qhe3S5pZ8FSqPOlyN+gkvP+Ey
         g1GkGIqR5rS3zPLhAswR9qL52EOyeDgUhlakVA1A3zcPlOARiH2CQuKBRKqyewnQi5Xq
         FHvV9aw1/NGh4u7WGFZNRVNeUeSfYwu7J5vMPrbq95viyMuufuobWVsUUwhvcG8d9i3s
         dkDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNet5MhG;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p17sor3790308wrn.26.2020.03.10.14.32.14
        (Google Transport Security);
        Tue, 10 Mar 2020 14:32:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=bNet5MhG;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=bNet5MhGmcoN5L9IpoNU7BBUEEEzMDHriLFwwYxNskJGjkgGYdn4bKI9jU8Olwh22m
         cR6g2uikc5JGrGdai4v8fKMWFQJ+MS0TweW6qmKVTOCQ3PoXSEeKJf1w846hN/wfEqzk
         2C7QGNL9ONR4hykdee7nCSMwsIpmhzOgYmNiQm2hPtvDF7aPijSvLCpAmfiztqPC2i7E
         5wr1s5FeoyTr+hvuLtDNS9GADUKHqMtBTLdwNoQmmNaaAk0B2DOyesDA89NuERPtSNr+
         5A8g+O9hIKWhFoRbQcYJDvlB6NpktI892HPbJCR7AiiN0euXtwcquOu85dgU+upMLfr6
         uvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=t8//SFS2Il+DmzuND/BuJWw3epmMNDmKElPkqz/Uo23Fml+YKltlFCUPmMk5FRAg+V
         WZbIUVPmMEBRgyKvqJuDcku3s95yVkPUOASAV893cE+a8l5Yh1NpXFjSST5WrMNvYF9z
         YC/EU1W6dc1KGQurSdkZAZzf47oZiyeaVxtTnVICAFBfEU8QZ3cAcWRRnOvdS58k7EO9
         qRaVIm8ftXuL1FyxkpYO877F6is/RXLkfxV3wa0O7Q6aEmiHrvrs9ykcql6rTyR3TrRN
         FV7XyBL4GlhTS/kzvC05N2PdXfxr8HINXsbZ/hiaQ92KRy3bYQLDp4qgWmQb15zLm6if
         qf6A==
X-Gm-Message-State: ANhLgQ1SpMp9c1JcDyXTJm1/P4UDX1Hust1PO770QCF3clKtX48slcmM
	vCVSshqScwV606o1YNtDXItJlYBf
X-Google-Smtp-Source: ADFU+vvq57J5lNryIzCmeboybW2GKrFLHsA3Euv5krKtqPM9YuqPeXVgGLd0O10CxyaRJCUJ8zp+Sg==
X-Received: by 2002:a5d:508b:: with SMTP id a11mr10324147wrt.332.1583875934736;
        Tue, 10 Mar 2020 14:32:14 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id 2sm32803580wrf.79.2020.03.10.14.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 14:32:14 -0700 (PDT)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	philmd@redhat.com,
	b.galvani@gmail.com,
	jasowang@redhat.com,
	alex.bennee@linaro.org,
	imammedo@redhat.com,
	Niek Linnenbank <nieklinnenbank@gmail.com>
Subject: [PATCH v7 04/18] hw/arm/allwinner-h3: add USB host controller
Date: Tue, 10 Mar 2020 22:31:49 +0100
Message-Id: <20200310213203.18730-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310213203.18730-1-nieklinnenbank@gmail.com>
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PFVkr2U7s0Aj

The Allwinner H3 System on Chip contains multiple USB 2.0 bus
connections which provide software access using the Enhanced
Host Controller Interface (EHCI) and Open Host Controller
Interface (OHCI) interfaces. This commit adds support for
both interfaces in the Allwinner H3 System on Chip.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/usb/hcd-ehci.h             |  1 +
 include/hw/arm/allwinner-h3.h |  8 +++++++
 hw/arm/allwinner-h3.c         | 44 +++++++++++++++++++++++++++++++++++
 hw/usb/hcd-ehci-sysbus.c      | 17 ++++++++++++++
 hw/arm/Kconfig                |  2 ++
 5 files changed, 72 insertions(+)

diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 0298238f0b..edb59311c4 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
 #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
 #define TYPE_PLATFORM_EHCI "platform-ehci-usb"
 #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
+#define TYPE_AW_H3_EHCI "aw-h3-ehci-usb"
 #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
 #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
index abdc20871a..4f4dcbcd17 100644
--- a/include/hw/arm/allwinner-h3.h
+++ b/include/hw/arm/allwinner-h3.h
@@ -56,6 +56,14 @@ enum {
     AW_H3_SRAM_A1,
     AW_H3_SRAM_A2,
     AW_H3_SRAM_C,
+    AW_H3_EHCI0,
+    AW_H3_OHCI0,
+    AW_H3_EHCI1,
+    AW_H3_OHCI1,
+    AW_H3_EHCI2,
+    AW_H3_OHCI2,
+    AW_H3_EHCI3,
+    AW_H3_OHCI3,
     AW_H3_CCU,
     AW_H3_PIT,
     AW_H3_UART0,
diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
index 1fff3c317b..c205f06738 100644
--- a/hw/arm/allwinner-h3.c
+++ b/hw/arm/allwinner-h3.c
@@ -28,6 +28,7 @@
 #include "hw/sysbus.h"
 #include "hw/char/serial.h"
 #include "hw/misc/unimp.h"
+#include "hw/usb/hcd-ehci.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/allwinner-h3.h"
 
@@ -36,6 +37,14 @@ const hwaddr allwinner_h3_memmap[] = {
     [AW_H3_SRAM_A1]    = 0x00000000,
     [AW_H3_SRAM_A2]    = 0x00044000,
     [AW_H3_SRAM_C]     = 0x00010000,
+    [AW_H3_EHCI0]      = 0x01c1a000,
+    [AW_H3_OHCI0]      = 0x01c1a400,
+    [AW_H3_EHCI1]      = 0x01c1b000,
+    [AW_H3_OHCI1]      = 0x01c1b400,
+    [AW_H3_EHCI2]      = 0x01c1c000,
+    [AW_H3_OHCI2]      = 0x01c1c400,
+    [AW_H3_EHCI3]      = 0x01c1d000,
+    [AW_H3_OHCI3]      = 0x01c1d400,
     [AW_H3_CCU]        = 0x01c20000,
     [AW_H3_PIT]        = 0x01c20c00,
     [AW_H3_UART0]      = 0x01c28000,
@@ -144,6 +153,14 @@ enum {
     AW_H3_GIC_SPI_UART3     =  3,
     AW_H3_GIC_SPI_TIMER0    = 18,
     AW_H3_GIC_SPI_TIMER1    = 19,
+    AW_H3_GIC_SPI_EHCI0     = 72,
+    AW_H3_GIC_SPI_OHCI0     = 73,
+    AW_H3_GIC_SPI_EHCI1     = 74,
+    AW_H3_GIC_SPI_OHCI1     = 75,
+    AW_H3_GIC_SPI_EHCI2     = 76,
+    AW_H3_GIC_SPI_OHCI2     = 77,
+    AW_H3_GIC_SPI_EHCI3     = 78,
+    AW_H3_GIC_SPI_OHCI3     = 79,
 };
 
 /* Allwinner H3 general constants */
@@ -284,6 +301,33 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
     qdev_init_nofail(DEVICE(&s->ccu));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
 
+    /* Universal Serial Bus */
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI0));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI1],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI1));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI2],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI2));
+    sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI3],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_EHCI3));
+
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI0],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI0));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI1],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI1));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI2],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI2));
+    sysbus_create_simple("sysbus-ohci", s->memmap[AW_H3_OHCI3],
+                         qdev_get_gpio_in(DEVICE(&s->gic),
+                                          AW_H3_GIC_SPI_OHCI3));
+
     /* UART0. For future clocktree API: All UARTS are connected to APB2_CLK. */
     serial_mm_init(get_system_memory(), s->memmap[AW_H3_UART0], 2,
                    qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_UART0),
diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 5b7991cffe..3730736540 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -131,6 +131,22 @@ static const TypeInfo ehci_exynos4210_type_info = {
     .class_init    = ehci_exynos4210_class_init,
 };
 
+static void ehci_aw_h3_class_init(ObjectClass *oc, void *data)
+{
+    SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    sec->capsbase = 0x0;
+    sec->opregbase = 0x10;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+}
+
+static const TypeInfo ehci_aw_h3_type_info = {
+    .name          = TYPE_AW_H3_EHCI,
+    .parent        = TYPE_SYS_BUS_EHCI,
+    .class_init    = ehci_aw_h3_class_init,
+};
+
 static void ehci_tegra2_class_init(ObjectClass *oc, void *data)
 {
     SysBusEHCIClass *sec = SYS_BUS_EHCI_CLASS(oc);
@@ -252,6 +268,7 @@ static void ehci_sysbus_register_types(void)
     type_register_static(&ehci_type_info);
     type_register_static(&ehci_platform_type_info);
     type_register_static(&ehci_exynos4210_type_info);
+    type_register_static(&ehci_aw_h3_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
     type_register_static(&ehci_fusbh200_type_info);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fcdc651b73..f6422d5466 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -304,6 +304,8 @@ config ALLWINNER_H3
     select ARM_TIMER
     select ARM_GIC
     select UNIMP
+    select USB_OHCI
+    select USB_EHCI_SYSBUS
 
 config RASPI
     bool
-- 
2.17.1
