Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5420175lfp;
        Mon, 17 Feb 2020 12:50:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwWXgZA77xeETcIkgp+31WUyy4Qq0Uy34f4Rhb9kJKcpHhAS0MbmYeELD1tx5qTO2JKnaO/
X-Received: by 2002:a37:9d47:: with SMTP id g68mr11547862qke.119.1581972650754;
        Mon, 17 Feb 2020 12:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581972650; cv=none;
        d=google.com; s=arc-20160816;
        b=AxHqeHRsqN5QF1YvriXjbwa8Is44nkKZ92y0NuzSJDF23klcXafzZ/h+pX6+7a5N9v
         c0paWIR3YbKK7cYlbkY8pw8P83bMqwRHrtxcUbIpQV4E0a8BDvE0WfywqxJeJmIgvROm
         dBdSnzZbl3Fa5j3psuACwgie+kco553RUz/xdp8WN2dKsr3xROBNFEDOqI87gA7Ng55H
         KcYWDnQNx8za8SUaFmDJnF6R+DFPCEl/F6+zDp+M70vxPt3Rd6s7xiVByuvxbKm21Pun
         ZM5yQWYORid0IP+emAdy3fCsGqviHnoSTBIeRRZgeJura4yjOEcouIsuC2GEPFDbVXoK
         f2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=3dwRimbCUvS0eAuYvuE/OQDNqnH9kNQy8jPuRwTKHSo=;
        b=BivQTyD6A6esFIrKCc2dYe1IBLc7SsKq3/S0GUooqPDvl3XNYNv1vnrOpwBn50X/gW
         yemYTBhF/LtGY7Dv33Ogw5coaUXy+NE1FmBk38BBMG1z2o4JOWEHUX+VR/OKrWPtWTUr
         V35U03a8VgDcbVeOEPKPz4o19J+S5h6oYLdYKL9BxvJziarSHbR3qvvf9po7Pdu/Yt4q
         mLDGAeJM9FFlQg9mg+r1PwqyzoCkkceeUTY32vygciWCwm8TK/p1P1WEaDA911jYXeRi
         wdS2oIl+D+u1C5DzAkzoD4eKkgb9Nbb2hfMO7xhpv3WAR1FLGKnkKMSsU8ZzdfP/40sl
         kVSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZmUP+Ay9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d22si910257qkl.168.2020.02.17.12.50.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2020 12:50:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZmUP+Ay9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3nLu-0000RT-7b
	for alex.bennee@linaro.org; Mon, 17 Feb 2020 15:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j3nJV-0005aF-LF
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j3nJU-0007RZ-EZ
 for qemu-arm@nongnu.org; Mon, 17 Feb 2020 15:48:21 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36183)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j3nJU-0007RD-8M; Mon, 17 Feb 2020 15:48:20 -0500
Received: by mail-pl1-x644.google.com with SMTP id a6so7194178plm.3;
 Mon, 17 Feb 2020 12:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3dwRimbCUvS0eAuYvuE/OQDNqnH9kNQy8jPuRwTKHSo=;
 b=ZmUP+Ay9MZ2Zo6o5m3nqaVt0FAJIW2Dx8Jb2vFov3W102E2ngLHM1NbnLm8F0a4Om6
 C2Fk0KuctIgIfvePwTs2dtNVLFMtbqNH8HO0M6TUw+BoD3Ry/l+PQkN8+6sIM+OQu23b
 NoOQ5Db0AH+FRFZ+Gv6CV1fH4AqlXFng5meV6zw6zMSRd/pMaqcKsjwYWpWBcSpyTuvz
 rHscZZHElgArgk1nFOfHGfMXsuyyO1QkZebtOUXfVTr/an4ujj+FF7aC5jzI4SbwJ3i/
 ueY/GwmPPNDXcQDkKkXcD93WQF3iD8hDnoipgXdz0eXIeCTDRluMsLpm0CQcn61MzLuM
 iXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=3dwRimbCUvS0eAuYvuE/OQDNqnH9kNQy8jPuRwTKHSo=;
 b=LbvZ6we2OVcb0BP6zzoCGGWSl60DYNxM+5qpf7gM3qIsvIX0YFqSG9INu18ndjJmdx
 OCOedqlDOjIt2dmIH0n2XzJzqxqaMyrmzMYcZTwqqB0ECd1+WRlywn657ZLR4x5htHLC
 zNqtUhhsGGADrSvA7VBHZ3PNe8j1WV2XXwoKg3AvGf8uL9n1CGU12sg3XT2mR4KAs1pr
 eB8hWDCAenytU4+LObnDON/4CyZPn32LrSOsXqOVLu5PA/01WKH1vlCPSx3Dr+FhMx2K
 AedtyYWrzjEUTggubuN8kZRrRwZHumOx0QJz82grC8qW9OTB8eXiF21jIEZBVPqr0TM3
 BjJw==
X-Gm-Message-State: APjAAAU7a21I/UJJZOE4ttH4ax+IXOQCn+MsmMNacgga4CzBhjvvmHbo
 miQoIPxQzyalDbM76EcnUM4=
X-Received: by 2002:a17:902:8308:: with SMTP id
 bd8mr17636816plb.210.1581972499290; 
 Mon, 17 Feb 2020 12:48:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k29sm1371042pfh.77.2020.02.17.12.48.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Feb 2020 12:48:18 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 3/3] arm: allwinner: Wire up USB ports
Date: Mon, 17 Feb 2020 12:48:12 -0800
Message-Id: <20200217204812.9857-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200217204812.9857-1-linux@roeck-us.net>
References: <20200217204812.9857-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ku0PUXh15Rg

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

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Rebased to master
    Added Gerd's Reviewed-by: tag
v2: Instantiate EHCI and OHCI in a single patch
    Use define instead of ARRAY_SIZE to get the number of USB ports
    Instantiate OHCI in companion mode
    Use &error_fatal to handle error conditions

 hw/arm/allwinner-a10.c         | 43 ++++++++++++++++++++++++++++++++++
 include/hw/arm/allwinner-a10.h |  6 +++++
 2 files changed, 49 insertions(+)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 1cde165611..2ae9c15311 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -24,11 +24,15 @@
 #include "hw/arm/allwinner-a10.h"
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
+#include "hw/boards.h"
+#include "hw/usb/hcd-ohci.h"
 
 #define AW_A10_PIC_REG_BASE     0x01c20400
 #define AW_A10_PIT_REG_BASE     0x01c20c00
 #define AW_A10_UART0_REG_BASE   0x01c28000
 #define AW_A10_EMAC_BASE        0x01c0b000
+#define AW_A10_EHCI_BASE        0x01c14000
+#define AW_A10_OHCI_BASE        0x01c14400
 #define AW_A10_SATA_BASE        0x01c18000
 
 static void aw_a10_init(Object *obj)
@@ -49,6 +53,17 @@ static void aw_a10_init(Object *obj)
 
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
@@ -121,6 +136,34 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
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
index 40d0b1d9c0..8af724548f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -8,12 +8,16 @@
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
 
@@ -28,6 +32,8 @@ typedef struct AwA10State {
     AwEmacState emac;
     AllwinnerAHCIState sata;
     MemoryRegion sram_a;
+    EHCISysBusState ehci[AW_A10_NUM_USB];
+    OHCISysBusState ohci[AW_A10_NUM_USB];
 } AwA10State;
 
 #endif
-- 
2.17.1

