Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1516216lfg;
        Sun, 1 Mar 2020 09:05:06 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvlHy6jxD256ndFzrA35/xPDqBnVzcgqYaG2OV52hY7mq9ZBzqIEWcUB2XKSIVRrqCleGk0
X-Received: by 2002:a37:84a:: with SMTP id 71mr4585531qki.163.1583082306563;
        Sun, 01 Mar 2020 09:05:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583082306; cv=none;
        d=google.com; s=arc-20160816;
        b=cKOwUXwjKp91RHA6MZwx2JCeR1KLXzEWEcEkkvAhmVKRGT+UJz+rghNnbqzJ8WpUB2
         YzLWSrhQ2tEPxXHtkflmzdABBjtO6w4umHljMo+dfbkjeCgpHGH78RRs9Qzjj78xdGBD
         Ep/pyJs9sgvnsShXTpNvnTbADpQwwXv4H/cU90ycX7YmLZyiB7wUOF/ngnh1jT0sHKEM
         e4M+fq+eQJOtWxSxC1O+ZfMAoEyO2VfUXUUTevF99C04FGNGVSXBsgAiRFAj3qzhnIUm
         UMZToKqUDjnWRrHaFNV3MC10oNSsmYd4PSQET+Lf34Wr+T5/duoCqkIbNIm4mFFpzORN
         P+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=8OfojPF0SOlwZ2hNqQRCRwhc/fBNHQ5w6WoG81OWGnE=;
        b=bsTzXmAz7Ys+GmtB9khukVTnFUY+gHw63HIyTehhk7GxA6ikFW4nZQB6XCrWmYTzQk
         PiTAqlbZMEl22bla7hTtN5T2i1ihCiPV+YMNKhlX6nmvskxeoHKTNXViqj+fOHRAwupj
         wU9v3RUnhGiUz8/YvwY72bOJox7yG6wP4ach8lFltUAGNL9WOMzGqilk1VM4VmpyHgZF
         KBXCG4wXROEVS8SbJRVTeESm1ks4y1E1EepS9f//4cNvTI+mrDObjlUeuWoopP78iQkZ
         5WfjAcPZVkfNix5T15kKlbrAvgXBGiS0zLXQabOi0Sf5tLTQW2e4OiHqZjNv6fmvYQP3
         wHog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tc+5BfO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si4629197qto.246.2020.03.01.09.05.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:05:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tc+5BfO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8S1a-0005sx-0J
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:05:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j8S1Q-0005qd-18
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:04:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j8S1O-0001i6-U0
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:04:55 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:38633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j8S1O-0001gS-OF; Sun, 01 Mar 2020 12:04:54 -0500
Received: by mail-pl1-x642.google.com with SMTP id p7so3225016pli.5;
 Sun, 01 Mar 2020 09:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8OfojPF0SOlwZ2hNqQRCRwhc/fBNHQ5w6WoG81OWGnE=;
 b=tc+5BfO9WPQFfEtF0CrMIaM6VZzMTmoRCmErQytF1XIeKbVcAIvF/40PGKjA8Bh/m9
 uX/FwKNbkxQmmbV6ZvrQmWNdefkcCJpjbY8c5HgbUzyUvdirLPak/lHp/MPC0JXOF9WP
 q81Y027vwPA4LUyZIYnDFazyyGDXTnJs7jeZDm0sKuoaNi+zi6TYgNQYVg4QXaktXopW
 7/cj1cLRwDpBDQyMMB1HrtK9AQRI5gLeZ+bYNrsdulL476BEKsdGqdVYi2eIZ67w7si6
 aGxzPkaCpVqv+qBMmW8bYzcOKGYz73jJXoHgi9hiq5LEitL83dpX61TLYKsA53ttJRnz
 s/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=8OfojPF0SOlwZ2hNqQRCRwhc/fBNHQ5w6WoG81OWGnE=;
 b=ueYFu9LpvWhCKhp3IWTGvsprz3IdnFJruzShAo5/dfokbM15ejS2E3rl2c9NqeWykg
 zbZjlyUS+tfkKIeRefhgX2NUqUKrxwXbZcfY5BwCbI554b21Vbth2qGsDUs2yM0e4i0H
 PkA73e1GYwUkmcYNFZbyAdcTNq6Ywxnm2Hw5rbV6Kf7b5Jcv6k1ZFFjID0zJGr+RxCTq
 Yamg42OaSZMDVScrL1YDY4DPD/vDvfjCd4btYMLV6x3MmnaGzwBcbriuyWx6wxlxcYWW
 ASlvQ+yp5Wk99DV9ELwcI5N6xexaR7pehQ4mKlpwDdJq1V1JTqfLDyax5dL3rIeASOi1
 C6Zw==
X-Gm-Message-State: APjAAAUJ9W/Y+YXvs5mdenEAbJ9FaziAypLUNguBR0sBG68xHnaepATM
 cmAEgQk+gHwAts8I29ISgkg=
