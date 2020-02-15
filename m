Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2522751lfp;
        Fri, 14 Feb 2020 16:14:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwC4gMq9OG0RMZJKYSedu8ZUyB7SqIDlBdWLNMlJyBuZbq0eIz3dnWYCMUK4bnr29nIRdSJ
X-Received: by 2002:a05:620a:12a8:: with SMTP id x8mr5126807qki.93.1581725662946;
        Fri, 14 Feb 2020 16:14:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581725662; cv=none;
        d=google.com; s=arc-20160816;
        b=N1Jc2OC9MDsLFAcs2gj+cn3oFcQ6h6u/FqqsrZeKYOT495btc72Wz+Bz3oZjyQpVY4
         h6fi/Y9qvc/558a9Cg2auubbSXTF4FHzYdMNLpzLf8upLOlYdMHjb3V8agHlFloTHYaY
         aMJ/UboOVlvkQi0N5kGYJOBNGrLSm82myTzfqxU6T62eOHkN6z00WEX3/G6ZR92Lom6Y
         HrtEkzseGqqEajXFkSsduKTSclq9q86I8Zpqcj9twWlkmP+v2AMGYUKrioGYpb7a7FNl
         Qb9kEoxWlAGGFzkk7LuLCsdYahU8whagPuUIQbEN/Mxz3nouWp5mlBSJPzUUZiiDJspi
         OF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=JXT2z9qJxKdTjfJEwn9Dgtbq3jsFOHBma8z40zcFGTA=;
        b=mrrWEMJFN/tfj8X4oHXp4qaJcmktLY9Teti+fBFkN1mGCGBCMVhYaw9B1JaupCrR+Y
         mt04tSe8vvUsUDa86cJ1VxmDzDV4AOiWPNpyShU8Jx3FZXSI8vbc0Vy7k6h6/Ai9Twem
         abUQpgriX4nThJ9WLNNCNcX8guUp/ZDzP8OMV7QN8jhUo32aczSi7L1OgZT7PuLFyEYg
         1rSDLAUf2wRwbmyOYaTSiPfbX02M23k6cQxF0wsO9KIgkFX7+Whb2Pv5VGiH5BRobK3G
         WmBp1mcgVQcBjpKr43iggQPq5/uZH1JZemxFdP6oDQ8C3M5nLIYSfdH1Rlq8v3a4+YHH
         wHpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=erjIupE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k76si3813143qke.258.2020.02.14.16.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 16:14:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=erjIupE2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2l6E-0002d5-CO
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 19:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53563)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2l4t-0008FZ-6B
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 19:13:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2l4r-0003B2-VN
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 19:12:59 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:40659)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2l4r-000394-Oz; Fri, 14 Feb 2020 19:12:57 -0500
Received: by mail-pg1-x542.google.com with SMTP id z7so5730382pgk.7;
 Fri, 14 Feb 2020 16:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JXT2z9qJxKdTjfJEwn9Dgtbq3jsFOHBma8z40zcFGTA=;
 b=erjIupE2hrkCVfbJAUzkJA3r/6EXPdw5gdrXcpF/7dgS0/HyyXih9EVrtz5hX+59Kh
 wirhOtGjH3fF+KkY2lKTj2fO0mQ6LXoI14YgCyn+fxA2UpD/upsVZ4fM53CrccSnLc4a
 YMUA/1OKKn2+irPElLOGTnJEexceZGxkxDtTC7bqBGncKAEsDVQGj2FdWFTyen3VwgAW
 GiMnG1yW7t0xjbG3ZlRGRg1XUpznbE+QOAI/i6pMSx5tU/q5Yuzw8o98Y0z9bT4IYmrd
 E6UjrT86fQWcefXYN/L62fuPSoRjqfoEuI2li5fevEM91EUyVGKD82PTdOlOAHwAKn+7
 p6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=JXT2z9qJxKdTjfJEwn9Dgtbq3jsFOHBma8z40zcFGTA=;
 b=dabIFZb73JFlHinBi2+nyTa7uN1qmvCyNlt9M+0YSvjKkIbmUAnkOXc+SBlb6IIp9T
 sCsrEUeAa+Y+xHBBOo8Y/lFrYwKHqe76UkCx5facdNFZvev1moZRFecqbb9BeNodDK/P
 85zd9aFK6orsVuSsUmj4tmF+EubkG1nFaKN+ZRTXMNC5Lzfy40vqeMtNMhbJtBAY7voB
 gMw/8Wazz+Np1h8ghblFhEuGP5xLcpWw/tinpXTKfzyCqlxVuu5tMHQ8w2Wxga3gIcsy
 rRP0z9fbKfflUTyBktteI1usKFIYzRZGK0CtcvCkagZURmyHbQvrtMa0/m9du6ht8XYx
 kbCw==
X-Gm-Message-State: APjAAAXH3yVtIvvAvz8ojd/bFa1VioannjioZISXHCiSpeeXAc3RviUe
 BOy3CbrlJ7AHnU+HHs9YhVw=
X-Received: by 2002:a63:9919:: with SMTP id d25mr5997971pge.22.1581725576805; 
 Fri, 14 Feb 2020 16:12:56 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id g24sm8305601pfk.92.2020.02.14.16.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 14 Feb 2020 16:12:56 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 3/3] arm: allwinner: Wire up USB ports
Date: Fri, 14 Feb 2020 16:12:48 -0800
Message-Id: <20200215001248.2642-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215001248.2642-1-linux@roeck-us.net>
References: <20200215001248.2642-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UDpPYWcNGjD4

Instantiate EHCI and OHCI controllers on Allwinner A10. OHCI ports are
modeled as companions of the respective EHCI ports.

