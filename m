Received: by 10.223.197.9 with SMTP id q9csp193929wrf;
        Tue, 10 Oct 2017 20:50:08 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBRVWoqGhbUHfqM2PYDuf11Pcg1u7FeyHrwIp9/UN3dlCkP94544Sm9/SsJ86ejTpOZQnUy
X-Received: by 10.200.43.146 with SMTP id m18mr13926100qtm.99.1507693808854;
        Tue, 10 Oct 2017 20:50:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507693808; cv=none;
        d=google.com; s=arc-20160816;
        b=CedpcjsRjT2sD6r9vuLppOOiK4MHQT3Q1f0kkpeeuzZJv1Cpdq7nMMAXksdBoGbiza
         ywInVTvkcPA81PwrmoRH44XK+G5r9nU0BT0L7QVHud6GnmYERV3fUrhy2k/y8ElJmR7l
         SaQz2ewWp+6G5DfDW9XbKKoFHnIRiJw3IMJ7buFtmWB7DJgfH91NdECIF+BUD+DFHH+2
         jObsT3Opg9dSejD3szskui43rLjhJrE4PM97sptArVm+SNhrvGeexOozpFn90UqDawlv
         U1LMtpi106DiOKd5dxylKK+L0xnXPByj7b3gzwpB/kUHiN0RPhLkdyUNm+i28BQaCoeH
         b6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=5jqggpbg/tKsFRlKgrkIza8SYfW8NSKkpNGYNXGcc1g=;
        b=y1hRnoMvAacfT9fZVEKVujzD3RYImd8NMyPS/PwNCp+38DjIjp2L37cRse+sSV8KXe
         V+3px141dB6cHxSf8uHh87ooszTdCQl3zFIIeWX8fpIGoQU75tHwzhp0ELawYEHUpt+u
         dhCGMTXFFKms8RoKh3x52LNsqIFgI7kHlIrc6/3V32TFZUyt0WVG9jqYEUcsRAdMpVuQ
         ptCX1djKghATc/mE2T2B7WJJIRJRhVbsoL+8vU/gmmSfae2AeyKiZgfXTmPsR0CYIDeV
         ABYFS4nhNuQA1TKuu/z/hrSXUoYlZ5bDc2W5rJj1/BqQEDElhN+TVIxsbe2Z/wXAcwTP
         hSNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=SKsHiLKa;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dIv1yyk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z51si80972qtj.412.2017.10.10.20.50.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 20:50:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=SKsHiLKa;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=dIv1yyk8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2822-0004li-JN
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 23:50:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e281t-0004lY-33
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 23:49:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e281p-0007bt-Pb
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 23:49:57 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52917)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e281p-0007ZA-Bs; Tue, 10 Oct 2017 23:49:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E329120C1F;
	Tue, 10 Oct 2017 23:49:50 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Tue, 10 Oct 2017 23:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=5jqggpbg/tKsFRlKgrkIza8SYfW8NSKkpNGYNXGcc1g=; b=SKsHiLKa
	CsDTXeSkrWRPRTMXqqFYuH/kVw5fLt45kT4dBSm20Vmizy7TffhG6xqS7vfronvf
	2riCxH4HBEkCVPo/GL8KLzs2KJkQNwkhGHvWrMp+oEVnFUGtLqdAqajdIN3pfTik
	WEFY9WV4oPR5V1JbByZDrmUWJHQLyyYnzY6P2xdHWpu25fIsh21S74F1cunUN4tW
	FvlLdrwuPZiPbvAsibUQzqLEs19bMqwPMNttpzsa5FUALEbKptEyAJZw2NrSMV9d
	+4lfInhZS+j66n3ygNBRTLjJhS4AS9DowQKTn5gsTYT5Hbz1rODRtvMbQUXpd/Ga
	bQsvIph+u0OWvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=5jqggpbg/tKsFRlKgrkIza8SYfW8N
	SKkpNGYNXGcc1g=; b=dIv1yyk8oZLHAcYSFy5gT7STG4MhKCYJVbrSVfR9t1EY8
	+46xNdnopi7mmeEj0T2JKaGs9Cw3HHDagt/YP538P8jY7fAiV5giaoOAKc79NJUX
	J6DT9vZvc/CrFiSP5+J/qg8wdsIbd4j+t+Fpx3oAfywm4Gg+RM3gTd6S7807d/+6
	UW9cnlOdzAvJaDWj8WI4IT65SR7raKT3EVmjraCPkBkAnB/glYtWTyEYQkPpRYMO
	IYVaF4BbwO5H1mF16yldHnPNczYYhjmWtyOEsj23HGeMUXRyIxRvk3EV5Z8H1uYQ
	x+utOiIGXcm/Ycjf3Ot2+hr5QHtrmEQ6/k+DJwkMg==
