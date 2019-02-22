Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6546341wrx;
        Thu, 21 Feb 2019 21:08:40 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaNK3vqL+uRm2JUx54dWdHBk/phmmTpJeYt8nmkeZ4eSe3gIUuBAxOYib+U/6lBetXYQwUf
X-Received: by 2002:a25:e482:: with SMTP id b124mr1844093ybh.257.1550812120082;
        Thu, 21 Feb 2019 21:08:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550812120; cv=none;
        d=google.com; s=arc-20160816;
        b=txcHC2zpR0rScPu7BVdHDo8O+ywtqGTPScmpJxq6nA/tNilFLxQ98gOuni2hjuV5mQ
         36V8S0Z+SaNLtvR0QICYtjVMR3BkaPzmjwWmkXgr4XkR5kIwgyLDfhU2IeGMRe96Ku7g
         m0QJ3hX6ngizP8M5gskw9bnFq73Es5JdcpAgWu/KSaXwtWFUOLhdACEitnmtYk4B/btE
         V8COWtJhdeD9excrqM6JWdz1gAxt8DMysSmHm6sUgnfqLQGT2e4fNYetJGdyKYhLQYCW
         eYP/WE4IOh939pSReoUvVV9eV1f1iuuhWsA5Kzmm6mpsuDHshaQuVnruYrOrvqWHufoe
         oeUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=oeq691T87QI5yZy206oCdQIPCNlpAd65gtwaRQDwXfw=;
        b=P7ujdU+hH0eRSUi43xM3iXL4K//8ztOWPfcubScfrnRkGIkgZ6Bp1KH+0mWLI0Czm+
         xzW4ePyj6sp6DaLZHRC9ThXESJk9u5aOvgeG5wxp03gF61k1ZCbA6HzPjkyqc0nKv313
         vRud/HwLIzvPVbw7dNA5+JVsW7rL/UiOJVJu5fd+S8ZPGHhKBL3ShTU4ReWNUq1H8YDZ
         SPJifTu2tFvq62I7wk23UuzosdVofRVV3N08ko3nITsDFX+cSeFXcVMg8IAkxxPMz/hg
         f3sWBgy6qkrOmjy2rKlVkJZkMDfIVZ5Ajq6iiuv4hFyL70vrHjmIchCri/gg6/1xXbAg
         swvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v21si255609ywc.207.2019.02.21.21.08.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 21:08:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gx34h-0008Np-Gf
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 00:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gx34X-0008Lc-Cx
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 00:08:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gx34V-0006Yr-75
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 00:08:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gx34U-0006DW-TA; Fri, 22 Feb 2019 00:08:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1F3DC065F7B;
	Fri, 22 Feb 2019 05:08:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-51.ams2.redhat.com [10.36.116.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C2F160BE6;
	Fri, 22 Feb 2019 05:08:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20190221183829.31019-1-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <c49607a1-e8aa-3c93-8447-48db7e5bc0b5@redhat.com>
Date: Fri, 22 Feb 2019 06:08:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190221183829.31019-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 22 Feb 2019 05:08:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm: Use object_initialize_child for
 correct reference counting
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Tr/+6jJFUPhP

On 21/02/2019 19.38, Philippe Mathieu-Daud=C3=A9 wrote:
> As Thomas Huth explained:
> "Both functions, object_initialize() and object_property_add_child()
> increase the reference counter of the new object, so one of the
> references has to be dropped afterwards to get the reference counting
> right. Otherwise the child object will not be properly cleaned up
> when the parent gets destroyed.
> Thus let's use now object_initialize_child() instead to get the
> reference counting here right."
>=20
> This patch was generated using the following Coccinelle script:
>=20
>  @use_object_initialize_child@
>  identifier parent_obj;
>  expression child;
>  expression propname;
>  expression child_type;
>  expression errp;
>  @@
>  (
>  -    object_initialize(&child, sizeof(child), child_type);
>  -    object_property_add_child(parent_obj, propname, OBJECT(&child), N=
ULL);
>  +    object_initialize_child(parent_obj, propname,  &child, sizeof(chi=
ld),
>  +                            child_type, &error_abort, NULL);
>  |
>  -    object_initialize(&child, sizeof(child), child_type);
>  -    object_property_add_child(parent_obj, propname, OBJECT(&child), e=
rrp);
>  +    object_initialize_child(parent_obj, propname,  &child, sizeof(chi=
ld),
>  +                            child_type, errp, NULL);
>  )
>=20
> and a bit of manual fix-up for overly long lines.
>=20
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Inspired-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/aspeed_soc.c          | 43 ++++++++++++++++++------------------
>  hw/arm/bcm2835_peripherals.c | 41 +++++++++++++++++-----------------
>  hw/arm/digic.c               |  4 ++--
>  3 files changed, 45 insertions(+), 43 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index a27233d487..81665f2948 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -106,11 +106,11 @@ static void aspeed_soc_init(Object *obj)
>      AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
>      int i;
> =20
> -    object_initialize(&s->cpu, sizeof(s->cpu), sc->info->cpu_type);
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            sc->info->cpu_type, &error_abort, NULL);
> =20
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
> -    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
> +    object_initialize_child(obj, "scu", &s->scu, sizeof(s->scu),
> +                            TYPE_ASPEED_SCU, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
>      qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
>                           sc->info->silicon_rev);
> @@ -121,35 +121,35 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
>                                "hw-prot-key", &error_abort);
> =20
> -    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
> -    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
> +    object_initialize_child(obj, "vic", &s->vic, sizeof(s->vic),
> +                            TYPE_ASPEED_VIC, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
> =20
> -    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED=
_TIMER);
> -    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl),=
 NULL);
