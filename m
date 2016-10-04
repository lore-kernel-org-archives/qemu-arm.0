Received: by 10.80.163.71 with SMTP id 65csp2381712edn;
        Tue, 4 Oct 2016 16:31:21 -0700 (PDT)
X-Received: by 10.200.55.113 with SMTP id p46mr6391636qtb.96.1475623881334;
        Tue, 04 Oct 2016 16:31:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r21si3535236qta.62.2016.10.04.16.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 16:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brZBA-0007rS-RQ
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 19:31:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZB5-0007rB-QD
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZB1-0005mv-Gm
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:31:14 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1brZAz-0005iu-6S; Tue, 04 Oct 2016 19:31:11 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 70E08207CD;
	Tue,  4 Oct 2016 19:30:57 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 04 Oct 2016 19:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=VMUCU
	w3oBZlMBt3U1jofFUuvvMk=; b=JPInfw4/5Ik0wp5jAv4PxZ2r/fbRM3OQBZMdj
	puZe9ZOKTyA5sK2xWfEutlsPKXvsKxbDozMMdHYMXdVyFkgOghihN3Xe9vAdVyaU
	vfYOywTtgF7Ib2A5viGYFd4F3OG0vJN1rjCMPgdgmX40jJg45e4gpX23kahYhv2v
	SSYlQU=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=VMUCUw3oBZlMBt3U1jofFUuvvMk=; b=CEpJ4
	79tN0WHs/2lkTnBapB5pCDa12y9fYNU1CukgDL3pNefhIvOBoF218cyjrUAnGzlQ
	M+v2gYILOgdrOndayBIZoiV3sL3m41l8dFaaQSLmY9nOEVmn3RnEyGfOv5dop0r3
	nZaPN2FlxFbxI6l+Yh8VaTYf90PBWV3qKd9do8=
X-Sasl-enc: WmxM8vjgd1JYMw3UYJqxyRp/HJY/T7l1vHvobHcbxxEl 1475623856
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 01C7ACC081;
	Tue,  4 Oct 2016 19:30:54 -0400 (EDT)
Message-ID: <1475623851.5030.4.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 05 Oct 2016 10:00:51 +1030
In-Reply-To: <1474977462-28032-3-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-3-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fpPiR20wOGB3ancybN3Y"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH 2/6] aspeed: move the flash module mapping
 address under the controller definition
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CJ8pgN3jK4T8


--=-fpPiR20wOGB3ancybN3Y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-09-27 at 13:57 +0200, C=C3=A9dric Le Goater wrote:
> This will ease the definition of the new controllers for the AST2500
> SoC and also ease the support of the segment registers, which provide
> a way to reconfigure the mapping window of each slave.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A09 ++++-----
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 15 +++++++++++----
> =C2=A0include/hw/ssi/aspeed_smc.h |=C2=A0=C2=A03 ++-
> =C2=A03 files changed, 17 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 479c0d2039d9..80ad7322bde2 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -31,9 +31,6 @@
> =C2=A0#define ASPEED_SOC_TIMER_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E782000
> =C2=A0#define ASPEED_SOC_I2C_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E78A000
> =C2=A0
> -#define ASPEED_SOC_FMC_FLASH_BASE=C2=A0=C2=A0=C2=A00x20000000
> -#define ASPEED_SOC_SPI_FLASH_BASE=C2=A0=C2=A0=C2=A00x30000000
> -
> =C2=A0static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
> =C2=A0static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39,=
 };
> =C2=A0
> @@ -187,7 +184,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0,=
 ASPEED_SOC_FMC_BASE);
> -=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1, ASPE=
ED_SOC_FMC_FLASH_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->fmc.ctrl->flash_window_b=
ase);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc),=
 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qde=
v_get_gpio_in(DEVICE(&s->vic), 19));
> =C2=A0
> @@ -200,7 +198,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0,=
 ASPEED_SOC_SPI_BASE);
