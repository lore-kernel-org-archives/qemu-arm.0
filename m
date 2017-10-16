Received: by 10.223.197.9 with SMTP id q9csp3033466wrf;
        Sun, 15 Oct 2017 18:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QWwHlN2uYpVjiAcyqWW1yWkH/aDBWnEYQ6u34nmZBB/mIsN2Jzwr8ZtWgwwM6I06U5unGH
X-Received: by 10.55.184.71 with SMTP id i68mr363167qkf.150.1508118960843;
        Sun, 15 Oct 2017 18:56:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508118960; cv=none;
        d=google.com; s=arc-20160816;
        b=GDoNFzCgAEKgytveAJYRzOFDnSpZEKjXbUXF7XlnnOVJwIWwZjF5ujkacOsGrVCYai
         8FxxZmAO/IuScepV9FufpcEfPOLbHUS2MIG/UGDfN5U5N7s2rTLo+BH9dDj2CBahb22m
         Nz1/DiJ5PfeEiovQXITpRgBOpdWQ9tFQAcyMYCDH0PcCsIGfRv8OLVeBV2EwnWV77PUA
         0+P5GKs2Gz2L2Ao7kIyhfXu1yfGAGhkB15nfnSYcRzDCZbO98LYc7Lt7LOd6we9YiFpM
         OqgV2JHKsYgM7uLmpLYmgd5Yw4QVZDHcOteX5vBDmNYKAenTiO3njJSy9pfGIotdl6h/
         7m8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=DhRVsTSkKKD/zRDMPK6RpaEv74015Co2zq+TFim4Pns=;
        b=1KBDsqPtnyuUIS0uGA+t4FIRlbCFAj6O/Q+vs7fbvn4u1PaTvr+LXR0PM9khfQku0t
         M0V6xJkjBw6D738dfe3fO4HlpZRd4Q8Jw22mUldj0/N4wLP8Oixi9t6AlHQCJvst/Qq3
         ooSguMEt23R0oYIjG3uVNziJBD7SwiZiO8OteAS2PXY9OvPjxFeKvORgrC/g3ftdIS53
         RWrBCHhI/9jJToZUkzomFxREXxqooHcU1IJr72woOPNgZyi5awexMks2jPOtKLoiZ2ck
         W7Mxa7OnzegMqr1rrJlc0Rn6I8SNbT2Mgur1nMT8JmwHw0PVIdlcIK+aS6uA/5Dtd9ky
         ZY9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=ikJcggjo;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ruRc2BY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p71si3047465qki.414.2017.10.15.18.56.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Oct 2017 18:56:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.s=fm1 header.b=ikJcggjo;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=ruRc2BY+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58948 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e3udK-0006Iz-JW
	for alex.bennee@linaro.org; Sun, 15 Oct 2017 21:55:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35084)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e3ud5-0006H5-7u
	for qemu-arm@nongnu.org; Sun, 15 Oct 2017 21:55:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1e3ud0-0006nw-P5
	for qemu-arm@nongnu.org; Sun, 15 Oct 2017 21:55:43 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:58429)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1e3ud0-0006mi-HH; Sun, 15 Oct 2017 21:55:38 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8A84320881;
	Sun, 15 Oct 2017 21:55:36 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Sun, 15 Oct 2017 21:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=DhRVsTSkKKD/zRDMPK6RpaEv74015Co2zq+TFim4Pns=; b=ikJcggjo
	QJ8dvNbprScNpwt9RpH2Uho14zNOjCb2A2EXSuICR31ojUphPg3VsNFbfk3DSiuN
	+FXCqlm5/JCvGPOrNrWc5gtMehDAAlFKc85jNHQneWVkKL907pOIjenp+jalZbzt
	B1BrHNtPzoT/dJCDAHax7N0yH6PpWDyidhkF0euUytp9THSgQXPAFcB3IPAurvy9
	RVlVUWT9mmU6PCj0V5ZNEA1xq6tSWuaGmh/8BntwczHEqBwvP1LCaT3HlYmEQV7W
	ErnhhwpCaMzV2q0KN0j+oy6L7WeXS/PD5X+5zrf/LLDJRK/uv9AhbF0qYGSIgYwe
	8VamaDI9rqfVSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=DhRVsTSkKKD/zRDMPK6RpaEv74015
	Co2zq+TFim4Pns=; b=ruRc2BY+aftJOPqYBcMyuM1LUfiizZY8hubB94KHc3Cnz
	eCGgkLAO0S9phnlH5Sz8OPQWGVvzfmmlE4Zd4n5P71JToIUWzQm37K5lxJGdOMCj
	/DF7dRCyUcux/Zd6q/mhmr1Cc4i3QrUnGlI6ALUZHwJhogWtFtJ5PpCJ2rxQ0rOx
	xKxjOYF3IpYkGHK9nSieGAa1eJWMgpB+X1XIadpiYJzKR21OgQdv4uVO+IrivssW
	o1YNBm1CXLY594CdCJS5tm9ftIPStDGJWxC5Kvbs84ZEtROVFD2VFgQKmP+RHNLA
	X+doT6L0Mgsf/qybRBemYbbDuKca3rkZos0WmIl0A==
