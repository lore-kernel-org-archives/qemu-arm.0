Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1203091lfc;
        Tue, 10 Mar 2020 14:05:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsQrO37CAdm1cdNO5y7RCLCiyACK7SIgRlDDeIPVK9o+O7uhzS+dTNrQvvfLPACRfhkL5i1
X-Received: by 2002:ac8:108d:: with SMTP id a13mr21280130qtj.230.1583874300611;
        Tue, 10 Mar 2020 14:05:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583874300; cv=none;
        d=google.com; s=arc-20160816;
        b=yhprXPGsz+Z3NbTxZgJ0hFZGEBlsitQt3rKCxCikZ9fDaYaAQGjR97FL9bheJUv34l
         b1b7xBFogy0i2gI32bMJchAul9znCr6cUJ3TZkGa7jCFs5bNeftLBRFfZmZwMmGT0y1c
         YvVrRdSvFILqdUB2vfJ9GxEYHw6buP21vl0Q9zNDQdQt84LEK0K787JVyZ1wvzv6Y4DV
         dTcsgFpCenAWxgiANYv1L1aiMyiMxPU5tiL3iG8lrTEw+MRnYSlyOvIgJZCFRizwWxSI
         mOcVS4C5QmSVbapEpHRo6E9TmuS74icocLaameWklUTTljlld6ffnEDZ8/O0yjGxR5fc
         ZBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=49+Fne8byoDlBoCm5Fphn1Uv0F4WlsQV3R3aITHAbzE=;
        b=yOmvMEYHJbwgiWTpnwJtmca/jrOSZp49FkWGtN6Dkb3yylY3Hb8lVz3UGnsiGEtygh
         +hXxpgAFpzfjKDVc0nq/ArjqNo25R9VjdX20FyIkc1l/5RpfGgo9MjZRZZZ0hGJqMG7j
         zCRs19QQRVMctb+0IFUHm8ITPN52tTZhNuQ4r6TZUVJ/G/yC6OfdCVVuw1+cssjmq69P
         T/ecjpTBKH+WtVAUfNAHLlgVvsf6frWV1ACLd1dPzGyRdu1yVqRFMEMbXtxJ89S4stik
         LCLA50xXmUttnIBhuw9FkWpGdjlVeX8D7RSjqjt0Snz738LyDb8P0lbAsm1WEGg69Vi0
         af/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lf65tAHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k79si2818873qke.143.2020.03.10.14.05.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 14:05:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lf65tAHi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBm3f-0008Q0-Vs
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 17:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jBm3O-0008MW-TJ
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jBm3N-0000Xh-M3
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 17:04:42 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:52354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jBm3N-0000We-Fn; Tue, 10 Mar 2020 17:04:41 -0400
Received: by mail-pj1-x1044.google.com with SMTP id f15so944594pjq.2;
 Tue, 10 Mar 2020 14:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=49+Fne8byoDlBoCm5Fphn1Uv0F4WlsQV3R3aITHAbzE=;
 b=Lf65tAHi3O2EEPagHKbvE4EMz22G2fWt1VQ979iZ6a4TCpANjCe0TAzze0Xducn7TW
 t/5968aSHqK3NOZwXcb+pC29waBi18tC6ulciQpt1XYfaTzY3C5Bf6lEX4I2k5qja/8/
 vD/o7tiuxM7w32hykvHZClj1kxn0gdlDPtviEmULlZq5K1Umg48pyMnsuJnGyXHYixmC
 7pFgkSweCaOFWSuJtAR3fJmq4eZIpSZflc1ES2izCP9a9+Fhr0Fdu+0v1eiFjpW+/qqF
 VFv/mC5TH3EfUKsqH1QOBrARhYRNdu47mKREOB+aiXMudo3u+48Fd7VY8jlK4xRzvdQE
 j4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=49+Fne8byoDlBoCm5Fphn1Uv0F4WlsQV3R3aITHAbzE=;
 b=glEoNYdWqo5u/Tyd4O/PtpJc8QUKo2jmMLX4vXIOc0fAZHFOyQ4kJZbaQ4R9xPRqWC
 k1MDTQJUrH9m/SIeNoOIkkbA9pvp7m9FysSBEsSgEmOV3VO08VAXRlOfuuRxz7lPiWyf
 E3KCf5w0OZshmweedQ7eKkpUg3vIIPtUZ3hOty7nL2kBXDeeTvwQ2q8Iwzxk0eVO3dqD
 lmVqZQCAp4QzNL1v2pdwQAlJpkQO9gbVbNzWyXK8L1awkysdbBCdJfIWDfcQlE9So1Sj
 IVZ0ijPQvBMns5ZZ7jlNXj+q+fMgycDpNqh5QQXbumx/hFdfpwxYRYhJtdHtXOOmKNr9
 p/ag==
