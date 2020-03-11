Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1294353lfc;
        Wed, 11 Mar 2020 15:19:07 -0700 (PDT)
X-Received: by 2002:a5d:528e:: with SMTP id c14mr6749283wrv.308.1583965147533;
        Wed, 11 Mar 2020 15:19:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583965147; cv=none;
        d=google.com; s=arc-20160816;
        b=Xhg8y3OD/VUXdK70bAbDp9kIWGGO0PA8SFelSpGvYjVS71KJ2mtwtyQlOF9g1Up7Ff
         6jojzJd+yOhV1YVhZd3Y9RItLzzkA40BcaCIhKJqnZK38t4xuxot0W2sIvWvUX9s1TZW
         bTZO5iW91mz1M4VQmbCZPnS1hfRnv+fhi7yJ7ffjijrdzK11sqilW848n+gye0GXPsbU
         BQ/yTxVsStTQqofCtHRj93aGGiHuM61G6gDmKobBVFtlYGnxGSMcujREaxXshfPXTEaB
         cL8gfDjVjaXgbFhCyB0wFZ+XiwZNa4QLSPQZK81fB+/+/0DgfkglcU+2ih/ufu+Bosyg
         3t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=zEsbXkesOJvwZCFgHrYhBVg/PvHKobAO6JNMxSnhifVNz9qgattDf0Vkp/OjIy//5r
         zYRwxAlFGU1Gafuj4opv7u8YNpvMGzkbP25zDAq16I5zjP8Jo7qVNbxf2KbfsIi+uaSX
         xEcsMDXIHySPW1Xe1nBcQr/IGYw43t1Kbblio5e6KdbMqhCECpgCxBCebpN50CHAIdXF
         vba0QuH2lFOQ56ShCK4u5VFmXMpcYv+QOtjs0P890pvdBlFJR/LWoqyYk7PMzMg/seNE
         4UvL+LzXf+sIAkqLQ4nqEvA0BMi0iGOokBi+VgtNjDwo/BI26p/C/86iJje3QdeLFy3z
         ZwYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M65ECtSr;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 190sor94380wma.29.2020.03.11.15.19.07
        (Google Transport Security);
        Wed, 11 Mar 2020 15:19:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=M65ECtSr;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=M65ECtSr3LkZ1RWAeNkMQC4YuBpNqyasVxiGTDkd7zLDD/Jg3/N/fntJP5Z30nVEPI
         5iaIok2YlRPI8GaRFpuWdKgxmu4QxIVW3c2MdJOqq+jTqWpbj5GdfwDUz/BT6IG8iw80
         K7hDn+dCDyCDGNmFCx2CI6DW3aUW3hDcwQJQcfDI+a+9b4ZRjnpx7FHRyMoeN8lv8U8n
         Cf0zhoThaenyerE+BkXOtQD5aTIU2GQfNXphAfFS6EnF74dshmCvynM6Z+ICOhYdX6CU
         oqL4O6XIg0Qg8QFDAyWK4GG6iOBvDZ7lINGjNJ6hjINb1Qoq+B4H83L4cRmC1WEaB3u9
         jstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UIByMOMQQIv55mL19I+5dwrlTsd6XzXiE+TBLVFchfk=;
        b=Q+DiaVAWKc2wMmmjr/ddEMR+FuqVPEcu1Pz3Yurvgz/WFUdVvU6TTj0DI1Qfv/cLtZ
         EtmI/mGzym78nZTjhTynuvxGM04nYrAh2EoSu2pHjUM5xDNAbp9UUCT2NKvP0qDV2ba8
         Yff7NiGQhPnWV+nYVM5zHnX4V9WhUXLz4hJfp4Ks1SNJendGEtQOFBaNl8j9YUESsWyP
         QvKvtrSNRp1RErXI1Eu+jznX2IaVeH4xg18q6rg9N6jUt5c7MZb+1lzeo6thFfUg4aqm
         NApqLWGWcV4W3HLyVzPKLiyvYQnQJM1wuOQMaUIe7crJ/WGjSfu/WTyF/Sss+gH/BYj4
         0yEw==
X-Gm-Message-State: ANhLgQ3lw8VzbiIyIGTTeH1afV6UG/kpBhwICC/Da8CVHoY/8H/x/bB9
	rzhscK2Fx8Tk4hzK8h4FJek=
X-Google-Smtp-Source: ADFU+vuDYYD2IlSd1exv1bFVsktsk7IHHcfm4sQ1zkqP2xq+ybvkEzb46AoeTGqbzisDtU15GjXNsg==
X-Received: by 2002:a1c:7419:: with SMTP id p25mr845950wmc.159.1583965147153;
        Wed, 11 Mar 2020 15:19:07 -0700 (PDT)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id q7sm19346796wrd.54.2020.03.11.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 15:19:06 -0700 (PDT)
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
Subject: [PATCH v8 04/18] hw/arm/allwinner-h3: add USB host controller
Date: Wed, 11 Mar 2020 23:18:40 +0100
Message-Id: <20200311221854.30370-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: riJ4CmA/BjfS

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