> +    object_initialize_child(obj, "timerctrl", &s->timerctrl,
> +                            sizeof(s->timerctrl), TYPE_ASPEED_TIMER,
> +                            &error_abort, NULL);
>      object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
>                                     OBJECT(&s->scu), &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
> =20
> -    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
> -    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
> +    object_initialize_child(obj, "i2c", &s->i2c, sizeof(s->i2c),
> +                            TYPE_ASPEED_I2C, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
> =20
> -    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename)=
;
> -    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
> +    object_initialize_child(obj, "fmc", &s->fmc, sizeof(s->fmc),
> +                            sc->info->fmc_typename, &error_abort, NULL=
);
>      qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
>      object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs"=
,
>                                &error_abort);
> =20
>      for (i =3D 0; i < sc->info->spis_num; i++) {
> -        object_initialize(&s->spi[i], sizeof(s->spi[i]),
> -                          sc->info->spi_typename[i]);
> -        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), N=
ULL);
> +        object_initialize_child(obj, "spi[*]", &s->spi[i], sizeof(s->s=
pi[i]),
> +                                sc->info->spi_typename[i], &error_abor=
t, NULL);
>          qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
>      }
> =20
> -    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
> -    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
> +    object_initialize_child(obj, "sdmc", &s->sdmc, sizeof(s->sdmc),
> +                            TYPE_ASPEED_SDMC, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
>      qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
>                           sc->info->silicon_rev);
> @@ -159,15 +159,16 @@ static void aspeed_soc_init(Object *obj)
>                                "max-ram-size", &error_abort);
> =20
>      for (i =3D 0; i < sc->info->wdts_num; i++) {
> -        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_W=
DT);
> -        object_property_add_child(obj, "wdt[*]", OBJECT(&s->wdt[i]), N=
ULL);
> +        object_initialize_child(obj, "wdt[*]", &s->wdt[i], sizeof(s->w=
dt[i]),
> +                                TYPE_ASPEED_WDT, &error_abort, NULL);
>          qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
>          qdev_prop_set_uint32(DEVICE(&s->wdt[i]), "silicon-rev",
>                                      sc->info->silicon_rev);
>      }
> =20
> -    object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC=
100);
> -    object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100),=
 NULL);