X-Received: by 2002:a17:902:8642:: with SMTP id
 y2mr13751287plt.306.1583082293833; 
 Sun, 01 Mar 2020 09:04:53 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f3sm17116739pga.38.2020.03.01.09.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 01 Mar 2020 09:04:53 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/3] arm: fsl-imx6ul: Wire up USB controllers
Date: Sun,  1 Mar 2020 09:04:42 -0800
Message-Id: <20200301170443.12904-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200301170443.12904-1-linux@roeck-us.net>
References: <20200301170443.12904-1-linux@roeck-us.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vqhyk+5ulF3i

IMX6UL USB controllers are quite similar to IMX7 USB controllers.
Wire them up the same way.

The only real difference is that wiring up dummy phy devices is necessary
to avoid phy reset timeouts in the Linux kernel.

With this patch, the USB controllers on 'mcimx6ul-evk' are detected
and can be used to boot the system.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig              |  1 +
 hw/arm/fsl-imx6ul.c         | 35 +++++++++++++++++++++++++++++++++++
 include/hw/arm/fsl-imx6ul.h |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 61635f52c4..d09b012c5a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -411,6 +411,7 @@ config FSL_IMX6UL
     select IMX_FEC
     select IMX_I2C
     select SDHCI
+    select STMP
     select UNIMP
 
 config MICROBIT
diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
index c405b68d1d..d2ee4cc846 100644
--- a/hw/arm/fsl-imx6ul.c
+++ b/hw/arm/fsl-imx6ul.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/fsl-imx6ul.h"
+#include "hw/misc/stmp.h"
 #include "hw/misc/unimp.h"
 #include "hw/boards.h"
 #include "sysemu/sysemu.h"
@@ -133,6 +134,14 @@ static void fsl_imx6ul_init(Object *obj)
                               TYPE_IMX_ENET);
     }
 
+    /* USB */
+    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
+        snprintf(name, NAME_SIZE, "usb%d", i);
+        sysbus_init_child_obj(obj, name, &s->usb[i], sizeof(s->usb[i]),
+                              TYPE_CHIPIDEA);
+    }
+
+
     /*
      * SDHCI
      */
@@ -456,6 +465,32 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
                                             FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
     }
 
+    /* USB */
+    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
+        static const int FSL_IMX6UL_USBn_IRQ[] = {
+            FSL_IMX6UL_USB2_IRQ,
+            FSL_IMX6UL_USB1_IRQ,
+        };
+
+        object_property_set_bool(OBJECT(&s->usb[i]), true, "realized",
+                                 &error_abort);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                        FSL_IMX6UL_USBO2_USB_ADDR + i * 0x200);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->usb[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX6UL_USBn_IRQ[i]));
+
+    }
+    create_unimplemented_device("usbmisc", FSL_IMX6UL_USBO2_USBMISC_ADDR,
+                                0x200);
+    create_unimplemented_device("usbphy1", FSL_IMX6UL_USBPHY1_ADDR,
+                                FSL_IMX6UL_USBPHY1_SIZE);
+    create_stmp_device("usbphy1-stmp", true, FSL_IMX6UL_USBPHY1_ADDR + 0x30);
+    create_unimplemented_device("usbphy2", FSL_IMX6UL_USBPHY2_ADDR,
+                                FSL_IMX6UL_USBPHY2_SIZE);
+    create_stmp_device("usbphy2-stmp", true, FSL_IMX6UL_USBPHY2_ADDR + 0x30);
+
     /*
      * USDHC
      */
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index eda389aec7..ae738bd5ea 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -34,6 +34,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/imx_spi.h"
 #include "hw/net/imx_fec.h"
+#include "hw/usb/chipidea.h"
 #include "exec/memory.h"
 #include "cpu.h"
 
@@ -54,6 +55,7 @@ enum FslIMX6ULConfiguration {
     FSL_IMX6UL_NUM_I2CS         = 4,
     FSL_IMX6UL_NUM_ECSPIS       = 4,
     FSL_IMX6UL_NUM_ADCS         = 2,
+    FSL_IMX6UL_NUM_USBS         = 2,
 };
 
 typedef struct FslIMX6ULState {
@@ -77,6 +79,7 @@ typedef struct FslIMX6ULState {
     IMXFECState        eth[FSL_IMX6UL_NUM_ETHS];
     SDHCIState         usdhc[FSL_IMX6UL_NUM_USDHCS];
     IMX2WdtState       wdt[FSL_IMX6UL_NUM_WDTS];
+    ChipideaState      usb[FSL_IMX6UL_NUM_USBS];
     MemoryRegion       rom;
     MemoryRegion       caam;
     MemoryRegion       ocram;
@@ -145,6 +148,10 @@ enum FslIMX6ULMemoryMap {
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