X-Gm-Message-State: ANhLgQ1UzNDKUXuACW1XKt0Npwoc0BjMMu7VX46AlDfmc+EdVYKfhj6T
 1oDntljfP5HMBQXYbWf1wWe4nC73
X-Received: by 2002:a17:902:788b:: with SMTP id
 q11mr22691144pll.44.1583874280411; 
 Tue, 10 Mar 2020 14:04:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y193sm44844037pgd.87.2020.03.10.14.04.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 10 Mar 2020 14:04:39 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/3] hw/arm/fsl-imx6ul: Wire up USB controllers
Date: Tue, 10 Mar 2020 14:04:33 -0700
Message-Id: <20200310210434.31544-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310210434.31544-1-linux@roeck-us.net>
References: <20200310210434.31544-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: 6AHCg0MtaV3i

IMX6UL USB controllers are quite similar to IMX7 USB controllers.
Wire them up the same way.

The only real difference is that wiring up phy devices is necessary
to avoid phy reset timeouts in the Linux kernel.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Use USB PHY emulation

 hw/arm/fsl-imx6ul.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6ul.h |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index c405b68d1d..ef2a7a87e8 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6ul.h"
 #include "hw/misc/unimp.h"
+#include "hw/usb/imx-usb-phy.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
@@ -133,6 +134,16 @@ static void fsl_imx6ul_init(Object *obj)
                               TYPE_IMX_ENET);
     }
 
+    /* USB */
+    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
+        snprintf(name, NAME_SIZE, "usb%d", i);
+        sysbus_init_child_obj(obj, name, &s->usb[i], sizeof(s->usb[i]),
+                              TYPE_CHIPIDEA);
+        snprintf(name, NAME_SIZE, "usbphy%d", i);
+        sysbus_init_child_obj(obj, name, &s->usbphy[i], sizeof(s->usbphy[i]),
+                              TYPE_IMX_USBPHY);
+    }
+
     /*
      * SDHCI
      */
@@ -456,6 +467,28 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                             FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
     }
 
+    /* USB */
+    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
+        static const int FSL_IMX6UL_USBn_IRQ[] = {
+            FSL_IMX6UL_USB2_IRQ,
+            FSL_IMX6UL_USB1_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
+                        FSL_IMX6UL_USBPHY1_ADDR + i * 0x1000);
+
+        object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                        FSL_IMX6UL_USBO2_USB_ADDR + i * 0x200);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX6UL_USBn_IRQ[i]));
+    }
+
     /*
      * USDHC
      */
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index eda389aec7..6969911a2a 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -34,6 +34,8 @@
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/imx_spi.h"
 #include "hw/net/imx_fec.h"
+#include "hw/usb/chipidea.h"
+#include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
 #include "cpu.h"
 
@@ -54,6 +56,7 @@ enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_I2CS         = 4,
     FSL_IMX6UL_NUM_ECSPIS       = 4,
     FSL_IMX6UL_NUM_ADCS         = 2,
+    FSL_IMX6UL_NUM_USBS         = 2,
 };
 
 typedef struct FslIMX6ULState {
@@ -77,6 +80,8 @@ typedef struct FslIMX6ULState {
     IMXFECState        eth[FSL_IMX6UL_NUM_ETHS];
     SDHCIState         usdhc[FSL_IMX6UL_NUM_USDHCS];
     IMX2WdtState       wdt[FSL_IMX6UL_NUM_WDTS];
+    IMXUSBPHYState     usbphy[FSL_IMX6UL_NUM_USBS];
+    ChipideaState      usb[FSL_IMX6UL_NUM_USBS];
     MemoryRegion       rom;
     MemoryRegion       caam;
     MemoryRegion       ocram;
@@ -145,6 +150,10 @@ enum FslIMX6ULMemoryMap {
     FSL_IMX6UL_EPIT2_ADDR           = 0x020D4000,
     FSL_IMX6UL_EPIT1_ADDR           = 0x020D0000,
     FSL_IMX6UL_SNVS_HP_ADDR         = 0x020CC000,
+    FSL_IMX6UL_USBPHY2_ADDR         = 0x020CA000,
+    FSL_IMX6UL_USBPHY2_SIZE         = (4 * 1024),
+    FSL_IMX6UL_USBPHY1_ADDR         = 0x020C9000,
+    FSL_IMX6UL_USBPHY1_SIZE         = (4 * 1024),
     FSL_IMX6UL_ANALOG_ADDR          = 0x020C8000,
     FSL_IMX6UL_CCM_ADDR             = 0x020C4000,
     FSL_IMX6UL_WDOG2_ADDR           = 0x020C0000,
-- 
2.17.1

