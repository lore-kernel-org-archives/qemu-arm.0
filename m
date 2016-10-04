Received: by 10.80.163.71 with SMTP id 65csp2380852edn;
        Tue, 4 Oct 2016 16:28:38 -0700 (PDT)
X-Received: by 10.237.57.136 with SMTP id m8mr6367250qte.12.1475623718774;
        Tue, 04 Oct 2016 16:28:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k71si4120599qkh.230.2016.10.04.16.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 16:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brZ8Y-0006mS-7Y
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 19:28:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZ8S-0006mM-RC
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1brZ8P-00054F-FF
	for qemu-arm@nongnu.org; Tue, 04 Oct 2016 19:28:32 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1brZ8N-00050G-2E; Tue, 04 Oct 2016 19:28:29 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9EBE221007;
	Tue,  4 Oct 2016 19:28:12 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute7.internal (MEProxy); Tue, 04 Oct 2016 19:28:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=OFKay
	OaKFpGFLp1ws7elZPT8g5g=; b=ZvP1HH4UHfycYgydPUQVeAaePkKWeFttyUmiJ
	itHwzWmNAJb3vrBcZ2WsMZ+tFWbWO9KT3YeXGA4BdeWunGr//uSmitzT1cRx/HOY
	mv2iNnFZ65kk7ypv601H9mgI6CiCFyqWYwqFHRk0Em10UjsMtNl+bbnANJwMxtWn
	kQMN+g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=OFKayOaKFpGFLp1ws7elZPT8g5g=; b=fFW1E
	qQj1//c7J2s6l73lPP8nEBg8Suqf9I5yDEkKUF3TjOzoTsSdcKtuh7hl+RiEh+Xm
	c7VGqJtsWTVzCEjASNPZ4kdzAZs2P3PA5USf9BdLIopgdcDKUZDLz6jlallAs2fn
	Vv/KKsdIQ19HvfWZrp1Umx8sZ2zLMNo5ampMNo=
X-Sasl-enc: nHI6dRErWxNGjgSMmmyJbiNhluM634NhPPDkCsOiw9/J 1475623691
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3C880CC07D;
	Tue,  4 Oct 2016 19:28:09 -0400 (EDT)
Message-ID: <1475623683.5030.2.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Peter Maydell
	<peter.maydell@linaro.org>, Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 05 Oct 2016 09:58:03 +1030
In-Reply-To: <1474977462-28032-2-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
	<1474977462-28032-2-git-send-email-clg@kaod.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-FWU17nx+BqY2j2bH6dQK"
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.28
Subject: Re: [Qemu-arm] [PATCH 1/6] aspeed: rename the smc object to fmc
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
X-TUID: hIdi33LzIHiQ


--=-FWU17nx+BqY2j2bH6dQK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-09-27 at 13:57 +0200, C=C3=A9dric Le Goater wrote:
> The Aspeed SoC has three different types of SMC (Static Memory
> Controller) controllers: the SMC (legacy), the FMC (the new one) and
> the SPI for the host PNOR. The FMC and the SPI models are now
> converging on the AST2500 SoC and the SMC, which was still available
> on the AST2400 SoC, was removed.
>=20
> The Aspeed SoC does not provide support for the legacy SMC
> controller. So, let's rename the 'smc' object to 'fmc' to clarify its
> nature.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

