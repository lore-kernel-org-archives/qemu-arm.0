Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5518565lfp;
        Mon, 17 Feb 2020 15:24:29 -0800 (PST)
X-Received: by 2002:adf:c54e:: with SMTP id s14mr23682993wrf.385.1581981869734;
        Mon, 17 Feb 2020 15:24:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581981869; cv=none;
        d=google.com; s=arc-20160816;
        b=T8x/Trm+dxFD8DiE780N42N24Nj4ZfZXBchpmiyE5pHF5Hd0wp3OfQTkNKUYO90wD4
         hQh3rcX4j09xD5jVwyeyFinaUWn0GIvp93lTt2o+5nkn9kujwUWpaAR85m3CLuEELeMz
         fFofY/PMPy71dulN/xhKvJHnMvhAQ2r13phHw61KGhzcNWT4N7nM8xKHqhBKcHpmkfQc
         tOiSHwJc/lDPrc6k2lwuBLqBlV/V+Rx1SZNn4+0GpecoTDR3zjGnF/P6NRBAXpqEtQvk
         b2ShJi/YnEdB56uW66jQbv8TUmtABErr9x8dukARYprpDC+zNrIank1KyGb75lrF8VUU
         CoWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=H0LawM9vOtSUYY/akhD3wwoqMckFpa64liu5usXXjio=;
        b=HGh7bgtlyCVw2h0uBXX4eYiBTVUbVCziiZscR3kJNkAH80xBlZQp4yYYGNuR66OGU5
         UiDBLRjz5hNUh88zkLE1iQZ/yL+AHHc5h/8FJhmZPB8pZHA3TNXhkJPodpEr8ouj4uSu
         sHMts5wOLf8+sQnkm/gt30q3eV0/JKDyY4GD2gG2APmqdRZkNe+mvXSajtzW4+cK5JiN
         Ymm5HwtFTe8BBQiBYYitHiCkjInAq5ow1SIkhsRv5uHviyVqIZ9lSwNfIzu9iRrLmCxK
         C4aRj+KSh8VCM28H0N3+757ua21Ia6zdy/govHvKHW53Jz3YWqfygBeF08OYZ8iVyWPG
         fUTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Oc/qsN+r";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n9sor1399026wrx.33.2020.02.17.15.24.29
        (Google Transport Security);
        Mon, 17 Feb 2020 15:24:29 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="Oc/qsN+r";
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H0LawM9vOtSUYY/akhD3wwoqMckFpa64liu5usXXjio=;
        b=Oc/qsN+rgbN5YllBEUK9Bi3xdRd09j32TDvCwe96bfVou/6l4JjEwKSFJvO1lAbN1b
         PhVtbyC9d56X9n0rM4+8fFL48bSyt6s2AZJV7E6syP/lW7t7IIQpZAh7nwDtH3ik2DVX
         TdzfIOKMwC5TJGZXmFpqWJe0zZjWv4OXYedVkcQGuuTaIM9uUocavlVAeUt3jd217bi8
         zYye0GuJKk8Ru2rj76hctnAthvwWnWrZ/IUi39vekT0zlbaUexKvZ2BQjndIC3qXiBhN
         nSz7fpiIY5pxH5AwKy941Tn+d4Vuacuig7fjSg0bGuoMrw5FAXV3xVTd2PT2oaIR8cln
         l0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H0LawM9vOtSUYY/akhD3wwoqMckFpa64liu5usXXjio=;
        b=Ec13C+g96nKYTdf+LYxfIRND+KMZmsOYR8Z7K/+b5PbUAh0hYMZK52r7UIzjdFysBO
         meZMWgoFsY7pxGek69lEQ0KYEejQZZcrd2dM9Qdgm7rf265tEpJSzM9ZQ0GsoAgfewJa
         kCYGEyUmjXjWYxug9Llm4lsG3hWaIRYVfzzjN3pnn8tJP+SChlY3AIIPJKULs8Xkldp1
         sfu/0e2k0BzAB5Od4hlmSr1C9mBrg85i1USrQrq58TF2OrydnteWKgR7rcmTxzy54Bv3
         UgTfzZrOcWFmfmxFw6rsJipCN0HORUgUxF5vooAg6sCe5gvBkWXZSuCDErVdnANebOCb
         mI0w==
X-Gm-Message-State: APjAAAXW6zwM7hYLSKtm2vFJ89/H7tXIMcztinL9fuRfgXfqxZZjyERn
	PBVrPj5LD3ccQizlxQEkZng=
X-Google-Smtp-Source: APXvYqynSi2ae2bsxmX5hBcZqBqBNMtS8vIJYCfrjyvPuxjh5D48fnH23bBWu062MRo0pfExUBZ+rw==
X-Received: by 2002:a5d:4a04:: with SMTP id m4mr24858021wrq.104.1581981869304;
        Mon, 17 Feb 2020 15:24:29 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id w1sm3244831wro.72.2020.02.17.15.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 15:24:28 -0800 (PST)
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
Subject: [PATCH v5 04/18] hw/arm/allwinner-h3: add USB host controller
Date: Tue, 18 Feb 2020 00:23:57 +0100
Message-Id: <20200217232411.30096-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217232411.30096-1-nieklinnenbank@gmail.com>
References: <20200217232411.30096-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TkZ5FL4YTOlc

The Allwinner H3 System on Chip contains multiple USB 2.0 bus
connections which provide software access using the Enhanced
Host Controller Interface (EHCI) and Open Host Controller
Interface (OHCI) interfaces. This commit adds support for
both interfaces in the Allwinner H3 System on Chip.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 8d4738565e..3cb2383869 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -145,6 +145,22 @@ static const TypeInfo ehci_exynos4210_type_info = {
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
@@ -267,6 +283,7 @@ static void ehci_sysbus_register_types(void)
     type_register_static(&ehci_platform_type_info);
     type_register_static(&ehci_xlnx_type_info);
     type_register_static(&ehci_exynos4210_type_info);
+    type_register_static(&ehci_aw_h3_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
     type_register_static(&ehci_fusbh200_type_info);
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index bb75c1de17..57b29cc522 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -302,6 +302,8 @@ config ALLWINNER_H3
     select ARM_TIMER
     select ARM_GIC
     select UNIMP
+    select USB_OHCI
+    select USB_EHCI_SYSBUS
 
 config RASPI
     bool
-- 
2.17.1
