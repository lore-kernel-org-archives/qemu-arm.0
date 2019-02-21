Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6076082wrx;
        Thu, 21 Feb 2019 10:39:47 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYEGO9PjSiLxghRpKXmEB/gUjh/tiFZyv1FByuOeat5nJOd3nRfEgibynoXxBEwCIQh6kMo
X-Received: by 2002:a25:81c3:: with SMTP id n3mr34075984ybm.222.1550774387145;
        Thu, 21 Feb 2019 10:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550774387; cv=none;
        d=google.com; s=arc-20160816;
        b=U0S+oVGfuVS+06s+PW8JJp5pVHwiXHl1LmcPRptseqcEnRMHenExHaeyl1ytqEzm2c
         1t/Lg2Z2vgAgkR/efiXw1LkWwS6+J4OFXcLIrFDgk7R2pT+odKFkmqx/4mgrwzg+yuM6
         tS2Vi/c7q4QE/xzIfZyC0PlaEIy4BStd8WjLlyeCSV6IBzue6PP22+5r5nOf+cGUUo3N
         y3DIOHZGVxl80VpHEN/vIyuddZVq95M/2wC1Yg3FRd4N/HFWll0nfdxQ7Ry0Ih26pBjb
         S9nUYFMQlGJuQHLm5Rx+Xb+o5dq5u7K1ZG3rJjjupoSkDORGT3xTaUlqptEUFMYbXJtM
         TXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=QXayaCoKP5isriLYVqjPKXRF6kEfq3/bGTfM7n7K0Ug=;
        b=Jsr8TYSqYpIiLwuxbMUNAElSJpXIoICvhIfqbgONpv2GGJ+wtmtxdCuEtpn3hkc8b8
         GC0CKgKwMxYJlAe1ZmOSUe/QrNI9WlmX3GxvXGvFscNHGutJgj+HSId+SQ4HXS22LgCH
         00A5e2JmeMAy69PCnF/dBw0xRX4YjV65FFx7UyUfMvgzFVdI9bBvIk07PVoH0Q9KAiYM
         99G+kCjo4izcS11ceqzUY1DFM1EiSUxWPRajRzbKBFddrte1KMzSIViIJHZUz9jW4XOt
         bJ7mmCgX0kcmsUpwckAk2NlsL+6l863dHzYcgsIF/9fdJd5OqVrkkpcdcpOWdHQwrMyi
         yiXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m66si4607071ywb.436.2019.02.21.10.39.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 10:39:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwtG5-0004K2-Kh
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 13:39:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwtFx-0004JZ-Na
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 13:39:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gwtFv-0001Fs-Ep
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 13:39:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gwtFn-00050M-Fl; Thu, 21 Feb 2019 13:39:29 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8BC655944A;
	Thu, 21 Feb 2019 18:38:42 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-77.brq.redhat.com [10.40.204.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 185C71001DD6;
	Thu, 21 Feb 2019 18:38:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Thu, 21 Feb 2019 19:38:29 +0100
Message-Id: <20190221183829.31019-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 21 Feb 2019 18:38:42 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] hw/arm: Use object_initialize_child for correct
 reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqlQkmTgFfmR

As Thomas Huth explained:
"Both functions, object_initialize() and object_property_add_child()
increase the reference counter of the new object, so one of the
references has to be dropped afterwards to get the reference counting
right. Otherwise the child object will not be properly cleaned up
when the parent gets destroyed.
Thus let's use now object_initialize_child() instead to get the
reference counting here right."

This patch was generated using the following Coccinelle script:

 @use_object_initialize_child@
 identifier parent_obj;
 expression child;
 expression propname;
 expression child_type;
 expression errp;
 @@
 (
 -    object_initialize(&child, sizeof(child), child_type);
 -    object_property_add_child(parent_obj, propname, OBJECT(&child), NUL=
L);
 +    object_initialize_child(parent_obj, propname,  &child, sizeof(child=
),
 +                            child_type, &error_abort, NULL);
 |
 -    object_initialize(&child, sizeof(child), child_type);
 -    object_property_add_child(parent_obj, propname, OBJECT(&child), err=
p);
 +    object_initialize_child(parent_obj, propname,  &child, sizeof(child=
),
 +                            child_type, errp, NULL);
 )

and a bit of manual fix-up for overly long lines.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Inspired-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/aspeed_soc.c          | 43 ++++++++++++++++++------------------
 hw/arm/bcm2835_peripherals.c | 41 +++++++++++++++++-----------------
 hw/arm/digic.c               |  4 ++--
 3 files changed, 45 insertions(+), 43 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a27233d487..81665f2948 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -106,11 +106,11 @@ static void aspeed_soc_init(Object *obj)
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            sc->info->cpu_type, &error_abort, NULL);
=20
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
-    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    object_initialize_child(obj, "scu", &s->scu, sizeof(s->scu),
+                            TYPE_ASPEED_SCU, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
     qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
                          sc->info->silicon_rev);
@@ -121,35 +121,35 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key", &error_abort);
=20
-    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
-    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
+    object_initialize_child(obj, "vic", &s->vic, sizeof(s->vic),
+                            TYPE_ASPEED_VIC, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
=20
-    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
-    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
+    object_initialize_child(obj, "timerctrl", &s->timerctrl,
+                            sizeof(s->timerctrl), TYPE_ASPEED_TIMER,
+                            &error_abort, NULL);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
                                    OBJECT(&s->scu), &error_abort);
     qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