> ---
> =C2=A0hw/arm/aspeed.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A02 +-
> =C2=A0hw/arm/aspeed_soc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 18 +++++++++---------
> =C2=A0include/hw/arm/aspeed_soc.h |=C2=A0=C2=A02 +-
> =C2=A03 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6b18c7f1727c..4bb33cbb5e70 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -128,7 +128,7 @@ static void aspeed_board_init(MachineState *machine,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_const_link(OBJECT(&bmc-=
>soc), "ram", OBJECT(&bmc->ram),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&error=
_abort);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init_flashes(&bmc->soc.smc, "n25q25=
6a", &error_abort);
> +=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init_flashes(&bmc->soc.fmc, "n25q25=
6a", &error_abort);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_init_flashes(&bmc->soc.spi, "m=
x25l25635e", &error_abort);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aspeed_board_binfo.kernel_filename =3D mach=
ine->kernel_filename;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index c0a310205842..479c0d2039d9 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -100,9 +100,9 @@ static void aspeed_soc_init(Object *obj)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_alias(obj, "hw-strap2",=
 OBJECT(&s->scu),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"hw-strap2", &error_abort);
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->smc, sizeof(s->smc), "aspe=
ed.smc.fmc");
> -=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "smc", OBJECT(&s-=
>smc), NULL);
> -=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_=
default());
> +=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->fmc, sizeof(s->fmc), "aspe=
ed.smc.fmc");
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "fmc", OBJECT(&s-=
>fmc), NULL);
> +=C2=A0=C2=A0=C2=A0=C2=A0qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_=
default());
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_initialize(&s->spi, sizeof(s->spi), =
"aspeed.smc.spi");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0object_property_add_child(obj, "spi", OBJEC=
T(&s->spi), NULL);
> @@ -178,17 +178,17 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c),=
 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qde=
v_get_gpio_in(DEVICE(&s->vic), 12));
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0/* SMC */
> -=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->smc), 1, "num=
-cs", &err);
> -=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->smc), true, =
"realized", &local_err);
> +=C2=A0=C2=A0=C2=A0=C2=A0/* FMC */
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_int(OBJECT(&s->fmc), 1, "num=
-cs", &err);
> +=C2=A0=C2=A0=C2=A0=C2=A0object_property_set_bool(OBJECT(&s->fmc), true, =
"realized", &local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(&err, local_err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0error_propagate(err=
p, err);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> -=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, ASPE=
ED_SOC_FMC_BASE);
> -=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, ASPE=
ED_SOC_FMC_FLASH_BASE);
> -=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, ASPE=
ED_SOC_FMC_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1, ASPE=
ED_SOC_FMC_FLASH_BASE);
> +=C2=A0=C2=A0=C2=A0=C2=A0sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qde=
v_get_gpio_in(DEVICE(&s->vic), 19));
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* SPI */
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index 932704c380f2..7359e25fce49 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -31,7 +31,7 @@ typedef struct AspeedSoCState {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedTimerCtrlState timerctrl;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedI2CState i2c;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSCUState scu;
> -=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState smc;
> +=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState fmc;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSMCState spi;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0AspeedSDMCState sdmc;
> =C2=A0} AspeedSoCState;
--=-FWU17nx+BqY2j2bH6dQK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX9DsDAAoJEJ0dnzgO5LT5hU4P/14nycDSptUk4kY/mCek+TqM
+WX8xSsjbYxI5ScRGPZzb6+iFEH5WTd/L4hE58y8c2r5uNXU4xa1K916fqNK8r9t
e/gzNTPfvirfH4x22t0aB3IPYuVEFCvLPid0MfqZO5am9xiufJRlH4MTnu+mPn0E
4dXsCqKBfACVnms4nx3UCW7cMTK1Verz4lVBi66J6QaDI4K5bas80OdXtZ7nTd0p
VHFEKKc7NONTHDwRl4qeec4mpU9SfDN0B180ZxGrnN+QJ1bXlpz/Ei99zYrC+8G0
YDMnYw3B0vpqdIA+ql7WlViO2UrENpjsSvURYjRyUbI24YcCU78OtsnSX1UCvqhW
bsBrpeU3mYPQ5YTfUwoGOGUOn+8Jwvo7E9YNC4MzDLp/BgcRy7gDPUNgSysmFXnY
b2IPZSyVfA+rUdoOl0e4PnehvXGEni/p2ZlZgF8y3wgxBp/zr9e2Rh31JZbolhdb
tW5/ff5Qzp02SnFsy2eOsqRWDeXzV1QEyRuMT3YKJjuWy4A9u814V6ohL96lIZR0
EvD4730zViBRidsjb0fgRp3PO5P0Igu1xVMza/vn3DXIztwywQDZigNvoX4MoV/k
jOrwo8BIZPsixx8YfDQj1ZyOKjoprPwC7KVLfc0BIQsU/ZwV1/R9p86n77f7OafB
qxpvGw6WPHq4IRwArXVz
=22RJ
-----END PGP SIGNATURE-----

--=-FWU17nx+BqY2j2bH6dQK--

