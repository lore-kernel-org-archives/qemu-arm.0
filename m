Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp969827lff;
        Sat, 18 Jan 2020 16:51:17 -0800 (PST)
X-Received: by 2002:a1c:b456:: with SMTP id d83mr12093835wmf.172.1579395077559;
        Sat, 18 Jan 2020 16:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579395077; cv=none;
        d=google.com; s=arc-20160816;
        b=qKP/67Mi7mggeUvtzexZUUCBFJZmdIXVr8XKAdAApz8mASiEpdV8pABXPRbI7QdcSW
         q3IEeRuA3fO4xx2ZGF1eXrZNpGgelD6fgVo56u8HXAcqQyfaWyA+FzcvTaO+RgAwv7dX
         Rb7n0SkCH1CA2mZ2B3tUE+JuJiNYrpfrv6wp9qJBQyu+aeu3KsBV2+pRoxmOFEELycxT
         NS+95McLNQjzzcfXX4xvWonohVCz35uwuA2fkKT7c8E35w7TEvMvajnu66rpKFJRjrUD
         Yj1y+irwygpPmQPdWvQyv2HRQiEDsa7s0A01SLpofz7F32IAYraTR5B3Kxb3HvFI1n5u
         pBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=bKdYQLut7TY9Y2nQP8UWBqYM24fNyCpJNF5tfQZW1hg=;
        b=x9KDSg359WrjOZqhTbgqiXAFECbEFiSAKThKm0YKNJZXL4TK/f3anDWqKsJskCZsim
         +fQ7YjCKkX0cFxWBLYYeNdPD1zagx3MOBSSDV4Ukz1Z6QSx0/zeFlH1uSdtePUZB9Thm
         vpcN2BzLHqdTu4sEg2GPA4XN7BzNqi+1FVBNnBoBkmmw6UsSz8KTUQq4/YXLzzPGirKC
         9ZZA39SXhKzqabKuldJgZ61eUkQ/7iFq5nBCgZA6MsJMVVYhWO/1ByzImXRu8ZFcKHM7
         5wpgmj3w8JF9vYkfCtGbjseJbbs/he7TgRZPUeX+Nf64e1VxpiDBMIxiq+oMpjRc0hvh
         qqTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uy9tvM2v;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l11sor13162225wrr.36.2020.01.18.16.51.17
        (Google Transport Security);
        Sat, 18 Jan 2020 16:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uy9tvM2v;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bKdYQLut7TY9Y2nQP8UWBqYM24fNyCpJNF5tfQZW1hg=;
        b=uy9tvM2vhSqa0ye7h8j1AJB3bqeNUM3WwnpOwLLMAGydbVfOJqntE7BX7G4BVvKIDg
         YsXI9PEhy1c+OJadsfvFVmssKxTGJq/nFwM8lYYwALMheUZKsgo+T/Uc9POVhGYisqtZ
         UbbSqnp8KB0Ky4sciCmb8Y8xnS+uIaPA5zKhjejn9nlcF6k5qMq5LMVfbjNbMNMfI4Bl
         3TaY018UN+SbzcMZ1RsP859PdlcVt1xVPZ8YMaXzYUFf6Ij2pIhnP5lgiTO5MBhkTSkq
         TTd4DfZcZYcpfcxGI5imH54b7UobPs6I3UDpux3thg0RB1T5DFMGktqbKqUwj288ydd1
         Gypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bKdYQLut7TY9Y2nQP8UWBqYM24fNyCpJNF5tfQZW1hg=;
        b=CW01dvq6XVvAS7PYmhZ2TU0H9rFP509koPplB8s2eN7u4FYjlsxTXQ1EvbCKjXBT1s
         uRP1RT+AxwyBm8PGx94Mkv8C1BQt5lpsWJ4yUBa6+56ckEtRKHJcOWjOM1aVOXpMWruo
         vjRUY014LbmXM3FFbeAzK8UxvOhrgpb2uPjUOp3Ld0qoqETuIRCGJpPzZWEfoMUkFjOe
         wNPRpoMez1YbdrLmHX09IH1qqbI49oRYIyZaIDuOueumdWwhzpU9oNhVUk2YfonYRdEQ
         PmjsQJJijqBwEuaI8xksGNpvXsCc+C4F1pRZB/QuFIyuW4FQ4WVgK4uqiZ60LLBYKHsl
         bPFw==
X-Gm-Message-State: APjAAAWBrSW/GTrLb0BFZ68DdOzCVLagoFSZVENdo/UwH3MfaafJLzO0
	mN/70CECv7wJEIFw1a8xaGg=
X-Google-Smtp-Source: APXvYqwor7sMU/i28vPe/t5J8aWbTs6D0BxZtDlNs0/mgRgl2pVldaQZv5PLQoEq4uxYG9FhPkR7Fw==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr11157080wru.150.1579395077177;
        Sat, 18 Jan 2020 16:51:17 -0800 (PST)
Return-Path: <nieklinnenbank@gmail.com>
Received: from pavilion.home ([2a02:a456:6be8:1:8edc:d4ff:fe8b:18b7])
        by smtp.gmail.com with ESMTPSA id h2sm41763568wrv.66.2020.01.18.16.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2020 16:51:16 -0800 (PST)
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
Subject: [PATCH v4 04/20] hw/arm/allwinner-h3: add USB host controller
Date: Sun, 19 Jan 2020 01:50:46 +0100
Message-Id: <20200119005102.3847-5-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200119005102.3847-1-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
X-TUID: qrlybljuN5HL

The Allwinner H3 System on Chip contains multiple USB 2.0 bus
connections which provide software access using the Enhanced
Host Controller Interface (EHCI) and Open Host Controller
Interface (OHCI) interfaces. This commit adds support for
both interfaces in the Allwinner H3 System on Chip.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/hcd-ehci.h             |  1 +
 include/hw/arm/allwinner-h3.h |  8 ++++++
 hw/arm/allwinner-h3.c         | 52 ++++++++++++++++++++++++++++++++---
 hw/usb/hcd-ehci-sysbus.c      | 17 ++++++++++++
 4 files changed, 74 insertions(+), 4 deletions(-)

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
index 8df8e3e05e..f360625ee9 100644
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
@@ -73,10 +82,10 @@ struct AwH3Unimplemented {
     { "msgbox",    0x01c17000, 4 * KiB },
     { "spinlock",  0x01c18000, 4 * KiB },
     { "usb0-otg",  0x01c19000, 4 * KiB },
-    { "usb0",      0x01c1a000, 4 * KiB },
-    { "usb1",      0x01c1b000, 4 * KiB },
-    { "usb2",      0x01c1c000, 4 * KiB },
-    { "usb3",      0x01c1d000, 4 * KiB },
+    { "usb0-phy",  0x01c1a000, 4 * KiB },
+    { "usb1-phy",  0x01c1b000, 4 * KiB },
+    { "usb2-phy",  0x01c1c000, 4 * KiB },
+    { "usb3-phy",  0x01c1d000, 4 * KiB },
     { "smc",       0x01c1e000, 4 * KiB },
     { "pio",       0x01c20800, 1 * KiB },
     { "owa",       0x01c21000, 1 * KiB },
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
index 020211fd10..174c3446ef 100644
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
-- 
2.17.1
