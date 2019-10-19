Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2719063wrm;
        Sat, 19 Oct 2019 16:51:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6eBQL5msHMteI2n35HaWyN36D/IjDFelBdwj8mWk1DCD0AVBV/tLcoi9Pf+MHg9ABrWc9
X-Received: by 2002:a37:9a8a:: with SMTP id c132mr13604498qke.92.1571529073892;
        Sat, 19 Oct 2019 16:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571529073; cv=none;
        d=google.com; s=arc-20160816;
        b=UUUWUnjnC4gx3m8B4me9BbFp0hc1N779Jss1yQEC37UAltRh+c0ugRPI5bfzJimwmD
         vHLpDrfeKXcydapBRd+1wcoR9VaTlC+r8hTqew6c7onSDZy3yAZwQL+aFYF4qQ59IuZm
         UaLGx+rQzP+Rub0nWh4SDn4+cSYcxPchPldBa15Lrh7XLnftZ78F9TZ9cLwl3Lvyd//9
         H/kvkrwuvVNOWjj84IyrN8Cwr6aEFFSgkAIKyP9+VMCwlkoSAQ9Kx7IOcmXZwsDgqmHT
         3Byp7wUmV4VifZaXygjDeRHjXqdofrnIoMgMx/MQAKlaaUkTpxVeqD7t5FkfsUuMMVNk
         pVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n7quA1dGafaHo0DTqTtlgCaafQtBK1c/6u1kSk551IY=;
        b=MkdbBn8bfwcoehu+m792Bd35JEI8cbPxB+BV0ZXPBTFXHAn07+TXPPQiEDNboqhfWG
         JovCA2nNLYPnK/vomrR4agP3D7zcDgtFx6+ONloOw7QzCVlsp8EWTseYd30om8IYUXuA
         QVAgHqx7EzXZKK0ZzOPCG6gd8ixsnu4/9hOSwmvDltS64ZhK/HGv+MkXsZJ+0MfJD+95
         v/dnJ0oGySFnqylXjYSkTj/DN2RbkEbTKhfXREv0n7I6qov/yocMqXRPRAwXmFUr2q0p
         oSZEOOtuSTGDCJRH61uQWrAzulPQHljuUsm5wUQd56GfqWe9Xd9RrO/MuyANCo/xOleI
         Vzxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lRS7Sge6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si3068799qve.44.2019.10.19.16.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 16:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lRS7Sge6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLyV6-0004B4-TB
	for alex.bennee@linaro.org; Sat, 19 Oct 2019 19:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRU-00006U-6H
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRT-0005Wp-0H
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 19:47:28 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:53996)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLyRS-0005WY-QW; Sat, 19 Oct 2019 19:47:26 -0400
Received: by mail-wm1-x343.google.com with SMTP id i16so9566246wmd.3;
 Sat, 19 Oct 2019 16:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7quA1dGafaHo0DTqTtlgCaafQtBK1c/6u1kSk551IY=;
 b=lRS7Sge6aBIDnhtlGzKpDMR/n81AmTFwtiuiAlXA00tfcZ9Z4w7LODUm44a3/eaefK
 tyWu9KgI8fxxW1YY+v4EeQfDtq8QlIalOAwzs8iyvE9giu4jMlPALfJEzv/Fwx9n7Fd2
 X2tgT5uhNZXyw5ND6T8GTmca4/FhBV63/Ut15ehNi1hvALcZUXlr1gkesy3tc0kFcljo
 ge58BheF6tUsbgvt1lAcQC5/nSTQw3n7IBbyOTly09AXh7PbFQ10E7dwmH4kvuys2UC5
 1016g8+dwVQPYkpBnjkeW15DKH3I2OO/nqpSMLsYFBiATaS1eOwMfv2VNwPH3iV8h71H
 Qqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n7quA1dGafaHo0DTqTtlgCaafQtBK1c/6u1kSk551IY=;
 b=sewGzipfYZ44mbo4xmeOVu5SHz6E6KYNqbcJShsGlruxr/LCGhxha7UA8MhGNo3h9j
 7Nl5tmnNWSGuyXg3nvaOl8T9LAvWU4AwbAmOoP6v5VS0eJ8d5bYqgwE46CoTYWPPbk8G
 VezJ2Rdg4Odn/OdYinitDvy7zq7knFE3xz0SGPWGUqaLd3OhUpQmJYWOCqn4foMbBepp
 Ae8XfRQqVQJP+TndvG/aAkmBaHTZi2O+3ySb8voHnQLMRpIuwDRDBFUN0hctP0SkJtOv
 Qn57aN5pJS7T04dhufDDGrzzFQlxx0iKScXukYI3N3GNCjxBaxRFOkpgkDia28DhxlkQ
 Nbwg==
X-Gm-Message-State: APjAAAUIC8em3XGssxbphLQH1K0+HMJ2FNvQvBJxv3MZoJHZsScLLjvr
 G4ILeEymNvA9bTx8MOh/2SZ/jMsY
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr9047217wmo.141.1571528845606; 
 Sat, 19 Oct 2019 16:47:25 -0700 (PDT)
Received: from x1w.redhat.com (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id u1sm10433763wrp.56.2019.10.19.16.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 16:47:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/16] hw/arm/bcm2835_peripherals: Use the SYS_timer
Date: Sun, 20 Oct 2019 01:47:03 +0200
Message-Id: <20191019234715.25750-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191019234715.25750-1-f4bug@amsat.org>
References: <20191019234715.25750-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Matthias Brugger <mbrugger@suse.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, "Emilio G . Cota" <cota@braap.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Pete Batard <pete@akeo.ie>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0xxLhUF5ozjt

Connect the recently added SYS_timer.
Now U-Boot does not hang anymore polling a free running counter
stuck at 0.
This timer is also used by the Linux kernel thermal subsystem.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Remove spurious error check (Alex)
---
 hw/arm/bcm2835_peripherals.c         | 17 ++++++++++++++++-
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 70bf927a02..17207ae07e 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Interrupt Controller */
     sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
 
+    /* SYS Timer */
+    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr),
+                          TYPE_BCM2835_SYSTIMER);
+
     /* UART0 */
     sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
                           TYPE_PL011);
@@ -171,6 +175,18 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
     sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
 
+    /* Sys Timer */
+    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
+                               INTERRUPT_ARM_TIMER));
+
     /* UART0 */
     qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
     object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
@@ -352,7 +368,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     }
 
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
-    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
     create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
     create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index be7ad9b499..7859281e11 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -24,6 +24,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
+#include "hw/timer/bcm2835_systmr.h"
 #include "hw/misc/unimp.h"
 
 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
@@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
     MemoryRegion ram_alias[4];
     qemu_irq irq, fiq;
 
-    UnimplementedDeviceState systmr;
+    BCM2835SystemTimerState systmr;
     UnimplementedDeviceState armtmr;
     UnimplementedDeviceState cprman;
     UnimplementedDeviceState a2w;
-- 
2.21.0

