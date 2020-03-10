Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1205454lfc;
        Tue, 10 Mar 2020 14:07:33 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtAt3G3r3EIZHWtELc2d8lrE3p8sDQYmAhDtu/5MOFSd5MgVCiNcw8ekR7zVz7doWkFd8lN
X-Received: by 2002:a0c:9c86:: with SMTP id i6mr122754qvf.214.1583874453458;
        Tue, 10 Mar 2020 14:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583874453; cv=none;
        d=google.com; s=arc-20160816;
        b=XMy9tKyv/Z7fvfHQk6kiWqOhUzf0ptj8u3mydrwnsXK17/FN9+e9JO7VA3AORdeeea
         +4BZ2ohl9EC6+D66NNTa4O13U8z4Bz2F+CqJWVOrf/6Es4rdwjpNT8ihUgklHgM3eULR
         V1eE/gi/zD0wThMYLYruyeCdQzPb+F9Gn8f8VOgaNq27+XHyYpUhKI12OEQiCn9rp63T
         mSDMk7J8wsqZRWzCcjQ29wp93mAKAYOqYkexUVp2epozWkq6ZegxQInkf3gao5pGRJr4
         LrDCWRu9543M3r2DVqiwI9LPPHm3KbMxhRfxlgonJovO9rg7u4+1IRx/jgg/sUDFp6pS
         5cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=F4gBQYAuwGb2CicEJbL46QHlOPvhRttRRSCsd9S6VPQ=;
        b=RILRJzkGL0Hr8objtvmLlM3ToYvz/aVOT98CIY8RAS1QtG+GrtTwWiUUcWcMAtOqBG
         igRTfXt08QVeHWWW0/Yaa7rsQ2FGfAqD+kvo+eCS0O7ttx3VJ6LJS2qWET1gHGf6HSUH
         NVN3oQZa2xFdMmJrrwBKOLdUPfqg2fPGnD5mHMVUEd383GaG+i8NOmaUlNAsTSbO9ksT
         OkDl4lPeBXqX5THmIhDnpXi36wvvrH6dgXDjOukT2uZ4UhFsU1EW/L2EubBwV6ETwE1z
         uy+xwEL6lJN/2wE9Xh5r/lDWQORYd3PyFMBmaeithklhF4YgSj39V7VDbE8/by70t/kW
         kMZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ayp+j++J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p43si7978615qte.122.2020.03.10.14.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 14:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ayp+j++J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBm68-0003Qc-SP
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 17:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBm3Q-0008PE-Ej
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBm3P-0000cG-1s
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:44 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBm3O-0000Zf-RW; Tue, 10 Mar 2020 17:04:42 -0400
Received: by mail-pg1-x544.google.com with SMTP id b1so6861811pgm.8;
 Tue, 10 Mar 2020 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F4gBQYAuwGb2CicEJbL46QHlOPvhRttRRSCsd9S6VPQ=;
 b=Ayp+j++J9zU1lASlQkdSCv1uarzkCFvdjwRAUR7OXGif6PcORgzkkjSX6j03JJVeFx
 RxkR+nUVYJiFW1HgypCUEboriFOSgblHOx6fQ1PQJ8mwsUCtaGLXXuDM+UJcEhcwCrNy
 S4qpyIA0UCbSJ2b95nWjQO8mxZtOHOPRaodpqgLxvWx3VB3Qz65fDSVOGr2wpfkvsYAV
 C79ff3M1xrHVldd5KZsw2WKY+2Hff/ClLGmwvWrsPpCOyW2jzxBj/QeW0QPANsfYW4zN
 +E4qF5m+sR1q+9JrcKR77aMBlFQu03l3BDHCNoGFcenHwiZEN+nRcnN8dGxoIsJRkKg6
 gTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=F4gBQYAuwGb2CicEJbL46QHlOPvhRttRRSCsd9S6VPQ=;
 b=FampH0nVxSi5ek7CIpTIYyGSgTHZQUfycCtQ867+cDs4i/bgVpyHKyGMGqojfFruc6
 SOPMe9+FWtC6ZQZ/pMKK/KFOlwgKp1kFnq5vDesBY+FrLA29yxzz0WHW3clL3hsGBr1o
 62QsnY8gvtDlWHYaroF3Nxg7oYf+qsIsHgVMtB8cAU9LJpyNWImF7lb9s4vIsm7/X98G
 q+LEEjy29R6+7KrYGtkXzck7VlLe2ySRn71kBgdK/dq42MSIEn9UxgbC1kuhshRj0hZ1
 vNE6FpAio/i9kp6lwI8CPfxAOz3Hs8kCzs7tAscLrNys0Tr3LJALs/YlkQkyRnKd4Mf+
 2c3Q==