> +    object_initialize_child(obj, "ftgmac100", &s->ftgmac100,
> +                            sizeof(s->ftgmac100), TYPE_FTGMAC100,
> +                            &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->ftgmac100), sysbus_get_default());
>  }
> =20
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.=
c
> index 6be7660e8c..0355a41d8b 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -41,8 +41,8 @@ static void bcm2835_peripherals_init(Object *obj)
>                         MBOX_CHAN_COUNT << MBOX_AS_CHAN_SHIFT);
> =20
>      /* Interrupt Controller */
> -    object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
> -    object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
> +    object_initialize_child(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM=
2835_IC,
> +                            &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
> =20
>      /* UART0 */
> @@ -51,21 +51,21 @@ static void bcm2835_peripherals_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
> =20
>      /* AUX / UART1 */
> -    object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
> -    object_property_add_child(obj, "aux", OBJECT(&s->aux), NULL);
> +    object_initialize_child(obj, "aux", &s->aux, sizeof(s->aux),
> +                            TYPE_BCM2835_AUX, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->aux), sysbus_get_default());
> =20
>      /* Mailboxes */
> -    object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX=
);
> -    object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
> +    object_initialize_child(obj, "mbox", &s->mboxes, sizeof(s->mboxes)=
,
> +                            TYPE_BCM2835_MBOX, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
> =20
>      object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
>                                     OBJECT(&s->mbox_mr), &error_abort);
> =20
>      /* Framebuffer */
> -    object_initialize(&s->fb, sizeof(s->fb), TYPE_BCM2835_FB);
> -    object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
> +    object_initialize_child(obj, "fb", &s->fb, sizeof(s->fb), TYPE_BCM=
2835_FB,
> +                            &error_abort, NULL);
>      object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcra=
m-size",
>                                &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
> @@ -74,8 +74,9 @@ static void bcm2835_peripherals_init(Object *obj)
>                                     OBJECT(&s->gpu_bus_mr), &error_abor=
t);
> =20
>      /* Property channel */
> -    object_initialize(&s->property, sizeof(s->property), TYPE_BCM2835_=
PROPERTY);
> -    object_property_add_child(obj, "property", OBJECT(&s->property), N=
ULL);
> +    object_initialize_child(obj, "property", &s->property,
> +                            sizeof(s->property), TYPE_BCM2835_PROPERTY=
,
> +                            &error_abort, NULL);
>      object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
>                                "board-rev", &error_abort);
>      qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
> @@ -86,31 +87,31 @@ static void bcm2835_peripherals_init(Object *obj)
>                                     OBJECT(&s->gpu_bus_mr), &error_abor=
t);
> =20
>      /* Random Number Generator */
> -    object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
> -    object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
> +    object_initialize_child(obj, "rng", &s->rng, sizeof(s->rng),
> +                            TYPE_BCM2835_RNG, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
> =20
>      /* Extended Mass Media Controller */
> -    object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
> -    object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
> +    object_initialize_child(obj, "sdhci", &s->sdhci, sizeof(s->sdhci),
> +                            TYPE_SYSBUS_SDHCI, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
> =20
>      /* SDHOST */
> -    object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHO=
ST);
> -    object_property_add_child(obj, "sdhost", OBJECT(&s->sdhost), NULL)=
;
> +    object_initialize_child(obj, "sdhost", &s->sdhost, sizeof(s->sdhos=
t),
> +                            TYPE_BCM2835_SDHOST, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus_get_default());
> =20
>      /* DMA Channels */
> -    object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
> -    object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
> +    object_initialize_child(obj, "dma", &s->dma, sizeof(s->dma),
> +                            TYPE_BCM2835_DMA, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->dma), sysbus_get_default());
> =20
>      object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
>                                     OBJECT(&s->gpu_bus_mr), &error_abor=
t);
> =20
>      /* GPIO */
> -    object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
> -    object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
> +    object_initialize_child(obj, "gpio", &s->gpio, sizeof(s->gpio),
> +                            TYPE_BCM2835_GPIO, &error_abort, NULL);
>      qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
> =20
>      object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",

Ack so far.

> diff --git a/hw/arm/digic.c b/hw/arm/digic.c
> index 726abb9b48..14409ef080 100644
> --- a/hw/arm/digic.c
> +++ b/hw/arm/digic.c
> @@ -35,8 +35,8 @@ static void digic_init(Object *obj)
>      DeviceState *dev;
>      int i;
> =20
> -    object_initialize(&s->cpu, sizeof(s->cpu), "arm946-" TYPE_ARM_CPU)=
;
> -    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), NULL);
> +    object_initialize_child(obj, "cpu", &s->cpu, sizeof(s->cpu),
> +                            "arm946-" TYPE_ARM_CPU, &error_abort, NULL=
);
> =20
>      for (i =3D 0; i < DIGIC4_NB_TIMERS; i++) {
>  #define DIGIC_TIMER_NAME_MLEN    11
>=20

I think digic_init() needs some more manual tweaking. You can see two
more instances of object_initialize() + add_child() later in that
function, just with some code in between. That either needs to be
re-arranged a little bit, or we should add an object_unref() each time
at the end there.

Also there is one more spot in xlnx_zynqmp_create_rpu() in xlnx-zynqmp.c
that should also be fixed, I think.

Eduardo also listed the machine init functions last year:

 https://patchwork.ozlabs.org/patch/943333/#1953608

Do we want to fix them, too? I think it's currently not really necessary
there since we don't clean up machines anyway, but maybe it would still
be a good idea to avoid that people copy-n-paste bad code snippets...
Well, maybe something for a separate patch, at least.

 Thomas