> -=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, ASPE=
ED_SOC_SPI_FLASH_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->spi.ctrl->flash_window_b=
ase);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* SDMC - SDRAM Memory Controller */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->sdmc), =
true, "realized", &err);
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index d319e04a27f0..84c18299de11 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -127,6 +127,10 @@
> =C2=A0#define R_SPI_MISC_CTRL=C2=A0=C2=A0=C2=A0(0x10 / 4)
> =C2=A0#define R_SPI_TIMINGS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(0x14 / 4)
> =C2=A0
> +#define ASPEED_SOC_SMC_FLASH_BASE=C2=A0=C2=A0=C2=A00x10000000
> +#define ASPEED_SOC_FMC_FLASH_BASE=C2=A0=C2=A0=C2=A00x20000000
> +#define ASPEED_SOC_SPI_FLASH_BASE=C2=A0=C2=A0=C2=A00x30000000
> +
> =C2=A0/*
> =C2=A0 * Default segments mapping addresses and size for each slave per
> =C2=A0 * controller. These can be changed when board is initialized with =
the
> @@ -151,11 +155,14 @@ static const AspeedSegments aspeed_segments_spi[] =
=3D {
> =C2=A0
> =C2=A0static const AspeedSMCController controllers[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CT=
RL0, R_TIMINGS,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 5, aspeed_segments_l=
egacy, 0x6000000 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 5, aspeed_segments_l=
egacy,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SMC_FLASH_BASE, 0x6000000=
 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CT=
RL0, R_TIMINGS,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 5, aspeed_segments_f=
mc, 0x10000000 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 5, aspeed_segments_f=
mc,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_FMC_FLASH_BASE, 0x1000000=
0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI=
_CTRL0, R_SPI_TIMINGS,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SPI_CONF_ENABLE_W0, 1, aspeed_segmen=
ts_spi, 0x10000000 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SPI_CONF_ENABLE_W0, 1, aspeed_segmen=
ts_spi,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SPI_FLASH_BASE, 0x1000000=
0 },
> =C2=A0};
> =C2=A0
> =C2=A0static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr =
addr,
> @@ -395,7 +402,7 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0memory_region_init_io(&s->mmio_flash, OBJEC=
T(s),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0&aspeed_smc_flash_default_ops, s, name,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0s->ctrl->mapping_window_size);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0s->ctrl->flash_window_size);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_init_mmio(sbd, &s->mmio_flash);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0s->flashes =3D g_new0(AspeedSMCFlash, s->nu=
m_cs);
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index def3b4507e75..bdfbcc0ffa7d 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -42,7 +42,8 @@ typedef struct AspeedSMCController {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t conf_enable_w0;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0uint8_t max_slaves;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const AspeedSegments *segments;
> -=C2=A0=C2=A0=C2=A0=C2=A0uint32_t mapping_window_size;
> +=C2=A0=C2=A0=C2=A0=C2=A0hwaddr flash_window_base;
> +=C2=A0=C2=A0=C2=A0=C2=A0uint32_t flash_window_size;
> =C2=A0} AspeedSMCController;
> =C2=A0
> =C2=A0typedef struct AspeedSMCFlash {
--=-fpPiR20wOGB3ancybN3Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9DurAAoJEJ0dnzgO5LT5FnYP+QHKJNdwTrdmRkoZYGyJqAA7
NauJvdSQsoG31nY+cDkfcHNt96LNcZzR/swbLEd8OQaFdfy330XNNWvM9Ls6vaRN
r+ttpJFXSko1sX+CGb4yxrh99OZG7SAEyTmy0KxL8E/8TCPs8BNd2oaQwI2aQVIH
xd0KZyZoZPfD8kmYu6es+xE1cpi9AxG88nlgVJ9KTYWwWoStwH+YFJEOW+W9i13f
oftX/RI8pDLgX7qXVByrDNmrTlNIVN34bmXK8LfZ45CERHoRp3zqTH0VaqKK+LK/
y8/n7YNdTCPAFGltyvI+FVySsl43LJyspWFukTaK5DswPxeUlIslhskR2DHr8dTo
bDye7NNdtF56HM21Arv8cwXf0Br9F1rhnnvjoRE+j93UbWfhy0PgI5YR1jp2uqVW
WlDz5mHk/07c6nkR5L2AXPdsTwM4tfbAkfiaF0EBr9uX+IhLIT+OaywH9p7vFIg2
jhcrSziwnwWIDUl2cwaAkBG2WSdSQf84HFGddwPhcO0j5pG5fnxhkbCm86Dxw+qL
FCIpzT6lHCixjC5tRokxb5blcYOKW+HSAJw8O5zRxqsc2sWmQ3yxTxa0N4WWuIZh
QyAe5ATroJHbSsTJvbXEiAaml5Q2konDaXkPVStElDv1xnLCg14nV+D3ynKa2p2J
Kt/iNn58soAwiehiT7e5
=3Qn+
-----END PGP SIGNATURE-----

--=-fpPiR20wOGB3ancybN3Y--

