Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3701915lff;
        Fri, 20 Dec 2019 06:47:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxCBYR75OXSiq49eqzvmNkjGaQrpF6dI/3HBXq1TdlXZjCmHZxfbIH7UEiYJ+/esTfazykn
X-Received: by 2002:a05:6830:ce:: with SMTP id x14mr2194904oto.105.1576853220604;
        Fri, 20 Dec 2019 06:47:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25si5229698oti.84.2019.12.20.06.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 06:47:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Vvt1dya3;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiJYR-0006oG-Jm
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 09:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXz-0006j1-J3
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iiJXy-00085f-FW
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 09:46:31 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:52566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iiJXy-00081w-7P; Fri, 20 Dec 2019 09:46:30 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id F2B3796F50;
 Fri, 20 Dec 2019 14:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1576853189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM12RI0EHDUNjslinRXmoW1BfejdQGdartCVRRzWAmE=;
 b=Vvt1dya3SavXYQzVTEWVATCFU2MszH4rUbjkT4YbxDGgkf40K/XO1F7h5sImmdoN2GO9Hl
 LrW5VV8RMsWTRaigIu6Y3ez9+fh5i8aqTvzv0itAzmbBbpI77Glhwgachzbdxma3lfeFvS
 kAmKnZWC/V0e1HLdtQIBYJ+rXlvMD9k=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
Date: Fri, 20 Dec 2019 15:46:15 +0100
Message-Id: <20191220144616.911466-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220144616.911466-1-damien.hedde@greensocs.com>
References: <20191220144616.911466-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1576853189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lM12RI0EHDUNjslinRXmoW1BfejdQGdartCVRRzWAmE=;
 b=s6FLgPAzjEcjCAtj001VhqG2TKWSG5pmbxIE+28yQNdPwGhqGH/KLK3VrkHqKduY3HjurT
 0I42w+jQ/AcxuxmpuruyuezSUFLtlqefcLTwkex7q5vBCyhA6ScOTpZr1T6eo8ebj8+ywA
 HmHnDzYQJPs7Km7q4hEhHEtzfOO3r4k=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1576853189; a=rsa-sha256; cv=none;
 b=HzoF3GU8k2kXjvUvNfjETN56zrIEk8EPSW3bPdUOGCTXALu92UkvUp4QgdiyLf+65T3Gpe
 hpSNrQ03jZKWwNz56v2E4O7e+ItvzIUh/PZY/SGN3+9EFKqk9FooKswhtDC4duPs7Xjh5N
 /U8DEqJO/IZmAsoSln0ruGB8nFxNvqU=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, philmd@redhat.com, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4Qx3y9KMlzdc

Split gpfsel_set() in 2 so that the sdbus reparenting is done
in a dedicated function: gpfsel_update_sdbus().

Update call sites of gpfsel_set() to also call gpfsel_update_sdbus().

This commit is a preparation to switch to multiphase reset.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/gpio/bcm2835_gpio.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index 25c180423f..88dc652018 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -75,7 +75,10 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t re=
g, uint32_t value)
             s->fsel[index] =3D fsel;
         }
     }
+}
=20
+static void gpfsel_update_sdbus(BCM2835GpioState *s)
+{
     /* SD controller selection (48-53) */
     if (s->sd_fsel !=3D 0
             && (s->fsel[48] =3D=3D 0) /* SD_CLK_R */
@@ -210,6 +213,7 @@ static void bcm2835_gpio_write(void *opaque, hwaddr o=
ffset,
     case GPFSEL4:
     case GPFSEL5:
         gpfsel_set(s, offset / 4, value);
+        gpfsel_update_sdbus(s);
         break;
     case GPSET0:
         gpset(s, value, 0, 32, &s->lev0);
@@ -261,11 +265,15 @@ static void bcm2835_gpio_reset(DeviceState *dev)
     BCM2835GpioState *s =3D BCM2835_GPIO(dev);
=20
     int i;
+    /*
+     * Initialize the gpfsel registers. In particular, it selects the SD=
HCI bus
+     * for the sd card.
+     */
     for (i =3D 0; i < 6; i++) {
         gpfsel_set(s, i, 0);
     }
-
-    s->sd_fsel =3D 0;
+    /* Update s->sd_fsel and move the sd card */
+    gpfsel_update_sdbus(s);
=20
     s->lev0 =3D 0;
     s->lev1 =3D 0;
--=20
2.24.0