With this patch applied, USB controllers are discovered and instantiated
when booting the cubieboard machine with a recent Linux kernel.

ehci-platform 1c14000.usb: EHCI Host Controller
ehci-platform 1c14000.usb: new USB bus registered, assigned bus number 1
ehci-platform 1c14000.usb: irq 26, io mem 0x01c14000
ehci-platform 1c14000.usb: USB 2.0 started, EHCI 1.00
ehci-platform 1c1c000.usb: EHCI Host Controller
ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
ehci-platform 1c1c000.usb: irq 31, io mem 0x01c1c000
ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00
ohci-platform 1c14400.usb: Generic Platform OHCI controller
ohci-platform 1c14400.usb: new USB bus registered, assigned bus number 3
ohci-platform 1c14400.usb: irq 27, io mem 0x01c14400
ohci-platform 1c1c400.usb: Generic Platform OHCI controller
ohci-platform 1c1c400.usb: new USB bus registered, assigned bus number 4
ohci-platform 1c1c400.usb: irq 32, io mem 0x01c1c400
usb 2-1: new high-speed USB device number 2 using ehci-platform
usb-storage 2-1:1.0: USB Mass Storage device detected
scsi host1: usb-storage 2-1:1.0
usb 3-1: new full-speed USB device number 2 using ohci-platform
input: QEMU QEMU USB Mouse as /devices/platform/soc/1c14400.usb/usb3/3-1/3-1:1.0/0003:0627:0001.0001/input/input0

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Instantiate EHCI and OHCI in a single patch
    Use define instead of ARRAY_SIZE to get the number of USB ports
    Instantiate OHCI in companion mode
    Use &error_fatal to handle error conditions

 hw/arm/allwinner-a10.c         | 43 ++++++++++++++++++++++++++++++++++
 include/hw/arm/allwinner-a10.h |  6 +++++
 2 files changed, 49 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 45cd8d2db5..57275c92f5 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -24,12 +24,16 @@
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
+#include "hw/usb/hcd-ohci.h"
 
 #define AW_A10_CCM_REG_BASE     0x01c20000
 #define AW_A10_PIC_REG_BASE     0x01c20400
 #define AW_A10_PIT_REG_BASE     0x01c20c00
 #define AW_A10_UART0_REG_BASE   0x01c28000
 #define AW_A10_EMAC_BASE        0x01c0b000
+#define AW_A10_EHCI_BASE        0x01c14000
+#define AW_A10_OHCI_BASE        0x01c14400
 #define AW_A10_SATA_BASE        0x01c18000
 
 static void aw_a10_init(Object *obj)
@@ -53,6 +57,17 @@ static void aw_a10_init(Object *obj)
 
     sysbus_init_child_obj(obj, "sata", &s->sata, sizeof(s->sata),
                           TYPE_ALLWINNER_AHCI);
+
+    if (machine_usb(current_machine)) {
+        int i;
+
+        for (i = 0; i < AW_A10_NUM_USB; i++) {
+            sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
+                                  sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
+            sysbus_init_child_obj(obj, "ohci[*]", OBJECT(&s->ohci[i]),
+                                  sizeof(s->ohci[i]), TYPE_SYSBUS_OHCI);
+        }
+    }
 }
 
 static void aw_a10_realize(DeviceState *dev, Error **errp)
@@ -133,6 +148,34 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     serial_mm_init(get_system_memory(), AW_A10_UART0_REG_BASE, 2,
                    qdev_get_gpio_in(dev, 1),
                    115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
+
+    if (machine_usb(current_machine)) {
+        int i;
+
+        for (i = 0; i < AW_A10_NUM_USB; i++) {
+            char bus[16];
+
+            sprintf(bus, "usb-bus.%d", i);
+
+            object_property_set_bool(OBJECT(&s->ehci[i]), true,
+                                     "companion-enable", &error_fatal);
+            object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
+                                     &error_fatal);
+            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                            AW_A10_EHCI_BASE + i * 0x8000);
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                               qdev_get_gpio_in(dev, 39 + i));
+
+            object_property_set_str(OBJECT(&s->ohci[i]), bus, "masterbus",
+                                    &error_fatal);
+            object_property_set_bool(OBJECT(&s->ohci[i]), true, "realized",
+                                     &error_fatal);
+            sysbus_mmio_map(SYS_BUS_DEVICE(&s->ohci[i]), 0,
+                            AW_A10_OHCI_BASE + i * 0x8000);
+            sysbus_connect_irq(SYS_BUS_DEVICE(&s->ohci[i]), 0,
+                               qdev_get_gpio_in(dev, 64 + i));
+        }
+    }
 }
 
 static void aw_a10_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 0007a927bb..12ca731cb2 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -9,11 +9,15 @@
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
 #include "hw/ide/ahci.h"
+#include "hw/usb/hcd-ohci.h"
+#include "hw/usb/hcd-ehci.h"
 
 #include "target/arm/cpu.h"
 
 #define AW_A10_SDRAM_BASE       0x40000000
 
+#define AW_A10_NUM_USB          2
+
 #define TYPE_AW_A10 "allwinner-a10"
 #define AW_A10(obj) OBJECT_CHECK(AwA10State, (obj), TYPE_AW_A10)
 
@@ -29,6 +33,8 @@ typedef struct AwA10State {
     AwEmacState emac;
     AllwinnerAHCIState sata;
     MemoryRegion sram_a;
+    EHCISysBusState ehci[AW_A10_NUM_USB];
+    OHCISysBusState ohci[AW_A10_NUM_USB];
 } AwA10State;
 
 #endif
-- 
2.17.1

