Received: by 10.80.163.71 with SMTP id 65csp2382994edn;
        Tue, 4 Oct 2016 16:35:19 -0700 (PDT)
X-Received: by 10.237.46.6 with SMTP id j6mr6226880qtd.10.1475624119782;
        Tue, 04 Oct 2016 16:35:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h142si4116205qke.319.2016.10.04.16.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 16:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brZF1-0001Rv-8Z
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 19:35:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZEw-0001Rm-B0
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZEs-0006iW-0W
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:35:13 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40221)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1brZEp-0006d4-Mk; Tue, 04 Oct 2016 19:35:09 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id A025E2102A;
	Tue,  4 Oct 2016 19:35:00 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Tue, 04 Oct 2016 19:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=0dSCl
	j/HMh6OLMijMzFsuQFbbY4=; b=Ckfd910fOh5YQ/CKs1DLdtpY/8l0Sw0qTeqv9
	OUaRInRdvhEs9IVVwBmhi3IkcZvntF7zTHOh52RiMeEVm34DOoxER2xkVaQvnu+M
	ySz5aL4wVDbYEpI0oGJozmAEK4ILrqdlkM8SF/qYaELoEnIuc2rxd2xiW7MikHMs
	gBmS5o=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=0dSClj/HMh6OLMijMzFsuQFbbY4=; b=LsqxW
	BdrFfF/IZYaBoV4d9tp3rA+BMe8FasymvifeVnZrwRvnxlXjk/DUUgZqrLbl4KXS
	oWmNFiuA59KPj/5q4APQbwweWqglnwTgiTpL5vXWrJZSp9U/WbYEESJIIavFD14g
	pPNlmoctipdUC0bq91IlaeSghrlXMRtY14A9WM=
X-Sasl-enc: wTUgtYtvXFQQNAQ3GfI8oTjYK9IwrRYAIdzAnvc5ac2/ 1475624099
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4A90BF29D1;
	Tue,  4 Oct 2016 19:34:58 -0400 (EDT)
Message-ID: <1475624094.5030.6.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 05 Oct 2016 10:04:54 +1030
In-Reply-To: <1474977462-28032-5-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-5-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TLDd4gr71aknsLNv61eb"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH 4/6] aspeed: add support for the AST2500 SoC
 SMC controllers
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
X-TUID: CzCG2lf6xfWm


--=-TLDd4gr71aknsLNv61eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-09-27 at 13:57 +0200, C=C3=A9dric Le Goater wrote:
> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
> ones found on the AST2400. The differences are on the number of
> supported flash modules and their default mappings in the SoC address
> space.
>=20
> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
> for the host firmware. All controllers have now the same set of
> registers compatible with the AST2400 FMC controller and the legacy
> 'SMC' controller is fully gone.
>=20
> We keep the FMC object to act as the BMC SPI controller and add a new
> SPI controller for the host. We also have to introduce new type names
> to handle the differences in the flash modules memory mappping.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 21 +++++++++++++++------
> =C2=A0hw/ssi/aspeed_smc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 28 +++++++++++++++++++++++++++-
> =C2=A0include/hw/arm/aspeed_soc.h |=C2=A0=C2=A02 ++
> =C2=A03 files changed, 44 insertions(+), 7 deletions(-)
>=20
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index b3103f337374..e14f5c217eab 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -25,6 +25,7 @@
> =C2=A0#define ASPEED_SOC_IOMEM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E600000
> =C2=A0#define ASPEED_SOC_FMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E620000
> =C2=A0#define ASPEED_SOC_SPI_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E630000
> +#define ASPEED_SOC_SPI2_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A00x1E631000
> =C2=A0#define ASPEED_SOC_VIC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E6C0000
> =C2=A0#define ASPEED_SOC_SDMC_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A00x1E6E0000
> =C2=A0#define ASPEED_SOC_SCU_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A00x1E6E2000
> @@ -38,16 +39,23 @@ static const int timer_irqs[] =3D { 16, 17, 18, 35, 3=
6, 37, 38, 39, };
> =C2=A0#define AST2500_SDRAM_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A00x80000000
> =C2=A0
> =C2=A0static const hwaddr aspeed_soc_ast2400_spi_bases[] =3D { ASPEED_SOC=
_SPI_BASE };
> +static const char *aspeed_soc_ast2400_typenames[] =3D { "aspeed.smc.spi"=
 };
