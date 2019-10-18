Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1066931wrm;
        Fri, 18 Oct 2019 08:27:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwq/wg1IB3GdVjGtehqB/01mFQ+pe8VJ8af8YydlOcxJCap3lORwqyrDsf/mxmGmDqWJDUt
X-Received: by 2002:ac8:700d:: with SMTP id x13mr10521728qtm.102.1571412437547;
        Fri, 18 Oct 2019 08:27:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b129si5982318qkg.11.2019.10.18.08.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 08:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=2Hgo1smB;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLU9s-00055G-Og
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 11:27:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTrh-0007KZ-GP
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:08:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1iLTrg-0000U7-Bl
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 11:08:29 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38770)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1iLTrg-0000IJ-2c; Fri, 18 Oct 2019 11:08:28 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 5EA0096F5B;
 Fri, 18 Oct 2019 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1571411276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gw/9OjOWVXESU4gXuWgq3cSpDZKHiW1A6Qa07223tS4=;
 b=2Hgo1smBHJKc8hH1+ddEvD6r9ON4YMMnIVarKOxj5L3+p9n8LsJpDwTCW8tV7YcBhWdoT7
 fRQHyZFS0PC7HNsmdFu/FssYrIWa021IECzz8t0sLIqbSjxb8piqkdp8J+DH8GY9Fq1ROr
 YY4O6nEYrA8sdhACNYqDxVX59xoQIDo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 12/13] hw/gpio/bcm2835_gpio: Isolate sdbus reparenting
Date: Fri, 18 Oct 2019 17:06:29 +0200
Message-Id: <20191018150630.31099-13-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191018150630.31099-1-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1571411277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gw/9OjOWVXESU4gXuWgq3cSpDZKHiW1A6Qa07223tS4=;
 b=vILmcuKtWURTOiXgVhIc1DaAORRjIFoK9qFn3iDtt0S/mAqbB6zFxQ338K4E9Z8unl3vJH
 SaPC4M28azmE93QjNljLUvn2KqT8Fim33dwpwqv0MEscKBYWAK35KY204tP4UXD2Rtl0na
 Sjwpf+NILNZV8thpW71rJaCc7qgVdEs=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1571411277; a=rsa-sha256; cv=none;
 b=GG+rbZ0BOnJ8bWGzctqkp1pKCEFjSDCOtoYm24cvnreOkmGm5oSQkizw9t/Rc8mx5aq9kq
 srRtgIf86jy1deNJRkbk4UMtVIYRj1voUcuHpc+RerBXJd/r6E08AD2cKK+NwXJkIB1WAn
 B5sypCqfQmlP6Fku5vKY/yIQSvtp3Po=
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
 berrange@redhat.com, ehabkost@redhat.com, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, edgari@xilinx.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rxbgHa7ymQvU

Split gpfsel_set() in 2 so that the sdbus reparenting is done
in a dedicated function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Cc: qemu-arm@nongnu.org
---
 hw/gpio/bcm2835_gpio.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index 91ce3d10cc..81fe07132f 100644
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
@@ -86,6 +89,7 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t reg=
, uint32_t value)
             && (s->fsel[53] =3D=3D 0) /* SD_DATA3_R */
             ) {
         /* SDHCI controller selected */
+        sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
         sdbus_reparent_card(s->sdbus_sdhost, s->sdbus_sdhci);
         s->sd_fsel =3D 0;
     } else if (s->sd_fsel !=3D 4
@@ -97,6 +101,7 @@ static void gpfsel_set(BCM2835GpioState *s, uint8_t re=
g, uint32_t value)
             && (s->fsel[53] =3D=3D 4) /* SD_DATA3_R */
             ) {
         /* SDHost controller selected */
+        sdbus_reparent_card(&s->sdbus, s->sdbus_sdhost);
         sdbus_reparent_card(s->sdbus_sdhci, s->sdbus_sdhost);
         s->sd_fsel =3D 4;
     }
@@ -210,6 +215,7 @@ static void bcm2835_gpio_write(void *opaque, hwaddr o=
ffset,
     case GPFSEL4:
     case GPFSEL5:
         gpfsel_set(s, offset / 4, value);
+        gpfsel_update_sdbus(s);
         break;
     case GPSET0:
         gpset(s, value, 0, 32, &s->lev0);
@@ -265,10 +271,12 @@ static void bcm2835_gpio_reset(DeviceState *dev)
         gpfsel_set(s, i, 0);
     }
=20
-    s->sd_fsel =3D 0;
-
-    /* SDHCI is selected by default */
-    sdbus_reparent_card(&s->sdbus, s->sdbus_sdhci);
+    /*
+     * Setup the right sdbus (put 1 in sd_fsel to force reparenting
+     * the sd). It will be SDHCI because of the gpfsel_set() above.
+     */
+    s->sd_fsel =3D 1;
+    gpfsel_update_sdbus(s);
=20
     s->lev0 =3D 0;
     s->lev1 =3D 0;
--=20
2.23.0