X-ME-Sender: <xms:mBHkWb4GpmdzMsw7sWSPY3l_ObN9FOPlgmWXc68TIGvgV7sl-zVVxg>
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id CDAEE24135;
	Sun, 15 Oct 2017 21:55:33 -0400 (EDT)
Message-ID: <1508118927.24322.0.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>
Date: Mon, 16 Oct 2017 12:25:27 +1030
In-Reply-To: <ca6255bb-64f8-10bf-1e1f-a693ae38f4c3@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<1507507449.5452.147.camel@aj.id.au>
	<48144f71-c876-0e89-f01e-cbfe87687aee@kaod.org>
	<1507693785.5452.175.camel@aj.id.au>
	<ca6255bb-64f8-10bf-1e1f-a693ae38f4c3@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZAn+KUcnrehn6Q1D5hz2"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
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
X-TUID: yI2e5xiGU2PF


--=-ZAn+KUcnrehn6Q1D5hz2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-10-11 at 09:28 +0200, C=C3=A9dric Le Goater wrote:
> On 10/11/2017 05:49 AM, Andrew Jeffery wrote:
> > On Tue, 2017-10-10 at 15:30 +0200, C=C3=A9dric Le Goater wrote:
> > > On 10/09/2017 02:04 AM, Andrew Jeffery wrote:
> > > > On Wed, 2017-09-20 at 09:01 +0200, C=C3=A9dric Le Goater wrote:
> > > > > The Witherspoon boards are OpenPOWER system hosting POWER9 Proces=
sors.
> > > > > Let's add support for their BMC including a couple of I2C devices=
 as