> =C2=A0
> -static const hwaddr aspeed_soc_ast2500_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE };
> +static const hwaddr aspeed_soc_ast2500_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SPI2_BASE};
> +static const char *aspeed_soc_ast2500_typenames[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0"aspeed.smc.ast2500-spi1", "aspeed.smc.ast2500-s=
pi2" };
> =C2=A0
> =C2=A0static const AspeedSoCInfo aspeed_socs[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ast2400-a0", "arm926", AST2400_A0_SILICO=
N_REV, AST2400_SDRAM_BASE,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01, aspeed_soc_ast2400_spi_bases },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01, aspeed_soc_ast2400_spi_bases,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed.smc.fmc", aspeed_soc_ast2400=
_typenames },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ast2400",=C2=A0=C2=A0=C2=A0=C2=A0"arm926=
", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01, aspeed_soc_ast2400_spi_bases },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01, aspeed_soc_ast2400_spi_bases,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed.smc.fmc", aspeed_soc_ast2400_typen=
ames },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "ast2500-a1", "arm1176", AST2500_A1_SILIC=
ON_REV, AST2500_SDRAM_BASE,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01, aspeed_soc_ast2500_spi_bases },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02, aspeed_soc_ast2500_spi_bases,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"aspeed.smc.ast2500-fmc", aspeed_soc=
_ast2500_typenames },
> =C2=A0};
> =C2=A0
> =C2=A0/*
> @@ -105,12 +113,13 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_alias(obj, "hw-strap2",=
 OBJECT(&s->scu),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"hw-strap2", &error_abort);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->fmc, sizeof(s->fmc), "aspe=
ed.smc.fmc");
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->fmc, sizeof(s->fmc), sc->i=
nfo->fmc_typename);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "fmc", OBJEC=
T(&s->fmc), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->fmc), sysbus=
_get_default());
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < sc->info->spis_num; i++) =
{
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->sp=
i[i], sizeof(s->spi[i]), "aspeed.smc.spi");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->sp=
i[i], sizeof(s->spi[i]),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0sc->info->spi_typename[i]);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add=
_child(obj, "spi", OBJECT(&s->spi[i]), NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus=
(DEVICE(&s->spi[i]), sysbus_get_default());
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 84c18299de11..21943f4e5dfa 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -130,6 +130,7 @@
> =C2=A0#define ASPEED_SOC_SMC_FLASH_BASE=C2=A0=C2=A0=C2=A00x10000000
> =C2=A0#define ASPEED_SOC_FMC_FLASH_BASE=C2=A0=C2=A0=C2=A00x20000000
> =C2=A0#define ASPEED_SOC_SPI_FLASH_BASE=C2=A0=C2=A0=C2=A00x30000000
> +#define ASPEED_SOC_SPI2_FLASH_BASE=C2=A0=C2=A00x38000000
> =C2=A0
> =C2=A0/*
> =C2=A0 * Default segments mapping addresses and size for each slave per
> @@ -142,7 +143,7 @@ static const AspeedSegments aspeed_segments_legacy[] =
=3D {
> =C2=A0};
> =C2=A0
> =C2=A0static const AspeedSegments aspeed_segments_fmc[] =3D {
> -=C2=A0=C2=A0=C2=A0=C2=A0{ 0x20000000, 64 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x20000000, 64 * 1024 * 1024 }, /* start addre=
ss is readonly */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 0x24000000, 32 * 1024 * 1024 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 0x26000000, 32 * 1024 * 1024 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 0x28000000, 32 * 1024 * 1024 },
> @@ -153,6 +154,22 @@ static const AspeedSegments aspeed_segments_spi[] =
=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ 0x30000000, 64 * 1024 * 1024 },
> =C2=A0};
> =C2=A0
> +static const AspeedSegments aspeed_segments_ast2500_fmc[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x20000000, 128 * 1024 * 1024 }, /* start addr=
ess is readonly */
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x28000000,=C2=A0=C2=A032 * 1024 * 1024 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x2A000000,=C2=A0=C2=A032 * 1024 * 1024 },
> +};
> +
> +static const AspeedSegments aspeed_segments_ast2500_spi1[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x30000000, 32 * 1024 * 1024 }, /* start addre=
ss is readonly */
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x32000000, 96 * 1024 * 1024 }, /* end address=
 is readonly */