X-ME-Sender: <xms:3pTdWaACHV9RMe4MktmoiqVuAkHIzvZzXaUnswWZAcVOVXUUW4G5Ag>
Received: from keelia23 (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 308927E69D;
	Tue, 10 Oct 2017 23:49:47 -0400 (EDT)
Message-ID: <1507693785.5452.175.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Wed, 11 Oct 2017 14:19:45 +1030
In-Reply-To: <48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<1507507449.5452.147.camel@aj.id.au>
	<48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GQfEwtRaPYaNTDX4TOmI"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
Cc: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y7ffaSKkDEZW


--=-GQfEwtRaPYaNTDX4TOmI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2017-10-10 at 15:30 +0200, C=C3=A9dric Le Goater wrote:
> On 10/09/2017 02:04 AM, Andrew Jeffery wrote:
> > On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> > > The Witherspoon boards are OpenPOWER system hosting POWER9 Processors=
.
> > > Let's add support for their BMC including a couple of I2C devices as
> > > found on real HW.
> > > =C2=A0
> > > > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > ---
> > > =C2=A0hw/arm/aspeed.c | 49 ++++++++++++++++++++++++++++++++++++++++++=
+++++++
> > > =C2=A01 file changed, 49 insertions(+)
> > > =C2=A0
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > index ab895ad490af..81f522f711ae 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -46,6 +46,7 @@ enum {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EVB,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ROMULUS_BMC,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0WITHERSPOON_BMC,
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0/* Palmetto hardware value: 0x120CE416 */
> > > @@ -83,8 +84,12 @@ enum {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_AST2500_HW_=
STRAP_ACPI_ENABLE |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_HW_STRAP_SP=
I_MODE(SCU_HW_STRAP_SPI_MASTER))
> > > =C2=A0
> > > +/* Witherspoon hardware value: 0xF10AD216 (but use romulus definitio=
n) */
> > > +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> > > +
> > > =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> > > =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> > > +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> > > =C2=A0
> > > =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
> > > @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards[] =
=3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D =
"mx66l1g45g",
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=
=C2=A0=C2=A0=C2=A0=3D 2,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> > > +=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=C2=
=A0=3D "ast2500-a1",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D WITHE=
RSPOON_BMC_HW_STRAP1,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "mx25=
l25635e",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "mx66=
l1g45g",
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=A0=
=C2=A0=C2=A0=3D 2,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=C2=
=A0=3D witherspoon_bmc_i2c_init,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0},
> > > =C2=A0};
> > > =C2=A0
> > > =C2=A0#define FIRMWARE_ADDR 0x0
> > > @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D romulus_bmc_class_init,
> > > =C2=A0};
> > > =C2=A0
> > > +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&=
soc->i2c), 4), "tmp423", 0x4c);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&=
soc->i2c), 5), "tmp423", 0x4c);
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&=
soc->i2c), 9), "tmp105", 0x4a);
> >=20
> > Looks like I need to track down newer versions of the schematics I have=
.
>=20
> the device on the board is a tmp275 but the tmp105 model is compatible.

It neither device is listed in the version I have :)

Andrew
--=-GQfEwtRaPYaNTDX4TOmI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ3ZTZAAoJEJ0dnzgO5LT56qQP/1+xsFeE5zIZrR7vbMYs5AdR
aMYXE57yOJ3NGEa0X9TowSfUCvD0yMYI6+svBPnVS4meJGyhrcqgLvfYrX0f4GWA
/BycMTznMmKI41E44OSBg2ThfK8kPdfJUD92pwblUcXcEFiypBjq/D0Ny7DGZa4q
KHCTh3lWxduaVlrxRJ9woLygw6XSkjeop/+3HuD5rOQWTAqx34oN+RsbHv4BvhDI
665Vozk6Hro95/WjOf5x2arXQmsP54KgvvzLD6srIy3H75XYidxKzG06lgfhmfeH
Xzihmb9myD6qC+d/n54YFZeTPQYqYtse6YUTbnfOxkW+TK8MxvSuqmIPS+HEFXMW
niQDixEXUnWWf7Lf+32OOw7QVL8sRAtvTbY0NSCQYXh/2bDXPVfRWH7+GJTGsMbo
HEufePODvKWN9bLc4iRd514J4v4ce9VRZ4xmo06fe5SQQx5JcTqkd1nO8IwBWfsQ
RmFLQgmIkY9C6o2FayLCD1ewCihGPCGw111eC7+T0Hruu/qos3ByVZlcB8yM/Uwt
Lee45W9GZJhk/kowFsbgemQc/v8smOS8UB2+dPr6VLGcv8wLi6j/Rmx0N15n7pkU
HA/xwuWkHyKeOgxA5d6Iy3iMdsEiluOhD7d55izfaFrD/OjJxxXiDcHBcpN3CgF6
mtOPiJd2aIu0O6+n6+my
=l1LG
-----END PGP SIGNATURE-----

--=-GQfEwtRaPYaNTDX4TOmI--