> > > > > found on real HW.
> > > > > =C2=A0
> > > > > > > > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > > > >=20
> > > > > ---
> > > > > =C2=A0hw/arm/aspeed.c | 49 ++++++++++++++++++++++++++++++++++++++=
+++++++++++
> > > > > =C2=A01 file changed, 49 insertions(+)
> > > > > =C2=A0
> > > > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > > > index ab895ad490af..81f522f711ae 100644
> > > > > --- a/hw/arm/aspeed.c
> > > > > +++ b/hw/arm/aspeed.c
> > > > > @@ -46,6 +46,7 @@ enum {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PALMETTO_BMC,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AST2500_EVB,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ROMULUS_BMC,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0WITHERSPOON_BMC,
> > > > > =C2=A0};
> > > > > =C2=A0
> > > > > =C2=A0/* Palmetto hardware value: 0x120CE416 */
> > > > > @@ -83,8 +84,12 @@ enum {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_AST2500=
_HW_STRAP_ACPI_ENABLE |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0\
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0SCU_HW_STRA=
P_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
> > > > > =C2=A0
> > > > > +/* Witherspoon hardware value: 0xF10AD216 (but use romulus defin=
ition) */
> > > > > +#define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
> > > > > +
> > > > > =C2=A0static void palmetto_bmc_i2c_init(AspeedBoardState *bmc);
> > > > > =C2=A0static void ast2500_evb_i2c_init(AspeedBoardState *bmc);
> > > > > +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc);
> > > > > =C2=A0
> > > > > =C2=A0static const AspeedBoardConfig aspeed_boards[] =3D {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0[PALMETTO_BMC] =3D {
> > > > > @@ -110,6 +115,14 @@ static const AspeedBoardConfig aspeed_boards=
[] =3D {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =
=3D "mx66l1g45g",
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=
=A0=C2=A0=C2=A0=C2=A0=3D 2,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0[WITHERSPOON_BMC]=C2=A0=C2=A0=3D {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.soc_name=C2=A0=
=C2=A0=3D "ast2500-a1",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.hw_strap1 =3D W=
ITHERSPOON_BMC_HW_STRAP1,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.fmc_model =3D "=
mx25l25635e",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.spi_model =3D "=
mx66l1g45g",
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.num_cs=C2=A0=C2=
=A0=C2=A0=C2=A0=3D 2,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.i2c_init=C2=A0=
=C2=A0=3D witherspoon_bmc_i2c_init,
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0},
> > > > > =C2=A0};
> > > > > =C2=A0
> > > > > =C2=A0#define FIRMWARE_ADDR 0x0
> > > > > @@ -337,11 +350,47 @@ static const TypeInfo romulus_bmc_type =3D =
{
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.class_init =3D romulus_bmc_class_i=
nit,
> > > > > =C2=A0};
> > > > > =C2=A0
> > > > > +static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
> > > > > +{
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSoCState *soc =3D &bmc->soc;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVI=
CE(&soc->i2c), 4), "tmp423", 0x4c);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVI=
CE(&soc->i2c), 5), "tmp423", 0x4c);
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0i2c_create_slave(aspeed_i2c_get_bus(DEVI=
CE(&soc->i2c), 9), "tmp105", 0x4a);
> > > >=20
> > > > Looks like I need to track down newer versions of the schematics I =
have.
> > >=20
> > > the device on the board is a tmp275 but the tmp105 model is compatibl=
e.
> >=20
> > It neither device is listed in the version I have :)
>=20
> Here is my source :
>=20
> 	https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-=
bmc-opp-witherspoon.dts#L504
>=20

Yeah, I ended up jumping on a machine and verifying the device was on
the bus.

Cheers,

Andrew
--=-ZAn+KUcnrehn6Q1D5hz2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZ5BGQAAoJEJ0dnzgO5LT5k2IQAK9f1PgBuIXxAzhL+yoYQ/8+
TE8/Jhe/5/1LDPrM3qFz6h5ZX93ptYlCKX/TW/mByPZaE9sEFtXjx58i6hJ2EBGV
xAOGV/lG866gQjPRa6c3WtbjhQCOoj9A/poH0znOFcLYD2wzLb4ylveILiMOxpXE
tqZJCbTfqH/EgjUUK7O9b5A7n/sUmsA556GZoKxR34Acv6yUqvh5uRtHmLtcMDe/
KhP4KdzL98jZWyXg/O16OyaxxKBVNkYQXua50Bocd7T2FV+oxRj+i3FfSBavDCJk
+IBatULPtePXR9xUHkBpOLMecS4D5c1iqG1A4MQn5p/g3wNf0iTcNKMfA+PpIGk9
Yt0w26W6LGKVUTntFyGYnRA5u3q+r9zZC1zUAD/9orRp3WsJ8FmUG+SnY9tXpvvr
pB44UhONVjocKwRZNa2kURz3tAlo4on36/spSe7nvivVTl/57OJO83RD+i6fUKJX
Pn6fCkwJMtMlZPo9Bq7UjJCMhwTnqpE+TenGMRB8FCdReL4XhP6zkIuyIwfYg5IJ
/wz4UCj/cRycW+jEObuEOrKVRnV1bIUe3YuqEY0AAApcYdRbIKR2QkV3rhr4+qVv
iJNOC1/u9Yd2uLEM2Cmt2oBfUhkxn3VOMlYv9ORHU//dCx3iKObzgeWo0xK32iht
dJKLhnkFdpXWuTo4geAJ
=PFRy
-----END PGP SIGNATURE-----

--=-ZAn+KUcnrehn6Q1D5hz2--