=20
-    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
-    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
+    object_initialize_child(obj, "i2c", &s->i2c, sizeof(s->i2c),
+                            TYPE_ASPEED_I2C, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
=20
-    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
-    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
+    object_initialize_child(obj, "fmc", &s->fmc, sizeof(s->fmc),
+                            sc->info->fmc_typename, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
     object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
                               &error_abort);
=20
     for (i =3D 0; i < sc->info->spis_num; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]),
-                          sc->info->spi_typename[i]);
-        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NUL=
L);
+        object_initialize_child(obj, "spi[*]", &s->spi[i], sizeof(s->spi=
[i]),
+                                sc->info->spi_typename[i], &error_abort,=
 NULL);
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
=20
-    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
-    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
+    object_initialize_child(obj, "sdmc", &s->sdmc, sizeof(s->sdmc),
+                            TYPE_ASPEED_SDMC, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
     qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
                          sc->info->silicon_rev);
@@ -159,15 +159,16 @@ static void aspeed_soc_init(Object *obj)
                               "max-ram-size", &error_abort);
=20
     for (i =3D 0; i < sc->info->wdts_num; i++) {
-        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT=
);
-        object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), NUL=
L);
+        object_initialize_child(obj, "wdt[*]", &s->wdt[i], sizeof(s->wdt=
[i]),
+                                TYPE_ASPEED_WDT, &error_abort, NULL);
         qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
         qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
                                     sc->info->silicon_rev);
     }
=20
-    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC10=
0);
-    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), N=
ULL);
+    object_initialize_child(obj, "ftgmac100", &s->ftgmac100,
+                            sizeof(s->ftgmac100), TYPE_FTGMAC100,
+                            &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
 }
=20
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660e8c..0355a41d8b 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -41,8 +41,8 @@ static void bcm2835_peripherals_init(Object *obj)
                        MBOX_CHAN_COUNT << MBOX_AS_CHAN_SHIFT);
=20
     /* Interrupt Controller */
-    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
-    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
+    object_initialize_child(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM28=
35_IC,
+                            &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
=20
     /* UART0 */
@@ -51,21 +51,21 @@ static void bcm2835_peripherals_init(Object *obj)
     qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
=20
     /* AUX / UART1 */
-    object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
-    object_property_add_child(obj, "aux", OBJECT(&s->aux), NULL);
+    object_initialize_child(obj, "aux", &s->aux, sizeof(s->aux),
+                            TYPE_BCM2835_AUX, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->aux), sysbus_get_default());
=20
     /* Mailboxes */
-    object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
-    object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
+    object_initialize_child(obj, "mbox", &s->mboxes, sizeof(s->mboxes),
+                            TYPE_BCM2835_MBOX, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
=20
     object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
                                    OBJECT(&s->mbox_mr), &error_abort);
=20
     /* Framebuffer */
-    object_initialize(&s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
-    object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
+    object_initialize_child(obj, "fb", &s->fb, sizeof(s->fb), TYPE_BCM28=
35_FB,
+                            &error_abort, NULL);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-=
size",
                               &error_abort);
     qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
@@ -74,8 +74,9 @@ static void bcm2835_peripherals_init(Object *obj)
                                    OBJECT(&s->gpu_bus_mr), &error_abort)=
;
=20
     /* Property channel */
-    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_PR=
OPERTY);
-    object_property_add_child(obj, "property", OBJECT(&s->property), NUL=
L);
+    object_initialize_child(obj, "property", &s->property,
+                            sizeof(s->property), TYPE_BCM2835_PROPERTY,
+                            &error_abort, NULL);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
                               "board-rev", &error_abort);
     qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
@@ -86,31 +87,31 @@ static void bcm2835_peripherals_init(Object *obj)
                                    OBJECT(&s->gpu_bus_mr), &error_abort)=
;
=20
     /* Random Number Generator */
-    object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
-    object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
+    object_initialize_child(obj, "rng", &s->rng, sizeof(s->rng),
+                            TYPE_BCM2835_RNG, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
=20
     /* Extended Mass Media Controller */
-    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
-    object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
+    object_initialize_child(obj, "sdhci", &s->sdhci, sizeof(s->sdhci),
+                            TYPE_SYSBUS_SDHCI, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
=20
     /* SDHOST */
-    object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHOST=
);
-    object_property_add_child(obj, "sdhost", OBJECT(&s->sdhost), NULL);
+    object_initialize_child(obj, "sdhost", &s->sdhost, sizeof(s->sdhost)=
,
+                            TYPE_BCM2835_SDHOST, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus_get_default());
=20
     /* DMA Channels */
-    object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
-    object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
+    object_initialize_child(obj, "dma", &s->dma, sizeof(s->dma),
+                            TYPE_BCM2835_DMA, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->dma), sysbus_get_default());
=20
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort)=
;
=20
     /* GPIO */
-    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
-    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
+    object_initialize_child(obj, "gpio", &s->gpio, sizeof(s->gpio),
+                            TYPE_BCM2835_GPIO, &error_abort, NULL);
     qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
=20
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
diff --git a/hw/arm/digic.c b/hw/arm/digic.c
index 726abb9b48..14409ef080 100644
--- a/hw/arm/digic.c
+++ b/hw/arm/digic.c
@@ -35,8 +35,8 @@ static void digic_init(Object *obj)
     DeviceState *dev;
     int i;
=20
-    object_initialize(&s->cpu, sizeof(s->cpu), "arm946-" TYPE_ARM_CPU);
-    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
+    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
+                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL);
=20
     for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
 #define DIGIC_TIMER_NAME_MLEN    11
--=20
2.20.1