X-Gm-Message-State: ANhLgQ0GR4nfp8yvLEcLA/lQYyX4x4uVS/xAPzbb9dMrABn7Ij+aX0Py
 S3YJQr8dhE5d+wkQWjSBNV8=
X-Received: by 2002:a63:f50e:: with SMTP id w14mr22536088pgh.363.1583874281914; 
 Tue, 10 Mar 2020 14:04:41 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z1sm6981469pgz.79.2020.03.10.14.04.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Mar 2020 14:04:41 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/3] hw/arm/fsl-imx6: Wire up USB controllers
Date: Tue, 10 Mar 2020 14:04:34 -0700
Message-Id: <20200310210434.31544-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310210434.31544-1-linux@roeck-us.net>
References: <20200310210434.31544-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZncwFEdnhXrj

With this patch, the USB controllers on 'sabrelite' are detected
and can be used to boot the system.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use USB PHY emulation

 hw/arm/fsl-imx6.c         | 34 ++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6.h |  5 +++++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index ecc62855f2..92b3955817 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6.h"
+#include "hw/usb/imx-usb-phy.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
@@ -86,6 +87,15 @@ static void fsl_imx6_init(Object *obj)
                               TYPE_IMX_USDHC);
     }
 
+    for (i = 0; i < FSL_IMX6_NUM_USBS; i++) {
+        snprintf(name, NAME_SIZE, "usb%d", i);
+        sysbus_init_child_obj(obj, name, &s->usb[i], sizeof(s->usb[i]),
+                              TYPE_CHIPIDEA);
+        snprintf(name, NAME_SIZE, "usbphy%d", i);
+        sysbus_init_child_obj(obj, name, &s->usbphy[i], sizeof(s->usbphy[i]),
+                              TYPE_IMX_USBPHY);
+    }
+
     for (i = 0; i < FSL_IMX6_NUM_ECSPIS; i++) {
         snprintf(name, NAME_SIZE, "spi%d", i + 1);
         sysbus_init_child_obj(obj, name, &s->spi[i], sizeof(s->spi[i]),
@@ -349,6 +359,30 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             esdhc_table[i].irq));
     }
 
+    /* USB */
+    for (i = 0; i < FSL_IMX6_NUM_USBS; i++) {
+        static const int FSL_IMX6_USBn_IRQ[] = {
+            FSL_IMX6_USB_OTG_IRQ,
+            FSL_IMX6_USB_HOST1_IRQ,
+            FSL_IMX6_USB_HOST2_IRQ,
+            FSL_IMX6_USB_HOST3_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
+                        FSL_IMX6_USBPHY1_ADDR + i * 0x1000);
+
+        object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                        FSL_IMX6_USBOH3_USB_ADDR + i * 0x200);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a9mpcore),
+                                            FSL_IMX6_USBn_IRQ[i]));
+    }
+
     /* Initialize all ECSPI */
     for (i = 0; i < FSL_IMX6_NUM_ECSPIS; i++) {
         static const struct {
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 60eadccb42..edc3fce3fa 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -30,6 +30,8 @@
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/imx_spi.h"
 #include "hw/net/imx_fec.h"
+#include "hw/usb/chipidea.h"
+#include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
 #include "cpu.h"
 
@@ -44,6 +46,7 @@
 #define FSL_IMX6_NUM_ESDHCS 4
 #define FSL_IMX6_NUM_ECSPIS 5
 #define FSL_IMX6_NUM_WDTS 2
+#define FSL_IMX6_NUM_USBS 4
 
 typedef struct FslIMX6State {
     /*< private >*/
@@ -62,6 +65,8 @@ typedef struct FslIMX6State {
     SDHCIState     esdhc[FSL_IMX6_NUM_ESDHCS];
     IMXSPIState    spi[FSL_IMX6_NUM_ECSPIS];
     IMX2WdtState   wdt[FSL_IMX6_NUM_WDTS];
+    IMXUSBPHYState usbphy[FSL_IMX6_NUM_USBS];
+    ChipideaState  usb[FSL_IMX6_NUM_USBS];
     IMXFECState    eth;
     MemoryRegion   rom;
     MemoryRegion   caam;
-- 
2.17.1