> +};
> +
> +static const AspeedSegments aspeed_segments_ast2500_spi2[] =3D {
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x38000000, 32 * 1024 * 1024 }, /* start addre=
ss is readonly */
> +=C2=A0=C2=A0=C2=A0=C2=A0{ 0x3A000000, 96 * 1024 * 1024 }, /* end address=
 is readonly */
> +};
> +
> =C2=A0static const AspeedSMCController controllers[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CT=
RL0, R_TIMINGS,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 5, aspeed_segme=
nts_legacy,
> @@ -163,6 +180,15 @@ static const AspeedSMCController controllers[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI=
_CTRL0, R_SPI_TIMINGS,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SPI_CONF_ENABLE_W0, 1, aspeed_s=
egments_spi,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SPI_FLASH_BASE, 0x10=
000000 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.ast2500-fmc", R_CONF, R_CE_CTRL, R=
_CTRL0, R_TIMINGS,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 3, aspeed_segments_a=
st2500_fmc,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_FMC_FLASH_BASE, 0x1000000=
0 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.ast2500-spi1", R_CONF, R_CE_CTRL, =
R_CTRL0, R_TIMINGS,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 2, aspeed_segments_a=
st2500_spi1,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SPI_FLASH_BASE, 0x8000000=
 },
> +=C2=A0=C2=A0=C2=A0=C2=A0{ "aspeed.smc.ast2500-spi2", R_CONF, R_CE_CTRL, =
R_CTRL0, R_TIMINGS,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CONF_ENABLE_W0, 2, aspeed_segments_a=
st2500_spi2,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ASPEED_SOC_SPI2_FLASH_BASE, 0x800000=
0 },
> =C2=A0};
> =C2=A0
> =C2=A0static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr =
addr,
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index f26a9f043983..5406b498d7ef 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -48,6 +48,8 @@ typedef struct AspeedSoCInfo {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hwaddr sdram_base;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int spis_num;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0const hwaddr *spi_bases;
> +=C2=A0=C2=A0=C2=A0=C2=A0const char *fmc_typename;
> +=C2=A0=C2=A0=C2=A0=C2=A0const char **spi_typename;
> =C2=A0} AspeedSoCInfo;
> =C2=A0
> =C2=A0typedef struct AspeedSoCClass {
--=-TLDd4gr71aknsLNv61eb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9DyeAAoJEJ0dnzgO5LT5VXcP/jiALV+/0TAsMqWE8fHUqBHA
tm4NOFzWWPP2VGeb/8acxVTgJ9iwBQoZj+/Ie1QkvVV8SpkUNT2u3Sgzlz+9L5n2
flh45zguscssTreknY2kXWm8q6tbOJvJ6udCGcIuddJrZANsL+v9QiCEPLd7QbYu
DeMktFER8prm2T7uYQb4n78eg4YL9KImdnwHBtZ1oaaGFfaAKZUSI+DYbC72CxD0
+5PndW/7URAceVyojrY8u2S0Pkguaq0q1ZxosG2VjM1O0qjEjECdfQS2NaoCt8Q0
LRFXC2zGDhfHXJhBOohGhQFPJKNgBpGEtwdokF+kFf31MfiapCfnNSXyTGPbFqzN
AcXGKX4bRiwm98Xon44UanG9l49ggN3PgTgUTxAF9Cd+SA02ehZbQvcaoQAgefzg
eaf+H8TnGToQqpjguzoO+qYqk16RuqTH0UlP/2pOUTwtwOK9Iugi2Gd/Pg0ia+yT
49wWTV1jnse9HCXUu4F55zM1Y8dksOlygNV1OC1P7oZafjj26IEyh3PCG2Qnl/cN
EffZARfttrz5/JCWCeydPWF1SsX7dvMwZ4mb1lD7nwACrnx9r0dWI4iUthCK8ncG
Ln96kyewCz3zUS0FRegXKutYvpw5U9SYr+QuiL/b5l826Ul4X0rNgkP4633wHvIZ
zrcFUpoJb1W6mhw8AAoS
=MeCZ
-----END PGP SIGNATURE-----

--=-TLDd4gr71aknsLNv61eb--

